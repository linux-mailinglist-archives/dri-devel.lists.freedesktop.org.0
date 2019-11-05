Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9BEF55F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 07:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E686E903;
	Tue,  5 Nov 2019 06:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81F056E904
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 06:07:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F28D720E2; Tue,  5 Nov 2019 06:07:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Tue, 05 Nov 2019 06:07:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-Z8rFqg19A0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0210533907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0210533907==
Content-Type: multipart/alternative; boundary="15729340533.eEa2.8372"
Content-Transfer-Encoding: 7bit


--15729340533.eEa2.8372
Date: Tue, 5 Nov 2019 06:07:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #23 from wychuchol <wychuchol7777@gmail.com> ---
(In reply to wychuchol from comment #19)
> After some time in Witcher 3 GOTY run with Lutris PC restarts on it's own=
. I
> thought something is overheating (I've noticed graphic card memory in
> PSensor sometimes reaching 90 so I thought maybe that's what's happening)
> but I investigated kern.log and this always happened before that autonomo=
us
> reset:
>=20
> Nov  2 22:01:53 pop-os kernel: [  979.244964] pcieport 0000:00:01.1: AER:
> Corrected error received: 0000:01:00.0
> Nov  2 22:01:53 pop-os kernel: [  979.244967] nvme 0000:01:00.0: AER: PCIe
> Bus Error: severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
> Nov  2 22:01:53 pop-os kernel: [  979.244968] nvme 0000:01:00.0: AER:=20=
=20
> device [1987:5012] error status/mask=3D00001000/00006000
> Nov  2 22:01:53 pop-os kernel: [  979.244968] nvme 0000:01:00.0: AER:=20=
=20=20
> [12] Timeout=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> Nov  2 22:01:53 pop-os kernel: [  979.262629] Emergency Sync complete

Thing with those AER errors is that they can go on and on and reset happens=
 few
minutes after the last logged error.=20
This might be overheating, I managed to find how to output sensors readings
into txt log and found that memory went up to 96 C (or rather it stayed the=
re
for about 1m 10s)
Last reading before reset:
amdgpu-pci-2800
Adapter: PCI adapter
vddgfx:       +1.16 V=20=20
fan1:        1551 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +74.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +88.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +96.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:      162.00 W  (cap =3D 195.00 W)

k10temp-pci-00c3
Adapter: PCI adapter
Tdie:         +70.5=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +70.5=C2=B0C=20=20

Now the weird thing is - if this is in fact overheating why fan didn't go
beyond 1600 rpm even once.... Highest was like 1581 rpm and I don't have si=
lent
bios switched on (sapphire pulse rx 5700 xt, lever facing away from video
ports).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729340533.eEa2.8372
Date: Tue, 5 Nov 2019 06:07:33 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>(In reply to wychuchol from <a href=3D"show_bug.cgi?id=3D11176=
3#c19">comment #19</a>)
<span class=3D"quote">&gt; After some time in Witcher 3 GOTY run with Lutri=
s PC restarts on it's own. I
&gt; thought something is overheating (I've noticed graphic card memory in
&gt; PSensor sometimes reaching 90 so I thought maybe that's what's happeni=
ng)
&gt; but I investigated kern.log and this always happened before that auton=
omous
&gt; reset:
&gt;=20
&gt; Nov  2 22:01:53 pop-os kernel: [  979.244964] pcieport 0000:00:01.1: A=
ER:
&gt; Corrected error received: 0000:01:00.0
&gt; Nov  2 22:01:53 pop-os kernel: [  979.244967] nvme 0000:01:00.0: AER: =
PCIe
&gt; Bus Error: severity=3DCorrected, type=3DData Link Layer, (Transmitter =
ID)
&gt; Nov  2 22:01:53 pop-os kernel: [  979.244968] nvme 0000:01:00.0: AER:=
=20=20
&gt; device [1987:5012] error status/mask=3D00001000/00006000
&gt; Nov  2 22:01:53 pop-os kernel: [  979.244968] nvme 0000:01:00.0: AER:=
=20=20=20
&gt; [12] Timeout=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt; Nov  2 22:01:53 pop-os kernel: [  979.262629] Emergency Sync complete<=
/span >

Thing with those AER errors is that they can go on and on and reset happens=
 few
minutes after the last logged error.=20
This might be overheating, I managed to find how to output sensors readings
into txt log and found that memory went up to 96 C (or rather it stayed the=
re
for about 1m 10s)
Last reading before reset:
amdgpu-pci-2800
Adapter: PCI adapter
vddgfx:       +1.16 V=20=20
fan1:        1551 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +74.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +88.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +96.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:      162.00 W  (cap =3D 195.00 W)

k10temp-pci-00c3
Adapter: PCI adapter
Tdie:         +70.5=C2=B0C  (high =3D +70.0=C2=B0C)
Tctl:         +70.5=C2=B0C=20=20

Now the weird thing is - if this is in fact overheating why fan didn't go
beyond 1600 rpm even once.... Highest was like 1581 rpm and I don't have si=
lent
bios switched on (sapphire pulse rx 5700 xt, lever facing away from video
ports).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729340533.eEa2.8372--

--===============0210533907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0210533907==--
