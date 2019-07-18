Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35376D200
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510B56E437;
	Thu, 18 Jul 2019 16:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 062836E437
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 16:24:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F1DA872167; Thu, 18 Jul 2019 16:24:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Thu, 18 Jul 2019 16:24:29 +0000
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
Message-ID: <bug-111077-502-JZ0AFRwo2E@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0139767820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139767820==
Content-Type: multipart/alternative; boundary="15634670680.fc391.24646"
Content-Transfer-Encoding: 7bit


--15634670680.fc391.24646
Date: Thu, 18 Jul 2019 16:24:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #9 from roland@rptd.ch <roland@rptd.ch> ---
I get two config attempts. This is the second one. Do you see anything out =
of
place here?

meson --buildtype plain --libdir lib64 --localstatedir /var/lib --prefix /u=
sr
--sysconfdir /etc --wrap-mode nodownload
-Dplatforms=3Dx11,surfaceless,wayland,drm -Dllvm=3Dtrue -Dlmsensors=3Dtrue
-Dlibunwind=3Dfalse -Dgallium-nine=3Dfalse -Dgallium-va=3Dfalse -Dgallium-v=
dpau=3Dfalse
-Dgallium-xa=3Dfalse -Dgallium-xvmc=3Dfalse -Dgallium-opencl=3Dicd -Dosmesa=
=3Dnone
-Dbuild-tests=3Dfalse -Dglx=3Ddri -Dshared-glapi=3Dtrue -Ddri3=3Dtrue -Degl=
=3Dtrue
-Dgbm=3Dtrue -Dgles1=3Dfalse -Dgles2=3Dtrue -Dglvnd=3Dfalse -Dselinux=3Dfal=
se
-Dvalgrind=3Dfalse -Ddri-drivers=3Dr100,r200
-Dgallium-drivers=3Dr300,r600,radeonsi,swrast -Dvulkan-drivers=3Damd --buil=
dtype
plain -Db_ndebug=3Dtrue /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-1=
9.0.8
/var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8-abi_x86_64.amd64

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15634670680.fc391.24646
Date: Thu, 18 Jul 2019 16:24:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c9">Commen=
t # 9</a>
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
        <pre>I get two config attempts. This is the second one. Do you see =
anything out of
place here?

meson --buildtype plain --libdir lib64 --localstatedir /var/lib --prefix /u=
sr
--sysconfdir /etc --wrap-mode nodownload
-Dplatforms=3Dx11,surfaceless,wayland,drm -Dllvm=3Dtrue -Dlmsensors=3Dtrue
-Dlibunwind=3Dfalse -Dgallium-nine=3Dfalse -Dgallium-va=3Dfalse -Dgallium-v=
dpau=3Dfalse
-Dgallium-xa=3Dfalse -Dgallium-xvmc=3Dfalse -Dgallium-opencl=3Dicd -Dosmesa=
=3Dnone
-Dbuild-tests=3Dfalse -Dglx=3Ddri -Dshared-glapi=3Dtrue -Ddri3=3Dtrue -Degl=
=3Dtrue
-Dgbm=3Dtrue -Dgles1=3Dfalse -Dgles2=3Dtrue -Dglvnd=3Dfalse -Dselinux=3Dfal=
se
-Dvalgrind=3Dfalse -Ddri-drivers=3Dr100,r200
-Dgallium-drivers=3Dr300,r600,radeonsi,swrast -Dvulkan-drivers=3Damd --buil=
dtype
plain -Db_ndebug=3Dtrue /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-1=
9.0.8
/var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8-abi_x86_64.amd64</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15634670680.fc391.24646--

--===============0139767820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0139767820==--
