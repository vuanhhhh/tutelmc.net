@ECHO OFF

:: When setting the memory below make sure to include the amount of ram letter. M = MB, G = GB. Don't use 1GB for example, it's 1G

:: This is the max memory
set maxmemory=2G

:: The path to the Java to use. Wrap in double quotes ("C:\Path\To\Java\bin\java"). Use "java" to point to system default install.
set javapath="java"

:: Any additional arguments to pass to Java such as Metaspace, GC or anything else
set jvmargs=""

:: Don't edit past this point ::

set launchargs=%*
:: Launcher can specify path to java using a custom token
IF "%1"=="ATLcustomjava" (
    for /f "tokens=2,* delims= " %%a in ("%*") do set launchargs=%%b

    echo "Using launcher provided Java from %2"
    SET javapath="%2"
)

:: Remove double quotes from the javapath since we quote it beflow
for /f "delims=" %%A in ('echo %%javapath%%') do set javapath=%%~A

echo.
echo Printing Java info below, if the Java version doesn't show below, your Java path is incorrect
echo Java path is %javapath%
echo.

echo Launching minecraft_server.1.21.jar with '%maxmemory%' max memory, jvm args '%jvmargs%' and arguments '%launchargs%'

:: add nogui to the end of this line to disable the gui
"%javapath%" -Xmx%maxmemory% %jvm_args%   -jar minecraft_server.1.21.jar %launchargs%
PAUSE

