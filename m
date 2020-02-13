Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDFD15D375
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AFB6EB53;
	Fri, 14 Feb 2020 08:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2686E220
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 11:18:13 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id x69so4383316ill.14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 03:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=sbgM305N5kE+FFc95c5/T4CXWImEt9TqPzbKgLEFUkk=;
 b=LPbR0NGjEEQ1TiTAqlkdpe2qW/6diwR8oAM3YcsuVeYynxcrAE2+M+YDorJTl4A1Cl
 7Ha4h6ng3Qx9/nrKS0OBgS9oGiKQy9cnVVUS+kMIPnhIiY0AHEZ9DDDci/JuqgJw46vX
 8A3Wve53Bz+jX6V9LrZITX59u3EodbIW1Rl+VbIsrscCswfH3nFM2H0ERCcIQ+5mjS1f
 V7eIdTm9MtQ62YyuvZn8Ola5uMiWvEmxR4NjxdVPXTUSz96VtXwvOSdWB77fKn4nvj+h
 vX0CHPv14xcTmit8+lxBKPlQockO639bDTZEIxopXKgFDHbiJNJ0v5enhfPCqWaf0yZd
 m6Dw==
X-Gm-Message-State: APjAAAUPt+cpL6Mz2NnUO0o3Vn1kMiFpjZBaRD6cDcCAp9pGJF7azs7b
 ysJs3NsGZnJd7tHus8zhYwJsQAFzBQOiZI7hRQN6rDv90z+8
X-Google-Smtp-Source: APXvYqxU75gzQMQUNwF5XwwzFcLU4HSB1PDd2Rhr8jXfwTeXLQsFt280UX8VoStviELQ94PhVVjx6QwIOuoLKq6mmB3OEkqzyKj5
MIME-Version: 1.0
X-Received: by 2002:a92:589a:: with SMTP id z26mr16353213ilf.19.1581592693024; 
 Thu, 13 Feb 2020 03:18:13 -0800 (PST)
Date: Thu, 13 Feb 2020 03:18:13 -0800
In-Reply-To: <000000000000ab87b6059990b486@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a5ad0f059e733e2b@google.com>
Subject: Re: general protection fault in fbcon_cursor
From: syzbot <syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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

syzbot has found a reproducer for the following crash on:

HEAD commit:    f2850dd5 Merge tag 'kbuild-fixes-v5.6' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120eaae6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=735296e4dd620b10
dashboard link: https://syzkaller.appspot.com/bug?extid=6acf28c23c81badd89a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c8fc09e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1364c07ee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0020000001: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000100000008-0x000000010000000f]
CPU: 0 PID: 2873 Comm: kworker/0:35 Not tainted 5.6.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events console_callback
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1387
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90008f7faf0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: ffff8880a3860000 RCX: ffffffff83f31930
RDX: 0000000020000001 RSI: ffffffff83c5b4ec RDI: ffff88809c3573a0
RBP: ffffc90008f7fb30 R08: ffff88809ec02300 R09: ffffed10147ef884
R10: ffffed10147ef883 R11: ffff8880a3f7c41f R12: ffff88809c357000
R13: ffff8880a385c000 R14: 000000010000000c R15: ffff8880a385c468
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000455300 CR3: 00000000a7dad000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 set_cursor drivers/tty/vt/vt.c:908 [inline]
 set_cursor+0x1fb/0x280 drivers/tty/vt/vt.c:899
 redraw_screen+0x4e1/0x7d0 drivers/tty/vt/vt.c:1013
 complete_change_console+0x105/0x3a0 drivers/tty/vt/vt_ioctl.c:1264
 change_console+0x19b/0x2c0 drivers/tty/vt/vt_ioctl.c:1389
 console_callback+0x3a1/0x400 drivers/tty/vt/vt.c:2824
 process_one_work+0xa05/0x17a0 kernel/workqueue.c:2264
 worker_thread+0x98/0xe40 kernel/workqueue.c:2410
 kthread+0x361/0x430 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 10588331f3234462 ]---
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1387
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90008f7faf0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: ffff8880a3860000 RCX: ffffffff83f31930
RDX: 0000000020000001 RSI: ffffffff83c5b4ec RDI: ffff88809c3573a0
RBP: ffffc90008f7fb30 R08: ffff88809ec02300 R09: ffffed10147ef884
R10: ffffed10147ef883 R11: ffff8880a3f7c41f R12: ffff88809c357000
R13: ffff8880a385c000 R14: 000000010000000c R15: ffff8880a385c468
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000455300 CR3: 00000000a7dad000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
