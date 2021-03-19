Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A219341E19
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 14:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0306E6EA02;
	Fri, 19 Mar 2021 13:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44366EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 13:26:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B9BDF64EFC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616160379;
 bh=2DllIT167tztmardAS3o42vnx90iNw+PmPXgQMZH0Ok=;
 h=From:To:Subject:Date:From;
 b=SMAh9HhzTM2ujNLh+Hvz6Mvl3wZoy3DMakA4GMkebFCkV9SFiIpa21nWds/UzAJMx
 KZXO5Squ5aTXxpn1DIuJ/GBaLglKCPDV1BEeCWN63CS1sIa8Q6tgRG3hKttg3nuZEA
 UCA4IHFXG8JgW7Lfr5VOjk5CxUpbqQscmKFsiGOPHI15+h5MMV5qk5nfTGjiHCkReV
 Sdphs8kemR6yp/GHQ6dAkPKBLEp14OPKzwPkK5+bEBqGRtOr/3APN7BYR0xXWYRLTj
 BI4Pafc029tOx12EavNiPQEFhRVQklb6OPrBBSUh22M400Kf74Zo1qcY6ssIyBblJE
 snFuySgjnI5Bg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A6E52653CB; Fri, 19 Mar 2021 13:26:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIzNjFdIE5ldzogV0FSTklORzogQ1BVOiAwIFBJRDog?=
 =?UTF-8?B?NDExIGF0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv?=
 =?UTF-8?B?ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyLmM6ODMzIHJuX2Nsa19tZ3Jf?=
 =?UTF-8?B?Y29uc3RydWN0KzB4MmRkLzB4NDQwIFthbWRncHVd?=
Date: Fri, 19 Mar 2021 13:26:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gdamjan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212361-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212361

            Bug ID: 212361
           Summary: WARNING: CPU: 0 PID: 411 at
                    drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21
                    /rn_clk_mgr.c:833 rn_clk_mgr_construct+0x2dd/0x440
                    [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.0-rc3-00070-g8b12a62a4e3e
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gdamjan@gmail.com
        Regression: No

I'm getting the following on a AMD Ryzen 5 PRO 4650G with Radeon Graphics

[   10.537847] amdgpu 0000:30:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[   10.545573] amdgpu 0000:30:00.0: amdgpu: RAP: optional rap ta ucode is not
available
[   10.545575] amdgpu 0000:30:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[   10.545794] amdgpu 0000:30:00.0: amdgpu: SMU is initialized successfully!
[   10.547115] [drm] kiq ring mec 2 pipe 1 q 0
[   10.547613] ------------[ cut here ]------------
[   10.547613] WARNING: CPU: 0 PID: 411 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:833
rn_clk_mgr_construct+0x2dd/0x440 [amdgpu]
[   10.547778] Modules linked in: iptable_mangle(+) iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter bpfilter ccm
algif_aead des_generic libdes ecb algif_skcipher cmac md4 algif_hash af_alg
amdgpu(+) iwlmvm btrfs mac80211 raid1 dm_raid raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx md_mod blake2b_generic xor libarc4
iwlwifi drm_ttm_helper ttm gpu_sched i2c_algo_bit drm_kms_helper syscopyarea
sysfillrect sysimgblt intel_rapl_msr intel_rapl_common fb_sys_fops cec kvm_amd
cfg80211 kvm snd_hda_codec_realtek dm_thin_pool snd_hda_codec_generic
snd_hda_codec_hdmi dm_persistent_data ledtrig_audio snd_hda_intel dm_bio_prison
snd_intel_dspcfg dm_bufio snd_hda_codec libcrc32c raid6_pq r8169 bridge
snd_hwdep snd_hda_core wmi_bmof realtek mdio_devres snd_pcm hid_logitech_hidpp
of_mdio fixed_phy libphy snd_timer drm irqbypass mousedev snd joydev rapl
sp5100_tco rfkill k10temp pcspkr i2c_piix4 soundcore wmi pinctrl_amd tpm_tis
stp gpio_amdpt tpm_tis_core
[   10.547820]  acpi_cpufreq llc mac_hid fuse pkcs8_key_parser crypto_user
agpgart ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 dm_crypt cbc
hid_logitech_dj encrypted_keys trusted hid_generic usbhid uas usb_storage
dm_mod crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
aesni_intel xhci_pci ccp xhci_pci_renesas crypto_simd cryptd xhci_hcd tpm_crb
tpm rng_core hid_lenovo hid vfat fat
[   10.547840] CPU: 0 PID: 411 Comm: systemd-udevd Not tainted
5.12.0-rc3-00070-g8b12a62a4e3e #22
[   10.547842] Hardware name: Micro-Star International Co., Ltd. MS-7C94/MAG
B550M MORTAR WIFI (MS-7C94), BIOS 1.20 08/03/2020
[   10.547843] RIP: 0010:rn_clk_mgr_construct+0x2dd/0x440 [amdgpu]
[   10.547992] Code: ff ff b8 03 00 00 00 41 8b 8c c5 80 00 00 00 41 89 c1 89
c7 85 c9 74 0c 41 8b 94 c5 84 00 00 00 85 d2 75 75 48 83 e8 01 73 dd <0f> 0b e9
31 fe ff ff 48 c7 c6 00 5f 56 c1 b9 14 00 00 00 48 89 c7
[   10.547993] RSP: 0018:ffffa0c281663650 EFLAGS: 00010297
[   10.547995] RAX: ffffffffffffffff RBX: ffff91210c244840 RCX:
0000000000000640
[   10.547996] RDX: 0000000000000000 RSI: ffffa0c281663678 RDI:
0000000000000000
[   10.547997] RBP: ffff91210a12ca00 R08: 0000000000000000 R09:
0000000000000000
[   10.547997] R10: 7fc9117fffffffff R11: ffff91210c250800 R12:
ffff912109495540
[   10.547998] R13: ffffa0c281663678 R14: ffff912104150000 R15:
00000000fffffff0
[   10.547999] FS:  00007ff7a5594a40(0000) GS:ffff9127ef200000(0000)
knlGS:0000000000000000
[   10.548000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.548001] CR2: 000000c000b87c80 CR3: 00000001023ce000 CR4:
0000000000350ef0
[   10.548002] Call Trace:
[   10.548006]  dc_clk_mgr_create+0x178/0x260 [amdgpu]
[   10.548154]  dc_create+0x256/0x7c0 [amdgpu]
[   10.548342]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[   10.548543]  ? kmem_cache_alloc_trace+0x169/0x2d0
[   10.548547]  amdgpu_dm_init.isra.0+0x1bd/0x250 [amdgpu]
[   10.548766]  ? wake_up_klogd.part.0+0x4f/0x70
[   10.548769]  ? vprintk_emit+0xf4/0x1a0
[   10.548774]  dm_hw_init+0xe/0x20 [amdgpu]
[   10.549001]  amdgpu_device_init.cold+0x1758/0x1b21 [amdgpu]
[   10.549214]  amdgpu_driver_load_kms+0x64/0x260 [amdgpu]
[   10.549330]  amdgpu_pci_probe+0x11f/0x1b0 [amdgpu]
[   10.549442]  local_pci_probe+0x42/0x80
[   10.549445]  ? pci_match_device+0xd7/0x100
[   10.549447]  pci_device_probe+0xfa/0x1b0
[   10.549449]  really_probe+0xf2/0x440
[   10.549453]  driver_probe_device+0xe1/0x150
[   10.549455]  device_driver_attach+0xa1/0xb0
[   10.549456]  __driver_attach+0x8a/0x150
[   10.549458]  ? device_driver_attach+0xb0/0xb0
[   10.549459]  ? device_driver_attach+0xb0/0xb0
[   10.549460]  bus_for_each_dev+0x89/0xd0
[   10.549462]  bus_add_driver+0x12b/0x1e0
[   10.549464]  driver_register+0x8b/0xe0
[   10.549465]  ? 0xffffffffc183b000
[   10.549466]  do_one_initcall+0x57/0x210
[   10.549469]  do_init_module+0x5c/0x260
[   10.549471]  load_module+0x22e6/0x24b0
[   10.549475]  __do_sys_init_module+0x13b/0x1c0
[   10.549477]  do_syscall_64+0x33/0x40
[   10.549480]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   10.549482] RIP: 0033:0x7ff7a5e87d9e
[   10.549484] Code: 48 8b 0d d5 10 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d a2 10 0c 00 f7 d8 64 89 01 48
[   10.549485] RSP: 002b:00007ffc1c8aeba8 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[   10.549487] RAX: ffffffffffffffda RBX: 000056342020ca00 RCX:
00007ff7a5e87d9e
[   10.549488] RDX: 00007ff7a5fda9bd RSI: 000000000ddf3949 RDI:
00007ff7889fb010
[   10.549489] RBP: 00007ff7889fb010 R08: 0000563420209970 R09:
000000000ddf3960
[   10.549490] R10: 0000000563420209 R11: 0000000000000246 R12:
00007ff7a5fda9bd
[   10.549491] R13: 0000000000000001 R14: 0000563420130be0 R15:
000056342020ca00
[   10.549492] ---[ end trace 37418064a28ef735 ]---
[   10.549574] [drm] Display Core initialized with v3.2.122!
[   10.562390] [drm] DMUB hardware initialized: version=0x01000000
[   10.585303] snd_hda_intel 0000:30:00.1: bound 0000:30:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
[   10.719490] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[   10.719510] [drm] JPEG decode initialized successfully.
[   10.720565] kfd kfd: Allocated 3969056 bytes on gart
[   10.720734] Virtual CRAT table created for GPU
[   10.720813] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
[   10.720816] kfd kfd: added device 1002:1636
[   10.720818] amdgpu 0000:30:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 18,
active_cu_number 27
[   10.721785] [drm] fb mappable at 0x810CE0000
[   10.721786] [drm] vram apper at 0x810000000
[   10.721786] [drm] size 9216000
[   10.721787] [drm] fb depth is 24
[   10.721787] [drm]    pitch is 7680
[   10.721858] fbcon: amdgpudrmfb (fb0) is primary device

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
