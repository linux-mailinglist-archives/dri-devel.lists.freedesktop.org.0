Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF152B167AB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 22:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C067710E6DA;
	Wed, 30 Jul 2025 20:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com
 [209.85.166.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8493110E6DA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:34:28 +0000 (UTC)
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-87c33c0b62eso18169339f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753907668; x=1754512468;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7iqe0Epq1mO87GwW47SITGkUjcEFd47BdFhmUKSeFM=;
 b=D2MGjr7kP/eqCuLXFuLH0yiwgpbAPItLFf6jjwrnMm58p1fnB4CQQIKIYrbdDb3cNc
 KnrCIc/kU6qWJs7qXv82t21LqCNnfjxxe8uE6m2fKpZjaUjlDkC+TcsZopI806VYgG0m
 q2j5YiX8aTNVWsFRpWnh15MCb92M9WmLqYeZjEzBuyEWXJTzZ3bpVWEu51p9miqjNjB2
 lE5yX33rq08+qEa8Xs//f0c132rhWkxRyXCg/excY0HBbHTmZ3SvmbQJAvcvtweZyS1B
 on6iakP9yWo6XKT2cifs2kOXLX0HgbrudGT7m8vycAEon08jsQ5lknthy93x7ZkhUPrD
 tY4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiJ+qMTaopUHQY1UZEomakGSbFRRQPKANufFq+/5mw4mhskH0+V03gWpP7d+2psVoxUHEIkjBfNZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhXeVSYkExmhAnq5O6dKaICQrmBTxGZJH6Sv9cc/t37lph27U1
 I5ckwf9gKT8OU3bgynloOaL/AA2Mpq1sWbuKAr8x4AwK384j5kqKVE17W7J9pnWzPEBlkqi2QCn
 5ftuVAaP1gvOW2O9jiEfH4cNuP3ypW9bcKMvfld/DKCDCpJsKecno+r5ms/0=
X-Google-Smtp-Source: AGHT+IHKLWlvNX9CMhZhs247Gr68AqCD8wwlhTrsS/wJQ8usK7VVk44gzy81eWcw11HT7KLAb0bLiWcMnlUfECef6GDh+YYhZnvT
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f93:b0:879:26b0:1cca with SMTP id
 ca18e2360f4ac-88138242044mr881875939f.13.1753907667656; Wed, 30 Jul 2025
 13:34:27 -0700 (PDT)
Date: Wed, 30 Jul 2025 13:34:27 -0700
In-Reply-To: <67bd6bef.050a0220.bbfd1.009d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <688a81d3.050a0220.5d226.000e.GAE@google.com>
Subject: Re: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in
 fbcon_prepare_logo
From: syzbot <syzbot+0c815b25cdb3678e7083@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
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

HEAD commit:    4b290aae788e Merge tag 'sysctl-6.17-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10ff8834580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eb654b6c0c63cccc
dashboard link: https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134389bc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a82ca2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6d83c5020884/disk-4b290aae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/91441dce0745/vmlinux-4b290aae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/55d2e063b8a3/bzImage-4b290aae.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0c815b25cdb3678e7083@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in scr_memcpyw include/linux/vt_buffer.h:38 [inline]
BUG: KASAN: slab-out-of-bounds in fbcon_prepare_logo+0xa03/0xc70 drivers/video/fbdev/core/fbcon.c:618
Read of size 256 at addr ffff8880331da860 by task syz.0.17/5996

CPU: 0 UID: 0 PID: 5996 Comm: syz.0.17 Not tainted 6.16.0-syzkaller-04405-g4b290aae788e #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 scr_memcpyw include/linux/vt_buffer.h:38 [inline]
 fbcon_prepare_logo+0xa03/0xc70 drivers/video/fbdev/core/fbcon.c:618
 fbcon_init+0xd77/0x1900 drivers/video/fbdev/core/fbcon.c:1150
 visual_init+0x31d/0x620 drivers/tty/vt/vt.c:1019
 do_bind_con_driver.isra.0+0x57a/0xbf0 drivers/tty/vt/vt.c:3915
 vt_bind drivers/tty/vt/vt.c:4071 [inline]
 store_bind+0x61d/0x760 drivers/tty/vt/vt.c:4143
 dev_attr_store+0x55/0x80 drivers/base/core.c:2437
 sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x354/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x6c4/0x1150 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f580578e9a9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffce73cfbb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f58059b5fa0 RCX: 00007f580578e9a9
RDX: 0000000000000081 RSI: 00002000000001c0 RDI: 0000000000000004
RBP: 00007f5805810d69 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f58059b5fa0 R14: 00007f58059b5fa0 R15: 0000000000000003
 </TASK>

The buggy address belongs to the object at ffff8880331da000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 96 bytes to the right of
 allocated 2048-byte region [ffff8880331da000, ffff8880331da800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x331d8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b842000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b842000 dead000000000122 0000000000000000
head: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0000cc7601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x1d20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_HARDWALL), pid 5996, tgid 5996 (syz.0.17), ts 103546222970, free_ts 103072976762
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x1321/0x3890 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:4959
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab mm/slub.c:2619 [inline]
 new_slab+0x23b/0x330 mm/slub.c:2673
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3859
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3949
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 vc_do_resize+0x1de/0x10e0 drivers/tty/vt/vt.c:1182
 vc_resize include/linux/vt_kern.h:49 [inline]
 fbcon_startup+0x427/0xba0 drivers/video/fbdev/core/fbcon.c:1001
 do_bind_con_driver.isra.0+0x20a/0xbf0 drivers/tty/vt/vt.c:3878
 vt_bind drivers/tty/vt/vt.c:4071 [inline]
 store_bind+0x61d/0x760 drivers/tty/vt/vt.c:4143
 dev_attr_store+0x55/0x80 drivers/base/core.c:2437
 sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x354/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x6c4/0x1150 fs/read_write.c:686
page last free pid 5947 tgid 5947 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0x7fe/0x1180 mm/page_alloc.c:2706
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x1d4/0x510 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 fib6_info_alloc+0x40/0x160 net/ipv6/ip6_fib.c:155
 ip6_route_info_create+0x14c/0x870 net/ipv6/route.c:3811
 ip6_route_add.part.0+0x22/0x1d0 net/ipv6/route.c:3940
 ip6_route_add+0x45/0x60 net/ipv6/route.c:3937
 addrconf_prefix_route+0x2fd/0x510 net/ipv6/addrconf.c:2487
 inet6_addr_add+0x589/0x960 net/ipv6/addrconf.c:3052
 inet6_rtm_newaddr+0x1619/0x1c70 net/ipv6/addrconf.c:5058
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6944
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
 netlink_unicast_kernel net/netlink/af_netlink.c:1320 [inline]
 netlink_unicast+0x58a/0x850 net/netlink/af_netlink.c:1346
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1896

Memory state around the buggy address:
 ffff8880331da700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880331da780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880331da800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                       ^
 ffff8880331da880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880331da900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
