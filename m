Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3A23C149
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4D089E52;
	Tue,  4 Aug 2020 21:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF13A89E52
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:17:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208811] AMDGPU on-load null pointer dereference
Date: Tue, 04 Aug 2020 21:17:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sid@aeam.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208811-2300-C1lUB3tqZt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208811-2300@https.bugzilla.kernel.org/>
References: <bug-208811-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208811

--- Comment #1 from R0b0t1 (sid@aeam.us) ---
5.4.48

[   77.383336] [drm] amdgpu kernel modesetting enabled.
[   77.383382] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: bar 0:
0xe0000000 -> 0xefffffff
[   77.383383] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: bar 2:
0xf0000000 -> 0xf01fffff
[   77.383384] amdgpu 0000:03:00.0: remove_conflicting_pci_framebuffers: bar 5:
0xfe700000 -> 0xfe77ffff
[   77.383385] checking generic (e0000000 7f0000) vs hw (e0000000 10000000)
[   77.383386] fb0: switching to amdgpudrmfb from EFI VGA
[   77.383521] Console: switching to colour dummy device 80x25
[   77.383557] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[   77.383604] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
[   77.383777] [drm] initializing kernel modesetting (RAVEN 0x1002:0x15D8
0x1043:0x1B71 0xC1).
[   77.383882] [drm] register mmio base: 0xFE700000
[   77.383883] [drm] register mmio size: 524288
[   77.383898] [drm] add ip block number 0 <soc15_common>
[   77.383899] [drm] add ip block number 1 <gmc_v9_0>
[   77.383900] [drm] add ip block number 2 <vega10_ih>
[   77.383900] [drm] add ip block number 3 <psp>
[   77.383901] [drm] add ip block number 4 <gfx_v9_0>
[   77.383902] [drm] add ip block number 5 <sdma_v4_0>
[   77.383902] [drm] add ip block number 6 <powerplay>
[   77.383903] [drm] add ip block number 7 <dm>
[   77.383904] [drm] add ip block number 8 <vcn_v1_0>
[   77.383921] ATOM BIOS: 113-PICASSO-116
[   77.383931] [drm] VCN decode is enabled in VM mode
[   77.383931] [drm] VCN encode is enabled in VM mode
[   77.383932] [drm] VCN jpeg decode is enabled in VM mode
[   77.383962] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[   77.383968] amdgpu 0000:03:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[   77.383970] amdgpu 0000:03:00.0: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[   77.383971] amdgpu 0000:03:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[   77.383974] [drm] Detected VRAM RAM=2048M, BAR=2048M
[   77.383975] [drm] RAM width 128bits DDR4
[   77.384061] [TTM] Zone  kernel: Available graphics memory: 7134728 KiB
[   77.384062] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   77.384062] [TTM] Initializing pool allocator
[   77.384065] [TTM] Initializing DMA pool allocator
[   77.384127] [drm] amdgpu: 2048M of VRAM memory ready
[   77.384129] [drm] amdgpu: 3072M of GTT memory ready.
[   77.384138] software IO TLB: Memory encryption is active and system is using
DMA bounce buffers
[   77.384139] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   77.385195] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[   77.393379] [drm] use_doorbell being set to: [true]
[   77.393452] amdgpu: [powerplay] hwmgr_sw_init smu backed is smu10_smu
[   77.397860] [drm] Found VCN firmware Version ENC: 1.9 DEC: 1 VEP: 0
Revision: 28
[   77.397865] [drm] PSP loading VCN firmware
[   77.431850] [drm] reserve 0x400000 from 0xf47f800000 for PSP TMR
[   77.464806] [drm] psp command failed and response status is (0x34)
[   77.467806] [drm] failed to load ucode id (0) 
[   77.467806] [drm] psp command failed and response status is (0x300F)
[   77.470808] [drm] failed to load ucode id (8) 
[   77.470808] [drm] psp command failed and response status is (0x300F)
[   77.473807] [drm] failed to load ucode id (9) 
[   77.473808] [drm] psp command failed and response status is (0x300F)
[   77.476807] [drm] failed to load ucode id (10) 
[   77.476808] [drm] psp command failed and response status is (0x300F)
[   77.479809] [drm] failed to load ucode id (11) 
[   77.479810] [drm] psp command failed and response status is (0x300F)
[   77.482808] [drm] failed to load ucode id (12) 
[   77.482808] [drm] psp command failed and response status is (0x300F)
[   77.485807] [drm] failed to load ucode id (13) 
[   77.485808] [drm] psp command failed and response status is (0x300F)
[   77.488799] [drm] failed to load ucode id (14) 
[   77.488800] [drm] psp command failed and response status is (0x300F)
[   77.491807] [drm] failed to load ucode id (17) 
[   77.491808] [drm] psp command failed and response status is (0xF)
[   77.494807] [drm] failed to load ucode id (18) 
[   77.494807] [drm] psp command failed and response status is (0x300F)
[   77.497807] [drm] failed to load ucode id (19) 
[   77.497807] [drm] psp command failed and response status is (0xF)
[   77.500808] [drm] failed to load ucode id (20) 
[   77.500809] [drm] psp command failed and response status is (0x300F)
[   77.503807] [drm] failed to load ucode id (26) 
[   77.503807] [drm] psp command failed and response status is (0x300F)
[   77.506807] [drm] failed to load ucode id (28) 
[   77.506808] [drm] psp command failed and response status is (0xF)
[   77.509807] [drm] failed to load ucode id (29) 
[   77.509808] [drm] psp command failed and response status is (0xF)
[   77.512201] amdgpu 0000:03:00.0: [gfxhub0] no-retry page fault (src_id:0
ring:221 vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.512203] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000000000 from client 27
[   77.512204] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000BBA
[   77.512205] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x0
[   77.512206] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x5
[   77.512207] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0xb
[   77.512207] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x1
[   77.512208] amdgpu 0000:03:00.0:      RW: 0x0
[   77.512265] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.512266] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.512268] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.512269] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.512270] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.512271] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.512272] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.512273] amdgpu 0000:03:00.0:      RW: 0x0
[   77.514181] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.514183] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.514184] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.514185] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.514185] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.514186] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.514187] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.514188] amdgpu 0000:03:00.0:      RW: 0x0
[   77.515233] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.515235] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.515236] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.515237] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.515238] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.515238] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.515239] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.515240] amdgpu 0000:03:00.0:      RW: 0x0
[   77.516270] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.516272] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.516273] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.516273] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.516274] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.516275] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.516276] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.516276] amdgpu 0000:03:00.0:      RW: 0x0
[   77.517321] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.517322] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.517323] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.517324] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.517324] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.517325] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.517326] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.517327] amdgpu 0000:03:00.0:      RW: 0x0
[   77.518381] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.518382] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.518383] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.518384] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.518385] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.518385] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.518386] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.518387] amdgpu 0000:03:00.0:      RW: 0x0
[   77.519430] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.519432] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.519432] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.519433] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.519434] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.519435] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.519435] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.519436] amdgpu 0000:03:00.0:      RW: 0x0
[   77.520469] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.520471] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.520472] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.520472] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.520473] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.520474] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.520474] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.520475] amdgpu 0000:03:00.0:      RW: 0x0
[   77.521524] amdgpu 0000:03:00.0: [gfxhub0] retry page fault (src_id:0 ring:0
vmid:0 pasid:0, for process  pid 0 thread  pid 0)
[   77.521525] amdgpu 0000:03:00.0:   in page starting at address
0x0000000000001000 from client 27
[   77.521526] amdgpu 0000:03:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00000A91
[   77.521527] amdgpu 0000:03:00.0:      MORE_FAULTS: 0x1
[   77.521527] amdgpu 0000:03:00.0:      WALKER_ERROR: 0x0
[   77.521528] amdgpu 0000:03:00.0:      PERMISSION_FAULTS: 0x9
[   77.521529] amdgpu 0000:03:00.0:      MAPPING_ERROR: 0x0
[   77.521529] amdgpu 0000:03:00.0:      RW: 0x0
[   77.749194] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[   77.749272] [drm:gfx_v9_0_hw_init [amdgpu]] *ERROR* KCQ enable failed
[   77.749355] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP
block <gfx_v9_0> failed -110
[   77.749356] amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
[   77.749358] amdgpu 0000:03:00.0: Fatal error during GPU init
[   77.749359] [drm] amdgpu: finishing device.
[   77.798015] ------------[ cut here ]------------
[   77.798016] Memory manager not clean during takedown.
[   77.798030] WARNING: CPU: 2 PID: 2926 at drivers/gpu/drm/drm_mm.c:939
drm_mm_takedown+0x1e/0x30
[   77.798031] Modules linked in: amdgpu(+) mfd_core gpu_sched ttm iwlmvm
kvm_amd kvm uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common videodev irqbypass ax88179_178a mc snd_hda_codec_realtek
usbnet snd_hda_codec_hdmi iwlwifi efivarfs
[   77.798043] CPU: 2 PID: 2926 Comm: modprobe Not tainted 5.4.48-gentoo #2
[   77.798044] Hardware name: ASUSTeK COMPUTER INC. ZenBook
UX434DA_UM433DA/UX434DA, BIOS UX434DA_UM433DA.302 09/05/2019
[   77.798045] RIP: 0010:drm_mm_takedown+0x1e/0x30
[   77.798047] Code: 0f 1f 84 00 00 00 00 00 0f 1f 40 00 53 48 89 fb 48 83 c3
38 48 8b 03 48 39 c3 75 02 5b c3 48 c7 c7 50 ff 2e 9b e8 3b 28 99 ff <0f> 0b 5b
c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 41 57 49 89
[   77.798048] RSP: 0018:ffffa3f2c07d7980 EFLAGS: 00010282
[   77.798049] RAX: 0000000000000000 RBX: ffff9d514a5ccc38 RCX:
0000000000000006
[   77.798050] RDX: 0000000000000007 RSI: 0000000000000086 RDI:
ffff9d5150c964d0
[   77.798051] RBP: ffff9d510a5a4f50 R08: 0000000000000001 R09:
00000000000003e5
[   77.798051] R10: 0000000000014a10 R11: 0000000000000001 R12:
ffff9d514a5ccc00
[   77.798052] R13: 0000000000000000 R14: ffff9d510a5a50c0 R15:
0000000000000170
[   77.798053] FS:  00007f8cb2a2b740(0000) GS:ffff9d5150c80000(0000)
knlGS:0000000000000000
[   77.798054] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.798054] CR2: 00007ffe84b50ff0 CR3: 00008003c9eae000 CR4:
00000000003406e0
[   77.798055] Call Trace:
[   77.798122]  amdgpu_vram_mgr_fini+0x23/0x90 [amdgpu]
[   77.798128]  ttm_bo_clean_mm+0xab/0xc0 [ttm]
[   77.798188]  amdgpu_ttm_fini+0x6e/0xc0 [amdgpu]
[   77.798249]  amdgpu_bo_fini+0xc/0x30 [amdgpu]
[   77.798314]  gmc_v9_0_sw_fini+0x11a/0x180 [amdgpu]
[   77.798376]  ? amdgpu_sa_bo_manager_fini+0x7a/0x90 [amdgpu]
[   77.798446]  amdgpu_device_fini+0x24a/0x46f [amdgpu]
[   77.798505]  amdgpu_driver_unload_kms+0x45/0x90 [amdgpu]
[   77.798575]  amdgpu_driver_load_kms.cold+0x39/0x5b [amdgpu]
[   77.798577]  drm_dev_register+0x10c/0x150
[   77.798636]  amdgpu_pci_probe+0xe9/0x150 [amdgpu]
[   77.798639]  ? __pm_runtime_resume+0x54/0x70
[   77.798642]  local_pci_probe+0x3d/0x70
[   77.798644]  pci_device_probe+0xd0/0x150
[   77.798647]  really_probe+0xd9/0x2a0
[   77.798648]  driver_probe_device+0x4b/0xc0
[   77.798649]  device_driver_attach+0x4e/0x60
[   77.798650]  __driver_attach+0x4d/0xc0
[   77.798651]  ? device_driver_attach+0x60/0x60
[   77.798654]  bus_for_each_dev+0x75/0xc0
[   77.798656]  bus_add_driver+0x172/0x1c0
[   77.798657]  driver_register+0x68/0xc0
[   77.798659]  ? 0xffffffffc04a8000
[   77.798661]  do_one_initcall+0x44/0x1df
[   77.798664]  ? _cond_resched+0x10/0x20
[   77.798667]  ? kmem_cache_alloc_trace+0x196/0x220
[   77.798669]  do_init_module+0x56/0x200
[   77.798671]  load_module+0x2380/0x2600
[   77.798674]  ? __do_sys_finit_module+0xc6/0xe0
[   77.798675]  __do_sys_finit_module+0xc6/0xe0
[   77.798677]  do_syscall_64+0x46/0x110
[   77.798678]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   77.798680] RIP: 0033:0x7f8cb2b24789
[   77.798682] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d d7 06 0c 00 f7 d8 64 89 01 48
[   77.798683] RSP: 002b:00007ffe84b54018 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   77.798684] RAX: ffffffffffffffda RBX: 000055e41a8b0a80 RCX:
00007f8cb2b24789
[   77.798684] RDX: 0000000000000000 RSI: 000055e418c14390 RDI:
0000000000000006
[   77.798685] RBP: 0000000000040000 R08: 0000000000000000 R09:
0000000000000000
[   77.798685] R10: 0000000000000006 R11: 0000000000000246 R12:
000055e418c14390
[   77.798686] R13: 0000000000000000 R14: 000055e41a8b0b00 R15:
000055e41a8b0a80
[   77.798687] ---[ end trace 3c1c3b84380fb311 ]---
[   77.798697] [TTM] Finalizing pool allocator
[   77.798700] [TTM] Finalizing DMA pool allocator
[   77.798827] [TTM] Zone  kernel: Used memory at exit: 1 KiB
[   77.798831] [TTM] Zone   dma32: Used memory at exit: 0 KiB
[   77.798833] [drm] amdgpu: ttm finalized
[   77.798851] ------------[ cut here ]------------
[   77.798852] sysfs group 'fw_version' not found for kobject '0000:03:00.0'
[   77.798860] WARNING: CPU: 2 PID: 2926 at fs/sysfs/group.c:278
sysfs_remove_group+0x70/0x80
[   77.798860] Modules linked in: amdgpu(+) mfd_core gpu_sched ttm iwlmvm
kvm_amd kvm uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
videobuf2_common videodev irqbypass ax88179_178a mc snd_hda_codec_realtek
usbnet snd_hda_codec_hdmi iwlwifi efivarfs
[   77.798868] CPU: 2 PID: 2926 Comm: modprobe Tainted: G        W        
5.4.48-gentoo #2
[   77.798869] Hardware name: ASUSTeK COMPUTER INC. ZenBook
UX434DA_UM433DA/UX434DA, BIOS UX434DA_UM433DA.302 09/05/2019
[   77.798871] RIP: 0010:sysfs_remove_group+0x70/0x80
[   77.798873] Code: ff 5b 48 89 ef 5d 41 5c e9 ed bb ff ff 48 89 ef e8 05 b9
ff ff eb cc 49 8b 14 24 48 8b 33 48 c7 c7 e0 c0 2a 9b e8 19 ad d9 ff <0f> 0b 5b
5d 41 5c c3 66 0f 1f 84 00 00 00 00 00 41 54 49 89 fc 55
[   77.798873] RSP: 0018:ffffa3f2c07d7a50 EFLAGS: 00010282
[   77.798874] RAX: 0000000000000000 RBX: ffffffffc08afbe0 RCX:
0000000000000425
[   77.798875] RDX: 0000000000000001 RSI: 0000000000000086 RDI:
ffffffff9bcc4248
[   77.798876] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000425
[   77.798877] R10: 0000000000015b24 R11: 0000000000000001 R12:
ffff9d514e5650b0
[   77.798877] R13: ffff9d510a5b4da8 R14: ffff9d5109d5cb60 R15:
0000000000000000
[   77.798878] FS:  00007f8cb2a2b740(0000) GS:ffff9d5150c80000(0000)
knlGS:0000000000000000
[   77.798880] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   77.798880] CR2: 00007ffe84b50ff0 CR3: 00008003c9eae000 CR4:
00000000003406e0
[   77.798881] Call Trace:
[   77.798979]  amdgpu_device_fini+0x43b/0x46f [amdgpu]
[   77.799062]  amdgpu_driver_unload_kms+0x45/0x90 [amdgpu]
[   77.799159]  amdgpu_driver_load_kms.cold+0x39/0x5b [amdgpu]
[   77.799162]  drm_dev_register+0x10c/0x150
[   77.799244]  amdgpu_pci_probe+0xe9/0x150 [amdgpu]
[   77.799246]  ? __pm_runtime_resume+0x54/0x70
[   77.799248]  local_pci_probe+0x3d/0x70
[   77.799250]  pci_device_probe+0xd0/0x150
[   77.799252]  really_probe+0xd9/0x2a0
[   77.799253]  driver_probe_device+0x4b/0xc0
[   77.799255]  device_driver_attach+0x4e/0x60
[   77.799256]  __driver_attach+0x4d/0xc0
[   77.799257]  ? device_driver_attach+0x60/0x60
[   77.799259]  bus_for_each_dev+0x75/0xc0
[   77.799261]  bus_add_driver+0x172/0x1c0
[   77.799263]  driver_register+0x68/0xc0
[   77.799264]  ? 0xffffffffc04a8000
[   77.799265]  do_one_initcall+0x44/0x1df
[   77.799268]  ? _cond_resched+0x10/0x20
[   77.799269]  ? kmem_cache_alloc_trace+0x196/0x220
[   77.799271]  do_init_module+0x56/0x200
[   77.799273]  load_module+0x2380/0x2600
[   77.799276]  ? __do_sys_finit_module+0xc6/0xe0
[   77.799277]  __do_sys_finit_module+0xc6/0xe0
[   77.799279]  do_syscall_64+0x46/0x110
[   77.799281]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   77.799282] RIP: 0033:0x7f8cb2b24789
[   77.799284] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d d7 06 0c 00 f7 d8 64 89 01 48
[   77.799285] RSP: 002b:00007ffe84b54018 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   77.799286] RAX: ffffffffffffffda RBX: 000055e41a8b0a80 RCX:
00007f8cb2b24789
[   77.799287] RDX: 0000000000000000 RSI: 000055e418c14390 RDI:
0000000000000006
[   77.799288] RBP: 0000000000040000 R08: 0000000000000000 R09:
0000000000000000
[   77.799289] R10: 0000000000000006 R11: 0000000000000246 R12:
000055e418c14390
[   77.799289] R13: 0000000000000000 R14: 000055e41a8b0b00 R15:
000055e41a8b0a80
[   77.799291] ---[ end trace 3c1c3b84380fb312 ]---
[   77.799529] amdgpu: probe of 0000:03:00.0 failed with error -110

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
