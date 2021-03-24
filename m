Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D7348589
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 00:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129B6EAC9;
	Wed, 24 Mar 2021 23:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05036EAC9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 23:50:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B9BE661A1D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 23:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629842;
 bh=x3xujvstwTnSvotYUciRGXg9j3/IwMgpv3cobVgG12k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fn4Jrt3+5IMu5Om8gpREW8Xzpayd5fNF3b2QBmZ7ghdNIzN7TIuTrDW6mfn8oWj2X
 FPPiiLpVUPYnptHq7v73A3kqP0W3MHNx9dMqFDtiaWFjFUFwKvDBiwahXzSTV5f2e2
 4XmaNy7y2QsnF9VToQKwmBJ5ZMjOSf48LAhhMq2ai9X2sx3MrQL5nO/e3qNlSYp4xl
 T1o5FSYx2xP8K8mxragFyWS+c1AAGzTsaIEoljwfo+JUji2n10+dihZF8otml2H9vO
 QtHjh7JTyQbQghYOXJS5BPYxK6wbS0YYjOy4mB4SEKpzoq55CjDmmYMSFB075gD7KH
 AqLlFd8S7QJow==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B779A62AC1; Wed, 24 Mar 2021 23:50:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212425] Kernel warning at drivers/gpu/drm/ttm/ttm_bo.c:517
Date: Wed, 24 Mar 2021 23:50:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-212425-2300-gzIySQWtvt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212425-2300@https.bugzilla.kernel.org/>
References: <bug-212425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212425

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |erhard_f@mailbox.org

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296039
  --> https://bugzilla.kernel.org/attachment.cgi?id=296039&action=edit
dmesg (kernel 5.11.9, Talos II)

Yep, getting these too on my Talos II (ppc64) on kernel 5.11.9. Card is a
Radeon HD6670.

[...]
------------[ cut here ]------------
WARNING: CPU: 8 PID: 1229 at drivers/gpu/drm/ttm/ttm_bo.c:517
.ttm_bo_release+0x298/0x810 [ttm]
Modules linked in: input_leds led_class joydev hid_generic usbhid hid fuse
rfkill sd_mod uas usb_storage scsi_mod ecb xts ctr cbc radeon aes_generic
libaes evdev snd_hda_codec_hdmi>
CPU: 8 PID: 1229 Comm: X Tainted: G        W         5.11.9-gentoo-TalosII #1
NIP:  c00800001a1a7278 LR: c00800001a1a7264 CTR: 0000000000000000
REGS: c000000144763370 TRAP: 0700   Tainted: G        W         
(5.11.9-gentoo-TalosII)
MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44244248  XER: 20040000
CFAR: c000000000bcd1f4 IRQMASK: 0 
 GPR00: c00800001a1a7264 c000000144763610 c00800001a1ba900 c00800001a1b47e8 
 GPR04: 00000000ffffffff 0000000028b10000 00000000722135af 0000000000000008 
 GPR08: 0000000000000001 0000000000000001 0000000000000001 c00000000155d3f8 
 GPR12: 0000000044244248 c0000007ffffd000 0000000000003fff 0000000000000313 
 GPR16: 0000000000000010 000000003ed97f00 00000001467b5a30 0000000000000000 
 GPR20: c000000001206d10 c00000004b960000 c000000001206d18 0000000000000001 
 GPR24: c00000000101deb8 c00000002d5166c0 c00800001a1b47e8 c00000002d516400 
 GPR28: 0000000000000000 c00000002a668a28 c00800001a1b41d0 c00000002d516650 
NIP [c00800001a1a7278] .ttm_bo_release+0x298/0x810 [ttm]
LR [c00800001a1a7264] .ttm_bo_release+0x284/0x810 [ttm]
Call Trace:
[c000000144763610] [c00800001a1a7264] .ttm_bo_release+0x284/0x810 [ttm]
(unreliable)
[c0000001447636e0] [c00800001a1ab154] .ttm_bo_move_accel_cleanup+0x2a4/0x570
[ttm]
[c0000001447637a0] [c00800001bcdea3c] .radeon_bo_move+0x40c/0x610 [radeon]
[c000000144763870] [c00800001a1a621c] .ttm_bo_handle_move_mem+0xac/0x1e0 [ttm]
[c000000144763920] [c00800001a1a9570] .ttm_bo_validate+0x1b0/0x260 [ttm]
[c000000144763a20] [c00800001bce1480]
.radeon_bo_fault_reserve_notify+0x130/0x260 [radeon]
[c000000144763ae0] [c00800001bcde518] .radeon_ttm_fault+0x98/0x1b0 [radeon]
[c000000144763b70] [c000000000347cf8] .__do_fault+0x58/0x120
[c000000144763bf0] [c00000000034f32c] .handle_mm_fault+0x15ec/0x1f80

Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs nfs_ssc lockd grace
sunrpc input_leds led_class joydev hid_generic usbhid hid fuse rfkill sd_mod
uas usb_storage scsi_mod ecb >
CPU: 1 PID: 1229 Comm: X Tainted: G      D W         5.11.9-gentoo-TalosII #1
NIP:  c00800001a1a7278 LR: c00800001a1a7264 CTR: c000000000bcd190
REGS: c000000144763370 TRAP: 0700   Tainted: G      D W         
(5.11.9-gentoo-TalosII)
MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44044244  XER: 20040000
CFAR: c000000000bcd1f4 IRQMASK: 0 
 GPR00: c00800001a1a7264 c000000144763610 c00800001a1ba900 c00800001a1b47e8 
 GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
 GPR08: 0000000000000001 0000000000000001 0000000000000001 000000007fffffff 
 GPR12: c000000000bcd190 c0000007ffffec00 0000000000000080 0000000146899640 
 GPR16: 00003fffa7cf1208 00003fffa7c8d440 0000000146899840 00003fffa7c889f8 
 GPR20: c000000001206d10 c00000004b960000 c000000001206d18 0000000000000001 
 GPR24: c00000000101deb8 c0000000bd492ac0 c00800001a1b47e8 c0000000bd492800 
 GPR28: 0000000000000000 c00000002a668a28 0000000000000000 c0000000bd492a50 
NIP [c00800001a1a7278] .ttm_bo_release+0x298/0x810 [ttm]
LR [c00800001a1a7264] .ttm_bo_release+0x284/0x810 [ttm]
Call Trace:
[c000000144763610] [c00800001a1a7264] .ttm_bo_release+0x284/0x810 [ttm]
(unreliable)
[c0000001447636e0] [c00800001a1ab154] .ttm_bo_move_accel_cleanup+0x2a4/0x570
[ttm]
[c0000001447637a0] [c00800001bcdea3c] .radeon_bo_move+0x40c/0x610 [radeon]
[c000000144763870] [c00800001a1a621c] .ttm_bo_handle_move_mem+0xac/0x1e0 [ttm]
[c000000144763920] [c00800001a1a9570] .ttm_bo_validate+0x1b0/0x260 [ttm]
[c000000144763a20] [c00800001bce1480]
.radeon_bo_fault_reserve_notify+0x130/0x260 [radeon]
[c000000144763ae0] [c00800001bcde518] .radeon_ttm_fault+0x98/0x1b0 [radeon]
[c000000144763b70] [c000000000347cf8] .__do_fault+0x58/0x120
[c000000144763bf0] [c00000000034f32c] .handle_mm_fault+0x15ec/0x1f80
[c000000144763d40] [c000000000063e84] .do_page_fault+0x2b4/0xa00
[c000000144763e10] [c00000000000c218] handle_page_fault+0x10/0x2c
--- interrupt: 300 at 0x3fffa7ca6d24
NIP:  00003fffa7ca6d24 LR: 00003fffa7ca6d00 CTR: 00003fffb21186bc
REGS: c000000144763e80 TRAP: 0300   Tainted: G      D W         
(5.11.9-gentoo-TalosII)
MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 44028842  XER:
00000000
CFAR: 00003fffb3ac5a58 DAR: 00003fffa6727000 DSISR: 42000000 IRQMASK: 0 
 GPR00: 00003fffa7ca6d00 00003fffdfe98710 00003fffa7cf7600 00003fffa78a2010 
 GPR04: 000000014689d8b0 0000000000000011 0000000146fc3b40 0000000000000068 
 GPR08: 0000000000000001 0000000000000001 0000000000000096 0000000000000000 
 GPR12: 0000000000000001 00003fffb4cd4810 0000000000000080 0000000146899640 
 GPR16: 00003fffa7cf1208 00003fffa7c8d440 0000000146899840 00003fffa7c889f8 
 GPR20: 00003fffdfe98ba8 0000000000000001 0000000146899640 000000014787b3c8 
 GPR24: 00003fffa6727000 000000014787b300 00003fffdfe98fb0 00003fffdfe98fa0 
 GPR28: 000000000000002a 000000014770f960 0000000000000068 0000000000000001 
NIP [00003fffa7ca6d24] 0x3fffa7ca6d24
LR [00003fffa7ca6d00] 0x3fffa7ca6d00
--- interrupt: 300
Instruction dump:
e8898188 48009675 e8410028 39200001 7f43d378 993f0058 48008d61 e8410028 
813f009c 39000001 2c290000 7d40409e <0b0a0000> 40820498 39200001 913f0000 
irq event stamp: 2872594
hardirqs last  enabled at (2872593): [<c000000000bcd694>]
._raw_spin_unlock_irqrestore+0x84/0xc0
hardirqs last disabled at (2872594): [<c000000000bc4834>]
.__schedule+0x524/0xe00
softirqs last  enabled at (2872210): [<c000000000bcea9c>]
.__do_softirq+0x64c/0x6c0
softirqs last disabled at (2872205): [<c0000000000de4b8>] .irq_exit+0x198/0x1f0
---[ end trace e1da02ebb1a3a186 ]---


 # inxi -b
System:    Kernel: 5.11.9-gentoo-TalosII ppc64 bits: 64 Desktop: MATE 1.24.1 
           Distro: Gentoo Base System release 2.7 
Machine:   Type: PowerPC Device System: T2P9D01 REV 1.01 details: PowerNV
T2P9D01 REV 1.01 rev: 2.2 (pvr 004e 1202) 
CPU:       Info: 32-Core POWER9 altivec supported [MCP] speed: 2237 MHz
min/max: 2154/3800 MHz 
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Turks XT [Radeon HD
6670/7670] driver: radeon v: kernel 
           Device-2: ASPEED Graphics Family driver: N/A 
           Display: x11 server: X.Org 1.20.10 driver: ati,radeon unloaded:
fbdev,modesetting resolution: 1920x1080~60Hz 
           OpenGL: renderer: AMD TURKS (DRM 2.50.0 / 5.11.9-gentoo-TalosII LLVM
11.0.0) v: 3.2 Mesa 21.0.0 
Network:   Device-1: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3 
           Device-2: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
