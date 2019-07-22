Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B170641
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4989D52;
	Mon, 22 Jul 2019 16:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A011D89CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:57:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9CC2972167; Mon, 22 Jul 2019 16:57:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Mon, 22 Jul 2019 16:57:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-575HvNz7kf@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1837065184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1837065184==
Content-Type: multipart/alternative; boundary="15638146391.9ceCf02A0.31132"
Content-Transfer-Encoding: 7bit


--15638146391.9ceCf02A0.31132
Date: Mon, 22 Jul 2019 16:57:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #12 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #11)
> ../src/amd/common/ac_nir_to_llvm.c
> ../src/amd/common/ac_nir_to_llvm.c: In function =E2=80=98ac_llvm_finalize=
_module=E2=80=99:
> ../src/amd/common/ac_nir_to_llvm.c:6614:2: error: implicit declaration of
> function =E2=80=98LLVMAddPromoteMemoryToRegisterPass=E2=80=99; did you me=
an
> =E2=80=98LLVMAddDemoteMemoryToRegisterPass=E2=80=99? [-Werror=3Dimplicit-=
function-declaration]
>   LLVMAddPromoteMemoryToRegisterPass(passmgr);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   LLVMAddDemoteMemoryToRegisterPass
> cc1: some warnings being treated as errors
> [425/1549] Compiling C object
> 'src/mesa/bbe4a73@@mesa_gallium@sta/main_format_utils.c.o'.
> ninja: build stopped: subcommand failed.

Is this during the bisect, or when?

Try adding=20

#if HAVE_LLVM >=3D 0x0700
#include <llvm-c/Transforms/Utils.h>
#endif

to the #include section of src/amd/common/ac_nir_to_llvm.c

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638146391.9ceCf02A0.31132
Date: Mon, 22 Jul 2019 16:57:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mattst88&#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;=
"> <span class=3D"fn">Matt Turner</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:roland&#64;rptd.ch">roland&#64;=
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c11">comment #11</a>)
<span class=3D"quote">&gt; ../src/amd/common/ac_nir_to_llvm.c
&gt; ../src/amd/common/ac_nir_to_llvm.c: In function =E2=80=98ac_llvm_final=
ize_module=E2=80=99:
&gt; ../src/amd/common/ac_nir_to_llvm.c:6614:2: error: implicit declaration=
 of
&gt; function =E2=80=98LLVMAddPromoteMemoryToRegisterPass=E2=80=99; did you=
 mean
&gt; =E2=80=98LLVMAddDemoteMemoryToRegisterPass=E2=80=99? [-Werror=3Dimplic=
it-function-declaration]
&gt;   LLVMAddPromoteMemoryToRegisterPass(passmgr);
&gt;   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
&gt;   LLVMAddDemoteMemoryToRegisterPass
&gt; cc1: some warnings being treated as errors
&gt; [425/1549] Compiling C object
&gt; 'src/mesa/bbe4a73&#64;&#64;mesa_gallium&#64;sta/main_format_utils.c.o'.
&gt; ninja: build stopped: subcommand failed.</span >

Is this during the bisect, or when?

Try adding=20

#if HAVE_LLVM &gt;=3D 0x0700
#include &lt;llvm-c/Transforms/Utils.h&gt;
#endif

to the #include section of src/amd/common/ac_nir_to_llvm.c</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638146391.9ceCf02A0.31132--

--===============1837065184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1837065184==--
