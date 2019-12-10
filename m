Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9DA11A6AC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D3E6EAA2;
	Wed, 11 Dec 2019 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8F6E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 16:38:09 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id p5so13581423iob.23
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Wy2IZtOVQJXJFzmWDs7KozDvLtPFlT6/AubPV8rI/io=;
 b=IBk6sFCsNwo5URy3wmLYPb9scwMlfNbfS8BJgeB5+dM2lvPmAk+SJEu43pnPcAsLV5
 19xYWE4GPid8uZWgxtm3MbmNwQifoAQne6bMBySULM69/tRpLryeKE+jKvKzDF2MJv0N
 fJW1mtn93KZrEAVrFrNZyVY6QCc7gmRVSmNFO3ZpzdJD7vYQ6zFBiaaoZysu4QhxqLlp
 avXShNxVYvgveLHZMmTBxz5ceegmoR2dbrpJ2PMVPXwbZ1hq/vf4ttht6omJT4Z2MO7u
 c+ZWHJAruCixCuY+4LtQdz14/tT4/Rj2nzOBN2ZwPvUuCJjCyOqvyPHwnA1pQx9uh8RI
 MvXg==
X-Gm-Message-State: APjAAAVzlVEhdepG1lBP42HBycE3xUNKBved6W2533zJowwPTZPghIbe
 GUuE08S3IFKVZqvH9AymWmZqdF/fwXqIDpX772BslnsmZjjS
X-Google-Smtp-Source: APXvYqyDo9K8vevL0YNGNhrWfeezwrGE8z8f9j+LmC9hq8lwhAOa6lpuVlvPwXzPGNLPnGc+pOd8oQNxBUFVUlwehZpr6TOocqjU
MIME-Version: 1.0
X-Received: by 2002:a5d:9eda:: with SMTP id a26mr26850018ioe.238.1575995888911; 
 Tue, 10 Dec 2019 08:38:08 -0800 (PST)
Date: Tue, 10 Dec 2019 08:38:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000204d2105995c23eb@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in sys_imageblit
From: syzbot <syzbot+26dc38a00dc05118a4e6@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=17f407f2e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79f79de2a27d3e3d
dashboard link: https://syzkaller.appspot.com/bug?extid=26dc38a00dc05118a4e6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+26dc38a00dc05118a4e6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit  
drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x117f/0x1240  
drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc90008de1000 by task syz-executor.3/19698

CPU: 0 PID: 19698 Comm: syz-executor.3 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0x5/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  __asan_report_store4_noabort+0x17/0x20 mm/kasan/generic_report.c:139
  fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
  sys_imageblit+0x117f/0x1240 drivers/video/fbdev/core/sysimgblt.c:275
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
RSP: 002b:00007fcfa0ba6c88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000072bf00 RCX: 000000000045a7c9
RDX: 0000000020000140 RSI: 0000000000004b61 RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fcfa0ba76d4
R13: 00000000004ab60f R14: 00000000006ede60 R15: 00000000ffffffff


Memory state around the buggy address:
  ffffc90008de0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffc90008de0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffc90008de1000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                    ^
  ffffc90008de1080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
  ffffc90008de1100: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


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
