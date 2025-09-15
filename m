Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E852B58166
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8433110E4FD;
	Mon, 15 Sep 2025 15:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com
 [209.85.166.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AFD10E4FD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:59:31 +0000 (UTC)
Received: by mail-il1-f206.google.com with SMTP id
 e9e14a558f8ab-42351e83862so78219855ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757951971; x=1758556771;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cEEppNHulk6/a4mav9kdAfWGQ62YPb0YxchlxpDlJvY=;
 b=E7rfhN8dig/mw1eCGhoSNlLW3cyAyzHozmUZm8VGx7UgyHX+5/VI3j/+MHCMDt83Wf
 sYD85UyocSESX21jui0C/r5kd+e9sk/T4UL+fBjPkEsOtt7pW61HvxwQHFJ3y1S02/tJ
 bYHekr8kByfxEPNSQGrd1isiR+pCsycfZZeBBo8zHtLOBGYBTVn9LmBDqBcmuWrioeJu
 uWcTVfpAOLAMmK2L/dF5uicFjz6WQYOQUS8jg9OIG9pg9cY6upHGWegW2u1ILJORGm7A
 KCoQqX0bf3vmkCtg0CrkFkRkc7D2B3Rzg77RaryojfxbmXXAhrcYCNr5+CDIhOjGk6m4
 VvTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaE9fS5hNtIXtDK6c8osrzkR2ll1fg56nGwevZ3IBlFZUccdUgAPBFQfV/D+3ooo09VJyY85T9IZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKnkJaUTapMLGdlOSC7rvWXqt56tQzd/EOu3rXLDhnuGvo3D/C
 uVFQKGiAZ87Vrhcs2hDSR0tugdx/pWG++DS9sHWs0/tnW7AhuP2zGJEYi1TaFwG6HVQNbiOJ/rQ
 QFgOa2E01Sr7bVI4Iywo1iXO0hAW4Y7Y1VBzvgeV+Any8PBvFDqUDkl5A+Eo=
X-Google-Smtp-Source: AGHT+IHfCiWzh1x3f5wDLNXu2i83Btmx14JdBi4AdfR7fkuznpeJOZ3EkL8T9mqZwcuFuM/FjqXf4sDMXqPZnsQ3X2HEx3Z+EAqY
MIME-Version: 1.0
X-Received: by 2002:a92:c248:0:b0:424:866:ec6d with SMTP id
 e9e14a558f8ab-4240866edffmr24886355ab.12.1757951970963; Mon, 15 Sep 2025
 08:59:30 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:59:30 -0700
In-Reply-To: <68bf2c3f.050a0220.192772.0884.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c837e2.050a0220.2ff435.039c.GAE@google.com>
Subject: Re: [syzbot] [fbdev?] KASAN: vmalloc-out-of-bounds Write in imageblit
 (5)
From: syzbot <syzbot+48b0652a95834717f190@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, simona@ffwll.ch, 
 soci@c64.rulez.org, syzkaller-bugs@googlegroups.com
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

HEAD commit:    f83ec76bf285 Linux 6.17-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e5f934580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f01d8629880e620
dashboard link: https://syzkaller.appspot.com/bug?extid=48b0652a95834717f190
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14097b62580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a9bb12580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f83ec76b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bdedf70f8797/vmlinux-f83ec76b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5bf9318d9242/bzImage-f83ec76b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fb_write_offset drivers/video/fbdev/core/sysmem.h:30 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_2ppw drivers/video/fbdev/core/fb_imageblit.h:364 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_bitmap_imageblit drivers/video/fbdev/core/fb_imageblit.h:462 [inline]
BUG: KASAN: vmalloc-out-of-bounds in fb_imageblit drivers/video/fbdev/core/fb_imageblit.h:492 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1a6f/0x1e60 drivers/video/fbdev/core/sysimgblt.c:24
Write of size 8 at addr ffffc900051b1000 by task syz.0.17/6126

CPU: 2 UID: 0 PID: 6126 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 fb_write_offset drivers/video/fbdev/core/sysmem.h:30 [inline]
 fb_bitmap_2ppw drivers/video/fbdev/core/fb_imageblit.h:364 [inline]
 fb_bitmap_imageblit drivers/video/fbdev/core/fb_imageblit.h:462 [inline]
 fb_imageblit drivers/video/fbdev/core/fb_imageblit.h:492 [inline]
 sys_imageblit+0x1a6f/0x1e60 drivers/video/fbdev/core/sysimgblt.c:24
 drm_fbdev_shmem_defio_imageblit+0x20/0x130 drivers/gpu/drm/drm_fbdev_shmem.c:38
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:138 [inline]
 bit_putcs+0x90f/0xde0 drivers/video/fbdev/core/bitblit.c:187
 fbcon_putcs+0x384/0x4a0 drivers/video/fbdev/core/fbcon.c:1327
 do_update_region+0x2e6/0x3f0 drivers/tty/vt/vt.c:627
 invert_screen+0x1e4/0x590 drivers/tty/vt/vt.c:748
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:87 [inline]
 clear_selection+0x59/0x70 drivers/tty/vt/selection.c:83
 vc_do_resize+0xd9b/0x10e0 drivers/tty/vt/vt.c:1195
 vc_resize include/linux/vt_kern.h:49 [inline]
 fbcon_set_disp+0x7ad/0xe50 drivers/video/fbdev/core/fbcon.c:1430
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:828 [inline]
 set_con2fb_map+0x703/0x1080 drivers/video/fbdev/core/fbcon.c:902
 fbcon_set_con2fb_map_ioctl+0x16c/0x220 drivers/video/fbdev/core/fbcon.c:3132
 do_fb_ioctl+0x328/0x7e0 drivers/video/fbdev/core/fb_chrdev.c:138
 fb_ioctl+0xe5/0x150 drivers/video/fbdev/core/fb_chrdev.c:169
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8e73d8eba9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc51d189d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8e73fd5fa0 RCX: 00007f8e73d8eba9
RDX: 0000200000000180 RSI: 0000000000004610 RDI: 0000000000000004
RBP: 00007f8e73e11e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8e73fd5fa0 R14: 00007f8e73fd5fa0 R15: 0000000000000003
 </TASK>

The buggy address belongs to a 0-page vmalloc region starting at 0xffffc90004eb1000 allocated at drm_gem_shmem_vmap_locked+0x561/0x7e0 drivers/gpu/drm/drm_gem_shmem_helper.c:371
Memory state around the buggy address:
 ffffc900051b0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc900051b0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc900051b1000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc900051b1080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc900051b1100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
