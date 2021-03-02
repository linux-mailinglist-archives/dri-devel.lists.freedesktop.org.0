Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F4329704
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 09:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57866E0D2;
	Tue,  2 Mar 2021 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8936E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 08:52:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C2ABD64DE8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614675168;
 bh=EOlXOy4XNIUILrkpqeIi3rSJc/CNfkQgiEk1Ge//2XU=;
 h=From:To:Subject:Date:From;
 b=j3vdosDymmWwgw+D3h+b45amN15KP5ydwZkO8ARjl6dGOpBbOjqhQggsBQq283bdP
 lJETSiQuWeKXUx3w0oHhPpfGWFcq6Xx1xKu7Lphme+dcAJF5iLBJwh+fay2Gu2Osbs
 mgn2JQYpQ5wCh78MtQnrNfXfwhj4IYFzSy1LB3PqjkM+JbC0YCr6vEcPL+SNozJUVC
 /CYmUc7Bzq2jsARbXtyWQzI5QgwTtkf//c6fTvv6do0PcZLk4sMUMXSBZE2WsVoJ0c
 5c5Ud/O2T5HOGgT8kIogvHbWcOvPDv+VeJR5ZV4PjxINFpP6oyw4fOI+duxzR6/16Y
 +LhJcURQQcgBA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BAC7565360; Tue,  2 Mar 2021 08:52:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212019] New: [drm:drm_atomic_helper_wait_for_flip_done
 [drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
Date: Tue, 02 Mar 2021 08:52:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: clemens@endorphin.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212019-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212019

            Bug ID: 212019
           Summary: [drm:drm_atomic_helper_wait_for_flip_done
                    [drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done
                    timed out
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: clemens@endorphin.org
        Regression: No

Created attachment 295569
  --> https://bugzilla.kernel.org/attachment.cgi?id=295569&action=edit
Hardware

I get the following display freeze on my T495 AMD Thinkpad:

Mar 02 09:24:50 duncan kernel: [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
Mar 02 09:25:02 duncan kernel: [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
Mar 02 09:36:25 duncan kernel: [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [PLANE:55:plane-3] flip_done timed out

followed by this stack trace:

Mar 02 09:36:25 duncan kernel: WARNING: CPU: 7 PID: 1636 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7754
amdgpu_dm_atomic_commit_tail+0x238b/0x2420 [amdgpu]
Mar 02 09:36:25 duncan kernel: Modules linked in: fuse ctr ccm wireguard
curve25519_x86_64 libchacha20poly1305 chacha_x86_64 poly1305_x86_64 libblake2s
blake2s_x86_64 ip6_udp_tunnel udp_tunnel libcurve25519_generic libchacha
libblake2s_generic af_packet msr ip6table_nat iptable_nat nf_nat joydev
mousedev xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c
ip6t_rpfilter ipt_rpfilter amdgpu ip6table_raw iptable_raw xt_pkttype
intel_rapl_msr nf_log_ipv6 nf_log_ipv4 nf_log_common xt_LOG xt_tcpudp wmi_bmof
iwlmvm snd_hda_codec_realtek iommu_v2 mac80211 snd_hda_codec_generic gpu_sched
drm_ttm_helper snd_hda_codec_hdmi ttm btusb snd_hda_intel edac_mce_amd uvcvideo
btrtl btbcm libarc4 btintel edac_core videobuf2_vmalloc drm_kms_helper
nls_iso8859_1 intel_rapl_common deflate videobuf2_memops evdev crc32_pclmul
nls_cp437 snd_intel_dspcfg mac_hid videobuf2_v4l2 iwlwifi bluetooth
ip6table_filter vfat videobuf2_common snd_hda_codec ghash_clmulni_intel fat
snd_hda_core ip6_tables thinkpad_acpi videodev
Mar 02 09:36:25 duncan kernel:  r8169 drm snd_hwdep efi_pstore nvram rapl
psmouse realtek mdio_devres ledtrig_audio mc serio_raw snd_pcm pstore cfg80211
agpgart i2c_algo_bit fb_sys_fops ecdh_generic syscopyarea snd_timer sysfillrect
ecc sch_fq_codel iptable_filter sysimgblt ipmi_devintf k10temp sp5100_tco
watchdog snd_rn_pci_acp3x i2c_piix4 ucsi_acpi snd_pci_acp3x libphy
ipmi_msghandler rfkill snd 8250_pci typec_ucsi soundcore ac typec battery wmi
video i2c_scmi backlight i2c_core pinctrl_amd tiny_power_button acpi_cpufreq
button loop tun tap macvlan bridge stp llc kvm_amd kvm irqbypass efivarfs
ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 dm_crypt cbc
sha256_ssse3 sha256_generic encrypted_keys trusted tpm rng_core rtsx_pci_sdmmc
input_leds led_class mmc_core atkbd libps2 xhci_pci xhci_pci_renesas xhci_hcd
crc32c_intel ehci_pci aesni_intel ehci_hcd libaes crypto_simd cryptd usbcore
glue_helper nvme nvme_core rtsx_pci t10_pi usb_common crc_t10dif
crct10dif_generic crct10dif_pclmul
Mar 02 09:36:25 duncan kernel:  crct10dif_common i8042 rtc_cmos serio dm_mod
Mar 02 09:36:25 duncan kernel: CPU: 7 PID: 1636 Comm: X Not tainted 5.11.0
#1-NixOS
Mar 02 09:36:25 duncan kernel: Hardware name: LENOVO 20NJCTO1WW/20NJCTO1WW,
BIOS R12ET55W(1.25 ) 07/06/2020
Mar 02 09:36:25 duncan kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x238b/0x2420 [amdgpu]
Mar 02 09:36:25 duncan kernel: Code: a8 fd ff ff 01 c7 85 a4 fd ff ff 37 00 00
00 c7 85 ac fd ff ff 20 00 00 00 e8 61 83 12 00 e9 e0 fa ff ff 0f 0b e9 30 f9
ff ff <0f> 0b e9 7f f9 ff ff 0f 0b 0f 0b e9 95 f9 ff ff 49 8b 06 41 0f b6
Mar 02 09:36:25 duncan kernel: RSP: 0018:ffffbd1043ae3928 EFLAGS: 00010002
Mar 02 09:36:25 duncan kernel: RAX: 0000000000000002 RBX: 000000000004bffc RCX:
ffff976a603c9118
Mar 02 09:36:25 duncan kernel: RDX: 0000000000000001 RSI: 0000000000000297 RDI:
ffff976a62660188
Mar 02 09:36:25 duncan kernel: RBP: ffffbd1043ae3c20 R08: 0000000000000005 R09:
0000000000000000
Mar 02 09:36:25 duncan kernel: R10: ffffbd1043ae3888 R11: ffffbd1043ae388c R12:
0000000000000297
Mar 02 09:36:25 duncan kernel: R13: ffff976e3132aa00 R14: ffff976a5dee9780 R15:
ffff976a603c9000
Mar 02 09:36:25 duncan kernel: FS:  00007f993d92c980(0000)
GS:ffff9772d8bc0000(0000) knlGS:0000000000000000
Mar 02 09:36:25 duncan kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Mar 02 09:36:25 duncan kernel: CR2: 00007f30c85b5ff8 CR3: 000000013e056000 CR4:
00000000003506e0
Mar 02 09:36:25 duncan kernel: Call Trace:
Mar 02 09:36:25 duncan kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Mar 02 09:36:25 duncan kernel:  drm_atomic_helper_commit+0x113/0x140
[drm_kms_helper]
Mar 02 09:36:25 duncan kernel:  drm_atomic_helper_set_config+0x70/0xb0
[drm_kms_helper]
Mar 02 09:36:25 duncan kernel:  drm_mode_setcrtc+0x1d3/0x6f0 [drm]
Mar 02 09:36:25 duncan kernel:  ? amdgpu_cs_wait_ioctl+0xd2/0x160 [amdgpu]
Mar 02 09:36:25 duncan kernel:  ? drm_mode_getcrtc+0x180/0x180 [drm]
Mar 02 09:36:25 duncan kernel:  drm_ioctl_kernel+0xaa/0xf0 [drm]
Mar 02 09:36:25 duncan kernel:  drm_ioctl+0x1ec/0x390 [drm]
Mar 02 09:36:25 duncan kernel:  ? drm_mode_getcrtc+0x180/0x180 [drm]
Mar 02 09:36:25 duncan kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Mar 02 09:36:25 duncan kernel:  __x64_sys_ioctl+0x83/0xb0
Mar 02 09:36:25 duncan kernel:  do_syscall_64+0x33/0x40
Mar 02 09:36:25 duncan kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Mar 02 09:36:25 duncan kernel: RIP: 0033:0x7f993dd37b07
Mar 02 09:36:25 duncan kernel: Code: c0 75 b5 48 8d 3c 2b e8 17 ff ff ff 85 c0
78 b6 48 89 d8 5b 5d 41 5c c3 66 2e 0f 1f 84 00 00 00 00 00 90 b8 10 00 00 00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 39 73 0c 00 f7 d8 64 89 01 48
Mar 02 09:36:25 duncan kernel: RSP: 002b:00007ffdd63e1ed8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Mar 02 09:36:25 duncan kernel: RAX: ffffffffffffffda RBX: 00007ffdd63e1f10 RCX:
00007f993dd37b07
Mar 02 09:36:25 duncan kernel: RDX: 00007ffdd63e1f10 RSI: 00000000c06864a2 RDI:
000000000000000f
Mar 02 09:36:25 duncan kernel: RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000000002fad090
Mar 02 09:36:25 duncan kernel: R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
Mar 02 09:36:25 duncan kernel: R13: 000000000000000f R14: 00000000021b4290 R15:
0000000000000000
Mar 02 09:36:25 duncan kernel: ---[ end trace 3bd64ee8f9aa76ff ]---

lshw and full kernel log attached. The first kernel that I saw this problem
with was the 5.9. series.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
