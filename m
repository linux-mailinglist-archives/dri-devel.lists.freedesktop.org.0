Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F52A2073
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77E16EB42;
	Sun,  1 Nov 2020 17:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F2B88A58
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 06:14:19 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id y15so6225333ilp.19
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 23:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=rkjvzxYfDZDr/kKEmWkJIKU9mlk3DIFp+Fpj4HynMVo=;
 b=aOIECgbgR5GEBHKc8PN0/EXmn68Tl6F8wbxcx1fMsJQt0FBAFMc8U8TVjL5DRAfjnh
 5IweehuqSLp15ioJjxb1AJHxPxr8XK7AWlehCETc9K+5s3h7DijPRiudN7DSuiZFRozN
 BujjfxHVeUhxH8JDM61G+JNtlEdozEXZy3onR0jWgxACsZ53LQs2Z5vfyMRmMYJ6Fhak
 wGSJ6dcTdCnbwsMT51IrSybKhgbEJvlOQnlnapBpETrjSLqdIlyR7YWeGnYFvDB/bRFY
 C1eHbQlTv+jyTFj/0G3t3Z71iGtUDEeodQ1Xy78oOqVPoulcK3SfEx7InFFcV4WtI4dx
 iQxw==
X-Gm-Message-State: AOAM533owPGggzdKAoMAYgcnSpBhm6L5jqMG9VAWKdkQPBXgTKcM+pYj
 fu1SGsxJY4ytDz+rZVUW3+iS+H82KdK4l7igYarSpKGs8kQY
X-Google-Smtp-Source: ABdhPJypkpupBDU6TcMP0bm+7oqikDemEodNPdzkLUhm1RqlxE05epf6h++O7rxWP6lZ6flKG1R9tYApU+1STtR2IhdkaiV2KBZ9
MIME-Version: 1.0
X-Received: by 2002:a02:242b:: with SMTP id f43mr4785183jaa.111.1604124859291; 
 Fri, 30 Oct 2020 23:14:19 -0700 (PDT)
Date: Fri, 30 Oct 2020 23:14:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069dbc805b2f16c3e@google.com>
Subject: WARNING in vkms_vblank_simulate (2)
From: syzbot <syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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

HEAD commit:    3f267ec6 Add linux-next specific files for 20201029
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=170739d2500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f00c6dd47ae4c2c
dashboard link: https://syzkaller.appspot.com/bug?extid=4fc21a003c8332eb0bdd
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e83ef2500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=159f01f2500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 34 at drivers/gpu/drm/vkms/vkms_crtc.c:21 vkms_vblank_simulate+0x31e/0x3b0 drivers/gpu/drm/vkms/vkms_crtc.c:21
Modules linked in:
CPU: 0 PID: 34 Comm: kauditd Not tainted 5.10.0-rc1-next-20201029-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:vkms_vblank_simulate+0x31e/0x3b0 drivers/gpu/drm/vkms/vkms_crtc.c:21
Code: 85 9e 00 00 00 48 8b 95 b8 01 00 00 4c 89 e1 bf 02 00 00 00 48 c7 c6 20 e6 b3 89 e8 0c 91 ef ff e9 e5 fe ff ff e8 72 e0 34 fd <0f> 0b e9 88 fd ff ff e8 e6 7b 76 fd e9 11 fe ff ff 4c 89 ef e8 d9
RSP: 0018:ffffc90000007dc0 EFLAGS: 00010046
RAX: 0000000000010001 RBX: ffff888143c91e48 RCX: ffffffff843b47c3
RDX: ffff888010fa0000 RSI: ffffffff843b4a3e RDI: 0000000000000007
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff888143c90d40
R13: 0000000000fe4c00 R14: ffffffff843b4720 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff2c859fb4 CR3: 0000000013fee000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __run_hrtimer kernel/time/hrtimer.c:1519 [inline]
 __hrtimer_run_queues+0x693/0xea0 kernel/time/hrtimer.c:1583
 hrtimer_interrupt+0x334/0x940 kernel/time/hrtimer.c:1645
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1080 [inline]
 __sysvec_apic_timer_interrupt+0x146/0x540 arch/x86/kernel/apic/apic.c:1097
 asm_call_irq_on_stack+0xf/0x20
 </IRQ>
 __run_sysvec_on_irqstack arch/x86/include/asm/irq_stack.h:37 [inline]
 run_sysvec_on_irqstack_cond arch/x86/include/asm/irq_stack.h:89 [inline]
 sysvec_apic_timer_interrupt+0xbd/0x100 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:631
RIP: 0010:console_unlock+0x7b6/0xbb0 kernel/printk/printk.c:2509
Code: 60 8f 24 8b e8 6b 8d fd ff e8 f6 3b 00 00 31 ff 4c 89 ee e8 2c 76 17 00 4d 85 ed 0f 85 3a 02 00 00 e8 ae 7d 17 00 ff 34 24 9d <8b> 5c 24 34 31 ff 89 de e8 ed 75 17 00 85 db 0f 84 eb f9 ff ff e8
RSP: 0018:ffffc90000dcfaf0 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8155b067
RDX: ffff888010fa0000 RSI: ffffffff8158ad02 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff8ebb4667
R10: fffffbfff1d768cc R11: 0000000000000000 R12: ffffffff84a24b90
R13: 0000000000000200 R14: dffffc0000000000 R15: ffffc90000dcfb50
 vprintk_emit+0x1a1/0x4c0 kernel/printk/printk.c:2028
 vprintk_func+0x8d/0x1e0 kernel/printk/printk_safe.c:393
 printk+0xba/0xed kernel/printk/printk.c:2076
 kauditd_printk_skb kernel/audit.c:538 [inline]
 kauditd_hold_skb.cold+0x41/0x50 kernel/audit.c:571
 kauditd_send_queue+0x19d/0x210 kernel/audit.c:734
 kauditd_thread+0x7f0/0xb80 kernel/audit.c:860
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
