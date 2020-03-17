Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00048188745
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DBB6E1B3;
	Tue, 17 Mar 2020 14:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4588F89E2B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:34:16 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id c7so13666387iog.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 02:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=8hA1xiNFfEeNh4tjPf0Sj4oPNobnSXcjqFM/N93g+x4=;
 b=pBvLjDawc21/9kDPwJor0kI9D1gzM83VN+73oq1C9A/zdRLQIfeMbz33Mkd8c9Y9uj
 AN1VLYCIFO2HgjOAyaABj95LvnMybhw4B48f5IbuKlE50nW3ccEIQkPdGZFCYBdlFF2J
 lXWk4/bx/FWozzKVLpHMYmEmra9V8Liuqbg9e0mw8EIlaJe1UtdyWsrlM3WiSA9BBNfQ
 WEYvMxflSsMnFuT0bWTzyZy2ycWky/lZ9Brcxd419KpAxcVrSE3/Rw89V53QRslihCHy
 K8Ofyg00QxmvLQvoK8PLRE6dUVwkLRN0i+h6iegHZtw/++otBIElg35cwBwkCgfSscOz
 RM/A==
X-Gm-Message-State: ANhLgQ0TYGw0opL8jO9wNtFtKNT3OMlstrCdn/lQApxWp4qJpj5IlASk
 bmmwCLkjOhFEsuDK7FfOFJaE/0JasZNAnqtJK+7a5qWbUJOS
X-Google-Smtp-Source: ADFU+vvwgyMWDfCh3AiPKjRyG8ZlkZ8tqhlrYN4CYwCevf2XHU/VCKMvku+jVjT9gOIGJynjjnn9dHGSHsL+rLQAZcQgm2nA5lW4
MIME-Version: 1.0
X-Received: by 2002:a02:3506:: with SMTP id k6mr4450475jaa.104.1584437655618; 
 Tue, 17 Mar 2020 02:34:15 -0700 (PDT)
Date: Tue, 17 Mar 2020 02:34:15 -0700
In-Reply-To: <000000000000a4293f0598ef165e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a1c96505a109a31b@google.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in bitfill_aligned
From: syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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

HEAD commit:    fb33c651 Linux 5.6-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17dacd55e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f894bd92023de02
dashboard link: https://syzkaller.appspot.com/bug?extid=e5fd3e65515b48c02a30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b8ca75e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=114800e5e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:54 [inline]
BUG: KASAN: vmalloc-out-of-bounds in bitfill_aligned+0x34b/0x410 drivers/video/fbdev/core/sysfillrect.c:25
Write of size 8 at addr ffffc90009621000 by task syz-executor767/9337

CPU: 3 PID: 9337 Comm: syz-executor767 Not tainted 5.6.0-rc6-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x315 mm/kasan/report.c:374
 __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:54 [inline]
 bitfill_aligned+0x34b/0x410 drivers/video/fbdev/core/sysfillrect.c:25
 sys_fillrect+0x415/0x7a0 drivers/video/fbdev/core/sysfillrect.c:291
 drm_fb_helper_sys_fillrect+0x1c/0x190 drivers/gpu/drm/drm_fb_helper.c:719
 bit_clear_margins+0x2d5/0x4a0 drivers/video/fbdev/core/bitblit.c:232
 fbcon_clear_margins+0x1de/0x240 drivers/video/fbdev/core/fbcon.c:1379
 fbcon_switch+0xd1b/0x1740 drivers/video/fbdev/core/fbcon.c:2361
 redraw_screen+0x2a8/0x770 drivers/tty/vt/vt.c:1008
 fbcon_modechanged+0x5bd/0x780 drivers/video/fbdev/core/fbcon.c:2998
 fbcon_update_vcs+0x3a/0x50 drivers/video/fbdev/core/fbcon.c:3045
 fb_set_var+0xad0/0xd40 drivers/video/fbdev/core/fbmem.c:1056
 do_fb_ioctl+0x390/0x7d0 drivers/video/fbdev/core/fbmem.c:1109
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x433d29
Code: c4 18 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 eb da fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fff33d61508 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000433d29
RDX: 00000000200001c0 RSI: 0000000000004601 RDI: 0000000000000003
RBP: 00000000006b2018 R08: 0000000000000000 R09: 00000000004002e0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401bc0
R13: 0000000000401c50 R14: 0000000000000000 R15: 0000000000000000


Memory state around the buggy address:
 ffffc90009620f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90009620f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90009621000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                   ^
 ffffc90009621080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90009621100: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
