Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712E90BF8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 03:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318A16E417;
	Sat, 17 Aug 2019 01:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 286AF6E40D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 01:47:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 251417215A; Sat, 17 Aug 2019 01:47:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 17 Aug 2019 01:47:11 +0000
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
Message-ID: <bug-110674-502-qFjQWc0qp8@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0696625664=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0696625664==
Content-Type: multipart/alternative; boundary="15660064310.726Dd0d8.27258"
Content-Transfer-Encoding: 7bit


--15660064310.726Dd0d8.27258
Date: Sat, 17 Aug 2019 01:47:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #111 from ReddestDream <reddestdream@gmail.com> ---
A few other ideas to ponder:

1. Looking into DPM, I found this commit for 5.1-rc1 that looks interesting:

https://github.com/torvalds/linux/commit/7ca881a8651bdeffd99ba8e0010160f9bf=
60673e

Looks like it exposes "ppfeatures" interface on Vega 10 and later GPU,
including some code for Vega 20.

2. I also found two interesting commits that pertain to "doorbell" register
initialization on Vega 20. Also from 5.1-rc1. Might be related to setting up
the GPU ASICs . I must admit I'm not exactly sure what these do . . .

https://github.com/torvalds/linux/commit/fd4855409f6ebe015406cd2b2ffa4fee4c=
d1f4a7

https://github.com/torvalds/linux/commit/828845b7c86c5338f6ca02aaaaf4b52571=
8f31b2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660064310.726Dd0d8.27258
Date: Sat, 17 Aug 2019 01:47:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c111">Comm=
ent # 111</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>A few other ideas to ponder:

1. Looking into DPM, I found this commit for 5.1-rc1 that looks interesting:

<a href=3D"https://github.com/torvalds/linux/commit/7ca881a8651bdeffd99ba8e=
0010160f9bf60673e">https://github.com/torvalds/linux/commit/7ca881a8651bdef=
fd99ba8e0010160f9bf60673e</a>

Looks like it exposes &quot;ppfeatures&quot; interface on Vega 10 and later=
 GPU,
including some code for Vega 20.

2. I also found two interesting commits that pertain to &quot;doorbell&quot=
; register
initialization on Vega 20. Also from 5.1-rc1. Might be related to setting up
the GPU ASICs . I must admit I'm not exactly sure what these do . . .

<a href=3D"https://github.com/torvalds/linux/commit/fd4855409f6ebe015406cd2=
b2ffa4fee4cd1f4a7">https://github.com/torvalds/linux/commit/fd4855409f6ebe0=
15406cd2b2ffa4fee4cd1f4a7</a>

<a href=3D"https://github.com/torvalds/linux/commit/828845b7c86c5338f6ca02a=
aaaf4b525718f31b2">https://github.com/torvalds/linux/commit/828845b7c86c533=
8f6ca02aaaaf4b525718f31b2</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660064310.726Dd0d8.27258--

--===============0696625664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0696625664==--
