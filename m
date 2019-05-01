Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A81094C
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 16:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6A9892B7;
	Wed,  1 May 2019 14:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A478D892B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 14:44:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9C2187215A; Wed,  1 May 2019 14:44:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Wed, 01 May 2019 14:44:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-OS3vtttoAO@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0564981848=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0564981848==
Content-Type: multipart/alternative; boundary="15567218590.CB77.32487"
Content-Transfer-Encoding: 7bit


--15567218590.CB77.32487
Date: Wed, 1 May 2019 14:44:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #17 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Alex Deucher from comment #4)
> Hardly anything in the radeon driver has changed in the last few years.=20
> You'd really need to bisect.  Also, can you attach a full dmesg (full logs
> not just filtered for radeon or drm) output from the failed and working
> cases?

I have found some Radeon changes in these DRM updates:

-rw-r--r--      drivers/gpu/drm/radeon/r300.c   4=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/r420.c   1=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon.h 3=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_cs.c      4=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_gem.c     2=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_legacy_tv.c 10=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_object.c  2=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_ttm.c     65=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_vm.c

I see some changes in the GPU memory management subsystem (TTM).

Please note: This is a bug report from an enduser. Endusers aren't able to =
git
bisect. They use the distributions for their daily work. I don't have these
graphics cards so I can't bisect it ether.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567218590.CB77.32487
Date: Wed, 1 May 2019 14:44:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D10=
9345#c4">comment #4</a>)
<span class=3D"quote">&gt; Hardly anything in the radeon driver has changed=
 in the last few years.=20
&gt; You'd really need to bisect.  Also, can you attach a full dmesg (full =
logs
&gt; not just filtered for radeon or drm) output from the failed and working
&gt; cases?</span >

I have found some Radeon changes in these DRM updates:

-rw-r--r--      drivers/gpu/drm/radeon/r300.c   4=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/r420.c   1=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon.h 3=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_cs.c      4=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_gem.c     2=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_legacy_tv.c 10=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_object.c  2=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_ttm.c     65=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
-rw-r--r--      drivers/gpu/drm/radeon/radeon_vm.c

I see some changes in the GPU memory management subsystem (TTM).

Please note: This is a bug report from an enduser. Endusers aren't able to =
git
bisect. They use the distributions for their daily work. I don't have these
graphics cards so I can't bisect it ether.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567218590.CB77.32487--

--===============0564981848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0564981848==--
