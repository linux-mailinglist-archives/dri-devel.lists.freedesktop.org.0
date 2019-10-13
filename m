Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C0D54AD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 07:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DDE6E111;
	Sun, 13 Oct 2019 05:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 755D26E111
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 05:14:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 717907296E; Sun, 13 Oct 2019 05:14:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 05:14:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111987-502-DVZy3bYS9O@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111987-502@http.bugs.freedesktop.org/>
References: <bug-111987-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1586565711=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1586565711==
Content-Type: multipart/alternative; boundary="15709436460.a4Cf67C1f.30704"
Content-Transfer-Encoding: 7bit


--15709436460.a4Cf67C1f.30704
Date: Sun, 13 Oct 2019 05:14:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #6 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> -=
--
lspci:

43:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] F=
iji
[Radeon R9 FURY / NANO Series] (rev c8) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Radeon R9 FURY X /
NANO
        Flags: bus master, fast devsel, latency 0, IRQ 65, NUMA node 1
        Memory at 80000000 (64-bit, prefetchable) [size=3D256M]
        Memory at 90000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at 8000 [size=3D256]
        Memory at 9f800000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [200] Resizable BAR <?>
        Capabilities: [270] Secondary PCI Express <?>
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

43:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Fiji HDMI/DP A=
udio
[Radeon R9 Nano / FURY/FURY X]
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Fiji HDMI/DP Audio
[Radeon R9 Nano / FURY/FURY X]
        Flags: bus master, fast devsel, latency 0, IRQ 164, NUMA node 1
        Memory at 9f860000 (64-bit, non-prefetchable) [size=3D16K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709436460.a4Cf67C1f.30704
Date: Sun, 13 Oct 2019 05:14:06 +0000
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
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987">bug 11198=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
witold.baryluk+freedesktop&#64;gmail.com" title=3D"Witold Baryluk &lt;witol=
d.baryluk+freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Witold Baryluk=
</span></a>
</span></b>
        <pre>lspci:

43:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] F=
iji
[Radeon R9 FURY / NANO Series] (rev c8) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Radeon R9 FURY X /
NANO
        Flags: bus master, fast devsel, latency 0, IRQ 65, NUMA node 1
        Memory at 80000000 (64-bit, prefetchable) [size=3D256M]
        Memory at 90000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at 8000 [size=3D256]
        Memory at 9f800000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 &lt;?&gt;
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
&lt;?&gt;
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [200] Resizable BAR &lt;?&gt;
        Capabilities: [270] Secondary PCI Express &lt;?&gt;
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

43:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Fiji HDMI/DP A=
udio
[Radeon R9 Nano / FURY/FURY X]
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Fiji HDMI/DP Audio
[Radeon R9 Nano / FURY/FURY X]
        Flags: bus master, fast devsel, latency 0, IRQ 164, NUMA node 1
        Memory at 9f860000 (64-bit, non-prefetchable) [size=3D16K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 &lt;?&gt;
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
&lt;?&gt;
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [328] Alternative Routing-ID Interpretation (ARI)
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709436460.a4Cf67C1f.30704--

--===============1586565711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1586565711==--
