Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB559C298
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7726E0F7;
	Sun, 25 Aug 2019 08:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7977D6E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 08:43:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F1AA72161; Sun, 25 Aug 2019 08:43:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sun, 25 Aug 2019 08:43:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1194938944=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1194938944==
Content-Type: multipart/alternative; boundary="15667225950.Ab7690.13873"
Content-Transfer-Encoding: 7bit


--15667225950.Ab7690.13873
Date: Sun, 25 Aug 2019 08:43:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

            Bug ID: 111482
           Summary: Sapphire Pulse RX 5700 XT power consumption
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@postfach.xyz

Hi!

I'm mainly referring to this thread in Archlinux forum:
https://bbs.archlinux.org/viewtopic.php?id=3D247667

I have a Sapphire Pulse RX 5700 XT and with the help of the thread above I
managed to get it working. The card is not using the AMD reference
implementation so it's one of the newer vendor custom design cards.

I currently have installed this software stack:

- local/linux-amd-staging-drm-next-git 5.4.857545.b4d857ded1c5-1 (which is
basically this one
https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-2019-08-23 =
as I
modified PKGBUILD accordingly)=20
- aur/llvm-minimal-git 10.0.0_r324774.c310e5a7ab6-1
- aur/mesa-git 19.2.0_devel.114565.b2839193987-1
- firmware 2019-08-21 from https://people.freedesktop.org/~agd5f/r =E2=80=
=A6 de/navi10/
- core/amd-ucode 20190815.07b925b-1

Everything regarding power consumption is perfect as long as I stay in cons=
ole.
I've also Kernel Mode Setting (KMS) enabled. Executing "sensors" command I =
get
this output ATM (it varies a little bit of course but basically stays around
this values):

"""
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:        168 RPM  (min =3D    0 RPM, max =3D 4950 RPM)
edge:         +42.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                       (emerg =3D +80000.0=C2=B0C)
junction:     +43.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
mem:          +50.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
power1:        8.00 W  (cap =3D 180.00 W)
"""

So according to this output the card uses 8 W in idle mode which is what I'm
expecting (also no card fans are spinning which is great). Now if I start K=
DE
Plasma 5 with OpenGL 3.1 backend this changes:

"""
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:         530 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +51.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +53.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +62.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       32.00 W  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
"""

Now I have a power consumption around 32 W just by launching KDE Plasma. I
didn't start anything else. Having a look at my power meter it's even more =
then
32 W which "sensors" is reporting (more like 40 W).

Another user in the thread mentioned above reported that for him the power
consumption stays at 8 W even when KDE is running. There is only one
difference: He has a card with the AMD reference design and I've a custom
design card from Sapphire. So I can only suspect that there is some differe=
nce
in the power play implementation. My card also has two different BIOSes and=
 I
tried both but there is no difference regarding power consumption. The moni=
tor
is connected via DisplayPort if this is of any interest. And here is my "dm=
esg"
output (grepped for "amdgpu"):

[    1.266205] [drm] amdgpu kernel modesetting enabled.
[    1.266320] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -> 0xefffffff
[    1.266320] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -> 0xf01fffff
[    1.266321] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xf6c00000 -> 0xf6c7ffff
[    1.266322] fb0: switching to amdgpudrmfb from EFI VGA
[    1.266374] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[    1.291100] amdgpu 0000:0c:00.0: No more image in the PCI ROM
[    1.291132] amdgpu 0000:0c:00.0: VRAM: 8176M 0x0000008000000000 -
0x00000081FEFFFFFF (8176M used)
[    1.291133] amdgpu 0000:0c:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    1.291191] [drm] amdgpu: 8176M of VRAM memory ready
[    1.291192] [drm] amdgpu: 8176M of GTT memory ready.
[    2.031317] amdgpu: [powerplay] SMU is initialized successfully!
[    2.196969] fbcon: amdgpudrmfb (fb0) is primary device
[    2.302436] amdgpu 0000:0c:00.0: fb0: amdgpudrmfb frame buffer device
[    2.316727] amdgpu 0000:0c:00.0: ring 0(gfx_0.0.0) uses VM inv eng 4 on =
hub
0
[    2.316728] amdgpu 0000:0c:00.0: ring 1(gfx_0.1.0) uses VM inv eng 5 on =
hub
0
[    2.316728] amdgpu 0000:0c:00.0: ring 2(comp_1.0.0) uses VM inv eng 6 on=
 hub
0
[    2.316729] amdgpu 0000:0c:00.0: ring 3(comp_1.1.0) uses VM inv eng 7 on=
 hub
0
[    2.316729] amdgpu 0000:0c:00.0: ring 4(comp_1.2.0) uses VM inv eng 8 on=
 hub
0
[    2.316730] amdgpu 0000:0c:00.0: ring 5(comp_1.3.0) uses VM inv eng 9 on=
 hub
0
[    2.316731] amdgpu 0000:0c:00.0: ring 6(comp_1.0.1) uses VM inv eng 10 on
hub 0
[    2.316731] amdgpu 0000:0c:00.0: ring 7(comp_1.1.1) uses VM inv eng 11 on
hub 0
[    2.316732] amdgpu 0000:0c:00.0: ring 8(comp_1.2.1) uses VM inv eng 12 on
hub 0
[    2.316733] amdgpu 0000:0c:00.0: ring 9(comp_1.3.1) uses VM inv eng 13 on
hub 0
[    2.316733] amdgpu 0000:0c:00.0: ring 10(kiq_2.1.0) uses VM inv eng 14 on
hub 0
[    2.316734] amdgpu 0000:0c:00.0: ring 11(sdma0) uses VM inv eng 15 on hu=
b 0
[    2.316735] amdgpu 0000:0c:00.0: ring 12(sdma1) uses VM inv eng 16 on hu=
b 0
[    2.316735] amdgpu 0000:0c:00.0: ring 13(vcn_dec) uses VM inv eng 4 on h=
ub 1
[    2.316736] amdgpu 0000:0c:00.0: ring 14(vcn_enc0) uses VM inv eng 5 on =
hub
1
[    2.316737] amdgpu 0000:0c:00.0: ring 15(vcn_enc1) uses VM inv eng 6 on =
hub
1
[    2.316737] amdgpu 0000:0c:00.0: ring 16(vcn_jpeg) uses VM inv eng 7 on =
hub
1
[    2.316923] [drm] Initialized amdgpu 3.34.0 20150101 for 0000:0c:00.0 on
minor 0
[28830.279521] amdgpu 0000:0c:00.0: vgaarb: changed VGA decodes:
olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem

So if someone can give me any hint regarding a possible solution or somethi=
ng
to try out I would be very thankful :-) Power isn't that cheap in Germany ;=
-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667225950.Ab7690.13873
Date: Sun, 25 Aug 2019 08:43:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">111482</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Sapphire Pulse RX 5700 XT power consumption
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>freedesktop&#64;postfach.xyz
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi!

I'm mainly referring to this thread in Archlinux forum:
<a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D247667">https://bbs=
.archlinux.org/viewtopic.php?id=3D247667</a>

I have a Sapphire Pulse RX 5700 XT and with the help of the thread above I
managed to get it working. The card is not using the AMD reference
implementation so it's one of the newer vendor custom design cards.

I currently have installed this software stack:

- local/linux-amd-staging-drm-next-git 5.4.857545.b4d857ded1c5-1 (which is
basically this one
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4-=
2019-08-23">https://cgit.freedesktop.org/~agd5f/linux/tag/?h=3Ddrm-next-5.4=
-2019-08-23</a> as I
modified PKGBUILD accordingly)=20
- aur/llvm-minimal-git 10.0.0_r324774.c310e5a7ab6-1
- aur/mesa-git 19.2.0_devel.114565.b2839193987-1
- firmware 2019-08-21 from <a href=3D"https://people.freedesktop.org/~agd5f=
/r">https://people.freedesktop.org/~agd5f/r</a> =E2=80=A6 de/navi10/
- core/amd-ucode 20190815.07b925b-1

Everything regarding power consumption is perfect as long as I stay in cons=
ole.
I've also Kernel Mode Setting (KMS) enabled. Executing &quot;sensors&quot; =
command I get
this output ATM (it varies a little bit of course but basically stays around
this values):

&quot;&quot;&quot;
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:        168 RPM  (min =3D    0 RPM, max =3D 4950 RPM)
edge:         +42.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                       (emerg =3D +80000.0=C2=B0C)
junction:     +43.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
mem:          +50.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
power1:        8.00 W  (cap =3D 180.00 W)
&quot;&quot;&quot;

So according to this output the card uses 8 W in idle mode which is what I'm
expecting (also no card fans are spinning which is great). Now if I start K=
DE
Plasma 5 with OpenGL 3.1 backend this changes:

&quot;&quot;&quot;
amdgpu-pci-0c00
Adapter: PCI adapter
vddgfx:       +0.72 V=20=20
fan1:         530 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +51.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
junction:     +53.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
mem:          +62.0=C2=B0C  (crit =3D +99.0=C2=B0C, hyst =3D -273.1=C2=B0C)
                       (emerg =3D +99.0=C2=B0C)
power1:       32.00 W  (cap =3D 180.00 W)

asus-isa-0000
Adapter: ISA adapter
cpu_fan:        0 RPM
&quot;&quot;&quot;

Now I have a power consumption around 32 W just by launching KDE Plasma. I
didn't start anything else. Having a look at my power meter it's even more =
then
32 W which &quot;sensors&quot; is reporting (more like 40 W).

Another user in the thread mentioned above reported that for him the power
consumption stays at 8 W even when KDE is running. There is only one
difference: He has a card with the AMD reference design and I've a custom
design card from Sapphire. So I can only suspect that there is some differe=
nce
in the power play implementation. My card also has two different BIOSes and=
 I
tried both but there is no difference regarding power consumption. The moni=
tor
is connected via DisplayPort if this is of any interest. And here is my &qu=
ot;dmesg&quot;
output (grepped for &quot;amdgpu&quot;):

[    1.266205] [drm] amdgpu kernel modesetting enabled.
[    1.266320] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -&gt; 0xefffffff
[    1.266320] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xf0000000 -&gt; 0xf01fffff
[    1.266321] amdgpu 0000:0c:00.0: remove_conflicting_pci_framebuffers: ba=
r 5:
0xf6c00000 -&gt; 0xf6c7ffff
[    1.266322] fb0: switching to amdgpudrmfb from EFI VGA
[    1.266374] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[    1.291100] amdgpu 0000:0c:00.0: No more image in the PCI ROM
[    1.291132] amdgpu 0000:0c:00.0: VRAM: 8176M 0x0000008000000000 -
0x00000081FEFFFFFF (8176M used)
[    1.291133] amdgpu 0000:0c:00.0: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[    1.291191] [drm] amdgpu: 8176M of VRAM memory ready
[    1.291192] [drm] amdgpu: 8176M of GTT memory ready.
[    2.031317] amdgpu: [powerplay] SMU is initialized successfully!
[    2.196969] fbcon: amdgpudrmfb (fb0) is primary device
[    2.302436] amdgpu 0000:0c:00.0: fb0: amdgpudrmfb frame buffer device
[    2.316727] amdgpu 0000:0c:00.0: ring 0(gfx_0.0.0) uses VM inv eng 4 on =
hub
0
[    2.316728] amdgpu 0000:0c:00.0: ring 1(gfx_0.1.0) uses VM inv eng 5 on =
hub
0
[    2.316728] amdgpu 0000:0c:00.0: ring 2(comp_1.0.0) uses VM inv eng 6 on=
 hub
0
[    2.316729] amdgpu 0000:0c:00.0: ring 3(comp_1.1.0) uses VM inv eng 7 on=
 hub
0
[    2.316729] amdgpu 0000:0c:00.0: ring 4(comp_1.2.0) uses VM inv eng 8 on=
 hub
0
[    2.316730] amdgpu 0000:0c:00.0: ring 5(comp_1.3.0) uses VM inv eng 9 on=
 hub
0
[    2.316731] amdgpu 0000:0c:00.0: ring 6(comp_1.0.1) uses VM inv eng 10 on
hub 0
[    2.316731] amdgpu 0000:0c:00.0: ring 7(comp_1.1.1) uses VM inv eng 11 on
hub 0
[    2.316732] amdgpu 0000:0c:00.0: ring 8(comp_1.2.1) uses VM inv eng 12 on
hub 0
[    2.316733] amdgpu 0000:0c:00.0: ring 9(comp_1.3.1) uses VM inv eng 13 on
hub 0
[    2.316733] amdgpu 0000:0c:00.0: ring 10(kiq_2.1.0) uses VM inv eng 14 on
hub 0
[    2.316734] amdgpu 0000:0c:00.0: ring 11(sdma0) uses VM inv eng 15 on hu=
b 0
[    2.316735] amdgpu 0000:0c:00.0: ring 12(sdma1) uses VM inv eng 16 on hu=
b 0
[    2.316735] amdgpu 0000:0c:00.0: ring 13(vcn_dec) uses VM inv eng 4 on h=
ub 1
[    2.316736] amdgpu 0000:0c:00.0: ring 14(vcn_enc0) uses VM inv eng 5 on =
hub
1
[    2.316737] amdgpu 0000:0c:00.0: ring 15(vcn_enc1) uses VM inv eng 6 on =
hub
1
[    2.316737] amdgpu 0000:0c:00.0: ring 16(vcn_jpeg) uses VM inv eng 7 on =
hub
1
[    2.316923] [drm] Initialized amdgpu 3.34.0 20150101 for 0000:0c:00.0 on
minor 0
[28830.279521] amdgpu 0000:0c:00.0: vgaarb: changed VGA decodes:
olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem

So if someone can give me any hint regarding a possible solution or somethi=
ng
to try out I would be very thankful :-) Power isn't that cheap in Germany ;=
-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667225950.Ab7690.13873--

--===============1194938944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1194938944==--
