Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8A6F8C6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 07:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ABF89904;
	Mon, 22 Jul 2019 05:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 427C1898F1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 05:19:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3EB8B72167; Mon, 22 Jul 2019 05:19:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 22 Jul 2019 05:19:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-rMld8l3j91@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0161489225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0161489225==
Content-Type: multipart/alternative; boundary="15637727692.ce7aC19.15526"
Content-Transfer-Encoding: 7bit


--15637727692.ce7aC19.15526
Date: Mon, 22 Jul 2019 05:19:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #58 from Mauro Gaspari <ilvipero@gmx.com> ---
After a long time without crashes on Tumbleweed, I wanted to prepare a test
setup for valve mesa built with ACO. So I installed Ubuntu Budgie 18.04 LTS
with hardware enablement stack and I noticed the OS freezes are now back, e=
ven
on the RadeonVII.=20

What I noticed in the game behavior is this. This is a game running on
crossover (wine) with DX11 and DXVK. I want to point out that I do alt-tab =
out
of games to do other things, so this might be a factor to consider. But aga=
in,
I do the same on my NVIDIA-GPU laptop and I never had a single freeze or fps
drop.
Not sure if point 2 and 3 are related, I just wanted to share my observatio=
ns.

1. Game starts with excellent FPS. I can hear GPU fans spinning.
2. After a while, game loses a lot of FPS starts to become slow and sluggis=
h,
GPU seems to be no longer doing much and I can no longer hear the fans
spinning.
3. After a while longer, the whole OS freezes as described in my first post.


What I am going to do next:
1. Use the workaround of comment #47 and test for a few days.
2. Install Valve mesa-aco with ubuntu PPA and test (without workarounds) fo=
r a
few days.

I will report back when I have more details on my tests.

System info:
OS: Ubuntu 18.04.2 LTS x86_64=20
Kernel: 5.0.0-21-generic
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) @ 3.700G=20
GPU: AMD Vega 20=20
Memory: 2650MiB / 64398MiB
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637727692.ce7aC19.15526
Date: Mon, 22 Jul 2019 05:19:29 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c58">Comme=
nt # 58</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>After a long time without crashes on Tumbleweed, I wanted to p=
repare a test
setup for valve mesa built with ACO. So I installed Ubuntu Budgie 18.04 LTS
with hardware enablement stack and I noticed the OS freezes are now back, e=
ven
on the RadeonVII.=20

What I noticed in the game behavior is this. This is a game running on
crossover (wine) with DX11 and DXVK. I want to point out that I do alt-tab =
out
of games to do other things, so this might be a factor to consider. But aga=
in,
I do the same on my NVIDIA-GPU laptop and I never had a single freeze or fps
drop.
Not sure if point 2 and 3 are related, I just wanted to share my observatio=
ns.

1. Game starts with excellent FPS. I can hear GPU fans spinning.
2. After a while, game loses a lot of FPS starts to become slow and sluggis=
h,
GPU seems to be no longer doing much and I can no longer hear the fans
spinning.
3. After a while longer, the whole OS freezes as described in my first post.


What I am going to do next:
1. Use the workaround of <a href=3D"show_bug.cgi?id=3D109955#c47">comment #=
47</a> and test for a few days.
2. Install Valve mesa-aco with ubuntu PPA and test (without workarounds) fo=
r a
few days.

I will report back when I have more details on my tests.

System info:
OS: Ubuntu 18.04.2 LTS x86_64=20
Kernel: 5.0.0-21-generic
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) &#64; 3.700G=20
GPU: AMD Vega 20=20
Memory: 2650MiB / 64398MiB
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637727692.ce7aC19.15526--

--===============0161489225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0161489225==--
