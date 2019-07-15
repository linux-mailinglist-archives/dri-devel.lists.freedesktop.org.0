Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C668393
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 08:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF02C89805;
	Mon, 15 Jul 2019 06:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD6B68981B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 06:33:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B9EBA72167; Mon, 15 Jul 2019 06:33:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111132] Build problem: meson build can not find wayland-scanner
Date: Mon, 15 Jul 2019 06:33:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vbelsare91@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 dependson
Message-ID: <bug-111132-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2140589048=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2140589048==
Content-Type: multipart/alternative; boundary="15631723993.03f8D8D0.6530"
Content-Transfer-Encoding: 7bit


--15631723993.03f8D8D0.6530
Date: Mon, 15 Jul 2019 06:33:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111132

            Bug ID: 111132
           Summary: Build problem: meson build can not find
                    wayland-scanner
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: vbelsare91@gmail.com
                CC: mesa-dev@lists.freedesktop.org, shevegen@gmail.com
        Depends on: 111126

+++ This bug was initially created as a clone of Bug #111126 +++

I am trying to compile mesa 19.1.2 from source.

Meson version is: 0.51.1

Here is the log so far:


Version: 0.51.1
Source dir: /Depot/Temp/rbt/mesa-19.1.2
Build dir: /Depot/Temp/rbt/mesa-19.1.2/BUILD_DIRECTORY
Build type: native build
Program python found: YES (/System/Index/bin/python)
Project name: mesa
Project version: 19.1.2
Appending CFLAGS from environment: '-O2 -fPIC -fno-strict-overflow -Wno-err=
or'
C compiler for the build machine: ccache cc (gcc 9.1.0 "cc (GCC) 9.1.0")
C++ compiler for the build machine: ccache c++ (gcc 9.1.0 "c++ (GCC) 9.1.0")
Appending CFLAGS from environment: '-O2 -fPIC -fno-strict-overflow -Wno-err=
or'
C compiler for the host machine: ccache cc (gcc 9.1.0 "cc (GCC) 9.1.0")
C++ compiler for the host machine: ccache c++ (gcc 9.1.0 "c++ (GCC) 9.1.0")
Build machine cpu family: x86_64
Build machine cpu: x86_64
Program pkg-config found: YES (/System/Index/bin/pkg-config)
Found pkg-config: /System/Index/bin/pkg-config (0.29.2)
Run-time dependency vdpau found: YES 1.2
Run-time dependency xvmc found: YES 1.0.11
Found CMake: /System/Index/bin/cmake (3.14.5)
Run-time dependency libomxil-bellagio found: NO (tried pkgconfig and cmake)
Run-time dependency libtizonia found: NO (tried pkgconfig and cmake)
Run-time dependency libtizplatform found: NO (tried pkgconfig and cmake)
Run-time dependency tizilheaders found: NO (tried pkgconfig and cmake)
Run-time dependency libva found: YES 1.5.0
WARNING: Project targetting '>=3D 0.45' but tried to use feature introduced=
 in
'0.46.0': Python Module
Program python3 found: YES (/System/Index/bin/python3)
Checking for function "bswap32" : YES=20
Checking for function "bswap64" : YES=20
Checking for function "clz" : YES=20
Checking for function "clzll" : YES=20
Checking for function "ctz" : YES=20
Checking for function "expect" : YES=20
Checking for function "ffs" : YES=20
Checking for function "ffsll" : YES=20
Checking for function "popcount" : YES=20
Checking for function "popcountll" : YES=20
Checking for function "unreachable" : YES=20
Checking if "__attribute__((const))" compiles: YES=20
Checking if "__attribute__((flatten))" compiles: YES=20
Checking if "__attribute__((malloc))" compiles: YES=20
Checking if "__attribute__((pure))" compiles: YES=20
Checking if "__attribute__((unused))" compiles: YES=20
Checking if "__attribute__((warn_unused_result))" compiles: YES=20
Checking if "__attribute__((weak))" compiles: YES=20
Checking if "__attribute__((format(...)))" compiles: YES=20
Checking if "__attribute__((packed))" compiles: YES=20
Checking if "__attribute__((returns_nonnull))" compiles: YES=20
Checking if "__attribute__((visibility(...)))" compiles: YES=20
Checking if "__attribute__((alias(...)))" compiles: YES=20
Checking if "__attribute__((__noreturn__))" compiles: YES=20
Compiler for C supports arguments -Werror=3Dimplicit-function-declaration: =
YES=20
Compiler for C supports arguments -Werror=3Dmissing-prototypes: YES=20
Compiler for C supports arguments -Werror=3Dreturn-type: YES=20
Compiler for C supports arguments -Werror=3Dincompatible-pointer-types: YES=
=20
Compiler for C supports arguments -fno-math-errno: YES=20
Compiler for C supports arguments -fno-trapping-math: YES=20
Compiler for C supports arguments -Qunused-arguments: NO=20
Compiler for C supports arguments -Wmissing-field-initializers: YES=20
Compiler for C supports arguments -Wformat-truncation: YES=20
Compiler for C supports arguments -fvisibility=3Dhidden: YES=20
Compiler for C++ supports arguments -Werror=3Dreturn-type: YES=20
Compiler for C++ supports arguments -fno-math-errno: YES=20
Compiler for C++ supports arguments -fno-trapping-math: YES=20
Compiler for C++ supports arguments -Qunused-arguments: NO=20
Compiler for C++ supports arguments -Wnon-virtual-dtor: YES=20
Compiler for C++ supports arguments -Wmissing-field-initializers: YES=20
Compiler for C++ supports arguments -Wformat-truncation: YES=20
Compiler for C supports arguments -Woverride-init: YES=20
Compiler for C supports arguments -Winitializer-overrides: NO=20
Compiler for C++ supports arguments -fvisibility=3Dhidden: YES=20
Compiler for C supports arguments -Werror=3Dpointer-arith: YES=20
Compiler for C++ supports arguments -Werror=3Dpointer-arith: YES=20
Compiler for C supports arguments -Werror=3Dvla: YES=20
Compiler for C++ supports arguments -Werror=3Dvla: YES=20
Checking if "GCC atomic builtins" compiles: YES=20
Checking if "GCC atomic builtins required -latomic" links: YES=20
Checking if "GCC 64bit atomics" with dependency not-found links: YES=20
Header <sys/sysmacros.h> has symbol "major" : YES=20
Checking if "xlocale.h" compiles: NO=20
Checking if "sys/sysctl.h" compiles: YES=20
Checking if "linux/futex.h" compiles: YES=20
Checking if "endian.h" compiles: YES=20
Checking if "dlfcn.h" compiles: YES=20
Checking if "execinfo.h" compiles: YES=20
Checking for function "strtof" : YES=20
Checking for function "mkostemp" : YES=20
Checking for function "posix_memalign" : YES=20
Checking for function "timespec_get" : YES=20
Checking for function "memfd_create" : YES=20
Checking if "strtod has locale support" links: YES=20
Checking if "Bsymbolic" links: YES=20
Checking if "gc-sections" links: YES=20
Checking if "version-script" links: YES=20
Checking if "dynamic-list" links: YES=20
Checking for function "dlopen" : NO=20
Library dl found: YES
Checking for function "dladdr" with dependency -ldl: YES=20
Checking for function "dl_iterate_phdr" : YES=20
Checking for function "clock_gettime" : YES=20
Run-time dependency zlib found: YES 1.2.11
Run-time dependency threads found: YES=20
Checking for function "pthread_setaffinity_np" with dependency threads: YES=
=20
Run-time dependency expat found: YES 2.2.6
Library m found: YES
Message: libdrm 2.4.97 needed because amdgpu has the highest requirement
Run-time dependency libdrm_intel found: YES 2.4.99
Run-time dependency libdrm_amdgpu found: YES 2.4.99
Run-time dependency libdrm_radeon found: YES 2.4.99
Run-time dependency libdrm_nouveau found: YES 2.4.99
Run-time dependency libdrm found: YES 2.4.99
llvm-config found: YES (/System/Index/bin/llvm-config) 8.0.0
Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter,
engine, ipo, mcdisassembler, mcjit, native) found: YES 8.0.0
Run-time dependency libelf found: YES 0.176
Run-time dependency valgrind found: NO (tried pkgconfig)
Program bison found: YES (/System/Index/bin/bison)
Program flex found: YES (/System/Index/bin/flex)
Run-time dependency libunwind found: YES 1.3.1
Found pkg-config: /System/Index/bin/pkg-config (0.29.2)
Found CMake: /System/Index/bin/cmake (3.14.5)
Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

meson.build:1361:2: ERROR: Dependency "wayland-scanner" not found, tried
pkgconfig and cmake

A full log can be found at
/Depot/Temp/rbt/mesa-19.1.2/BUILD_DIRECTORY/meson-logs/meson-log.txt





---------------------------------------------------------------------------=
--

meson can not find wayland scanner, but it is right at
/usr/bin/wayland-scanner.

Additionally all the .pc files of wayland reside at /usr/lib/pkgconfig/.

Note that I have wayland installed via appdir-prefix at
/Programs/Wayland/1.17.0/
and then use symlinks (similar to what the program called stow does).

llvm on the other hand is installed into the prefix /usr/.

I am not sure why the meson build can find cmake and pkg-config without a
problem, but not wayland-scanner.

cmake version is: 3.14.5

Content of wayland-scanner.pc is:

prefix=3D/Programs/Wayland/1.17.0
exec_prefix=3D${prefix}
datarootdir=3D${prefix}/share
pkgdatadir=3D${datarootdir}/wayland
wayland_scanner=3D${exec_prefix}/bin/wayland-scanner

Name: Wayland Scanner
Description: Wayland scanner
Version: 1.17.0

I think there may be something failing but it is not stating why. If
possible it may be useful to have meson report a bit more to the
user in such an event, because "stat /usr/bin/wayland-scanner" works
fine, and the .pc file is there too, so I have no idea why meson
can not find it.


Referenced Bugs:

https://bugs.freedesktop.org/show_bug.cgi?id=3D111126
[Bug 111126] Build problem: meson build can not find wayland-scanner
--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15631723993.03f8D8D0.6530
Date: Mon, 15 Jul 2019 06:33:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Build problem: meson build can not find wayland-scanner"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111132">111132</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Build problem: meson build can not find wayland-scanner
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vbelsare91&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>mesa-dev&#64;lists.freedesktop.org, shevegen&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Depends on</th>
          <td>111126
          </td>
        </tr></table>
      <p>
        <div>
        <pre>+++ This bug was initially created as a clone of <a class=3D"b=
z_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Build problem: meson build can not find wayland-scanner"
   href=3D"show_bug.cgi?id=3D111126">Bug #111126</a> +++

I am trying to compile mesa 19.1.2 from source.

Meson version is: 0.51.1

Here is the log so far:


Version: 0.51.1
Source dir: /Depot/Temp/rbt/mesa-19.1.2
Build dir: /Depot/Temp/rbt/mesa-19.1.2/BUILD_DIRECTORY
Build type: native build
Program python found: YES (/System/Index/bin/python)
Project name: mesa
Project version: 19.1.2
Appending CFLAGS from environment: '-O2 -fPIC -fno-strict-overflow -Wno-err=
or'
C compiler for the build machine: ccache cc (gcc 9.1.0 &quot;cc (GCC) 9.1.0=
&quot;)
C++ compiler for the build machine: ccache c++ (gcc 9.1.0 &quot;c++ (GCC) 9=
.1.0&quot;)
Appending CFLAGS from environment: '-O2 -fPIC -fno-strict-overflow -Wno-err=
or'
C compiler for the host machine: ccache cc (gcc 9.1.0 &quot;cc (GCC) 9.1.0&=
quot;)
C++ compiler for the host machine: ccache c++ (gcc 9.1.0 &quot;c++ (GCC) 9.=
1.0&quot;)
Build machine cpu family: x86_64
Build machine cpu: x86_64
Program pkg-config found: YES (/System/Index/bin/pkg-config)
Found pkg-config: /System/Index/bin/pkg-config (0.29.2)
Run-time dependency vdpau found: YES 1.2
Run-time dependency xvmc found: YES 1.0.11
Found CMake: /System/Index/bin/cmake (3.14.5)
Run-time dependency libomxil-bellagio found: NO (tried pkgconfig and cmake)
Run-time dependency libtizonia found: NO (tried pkgconfig and cmake)
Run-time dependency libtizplatform found: NO (tried pkgconfig and cmake)
Run-time dependency tizilheaders found: NO (tried pkgconfig and cmake)
Run-time dependency libva found: YES 1.5.0
WARNING: Project targetting '&gt;=3D 0.45' but tried to use feature introdu=
ced in
'0.46.0': Python Module
Program python3 found: YES (/System/Index/bin/python3)
Checking for function &quot;bswap32&quot; : YES=20
Checking for function &quot;bswap64&quot; : YES=20
Checking for function &quot;clz&quot; : YES=20
Checking for function &quot;clzll&quot; : YES=20
Checking for function &quot;ctz&quot; : YES=20
Checking for function &quot;expect&quot; : YES=20
Checking for function &quot;ffs&quot; : YES=20
Checking for function &quot;ffsll&quot; : YES=20
Checking for function &quot;popcount&quot; : YES=20
Checking for function &quot;popcountll&quot; : YES=20
Checking for function &quot;unreachable&quot; : YES=20
Checking if &quot;__attribute__((const))&quot; compiles: YES=20
Checking if &quot;__attribute__((flatten))&quot; compiles: YES=20
Checking if &quot;__attribute__((malloc))&quot; compiles: YES=20
Checking if &quot;__attribute__((pure))&quot; compiles: YES=20
Checking if &quot;__attribute__((unused))&quot; compiles: YES=20
Checking if &quot;__attribute__((warn_unused_result))&quot; compiles: YES=20
Checking if &quot;__attribute__((weak))&quot; compiles: YES=20
Checking if &quot;__attribute__((format(...)))&quot; compiles: YES=20
Checking if &quot;__attribute__((packed))&quot; compiles: YES=20
Checking if &quot;__attribute__((returns_nonnull))&quot; compiles: YES=20
Checking if &quot;__attribute__((visibility(...)))&quot; compiles: YES=20
Checking if &quot;__attribute__((alias(...)))&quot; compiles: YES=20
Checking if &quot;__attribute__((__noreturn__))&quot; compiles: YES=20
Compiler for C supports arguments -Werror=3Dimplicit-function-declaration: =
YES=20
Compiler for C supports arguments -Werror=3Dmissing-prototypes: YES=20
Compiler for C supports arguments -Werror=3Dreturn-type: YES=20
Compiler for C supports arguments -Werror=3Dincompatible-pointer-types: YES=
=20
Compiler for C supports arguments -fno-math-errno: YES=20
Compiler for C supports arguments -fno-trapping-math: YES=20
Compiler for C supports arguments -Qunused-arguments: NO=20
Compiler for C supports arguments -Wmissing-field-initializers: YES=20
Compiler for C supports arguments -Wformat-truncation: YES=20
Compiler for C supports arguments -fvisibility=3Dhidden: YES=20
Compiler for C++ supports arguments -Werror=3Dreturn-type: YES=20
Compiler for C++ supports arguments -fno-math-errno: YES=20
Compiler for C++ supports arguments -fno-trapping-math: YES=20
Compiler for C++ supports arguments -Qunused-arguments: NO=20
Compiler for C++ supports arguments -Wnon-virtual-dtor: YES=20
Compiler for C++ supports arguments -Wmissing-field-initializers: YES=20
Compiler for C++ supports arguments -Wformat-truncation: YES=20
Compiler for C supports arguments -Woverride-init: YES=20
Compiler for C supports arguments -Winitializer-overrides: NO=20
Compiler for C++ supports arguments -fvisibility=3Dhidden: YES=20
Compiler for C supports arguments -Werror=3Dpointer-arith: YES=20
Compiler for C++ supports arguments -Werror=3Dpointer-arith: YES=20
Compiler for C supports arguments -Werror=3Dvla: YES=20
Compiler for C++ supports arguments -Werror=3Dvla: YES=20
Checking if &quot;GCC atomic builtins&quot; compiles: YES=20
Checking if &quot;GCC atomic builtins required -latomic&quot; links: YES=20
Checking if &quot;GCC 64bit atomics&quot; with dependency not-found links: =
YES=20
Header &lt;sys/sysmacros.h&gt; has symbol &quot;major&quot; : YES=20
Checking if &quot;xlocale.h&quot; compiles: NO=20
Checking if &quot;sys/sysctl.h&quot; compiles: YES=20
Checking if &quot;linux/futex.h&quot; compiles: YES=20
Checking if &quot;endian.h&quot; compiles: YES=20
Checking if &quot;dlfcn.h&quot; compiles: YES=20
Checking if &quot;execinfo.h&quot; compiles: YES=20
Checking for function &quot;strtof&quot; : YES=20
Checking for function &quot;mkostemp&quot; : YES=20
Checking for function &quot;posix_memalign&quot; : YES=20
Checking for function &quot;timespec_get&quot; : YES=20
Checking for function &quot;memfd_create&quot; : YES=20
Checking if &quot;strtod has locale support&quot; links: YES=20
Checking if &quot;Bsymbolic&quot; links: YES=20
Checking if &quot;gc-sections&quot; links: YES=20
Checking if &quot;version-script&quot; links: YES=20
Checking if &quot;dynamic-list&quot; links: YES=20
Checking for function &quot;dlopen&quot; : NO=20
Library dl found: YES
Checking for function &quot;dladdr&quot; with dependency -ldl: YES=20
Checking for function &quot;dl_iterate_phdr&quot; : YES=20
Checking for function &quot;clock_gettime&quot; : YES=20
Run-time dependency zlib found: YES 1.2.11
Run-time dependency threads found: YES=20
Checking for function &quot;pthread_setaffinity_np&quot; with dependency th=
reads: YES=20
Run-time dependency expat found: YES 2.2.6
Library m found: YES
Message: libdrm 2.4.97 needed because amdgpu has the highest requirement
Run-time dependency libdrm_intel found: YES 2.4.99
Run-time dependency libdrm_amdgpu found: YES 2.4.99
Run-time dependency libdrm_radeon found: YES 2.4.99
Run-time dependency libdrm_nouveau found: YES 2.4.99
Run-time dependency libdrm found: YES 2.4.99
llvm-config found: YES (/System/Index/bin/llvm-config) 8.0.0
Run-time dependency LLVM (modules: amdgpu, asmparser, bitreader, bitwriter,
engine, ipo, mcdisassembler, mcjit, native) found: YES 8.0.0
Run-time dependency libelf found: YES 0.176
Run-time dependency valgrind found: NO (tried pkgconfig)
Program bison found: YES (/System/Index/bin/bison)
Program flex found: YES (/System/Index/bin/flex)
Run-time dependency libunwind found: YES 1.3.1
Found pkg-config: /System/Index/bin/pkg-config (0.29.2)
Found CMake: /System/Index/bin/cmake (3.14.5)
Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

meson.build:1361:2: ERROR: Dependency &quot;wayland-scanner&quot; not found=
, tried
pkgconfig and cmake

A full log can be found at
/Depot/Temp/rbt/mesa-19.1.2/BUILD_DIRECTORY/meson-logs/meson-log.txt





---------------------------------------------------------------------------=
--

meson can not find wayland scanner, but it is right at
/usr/bin/wayland-scanner.

Additionally all the .pc files of wayland reside at /usr/lib/pkgconfig/.

Note that I have wayland installed via appdir-prefix at
/Programs/Wayland/1.17.0/
and then use symlinks (similar to what the program called stow does).

llvm on the other hand is installed into the prefix /usr/.

I am not sure why the meson build can find cmake and pkg-config without a
problem, but not wayland-scanner.

cmake version is: 3.14.5

Content of wayland-scanner.pc is:

prefix=3D/Programs/Wayland/1.17.0
exec_prefix=3D${prefix}
datarootdir=3D${prefix}/share
pkgdatadir=3D${datarootdir}/wayland
wayland_scanner=3D${exec_prefix}/bin/wayland-scanner

Name: Wayland Scanner
Description: Wayland scanner
Version: 1.17.0

I think there may be something failing but it is not stating why. If
possible it may be useful to have meson report a bit more to the
user in such an event, because &quot;stat /usr/bin/wayland-scanner&quot; wo=
rks
fine, and the .pc file is there too, so I have no idea why meson
can not find it.</pre>
        </div>
      </p>

        <div id=3D"referenced">
          <hr style=3D"border: 1px dashed #969696">
          <b>Referenced Bugs:</b>
          <ul>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Build problem: meson build can not find wayland-scanner"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111126">Bug 11112=
6</a>] Build problem: meson build can not find wayland-scanner
              </li>
          </ul>
        </div>
        <br>

      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15631723993.03f8D8D0.6530--

--===============2140589048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2140589048==--
