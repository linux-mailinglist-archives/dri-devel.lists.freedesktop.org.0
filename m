Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916933E2733
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD16B6E530;
	Fri,  6 Aug 2021 09:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4F56E530
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:27:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB0F261164
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628242068;
 bh=HMk1ug3UzGyJrYlCDmgKNd5an4tVucbUV0q+Gyfbq2o=;
 h=From:To:Subject:Date:From;
 b=FLC79hD/BkjVyorEIyTAVABlO3/fbI02Atzz7OJZFejbU9Dg6YFEMaCpE/3iaftFq
 6+YefIgsVhTZvhcQ8lR4oVtJzr2gJo7O7+XLb5LqXcPep4d+ODm/sKqUGmiLPkTUXr
 gd1sCstCkth2T2a7JMXDHervp9/JAYCnpEnf6mA4PME1HF2LsVtPWX9ziB7+H14Nor
 Odmi8gJeTG+ZAEPtKAX7T0rRJ/W/CLW44ZKtEETZrNEtyeYC5MSGP4wlI2DtTqWE3e
 zh64ZE4vPfj2Vmx2jBP9q0upSmljF4MQXDCJkkD47pEjuK0d/DkYxZjJloGFLtLbWC
 m07DzykKLaCYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9EAC460F5E; Fri,  6 Aug 2021 09:27:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] New: WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Fri, 06 Aug 2021 09:27:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213983-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

            Bug ID: 213983
           Summary: WARNING: CPU: 3 PID: 520 at
                    drivers/gpu/drm/ttm/ttm_bo.c:409
                    ttm_bo_release+0x7a/0x803 [ttm]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14-rc4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 298221
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298221&action=3Dedit
kernel dmesg (5.14-rc4, AMD A10-7860K)

System was running fine for hours but got this at reboot:

[...]
[35939.202358] ------------[ cut here ]------------
[35939.202603] WARNING: CPU: 3 PID: 520 at drivers/gpu/drm/ttm/ttm_bo.c:409
ttm_bo_release+0x7a/0x803 [ttm]
[35939.202870] Modules linked in: rfkill dm_crypt nhpoly1305_sse2 nhpoly1305
chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher
input_leds joydev led_class dm_mod hid_generic usbhid hid raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx amdgpu md_mod ev=
dev
f2fs crc32_generic lz4hc_compress lz4_compress lz4_decompress edac_mce_amd
crc32_pclmul ext4 crc16 mbcache jbd2 ohci_pci snd_hda_codec_hdmi drm_ttm_he=
lper
ttm aesni_intel snd_hda_intel mfd_core libaes crypto_simd cryptd gpu_sched
snd_intel_dspcfg i2c_algo_bit k10temp snd_hda_codec fam15h_power i2c_piix4
snd_hwdep drm_kms_helper snd_hda_core ohci_hcd cfbfillrect ehci_pci xhci_pci
xhci_hcd ehci_hcd syscopyarea cfbimgblt snd_pcm sysfillrect sysimgblt usbco=
re
fb_sys_fops snd_timer cfbcopyarea usb_common snd soundcore video acpi_cpufr=
eq
processor button zram nct6775 zsmalloc hwmon_vid hwmon drm nfsd fb fuse font
fbdev auth_rpcgss drm_panel_orientation_quirks backlight lockd grace config=
fs
sunrpc
[35939.203200]  efivarfs
[35939.205121] CPU: 3 PID: 520 Comm: X Not tainted 5.14.0-rc4-bdver3 #2
[35939.212327] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./A88M-G/3.1, BIOS P1.40C 11/21/2016
[35939.219364] RIP: 0010:ttm_bo_release+0x7a/0x803 [ttm]
[35939.219387] Code: e0 2a 48 c1 ea 03 8a 14 02 48 8b 04 24 83 e0 07 83 c0 =
03
38 d0 7c 0d 84 d2 74 09 48 8b 3c 24 e8 99 eb 7c dd 83 7b 4c 00 74 02 <0f> 0=
b 48
8d 43 18 48 89 c2 48 89 44 24 10 b8 ff ff 37 00 48 c1 ea
[35939.230367] RSP: 0018:ffffc900050dfb08 EFLAGS: 00010202
[35939.230376] RAX: 0000000000000007 RBX: ffff8881716441f0 RCX:
ffff8881716441f0
[35939.230381] RDX: 1ffff1102e2c8800 RSI: 0000000000000004 RDI:
ffff8881716441f0
[35939.230387] RBP: ffff8881716441d8 R08: 0000000000000001 R09:
ffffed102e2c883f
[35939.230391] R10: ffff8881716441f3 R11: ffffffffc0b6a201 R12:
ffff888115000010
[35939.264555] R13: ffff888115005608 R14: ffff888171644058 R15:
ffffffff9f5cf160
[35939.264564] FS:  00007fe7325f9980(0000) GS:ffff8883e0580000(0000)
knlGS:0000000000000000
[35939.264572] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[35939.264579] CR2: 00007fe73190d0e8 CR3: 0000000141978000 CR4:
00000000000506e0
[35939.264586] Call Trace:
[35939.264591]  ? fsnotify_grab_connector+0x8c/0x93
[35939.264608]  amdgpu_bo_unref+0x30/0x57 [amdgpu]
[35939.318763]  amdgpu_gem_object_free+0x69/0x95 [amdgpu]
[35939.319132]  ? list_add+0xd1/0xd1 [amdgpu]
[35939.319478]  ? test_bit+0x1d/0x27
[35939.319489]  drm_gem_dmabuf_release+0x5b/0x67 [drm]
[35939.319551]  dma_buf_release+0x113/0x1b6
[35939.319563]  __dentry_kill+0x29e/0x302
[35939.319573]  dput+0x184/0x1c3
[35939.319582]  __fput+0x4dc/0x598
[35939.319590]  task_work_run+0xfa/0x118
[35939.319599]  do_exit+0x984/0x17ba
[35939.319609]  ? mm_update_next_owner+0x3fd/0x3fd
[35939.319619]  do_group_exit+0x229/0x229
[35939.319627]  __x64_sys_exit_group+0x39/0x39
[35939.319635]  do_syscall_64+0x75/0x88
[35939.319649]  ? do_syscall_64+0xe/0x88
[35939.319658]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[35939.319668] RIP: 0033:0x7fe731edd459
[35939.319676] Code: Unable to access opcode bytes at RIP 0x7fe731edd42f.
[35939.319680] RSP: 002b:00007ffc8d3e1298 EFLAGS: 00000246 ORIG_RAX:
00000000000000e7
[35939.319691] RAX: ffffffffffffffda RBX: 00007fe731fc6920 RCX:
00007fe731edd459
[35939.319698] RDX: 000000000000003c RSI: 00000000000000e7 RDI:
0000000000000000
[35939.319704] RBP: 00007fe731fc6920 R08: fffffffffffffd40 R09:
00005630715eb7c0
[35939.319711] R10: 00007fe710db0a14 R11: 0000000000000246 R12:
0000000000000000
[35939.319716] R13: 0000000000000000 R14: 0000000000000668 R15:
0000000000000000
[35939.319724] ---[ end trace 0f92591c8b7a0f11 ]---


 # inxi -bZ
System:    Kernel: 5.14.0-rc4-bdver3 x86_64 bits: 64 Desktop: MATE 1.24.1
Distro: Gentoo Base System release 2.7=20
Machine:   Type: Desktop Mobo: ASRock model: A88M-G/3.1 serial: <superuser/=
root
required> UEFI: American Megatrends v: P1.40C=20
           date: 11/21/2016=20
CPU:       Info: Quad Core AMD A10-7860K Radeon R7 12 Compute Cores 4C+8G [=
MCP]
speed: 1560 MHz min/max: 1400/3600 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Kaveri [Radeon R7
Graphics] driver: amdgpu v: kernel=20
           Display: x11 server: X.Org 1.20.11 driver: amdgpu,ati unloaded:
fbdev,modesetting resolution: 1920x1080~60Hz=20
           OpenGL: renderer: AMD KAVERI (DRM 3.42.0 5.14.0-rc4-bdver3 LLVM
12.0.1) v: 4.6 Mesa 21.1.4=20
Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169=20
Drives:    Local Storage: total: 9.33 TiB used: 4.13 TiB (44.3%)=20
Info:      Processes: 225 Uptime: 16m Memory: 13.32 GiB used: 1.38 GiB (10.=
3%)
Shell: Bash inxi: 3.1.06=20

 # lspci -s 00:01.0 -vv
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Kaveri [Radeon R7 Graphics] (rev d6) (prog-if 00 [VGA controller])
        Subsystem: ASRock Incorporation Kaveri [Radeon R7 Graphics]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 62
        IOMMU group: 0
        Region 0: Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Region 2: Memory at d0000000 (64-bit, prefetchable) [size=3D8M]
        Region 4: I/O ports at f000 [size=3D256]
        Region 5: Memory at feb00000 (32-bit, non-prefetchable) [size=3D256=
K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA
PME(D0-,D1+,D2+,D3hot+,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v2) Root Complex Integrated Endpoint, M=
SI
00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag+ RBE+ FLReset-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-
NROPrPrP- LTR-
                         10BitTagComp- 10BitTagReq- OBFF Not Supported, Ext=
Fmt+
EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee04004  Data: 002a
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D010 <?>
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2b0 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable+, Smallest Translation Unit: 00
        Capabilities: [2c0 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00000020, Page Request Allocation:
00000000
        Capabilities: [2d0 v1] Process Address Space ID (PASID)
                PASIDCap: Exec- Priv-, Max PASID Width: 10
                PASIDCtl: Enable- Exec- Priv-
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
