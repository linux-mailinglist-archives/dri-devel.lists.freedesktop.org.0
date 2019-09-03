Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE39A6F97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9981D89233;
	Tue,  3 Sep 2019 16:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E1B7891F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 16:34:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1B09072161; Tue,  3 Sep 2019 16:34:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104206] [drm:construct [amdgpu]] *ERROR* construct: Invalid
 Connector ObjectID from Adapter Service for connector index:2!
Date: Tue, 03 Sep 2019 16:34:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pip.kde@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-104206-502-KV1cxWe2R4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104206-502@http.bugs.freedesktop.org/>
References: <bug-104206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1265919248=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1265919248==
Content-Type: multipart/alternative; boundary="15675284990.6C5f5e.16121"
Content-Transfer-Encoding: 7bit


--15675284990.6C5f5e.16121
Date: Tue, 3 Sep 2019 16:34:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104206

--- Comment #25 from Paul <pip.kde@gmx.com> ---
Also seeing this on an HP255G7 Ryzen3=20

paul@HP255G7:~> journalctl -b | grep -i "drm:construct"
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:2! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:3! type=
 0
expected 3

paul@HP255G7:~> inxi -GxxSz
System:    Host: HP255G7 Kernel: 4.12.14-lp151.28.13-default x86_64 bits: 64
gcc: 7.4.0
           Desktop: KDE Plasma 5.12.8 (Qt 5.9.7) dm: sddm,sddm Distro: open=
SUSE
Leap 15.1
Graphics:  Card: Advanced Micro Devices [AMD/ATI] Radeon Vega 8 Mobile bus-=
ID:
04:00.0 chip-ID: 1002:15dd
           Display Server: x11 (X.Org 1.20.3 ) drivers: ati,amdgpu (unloade=
d:
modesetting,fbdev,vesa)
           Resolution: 1920x1080@60.01hz
           OpenGL: renderer: AMD RAVEN (DRM 3.27.0,
4.12.14-lp151.28.13-default, LLVM 7.0.1)
           version: 4.5 Mesa 18.3.2 Direct Render: Yes

paul@HP255G7:~> /sbin/lspci -nnk | egrep -A3 "VGA|Display|3D"
04:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Radeon Vega 8 Mobile [1002:15dd] (rev c5)
        Subsystem: Hewlett-Packard Company Device [103c:84ae]
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu


paul@HP255G7:~> journalctl -b | grep -i amdgpu
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu kernel modesetting enabled.
Sep 03 17:21:38 HP255G7 kernel: fb: switching to amdgpudrmfb from EFI VGA
Sep 03 17:21:38 HP255G7 kernel: amdgpu 0000:04:00.0: VRAM: 256M
0x000000F400000000 - 0x000000F40FFFFFFF (256M used)
Sep 03 17:21:38 HP255G7 kernel: amdgpu 0000:04:00.0: GART: 1024M
0x000000F500000000 - 0x000000F53FFFFFFF
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu: 256M of VRAM memory ready
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu: 3072M of GTT memory ready.
Sep 03 17:21:39 HP255G7 kernel: amdgpu: [powerplay] dpm has been enabled
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:2! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:3! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: fbcon: amdgpudrmfb (fb0) is primary device
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: fb0: amdgpudrmfb frame
buffer device
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 0(gfx) uses VM inv
eng 4 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 1(comp_1.0.0) use=
s VM
inv eng 5 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 2(comp_1.1.0) use=
s VM
inv eng 6 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 3(comp_1.2.0) use=
s VM
inv eng 7 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 4(comp_1.3.0) use=
s VM
inv eng 8 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 5(comp_1.0.1) use=
s VM
inv eng 9 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 6(comp_1.1.1) use=
s VM
inv eng 10 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 7(comp_1.2.1) use=
s VM
inv eng 11 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 8(comp_1.3.1) use=
s VM
inv eng 12 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 9(kiq_2.1.0) uses=
 VM
inv eng 13 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 10(sdma0) uses VM=
 inv
eng 4 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 11(vcn_dec) uses =
VM
inv eng 5 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 12(vcn_enc0) uses=
 VM
inv eng 6 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 13(vcn_enc1) uses=
 VM
inv eng 7 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 14(vcn_jpeg) uses=
 VM
inv eng 8 on hub 1
Sep 03 17:21:39 HP255G7 kernel: [drm] Initialized amdgpu 3.27.0 20150101 for
0000:04:00.0 on minor 0
Sep 03 17:21:40 HP255G7 systemd[1]: Starting Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0...
Sep 03 17:21:40 HP255G7 systemd[1]: Started Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0.
Sep 03 17:22:31 HP255G7 org_kde_powerdevil[1557]: powerdevil: Udev device
changed
"/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/backlight/amdgpu_bl0"
"/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/backlight/amdgpu_bl0"


Regards, Paul.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675284990.6C5f5e.16121
Date: Tue, 3 Sep 2019 16:34:59 +0000
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
   title=3D"NEW - [drm:construct [amdgpu]] *ERROR* construct: Invalid Conne=
ctor ObjectID from Adapter Service for connector index:2!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104206#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:construct [amdgpu]] *ERROR* construct: Invalid Conne=
ctor ObjectID from Adapter Service for connector index:2!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104206">bug 10420=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pip.kde&#64;gmx.com" title=3D"Paul &lt;pip.kde&#64;gmx.com&gt;"> <span clas=
s=3D"fn">Paul</span></a>
</span></b>
        <pre>Also seeing this on an HP255G7 Ryzen3=20

paul&#64;HP255G7:~&gt; journalctl -b | grep -i &quot;drm:construct&quot;
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:2! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:3! type=
 0
expected 3

paul&#64;HP255G7:~&gt; inxi -GxxSz
System:    Host: HP255G7 Kernel: 4.12.14-lp151.28.13-default x86_64 bits: 64
gcc: 7.4.0
           Desktop: KDE Plasma 5.12.8 (Qt 5.9.7) dm: sddm,sddm Distro: open=
SUSE
Leap 15.1
Graphics:  Card: Advanced Micro Devices [AMD/ATI] Radeon Vega 8 Mobile bus-=
ID:
04:00.0 chip-ID: 1002:15dd
           Display Server: x11 (X.Org 1.20.3 ) drivers: ati,amdgpu (unloade=
d:
modesetting,fbdev,vesa)
           Resolution: <a href=3D"mailto:1920x1080&#64;60.01hz">1920x1080&#=
64;60.01hz</a>
           OpenGL: renderer: AMD RAVEN (DRM 3.27.0,
4.12.14-lp151.28.13-default, LLVM 7.0.1)
           version: 4.5 Mesa 18.3.2 Direct Render: Yes

paul&#64;HP255G7:~&gt; /sbin/lspci -nnk | egrep -A3 &quot;VGA|Display|3D&qu=
ot;
04:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Radeon Vega 8 Mobile [1002:15dd] (rev c5)
        Subsystem: Hewlett-Packard Company Device [103c:84ae]
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu


paul&#64;HP255G7:~&gt; journalctl -b | grep -i amdgpu
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu kernel modesetting enabled.
Sep 03 17:21:38 HP255G7 kernel: fb: switching to amdgpudrmfb from EFI VGA
Sep 03 17:21:38 HP255G7 kernel: amdgpu 0000:04:00.0: VRAM: 256M
0x000000F400000000 - 0x000000F40FFFFFFF (256M used)
Sep 03 17:21:38 HP255G7 kernel: amdgpu 0000:04:00.0: GART: 1024M
0x000000F500000000 - 0x000000F53FFFFFFF
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu: 256M of VRAM memory ready
Sep 03 17:21:38 HP255G7 kernel: [drm] amdgpu: 3072M of GTT memory ready.
Sep 03 17:21:39 HP255G7 kernel: amdgpu: [powerplay] dpm has been enabled
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:2! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: [drm:construct [amdgpu]] *ERROR* construct:
Invalid Connector ObjectID from Adapter Service for connector index:3! type=
 0
expected 3
Sep 03 17:21:39 HP255G7 kernel: fbcon: amdgpudrmfb (fb0) is primary device
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: fb0: amdgpudrmfb frame
buffer device
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 0(gfx) uses VM inv
eng 4 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 1(comp_1.0.0) use=
s VM
inv eng 5 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 2(comp_1.1.0) use=
s VM
inv eng 6 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 3(comp_1.2.0) use=
s VM
inv eng 7 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 4(comp_1.3.0) use=
s VM
inv eng 8 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 5(comp_1.0.1) use=
s VM
inv eng 9 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 6(comp_1.1.1) use=
s VM
inv eng 10 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 7(comp_1.2.1) use=
s VM
inv eng 11 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 8(comp_1.3.1) use=
s VM
inv eng 12 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 9(kiq_2.1.0) uses=
 VM
inv eng 13 on hub 0
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 10(sdma0) uses VM=
 inv
eng 4 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 11(vcn_dec) uses =
VM
inv eng 5 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 12(vcn_enc0) uses=
 VM
inv eng 6 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 13(vcn_enc1) uses=
 VM
inv eng 7 on hub 1
Sep 03 17:21:39 HP255G7 kernel: amdgpu 0000:04:00.0: ring 14(vcn_jpeg) uses=
 VM
inv eng 8 on hub 1
Sep 03 17:21:39 HP255G7 kernel: [drm] Initialized amdgpu 3.27.0 20150101 for
0000:04:00.0 on minor 0
Sep 03 17:21:40 HP255G7 systemd[1]: Starting Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0...
Sep 03 17:21:40 HP255G7 systemd[1]: Started Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0.
Sep 03 17:22:31 HP255G7 org_kde_powerdevil[1557]: powerdevil: Udev device
changed
&quot;/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/backlight/amdgpu_bl=
0&quot;
&quot;/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/backlight/amdgpu_bl=
0&quot;


Regards, Paul.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675284990.6C5f5e.16121--

--===============1265919248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1265919248==--
