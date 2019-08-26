Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D709D72A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7236E2F3;
	Mon, 26 Aug 2019 20:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E26E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:03:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 09FB672161; Mon, 26 Aug 2019 20:03:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111492] HDMI audio is unavailable with amdgpu on R9 270
Date: Mon, 26 Aug 2019 20:03:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: marti@juffo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111492-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1967931652=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1967931652==
Content-Type: multipart/alternative; boundary="15668498060.D7b15d70.22540"
Content-Transfer-Encoding: 7bit


--15668498060.D7b15d70.22540
Date: Mon, 26 Aug 2019 20:03:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111492

            Bug ID: 111492
           Summary: HDMI audio is unavailable with amdgpu on R9 270
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: marti@juffo.org

Video card: ASUS Radeon R9 270
Kernel: 5.2.9-arch1-1-ARCH

I recently had some issues with the "radeon" driver and discovered that the
"amdgpu" driver now has support for Southern Islands (SI) GPUs using the
amdgpu.si_support=3D1 boot flag.

Graphics stuff works great with amdgpu so far, however, all HDMI audio outp=
uts
are marked as "(unplugged) (unavailable)" in the pavuctl utility.

Someone else's screenshot with similar issue: https://i.imgur.com/67HYPG3.p=
ng
Initially this issue seemed related to bug 107835, but Alex Deucher said th=
at's
not the case.

alsa-info.sh debug dump uploaded to:
http://alsa-project.org/db/?f=3Dbd09f9bd5cdadc129852d2f4487aec9f22d9b915



There is nothing in kernel logs to indicate issues. Grepping for relevant
keywords in dmesg gives this:

[    0.145413] Kernel command line: initrd=3D\initramfs-linux.img
root=3DUUID=3D93067a3f-2c68-4e1a-9f3a-96cdc0221771 rw acpi_enforce_resource=
s=3Dlax
iommu=3Dpt radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.dc=3D1 radeon=
.audio=3D1
...
[    3.910423] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input4
[    3.910454] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input5
[    3.910480] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input6
[    3.910513] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input7
[    3.910547] input: HDA ATI HDMI HDMI/DP,pcm=3D10 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input8
[    3.910579] input: HDA ATI HDMI HDMI/DP,pcm=3D11 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input9
...
[    4.110170] [drm] amdgpu kernel modesetting enabled.
[    4.110310] amdgpu 0000:09:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -> 0xefffffff
[    4.110312] amdgpu 0000:09:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xfcf00000 -> 0xfcf3ffff
[    4.110313] amdgpu 0000:09:00.0: vgaarb: deactivate vga console
[    4.110485] amdgpu 0000:09:00.0: kfd not supported on this ASIC
[    4.120150] amdgpu 0000:09:00.0: No more image in the PCI ROM
[    4.121491] amdgpu 0000:09:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[    4.121492] amdgpu 0000:09:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    4.121557] [drm] amdgpu: 2048M of VRAM memory ready
[    4.121560] [drm] amdgpu: 3072M of GTT memory ready.
[    4.123745] amdgpu 0000:09:00.0: PCIE GART of 1024M enabled (table at
0x000000F400300000).
[    4.124929] [drm] amdgpu: dpm initialized
[    4.125034] [drm] AMDGPU Display Connectors
[    4.502455] fbcon: amdgpudrmfb (fb0) is primary device
[    4.779046] amdgpu 0000:09:00.0: fb0: amdgpudrmfb frame buffer device
[    5.237526] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:09:00.0 on
minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668498060.D7b15d70.22540
Date: Mon, 26 Aug 2019 20:03:26 +0000
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
   title=3D"NEW - HDMI audio is unavailable with amdgpu on R9 270"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111492">111492</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HDMI audio is unavailable with amdgpu on R9 270
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>not set
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
          <td>marti&#64;juffo.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Video card: ASUS Radeon R9 270
Kernel: 5.2.9-arch1-1-ARCH

I recently had some issues with the &quot;radeon&quot; driver and discovere=
d that the
&quot;amdgpu&quot; driver now has support for Southern Islands (SI) GPUs us=
ing the
amdgpu.si_support=3D1 boot flag.

Graphics stuff works great with amdgpu so far, however, all HDMI audio outp=
uts
are marked as &quot;(unplugged) (unavailable)&quot; in the pavuctl utility.

Someone else's screenshot with similar issue: <a href=3D"https://i.imgur.co=
m/67HYPG3.png">https://i.imgur.com/67HYPG3.png</a>
Initially this issue seemed related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DisplayPort audio stopped working in a kernel upgrade"
   href=3D"show_bug.cgi?id=3D107835">bug 107835</a>, but Alex Deucher said =
that's
not the case.

alsa-info.sh debug dump uploaded to:
<a href=3D"http://alsa-project.org/db/?f=3Dbd09f9bd5cdadc129852d2f4487aec9f=
22d9b915">http://alsa-project.org/db/?f=3Dbd09f9bd5cdadc129852d2f4487aec9f2=
2d9b915</a>



There is nothing in kernel logs to indicate issues. Grepping for relevant
keywords in dmesg gives this:

[    0.145413] Kernel command line: initrd=3D\initramfs-linux.img
root=3DUUID=3D93067a3f-2c68-4e1a-9f3a-96cdc0221771 rw acpi_enforce_resource=
s=3Dlax
iommu=3Dpt radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.dc=3D1 radeon=
.audio=3D1
...
[    3.910423] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input4
[    3.910454] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input5
[    3.910480] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input6
[    3.910513] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input7
[    3.910547] input: HDA ATI HDMI HDMI/DP,pcm=3D10 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input8
[    3.910579] input: HDA ATI HDMI HDMI/DP,pcm=3D11 as
/devices/pci0000:00/0000:00:03.1/0000:09:00.1/sound/card0/input9
...
[    4.110170] [drm] amdgpu kernel modesetting enabled.
[    4.110310] amdgpu 0000:09:00.0: remove_conflicting_pci_framebuffers: ba=
r 0:
0xe0000000 -&gt; 0xefffffff
[    4.110312] amdgpu 0000:09:00.0: remove_conflicting_pci_framebuffers: ba=
r 2:
0xfcf00000 -&gt; 0xfcf3ffff
[    4.110313] amdgpu 0000:09:00.0: vgaarb: deactivate vga console
[    4.110485] amdgpu 0000:09:00.0: kfd not supported on this ASIC
[    4.120150] amdgpu 0000:09:00.0: No more image in the PCI ROM
[    4.121491] amdgpu 0000:09:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[    4.121492] amdgpu 0000:09:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    4.121557] [drm] amdgpu: 2048M of VRAM memory ready
[    4.121560] [drm] amdgpu: 3072M of GTT memory ready.
[    4.123745] amdgpu 0000:09:00.0: PCIE GART of 1024M enabled (table at
0x000000F400300000).
[    4.124929] [drm] amdgpu: dpm initialized
[    4.125034] [drm] AMDGPU Display Connectors
[    4.502455] fbcon: amdgpudrmfb (fb0) is primary device
[    4.779046] amdgpu 0000:09:00.0: fb0: amdgpudrmfb frame buffer device
[    5.237526] [drm] Initialized amdgpu 3.32.0 20150101 for 0000:09:00.0 on
minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668498060.D7b15d70.22540--

--===============1967931652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1967931652==--
