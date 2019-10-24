Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C159E3C09
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A366E7B5;
	Thu, 24 Oct 2019 19:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01EA06E78B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 19:33:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2953720E2; Thu, 24 Oct 2019 19:33:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 19:33:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: perk11@perk11.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-JPWpCgTaOI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0637503075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0637503075==
Content-Type: multipart/alternative; boundary="15719456085.fc1039.13451"
Content-Transfer-Encoding: 7bit


--15719456085.fc1039.13451
Date: Thu, 24 Oct 2019 19:33:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #158 from Konstantin Pereiaslov <perk11@perk11.info> ---
Also experiencing this with Radeon RX 5700 XT and amdgpu=20
19.1.0+git1910111930.b467d2~oibaf~b with kernel version 5.3.7-050307-generic
running KDE Neon User edition with latest updates.

Didn't have any heavy load for the GPU to do.

First I had some artifacts appeared on Plasma Hard Disk Monitor widget and =
CPU
Load Widget (here is a screenshot:
https://i.perk11.info/20191024_193152_kernel.png) while PC was idle and scr=
een
was locked, but everything else continued to work fine.=20

I checked the logs for the period when this could've happened, but the only
logs from that period are from KScreen that start like this:

Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputProperty (ignored)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Property:  EDID
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
State (newValue, Deleted):  1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputProperty (ignored)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Property:  EDID
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
State (newValue, Deleted):  1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputChange
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
CRTC:  81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Mode:  97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  "Rotate_0"
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Connection:  "Disconnected"
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Subpixel Order:  0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRScreenChangeNotify
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Window: 18874373
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Root: 1744
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  "Rotate_0"
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Size ID: 65535
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Size:  7280 1440
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
SizeMM:  1926 381
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputChange
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
CRTC:  81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Mode:  97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  "Rotate_0"
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Connection:  "Disconnected"
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Subpixel Order:  0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr:
XRandROutput 88 update
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_connected: 0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_crtc
XRandRCrtc(0x5655577da9f0)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          CRTC: 81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          MODE: 97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Connection: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Primary: false
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr: Output =
88 :
connected =3D false , enabled =3D true
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr:
XRandROutput 88 update
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_connected: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_crtc
XRandRCrtc(0x5655577da9f0)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          CRTC: 81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          MODE: 97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Connection: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Primary: false



90 minutes later, the system became unresponsive while I was typing a messa=
ge
in Skype, but the audio I had playing in Audacity continued to play and the
cron jobs continued running normally for a few minutes while I was trying to
get the system unstuck without rebooting it which I couldn't.

Here are the errors:

Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!




Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
ring sdma0 timeout, signaled seq=3D3485981, emitted seq=3D3485983
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
Process information: process Xorg pid 2469 thread Xorg:cs0 pid 2491
Oct 24 19:04:15 perk11-home kernel: [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719456085.fc1039.13451
Date: Thu, 24 Oct 2019 19:33:28 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c158">Comm=
ent # 158</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
perk11&#64;perk11.info" title=3D"Konstantin Pereiaslov &lt;perk11&#64;perk1=
1.info&gt;"> <span class=3D"fn">Konstantin Pereiaslov</span></a>
</span></b>
        <pre>Also experiencing this with Radeon RX 5700 XT and amdgpu=20
19.1.0+git1910111930.b467d2~oibaf~b with kernel version 5.3.7-050307-generic
running KDE Neon User edition with latest updates.

Didn't have any heavy load for the GPU to do.

First I had some artifacts appeared on Plasma Hard Disk Monitor widget and =
CPU
Load Widget (here is a screenshot:
<a href=3D"https://i.perk11.info/20191024_193152_kernel.png">https://i.perk=
11.info/20191024_193152_kernel.png</a>) while PC was idle and screen
was locked, but everything else continued to work fine.=20

I checked the logs for the period when this could've happened, but the only
logs from that period are from KScreen that start like this:

Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputProperty (ignored)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Property:  EDID
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
State (newValue, Deleted):  1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputProperty (ignored)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Property:  EDID
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
State (newValue, Deleted):  1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputChange
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
CRTC:  81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Mode:  97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  &quot;Rotate_0&quot;
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Connection:  &quot;Disconnected&quot;
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Subpixel Order:  0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRScreenChangeNotify
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Window: 18874373
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Root: 1744
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  &quot;Rotate_0&quot;
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Size ID: 65535
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Size:  7280 1440
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
SizeMM:  1926 381
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:
RRNotify_OutputChange
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Output:  88
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
CRTC:  81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Mode:  97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Rotation:  &quot;Rotate_0&quot;
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Connection:  &quot;Disconnected&quot;
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xcb.helper:=20=
=20=20=20=20=20=20=20
Subpixel Order:  0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr:
XRandROutput 88 update
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_connected: 0
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_crtc
XRandRCrtc(0x5655577da9f0)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          CRTC: 81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          MODE: 97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Connection: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Primary: false
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr: Output =
88 :
connected =3D false , enabled =3D true
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]: kscreen.xrandr:
XRandROutput 88 update
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_connected: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          m_crtc
XRandRCrtc(0x5655577da9f0)
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          CRTC: 81
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          MODE: 97
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Connection: 1
Oct 24 16:34:58 perk11-home org.kde.KScreen[25804]:          Primary: false



90 minutes later, the system became unresponsive while I was typing a messa=
ge
in Skype, but the audio I had playing in Audacity continued to play and the
cron jobs continued running normally for a few minutes while I was trying to
get the system unstuck without rebooting it which I couldn't.

Here are the errors:

Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!




Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:10 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out or interrupted!
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
ring sdma0 timeout, signaled seq=3D3485981, emitted seq=3D3485983
Oct 24 19:04:15 perk11-home kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERR=
OR*
Process information: process Xorg pid 2469 thread Xorg:cs0 pid 2491
Oct 24 19:04:15 perk11-home kernel: [drm] GPU recovery disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719456085.fc1039.13451--

--===============0637503075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0637503075==--
