Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585531C127
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4008E6E140;
	Mon, 15 Feb 2021 18:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8FC6E334
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:49:16 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id u1so7243677ior.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=RoXjSk9Af3jPUQTqmZVPDGkwVHOwjW/9fUaQTC8HuJ0=;
 b=Cf4aJStiRFodYmi6akdUg3DM8uPT0KIchRVKo/DUMvTNmXTanAl9L7G33S60gDQt9p
 jfhskbEAfFFHyvUtb7eGBh7liVjqShS0lAe6YQzEXQcFtUuOD8OViA2xq4O3A0s7ROoF
 DxR/54p3hdoRQUxeB2il0SL0TeC83racf/AT9oboFFNjzcsV5h49aBuDyOaLt+hzDo/V
 7eZBn/5GhV2wamDNSKwJQrkyNrJPj9iNTSGZHXcclC0Ca9nlANQse5pEHpspKbDSM43C
 XHOaW2zti4YoGPcD+DZIzLycZqdp/XBVEEDPG+rLz5TfvechkN8S4/NoDSm+kYF/JOAg
 hgVw==
X-Gm-Message-State: AOAM530grI7yJ13Gpxik3kXXR8MfkSGerdZl4QF/cXSlvEYWQUtKEieZ
 YVJeULkCac4sdSCM5G6bx/BMrQtIX4LDT7YIsMgEn9xpPZbd
X-Google-Smtp-Source: ABdhPJwzOOxIy2iOkkChjuZZcTCvuOWkIaVMSnGKcKuT8QfwtaCwGkxJUGQdmh+AZkOM0BV9i6dS3eum4K+RDo1BujXuo+CluTlz
MIME-Version: 1.0
X-Received: by 2002:a6b:3b53:: with SMTP id i80mr13407420ioa.203.1613411355704; 
 Mon, 15 Feb 2021 09:49:15 -0800 (PST)
Date: Mon, 15 Feb 2021 09:49:15 -0800
In-Reply-To: <00000000000096ae3b05b838799c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bbc2e905bb639abf@google.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in imageblit
From: syzbot <syzbot+858dc7a2f7ef07c2c219@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 15 Feb 2021 18:08:42 +0000
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

HEAD commit:    f40ddce8 Linux 5.11
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14216df4d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=51ab7ccaffffc30c
dashboard link: https://syzkaller.appspot.com/bug?extid=858dc7a2f7ef07c2c219
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f53924d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=138b494cd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+858dc7a2f7ef07c2c219@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x12f4/0x1430 drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc9000bc91000 by task syz-executor566/8649

CPU: 3 PID: 8649 Comm: syz-executor566 Not tainted 5.11.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5/0x2c6 mm/kasan/report.c:230
 __kasan_report mm/kasan/report.c:396 [inline]
 kasan_report.cold+0x79/0xd5 mm/kasan/report.c:413
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
 sys_imageblit+0x12f4/0x1430 drivers/video/fbdev/core/sysimgblt.c:275
 drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inline]
 drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2266
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x35a/0x450 drivers/video/fbdev/core/fbcon.c:1304
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 redraw_screen+0x658/0x790 drivers/tty/vt/vt.c:1035
 fbcon_modechanged+0x593/0x6d0 drivers/video/fbdev/core/fbcon.c:2656
 fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:2701
 do_fb_ioctl+0x62e/0x690 drivers/video/fbdev/core/fbmem.c:1110
 fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x43fd49
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0eaf1448 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000019c10 RCX: 000000000043fd49
RDX: 0000000020000080 RSI: 0000000000004601 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007fff0eaf15e8 R09: 00007fff0eaf15e8
R10: 00007fff0eaf0ec0 R11: 0000000000000246 R12: 00007fff0eaf145c
R13: 431bde82d7b634db R14: 00000000004ae018 R15: 0000000000400488


Memory state around the buggy address:
 ffffc9000bc90f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000bc90f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000bc91000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc9000bc91080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000bc91100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
