Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08FA11A6C8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0937F6EABE;
	Wed, 11 Dec 2019 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A336E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 16:38:09 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id x2so14751336ilk.18
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=uCq5HA7BmvJopfTUDQwacB9njYfd+WsmvAPPNIGbe6E=;
 b=fjV51J8st/Uf3ofjdgzm7l7p8W5Hmqqj7q5zEtedT6gJn6IphzkYaYTorUWD0bCSfJ
 J/TLam0/gPVivfh0v+Pq6DLEzPvKS8a8QgGER7X4puzIudnS6WKGf5EQkJ/pBH8lmrWm
 GqbrQKI1f27jfQ1jGVn8z4PgSTrMHKl3h9zNt6aZULAqpLEdiKxCroCFohSCZiWhjFym
 /DIBPjrwjvnFR5zmPP+od+dkfuoY7360651fzpuqiJI2reTq3IDG6Ftwr/OOl5tv+QNn
 eQW8jD5G8vNdR//EoZ39zK7Og14G/jgS9HVp13SjMU00+V5RDsbgA3nz+sbBiI6veG1M
 eDGw==
X-Gm-Message-State: APjAAAWkOCtF78yFjmtcuR0Rc1jn125Xj63jzbpku3BjUY8M2MZD1YAX
 uCAC7s6ApJ6M9hCTT6VLDBFgFdsxpWgWPciVcAF24PAteKKc
X-Google-Smtp-Source: APXvYqzn8FlWXKA4hFy9XTE0Ib9XqN9SRmuRiOGcY/8ozcw7lzzeIvUcj5j9hVxj09SVLghIzzNJ3megIjhslIqliDHNYeGMKzcT
MIME-Version: 1.0
X-Received: by 2002:a92:844d:: with SMTP id l74mr3570750ild.16.1575995888710; 
 Tue, 10 Dec 2019 08:38:08 -0800 (PST)
Date: Tue, 10 Dec 2019 08:38:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001d3ff605995c23d6@google.com>
Subject: BUG: unable to handle kernel paging request in sys_imageblit
From: syzbot <syzbot+33f89a9a6b6acd893b11@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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

HEAD commit:    6794862a Merge tag 'for-5.5-rc1-kconfig-tag' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1574aaeae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
dashboard link: https://syzkaller.appspot.com/bug?extid=33f89a9a6b6acd893b11
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+33f89a9a6b6acd893b11@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffff5200124c3fc
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 7ffcd067 P4D 7ffcd067 PUD 2cd1c067 PMD 299b2067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 2 PID: 9109 Comm: syz-executor.2 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x61c/0x1240  
drivers/video/fbdev/core/sysimgblt.c:275
Code: 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 57 0b 00 00 48 b9 00 00 00 00 00  
fc ff df 4c 89 fa 8b 45 b0 23 07 4d 8d 77 04 48 c1 ea 03 <0f> b6 0c 0a 4c  
89 fa 83 e2 07 33 45 c4 83 c2 03 38 ca 7c 08 84 c9
RSP: 0018:ffffc900042c7168 EFLAGS: 00010a06
RAX: 0000000000000000 RBX: ffff888076970800 RCX: dffffc0000000000
RDX: 1ffff9200124c3fc RSI: ffffffff83b4fada RDI: ffffffff887498e0
RBP: ffffc900042c7230 R08: ffff88805d278e40 R09: 000000000000007f
R10: fffffbfff14f3347 R11: ffffffff8a799a3b R12: 0000000000000007
R13: 0000000000000007 R14: ffffc90009261fe4 R15: ffffc90009261fe0
FS:  00007f0af02fc700(0000) GS:ffff88802d200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff5200124c3fc CR3: 00000000278c2000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  drm_fb_helper_sys_imageblit+0x21/0x180 drivers/gpu/drm/drm_fb_helper.c:768
  bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
  bit_putcs+0x9a3/0xf10 drivers/video/fbdev/core/bitblit.c:188
  fbcon_putcs+0x33c/0x3e0 drivers/video/fbdev/core/fbcon.c:1353
  do_update_region+0x42b/0x6f0 drivers/tty/vt/vt.c:677
  invert_screen+0x2da/0x650 drivers/tty/vt/vt.c:794
  highlight drivers/tty/vt/selection.c:53 [inline]
  clear_selection drivers/tty/vt/selection.c:81 [inline]
  clear_selection+0x59/0x70 drivers/tty/vt/selection.c:77
  vc_do_resize+0x1163/0x1460 drivers/tty/vt/vt.c:1200
  vc_resize+0x4d/0x60 drivers/tty/vt/vt.c:1304
  fbcon_do_set_font+0x4a6/0x960 drivers/video/fbdev/core/fbcon.c:2599
  fbcon_set_font+0x72e/0x860 drivers/video/fbdev/core/fbcon.c:2696
  con_font_set drivers/tty/vt/vt.c:4538 [inline]
  con_font_op+0xe30/0x1270 drivers/tty/vt/vt.c:4603
  vt_ioctl+0xd2e/0x26d0 drivers/tty/vt/vt_ioctl.c:913
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a7c9
Code: bd b1 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 8b b1 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f0af02fbc88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000072bf00 RCX: 000000000045a7c9
RDX: 0000000020000000 RSI: 0000000000004b61 RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f0af02fc6d4
R13: 00000000004ab60f R14: 00000000006ede60 R15: 00000000ffffffff
Modules linked in:
CR2: fffff5200124c3fc
---[ end trace 7698227ca2d5f789 ]---
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x61c/0x1240  
drivers/video/fbdev/core/sysimgblt.c:275
Code: 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 57 0b 00 00 48 b9 00 00 00 00 00  
fc ff df 4c 89 fa 8b 45 b0 23 07 4d 8d 77 04 48 c1 ea 03 <0f> b6 0c 0a 4c  
89 fa 83 e2 07 33 45 c4 83 c2 03 38 ca 7c 08 84 c9
RSP: 0018:ffffc900042c7168 EFLAGS: 00010a06
RAX: 0000000000000000 RBX: ffff888076970800 RCX: dffffc0000000000
RDX: 1ffff9200124c3fc RSI: ffffffff83b4fada RDI: ffffffff887498e0
RBP: ffffc900042c7230 R08: ffff88805d278e40 R09: 000000000000007f
R10: fffffbfff14f3347 R11: ffffffff8a799a3b R12: 0000000000000007
R13: 0000000000000007 R14: ffffc90009261fe4 R15: ffffc90009261fe0
FS:  00007f0af02fc700(0000) GS:ffff88802d200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff5200124c3fc CR3: 00000000278c2000 CR4: 0000000000340ee0
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
