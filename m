Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B3DB675
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 20:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C336E04A;
	Thu, 17 Oct 2019 18:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75C456E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 18:41:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6DC007296E; Thu, 17 Oct 2019 18:41:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Thu, 17 Oct 2019 18:41:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111987-502-c0GzZXyIgQ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0575335193=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0575335193==
Content-Type: multipart/alternative; boundary="15713376840.c0DafF6F1.21881"
Content-Transfer-Encoding: 7bit


--15713376840.c0DafF6F1.21881
Date: Thu, 17 Oct 2019 18:41:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #17 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> =
---
I also tried echo profile_peak > power_dpm_force_performance_level , and
initially the sclk stays at the highest level, but after a minute, it does =
drop
just like other profiles.

As of of cooling and PSU. I am sure I have plenty of headroom.

The hwmon reports ~207W power at highest clock state, but temperature as
reported by hwmon stays at 39 deg C. At lower clock states it drops to 37 d=
eg
C, and to about 35 deg C at idle.

Looks to be just fine to me.

My PC case do have extra ventilation, and CPU is pretty much idle.

My PSU is Seasonic Prime Titanium (1000W). I have:

Motherboard: MSI MEG Creation X399
GPU: AMD Threadripper 2950X at stock, liquid cooled, idle (~5% load), about=
 46
deg C.
RAM: 8x16GB Samsung DDR4 ECC
GPU: AMD Radeon Fury X, water cooled
NIC: Melanox ConnectX-3
Storage: 2x Samsung PM983 via U.2
Cooling: Plenty of fans in Fractal Define R6 USB-C case.

I just opened the case, and verified that two 8-pin PCI-E connectors are
connected to GPU and PSU. I also verified that extra (optional, even on mul=
ti
GPU systems) power connectors to MB are also connected to MB and PSU.

GPU radiator is above the GPU, and is not hot to the touch or anything. Fan=
 on
it is spinning at max.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15713376840.c0DafF6F1.21881
Date: Thu, 17 Oct 2019 18:41:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c17">Comme=
nt # 17</a>
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
        <pre>I also tried echo profile_peak &gt; power_dpm_force_performanc=
e_level , and
initially the sclk stays at the highest level, but after a minute, it does =
drop
just like other profiles.

As of of cooling and PSU. I am sure I have plenty of headroom.

The hwmon reports ~207W power at highest clock state, but temperature as
reported by hwmon stays at 39 deg C. At lower clock states it drops to 37 d=
eg
C, and to about 35 deg C at idle.

Looks to be just fine to me.

My PC case do have extra ventilation, and CPU is pretty much idle.

My PSU is Seasonic Prime Titanium (1000W). I have:

Motherboard: MSI MEG Creation X399
GPU: AMD Threadripper 2950X at stock, liquid cooled, idle (~5% load), about=
 46
deg C.
RAM: 8x16GB Samsung DDR4 ECC
GPU: AMD Radeon Fury X, water cooled
NIC: Melanox ConnectX-3
Storage: 2x Samsung PM983 via U.2
Cooling: Plenty of fans in Fractal Define R6 USB-C case.

I just opened the case, and verified that two 8-pin PCI-E connectors are
connected to GPU and PSU. I also verified that extra (optional, even on mul=
ti
GPU systems) power connectors to MB are also connected to MB and PSU.

GPU radiator is above the GPU, and is not hot to the touch or anything. Fan=
 on
it is spinning at max.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15713376840.c0DafF6F1.21881--

--===============0575335193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0575335193==--
