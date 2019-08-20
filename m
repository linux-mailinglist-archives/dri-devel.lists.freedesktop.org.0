Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84285961BE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C66E7F3;
	Tue, 20 Aug 2019 13:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B31D26E7F3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:58:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A9E6A72161; Tue, 20 Aug 2019 13:58:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111432] [bisected][tonga] Boot failures on agd5f's drm-next
 branch
Date: Tue, 20 Aug 2019 13:58:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@fireburn.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111432-502-uQH5VVsPbA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111432-502@http.bugs.freedesktop.org/>
References: <bug-111432-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0887230192=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0887230192==
Content-Type: multipart/alternative; boundary="15663095000.e1947f.25980"
Content-Transfer-Encoding: 7bit


--15663095000.e1947f.25980
Date: Tue, 20 Aug 2019 13:58:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111432

--- Comment #3 from Mike Lothian <mike@fireburn.co.uk> ---
lspci:

00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th
Gen Core Processor Host Bridge/DRAM Registers [8086:1910] (rev 07)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th=
 Gen
Core Processor PCIe Controller (x16) [8086:1901] (rev 07)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200
v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 07)
00:14.0 USB controller [0c03]: Intel Corporation 100 Series/C230 Series Chi=
pset
Family USB 3.0 xHCI Controller [8086:a12f] (rev 31)
00:14.2 Signal processing controller [1180]: Intel Corporation 100 Series/C=
230
Series Chipset Family Thermal Subsystem [8086:a131] (rev 31)
00:16.0 Communication controller [0780]: Intel Corporation 100 Series/C230
Series Chipset Family MEI Controller #1 [8086:a13a] (rev 31)
00:17.0 SATA controller [0106]: Intel Corporation HM170/QM170 Chipset SATA
Controller [AHCI Mode] [8086:a103] (rev 31)
00:1c.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #1 [8086:a110] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #5 [8086:a114] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #6 [8086:a115] (rev f1)
00:1c.6 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #7 [8086:a116] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #9 [8086:a118] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation HM170 Chipset LPC/eSPI Control=
ler
[8086:a14e] (rev 31)
00:1f.2 Memory controller [0580]: Intel Corporation 100 Series/C230 Series
Chipset Family Power Management Controller [8086:a121] (rev 31)
00:1f.3 Audio device [0403]: Intel Corporation 100 Series/C230 Series Chips=
et
Family HD Audio Controller [8086:a170] (rev 31)
00:1f.4 SMBus [0c05]: Intel Corporation 100 Series/C230 Series Chipset Fami=
ly
SMBus [8086:a123] (rev 31)
01:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI]
Amethyst XT [Radeon R9 M295X] [1002:6921]
3b:00.0 Ethernet controller [0200]: Qualcomm Atheros Killer E2400 Gigabit
Ethernet Controller [1969:e0a1] (rev 10)
3c:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wirele=
ss
Network Adapter [168c:003e] (rev 32)
3d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5227 PCI
Express Card Reader [10ec:5227] (rev 01)
3e:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd N=
VMe
SSD Controller SM951/PM951 [144d:a802] (rev 01)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663095000.e1947f.25980
Date: Tue, 20 Aug 2019 13:58:20 +0000
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
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432">bug 11143=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mike&#64;fireburn.co.uk" title=3D"Mike Lothian &lt;mike&#64;fireburn.co.uk&=
gt;"> <span class=3D"fn">Mike Lothian</span></a>
</span></b>
        <pre>lspci:

00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th
Gen Core Processor Host Bridge/DRAM Registers [8086:1910] (rev 07)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th=
 Gen
Core Processor PCIe Controller (x16) [8086:1901] (rev 07)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 530
[8086:191b] (rev 06)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200
v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 07)
00:14.0 USB controller [0c03]: Intel Corporation 100 Series/C230 Series Chi=
pset
Family USB 3.0 xHCI Controller [8086:a12f] (rev 31)
00:14.2 Signal processing controller [1180]: Intel Corporation 100 Series/C=
230
Series Chipset Family Thermal Subsystem [8086:a131] (rev 31)
00:16.0 Communication controller [0780]: Intel Corporation 100 Series/C230
Series Chipset Family MEI Controller #1 [8086:a13a] (rev 31)
00:17.0 SATA controller [0106]: Intel Corporation HM170/QM170 Chipset SATA
Controller [AHCI Mode] [8086:a103] (rev 31)
00:1c.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #1 [8086:a110] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #5 [8086:a114] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #6 [8086:a115] (rev f1)
00:1c.6 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #7 [8086:a116] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation 100 Series/C230 Series Chipset
Family PCI Express Root Port #9 [8086:a118] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation HM170 Chipset LPC/eSPI Control=
ler
[8086:a14e] (rev 31)
00:1f.2 Memory controller [0580]: Intel Corporation 100 Series/C230 Series
Chipset Family Power Management Controller [8086:a121] (rev 31)
00:1f.3 Audio device [0403]: Intel Corporation 100 Series/C230 Series Chips=
et
Family HD Audio Controller [8086:a170] (rev 31)
00:1f.4 SMBus [0c05]: Intel Corporation 100 Series/C230 Series Chipset Fami=
ly
SMBus [8086:a123] (rev 31)
01:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI]
Amethyst XT [Radeon R9 M295X] [1002:6921]
3b:00.0 Ethernet controller [0200]: Qualcomm Atheros Killer E2400 Gigabit
Ethernet Controller [1969:e0a1] (rev 10)
3c:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wirele=
ss
Network Adapter [168c:003e] (rev 32)
3d:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5227 PCI
Express Card Reader [10ec:5227] (rev 01)
3e:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd N=
VMe
SSD Controller SM951/PM951 [144d:a802] (rev 01)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663095000.e1947f.25980--

--===============0887230192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0887230192==--
