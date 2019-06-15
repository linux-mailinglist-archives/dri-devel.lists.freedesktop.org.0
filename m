Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123947155
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 18:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386A892BB;
	Sat, 15 Jun 2019 16:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DA892AC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 16:58:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9AE3372167; Sat, 15 Jun 2019 16:58:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 15 Jun 2019 16:58:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-eQSQgugfon@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0325663188=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0325663188==
Content-Type: multipart/alternative; boundary="15606179391.12aedF6.31676"
Content-Transfer-Encoding: 7bit


--15606179391.12aedF6.31676
Date: Sat, 15 Jun 2019 16:58:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #37 from Tom B <tom@r.je> ---
5.1.9 makes this bug even worse. It now crashes as soon as the display serv=
er
is started.

Running sensors now gives an error:


ERROR: Can't get value of subfeature fan1_input: I/O error
ERROR: Can't get value of subfeature power1_average: I/O error
iwlwifi-virtual-0
Adapter: Virtual device
temp1:        +37.0=C2=B0C=20=20

k10temp-pci-00c3
Adapter: PCI adapter
Tdie:         +34.8=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +61.8=C2=B0C=20=20

amdgpu-pci-4400
Adapter: PCI adapter
vddgfx:       +0.74 V=20=20
fan1:             N/A  (min =3D    0 RPM, max =3D 3850 RPM)
temp1:        +39.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:           N/A  (cap =3D 250.00 W)

k10temp-pci-00cb
Adapter: PCI adapter
Tdie:         +33.2=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +60.2=C2=B0C=20=20



I can't even see the wattage now.=20

# cat /sys/kernel/debug/dri/0/amdgpu_pm_info

Clock Gating Flags Mask: 0x860200
        Graphics Medium Grain Clock Gating: Off
        Graphics Medium Grain memory Light Sleep: Off
        Graphics Coarse Grain Clock Gating: Off
        Graphics Coarse Grain memory Light Sleep: Off
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: Off
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: Off
        Graphics 3D Coarse Grain memory Light Sleep: Off
        Memory Controller Light Sleep: Off
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: Off
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: Off
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: Off
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: On

GFX Clocks and Power:
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        737 mV (VDDGFX)

GPU Temperature: 39 C

UVD: Disabled

VCE: Disabled


No clocks or wattage!=20

I'm guessing 34d07ce3d6a120056e4763ae9a3db0d769ab7c63 "fix ring test failure
issue during s3 in vce 3.0 (V2)" is to blame as dmesg (attached in next pos=
t)
says


[   20.584937] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D25, emitted seq=3D27

It would be nice to see some acknowledgement from AMD on this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606179391.12aedF6.31676
Date: Sat, 15 Jun 2019 16:58:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>5.1.9 makes this bug even worse. It now crashes as soon as the=
 display server
is started.

Running sensors now gives an error:


ERROR: Can't get value of subfeature fan1_input: I/O error
ERROR: Can't get value of subfeature power1_average: I/O error
iwlwifi-virtual-0
Adapter: Virtual device
temp1:        +37.0=C2=B0C=20=20

k10temp-pci-00c3
Adapter: PCI adapter
Tdie:         +34.8=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +61.8=C2=B0C=20=20

amdgpu-pci-4400
Adapter: PCI adapter
vddgfx:       +0.74 V=20=20
fan1:             N/A  (min =3D    0 RPM, max =3D 3850 RPM)
temp1:        +39.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
power1:           N/A  (cap =3D 250.00 W)

k10temp-pci-00cb
Adapter: PCI adapter
Tdie:         +33.2=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +60.2=C2=B0C=20=20



I can't even see the wattage now.=20

# cat /sys/kernel/debug/dri/0/amdgpu_pm_info

Clock Gating Flags Mask: 0x860200
        Graphics Medium Grain Clock Gating: Off
        Graphics Medium Grain memory Light Sleep: Off
        Graphics Coarse Grain Clock Gating: Off
        Graphics Coarse Grain memory Light Sleep: Off
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: Off
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: Off
        Graphics 3D Coarse Grain memory Light Sleep: Off
        Memory Controller Light Sleep: Off
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: Off
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: Off
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: Off
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: On

GFX Clocks and Power:
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        737 mV (VDDGFX)

GPU Temperature: 39 C

UVD: Disabled

VCE: Disabled


No clocks or wattage!=20

I'm guessing 34d07ce3d6a120056e4763ae9a3db0d769ab7c63 &quot;fix ring test f=
ailure
issue during s3 in vce 3.0 (V2)&quot; is to blame as dmesg (attached in nex=
t post)
says


[   20.584937] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D25, emitted seq=3D27

It would be nice to see some acknowledgement from AMD on this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606179391.12aedF6.31676--

--===============0325663188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0325663188==--
