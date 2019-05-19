Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D422961
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 01:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389E891C0;
	Sun, 19 May 2019 23:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 146CD891BA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 23:18:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 10B5B72167; Sun, 19 May 2019 23:18:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 19 May 2019 23:18:06 +0000
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
Message-ID: <bug-110674-502-ZQtGBTJ6Hq@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0700514394=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0700514394==
Content-Type: multipart/alternative; boundary="15583078860.De990.27037"
Content-Transfer-Encoding: 7bit


--15583078860.De990.27037
Date: Sun, 19 May 2019 23:18:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #27 from Tom B <tom@r.je> ---
Boost is definitely the problem.

Idle 5.0.13:

$ cat /sys/kernel/debug/dri/0/amdgpu_pm_info
Clock Gating Flags Mask: 0x36974f
        Graphics Medium Grain Clock Gating: On
        Graphics Medium Grain memory Light Sleep: On
        Graphics Coarse Grain Clock Gating: On
        Graphics Coarse Grain memory Light Sleep: On
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: On
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: On
        Graphics 3D Coarse Grain memory Light Sleep: On
        Memory Controller Light Sleep: On
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: On
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: On
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: On
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: Off

GFX Clocks and Power:
        351 MHz (MCLK)
        809 MHz (SCLK)
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        737 mV (VDDGFX)
        23.0 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %

SMC Feature Mask: 0x0000000019f0e3cf
UVD: Disabled

VCE: Disabled


Load 5.0.13:


Clock Gating Flags Mask: 0x36974f
        Graphics Medium Grain Clock Gating: On
        Graphics Medium Grain memory Light Sleep: On
        Graphics Coarse Grain Clock Gating: On
        Graphics Coarse Grain memory Light Sleep: On
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: On
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: On
        Graphics 3D Coarse Grain memory Light Sleep: On
        Memory Controller Light Sleep: On
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: On
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: On
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: On
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: Off

GFX Clocks and Power:
        1001 MHz (MCLK)
        1802 MHz (SCLK)
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        1068 mV (VDDGFX)
        191.0 W (average GPU)

GPU Temperature: 63 C
GPU Load: 0 %

SMC Feature Mask: 0x0000000019f0e3cf
UVD: Disabled

VCE: Disabled



On 5.1, the same clocks, voltage and wattage are used, it never changes pow=
er
states. On 5.0 it idles at 23w low clocks and boosts to 191w with 1802mhz.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583078860.De990.27037
Date: Sun, 19 May 2019 23:18:06 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Boost is definitely the problem.

Idle 5.0.13:

$ cat /sys/kernel/debug/dri/0/amdgpu_pm_info
Clock Gating Flags Mask: 0x36974f
        Graphics Medium Grain Clock Gating: On
        Graphics Medium Grain memory Light Sleep: On
        Graphics Coarse Grain Clock Gating: On
        Graphics Coarse Grain memory Light Sleep: On
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: On
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: On
        Graphics 3D Coarse Grain memory Light Sleep: On
        Memory Controller Light Sleep: On
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: On
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: On
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: On
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: Off

GFX Clocks and Power:
        351 MHz (MCLK)
        809 MHz (SCLK)
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        737 mV (VDDGFX)
        23.0 W (average GPU)

GPU Temperature: 31 C
GPU Load: 0 %

SMC Feature Mask: 0x0000000019f0e3cf
UVD: Disabled

VCE: Disabled


Load 5.0.13:


Clock Gating Flags Mask: 0x36974f
        Graphics Medium Grain Clock Gating: On
        Graphics Medium Grain memory Light Sleep: On
        Graphics Coarse Grain Clock Gating: On
        Graphics Coarse Grain memory Light Sleep: On
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: On
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: On
        Graphics 3D Coarse Grain memory Light Sleep: On
        Memory Controller Light Sleep: On
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: On
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: On
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: On
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: On
        Rom Medium Grain Clock Gating: On
        Data Fabric Medium Grain Clock Gating: Off

GFX Clocks and Power:
        1001 MHz (MCLK)
        1802 MHz (SCLK)
        1373 MHz (PSTATE_SCLK)
        1001 MHz (PSTATE_MCLK)
        1068 mV (VDDGFX)
        191.0 W (average GPU)

GPU Temperature: 63 C
GPU Load: 0 %

SMC Feature Mask: 0x0000000019f0e3cf
UVD: Disabled

VCE: Disabled



On 5.1, the same clocks, voltage and wattage are used, it never changes pow=
er
states. On 5.0 it idles at 23w low clocks and boosts to 191w with 1802mhz.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583078860.De990.27037--

--===============0700514394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0700514394==--
