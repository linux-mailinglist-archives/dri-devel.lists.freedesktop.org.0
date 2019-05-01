Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A110A95
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 18:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9395B892B6;
	Wed,  1 May 2019 16:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14F88892DB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 16:06:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 10F1D7215A; Wed,  1 May 2019 16:06:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Wed, 01 May 2019 16:06:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-3Y29SlLfXE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1178137949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1178137949==
Content-Type: multipart/alternative; boundary="15567268070.47E5fC.17481"
Content-Transfer-Encoding: 7bit


--15567268070.47E5fC.17481
Date: Wed, 1 May 2019 16:06:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #20 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Christian Zigotzky from comment #17)
> (In reply to Alex Deucher from comment #4)
> > Hardly anything in the radeon driver has changed in the last few years.=
=20
> > You'd really need to bisect.  Also, can you attach a full dmesg (full l=
ogs
> > not just filtered for radeon or drm) output from the failed and working
> > cases?
>=20
> I have found some Radeon changes in these DRM updates:
>=20
> -rw-r--r--	drivers/gpu/drm/radeon/r300.c	4=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/r420.c	1=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon.h	3=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_cs.c	4=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_gem.c	2=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_legacy_tv.c 10=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_object.c	2=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_ttm.c	65=09=09=09
> -rw-r--r--	drivers/gpu/drm/radeon/radeon_vm.c

Someone with access to the hw and the platform would have to go through the
changes and see what broke it.  A bisect would be an easy way to do it.  Al=
so,
it's not necessarily a drm change.  It could have been a bad interaction wi=
th
some other change elsewhere in the kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567268070.47E5fC.17481
Date: Wed, 1 May 2019 16:06:47 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Christian Zigotzky from <a href=3D"show_bug.cgi?i=
d=3D109345#c17">comment #17</a>)
<span class=3D"quote">&gt; (In reply to Alex Deucher from <a href=3D"show_b=
ug.cgi?id=3D109345#c4">comment #4</a>)
&gt; &gt; Hardly anything in the radeon driver has changed in the last few =
years.=20
&gt; &gt; You'd really need to bisect.  Also, can you attach a full dmesg (=
full logs
&gt; &gt; not just filtered for radeon or drm) output from the failed and w=
orking
&gt; &gt; cases?
&gt;=20
&gt; I have found some Radeon changes in these DRM updates:
&gt;=20
&gt; -rw-r--r--	drivers/gpu/drm/radeon/r300.c	4=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/r420.c	1=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon.h	3=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_cs.c	4=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_gem.c	2=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_legacy_tv.c 10=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_object.c	2=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_ttm.c	65=09=09=09
&gt; -rw-r--r--	drivers/gpu/drm/radeon/radeon_vm.c</span >

Someone with access to the hw and the platform would have to go through the
changes and see what broke it.  A bisect would be an easy way to do it.  Al=
so,
it's not necessarily a drm change.  It could have been a bad interaction wi=
th
some other change elsewhere in the kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567268070.47E5fC.17481--

--===============1178137949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1178137949==--
