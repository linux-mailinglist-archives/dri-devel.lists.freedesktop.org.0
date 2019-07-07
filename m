Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC31615C0
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 19:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404FA897EB;
	Sun,  7 Jul 2019 17:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90E57897EB
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 17:57:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8801672167; Sun,  7 Jul 2019 17:57:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Sun, 07 Jul 2019 17:57:42 +0000
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
Message-ID: <bug-111077-502-sqnFKmyMCq@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0400202887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0400202887==
Content-Type: multipart/alternative; boundary="15625222620.B7a9a.1993"
Content-Transfer-Encoding: 7bit


--15625222620.B7a9a.1993
Date: Sun, 7 Jul 2019 17:57:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #2 from roland@rptd.ch <roland@rptd.ch> ---
I don't know what other information can help so I collected information abo=
ut
the state that worked (before the update) and the state that does not work
anymore (after the update):

before update (working state):
media-libs/mesa-18.2.8
- x11-drivers/xf86-video-amdgpu-18.1.0
- x11-libs/libdrm-2.4.96
- sys-devel/llvm-6.0.1
- sys-devel/llvmgold-6
- sys-devel/llvm-common-6.0.1

after update (memory consumption bug present):
- media-libs/mesa-18.3.6 (I also tested media-libs/mesa-19.0.6 and
  media-libs/mesa-19.1.1 with same result)
- x11-drivers/xf86-video-amdgpu-19.0.1
- x11-libs/libdrm-2.4.97
- sys-devel/llvm-7.1.0
- sys-devel/llvmgold-7
- sys-devel/llvm-common-7.1.0

Is there anything else that can help?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625222620.B7a9a.1993
Date: Sun, 7 Jul 2019 17:57:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c2">Commen=
t # 2</a>
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
        <pre>I don't know what other information can help so I collected in=
formation about
the state that worked (before the update) and the state that does not work
anymore (after the update):

before update (working state):
media-libs/mesa-18.2.8
- x11-drivers/xf86-video-amdgpu-18.1.0
- x11-libs/libdrm-2.4.96
- sys-devel/llvm-6.0.1
- sys-devel/llvmgold-6
- sys-devel/llvm-common-6.0.1

after update (memory consumption bug present):
- media-libs/mesa-18.3.6 (I also tested media-libs/mesa-19.0.6 and
  media-libs/mesa-19.1.1 with same result)
- x11-drivers/xf86-video-amdgpu-19.0.1
- x11-libs/libdrm-2.4.97
- sys-devel/llvm-7.1.0
- sys-devel/llvmgold-7
- sys-devel/llvm-common-7.1.0

Is there anything else that can help?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625222620.B7a9a.1993--

--===============0400202887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0400202887==--
