Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C56F03F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 19:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CE26E8C2;
	Sat, 20 Jul 2019 17:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C206C6E8C2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 17:46:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BECFB72167; Sat, 20 Jul 2019 17:46:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Sat, 20 Jul 2019 17:46:48 +0000
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
Message-ID: <bug-111077-502-PRLKBld29S@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0676084909=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0676084909==
Content-Type: multipart/alternative; boundary="15636448082.aDffCE.28690"
Content-Transfer-Encoding: 7bit


--15636448082.aDffCE.28690
Date: Sat, 20 Jul 2019 17:46:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #10 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #9)
> I get two config attempts. This is the second one. Do you see anything out
> of place here?
>=20
> meson --buildtype plain --libdir lib64 --localstatedir /var/lib --prefix
> /usr --sysconfdir /etc --wrap-mode nodownload
> -Dplatforms=3Dx11,surfaceless,wayland,drm -Dllvm=3Dtrue -Dlmsensors=3Dtrue
> -Dlibunwind=3Dfalse -Dgallium-nine=3Dfalse -Dgallium-va=3Dfalse
> -Dgallium-vdpau=3Dfalse -Dgallium-xa=3Dfalse -Dgallium-xvmc=3Dfalse
> -Dgallium-opencl=3Dicd -Dosmesa=3Dnone -Dbuild-tests=3Dfalse -Dglx=3Ddri
> -Dshared-glapi=3Dtrue -Ddri3=3Dtrue -Degl=3Dtrue -Dgbm=3Dtrue -Dgles1=3Df=
alse
> -Dgles2=3Dtrue -Dglvnd=3Dfalse -Dselinux=3Dfalse -Dvalgrind=3Dfalse
> -Ddri-drivers=3Dr100,r200 -Dgallium-drivers=3Dr300,r600,radeonsi,swrast
> -Dvulkan-drivers=3Damd --buildtype plain -Db_ndebug=3Dtrue
> /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8
> /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8-abi_x86_64.amd64

Just change the /var/tmp/portage/... path to your own build directory and y=
ou
should be good :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15636448082.aDffCE.28690
Date: Sat, 20 Jul 2019 17:46:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c10">Comme=
nt # 10</a>
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
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c9">comment #9</a>)
<span class=3D"quote">&gt; I get two config attempts. This is the second on=
e. Do you see anything out
&gt; of place here?
&gt;=20
&gt; meson --buildtype plain --libdir lib64 --localstatedir /var/lib --pref=
ix
&gt; /usr --sysconfdir /etc --wrap-mode nodownload
&gt; -Dplatforms=3Dx11,surfaceless,wayland,drm -Dllvm=3Dtrue -Dlmsensors=3D=
true
&gt; -Dlibunwind=3Dfalse -Dgallium-nine=3Dfalse -Dgallium-va=3Dfalse
&gt; -Dgallium-vdpau=3Dfalse -Dgallium-xa=3Dfalse -Dgallium-xvmc=3Dfalse
&gt; -Dgallium-opencl=3Dicd -Dosmesa=3Dnone -Dbuild-tests=3Dfalse -Dglx=3Dd=
ri
&gt; -Dshared-glapi=3Dtrue -Ddri3=3Dtrue -Degl=3Dtrue -Dgbm=3Dtrue -Dgles1=
=3Dfalse
&gt; -Dgles2=3Dtrue -Dglvnd=3Dfalse -Dselinux=3Dfalse -Dvalgrind=3Dfalse
&gt; -Ddri-drivers=3Dr100,r200 -Dgallium-drivers=3Dr300,r600,radeonsi,swrast
&gt; -Dvulkan-drivers=3Damd --buildtype plain -Db_ndebug=3Dtrue
&gt; /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8
&gt; /var/tmp/portage/media-libs/mesa-19.0.8/work/mesa-19.0.8-abi_x86_64.am=
d64</span >

Just change the /var/tmp/portage/... path to your own build directory and y=
ou
should be good :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15636448082.aDffCE.28690--

--===============0676084909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0676084909==--
