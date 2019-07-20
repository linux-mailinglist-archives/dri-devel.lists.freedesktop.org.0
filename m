Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915086F102
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 01:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0E89CF3;
	Sat, 20 Jul 2019 23:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F55189CF3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 23:37:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 850C772167; Sat, 20 Jul 2019 23:37:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Sat, 20 Jul 2019 23:37:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: roland@rptd.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-IaS8WA2ROc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0258930448=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0258930448==
Content-Type: multipart/alternative; boundary="15636658520.c1fb0D7e.21482"
Content-Transfer-Encoding: 7bit


--15636658520.c1fb0D7e.21482
Date: Sat, 20 Jul 2019 23:37:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #11 from roland@rptd.ch <roland@rptd.ch> ---
Unfortunately it does not compile like this:

FAILED: src/amd/common/2a96a08@@amd_common@sta/ac_nir_to_llvm.c.o=20
cc -Isrc/amd/common/2a96a08@@amd_common@sta -Isrc/amd/common
-I../src/amd/common -Isrc/../include -I../src/../include -Isrc -I../src
-Isrc/mapi -I../src/mapi -Isrc/mesa -I../src/mesa -I../src/gallium/include
-Isrc/gallium/auxiliary -I../src/gallium/auxiliary -Isrc/compiler
-I../src/compiler -Isrc/amd -I../src/amd -Isrc/compiler/nir
-I../src/compiler/nir -I/usr/lib64/llvm/7/include -I/usr/include/libdrm
-fdiagnostics-color=3Dalways -DNDEBUG -pipe -D_FILE_OFFSET_BITS=3D64 -std=
=3Dc99
'-DVERSION=3D"18.0.0-rc2"' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa"'
-DGLX_USE_TLS -DHAVE_X11_PLATFORM -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DHAVE_DRM_PLATFORM
-DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
-DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
-DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
-DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
-DHAVE___BUILTIN_UNREACHABLE -DHAVE_FUNC_ATTRIBUTE_CONST
-DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
-DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
-DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
-DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_VISIBILITY
-DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
-DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREATE -DHAVE_STRTOD=
_L
-DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_ZLIB -DHAVE_PTHRE=
AD
-DHAVE_LLVM=3D0x0710 -DMESA_LLVM_VERSION_PATCH=3D0 -DHAVE_WAYLAND_PLATFORM
-DWL_HIDE_DEPRECATED -DHAVE_DRI3 -DHAVE_LIBSENSORS=3D1 -Wall
-Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes
-fno-math-errno -fno-trapping-math -fPIC -pthread -D__STDC_LIMIT_MACROS
-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS
-fvisibility=3Dhidden -MD -MQ
'src/amd/common/2a96a08@@amd_common@sta/ac_nir_to_llvm.c.o' -MF
'src/amd/common/2a96a08@@amd_common@sta/ac_nir_to_llvm.c.o.d' -o
'src/amd/common/2a96a08@@amd_common@sta/ac_nir_to_llvm.c.o' -c
../src/amd/common/ac_nir_to_llvm.c
../src/amd/common/ac_nir_to_llvm.c: In function =E2=80=98ac_llvm_finalize_m=
odule=E2=80=99:
../src/amd/common/ac_nir_to_llvm.c:6614:2: error: implicit declaration of
function =E2=80=98LLVMAddPromoteMemoryToRegisterPass=E2=80=99; did you mean
=E2=80=98LLVMAddDemoteMemoryToRegisterPass=E2=80=99? [-Werror=3Dimplicit-fu=
nction-declaration]
  LLVMAddPromoteMemoryToRegisterPass(passmgr);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  LLVMAddDemoteMemoryToRegisterPass
cc1: some warnings being treated as errors
[425/1549] Compiling C object
'src/mesa/bbe4a73@@mesa_gallium@sta/main_format_utils.c.o'.
ninja: build stopped: subcommand failed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15636658520.c1fb0D7e.21482
Date: Sat, 20 Jul 2019 23:37:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roland&#64;rptd.ch" title=3D"roland&#64;rptd.ch &lt;roland&#64;rptd.ch&gt;"=
> <span class=3D"fn">roland&#64;rptd.ch</span></a>
</span></b>
        <pre>Unfortunately it does not compile like this:

FAILED: src/amd/common/2a96a08&#64;&#64;amd_common&#64;sta/ac_nir_to_llvm.c=
.o=20
cc -Isrc/amd/common/2a96a08&#64;&#64;amd_common&#64;sta -Isrc/amd/common
-I../src/amd/common -Isrc/../include -I../src/../include -Isrc -I../src
-Isrc/mapi -I../src/mapi -Isrc/mesa -I../src/mesa -I../src/gallium/include
-Isrc/gallium/auxiliary -I../src/gallium/auxiliary -Isrc/compiler
-I../src/compiler -Isrc/amd -I../src/amd -Isrc/compiler/nir
-I../src/compiler/nir -I/usr/lib64/llvm/7/include -I/usr/include/libdrm
-fdiagnostics-color=3Dalways -DNDEBUG -pipe -D_FILE_OFFSET_BITS=3D64 -std=
=3Dc99
'-DVERSION=3D&quot;18.0.0-rc2&quot;' -DPACKAGE_VERSION=3DVERSION
'-DPACKAGE_BUGREPORT=3D&quot;<a href=3D"https://bugs.freedesktop.org/enter_=
bug.cgi?product=3DMesa">https://bugs.freedesktop.org/enter_bug.cgi?product=
=3DMesa</a>&quot;'
-DGLX_USE_TLS -DHAVE_X11_PLATFORM -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DHAVE_DRM_PLATFORM
-DHAVE_SURFACELESS_PLATFORM -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
-DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
-DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
-DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
-DHAVE___BUILTIN_UNREACHABLE -DHAVE_FUNC_ATTRIBUTE_CONST
-DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
-DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
-DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
-DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_VISIBILITY
-DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DUSE_SSE41
-DUSE_GCC_ATOMIC_BUILTINS -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS
-DHAVE_SYS_SYSCTL_H -DHAVE_LINUX_FUTEX_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
-DHAVE_POSIX_MEMALIGN -DHAVE_TIMESPEC_GET -DHAVE_MEMFD_CREATE -DHAVE_STRTOD=
_L
-DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_LIBDRM -DHAVE_ZLIB -DHAVE_PTHRE=
AD
-DHAVE_LLVM=3D0x0710 -DMESA_LLVM_VERSION_PATCH=3D0 -DHAVE_WAYLAND_PLATFORM
-DWL_HIDE_DEPRECATED -DHAVE_DRI3 -DHAVE_LIBSENSORS=3D1 -Wall
-Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes
-fno-math-errno -fno-trapping-math -fPIC -pthread -D__STDC_LIMIT_MACROS
-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS
-fvisibility=3Dhidden -MD -MQ
'src/amd/common/2a96a08&#64;&#64;amd_common&#64;sta/ac_nir_to_llvm.c.o' -MF
'src/amd/common/2a96a08&#64;&#64;amd_common&#64;sta/ac_nir_to_llvm.c.o.d' -o
'src/amd/common/2a96a08&#64;&#64;amd_common&#64;sta/ac_nir_to_llvm.c.o' -c
../src/amd/common/ac_nir_to_llvm.c
../src/amd/common/ac_nir_to_llvm.c: In function =E2=80=98ac_llvm_finalize_m=
odule=E2=80=99:
../src/amd/common/ac_nir_to_llvm.c:6614:2: error: implicit declaration of
function =E2=80=98LLVMAddPromoteMemoryToRegisterPass=E2=80=99; did you mean
=E2=80=98LLVMAddDemoteMemoryToRegisterPass=E2=80=99? [-Werror=3Dimplicit-fu=
nction-declaration]
  LLVMAddPromoteMemoryToRegisterPass(passmgr);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  LLVMAddDemoteMemoryToRegisterPass
cc1: some warnings being treated as errors
[425/1549] Compiling C object
'src/mesa/bbe4a73&#64;&#64;mesa_gallium&#64;sta/main_format_utils.c.o'.
ninja: build stopped: subcommand failed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15636658520.c1fb0D7e.21482--

--===============0258930448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0258930448==--
