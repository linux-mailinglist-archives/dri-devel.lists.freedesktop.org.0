Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808772B5B54
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884986E159;
	Tue, 17 Nov 2020 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93D89D66
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 08:36:17 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id c9so11441735ilu.20
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 00:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=C4M/+xfiM9OnFE7qhVh67fuqh9hhXKStAw5Nvc3SLzk=;
 b=qLMbhAoRLRv0/xGB5h+rA1rVQbqFwJjwOfhAWz1HFG6NroImesKC2W+ygd4+WETt23
 kI06eeKlnBhg+T3fqEVGDSCdeS49E7UtuGuUxAZkzjBGRIAF9SE8/M4yMxEE4IplaM8N
 ncyWUhT6leVDBWq7fXAvV9dpZOfM81m3TF5w7lrM7l0mCHGwFugQbPH+6T/gCY7QLD6k
 tFCzavEeQAUVHJS2oHJKhbBclpkysAfoFI4UJHUJmOM1IxLf2iCkHgUmkAxwpjdGeXuA
 0kTW/je11ukBYbH7VlrtxnVQtbvWGmgZffSJjhmGC0/f1ejwtY0ZeUCciPfhACNYDcQl
 DvIw==
X-Gm-Message-State: AOAM532SOkXuWLm3X+4YmprD95qhitf7bugsbf1F3lBybaOJcW6/7HqA
 QUQnzP8JJdkOOBaIR1pyAfqqRVVrdAiBOYVP0L3xvLISSc0+
X-Google-Smtp-Source: ABdhPJz5CkDlFNdysxHWwKhCe6/a6YA48Pk5yELKjSm9IP/lwTuiY0CWJpghC+UxqHQ2GkjsDX3IdlS6QkcJ8beHvY5L6MTbaxyd
MIME-Version: 1.0
X-Received: by 2002:a02:90ca:: with SMTP id c10mr5132009jag.115.1605515776953; 
 Mon, 16 Nov 2020 00:36:16 -0800 (PST)
Date: Mon, 16 Nov 2020 00:36:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000091111005b435456e@google.com>
Subject: BUG: unable to handle kernel NULL pointer dereference in fbcon_cursor
From: syzbot <syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, natechancellor@gmail.com, 
 syzkaller-bugs@googlegroups.com, yepeilin.cs@gmail.com
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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

HEAD commit:    6dd65e60 Add linux-next specific files for 20201110
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1276af62500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4fab43daf5c54712
dashboard link: https://syzkaller.appspot.com/bug?extid=b67aaae8d3a927f68d20
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 4e683067 P4D 4e683067 PUD 14850067 PMD 0 
Oops: 0010 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 9433 Comm: syz-executor.5 Not tainted 5.10.0-rc3-next-20201110-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000bca7858 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffff888144509000 RDI: ffff888010079000
RBP: ffff888010079000 R08: 0000000000000000 R09: ffffffff8cecc387
R10: 0000000000000003 R11: 0000000000000000 R12: ffff888144509000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000720
FS:  00007f5822bee700(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000004e973000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 fbcon_cursor+0x50e/0x620 drivers/video/fbdev/core/fbcon.c:1346
 hide_cursor+0x85/0x280 drivers/tty/vt/vt.c:907
 redraw_screen+0x5ed/0x790 drivers/tty/vt/vt.c:1012
 vc_do_resize+0xed3/0x1150 drivers/tty/vt/vt.c:1326
 fbcon_set_disp+0x831/0xda0 drivers/video/fbdev/core/fbcon.c:1413
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:816 [inline]
 set_con2fb_map+0x7a6/0xf80 drivers/video/fbdev/core/fbcon.c:887
 fbcon_set_con2fb_map_ioctl+0x165/0x220 drivers/video/fbdev/core/fbcon.c:3072
 do_fb_ioctl+0x5b6/0x690 drivers/video/fbdev/core/fbmem.c:1156
 fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45deb9
Code: 0d b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b3 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f5822bedc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000000e2c0 RCX: 000000000045deb9
RDX: 00000000200000c0 RSI: 0000000000004610 RDI: 0000000000000006
RBP: 000000000118bf60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118bf2c
R13: 00007ffe024fb66f R14: 00007f5822bee9c0 R15: 000000000118bf2c
Modules linked in:
CR2: 0000000000000000
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 4e683067 P4D 4e683067 PUD 14850067 PMD 0 
Oops: 0010 [#2] PREEMPT SMP KASAN
CPU: 0 PID: 9433 Comm: syz-executor.5 Not tainted 5.10.0-rc3-next-20201110-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000bca7278 EFLAGS: 00010086
RAX: 0000000000000007 RBX: 0000000000000000 RCX: 0000000000000007
RDX: 0000000000000002 RSI: ffff888144509000 RDI: ffff888010079000
RBP: ffff888010079000 R08: 0000000000000000 R09: ffffffff8cecc387
R10: 0000000000000003 R11: 0000000000000001 R12: ffff888144509000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000720
FS:  00007f5822bee700(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000004e973000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 fbcon_cursor+0x50e/0x620 drivers/video/fbdev/core/fbcon.c:1346
 hide_cursor+0x85/0x280 drivers/tty/vt/vt.c:907
 redraw_screen+0x5ed/0x790 drivers/tty/vt/vt.c:1012
 fbcon_blank+0x8c5/0xc30 drivers/video/fbdev/core/fbcon.c:2248
 do_unblank_screen+0x25b/0x470 drivers/tty/vt/vt.c:4406
 bust_spinlocks+0x5b/0xe0 lib/bust_spinlocks.c:26
 oops_end+0x2b/0xe0 arch/x86/kernel/dumpstack.c:346
 no_context+0x5f2/0xa20 arch/x86/mm/fault.c:752
 __bad_area_nosemaphore+0xa9/0x400 arch/x86/mm/fault.c:840
 do_user_addr_fault+0x7d7/0xba0 arch/x86/mm/fault.c:1340
 handle_page_fault arch/x86/mm/fault.c:1434 [inline]
 exc_page_fault+0x9e/0x180 arch/x86/mm/fault.c:1490
 asm_exc_page_fault+0x1e/0x30 arch/x86/include/asm/idtentry.h:580
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000bca7858 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffff888144509000 RDI: ffff888010079000
RBP: ffff888010079000 R08: 0000000000000000 R09: ffffffff8cecc387
R10: 0000000000000003 R11: 0000000000000000 R12: ffff888144509000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000720
Modules linked in:
CR2: 0000000000000000
---[ end trace 8931af4863156cb4 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffc9000bca7858 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffff888144509000 RDI: ffff888010079000
RBP: ffff888010079000 R08: 0000000000000000 R09: ffffffff8cecc387
R10: 0000000000000003 R11: 0000000000000000 R12: ffff888144509000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000720
FS:  00007f5822bee700(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000004e973000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
