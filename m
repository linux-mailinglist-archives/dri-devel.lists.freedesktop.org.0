Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B681F332A8F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 16:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2F6E0DC;
	Tue,  9 Mar 2021 15:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C536E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 15:33:20 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id n12so10440421ili.15
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 07:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=i3bJh0n/iRCHRnQEcfouspzVyDO7m+fcgDKM8Pc2v7U=;
 b=GopBZtHONRB+wN946/rpurYM4ZQkBI9MBU1N/JHnUGrPuwntYnBBWsFMe01WKnJYQx
 GFrGa941FuMrKNU8NS8gp2N7svIgJ7YEzBC2xNUqrM4QyS0yOd9RLoGSwyPOJkbM0wy9
 EgT3o3YyUWCb7DlWMzNHNjkPyUTVUDxSQH0p1P3fwtKKjTnv3w93/OoSX7q4OpZLwTfJ
 Bbcejpw/8XlH+RJ91OIl0BWXiZ05L9t4c3WHUx4Bej7pU7zVgtw3JN0MCqY6aKdN/HrG
 jefcfl7HRJ8q61LddFM760HdujxWG/JITpoSRypS4924SaYSlrQX/VIK5REpgsjHu7nd
 SqUg==
X-Gm-Message-State: AOAM530luo/Rim3uKWKSgf+dtLxw+5pPV/55h5W8jjBsOvsLKVx+8nyJ
 bsCdOwYGkg373YqmeEbelpwSXjfRjCRBvVcYEzZiQc3BuAyg
X-Google-Smtp-Source: ABdhPJzFQ/OkQDLzxvBgiV0KstiLfQVTAddPbnHcGgIErwJfRp8tZVdKiw1FIi/VRKn9Ja5QsIoB+Zrz4ltOIRgbISgaZuyDHadg
MIME-Version: 1.0
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr24966046ilt.149.1615303999562; 
 Tue, 09 Mar 2021 07:33:19 -0800 (PST)
Date: Tue, 09 Mar 2021 07:33:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000192a2105bd1c45b3@google.com>
Subject: [syzbot] WARNING in __hrtimer_run_queues
From: syzbot <syzbot+b0b2da1e0f732c818975@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 09 Mar 2021 15:34:45 +0000
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

Hello,

syzbot found the following issue on:

HEAD commit:    144c79ef Merge tag 'perf-tools-fixes-for-v5.12-2020-03-07'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16972ea2d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9008fb06fa15d749
dashboard link: https://syzkaller.appspot.com/bug?extid=b0b2da1e0f732c818975
compiler:       Debian clang version 11.0.1-2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0b2da1e0f732c818975@syzkaller.appspotmail.com

------------[ cut here ]------------
raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 1 PID: 10032 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x1f/0x30 kernel/locking/irqflag-debug.c:10
Modules linked in:
CPU: 1 PID: 10032 Comm: syz-executor.2 Not tainted 5.12.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:warn_bogus_irq_restore+0x1f/0x30 kernel/locking/irqflag-debug.c:10
Code: cc cc cc cc cc cc cc cc cc cc cc 80 3d 73 49 54 04 00 74 01 c3 c6 05 69 49 54 04 01 48 c7 c7 60 5d ae 89 31 c0 e8 41 1f fa f7 <0f> 0b c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc 41 56 53 48 83
------------[ cut here ]------------
WARNING: CPU: 1 PID: 10032 at drivers/gpu/drm/vkms/vkms_crtc.c:21 vkms_vblank_simulate+0x2c1/0x320 drivers/gpu/drm/vkms/vkms_crtc.c:21
Modules linked in:
CPU: 1 PID: 10032 Comm: syz-executor.2 Not tainted 5.12.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:vkms_vblank_simulate+0x2c1/0x320 drivers/gpu/drm/vkms/vkms_crtc.c:21
Code: 00 00 00 48 c7 c6 a0 28 28 8a 31 c0 e8 18 71 ef ff b8 01 00 00 00 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d c3 e8 df e0 13 fd <0f> 0b e9 e8 fd ff ff 89 d9 80 e1 07 38 c1 0f 8c 5c fe ff ff 48 89
RSP: 0018:ffffc90000dc04a8 EFLAGS: 00010046
RAX: ffffffff8464ccc1 RBX: 0000000000000002 RCX: ffff8880155bb780
RDX: 0000000000010103 RSI: 0000000000000002 RDI: 0000000000000001
RBP: ffff8880b9d26260 R08: ffffffff8464caa1 R09: fffffbfff1b6a1e6
R10: fffffbfff1b6a1e6 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff110033593d2 R14: 0000000000fe4c00 R15: ffff888019ac8d30
FS:  0000000001b6c400(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000002e97708 CR3: 000000001ba55000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __run_hrtimer kernel/time/hrtimer.c:1519 [inline]
 __hrtimer_run_queues+0x4c9/0xa00 kernel/time/hrtimer.c:1583
 hrtimer_interrupt+0x393/0xf70 kernel/time/hrtimer.c:1645
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1089 [inline]
 __sysvec_apic_timer_interrupt+0xf9/0x270 arch/x86/kernel/apic/apic.c:1106
 sysvec_apic_timer_interrupt+0x3e/0xb0 arch/x86/kernel/apic/apic.c:1100
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
RIP: 0010:console_unlock+0xaab/0xe00 kernel/printk/printk.c:2586
Code: 84 5a f7 ff ff eb 29 e8 73 53 18 00 e8 2e 68 ed 07 4d 85 f6 74 df 66 0f 1f 84 00 00 00 00 00 e8 5b 53 18 00 fb f6 44 24 0f 01 <0f> 84 2f f7 ff ff e8 4a 53 18 00 48 c7 c7 b4 4d 6f 8b be 1b 0a 00
RSP: 0018:ffffc90000dc0800 EFLAGS: 00000246
RAX: ffffffff81605a45 RBX: 0000000000000000 RCX: ffff8880155bb780
RDX: 0000000000000103 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90000dc0918 R08: ffffffff81605a02 R09: fffffbfff1f27aa9
R10: fffffbfff1f27aa9 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffffffff19ed295 R14: 0000000000000200 R15: 1ffffffff19ed28e
 vprintk_emit+0x1ab/0x270 kernel/printk/printk.c:2098
 printk+0x62/0x83 kernel/printk/printk.c:2146
 show_opcodes+0xc1/0xe0 arch/x86/kernel/dumpstack.c:129
 show_ip arch/x86/kernel/dumpstack.c:150 [inline]
 show_iret_regs+0x2f/0x60 arch/x86/kernel/dumpstack.c:155
 __show_regs+0x29/0x580 arch/x86/kernel/process_64.c:73
 show_regs+0x35/0x60 arch/x86/kernel/dumpstack.c:469
 __warn+0x12f/0x270 kernel/panic.c:595
 report_bug+0x1b1/0x2e0 lib/bug.c:195
 handle_bug+0x3d/0x70 arch/x86/kernel/traps.c:239
 exc_invalid_op+0x16/0x40 arch/x86/kernel/traps.c:259
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:575
RIP: 0010:warn_bogus_irq_restore+0x1f/0x30 kernel/locking/irqflag-debug.c:10
Code: cc cc cc cc cc cc cc cc cc cc cc 80 3d 73 49 54 04 00 74 01 c3 c6 05 69 49 54 04 01 48 c7 c7 60 5d ae 89 31 c0 e8 41 1f fa f7 <0f> 0b c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc 41 56 53 48 83
RSP: 0018:ffffc90000dc0c78 EFLAGS: 00010246
RAX: 74fd7735e664bd00 RBX: ffff888019090088 RCX: ffff8880155bb780
RDX: 0000000000000102 RSI: 0000000000000102 RDI: 0000000000000000
RBP: 1ffff920001b8190 R08: ffffffff81605e52 R09: ffffed10173a3f1c
R10: ffffed10173a3f1c R11: 0000000000000000 R12: 0000000000000003
R13: ffff88823ffe6dc0 R14: 0000000000000246 R15: dffffc0000000000
 kvm_wait+0x10e/0x160 arch/x86/kernel/kvm.c:860
 pv_wait arch/x86/include/asm/paravirt.h:564 [inline]
 pv_wait_head_or_lock kernel/locking/qspinlock_paravirt.h:470 [inline]
 __pv_queued_spin_lock_slowpath+0x6b5/0xb90 kernel/locking/qspinlock.c:508
 pv_queued_spin_lock_slowpath arch/x86/include/asm/paravirt.h:554 [inline]
 queued_spin_lock_slowpath arch/x86/include/asm/qspinlock.h:51 [inline]
 queued_spin_lock include/asm-generic/qspinlock.h:85 [inline]
 do_raw_spin_lock+0x430/0x810 kernel/locking/spinlock_debug.c:113
 spin_lock include/linux/spinlock.h:354 [inline]
 tcp_tsq_handler+0x20/0x1f0 net/ipv4/tcp_output.c:1029
 tcp_tasklet_func+0x403/0x450 net/ipv4/tcp_output.c:1063
 tasklet_action_common+0x11c/0x3f0 kernel/softirq.c:557
 __do_softirq+0x318/0x714 kernel/softirq.c:345
 invoke_softirq kernel/softirq.c:221 [inline]
 __irq_exit_rcu+0x1d8/0x200 kernel/softirq.c:422
 irq_exit_rcu+0x5/0x20 kernel/softirq.c:434
 common_interrupt+0xa1/0xc0 arch/x86/kernel/irq.c:240
 </IRQ>
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:623
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:161 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x7a/0xc0 kernel/locking/spinlock.c:191
Code: 00 fc ff df 80 3c 08 00 74 08 48 89 e7 e8 0e f9 6c f8 f7 04 24 00 02 00 00 75 37 41 f7 c6 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> 81 7f 02 f8 65 8b 05 a2 e4 b1 76 85 c0 74 28 65 48 8b 04 25 28
RSP: 0018:ffffc90016f27d88 EFLAGS: 00000206
RAX: 1ffff92002de4fb1 RBX: ffff8880b9d26180 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffffffff817eade0 R09: ffffed10173a4c31
R10: ffffed10173a4c31 R11: 0000000000000000 R12: ffffc90016f27e58
R13: 00000000000f4240 R14: 0000000000000286 R15: 0000000000000001
 hrtimer_start_expires include/linux/hrtimer.h:436 [inline]
 hrtimer_sleeper_start_expires kernel/time/hrtimer.c:1799 [inline]
 do_nanosleep+0x17c/0x740 kernel/time/hrtimer.c:1875
 hrtimer_nanosleep+0x1b9/0x350 kernel/time/hrtimer.c:1931
 __do_sys_clock_nanosleep kernel/time/posix-timers.c:1267 [inline]
 __se_sys_clock_nanosleep kernel/time/posix-timers.c:1245 [inline]
 __x64_sys_clock_nanosleep+0x2f6/0x340 kernel/time/posix-timers.c:1245
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x48a631
Code: 24 0c 89 3c 24 48 89 4c 24 18 e8 aa e2 ff ff 4c 8b 54 24 18 48 8b 54 24 10 41 89 c0 8b 74 24 0c 8b 3c 24 b8 e6 00 00 00 0f 05 <44> 89 c7 48 89 04 24 e8 e3 e2 ff ff 48 8b 04 24 eb 97 66 2e 0f 1f
RSP: 002b:00007ffee856c320 EFLAGS: 00000293 ORIG_RAX: 00000000000000e6
RAX: ffffffffffffffda RBX: 000000000002189a RCX: 000000000048a631
RDX: 00007ffee856c360 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000010
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000056bf60
R13: 000000000056c9e0 R14: 000000000056bf60 R15: 0000000000021559


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
