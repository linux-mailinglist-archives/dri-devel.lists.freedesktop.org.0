Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5928624B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F96E91E;
	Wed,  7 Oct 2020 15:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57D6E233
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 07:42:16 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id s13so785249ioo.14
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 00:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=p1jF3bjaKGb+nCiTCUQ8vKDZ+1JpRqSGS18c2r055XA=;
 b=iqDOxjR4fi6PwYpLFPkD9Zc5//AyJ+wMc5jKLfXoZshyhQjE2MeGtSLYSV77gUIJdk
 kbNIBxmLTYH4DqovrfdL033rdAQCmH/9cKweS9IgsigbVRGxU1cfQzUI8YlzJsmK91Kr
 4Z5ta0oCRVWs25RS3V7LkTJG2iksZAksykDNJneYpthBgoth4+FAp7BXJ7ywLwX2x+5e
 5nJECBwdDrZI53LjKWyPKS3eLWNxIYGVqmRVEjSj6SfGO8IjSzhz/ASUio4/4/XRARhl
 VILU2y2+xR6rBnQYEqFTeZA/DtxSdgZ2SH4gZt18DmB+uXvLQOW7p/ynFHDdBygy+3AD
 cL7g==
X-Gm-Message-State: AOAM532+zwvHfNFqy7NZzt6dMdhJbU+MqFyfhV1EqSBnkXP8ImLcXxIa
 e/2h72bKLedAE+8KYfO7wZWsBr3BqEE5xyzy5Y4xSlHWLu2E
X-Google-Smtp-Source: ABdhPJwXOtmVEWOcIEcBe/kpgu7JgPbMmLLFMbvc1tL2TVk6xAr/vicaB3JL2N7OisRGm680vCVzyYzE2nJYTJNWDCmCDddHG9Nm
MIME-Version: 1.0
X-Received: by 2002:a92:858c:: with SMTP id f134mr1583646ilh.307.1602056535437; 
 Wed, 07 Oct 2020 00:42:15 -0700 (PDT)
Date: Wed, 07 Oct 2020 00:42:15 -0700
In-Reply-To: <000000000000204d2105995c23eb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b4792b05b10fda4b@google.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in sys_imageblit
From: syzbot <syzbot+26dc38a00dc05118a4e6@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    c85fb28b Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17406d70500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=140446ac2aa637e5
dashboard link: https://syzkaller.appspot.com/bug?extid=26dc38a00dc05118a4e6
compiler:       gcc (GCC) 10.1.0-syz 20200507
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14788d70500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15158ee0500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+26dc38a00dc05118a4e6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x117f/0x1290 drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc90009911000 by task syz-executor045/8761

CPU: 0 PID: 8761 Comm: syz-executor045 Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
 sys_imageblit+0x117f/0x1290 drivers/video/fbdev/core/sysimgblt.c:275
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:767
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x35a/0x450 drivers/video/fbdev/core/fbcon.c:1308
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:675
 redraw_screen+0x658/0x790 drivers/tty/vt/vt.c:1034
 fbcon_modechanged+0x593/0x6d0 drivers/video/fbdev/core/fbcon.c:2714
 fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:2759
 do_fb_ioctl+0x62e/0x690 drivers/video/fbdev/core/fbmem.c:1106
 fb_compat_ioctl+0x17c/0xc30 drivers/video/fbdev/core/fbmem.c:1311
 __do_compat_sys_ioctl+0x1d3/0x230 fs/ioctl.c:842
 do_syscall_32_irqs_on arch/x86/entry/common.c:78 [inline]
 __do_fast_syscall_32+0x60/0x90 arch/x86/entry/common.c:137
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:160
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f58549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f7f531dc EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000004601
RDX: 0000000020000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000


Memory state around the buggy address:
 ffffc90009910f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90009910f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90009911000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90009911080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90009911100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
