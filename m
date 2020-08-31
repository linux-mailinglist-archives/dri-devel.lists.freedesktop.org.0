Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A4257C33
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725D6E135;
	Mon, 31 Aug 2020 15:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885C6E135
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 15:20:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209091] New: i915: drm:fw_domains_get [i915] *ERROR* render:
 timed out waiting for forcewake ack request.
Date: Mon, 31 Aug 2020 15:20:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209091-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209091

            Bug ID: 209091
           Summary: i915: drm:fw_domains_get [i915] *ERROR* render: timed
                    out waiting for forcewake ack request.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.5
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: madcatx@atlas.cz
        Regression: No

I have been seeing this error ever since I last updated my system packages. I
see the following error message every time during boot:

[   11.504795] [drm:fw_domains_get [i915]] *ERROR* render: timed out waiting
for forcewake ack request.
[   11.509800] ------------[ cut here ]------------
[   11.509801] i915 0000:00:02.0: Unclaimed read from register 0x235c
[   11.509850] WARNING: CPU: 4 PID: 494 at
drivers/gpu/drm/i915/intel_uncore.c:1182 __unclaimed_reg_debug+0x77/0x90 [i915]
[   11.509851] Modules linked in: bnep joydev mousedev intel_rapl_msr
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp kvm_intel iwldvm kvm
mac80211 irqbypass snd_hda_codec_hdmi crct10dif_pclmul libarc4 crc32_pclmul
snd_hda_codec_conexant ghash_clmulni_intel snd_hda_codec_generic nls_iso8859_1
mei_wdt mei_hdcp iwlwifi aesni_intel nls_cp437 iTCO_wdt btusb snd_hda_intel
btrtl crypto_simd vfat btbcm cryptd fat snd_intel_dspcfg btintel glue_helper
intel_pmc_bxt wmi_bmof rapl at24 iTCO_vendor_support intel_cstate snd_hda_codec
bluetooth snd_hda_core thinkpad_acpi psmouse ecdh_generic snd_hwdep
intel_uncore cfg80211 ecc nvram input_leds snd_pcm mei_me pcspkr ledtrig_audio
e1000e lpc_ich i2c_i801 tpm_tis tpm_tis_core i2c_smbus snd_timer rfkill mei tpm
snd wmi soundcore rng_core evdev battery ac mac_hid usbip_host usbip_core
coretemp msr pkcs8_key_parser sg crypto_user ip_tables x_tables ext4 sdhci_pci
cqhci serio_raw atkbd sdhci crc32c_generic libps2 crc16 ehci_pci mbcache i8042
jbd2
[   11.509872]  crc32c_intel mmc_core ehci_hcd serio i915 intel_gtt
i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec
rc_core drm agpgart
[   11.509878] CPU: 4 PID: 494 Comm: Xorg Tainted: G        W I      
5.8.5-arch1-1 #1
[   11.509878] Hardware name: LENOVO 4236B87/4236B87, BIOS 83ET79WW (1.49 )
09/05/2016
[   11.509899] RIP: 0010:__unclaimed_reg_debug+0x77/0x90 [i915]
[   11.509900] Code: 48 8b 78 18 4c 8b 77 50 4d 85 f6 74 30 e8 f1 7e 58 ef 45
89 e0 4c 89 e9 4c 89 f2 48 89 c6 48 c7 c7 40 7e 49 c0 e8 8f b1 f5 ee <0f> 0b 83
2d a0 64 21 00 01 5b 5d 41 5c 41 5d 41 5e c3 c3 4c 8b 37
[   11.509901] RSP: 0018:ffffb6198089fd28 EFLAGS: 00010082
[   11.509902] RAX: 0000000000000000 RBX: ffff965446d107e0 RCX:
0000000000000000
[   11.509902] RDX: 0000000000000003 RSI: ffffffffb056ac7f RDI:
00000000ffffffff
[   11.509903] RBP: 0000000000000000 R08: 0000000000000521 R09:
0000000000000004
[   11.509903] R10: 0000000000000000 R11: 0000000000000001 R12:
000000000000235c
[   11.509904] R13: ffffffffc04c00ef R14: ffff96544b06df90 R15:
ffff965446d107f8
[   11.509905] FS:  00007fc0db350540(0000) GS:ffff96544e300000(0000)
knlGS:0000000000000000
[   11.509906] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.509906] CR2: 00007fc0da07d070 CR3: 00000003ef1aa006 CR4:
00000000000606e0
[   11.509907] Call Trace:
[   11.509931]  gen6_read32+0x1da/0x1f0 [i915]
[   11.509952]  i915_reg_read_ioctl+0xc0/0x130 [i915]
[   11.509968]  ? drm_gem_handle_delete+0x73/0x90 [drm]
[   11.509988]  ? intel_uncore_fini_mmio+0xa0/0xa0 [i915]
[   11.509998]  drm_ioctl_kernel+0xb2/0x100 [drm]
[   11.510008]  drm_ioctl+0x208/0x360 [drm]
[   11.510029]  ? intel_uncore_fini_mmio+0xa0/0xa0 [i915]
[   11.510033]  ksys_ioctl+0x82/0xc0
[   11.510035]  __x64_sys_ioctl+0x16/0x20
[   11.510038]  do_syscall_64+0x44/0x70
[   11.510040]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   11.510042] RIP: 0033:0x7fc0dbd08f6b
[   11.510043] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff ff ff
85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d d5 ae 0c 00 f7 d8 64 89 01 48
[   11.510044] RSP: 002b:00007ffeffa77968 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   11.510045] RAX: ffffffffffffffda RBX: 00007ffeffa77a10 RCX:
00007fc0dbd08f6b
[   11.510045] RDX: 00007ffeffa77a10 RSI: 00000000c0106471 RDI:
000000000000000f
[   11.510046] RBP: 00000000c0106471 R08: 0000000000000000 R09:
000055bf48dc6010
[   11.510046] R10: 00007ffeffb17080 R11: 0000000000000246 R12:
0000000000000000
[   11.510047] R13: 000000000000000f R14: 000055bf48e23b00 R15:
0000000000000003
[   11.510049] ---[ end trace cc066b47ea04e946 ]---

The system still kind of works but the rendering performance seems reduced and
noticeably sluggish. There are some more

[drm:fw_domains_get [i915]] *ERROR* render: timed out waiting for forcewake ack
request.

messages (but without the backtrace) popping up in dmesg. This is on Arch Linux
with

- kernel 5.8.5
- mesa 20.1.6
- libdrm 2.4.102

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
