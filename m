Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5D9D9C5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 01:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40DF6E331;
	Mon, 26 Aug 2019 23:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36A1A6E331
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 23:07:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3282D72161; Mon, 26 Aug 2019 23:07:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Mon, 26 Aug 2019 23:07:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-6D6SjHWhfT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1474440282=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1474440282==
Content-Type: multipart/alternative; boundary="15668608561.9650D.17379"
Content-Transfer-Encoding: 7bit


--15668608561.9650D.17379
Date: Mon, 26 Aug 2019 23:07:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #1 from Robert <freedesktop@postfach.xyz> ---
Not sure if it's of any use but I figured out today that after starting KDE
Plasma, launching "Konsole" and typing "sensors" the output is basically
garbage:

"""
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:             N/A  (min =3D    0 RPM, max =3D 3200 RPM)
edge:             N/A  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:         N/A  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:              N/A  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:           N/A  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
"""

I can repeat this a few times and it stays the same. And I always see this
errors in "dmesg" or "journalctl":

"""
[  137.931148] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[  137.931150] amdgpu: [powerplay] Failed to export SMU metrics table!
[  140.144885] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  142.358346] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  142.358348] amdgpu: [powerplay] Failed to export SMU metrics table!
[  144.571878] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  146.785069] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  146.785071] amdgpu: [powerplay] Failed to export SMU metrics table!
[  148.998450] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  151.211737] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  151.211738] amdgpu: [powerplay] Failed to export SMU metrics table!
[  153.425132] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  155.638843] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  155.638845] amdgpu: [powerplay] Failed to export SMU metrics table!
"""

It looks like that for every value "sensors" try to get it prints one such
"failed send message..." errors.

Now the funny thing is if I start "Firefox" the screen "flickers" very shor=
tly
and afterwards "sensors" prints useful values e.g.:

"""
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:         531 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +54.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +56.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +66.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       34.00 W  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
"""

But the problem with high idle power consumption of course doesn't change.
Today I updated to the latest firmware from 2019-08-26 and also updated Mes=
a to
19.2-rc1. In the last post I forgot to mention that I'm currently using
"libdrm-git 2.4.99.r16.g14922551-1" which is basically libdrm master branch
AFAIK.

I'm really a little bit out of ideas ATM. Besides the idle power consumption
thingy everything is working perfectly. Even Minecraft ;-)

Before I installed Archlinux from scratch I used a Nvidia GTX 1060 with the
Nvidia binary drivers in the same host as the Sapphire card I now use wasn't
released at that time. With that card I hadn't any issues with idle power
consumption. It was around 8-10W while running KDE Plasma.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668608561.9650D.17379
Date: Mon, 26 Aug 2019 23:07:36 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>Not sure if it's of any use but I figured out today that after=
 starting KDE
Plasma, launching &quot;Konsole&quot; and typing &quot;sensors&quot; the ou=
tput is basically
garbage:

&quot;&quot;&quot;
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:             N/A  (min =3D    0 RPM, max =3D 3200 RPM)
edge:             N/A  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:         N/A  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:              N/A  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:           N/A  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
&quot;&quot;&quot;

I can repeat this a few times and it stays the same. And I always see this
errors in &quot;dmesg&quot; or &quot;journalctl&quot;:

&quot;&quot;&quot;
[  137.931148] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[  137.931150] amdgpu: [powerplay] Failed to export SMU metrics table!
[  140.144885] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  142.358346] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  142.358348] amdgpu: [powerplay] Failed to export SMU metrics table!
[  144.571878] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  146.785069] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  146.785071] amdgpu: [powerplay] Failed to export SMU metrics table!
[  148.998450] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  151.211737] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  151.211738] amdgpu: [powerplay] Failed to export SMU metrics table!
[  153.425132] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  155.638843] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[  155.638845] amdgpu: [powerplay] Failed to export SMU metrics table!
&quot;&quot;&quot;

It looks like that for every value &quot;sensors&quot; try to get it prints=
 one such
&quot;failed send message...&quot; errors.

Now the funny thing is if I start &quot;Firefox&quot; the screen &quot;flic=
kers&quot; very shortly
and afterwards &quot;sensors&quot; prints useful values e.g.:

&quot;&quot;&quot;
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:         531 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +54.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +56.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +66.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       34.00 W  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
&quot;&quot;&quot;

But the problem with high idle power consumption of course doesn't change.
Today I updated to the latest firmware from 2019-08-26 and also updated Mes=
a to
19.2-rc1. In the last post I forgot to mention that I'm currently using
&quot;libdrm-git 2.4.99.r16.g14922551-1&quot; which is basically libdrm mas=
ter branch
AFAIK.

I'm really a little bit out of ideas ATM. Besides the idle power consumption
thingy everything is working perfectly. Even Minecraft ;-)

Before I installed Archlinux from scratch I used a Nvidia GTX 1060 with the
Nvidia binary drivers in the same host as the Sapphire card I now use wasn't
released at that time. With that card I hadn't any issues with idle power
consumption. It was around 8-10W while running KDE Plasma.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668608561.9650D.17379--

--===============1474440282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1474440282==--
