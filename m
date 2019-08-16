Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA31909F9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 23:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E816E30C;
	Fri, 16 Aug 2019 21:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2BC36E39C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 21:06:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AFF9D7215A; Fri, 16 Aug 2019 21:06:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 16 Aug 2019 21:06:15 +0000
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
Message-ID: <bug-110674-502-1xjhWQfyf4@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1470123734=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1470123734==
Content-Type: multipart/alternative; boundary="15659895757.4ED7ecE.15626"
Content-Transfer-Encoding: 7bit


--15659895757.4ED7ecE.15626
Date: Fri, 16 Aug 2019 21:06:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #108 from ReddestDream <reddestdream@gmail.com> ---
> Booting with amdgpu.dpm=3D0 on 5.2.7 works.

Tom B., did you try booting with amdgpu.dpm=3D1 or amdgpu.dpm=3D2 (default =
is
generally -1 for automatic)? Seems like one of those might enable the new
experimental SW SMU v11 feature on Vega20 . . .

https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html

https://lists.freedesktop.org/archives/amd-gfx/2019-January/030788.html?pri=
nt=3Danzwix

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659895757.4ED7ecE.15626
Date: Fri, 16 Aug 2019 21:06:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c108">Comm=
ent # 108</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Booting with amdgpu.dpm=3D0 on 5.2.=
7 works.</span >

Tom B., did you try booting with amdgpu.dpm=3D1 or amdgpu.dpm=3D2 (default =
is
generally -1 for automatic)? Seems like one of those might enable the new
experimental SW SMU v11 feature on Vega20 . . .

<a href=3D"https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html">https://dr=
i.freedesktop.org/docs/drm/gpu/amdgpu.html</a>

<a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2019-January/0307=
88.html?print=3Danzwix">https://lists.freedesktop.org/archives/amd-gfx/2019=
-January/030788.html?print=3Danzwix</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659895757.4ED7ecE.15626--

--===============1470123734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1470123734==--
