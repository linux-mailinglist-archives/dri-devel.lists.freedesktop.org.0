Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF6A4A44C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 21:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5510E02C;
	Fri, 28 Feb 2025 20:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com
 [209.85.166.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299A710E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 20:37:25 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3cfb20d74b5so24513445ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740775044; x=1741379844;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=do92xcNC0WFQw/Ce4Jou7iOdOxAiPDFL0QRYd03MRmc=;
 b=KLXr7eD7MU8XViah8VTZ056+SE0a4QgIg2rHge1VOlWcxlFcr4cw/j6DHzoE7fOF8o
 K5JeQUxKwy/bQAQhrABGQk6Fcpqk4qGYeZtavQkqkeRoidVz1Ka7t6uHzKHaK9kWUTw1
 fz6LfEgsUENZgEyC9DjoO9WlpdsXUa2JPVVzvXDwkDQ0Cmgqb7N0CEnfg2im493aqdQf
 C2wToe2UkILyqo0WXysxI08h+zkJ2e0TtNk5K8L/jCXfzkn+N8ClEe2jiV4KdEY87Un2
 n2vE7z2Mfej4KpdiGSZONHMEwTjFF6k8FoliLZ4yiOdfTF5jTw5nH2ztVxikcdAOo+qr
 flvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdfWa22+oUZt8EKdsvtxUUNW7zOEaPtcZQqwZg88mIYU1SceXX00jgCywRe0kAefoDbh+wJvP5vhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCLgN6s2V2h3IZpdtyVzCTCJfLPvxgm4b6gmxSAx81oaNHUOAa
 7nBHV4HqpyPDkJanAixwwlwMYbWKkK+79xhHjRrk1a+AyqGIH4T2/N6PqygbMoj8RPE2DXS9Y+K
 IniPoQx0Oj++oKUomknBP5IvbNzc9TFc9uHAxOSUAk8reoTamXqpvROQ=
X-Google-Smtp-Source: AGHT+IHqBkfoR8i6w/+tls7TWCjrAcTvjAR2poqDZFJnZwHhvPVKnHVB5XKg+dX40lgp78juIZg0UgbAjVmei839Qm5EwcMJPMir
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216c:b0:3cf:bc71:94f5 with SMTP id
 e9e14a558f8ab-3d3e6f4aaecmr46976555ab.22.1740775044496; Fri, 28 Feb 2025
 12:37:24 -0800 (PST)
Date: Fri, 28 Feb 2025 12:37:24 -0800
In-Reply-To: <000000000000e39b37061e898704@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67c21e84.050a0220.dc10f.0151.GAE@google.com>
Subject: Re: [syzbot] [fbdev?] KASAN: global-out-of-bounds Read in bit_putcs
 (3)
From: syzbot <syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has found a reproducer for the following issue on:

HEAD commit:    017f704fbfb1 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12128864580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b7e15dc5b5e776
dashboard link: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1643dba0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16128864580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d34fb306468f/disk-017f704f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6f1126558a26/vmlinux-017f704f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6d9d912bee27/Image-017f704f.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com

 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
==================================================================
BUG: KASAN: global-out-of-bounds in __fb_pad_aligned_buffer include/linux/fb.h:644 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
BUG: KASAN: global-out-of-bounds in bit_putcs+0x9b8/0xe30 drivers/video/fbdev/core/bitblit.c:185
Read of size 1 at addr ffff80008be20810 by task syz-executor101/6448

CPU: 1 UID: 0 PID: 6448 Comm: syz-executor101 Not tainted 6.14.0-rc4-syzkaller-g017f704fbfb1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x198/0x550 mm/kasan/report.c:521
 kasan_report+0xd8/0x138 mm/kasan/report.c:634
 __asan_report_load1_noabort+0x20/0x2c mm/kasan/report_generic.c:378
 __fb_pad_aligned_buffer include/linux/fb.h:644 [inline]
 bit_putcs_aligned drivers/video/fbdev/core/bitblit.c:96 [inline]
 bit_putcs+0x9b8/0xe30 drivers/video/fbdev/core/bitblit.c:185
 fbcon_putcs+0x390/0x5a0 drivers/video/fbdev/core/fbcon.c:1308
 do_update_region+0x1e8/0x3d0 drivers/tty/vt/vt.c:609
 update_region+0x1e0/0x478 drivers/tty/vt/vt.c:633
 vcs_write+0x9e8/0x1180 drivers/tty/vt/vc_screen.c:698
 do_loop_readv_writev fs/read_write.c:843 [inline]
 vfs_writev+0x494/0x92c fs/read_write.c:1052
 do_writev+0x178/0x304 fs/read_write.c:1096
 __do_sys_writev fs/read_write.c:1164 [inline]
 __se_sys_writev fs/read_write.c:1161 [inline]
 __arm64_sys_writev+0x80/0x94 fs/read_write.c:1161
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

The buggy address belongs to the variable:
 fontdata_8x16+0x1010/0x1480

The buggy address belongs to the virtual mapping at
 [ffff80008b810000, ffff80008f6b0000) created by:
 declare_kernel_vmas+0x58/0xb8 arch/arm64/mm/mmu.c:771

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1a1820
flags: 0x5ffc00000002000(reserved|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000002000 fffffdffc5860808 fffffdffc5860808 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff80008be20700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff80008be20780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff80008be20800: 00 00 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                         ^
 ffff80008be20880: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffff80008be20900: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
