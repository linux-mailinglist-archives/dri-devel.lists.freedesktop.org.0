Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEDE24AD56
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411686E893;
	Thu, 20 Aug 2020 03:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83696E893
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:30:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 20 Aug 2020 03:30:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: krakopo@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206987-2300-gAtLRyEOWh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206987

--- Comment #35 from krakopo@protonmail.com ---
@Petteri

I'm running DragonFly BSD 5.8.1 in my KVM virtual machine.

Here is the dmesg output with the debug info patch applied:

Aug 19 23:18:03 archpad kernel: MXCSR: 00000020 XMM3: 4010000000000000
Aug 19 23:18:03 archpad kernel: simd exception: 0000 [#1] PREEMPT SMP NOPTI
Aug 19 23:18:03 archpad kernel: CPU: 5 PID: 518 Comm: Xorg Not tainted
5.8.1-arch1206987 #1
Aug 19 23:18:03 archpad kernel: Hardware name: LENOVO 81W4/LNVNB161216, BIOS
DZCN19WW 04/13/2020
Aug 19 23:18:03 archpad kernel: RIP: 0010:dcn_bw_ceil2+0x35/0x60 [amdgpu]
Aug 19 23:18:03 archpad kernel: Code: cd 7b 3e 0f 28 d0 66 0f ef db 66 0f ef e4
f3 0f 5e d1 f3 0f 5a e0 f3 0f 2c c2 66 0f ef d2 f3 0f 2a d0 f3 0f 59 d1 f3 0f
5a da <f2> 0f 58 1d 5b 19 2e 00 66 0f 2f dc 72 01 c3 f3 0f 58 ca 0f 28 c1
Aug 19 23:18:03 archpad kernel: RSP: 0018:ffff9e24c10775f8 EFLAGS: 00010202
Aug 19 23:18:03 archpad kernel: RAX: 0000000000000004 RBX: 0000000000000000
RCX: 0000000000000780
Aug 19 23:18:03 archpad kernel: RDX: ffff93d6d0683080 RSI: ffff93d6d0689560
RDI: 0000000044444440
Aug 19 23:18:03 archpad kernel: RBP: ffff93d6d06831c0 R08: ffff93d6d06833b4
R09: 0000000000000000
Aug 19 23:18:03 archpad kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff93d6d0683360
Aug 19 23:18:03 archpad kernel: R13: 0000000000000001 R14: ffff93d6d0682188
R15: ffff93d6d0682028
Aug 19 23:18:03 archpad kernel: FS:  00007f222278d940(0000)
GS:ffff93d707740000(0000) knlGS:0000000000000000
Aug 19 23:18:03 archpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 19 23:18:03 archpad kernel: CR2: 0000000800ea8030 CR3: 00000002021ca000
CR4: 0000000000340ee0
Aug 19 23:18:03 archpad kernel: Call Trace:
Aug 19 23:18:03 archpad kernel: 
dml21_ModeSupportAndSystemConfigurationFull+0x437/0x5cf0 [amdgpu]
Aug 19 23:18:03 archpad kernel:  ? cpufreq_this_cpu_can_update+0xe/0x50
Aug 19 23:18:03 archpad kernel:  ? sugov_update_single+0x58/0x210
Aug 19 23:18:03 archpad kernel:  ? sugov_get_util+0xf0/0xf0
Aug 19 23:18:03 archpad kernel:  ? update_blocked_averages+0x539/0x620
Aug 19 23:18:03 archpad kernel:  ? update_group_capacity+0x25/0x1c0
Aug 19 23:18:03 archpad kernel:  ? cpumask_next_and+0x19/0x20
Aug 19 23:18:03 archpad kernel:  ? update_sd_lb_stats.constprop.0+0x799/0x8f0
Aug 19 23:18:03 archpad kernel:  ? cpufreq_this_cpu_can_update+0xe/0x50
Aug 19 23:18:03 archpad kernel:  ? sugov_update_single+0x143/0x210
Aug 19 23:18:03 archpad kernel:  ? sugov_get_util+0xf0/0xf0
Aug 19 23:18:03 archpad kernel:  ? update_load_avg+0x63a/0x660
Aug 19 23:18:03 archpad kernel:  ? update_curr+0x73/0x1f0
Aug 19 23:18:03 archpad kernel:  ? enqueue_entity+0x14e/0x750
Aug 19 23:18:03 archpad kernel:  ? resched_curr+0x20/0xc0
Aug 19 23:18:03 archpad kernel:  ? check_preempt_wakeup+0x13b/0x250
Aug 19 23:18:03 archpad kernel:  ? check_preempt_curr+0x67/0x90
Aug 19 23:18:03 archpad kernel:  ? _raw_spin_unlock+0x16/0x30
Aug 19 23:18:03 archpad kernel:  dml_get_voltage_level+0x116/0x1e0 [amdgpu]
Aug 19 23:18:03 archpad kernel:  dcn20_fast_validate_bw+0x359/0x680 [amdgpu]
Aug 19 23:18:03 archpad kernel:  ? resource_build_scaling_params+0xc44/0x11a0
[amdgpu]
Aug 19 23:18:03 archpad kernel:  dcn21_validate_bandwidth+0xcd/0x2a0 [amdgpu]
Aug 19 23:18:03 archpad kernel:  dc_validate_global_state+0x2f2/0x390 [amdgpu]
Aug 19 23:18:03 archpad kernel:  amdgpu_dm_atomic_check+0xefb/0x1010 [amdgpu]
Aug 19 23:18:03 archpad kernel:  ? free_one_page+0x57/0xd0
Aug 19 23:18:03 archpad kernel:  drm_atomic_check_only+0x57c/0x7f0 [drm]
Aug 19 23:18:03 archpad kernel:  ?
__drm_atomic_helper_crtc_duplicate_state+0x85/0xd0 [drm_kms_helper]
Aug 19 23:18:03 archpad kernel:  drm_atomic_commit+0x13/0x50 [drm]
Aug 19 23:18:03 archpad kernel:  drm_atomic_helper_legacy_gamma_set+0x123/0x180
[drm_kms_helper]
Aug 19 23:18:03 archpad kernel:  drm_mode_gamma_set_ioctl+0x19a/0x230 [drm]
Aug 19 23:18:03 archpad kernel:  ? drm_color_lut_check+0xa0/0xa0 [drm]
Aug 19 23:18:03 archpad kernel:  drm_ioctl_kernel+0xb2/0x100 [drm]
Aug 19 23:18:03 archpad kernel:  drm_ioctl+0x208/0x360 [drm]
Aug 19 23:18:03 archpad kernel:  ? drm_color_lut_check+0xa0/0xa0 [drm]
Aug 19 23:18:03 archpad kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Aug 19 23:18:03 archpad kernel:  ksys_ioctl+0x82/0xc0
Aug 19 23:18:03 archpad kernel:  __x64_sys_ioctl+0x16/0x20
Aug 19 23:18:03 archpad kernel:  do_syscall_64+0x44/0x70
Aug 19 23:18:03 archpad kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Aug 19 23:18:03 archpad kernel: RIP: 0033:0x7f22234b08eb
Aug 19 23:18:03 archpad kernel: Code: 0f 1e fa 48 8b 05 a5 95 0c 00 64 c7 00 26
00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 95 0c 00 f7 d8 64 89 01 48
Aug 19 23:18:03 archpad kernel: RSP: 002b:00007ffee6662f48 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Aug 19 23:18:03 archpad kernel: RAX: ffffffffffffffda RBX: 00007ffee6662f80
RCX: 00007f22234b08eb
Aug 19 23:18:03 archpad kernel: RDX: 00007ffee6662f80 RSI: 00000000c02064a5
RDI: 000000000000000a
Aug 19 23:18:03 archpad kernel: RBP: 00000000c02064a5 R08: 000055b14cc95f10
R09: 000055b14cc96110
Aug 19 23:18:03 archpad kernel: R10: 000055b14cc95d10 R11: 0000000000000246
R12: 0000000000000100
Aug 19 23:18:03 archpad kernel: R13: 000000000000000a R14: 0000000000000100
R15: 0000000000000100
Aug 19 23:18:03 archpad kernel: Modules linked in: xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat
iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c tun bridge hid_multitouch hid_generic 8021q garp mrp stp llc amdgpu
ath10k_pci edac_mce_amd ath10k_core kvm_amd snd_acp3x_rn kvm snd_acp3x_pdm_dma
ebtable_filter ebtables ip6table_filter snd_soc_dmic ip6_tables snd_soc_core
ath irqbypass iptable_filter crct10dif_pclmul crc32_pclmul mac80211
ghash_clmulni_intel joydev snd_compress ac97_bus snd_pcm_dmaengine mousedev
wmi_bmof aesni_intel crypto_simd ccm cryptd glue_helper algif_aead
snd_hda_codec_generic btusb rapl snd_hda_codec_hdmi ledtrig_audio des_generic
input_leds gpu_sched pcspkr libdes snd_hda_intel btrtl i2c_algo_bit
snd_intel_dspcfg btbcm ttm arc4 snd_hda_codec cbc btintel ecb snd_hda_core
uvcvideo algif_skcipher bluetooth drm_kms_helper k10temp sp5100_tco snd_hwdep
i2c_piix4 snd_pcm cmac md4 videobuf2_vmalloc cec
Aug 19 23:18:03 archpad kernel:  cfg80211 videobuf2_memops algif_hash af_alg
videobuf2_v4l2 rc_core tpm_crb videobuf2_common snd_timer nls_iso8859_1
syscopyarea videodev ideapad_laptop sysfillrect nls_cp437 tpm_tis snd ccp
ecdh_generic tpm_tis_core snd_rn_pci_acp3x ecc vfat sparse_keymap sysimgblt fat
soundcore tpm snd_pci_acp3x mc rfkill fb_sys_fops i2c_hid hid libarc4 wmi evdev
pinctrl_amd battery mac_hid elants_i2c acpi_cpufreq rng_core ac drm agpgart
pkcs8_key_parser ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
serio_raw xhci_pci atkbd xhci_pci_renesas libps2 xhci_hcd crc32c_intel i8042
serio
Aug 19 23:18:03 archpad kernel: ---[ end trace a01eac408369453d ]---
Aug 19 23:18:03 archpad kernel: RIP: 0010:dcn_bw_ceil2+0x35/0x60 [amdgpu]
Aug 19 23:18:03 archpad kernel: Code: cd 7b 3e 0f 28 d0 66 0f ef db 66 0f ef e4
f3 0f 5e d1 f3 0f 5a e0 f3 0f 2c c2 66 0f ef d2 f3 0f 2a d0 f3 0f 59 d1 f3 0f
5a da <f2> 0f 58 1d 5b 19 2e 00 66 0f 2f dc 72 01 c3 f3 0f 58 ca 0f 28 c1
Aug 19 23:18:03 archpad kernel: RSP: 0018:ffff9e24c10775f8 EFLAGS: 00010202
Aug 19 23:18:03 archpad kernel: RAX: 0000000000000004 RBX: 0000000000000000
RCX: 0000000000000780
Aug 19 23:18:03 archpad kernel: RDX: ffff93d6d0683080 RSI: ffff93d6d0689560
RDI: 0000000044444440
Aug 19 23:18:03 archpad kernel: RBP: ffff93d6d06831c0 R08: ffff93d6d06833b4
R09: 0000000000000000
Aug 19 23:18:03 archpad kernel: R10: 0000000000000000 R11: 0000000000000000
R12: ffff93d6d0683360
Aug 19 23:18:03 archpad kernel: R13: 0000000000000001 R14: ffff93d6d0682188
R15: ffff93d6d0682028
Aug 19 23:18:03 archpad kernel: FS:  00007f222278d940(0000)
GS:ffff93d707640000(0000) knlGS:0000000000000000
Aug 19 23:18:03 archpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 19 23:18:03 archpad kernel: CR2: 0000000800cca010 CR3: 00000002021ca000
CR4: 0000000000340ee0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
