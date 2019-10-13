Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78C5D54AC
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 07:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886566E10D;
	Sun, 13 Oct 2019 05:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D91D6E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 05:13:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 738237296E; Sun, 13 Oct 2019 05:13:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 05:13:11 +0000
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
Message-ID: <bug-111987-502-JQ4uRaPzfa@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0127694100=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0127694100==
Content-Type: multipart/alternative; boundary="15709435910.Ba4F.30052"
Content-Transfer-Encoding: 7bit


--15709435910.Ba4F.30052
Date: Sun, 13 Oct 2019 05:13:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #5 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> -=
--
# cat /sys/kernel/debug/dri/0/amdgpu_firmware_info=20
VCE feature version: 0, firmware version: 0x37020300
UVD feature version: 0, firmware version: 0x015b0c00
MC feature version: 0, firmware version: 0x00000000
ME feature version: 49, firmware version: 0x000000a7
PFP feature version: 49, firmware version: 0x000000fd
CE feature version: 49, firmware version: 0x0000008c
RLC feature version: 1, firmware version: 0x000000d6
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
MEC feature version: 49, firmware version: 0x000002d9
MEC2 feature version: 49, firmware version: 0x000002d9
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 0, firmware version: 0x00000000
TA XGMI feature version: 0, firmware version: 0x00000000
TA RAS feature version: 0, firmware version: 0x00000000
SMC feature version: 0, firmware version: 0x00161000
SDMA0 feature version: 31, firmware version: 0x00000022
SDMA1 feature version: 0, firmware version: 0x00000022
VCN feature version: 0, firmware version: 0x00000000
DMCU feature version: 0, firmware version: 0x00000000
VBIOS version: 113-C8800100-102
#

ii  firmware-amd-graphics                                       20190717-2=
=20=20=20=20=20
                      all          Binary firmware for AMD/ATI graphics chi=
ps


Some pieces from dmesg:

Oct 10 16:33:44 localhost kernel: [    1.421938] [drm] amdgpu kernel
modesetting enabled.
Oct 10 16:33:44 localhost kernel: [    1.421996] Parsing CRAT table with 2
nodes
Oct 10 16:33:44 localhost kernel: [    1.422003] Ignoring ACPI CRAT on non-=
APU
system
Oct 10 16:33:44 localhost kernel: [    1.422005] Virtual CRAT table created=
 for
CPU
Oct 10 16:33:44 localhost kernel: [    1.422006] Parsing CRAT table with 2
nodes
Oct 10 16:33:44 localhost kernel: [    1.422007] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.422020] Topology: Add CPU node
Oct 10 16:33:44 localhost kernel: [    1.422020] Finished initializing topo=
logy
Oct 10 16:33:44 localhost kernel: [    1.422178] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0x80000000 -> 0x8fffffff
Oct 10 16:33:44 localhost kernel: [    1.422180] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0x90000000 -> 0x901fffff
Oct 10 16:33:44 localhost kernel: [    1.422181] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0x9f800000 -> 0x9f83ffff
Oct 10 16:33:44 localhost kernel: [    1.422183] checking generic (80000000
1f0000) vs hw (80000000 10000000)
Oct 10 16:33:44 localhost kernel: [    1.422184] fb0: switching to amdgpudr=
mfb
from EFI VGA
Oct 10 16:33:44 localhost kernel: [    1.422209] Console: switching to colo=
ur
dummy device 80x25
Oct 10 16:33:44 localhost kernel: [    1.422284] amdgpu 0000:43:00.0: vgaar=
b:
deactivate vga console
Oct 10 16:33:44 localhost kernel: [    1.422549] [drm] initializing kernel
modesetting (FIJI 0x1002:0x7300 0x1002:0x0B36 0xC8).
Oct 10 16:33:44 localhost kernel: [    1.422563] [drm] register mmio base:
0x9F800000
Oct 10 16:33:44 localhost kernel: [    1.422563] [drm] register mmio size:
262144
Oct 10 16:33:44 localhost kernel: [    1.422573] [drm] add ip block number 0
<vi_common>
Oct 10 16:33:44 localhost kernel: [    1.422573] [drm] add ip block number 1
<gmc_v8_0>
Oct 10 16:33:44 localhost kernel: [    1.422574] [drm] add ip block number 2
<tonga_ih>
Oct 10 16:33:44 localhost kernel: [    1.422575] [drm] add ip block number 3
<gfx_v8_0>
Oct 10 16:33:44 localhost kernel: [    1.422576] [drm] add ip block number 4
<sdma_v3_0>
Oct 10 16:33:44 localhost kernel: [    1.422577] [drm] add ip block number 5
<powerplay>
Oct 10 16:33:44 localhost kernel: [    1.422578] [drm] add ip block number 6
<dm>
Oct 10 16:33:44 localhost kernel: [    1.422579] [drm] add ip block number 7
<uvd_v6_0>
Oct 10 16:33:44 localhost kernel: [    1.422579] [drm] add ip block number 8
<vce_v3_0>
Oct 10 16:33:44 localhost kernel: [    1.422594] [drm] UVD is enabled in
physical mode
Oct 10 16:33:44 localhost kernel: [    1.422595] [drm] VCE enabled in physi=
cal
mode
Oct 10 16:33:44 localhost kernel: [    1.424046] ATOM BIOS: 113-C8800100-102
Oct 10 16:33:44 localhost kernel: [    1.424070] [drm] RAS INFO: ras
initialized successfully, hardware ability[0] ras_mask[0]
Oct 10 16:33:44 localhost kernel: [    1.424073] [drm] vm size is 512 GB, 2
levels, block size is 10-bit, fragment size is 9-bit
Oct 10 16:33:44 localhost kernel: [    1.424080] amdgpu 0000:43:00.0: VRAM:
4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
Oct 10 16:33:44 localhost kernel: [    1.424081] amdgpu 0000:43:00.0: GART:
1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
Oct 10 16:33:44 localhost kernel: [    1.424085] [drm] Detected VRAM RAM=3D=
4096M,
BAR=3D256M
Oct 10 16:33:44 localhost kernel: [    1.424086] [drm] RAM width 512bits HBM
Oct 10 16:33:44 localhost kernel: [    1.424126] [TTM] Zone  kernel: Availa=
ble
graphics memory: 65980746 KiB
Oct 10 16:33:44 localhost kernel: [    1.424126] [TTM] Zone   dma32: Availa=
ble
graphics memory: 2097152 KiB
Oct 10 16:33:44 localhost kernel: [    1.424127] [TTM] Initializing pool
allocator
Oct 10 16:33:44 localhost kernel: [    1.424129] [TTM] Initializing DMA pool
allocator
Oct 10 16:33:44 localhost kernel: [    1.424158] [drm] amdgpu: 4096M of VRAM
memory ready
Oct 10 16:33:44 localhost kernel: [    1.424160] [drm] amdgpu: 4096M of GTT
memory ready.
Oct 10 16:33:44 localhost kernel: [    1.424173] [drm] GART: num cpu pages
262144, num gpu pages 262144
Oct 10 16:33:44 localhost kernel: [    1.424227] [drm] PCIE GART of 1024M
enabled (table at 0x000000F4001D5000).
Oct 10 16:33:44 localhost kernel: [    1.424307] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_pfp.bin
Oct 10 16:33:44 localhost kernel: [    1.424318] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_me.bin
Oct 10 16:33:44 localhost kernel: [    1.424328] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_ce.bin
Oct 10 16:33:44 localhost kernel: [    1.424329] [drm] Chained IB support
enabled!
Oct 10 16:33:44 localhost kernel: [    1.424340] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_rlc.bin
Oct 10 16:33:44 localhost kernel: [    1.424404] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_mec.bin
Oct 10 16:33:44 localhost kernel: [    1.424450] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_mec2.bin
Oct 10 16:33:44 localhost kernel: [    1.425016] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_sdma.bin
Oct 10 16:33:44 localhost kernel: [    1.425026] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_sdma1.bin
Oct 10 16:33:44 localhost kernel: [    1.425135] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_uvd.bin
Oct 10 16:33:44 localhost kernel: [    1.425136] [drm] Found UVD firmware
Version: 1.91 Family ID: 12
Oct 10 16:33:44 localhost kernel: [    1.425138] [drm] UVD ENC is disabled
Oct 10 16:33:44 localhost kernel: [    1.425579] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_vce.bin
Oct 10 16:33:44 localhost kernel: [    1.425580] [drm] Found VCE firmware
Version: 55.2 Binary ID: 3
Oct 10 16:33:44 localhost kernel: [    1.425851] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_smc.bin
...
Oct 10 16:33:44 localhost kernel: [    1.496480] [drm] Display Core initial=
ized
with v3.2.27!
Oct 10 16:33:44 localhost kernel: [    1.524874] nvme nvme0: Shutdown timeo=
ut
set to 8 seconds
Oct 10 16:33:44 localhost kernel: [    1.526321] [drm] Supports vblank
timestamp caching Rev 2 (21.10.2013).
Oct 10 16:33:44 localhost kernel: [    1.526322] [drm] Driver supports prec=
ise
vblank timestamp query.
Oct 10 16:33:44 localhost kernel: [    1.547155] nvme nvme0: 32/0/0
default/read/poll queues
Oct 10 16:33:44 localhost kernel: [    1.552924] [drm] UVD initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.653044] [drm] VCE initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.654424] kfd kfd: Allocated 3969056
bytes on gart
Oct 10 16:33:44 localhost kernel: [    1.654436] Virtual CRAT table created=
 for
GPU
Oct 10 16:33:44 localhost kernel: [    1.654437] Parsing CRAT table with 1
nodes
Oct 10 16:33:44 localhost kernel: [    1.654448] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.654548] Topology: Add dGPU node
[0x7300:0x1002]
Oct 10 16:33:44 localhost kernel: [    1.654640] kfd kfd: added device
1002:7300
Oct 10 16:33:44 localhost kernel: [    1.656602] [drm] fb mappable at
0x8086B000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] vram apper at 0x8000=
0000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] size 16384000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] fb depth is 24
Oct 10 16:33:44 localhost kernel: [    1.656604] [drm]    pitch is 10240
Oct 10 16:33:44 localhost kernel: [    1.656646] fbcon: amdgpudrmfb (fb0) is
primary device
Oct 10 16:33:44 localhost kernel: [    1.678003] Console: switching to colo=
ur
frame buffer device 320x100
Oct 10 16:33:44 localhost kernel: [    1.695638] amdgpu 0000:43:00.0: fb0:
amdgpudrmfb frame buffer device
Oct 10 16:33:44 localhost kernel: [    1.704979] [drm] Initialized amdgpu
3.32.0 20150101 for 0000:43:00.0 on minor 0
...
Oct 10 16:33:44 localhost kernel: [    1.483252] [drm]
dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS wi=
th
error code 4!
...
Oct 10 16:33:44 localhost kernel: [    1.496480] [drm] Display Core initial=
ized
with v3.2.27!
Oct 10 16:33:44 localhost kernel: [    1.524874] nvme nvme0: Shutdown timeo=
ut
set to 8 seconds
Oct 10 16:33:44 localhost kernel: [    1.526321] [drm] Supports vblank
timestamp caching Rev 2 (21.10.2013).
Oct 10 16:33:44 localhost kernel: [    1.526322] [drm] Driver supports prec=
ise
vblank timestamp query.
Oct 10 16:33:44 localhost kernel: [    1.547155] nvme nvme0: 32/0/0
default/read/poll queues
Oct 10 16:33:44 localhost kernel: [    1.552924] [drm] UVD initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.653044] [drm] VCE initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.654424] kfd kfd: Allocated 3969056
bytes on gart
Oct 10 16:33:44 localhost kernel: [    1.654436] Virtual CRAT table created=
 for
GPU
Oct 10 16:33:44 localhost kernel: [    1.654437] Parsing CRAT table with 1
nodes
Oct 10 16:33:44 localhost kernel: [    1.654448] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.654548] Topology: Add dGPU node
[0x7300:0x1002]
Oct 10 16:33:44 localhost kernel: [    1.654640] kfd kfd: added device
1002:7300
Oct 10 16:33:44 localhost kernel: [    1.656602] [drm] fb mappable at
0x8086B000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] vram apper at 0x8000=
0000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] size 16384000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] fb depth is 24
Oct 10 16:33:44 localhost kernel: [    1.656604] [drm]    pitch is 10240
Oct 10 16:33:44 localhost kernel: [    1.656646] fbcon: amdgpudrmfb (fb0) is
primary device
Oct 10 16:33:44 localhost kernel: [    1.678003] Console: switching to colo=
ur
frame buffer device 320x100
Oct 10 16:33:44 localhost kernel: [    1.695638] amdgpu 0000:43:00.0: fb0:
amdgpudrmfb frame buffer device
Oct 10 16:33:44 localhost kernel: [    1.704979] [drm] Initialized amdgpu
3.32.0 20150101 for 0000:43:00.0 on minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709435910.Ba4F.30052
Date: Sun, 13 Oct 2019 05:13:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c5">Commen=
t # 5</a>
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
        <pre># cat /sys/kernel/debug/dri/0/amdgpu_firmware_info=20
VCE feature version: 0, firmware version: 0x37020300
UVD feature version: 0, firmware version: 0x015b0c00
MC feature version: 0, firmware version: 0x00000000
ME feature version: 49, firmware version: 0x000000a7
PFP feature version: 49, firmware version: 0x000000fd
CE feature version: 49, firmware version: 0x0000008c
RLC feature version: 1, firmware version: 0x000000d6
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
MEC feature version: 49, firmware version: 0x000002d9
MEC2 feature version: 49, firmware version: 0x000002d9
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 0, firmware version: 0x00000000
TA XGMI feature version: 0, firmware version: 0x00000000
TA RAS feature version: 0, firmware version: 0x00000000
SMC feature version: 0, firmware version: 0x00161000
SDMA0 feature version: 31, firmware version: 0x00000022
SDMA1 feature version: 0, firmware version: 0x00000022
VCN feature version: 0, firmware version: 0x00000000
DMCU feature version: 0, firmware version: 0x00000000
VBIOS version: 113-C8800100-102
#

ii  firmware-amd-graphics                                       20190717-2=
=20=20=20=20=20
                      all          Binary firmware for AMD/ATI graphics chi=
ps


Some pieces from dmesg:

Oct 10 16:33:44 localhost kernel: [    1.421938] [drm] amdgpu kernel
modesetting enabled.
Oct 10 16:33:44 localhost kernel: [    1.421996] Parsing CRAT table with 2
nodes
Oct 10 16:33:44 localhost kernel: [    1.422003] Ignoring ACPI CRAT on non-=
APU
system
Oct 10 16:33:44 localhost kernel: [    1.422005] Virtual CRAT table created=
 for
CPU
Oct 10 16:33:44 localhost kernel: [    1.422006] Parsing CRAT table with 2
nodes
Oct 10 16:33:44 localhost kernel: [    1.422007] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.422020] Topology: Add CPU node
Oct 10 16:33:44 localhost kernel: [    1.422020] Finished initializing topo=
logy
Oct 10 16:33:44 localhost kernel: [    1.422178] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0x80000000 -&gt; 0x8fffffff
Oct 10 16:33:44 localhost kernel: [    1.422180] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0x90000000 -&gt; 0x901fffff
Oct 10 16:33:44 localhost kernel: [    1.422181] amdgpu 0000:43:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0x9f800000 -&gt; 0x9f83ffff
Oct 10 16:33:44 localhost kernel: [    1.422183] checking generic (80000000
1f0000) vs hw (80000000 10000000)
Oct 10 16:33:44 localhost kernel: [    1.422184] fb0: switching to amdgpudr=
mfb
from EFI VGA
Oct 10 16:33:44 localhost kernel: [    1.422209] Console: switching to colo=
ur
dummy device 80x25
Oct 10 16:33:44 localhost kernel: [    1.422284] amdgpu 0000:43:00.0: vgaar=
b:
deactivate vga console
Oct 10 16:33:44 localhost kernel: [    1.422549] [drm] initializing kernel
modesetting (FIJI 0x1002:0x7300 0x1002:0x0B36 0xC8).
Oct 10 16:33:44 localhost kernel: [    1.422563] [drm] register mmio base:
0x9F800000
Oct 10 16:33:44 localhost kernel: [    1.422563] [drm] register mmio size:
262144
Oct 10 16:33:44 localhost kernel: [    1.422573] [drm] add ip block number 0
&lt;vi_common&gt;
Oct 10 16:33:44 localhost kernel: [    1.422573] [drm] add ip block number 1
&lt;gmc_v8_0&gt;
Oct 10 16:33:44 localhost kernel: [    1.422574] [drm] add ip block number 2
&lt;tonga_ih&gt;
Oct 10 16:33:44 localhost kernel: [    1.422575] [drm] add ip block number 3
&lt;gfx_v8_0&gt;
Oct 10 16:33:44 localhost kernel: [    1.422576] [drm] add ip block number 4
&lt;sdma_v3_0&gt;
Oct 10 16:33:44 localhost kernel: [    1.422577] [drm] add ip block number 5
&lt;powerplay&gt;
Oct 10 16:33:44 localhost kernel: [    1.422578] [drm] add ip block number 6
&lt;dm&gt;
Oct 10 16:33:44 localhost kernel: [    1.422579] [drm] add ip block number 7
&lt;uvd_v6_0&gt;
Oct 10 16:33:44 localhost kernel: [    1.422579] [drm] add ip block number 8
&lt;vce_v3_0&gt;
Oct 10 16:33:44 localhost kernel: [    1.422594] [drm] UVD is enabled in
physical mode
Oct 10 16:33:44 localhost kernel: [    1.422595] [drm] VCE enabled in physi=
cal
mode
Oct 10 16:33:44 localhost kernel: [    1.424046] ATOM BIOS: 113-C8800100-102
Oct 10 16:33:44 localhost kernel: [    1.424070] [drm] RAS INFO: ras
initialized successfully, hardware ability[0] ras_mask[0]
Oct 10 16:33:44 localhost kernel: [    1.424073] [drm] vm size is 512 GB, 2
levels, block size is 10-bit, fragment size is 9-bit
Oct 10 16:33:44 localhost kernel: [    1.424080] amdgpu 0000:43:00.0: VRAM:
4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
Oct 10 16:33:44 localhost kernel: [    1.424081] amdgpu 0000:43:00.0: GART:
1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
Oct 10 16:33:44 localhost kernel: [    1.424085] [drm] Detected VRAM RAM=3D=
4096M,
BAR=3D256M
Oct 10 16:33:44 localhost kernel: [    1.424086] [drm] RAM width 512bits HBM
Oct 10 16:33:44 localhost kernel: [    1.424126] [TTM] Zone  kernel: Availa=
ble
graphics memory: 65980746 KiB
Oct 10 16:33:44 localhost kernel: [    1.424126] [TTM] Zone   dma32: Availa=
ble
graphics memory: 2097152 KiB
Oct 10 16:33:44 localhost kernel: [    1.424127] [TTM] Initializing pool
allocator
Oct 10 16:33:44 localhost kernel: [    1.424129] [TTM] Initializing DMA pool
allocator
Oct 10 16:33:44 localhost kernel: [    1.424158] [drm] amdgpu: 4096M of VRAM
memory ready
Oct 10 16:33:44 localhost kernel: [    1.424160] [drm] amdgpu: 4096M of GTT
memory ready.
Oct 10 16:33:44 localhost kernel: [    1.424173] [drm] GART: num cpu pages
262144, num gpu pages 262144
Oct 10 16:33:44 localhost kernel: [    1.424227] [drm] PCIE GART of 1024M
enabled (table at 0x000000F4001D5000).
Oct 10 16:33:44 localhost kernel: [    1.424307] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_pfp.bin
Oct 10 16:33:44 localhost kernel: [    1.424318] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_me.bin
Oct 10 16:33:44 localhost kernel: [    1.424328] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_ce.bin
Oct 10 16:33:44 localhost kernel: [    1.424329] [drm] Chained IB support
enabled!
Oct 10 16:33:44 localhost kernel: [    1.424340] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_rlc.bin
Oct 10 16:33:44 localhost kernel: [    1.424404] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_mec.bin
Oct 10 16:33:44 localhost kernel: [    1.424450] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_mec2.bin
Oct 10 16:33:44 localhost kernel: [    1.425016] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_sdma.bin
Oct 10 16:33:44 localhost kernel: [    1.425026] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_sdma1.bin
Oct 10 16:33:44 localhost kernel: [    1.425135] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_uvd.bin
Oct 10 16:33:44 localhost kernel: [    1.425136] [drm] Found UVD firmware
Version: 1.91 Family ID: 12
Oct 10 16:33:44 localhost kernel: [    1.425138] [drm] UVD ENC is disabled
Oct 10 16:33:44 localhost kernel: [    1.425579] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_vce.bin
Oct 10 16:33:44 localhost kernel: [    1.425580] [drm] Found VCE firmware
Version: 55.2 Binary ID: 3
Oct 10 16:33:44 localhost kernel: [    1.425851] amdgpu 0000:43:00.0: firmw=
are:
direct-loading firmware amdgpu/fiji_smc.bin
...
Oct 10 16:33:44 localhost kernel: [    1.496480] [drm] Display Core initial=
ized
with v3.2.27!
Oct 10 16:33:44 localhost kernel: [    1.524874] nvme nvme0: Shutdown timeo=
ut
set to 8 seconds
Oct 10 16:33:44 localhost kernel: [    1.526321] [drm] Supports vblank
timestamp caching Rev 2 (21.10.2013).
Oct 10 16:33:44 localhost kernel: [    1.526322] [drm] Driver supports prec=
ise
vblank timestamp query.
Oct 10 16:33:44 localhost kernel: [    1.547155] nvme nvme0: 32/0/0
default/read/poll queues
Oct 10 16:33:44 localhost kernel: [    1.552924] [drm] UVD initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.653044] [drm] VCE initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.654424] kfd kfd: Allocated 3969056
bytes on gart
Oct 10 16:33:44 localhost kernel: [    1.654436] Virtual CRAT table created=
 for
GPU
Oct 10 16:33:44 localhost kernel: [    1.654437] Parsing CRAT table with 1
nodes
Oct 10 16:33:44 localhost kernel: [    1.654448] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.654548] Topology: Add dGPU node
[0x7300:0x1002]
Oct 10 16:33:44 localhost kernel: [    1.654640] kfd kfd: added device
1002:7300
Oct 10 16:33:44 localhost kernel: [    1.656602] [drm] fb mappable at
0x8086B000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] vram apper at 0x8000=
0000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] size 16384000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] fb depth is 24
Oct 10 16:33:44 localhost kernel: [    1.656604] [drm]    pitch is 10240
Oct 10 16:33:44 localhost kernel: [    1.656646] fbcon: amdgpudrmfb (fb0) is
primary device
Oct 10 16:33:44 localhost kernel: [    1.678003] Console: switching to colo=
ur
frame buffer device 320x100
Oct 10 16:33:44 localhost kernel: [    1.695638] amdgpu 0000:43:00.0: fb0:
amdgpudrmfb frame buffer device
Oct 10 16:33:44 localhost kernel: [    1.704979] [drm] Initialized amdgpu
3.32.0 20150101 for 0000:43:00.0 on minor 0
...
Oct 10 16:33:44 localhost kernel: [    1.483252] [drm]
dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS wi=
th
error code 4!
...
Oct 10 16:33:44 localhost kernel: [    1.496480] [drm] Display Core initial=
ized
with v3.2.27!
Oct 10 16:33:44 localhost kernel: [    1.524874] nvme nvme0: Shutdown timeo=
ut
set to 8 seconds
Oct 10 16:33:44 localhost kernel: [    1.526321] [drm] Supports vblank
timestamp caching Rev 2 (21.10.2013).
Oct 10 16:33:44 localhost kernel: [    1.526322] [drm] Driver supports prec=
ise
vblank timestamp query.
Oct 10 16:33:44 localhost kernel: [    1.547155] nvme nvme0: 32/0/0
default/read/poll queues
Oct 10 16:33:44 localhost kernel: [    1.552924] [drm] UVD initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.653044] [drm] VCE initialized
successfully.
Oct 10 16:33:44 localhost kernel: [    1.654424] kfd kfd: Allocated 3969056
bytes on gart
Oct 10 16:33:44 localhost kernel: [    1.654436] Virtual CRAT table created=
 for
GPU
Oct 10 16:33:44 localhost kernel: [    1.654437] Parsing CRAT table with 1
nodes
Oct 10 16:33:44 localhost kernel: [    1.654448] Creating topology SYSFS
entries
Oct 10 16:33:44 localhost kernel: [    1.654548] Topology: Add dGPU node
[0x7300:0x1002]
Oct 10 16:33:44 localhost kernel: [    1.654640] kfd kfd: added device
1002:7300
Oct 10 16:33:44 localhost kernel: [    1.656602] [drm] fb mappable at
0x8086B000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] vram apper at 0x8000=
0000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] size 16384000
Oct 10 16:33:44 localhost kernel: [    1.656603] [drm] fb depth is 24
Oct 10 16:33:44 localhost kernel: [    1.656604] [drm]    pitch is 10240
Oct 10 16:33:44 localhost kernel: [    1.656646] fbcon: amdgpudrmfb (fb0) is
primary device
Oct 10 16:33:44 localhost kernel: [    1.678003] Console: switching to colo=
ur
frame buffer device 320x100
Oct 10 16:33:44 localhost kernel: [    1.695638] amdgpu 0000:43:00.0: fb0:
amdgpudrmfb frame buffer device
Oct 10 16:33:44 localhost kernel: [    1.704979] [drm] Initialized amdgpu
3.32.0 20150101 for 0000:43:00.0 on minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709435910.Ba4F.30052--

--===============0127694100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0127694100==--
