Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3D264835
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 16:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF526E93C;
	Thu, 10 Sep 2020 14:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6CD6E93C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:46:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209225] New: [AMDGPU] oops each boot: dc_link_set_backlight_level
Date: Thu, 10 Sep 2020 14:46:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurborsboom@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209225

            Bug ID: 209225
           Summary: [AMDGPU] oops each boot: dc_link_set_backlight_level
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.7, 5.8.8
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: arthurborsboom@gmail.com
        Regression: No

Created attachment 292451
  --> https://bugzilla.kernel.org/attachment.cgi?id=292451&action=edit
dmesg

On each boot, the kernel throws an oops.

Typical
--------------------
Arch Linux 5.8.7 and 5.8.8
Using kernel parameter amdgpu.runpm=0 (if not, immediate crash).
Using Plymouth
Model: MSI Bravo 17 - A4DDR-035NL
CPU: AMD Ryzen 7 4800H with integrated Vega GPU
GPU: AMD Navi 14 - Radeon RX 5500M

Oops
--------------------

[    4.621337] [drm] Initialized amdgpu 3.38.0 20150101 for 0000:07:00.0 on
minor 1
[    4.640077] ------------[ cut here ]------------
[    4.640156] WARNING: CPU: 0 PID: 953 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2545
dc_link_set_backlight_level+0x8a/0xf0 [amdgpu]
[    4.640156] Modules linked in: snd_acp3x_pdm_dma snd_acp3x_rn snd_soc_dmic
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_rn_pci_acp3x
snd_pci_acp3x btusb btrtl btbcm btintel bluetooth ecdh_generic ecc iwlmvm
amdgpu mac80211 joydev snd_hda_codec_realtek mousedev libarc4
snd_hda_codec_generic ledtrig_audio iwlwifi snd_hda_codec_hdmi hid_multitouch
snd_hda_intel hid_generic snd_intel_dspcfg snd_hda_codec gpu_sched msi_wmi
i2c_algo_bit sparse_keymap edac_mce_amd ttm snd_hda_core cfg80211 kvm_amd
snd_hwdep snd_pcm drm_kms_helper kvm r8169 snd_timer cec realtek rc_core
syscopyarea snd sp5100_tco irqbypass sysfillrect psmouse sysimgblt rapl
input_leds fb_sys_fops pcspkr k10temp soundcore libphy i2c_piix4 rfkill tpm_crb
wmi battery i2c_hid ac tpm_tis tpm_tis_core hid tpm pinctrl_amd uvcvideo
acpi_cpufreq videobuf2_vmalloc videobuf2_memops evdev videobuf2_v4l2
soc_button_array mac_hid videobuf2_common videodev mc vboxnetflt(OE)
vboxnetadp(OE) vboxdrv(OE) dm_mod drm sg crypto_user agpgart
[    4.640182]  ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
serio_raw atkbd libps2 crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper xhci_pci
xhci_pci_renesas ccp xhci_hcd rng_core i8042 serio
[    4.640190] CPU: 0 PID: 953 Comm: systemd-backlig Tainted: G           OE   
 5.8.7-arch1-1 #1
[    4.640191] Hardware name: Micro-Star International Co., Ltd. Bravo 17
A4DDR/MS-17FK, BIOS E17FKAMS.116 07/10/2020
[    4.640240] RIP: 0010:dc_link_set_backlight_level+0x8a/0xf0 [amdgpu]
[    4.640241] Code: 30 03 00 00 31 c0 48 8d 96 c0 01 00 00 48 8b 0a 48 85 c9
74 06 48 3b 59 08 74 20 83 c0 01 48 81 c2 c8 04 00 00 83 f8 06 75 e3 <0f> 0b 45
31 e4 5b 44 89 e0 5d 41 5c 41 5d 41 5e c3 48 98 48 69 c0
[    4.640242] RSP: 0018:ffffadc080807df0 EFLAGS: 00010246
[    4.640243] RAX: 0000000000000006 RBX: ffff9cd5438c9800 RCX:
0000000000000000
[    4.640243] RDX: ffff9cd53f801e70 RSI: ffff9cd53f800000 RDI:
0000000000000000
[    4.640244] RBP: ffff9cd543900000 R08: 00000000000000ff R09:
000000000000000a
[    4.640244] R10: 000000000000000a R11: f000000000000000 R12:
000000000000ff01
[    4.640245] R13: 0000000000000000 R14: 000000000000ffff R15:
ffff9cd549120260
[    4.640246] FS:  00007f5b331a8000(0000) GS:ffff9cd55f600000(0000)
knlGS:0000000000000000
[    4.640246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.640247] CR2: 00005598681fe978 CR3: 0000000408e64000 CR4:
0000000000340ef0
[    4.640247] Call Trace:
[    4.640302]  amdgpu_dm_backlight_update_status+0xb4/0xc0 [amdgpu]
[    4.640321]  backlight_device_set_brightness+0x7e/0x130
[    4.640323]  brightness_store+0x63/0x80
[    4.640326]  kernfs_fop_write+0xce/0x1b0
[    4.640329]  vfs_write+0xc7/0x1f0
[    4.640331]  ksys_write+0x67/0xe0
[    4.640335]  do_syscall_64+0x44/0x70
[    4.640337]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    4.640339] RIP: 0033:0x7f5b33fc0f67
[    4.640341] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00
f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[    4.640342] RSP: 002b:00007ffc766ac878 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[    4.640343] RAX: ffffffffffffffda RBX: 0000000000000004 RCX:
00007f5b33fc0f67
[    4.640343] RDX: 0000000000000004 RSI: 00007ffc766ac960 RDI:
0000000000000004
[    4.640344] RBP: 00007ffc766ac960 R08: 0000000000000000 R09:
0000000000000000
[    4.640344] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000004
[    4.640344] R13: 00005598681e83c0 R14: 0000000000000004 R15:
00007f5b34093720
[    4.640346] ---[ end trace de75e01f35cca025 ]---

Dmesg is attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
