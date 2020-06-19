Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC5020024B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5366EC19;
	Fri, 19 Jun 2020 06:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA45C6EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 04:56:15 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id x2so5884013iof.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 21:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=kVV7AQIUbbYdGbVlGXkgoxxP+MlYua7sKpJCqtMOVU4=;
 b=Au5sTElMO/YY3P4CMNr9J/wVKXJQgNgKhCRHlEL+o/6iDqY+SAb5VLSu8KJFm+SBAp
 Uab0tTHXK00afShjTtSPn6jP6D+FxiU4hfOShJB0l4Sj7Hjm3bj+jI51jO9G1//SQe8+
 fYCj7BfJtmYLDGHBBuh1d3mPZ4yfvmDHEZ567HtQq4Ji6cqZy+pKLM3vx5dFWHr0NIFs
 woVGBuFGj54jlhco4TLBtNM0PUsysW24hcX0F1ep/5NeR8nEuxQ8mnsMJ1ZGunua4Ail
 ulNLNQV+eVG9ogGE6mf2tjXMBNjn4CI8XuE4ijxMlhTEtjhGssBwH7BcSRYiW9Sb1z+f
 ChDQ==
X-Gm-Message-State: AOAM530v8rMApGoLNntRq9BG50f2ihT6LpiS3M2vHD63+BQNnY/YigYy
 AjEOEdzTLv+EYOBOg0o8gMGH5xmluH+zlKaFHr0DM3nqV1Z0
X-Google-Smtp-Source: ABdhPJwdNZQyzkPUlSgTaQiywiDsztu4+RdFjl3U3aswkL4CZhfKr0IA6BTtV1XwM3rxXzkhoJ+yY9MmVKDBru/N5YVV3R1a/wEA
MIME-Version: 1.0
X-Received: by 2002:a02:ab94:: with SMTP id t20mr2096716jan.13.1592542575012; 
 Thu, 18 Jun 2020 21:56:15 -0700 (PDT)
Date: Thu, 18 Jun 2020 21:56:15 -0700
In-Reply-To: <0000000000001d3ff605995c23d6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000792f4f05a868b670@google.com>
Subject: Re: BUG: unable to handle kernel paging request in sys_imageblit
From: syzbot <syzbot+33f89a9a6b6acd893b11@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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

HEAD commit:    435faf5c Merge tag 'riscv-for-linus-5.8-mw0' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1768c725100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dbb617b9c2a5bdf
dashboard link: https://syzkaller.appspot.com/bug?extid=33f89a9a6b6acd893b11
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f3f485100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+33f89a9a6b6acd893b11@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffff520013df608
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 7ffcd067 P4D 7ffcd067 PUD 2c920067 PMD 29858067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 2 PID: 8457 Comm: syz-executor.0 Not tainted 5.7.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x616/0x1240 drivers/video/fbdev/core/sysimgblt.c:275
Code: 0f b6 14 28 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 5c 0b 00 00 8b 44 24 20 4d 8d 77 04 4c 89 fa 48 c1 ea 03 23 07 <42> 0f b6 0c 2a 4c 89 fa 83 e2 07 33 44 24 14 83 c2 03 38 ca 7c 08
RSP: 0018:ffffc90001867578 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888023ac8402 RCX: ffffffff88786a40
RDX: 1ffff920013df608 RSI: ffffffff83c3bbbc RDI: ffffffff88786a40
RBP: 0000000000000fef R08: ffff888029cf8040 R09: 0000000000000001
R10: ffffffff8a8b743f R11: fffffbfff1516e87 R12: 0000000000000007
R13: dffffc0000000000 R14: ffffc90009efb044 R15: ffffc90009efb040
FS:  0000000000000000(0000) GS:ffff88802d000000(0063) knlGS:00000000f7f0fb40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: fffff520013df608 CR3: 000000001b812000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:747
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x8d0/0xd60 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x345/0x3f0 drivers/video/fbdev/core/fbcon.c:1362
 do_update_region+0x398/0x630 drivers/tty/vt/vt.c:683
 invert_screen+0x2a7/0x600 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xff3/0x1370 drivers/tty/vt/vt.c:1230
 fbcon_do_set_font+0x4a0/0x950 drivers/video/fbdev/core/fbcon.c:2608
 fbcon_set_font+0x732/0x870 drivers/video/fbdev/core/fbcon.c:2705
 con_font_set drivers/tty/vt/vt.c:4571 [inline]
 con_font_op+0xd65/0x1160 drivers/tty/vt/vt.c:4636
 compat_kdfontop_ioctl drivers/tty/vt/vt_ioctl.c:1151 [inline]
 vt_compat_ioctl+0x23a/0x6c0 drivers/tty/vt/vt_ioctl.c:1213
 tty_compat_ioctl+0x19c/0x410 drivers/tty/tty_io.c:2847
 __do_compat_sys_ioctl fs/ioctl.c:865 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:816 [inline]
 __ia32_compat_sys_ioctl+0x23d/0x2b0 fs/ioctl.c:816
 do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
 do_fast_syscall_32+0x270/0xe90 arch/x86/entry/common.c:396
 entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
Modules linked in:
CR2: fffff520013df608
---[ end trace fbceb2e52f6d552c ]---
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x616/0x1240 drivers/video/fbdev/core/sysimgblt.c:275
Code: 0f b6 14 28 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 5c 0b 00 00 8b 44 24 20 4d 8d 77 04 4c 89 fa 48 c1 ea 03 23 07 <42> 0f b6 0c 2a 4c 89 fa 83 e2 07 33 44 24 14 83 c2 03 38 ca 7c 08
RSP: 0018:ffffc90001867578 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888023ac8402 RCX: ffffffff88786a40
RDX: 1ffff920013df608 RSI: ffffffff83c3bbbc RDI: ffffffff88786a40
RBP: 0000000000000fef R08: ffff888029cf8040 R09: 0000000000000001
R10: ffffffff8a8b743f R11: fffffbfff1516e87 R12: 0000000000000007
R13: dffffc0000000000 R14: ffffc90009efb044 R15: ffffc90009efb040
FS:  0000000000000000(0000) GS:ffff88802d000000(0063) knlGS:00000000f7f0fb40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: fffff520013df608 CR3: 000000001b812000 CR4: 0000000000340ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
