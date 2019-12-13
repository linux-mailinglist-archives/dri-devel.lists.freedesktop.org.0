Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331711DF56
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58B6E293;
	Fri, 13 Dec 2019 08:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5006E286
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 07:21:09 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id t4so1318838ili.21
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 23:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=UBhSC4Z1qFXXc2HUBCNu4A2Q6en5x0QfWiP2o1ZOWSQ=;
 b=De9P0EV0rIm5uPelnQ3fGTKet4wdjwf+fFAymd3/82za2chVJovT+Zj+1OYymBay4M
 FfOss+YwQup+e8TvaXNpP1N06lVmhm/FjYtcguB5etgY0wn/ErxoqxDqr/baS0e452jQ
 JnnyuGYDQrUeFkFYdDV0ZntWxrCDv+s/DCLTo6JTdrsmeyuSWtOBqsl/z5oDqEzIccKM
 6bo4xbmr03K9vOhtu0eaYDrpUvoK6jx1BgfD6XdA0x1LXKK+sW4iGk1BDvK1/u/Kndgq
 JL0WAtA+rI8vkDaUaJi7YAGUZJ8sQdmqvADi23FsMf5Bk3PqOdo3J2muWcbhKrR+yVoG
 GZYg==
X-Gm-Message-State: APjAAAXWcjqDL0P6+PRMFZU+eybdHYtHVtswp426Ia4QiFN3YISKLMQT
 y6zvenZMsOXpP0osO2bMJ7v3NxQqPGCD6nugxp2cAAfo7Qay
X-Google-Smtp-Source: APXvYqzKKDdtoK2MWqr9l+ar5eCKKhGAGTth0kWrsd/T2k0/rM0mMhIfPpKbRcWtAyxzqqBE7fE2iwHx91u+IqjiYLKFy4qHT1NU
MIME-Version: 1.0
X-Received: by 2002:a92:902:: with SMTP id y2mr12186015ilg.196.1576221669031; 
 Thu, 12 Dec 2019 23:21:09 -0800 (PST)
Date: Thu, 12 Dec 2019 23:21:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab87b6059990b486@google.com>
Subject: general protection fault in fbcon_cursor
From: syzbot <syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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

HEAD commit:    ae4b064e Merge tag 'afs-fixes-20191211' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1218c1dee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
dashboard link: https://syzkaller.appspot.com/bug?extid=6acf28c23c81badd89a7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6acf28c23c81badd89a7@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events console_callback
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1380
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03  
00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c  
89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90000d8fb00 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8880a4309400 RCX: ffffffff83e01590
RDX: 000000001fffffe7 RSI: ffffffff83b2804c RDI: ffff8880a282b3a0
RBP: ffffc90000d8fb40 R08: ffff8880a9a4a480 R09: ffffed10147a3e1c
R10: ffffed10147a3e1b R11: ffff8880a3d1f0df R12: ffff8880a282b000
R13: ffff888218c76000 R14: 00000000ffffff3a R15: ffff888218c76468
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004bf9b0 CR3: 000000008e75d000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  set_cursor drivers/tty/vt/vt.c:908 [inline]
  set_cursor+0x1fb/0x280 drivers/tty/vt/vt.c:899
  redraw_screen+0x4e1/0x7d0 drivers/tty/vt/vt.c:1013
  complete_change_console+0x105/0x3a0 drivers/tty/vt/vt_ioctl.c:1264
  change_console+0x19b/0x2c0 drivers/tty/vt/vt_ioctl.c:1389
  console_callback+0x3a1/0x400 drivers/tty/vt/vt.c:2824
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2264
  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace a825343a1e8757e1 ]---
RIP: 0010:fbcon_cursor+0x114/0x660 drivers/video/fbdev/core/fbcon.c:1380
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 e6 04 00 00 4d 8b b4 24 a0 03  
00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c  
89 f0 83 e0 07 83 c0 01 38 d0 7c 08 84 d2 0f 85 ba
RSP: 0018:ffffc90000d8fb00 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8880a4309400 RCX: ffffffff83e01590
RDX: 000000001fffffe7 RSI: ffffffff83b2804c RDI: ffff8880a282b3a0
RBP: ffffc90000d8fb40 R08: ffff8880a9a4a480 R09: ffffed10147a3e1c
R10: ffffed10147a3e1b R11: ffff8880a3d1f0df R12: ffff8880a282b000
R13: ffff888218c76000 R14: 00000000ffffff3a R15: ffff888218c76468
FS:  0000000000000000(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004bf9b0 CR3: 000000008e75d000 CR4: 00000000001406e0
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
