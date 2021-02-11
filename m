Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AE319670
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 00:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA59D6E49C;
	Thu, 11 Feb 2021 23:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E46B6E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 23:17:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C8B0C64E3E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 23:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613085425;
 bh=dZRXJ+X2RcHkps/zP3DG1iboyiQrrZOs8SmCmC3IL4o=;
 h=From:To:Subject:Date:From;
 b=D7p3J6CiwZoPtb/1Ta1U/RH+UCTShgI+Sn12E5sDA1VlQd4KGPktz1RPxlsIbEw42
 LvROzxYp+hBR5L8sEzK80EGTgp8MSD9Z/DkUfMAj6Uj2Gezlnd0BSu4rJkUiXSAoOd
 llLcoOO/iYWQcZnU6ZcAht5XyoYmU3Qzjxz0vZ9YrTQRLU8K8jZzrKCeFWc/FQdNAR
 fntXhUGGuDTYeS+rzvuSyaN99A/P8sJFz6wSzHjudTcU+12A/t/iQUumdDXMpo4dCX
 4z9xdpqARkk1IXqTNgHlzhqeaQdR1UaTeTVjAhhJYAOipkvdJF27Df+1w/rB4HEyUd
 DjVSNYZY8crXg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BB38165328; Thu, 11 Feb 2021 23:17:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTE3MTddIE5ldzogV0FSTklORzogQ1BVOiA1IFBJRDog?=
 =?UTF-8?B?NDMwIGF0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv?=
 =?UTF-8?B?ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyLmM6ODMzIHJuX2Nsa19tZ3Jf?=
 =?UTF-8?B?Y29uc3RydWN0KzB4MmRkLzB4NDQwIFthbWRncHVd?=
Date: Thu, 11 Feb 2021 23:17:05 +0000
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
Message-ID: <bug-211717-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211717

            Bug ID: 211717
           Summary: WARNING: CPU: 5 PID: 430 at
                    drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21
                    /rn_clk_mgr.c:833 rn_clk_mgr_construct+0x2dd/0x440
                    [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0-rc7-00084-g291009f656e8
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

The CPU/GPU: AMD Ryzen 5 PRO 4650G
Motherboard: MSI MS-7C94/MAG B550M MORTAR WIFI (MS-7C94), BIOS 1.20 08/03/2020


on boot I get this nasty message, although after that everything seems to work
fine (running KDE/Plasma on Arch Linux).


[   10.328515] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
[   10.526216] amdgpu 0000:30:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[   10.546197] amdgpu 0000:30:00.0: amdgpu: RAP: optional rap ta ucode is not
available
[   10.547009] amdgpu 0000:30:00.0: amdgpu: SMU is initialized successfully!
[   10.548329] [drm] kiq ring mec 2 pipe 1 q 0
[   10.549171] ------------[ cut here ]------------
[   10.549175] WARNING: CPU: 5 PID: 430 at
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:833
rn_clk_mgr_construct+0x2dd/0x440 [amdgpu]
[   10.549422] Modules linked in: ip6table_mangle ip6table_nat ip6table_filter
ip6_tables iptable_mangle iptable_nat nf_nat nf_conntrack amdgpu(+)
nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter ccm algif_aead des_generic libdes
ecb algif_skcipher cmac md4 algif_hash af_alg iwlmvm hid_logitech_hidpp
snd_hda_codec_realtek btrfs mac80211 snd_hda_codec_generic raid1
snd_hda_codec_hdmi ledtrig_audio snd_hda_intel dm_raid snd_intel_dspcfg raid456
soundwire_intel soundwire_generic_allocation intel_rapl_msr soundwire_cadence
gpu_sched intel_rapl_common snd_hda_codec i2c_algo_bit async_raid6_recov
drm_ttm_helper async_memcpy ttm async_pq snd_hda_core async_xor blake2b_generic
async_tx md_mod edac_mce_amd joydev libarc4 mousedev input_leds snd_hwdep
hid_logitech_dj xor drm_kms_helper soundwire_bus kvm_amd iwlwifi dm_thin_pool
snd_soc_core kvm cfg80211 dm_persistent_data hid_generic wmi_bmof r8169 cec
snd_compress dm_bio_prison ac97_bus dm_bufio raid6_pq realtek snd_pcm_dmaengine
mdio_devres libcrc32c
[   10.549474]  snd_pcm bridge rc_core of_mdio snd_timer fixed_phy irqbypass
syscopyarea libphy sp5100_tco snd rapl sysfillrect drm k10temp pcspkr i2c_piix4
rfkill sysimgblt usbhid soundcore fb_sys_fops wmi tpm_tis tpm_tis_core evdev
acpi_cpufreq stp pinctrl_amd gpio_amdpt mac_hid llc fuse pkcs8_key_parser
nct6683 msr crypto_user agpgart ip_tables x_tables ext4 crc32c_generic crc16
mbcache jbd2 dm_crypt cbc encrypted_keys trusted uas usb_storage dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel xhci_pci ghash_clmulni_intel
xhci_pci_renesas aesni_intel xhci_hcd ccp crypto_simd cryptd glue_helper
tpm_crb tpm rng_core hid_lenovo hid vfat fat
[   10.549541] CPU: 5 PID: 430 Comm: systemd-udevd Not tainted
5.11.0-rc7-00084-g291009f656e8-dirty #120
[   10.549543] Hardware name: Micro-Star International Co., Ltd. MS-7C94/MAG
B550M MORTAR WIFI (MS-7C94), BIOS 1.20 08/03/2020
[   10.549545] RIP: 0010:rn_clk_mgr_construct+0x2dd/0x440 [amdgpu]
[   10.549731] Code: ff ff b8 03 00 00 00 41 8b 8c c5 80 00 00 00 41 89 c1 89
c7 85 c9 74 0c 41 8b 94 c5 84 00 00 00 85 d2 75 75 48 83 e8 01 73 dd <0f> 0b e9
31 fe ff ff 48 c7 c6 e0 c1 77 c1 b9 14 00 00 00 48 89 c7
[   10.549733] RSP: 0018:ffffacf40175f638 EFLAGS: 00010297
[   10.549734] RAX: ffffffffffffffff RBX: ffffa2391cea43c0 RCX:
0000000000000640
[   10.549735] RDX: 0000000000000000 RSI: ffffacf40175f660 RDI:
0000000000000000
[   10.549736] RBP: ffffa238c5579000 R08: 0000000000000000 R09:
0000000000000000
[   10.549737] R10: 7fc9117fffffffff R11: ffffa238d11a6000 R12:
ffffa2391cea4e40
[   10.549738] R13: ffffacf40175f660 R14: ffffa2391b390000 R15:
00000000fffffff0
[   10.549740] FS:  00007f33d7799ec0(0000) GS:ffffa23faf340000(0000)
knlGS:0000000000000000
[   10.549741] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.549742] CR2: 0000561d9f864070 CR3: 0000000111c0a000 CR4:
0000000000350ee0
[   10.549744] Call Trace:
[   10.549750]  dc_clk_mgr_create+0x178/0x260 [amdgpu]
[   10.549893]  dc_create+0x253/0x810 [amdgpu]
[   10.550035]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[   10.550167]  ? kmem_cache_alloc_trace+0x150/0x290
[   10.550171]  amdgpu_dm_init.isra.0+0x1c6/0x260 [amdgpu]
[   10.550313]  ? wake_up_klogd.part.0+0x4f/0x70
[   10.550316]  ? vprintk_emit+0xcb/0x1b0
[   10.550319]  dm_hw_init+0xe/0x20 [amdgpu]
[   10.550458]  amdgpu_device_init.cold+0x1741/0x1aad [amdgpu]
[   10.550602]  amdgpu_driver_load_kms+0x64/0x270 [amdgpu]
[   10.550718]  amdgpu_pci_probe+0x129/0x1b0 [amdgpu]
[   10.550829]  local_pci_probe+0x42/0x80
[   10.550832]  ? pci_match_device+0xd7/0x100
[   10.550833]  pci_device_probe+0xfa/0x1b0
[   10.550835]  really_probe+0xf2/0x440
[   10.550838]  driver_probe_device+0xe1/0x150
[   10.550840]  device_driver_attach+0xa1/0xb0
[   10.550842]  __driver_attach+0x8a/0x150
[   10.550843]  ? device_driver_attach+0xb0/0xb0
[   10.550845]  ? device_driver_attach+0xb0/0xb0
[   10.550847]  bus_for_each_dev+0x89/0xd0
[   10.550848]  bus_add_driver+0x12b/0x1e0
[   10.550850]  driver_register+0x8b/0xe0
[   10.550852]  ? 0xffffffffc1a4c000
[   10.550853]  do_one_initcall+0x57/0x220
[   10.550856]  do_init_module+0x5c/0x260
[   10.550859]  load_module+0x22ea/0x24b0
[   10.550863]  __do_sys_init_module+0x136/0x1b0
[   10.550866]  do_syscall_64+0x33/0x40
[   10.550868]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   10.550870] RIP: 0033:0x7f33d80afefe
[   10.550872] Code: 48 8b 0d 75 0f 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 42 0f 0c 00 f7 d8 64 89 01 48
[   10.550873] RSP: 002b:00007ffcb7420198 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[   10.550874] RAX: ffffffffffffffda RBX: 0000561d9f8820f0 RCX:
00007f33d80afefe
[   10.550875] RDX: 00007f33d81e19bd RSI: 000000000eaf0f61 RDI:
00007f33c62bc010
[   10.550876] RBP: 00007f33c62bc010 R08: 0000561d9f873cf0 R09:
000000000eaf0f70
[   10.550877] R10: 0000000561d9f873 R11: 0000000000000246 R12:
00007f33d81e19bd
[   10.550877] R13: 0000000000000001 R14: 0000561d9f70cd80 R15:
0000561d9f8820f0
[   10.550879] ---[ end trace a3bb9bb6e525f957 ]---
[   10.550963] [drm] Display Core initialized with v3.2.116!
[   10.563795] [drm] DMUB hardware initialized: version=0x01000000

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
