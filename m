Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9712B406
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 11:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281696E3FB;
	Fri, 27 Dec 2019 10:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462989D42
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 07:13:09 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id g4so7949400iof.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=UZRgztJjgElJwVjo4ZkcKCCxGO8hYnrttAo1R+7LmTI=;
 b=cdwWxfy5k+DgkP/mYws7I5HQELFEURxecKaiMGPWAQgHcsIxv4COZpIJXnCMatcQNk
 DRHBIYSTdhr4a4fSY/QLaq235/umVpdllApid/uRdTZ+ztLzqbvvwil0eKA9MVy2/h8e
 CPRx79VIad08+qryLHD1XcwtXAGDFTAzJMg6tpu9llCyRCsdg6B9fhSXV2R2fwETFglk
 ulHcfSRVp8lyNg2APb+U2JB8iB2j6MXoR6a9h/XCjTpPHCX++/diM3h0jjPNxolwD8BR
 umnTP861RI7razfsFdAHkg44PZhTR3+aoEbrkuJ8BE92Bz6puTlf0ukmXPA0nOEBhZIm
 NiSw==
X-Gm-Message-State: APjAAAVC8CNhpp3HPC043VYYeK3YgJHJO/A2n/v1BJmbGMfpNLRqsxxh
 deUcLjIwv4jfJyBY3taJalxvxqm8ohraA2YSRS19cacsnxQA
X-Google-Smtp-Source: APXvYqxUoC3AkqNP5tJjauWJQ2KQ9zdPsq703QSOFwJqHv+n7Ldg7hUzu/ZRQMRp3oJdis6QM3g12n21RuD57jfNUX4dXE14GLR3
MIME-Version: 1.0
X-Received: by 2002:a05:6638:38f:: with SMTP id
 y15mr41047840jap.17.1577430788451; 
 Thu, 26 Dec 2019 23:13:08 -0800 (PST)
Date: Thu, 26 Dec 2019 23:13:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cdb581059aaa39b2@google.com>
Subject: BUG: unable to handle kernel paging request in vga16fb_imageblit
From: syzbot <syzbot+83449358d6355b0b9728@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 27 Dec 2019 10:39:14 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following crash on:

HEAD commit:    46cf053e Linux 5.5-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e35351e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed9d672709340e35
dashboard link: https://syzkaller.appspot.com/bug?extid=83449358d6355b0b9728
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+83449358d6355b0b9728@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffff8880ffff7900
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD c201067 P4D c201067 PUD 0
Oops: 0002 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 31197 Comm: syz-executor.4 Not tainted 5.5.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:writeb arch/x86/include/asm/io.h:65 [inline]
RIP: 0010:vga_imageblit_expand drivers/video/fbdev/vga16fb.c:1168 [inline]
RIP: 0010:vga16fb_imageblit+0xa52/0x2200 drivers/video/fbdev/vga16fb.c:1260
Code: df 48 89 fa 48 c1 ea 03 0f b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0  
7c 09 84 d2 74 05 e8 16 9f f9 fd 41 8b 45 14 48 8b 4d c8 <88> 01 0f ae e8  
8a 01 b8 05 00 00 00 ba ce 03 00 00 ee 48 c7 c2 d8
RSP: 0018:ffffc90004e57450 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000007 RCX: ffff8880ffff7900
RDX: 0000000000000000 RSI: ffffffff83b944b6 RDI: ffffc90004e5760c
RBP: ffffc90004e574e8 R08: ffff88804b708240 R09: 0000000000000000
R10: ffffed10432d371b R11: ffff88821969b8df R12: ffffc90004e575fc
R13: ffffc90004e575f8 R14: ffff8880a3f140c0 R15: 0000000000000001
FS:  00007f4674e1a700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff8880ffff7900 CR3: 000000004de7b000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
  bit_putcs+0x9a3/0xf10 drivers/video/fbdev/core/bitblit.c:188
  fbcon_putcs+0x33c/0x3e0 drivers/video/fbdev/core/fbcon.c:1353
  fbcon_redraw_move.isra.0+0x258/0x2a0 drivers/video/fbdev/core/fbcon.c:1733
  ypan_down_redraw drivers/video/fbdev/core/fbcon.c:1598 [inline]
  fbcon_scroll+0x2e07/0x35b0 drivers/video/fbdev/core/fbcon.c:2048
  con_scroll+0x3fd/0x650 drivers/tty/vt/vt.c:631
  csi_L drivers/tty/vt/vt.c:1974 [inline]
  do_con_trol+0x5317/0x61b0 drivers/tty/vt/vt.c:2373
  do_con_write.part.0+0xfd9/0x1ef0 drivers/tty/vt/vt.c:2797
  do_con_write drivers/tty/vt/vt.c:2565 [inline]
  con_write+0x46/0xd0 drivers/tty/vt/vt.c:3135
  process_output_block drivers/tty/n_tty.c:595 [inline]
  n_tty_write+0x40e/0x1080 drivers/tty/n_tty.c:2333
  do_tty_write drivers/tty/tty_io.c:962 [inline]
  tty_write+0x496/0x7f0 drivers/tty/tty_io.c:1046
  __vfs_write+0x8a/0x110 fs/read_write.c:494
  vfs_write+0x268/0x5d0 fs/read_write.c:558
  ksys_write+0x14f/0x290 fs/read_write.c:611
  __do_sys_write fs/read_write.c:623 [inline]
  __se_sys_write fs/read_write.c:620 [inline]
  __x64_sys_write+0x73/0xb0 fs/read_write.c:620
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a919
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f4674e19c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a919
RDX: 00000000000002c1 RSI: 0000000020000880 RDI: 0000000000000009
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f4674e1a6d4
R13: 00000000004cbd7a R14: 00000000004e5b48 R15: 00000000ffffffff
Modules linked in:
CR2: ffff8880ffff7900
---[ end trace 80930dfe0366796b ]---
RIP: 0010:writeb arch/x86/include/asm/io.h:65 [inline]
RIP: 0010:vga_imageblit_expand drivers/video/fbdev/vga16fb.c:1168 [inline]
RIP: 0010:vga16fb_imageblit+0xa52/0x2200 drivers/video/fbdev/vga16fb.c:1260
Code: df 48 89 fa 48 c1 ea 03 0f b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0  
7c 09 84 d2 74 05 e8 16 9f f9 fd 41 8b 45 14 48 8b 4d c8 <88> 01 0f ae e8  
8a 01 b8 05 00 00 00 ba ce 03 00 00 ee 48 c7 c2 d8
RSP: 0018:ffffc90004e57450 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000007 RCX: ffff8880ffff7900
RDX: 0000000000000000 RSI: ffffffff83b944b6 RDI: ffffc90004e5760c
RBP: ffffc90004e574e8 R08: ffff88804b708240 R09: 0000000000000000
R10: ffffed10432d371b R11: ffff88821969b8df R12: ffffc90004e575fc
R13: ffffc90004e575f8 R14: ffff8880a3f140c0 R15: 0000000000000001
FS:  00007f4674e1a700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff8880ffff7900 CR3: 000000004de7b000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
