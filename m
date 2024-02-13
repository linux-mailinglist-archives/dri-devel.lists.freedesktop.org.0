Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF68532A9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F5F10E355;
	Tue, 13 Feb 2024 14:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360410E43E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 14:08:16 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-363d169c770so11201165ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 06:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707833295; x=1708438095;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AVvcv6zE2WG6qP6TAxb9h0JZjjLETbfDdGCQEtHM0hg=;
 b=NyHZye+qJrvNjwt2gPewwfd1LtbaZ2gMsnxIFM0saDTMYe0eRTm/yw2AlO2EGKRB/u
 /caS9LGQxDeXYGz2NlETssEDGuBfH8L2YyK2zaAI8mLdol/h2Gy/hZFGhmObSSPZ7d/a
 XpOgbqbIxTXBxdMxoQ/JAs1MXeZFZVQPd4FUNhV66sNv+5HZf8k7egHR0KIQtyuqe15b
 F/OuEiJSE8dysarRWqlFkeu0IKuxgoI+rDCfzSITfvlsPgXrR9ji/y6LYNfXI3vuSDor
 JpM1WoarGoI6tdXOuSgEaWoZ10TGtPr1pWTOTt5uVDu8IpBtDBC3A4pbNpYysKy4mcEB
 oG2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHz1EPE/kaNblcMU0D2G8TFIiq1lBDxk5Y+mhuIJBPJBujPoSE2YxY1f4n8CgY/LpKggeMSTnynoOPZGKXVjUcfP1QNal6uOaESOg8j1/O
X-Gm-Message-State: AOJu0YxZfYw7YZJFINChld8Qc2McLn4A3UMeBLyLWfeHc4Xmsm/qpnYy
 AMxa1ObVWbbDNHyq7hpi4rJETrkymROL8zGBlStml0LuC/ArgZVkSIPOnW+M7/dDtjdgqz91w9i
 Ku3eFcYdj8aXNo4fNwHUvn+BbLlt8T+6ILLps7roDqwXAx+X6ZE8No5E=
X-Google-Smtp-Source: AGHT+IF3mB2NNHgYRuJ1bIXNxeIi1aNd+qgxdmDfQx88zkQH4UqnqnBOzLITdPHD2y3LUm7k5G7Spe4v5zlbsYD0bicS75TmH6ju
MIME-Version: 1.0
X-Received: by 2002:a92:c265:0:b0:363:de50:f7bb with SMTP id
 h5-20020a92c265000000b00363de50f7bbmr850266ild.2.1707833295651; Tue, 13 Feb
 2024 06:08:15 -0800 (PST)
Date: Tue, 13 Feb 2024 06:08:15 -0800
In-Reply-To: <0000000000001d010d06112d0bf2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ec4c32061143ec95@google.com>
Subject: Re: [syzbot] [dri?] KASAN: slab-use-after-free Read in
 drm_atomic_helper_wait_for_vblanks (2)
From: syzbot <syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    c664e16bb1ba Merge tag 'docs-6.8-fixes2' of git://git.lwn...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f8d1e0180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df82262440d95bc4
dashboard link: https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1086cd48180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11fcdba2180000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-c664e16b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c838390fdb6c/vmlinux-c664e16b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d25123cb1896/bzImage-c664e16b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in drm_atomic_helper_wait_for_vblanks.part.0+0x84f/0x930 drivers/gpu/drm/drm_atomic_helper.c:1661
Read of size 1 at addr ffff88802d6f0409 by task kworker/u16:1/13

CPU: 1 PID: 13 Comm: kworker/u16:1 Not tainted 6.8.0-rc4-syzkaller-00005-gc664e16bb1ba #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: events_unbound commit_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc4/0x620 mm/kasan/report.c:488
 kasan_report+0xda/0x110 mm/kasan/report.c:601
 drm_atomic_helper_wait_for_vblanks.part.0+0x84f/0x930 drivers/gpu/drm/drm_atomic_helper.c:1661
 drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1657 [inline]
 drm_atomic_helper_commit_tail+0xcb/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1757
 commit_tail+0x356/0x410 drivers/gpu/drm/drm_atomic_helper.c:1834
 process_one_work+0x889/0x15e0 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x8b9/0x12a0 kernel/workqueue.c:2787
 kthread+0x2c6/0x3b0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1b/0x30 arch/x86/entry/entry_64.S:242
 </TASK>

Allocated by task 5401:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:372 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:389
 kmalloc include/linux/slab.h:590 [inline]
 drm_atomic_helper_crtc_duplicate_state+0x70/0xd0 drivers/gpu/drm/drm_atomic_state_helper.c:177
 drm_atomic_get_crtc_state+0x162/0x440 drivers/gpu/drm/drm_atomic.c:362
 page_flip_common+0x57/0x320 drivers/gpu/drm/drm_atomic_helper.c:3629
 drm_atomic_helper_page_flip+0xb6/0x190 drivers/gpu/drm/drm_atomic_helper.c:3690
 drm_mode_page_flip_ioctl+0x103f/0x1470 drivers/gpu/drm/drm_plane.c:1489
 drm_ioctl_kernel+0x1ec/0x3e0 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x5d8/0xc00 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77

Freed by task 5401:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3f/0x60 mm/kasan/generic.c:640
 poison_slab_object mm/kasan/common.c:241 [inline]
 __kasan_slab_free+0x121/0x1c0 mm/kasan/common.c:257
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2121 [inline]
 slab_free mm/slub.c:4299 [inline]
 kfree+0x124/0x370 mm/slub.c:4409
 drm_atomic_state_default_clear+0x3aa/0xde0 drivers/gpu/drm/drm_atomic.c:225
 drm_atomic_state_clear drivers/gpu/drm/drm_atomic.c:294 [inline]
 __drm_atomic_state_free+0x185/0x2b0 drivers/gpu/drm/drm_atomic.c:311
 kref_put include/linux/kref.h:65 [inline]
 drm_atomic_state_put include/drm/drm_atomic.h:490 [inline]
 drm_client_modeset_commit_atomic+0x6db/0x810 drivers/gpu/drm/drm_client_modeset.c:1057
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1154
 drm_client_modeset_commit+0x4f/0x80 drivers/gpu/drm/drm_client_modeset.c:1180
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:251 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:230 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:278 [inline]
 drm_fb_helper_lastclose+0xc7/0x160 drivers/gpu/drm/drm_fb_helper.c:2005
 drm_fbdev_generic_client_restore+0x2c/0x40 drivers/gpu/drm/drm_fbdev_generic.c:258
 drm_client_dev_restore+0x188/0x2a0 drivers/gpu/drm/drm_client.c:247
 drm_release+0x32f/0x3e0 drivers/gpu/drm/drm_file.c:437
 __fput+0x270/0xb80 fs/file_table.c:376
 __fput_sync+0x47/0x50 fs/file_table.c:461
 __do_sys_close fs/open.c:1554 [inline]
 __se_sys_close fs/open.c:1539 [inline]
 __x64_sys_close+0x87/0x100 fs/open.c:1539
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77

The buggy address belongs to the object at ffff88802d6f0400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 9 bytes inside of
 freed 512-byte region [ffff88802d6f0400, ffff88802d6f0600)

The buggy address belongs to the physical page:
page:ffffea0000b5bc00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d6f0
head:ffffea0000b5bc00 order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000840(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000840 ffff888014c42c80 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5401, tgid 5401 (syz-executor102), ts 53592743984, free_ts 53573722996
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2d4/0x350 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0xa28/0x3780 mm/page_alloc.c:3311
 __alloc_pages+0x22f/0x2440 mm/page_alloc.c:4567
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page mm/slub.c:2190 [inline]
 allocate_slab mm/slub.c:2354 [inline]
 new_slab+0xcc/0x3a0 mm/slub.c:2407
 ___slab_alloc+0x4af/0x19a0 mm/slub.c:3540
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3625
 __slab_alloc_node mm/slub.c:3678 [inline]
 slab_alloc_node mm/slub.c:3850 [inline]
 kmalloc_trace+0x30b/0x340 mm/slub.c:4007
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 drm_master_create+0x43/0x4d0 drivers/gpu/drm/drm_auth.c:136
 drm_new_set_master+0xd6/0x450 drivers/gpu/drm/drm_auth.c:172
 drm_master_open+0x181/0x1f0 drivers/gpu/drm/drm_auth.c:342
 drm_open_helper+0x3fc/0x500 drivers/gpu/drm/drm_file.c:330
 drm_open+0x1a0/0x490 drivers/gpu/drm/drm_file.c:380
 drm_stub_open+0x28e/0x430 drivers/gpu/drm/drm_drv.c:1046
 chrdev_open+0x26d/0x6f0 fs/char_dev.c:414
 do_dentry_open+0x8da/0x18c0 fs/open.c:953
 do_open fs/namei.c:3641 [inline]
 path_openat+0x1e00/0x29a0 fs/namei.c:3798
page last free pid 5398 tgid 5398 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x527/0xb10 mm/page_alloc.c:2346
 free_unref_page+0x33/0x3c0 mm/page_alloc.c:2486
 rcu_do_batch kernel/rcu/tree.c:2190 [inline]
 rcu_core+0x819/0x1680 kernel/rcu/tree.c:2465
 __do_softirq+0x21c/0x8e7 kernel/softirq.c:553

Memory state around the buggy address:
 ffff88802d6f0300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802d6f0380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802d6f0400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88802d6f0480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802d6f0500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
