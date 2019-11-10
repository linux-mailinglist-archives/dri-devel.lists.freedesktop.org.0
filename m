Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA36F68E4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 13:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CF86E5F2;
	Sun, 10 Nov 2019 12:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B65C56E5F2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 12:17:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9DB6F720E2; Sun, 10 Nov 2019 12:17:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111922] amdgpu fails to resume on 5.2 kernel [regression]
Date: Sun, 10 Nov 2019 12:17:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111922-502-ElvgVORBwF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111922-502@http.bugs.freedesktop.org/>
References: <bug-111922-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0012834421=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0012834421==
Content-Type: multipart/alternative; boundary="15733882700.aC0Faef7.1425"
Content-Transfer-Encoding: 7bit


--15733882700.aC0Faef7.1425
Date: Sun, 10 Nov 2019 12:17:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111922

--- Comment #7 from Pierre Ossman <pierre-bugzilla@ossman.eu> ---
I finally got a build environment set up, and the winner is:

> df8368be1382b442384507a5147c89978cd60702 is the first bad commit
> commit df8368be1382b442384507a5147c89978cd60702
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Feb 27 12:56:36 2019 -0500
>=20
>     drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates
>=20=20=20=20=20
>     To help xf86-video-amdgpu and mesa know DC supports updating the
>     tiling attributes for a framebuffer per-flip.
>=20=20=20=20=20
>     Cc: Michel D=C3=A4nzer <michel@daenzer.net>
>     Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>=20
> :040000 040000 06a7975c484e74ebdaa4ccf9ee1dc5dac7a0abc9 ab68acde511d49b3f=
96818066bba35f255ce1656 M	drivers

Which seems extremely odd given the contents of that commit. But I guess it
makes userspace change behaviour in a way that provokes the bug?

I don't think bisect will get me further. Help?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733882700.aC0Faef7.1425
Date: Sun, 10 Nov 2019 12:17:50 +0000
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
   title=3D"NEW - amdgpu fails to resume on 5.2 kernel [regression]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu fails to resume on 5.2 kernel [regression]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922">bug 11192=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-bugzilla&#64;ossman.eu" title=3D"Pierre Ossman &lt;pierre-bugzilla&#=
64;ossman.eu&gt;"> <span class=3D"fn">Pierre Ossman</span></a>
</span></b>
        <pre>I finally got a build environment set up, and the winner is:

<span class=3D"quote">&gt; df8368be1382b442384507a5147c89978cd60702 is the =
first bad commit
&gt; commit df8368be1382b442384507a5147c89978cd60702
&gt; Author: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlauskas&=
#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt; Date:   Wed Feb 27 12:56:36 2019 -0500
&gt;=20
&gt;     drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates
&gt;=20=20=20=20=20
&gt;     To help xf86-video-amdgpu and mesa know DC supports updating the
&gt;     tiling attributes for a framebuffer per-flip.
&gt;=20=20=20=20=20
&gt;     Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel&#64;daenzer.ne=
t">michel&#64;daenzer.net</a>&gt;
&gt;     Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.=
kazlauskas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt;     Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt;     Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.ols=
ak&#64;amd.com">marek.olsak&#64;amd.com</a>&gt;
&gt;     Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deuche=
r&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt;=20
&gt; :040000 040000 06a7975c484e74ebdaa4ccf9ee1dc5dac7a0abc9 ab68acde511d49=
b3f96818066bba35f255ce1656 M	drivers</span >

Which seems extremely odd given the contents of that commit. But I guess it
makes userspace change behaviour in a way that provokes the bug?

I don't think bisect will get me further. Help?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733882700.aC0Faef7.1425--

--===============0012834421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0012834421==--
