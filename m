Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432BF7A22
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221C789E47;
	Mon, 11 Nov 2019 17:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1536E89E47
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 17:44:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 09934720E2; Mon, 11 Nov 2019 17:44:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111922] amdgpu fails to resume on 5.2 kernel [regression]
Date: Mon, 11 Nov 2019 17:44:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111922-502-ucAK3PwF6z@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1986430075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1986430075==
Content-Type: multipart/alternative; boundary="15734942730.cC8c6.25654"
Content-Transfer-Encoding: 7bit


--15734942730.cC8c6.25654
Date: Mon, 11 Nov 2019 17:44:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111922

--- Comment #8 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Pierre Ossman from comment #7)
> I finally got a build environment set up, and the winner is:
>=20
> > df8368be1382b442384507a5147c89978cd60702 is the first bad commit
> > commit df8368be1382b442384507a5147c89978cd60702
> > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Date:   Wed Feb 27 12:56:36 2019 -0500
> >=20
> >     drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates
> >=20=20=20=20=20
> >     To help xf86-video-amdgpu and mesa know DC supports updating the
> >     tiling attributes for a framebuffer per-flip.
> >=20=20=20=20=20
> >     Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >     Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >     Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >     Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >=20
> > :040000 040000 06a7975c484e74ebdaa4ccf9ee1dc5dac7a0abc9 ab68acde511d49b=
3f96818066bba35f255ce1656 M	drivers
>=20
> Which seems extremely odd given the contents of that commit. But I guess =
it
> makes userspace change behaviour in a way that provokes the bug?
>=20
> I don't think bisect will get me further. Help?

Userspace only enables per flip tiling updates if the version of the kernel
driver is new enough to support that feature.  Maybe this is related to the=
 DCC
changes in mesa.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734942730.cC8c6.25654
Date: Mon, 11 Nov 2019 17:44:33 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu fails to resume on 5.2 kernel [regression]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922">bug 11192=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Pierre Ossman from <a href=3D"show_bug.cgi?id=3D1=
11922#c7">comment #7</a>)
<span class=3D"quote">&gt; I finally got a build environment set up, and th=
e winner is:
&gt;=20
&gt; &gt; df8368be1382b442384507a5147c89978cd60702 is the first bad commit
&gt; &gt; commit df8368be1382b442384507a5147c89978cd60702
&gt; &gt; Author: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlau=
skas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt; &gt; Date:   Wed Feb 27 12:56:36 2019 -0500
&gt; &gt;=20
&gt; &gt;     drm/amdgpu: Bump amdgpu version for per-flip plane tiling upd=
ates
&gt; &gt;=20=20=20=20=20
&gt; &gt;     To help xf86-video-amdgpu and mesa know DC supports updating =
the
&gt; &gt;     tiling attributes for a framebuffer per-flip.
&gt; &gt;=20=20=20=20=20
&gt; &gt;     Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel&#64;daenz=
er.net">michel&#64;daenzer.net</a>&gt;
&gt; &gt;     Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nich=
olas.kazlauskas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt; &gt;     Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deuche=
r&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt; &gt;     Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:mare=
k.olsak&#64;amd.com">marek.olsak&#64;amd.com</a>&gt;
&gt; &gt;     Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.d=
eucher&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt; &gt;=20
&gt; &gt; :040000 040000 06a7975c484e74ebdaa4ccf9ee1dc5dac7a0abc9 ab68acde5=
11d49b3f96818066bba35f255ce1656 M	drivers
&gt;=20
&gt; Which seems extremely odd given the contents of that commit. But I gue=
ss it
&gt; makes userspace change behaviour in a way that provokes the bug?
&gt;=20
&gt; I don't think bisect will get me further. Help?</span >

Userspace only enables per flip tiling updates if the version of the kernel
driver is new enough to support that feature.  Maybe this is related to the=
 DCC
changes in mesa.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734942730.cC8c6.25654--

--===============1986430075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1986430075==--
