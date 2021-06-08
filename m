Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3C39F3CA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1B46E0F2;
	Tue,  8 Jun 2021 10:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AA76EACE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:25:32 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 g12-20020a056e021a2cb02901dfc46878d8so14362119ile.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 00:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=mqV7/AdCSlvYHxB0gug3rBvPpiIuLO5jnMV0UaKgv6A=;
 b=NryeyR4rQIUaO2zePwFpkSallSZDepenQ+0lNGgn7YwFvQhTHZlhpik/7AyAFUXqRZ
 Tkf9VsIXrazJSM512AwSdV5OcgwogF16iGcI8tmLNJ2PqLEPpj3oOIa350rbrksvzH7+
 z+5bwC3LVHg+y98qHcygTUkeGbNIuapTJzoo+9BbApe4wfv9o1g3E3huzavv1d5/9QXz
 BDDfjQIOpZWifKaKB6+W8TMmPvqSAM5cwdH6UFY2L8kXgdwiNxDudLkU1BkCNqimF3hf
 0YpG2ZoVKaLpLT2RjbY2OF5QnsEtXY3zx6YVClcnJwSTOILupTBxAWuQ46F7Zei0s86C
 CwCg==
X-Gm-Message-State: AOAM531/e8/x7XtAOFrfG4Ra6kMaR5+134H7A6zJbfbVwufJv9IhfH50
 ybEDbhOAXlkZ49QO3aPX51xzg8iftkHhJl9FdUKUbFEIG6f+
X-Google-Smtp-Source: ABdhPJy4nOA2NB16Hg0bNaRcqiOXOJ3ube3E+aQzb+k86nN4/5m4Vi/Ovc/HvYXU5cG2FzhiZ22FgYTKbM3AMKckK3FOxnnjw2Rt
MIME-Version: 1.0
X-Received: by 2002:a02:3ecf:: with SMTP id s198mr18630272jas.59.1623137131301; 
 Tue, 08 Jun 2021 00:25:31 -0700 (PDT)
Date: Tue, 08 Jun 2021 00:25:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000224a9c05c43c10ec@google.com>
Subject: [syzbot] BUG: unable to handle kernel NULL pointer dereference in
 fbcon_putcs
From: syzbot <syzbot+4e611f0926f7122c8d34@syzkaller.appspotmail.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, 
 george.kennedy@oracle.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 penguin-kernel@I-love.SAKURA.ne.jp, syzkaller-bugs@googlegroups.com, 
 yepeilin.cs@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Jun 2021 10:40:47 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    f88cd3fb Merge tag 'vfio-v5.13-rc5' of git://github.com/aw..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126f13b0300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ad5040c83f09b8e4
dashboard link: https://syzkaller.appspot.com/bug?extid=4e611f0926f7122c8d34
compiler:       Debian clang version 11.0.1-2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4e611f0926f7122c8d34@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 2cdec067 P4D 2cdec067 PUD 2937a067 PMD 0 
Oops: 0010 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 15551 Comm: syz-executor.1 Not tainted 5.13.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc90001bcf630 EFLAGS: 00010292
RAX: 0000000000000000 RBX: ffff88801f456000 RCX: 000000000000004e
RDX: ffff88801dc61224 RSI: ffff88801f456000 RDI: ffff888011879000
RBP: 1ffff11003b8c244 R08: 000000000000001d R09: 0000000000000002
R10: 0000000000000002 R11: ffff888037fb9c40 R12: ffff88801dc61224
R13: dffffc0000000000 R14: 000000000000001d R15: ffff888011879000
FS:  00007f7816197700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000022965000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 fbcon_putcs+0x2ae/0x430 drivers/video/fbdev/core/fbcon.c:1296
 do_update_region+0x4d6/0x6a0 drivers/tty/vt/vt.c:676
 invert_screen+0xc03/0xe30 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:84
 vc_do_resize+0x6d6/0x1890 drivers/tty/vt/vt.c:1240
 fbcon_set_disp+0x9f2/0xf90 drivers/video/fbdev/core/fbcon.c:1405
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:808 [inline]
 set_con2fb_map+0x7f6/0xe90 drivers/video/fbdev/core/fbcon.c:879
 fbcon_set_con2fb_map_ioctl+0x1e7/0x300 drivers/video/fbdev/core/fbcon.c:3013
 do_fb_ioctl+0x39c/0x7e0 drivers/video/fbdev/core/fbmem.c:1156
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:1069 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:1055
 do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665d9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7816197188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000056bf80 RCX: 00000000004665d9
RDX: 0000000020000000 RSI: 0000000000004610 RDI: 0000000000000003
RBP: 00000000004bfcb9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000056bf80
R13: 00007ffe47f399af R14: 00007f7816197300 R15: 0000000000022000
Modules linked in:
CR2: 0000000000000000
---[ end trace 1eae45a248f50072 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc90001bcf630 EFLAGS: 00010292
RAX: 0000000000000000 RBX: ffff88801f456000 RCX: 000000000000004e
RDX: ffff88801dc61224 RSI: ffff88801f456000 RDI: ffff888011879000
RBP: 1ffff11003b8c244 R08: 000000000000001d R09: 0000000000000002
R10: 0000000000000002 R11: ffff888037fb9c40 R12: ffff88801dc61224
R13: dffffc0000000000 R14: 000000000000001d R15: ffff888011879000
FS:  00007f7816197700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000022965000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
