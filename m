Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBE276CFA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 11:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9EA6E193;
	Thu, 24 Sep 2020 09:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3444F89CE3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 09:24:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209373] New: Pixels
Date: Thu, 24 Sep 2020 09:24:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rapp.jens@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209373

            Bug ID: 209373
           Summary: Pixels
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0-1-amd64, but also 5.7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rapp.jens@gmail.com
        Regression: No

Created attachment 292613
  --> https://bugzilla.kernel.org/attachment.cgi?id=292613&action=edit
screenshot of pixelated screen

I'm running debian bullseye on a thinkpad e595 with ryzen 3700u (VEGA 10 GPU)
From time to time I get weird pixels spread on screen. Sometimes they look like
distorted parts of my displayed windows (like text console). 

Weird thing is, when I drag a window, the spreaded pixels on it also move.
Pixels seem to "re-spread" when the window gets redrawn.

Sometimes this effect vanishes but only for some hours or days. 
I also tried a live linux system (manjaro) which gave the same error.

Grub boot screen looks fine, simple text console mode, too. So I think it's
some hardware rendering issue..

Since i don't run Windows I could not see if this gets those errors, too.
All I tried was running Windows installer up to the time where it wants to
format my drive- There haven't been any graphics issues but I'm not shure if
Windows installer does hardware rendering ( some people told me it does )

I didn't find much in my logs.. but here they are.

$ sudo dmesg -x -l crit,err,warn
kern :warn : [ 0.378239] TSC synchronization [CPU#0 -> CPU#1]:
kern :warn : [ 0.378239] Measured 6970522673 cycles TSC warp between CPUs,
turning off TSC clock.
kern :warn : [ 0.378334] #2 #3 #4 #5 #6 #7
kern :warn : [ 1.196110] pci 0000:00:00.2: can't derive routing for PCI INT A
kern :warn : [ 1.196111] pci 0000:00:00.2: PCI INT A: not connected
kern :warn : [ 1.199508] PPR NX GT IA GA PC GA_vAPIC
kern :warn : [ 1.501357] Unstable clock detected, switching default tracing
clock to "global"
If you want to keep using the local clock, then add:
"trace_clock=local"
on the kernel command line
kern :warn : [ 1.637520] acpi PNP0C14:01: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
kern :warn : [ 1.637590] acpi PNP0C14:02: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
kern :warn : [ 1.637647] acpi PNP0C14:03: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
kern :warn : [ 1.652129] r8169 0000:02:00.0: can't disable ASPM; OS doesn't
have ASPM control
kern :err : [ 2.381817] irq 7: nobody cared (try booting with the "irqpoll"
option)
kern :warn : [ 2.381846] CPU: 3 PID: 0 Comm: swapper/3 Not tainted
5.7.0-3-amd64 #1 Debian 5.7.17-1
kern :warn : [ 2.381846] Hardware name: LENOVO 20NF0000GE/20NF0000GE, BIOS
R11ET32W (1.12 ) 12/23/2019
kern :warn : [ 2.381847] Call Trace:
kern :warn : [ 2.381849] <IRQ>
kern :warn : [ 2.381855] dump_stack+0x66/0x90
kern :warn : [ 2.381859] __report_bad_irq+0x38/0xad
kern :warn : [ 2.381861] note_interrupt.cold+0xb/0x6e
kern :warn : [ 2.381862] handle_irq_event_percpu+0x72/0x80
kern :warn : [ 2.381864] handle_irq_event+0x3c/0x5c
kern :warn : [ 2.381865] handle_fasteoi_irq+0xa3/0x160
kern :warn : [ 2.381868] do_IRQ+0x53/0xe0
kern :warn : [ 2.381870] common_interrupt+0xf/0xf
kern :warn : [ 2.381871] </IRQ>
kern :warn : [ 2.381874] RIP: 0010:tick_nohz_idle_enter+0x43/0x50
kern :warn : [ 2.381875] Code: e5 4e 73 48 83 bb b0 00 00 00 00 75 1f 80 4b 4c
01 e8 c1 17 ff ff 80 4b 4c 04 48 89 43 78 e8 14 86 f9 ff fb 66 0f 1f 44 00 00
<5b> c3 0f 0b eb dd 0f 1f 80 00 00 00 00 0f 1f 44 00 00 53 48 c7 c3
kern :warn : [ 2.381876] RSP: 0018:ffffc2fb8015fec8 EFLAGS: 00000246 ORIG_RAX:
ffffffffffffffde
kern :warn : [ 2.381878] RAX: 000000008df61552 RBX: ffff9f18f0ae06c0 RCX:
000000008df5f8fc
kern :warn : [ 2.381879] RDX: 000000008e020d58 RSI: 000000008df5f8fc RDI:
fffffffffff3eba4
kern :warn : [ 2.381879] RBP: 000000000000008e R08: 000000008df61552 R09:
0000000000000000
kern :warn : [ 2.381880] R10: 0000000000000000 R11: 000000000000000c R12:
ffff9f1647f8db80
kern :warn : [ 2.381881] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
kern :warn : [ 2.381883] ? tick_nohz_idle_enter+0x3c/0x50
kern :warn : [ 2.381885] do_idle+0x3f/0x280
kern :warn : [ 2.381887] cpu_startup_entry+0x19/0x20
kern :warn : [ 2.381890] start_secondary+0x169/0x1c0
kern :warn : [ 2.381892] secondary_startup_64+0xa4/0xb0
kern :err : [ 2.381893] handlers:
kern :err : [ 2.381905] [<00000000595fde45>] amd_gpio_irq_handler
daemon:warn : [ 2.782479] systemd[1]:
/lib/systemd/system/plymouth-start.service:16: Unit configured to use
KillMode=none. This is unsafe, as it disables systemd's process lifecycle
management for the service. Please update your service to use a safer
KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is
deprecated and will eventually be removed.
kern :err : [ 3.002393] tpm tpm0: tpm_try_transmit: send(): error -5
kern :err : [ 3.002439] tpm tpm0: [Firmware Bug]: TPM interrupt not working,
polling instead
kern :warn : [ 3.336573] uvcvideo 3-2:1.0: Entity type for entity Extension 3
was not initialized!
kern :warn : [ 3.336575] uvcvideo 3-2:1.0: Entity type for entity Processing 2
was not initialized!
kern :warn : [ 3.336577] uvcvideo 3-2:1.0: Entity type for entity Camera 1 was
not initialized!
kern :warn : [ 10.830972] kauditd_printk_skb: 10 callbacks suppressed
kern :warn : [ 11.400429] process 'docker/tmp/qemu-check970636301/check'
started with executable stack
kern :warn : [ 47.122489] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting
kern :warn : [ 51.122558] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting
kern :warn : [ 55.122296] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting
kern :warn : [ 77.170846] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting
kern :warn : [ 85.138279] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting
kern :warn : [ 125.138770] rtw_pci 0000:04:00.0: firmware failed to restore
hardware setting

$ sudo journalctl -p err..alert
...
-- Reboot --
Sep 08 10:43:58 tecdroid kernel: irq 7: nobody cared (try booting with the
"irqpoll" option)
Sep 08 10:43:58 tecdroid kernel: handlers:
Sep 08 10:43:58 tecdroid kernel: [<00000000595fde45>] amd_gpio_irq_handler
Sep 08 10:43:58 tecdroid kernel: tpm tpm0: tpm_try_transmit: send(): error -5
Sep 08 10:43:58 tecdroid kernel: tpm tpm0: [Firmware Bug]: TPM interrupt not
working, polling instead
Sep 08 10:43:59 tecdroid bluetoothd[588]: Sap driver initialization failed.
Sep 08 10:43:59 tecdroid bluetoothd[588]: sap-server: Operation not permitted
(1)
Sep 08 10:43:59 tecdroid bluetoothd[588]: Failed to set mode: Blocked through
rfkill (0x12)
Sep 08 10:44:27 tecdroid lightdm[1013]: gkr-pam: unable to locate daemon
control file

$ sudo journalctl -b -g amdgpu
-- Logs begin at Wed 2020-05-27 15:14:07 CEST, end at Tue 2020-09-08 10:46:57
CEST. --
Sep 08 10:43:58 tecdroid kernel: [drm] amdgpu kernel modesetting enabled.
Sep 08 10:43:58 tecdroid kernel: fb0: switching to amdgpudrmfb from EFI VGA
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: vgaarb: deactivate vga
console
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: enabling device (0006 ->
0007)
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_gpu_info.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_sdma.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: VRAM: 2048M
0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: GART: 1024M
0x0000000000000000 - 0x000000003FFFFFFF
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: AGP: 267419648M
0x000000F800000000 - 0x0000FFFFFFFFFFFF
Sep 08 10:43:58 tecdroid kernel: [drm] amdgpu: 2048M of VRAM memory ready
Sep 08 10:43:58 tecdroid kernel: [drm] amdgpu: 3072M of GTT memory ready.
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_asd.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_ta.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_pfp.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_me.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_ce.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_rlc.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_mec.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_mec2.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu: [powerplay] hwmgr_sw_init smu backed
is smu10_smu
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/raven_dmcu.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: firmware: direct-loading
firmware amdgpu/picasso_vcn.bin
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: RAS: optional ras ta
ucode is not available
Sep 08 10:43:58 tecdroid kernel: fbcon: amdgpudrmfb (fb0) is primary device
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: fb0: amdgpudrmfb frame
buffer device
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring gfx uses VM inv eng
0 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.0.0 uses VM
inv eng 1 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.1.0 uses VM
inv eng 4 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.2.0 uses VM
inv eng 5 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.3.0 uses VM
inv eng 6 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.0.1 uses VM
inv eng 7 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.1.1 uses VM
inv eng 8 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.2.1 uses VM
inv eng 9 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring comp_1.3.1 uses VM
inv eng 10 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring kiq_2.1.0 uses VM
inv eng 11 on hub 0
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring sdma0 uses VM inv
eng 0 on hub 1
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring vcn_dec uses VM inv
eng 1 on hub 1
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring vcn_enc0 uses VM inv
eng 4 on hub 1
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring vcn_enc1 uses VM inv
eng 5 on hub 1
Sep 08 10:43:58 tecdroid kernel: amdgpu 0000:05:00.0: ring jpeg_dec uses VM inv
eng 6 on hub 1
Sep 08 10:43:58 tecdroid kernel: [drm] Initialized amdgpu 3.37.0 20150101 for
0000:05:00.0 on minor 0
Sep 08 10:43:58 tecdroid systemd[1]: Starting Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0...
Sep 08 10:43:58 tecdroid systemd[1]: Finished Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0.
Sep 08 10:43:58 tecdroid kernel: snd_hda_intel 0000:05:00.1: bound 0000:05:00.0
(ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Sep 08 10:43:58 tecdroid systemd-backlight[338]: amdgpu_bl0: Saved brightness
65535 too high; decreasing to 255.
Sep 08 10:43:59 tecdroid sensors[602]: amdgpu-pci-0500

Hope, this is enough info.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
