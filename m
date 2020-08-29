Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED638256889
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 17:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D716E091;
	Sat, 29 Aug 2020 15:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC06E091
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 15:12:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209071] New: Nouveau dual monitor setup: After unlock
 xscreensaver, VGA-1 remains black
Date: Sat, 29 Aug 2020 15:12:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: megia.oscar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209071

            Bug ID: 209071
           Summary: Nouveau dual monitor setup: After unlock xscreensaver,
                    VGA-1 remains black
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.3-arch1-1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: megia.oscar@gmail.com
        Regression: No

Created attachment 292209
  --> https://bugzilla.kernel.org/attachment.cgi?id=292209&action=edit
output from lshw

I have archlinux upgraded system last sunday.

Today after unlock xscreensaver on OpenBox, the screen connected to VGA-1 port
remained black. I need to switch off and switch on mypc to make work it.

The is the log from journalctl:

ago 29 15:13:17 mypc kernel: ------------[ cut here ]------------
ago 29 15:13:17 mypc kernel: NETDEV WATCHDOG: enp3s0 (r8169): transmit queue 0
timed out
ago 29 15:13:17 mypc kernel: WARNING: CPU: 1 PID: 0 at
net/sched/sch_generic.c:442 dev_watchdog+0x26d/0x280
ago 29 15:13:17 mypc kernel: Modules linked in: snd_seq_dummy snd_hrtimer
snd_seq snd_seq_device fuse rfkill squashfs loop nouveau snd_hda_codec_analog
snd_hda_codec_generic pktcdvd ledtrig_audio iTCO_wdt snd_hda_codec_hdmi mxm_wmi
intel_pmc_bxt ppdev mousedev wmi i2c_algo_bit gpio_ich iTCO_vendor_support
snd_hda_intel ttm snd_intel_dspcfg snd_hda_codec drm_kms_helper snd_hda_core
input_leds cec r8169 snd_hwdep snd_pcm rc_core snd_timer syscopyarea snd
sysfillrect sysimgblt fb_sys_fops realtek soundcore evdev libphy parport_pc
mac_hid parport asus_atk0110 intel_agp lpc_ich i2c_i801 intel_gtt i2c_smbus
acpi_cpufreq drm sg agpgart crypto_user ip_tables x_tables ext4 crc32c_generic
crc16 mbcache jbd2 uas usb_storage hid_generic usbhid hid sr_mod cdrom
ata_generic pata_acpi dm_mod serio_raw atkbd libps2 uhci_hcd pata_jmicron
ehci_pci ehci_hcd i8042 serio
ago 29 15:13:17 mypc kernel: CPU: 1 PID: 0 Comm: swapper/1 Not tainted
5.8.3-arch1-1 #1
ago 29 15:13:17 mypc kernel: Hardware name: System manufacturer System Product
Name/P5B, BIOS 2104    03/09/2009
ago 29 15:13:17 mypc kernel: RIP: 0010:dev_watchdog+0x26d/0x280
ago 29 15:13:17 mypc kernel: Code: d8 9b 75 ff eb 85 4c 89 f7 c6 05 b3 df 08 01
01 e8 e8 c7 fa ff 44 89 e9 4c 89 f6 48 c7 c7 70 4a a1 89 48 89 c2 e8 39 76 7e
ff <0f> 0b e9 63 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44
ago 29 15:13:17 mypc kernel: RSP: 0018:ffffb332400ece90 EFLAGS: 00010286
ago 29 15:13:17 mypc kernel: RAX: 0000000000000000 RBX: ffff9e51f485ac00 RCX:
0000000000000000
ago 29 15:13:17 mypc kernel: RDX: 0000000000000103 RSI: ffffffff8996a47f RDI:
00000000ffffffff
ago 29 15:13:17 mypc kernel: RBP: ffff9e51f51d23dc R08: 0000000000000433 R09:
0000000000000003
ago 29 15:13:17 mypc kernel: R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9e51f51d2480
ago 29 15:13:17 mypc kernel: R13: 0000000000000000 R14: ffff9e51f51d2000 R15:
ffff9e51f485ac80
ago 29 15:13:17 mypc kernel: FS:  0000000000000000(0000)
GS:ffff9e51f7c80000(0000) knlGS:0000000000000000
ago 29 15:13:17 mypc kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
ago 29 15:13:17 mypc kernel: CR2: 00007f2a199ab28c CR3: 00000001b2a2a000 CR4:
00000000000006e0
ago 29 15:13:17 mypc kernel: Call Trace:
ago 29 15:13:17 mypc kernel:  <IRQ>
ago 29 15:13:17 mypc kernel:  ? pfifo_fast_init+0x110/0x110
ago 29 15:13:17 mypc kernel:  ? pfifo_fast_init+0x110/0x110
ago 29 15:13:17 mypc kernel:  call_timer_fn+0x2d/0x160
ago 29 15:13:17 mypc kernel:  ? pfifo_fast_init+0x110/0x110
ago 29 15:13:17 mypc kernel:  __run_timers+0x193/0x290
ago 29 15:13:17 mypc kernel:  run_timer_softirq+0x2b/0x50
ago 29 15:13:17 mypc kernel:  __do_softirq+0xff/0x340
ago 29 15:13:17 mypc kernel:  asm_call_on_stack+0x12/0x20
ago 29 15:13:17 mypc kernel:  </IRQ>
ago 29 15:13:17 mypc kernel:  do_softirq_own_stack+0x5f/0x80
ago 29 15:13:17 mypc kernel:  irq_exit_rcu+0xcb/0x120
ago 29 15:13:17 mypc kernel:  sysvec_apic_timer_interrupt+0x46/0xe0
ago 29 15:13:17 mypc kernel:  asm_sysvec_apic_timer_interrupt+0x12/0x20
ago 29 15:13:17 mypc kernel: RIP: 0010:native_safe_halt+0xe/0x10
ago 29 15:13:17 mypc kernel: Code: f0 80 48 02 20 48 8b 00 a8 08 75 c3 e9 7a ff
ff ff cc cc cc cc cc cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d 86 da 5f 00 fb
f4 <c3> 90 e9 07 00 00 00 0f 00 2d 76 da 5f 00 f4 c3 cc cc 0f 1f 44 00
ago 29 15:13:17 mypc kernel: RSP: 0018:ffffb33240097e20 EFLAGS: 00000246
ago 29 15:13:17 mypc kernel: RAX: 0000000000004000 RBX: 0000000000000001 RCX:
000000000000001f
ago 29 15:13:17 mypc kernel: RDX: 4ec4ec4ec4ec4ec5 RSI: ffffffff89a04c55 RDI:
ffffffff8999c80e
ago 29 15:13:17 mypc kernel: RBP: ffff9e51f65b1c00 R08: 00001aee947ef30b R09:
0000000000000008
ago 29 15:13:17 mypc kernel: R10: 0000000000002a48 R11: 0000000000000009 R12:
ffff9e51f65b1c64
ago 29 15:13:17 mypc kernel: R13: 0000000000000001 R14: 0000000000000001 R15:
0000000000000000
ago 29 15:13:17 mypc kernel:  acpi_safe_halt+0x1b/0x30
ago 29 15:13:17 mypc kernel:  acpi_idle_enter+0x2b9/0x320
ago 29 15:13:17 mypc kernel:  cpuidle_enter_state+0x81/0x420
ago 29 15:13:17 mypc kernel:  cpuidle_enter+0x29/0x40
ago 29 15:13:17 mypc kernel:  do_idle+0x1fb/0x2c0
ago 29 15:13:17 mypc kernel:  cpu_startup_entry+0x19/0x20
ago 29 15:13:17 mypc kernel:  start_secondary+0x178/0x1c0
ago 29 15:13:17 mypc kernel:  secondary_startup_64+0xb6/0xc0
ago 29 15:13:17 mypc kernel: ---[ end trace 88955c3f67234b66 ]---

I use the video driver nouveau for my NVIDIA GeForce GT 710.

I attached the output from lshw.

If you need more information don't hesitate ask me for it.
Oscar

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
