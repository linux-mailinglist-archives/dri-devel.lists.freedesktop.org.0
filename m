Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6AA413B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 02:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70306E06B;
	Sat, 31 Aug 2019 00:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 368326E135
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 00:11:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 33A7572161; Sat, 31 Aug 2019 00:11:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 31 Aug 2019 00:11:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-ngeM82BdpA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0307543441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0307543441==
Content-Type: multipart/alternative; boundary="15672102792.f7d4513.24555"
Content-Transfer-Encoding: 7bit


--15672102792.f7d4513.24555
Date: Sat, 31 Aug 2019 00:11:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #123 from ReddestDream <reddestdream@gmail.com> ---
A few interesting fixes that touch vega20_hwmgr.c have rolled in from
drm-fixes:

The first is likely the most interesting for our issues, as it touches
min/maxes (tho only the soft ones it seems). The other two are related to S=
MU
versions.

https://github.com/torvalds/linux/commit/83e09d5bddbee749fc8306389024439789=
6a1971

https://github.com/torvalds/linux/commit/21649c0b6b7899f4fa3099c46d3d027f60=
b107ec

https://github.com/torvalds/linux/commit/23b7f6c41d4717b1638eca47e09d7e99fc=
7b9fd9

I haven't tested them out yet, but it does give me some hope that someone is
still looking at Vega 20/Radeon VII . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672102792.f7d4513.24555
Date: Sat, 31 Aug 2019 00:11:19 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c123">Comm=
ent # 123</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>A few interesting fixes that touch vega20_hwmgr.c have rolled =
in from
drm-fixes:

The first is likely the most interesting for our issues, as it touches
min/maxes (tho only the soft ones it seems). The other two are related to S=
MU
versions.

<a href=3D"https://github.com/torvalds/linux/commit/83e09d5bddbee749fc83063=
890244397896a1971">https://github.com/torvalds/linux/commit/83e09d5bddbee74=
9fc83063890244397896a1971</a>

<a href=3D"https://github.com/torvalds/linux/commit/21649c0b6b7899f4fa3099c=
46d3d027f60b107ec">https://github.com/torvalds/linux/commit/21649c0b6b7899f=
4fa3099c46d3d027f60b107ec</a>

<a href=3D"https://github.com/torvalds/linux/commit/23b7f6c41d4717b1638eca4=
7e09d7e99fc7b9fd9">https://github.com/torvalds/linux/commit/23b7f6c41d4717b=
1638eca47e09d7e99fc7b9fd9</a>

I haven't tested them out yet, but it does give me some hope that someone is
still looking at Vega 20/Radeon VII . . .</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672102792.f7d4513.24555--

--===============0307543441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0307543441==--
