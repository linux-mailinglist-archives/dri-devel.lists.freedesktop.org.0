Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C512D618CFB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 00:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42310E6F7;
	Thu,  3 Nov 2022 23:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3615910E051
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 23:48:44 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 l4-20020a056e021aa400b00300ad9535c8so2712263ilv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 16:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VYrg0EEyMxOb+TBlekrry7Ema8+sjyy2Kll8KTKkBpA=;
 b=E/1M08n087FOmnp5cq9CmxdenOhtxGhv0WoDfObFhFa/JWGYs3iMBByghkkc6ewRNU
 ue5ieD7/RdYywA81HVBnK+ZPmsm/zfJx6mbyqpPVNrwACUGliATruKGJuS9/w/GDtaYZ
 Q4vh3tSwj5LDtwVCnlmrvVGW7/UAo3HcCNZHRjifx54mGloRT/6EKLXn0m3TkgKxMhR7
 jUMSCrsuaXv7wpby4LnKzRPhOpd+/HotjSjHc5FAgG1Uncu34loBWuZwdEKQ35qXbRsb
 46LlhzHg99sMn/dBxs9Zyo1vFco1Dy1XacIwv/+nwSpEj9idv/PKSJtLYhN5YM6FeYmo
 3p0w==
X-Gm-Message-State: ACrzQf1hibgPG/iCQMfNkJDlyC16KSmde3KQYCDTxP8yWeH85XSdV66Z
 jyK3WaQONP1ZGPBG2XRYKN4vgiOUzrqmY4suH9awWXb0gIni
X-Google-Smtp-Source: AMsMyM4984XbYmnWpbo/LBct/4rQSIVucmXH6Hsl4L6QvOe9BXkVGoDV6R990+I/e54iRI1GOCTqYrMYnVzgmVyJc8OUu56clJaT
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2d04:b0:6d5:e06a:30e4 with SMTP id
 c4-20020a0566022d0400b006d5e06a30e4mr3532871iow.189.1667519323244; Thu, 03
 Nov 2022 16:48:43 -0700 (PDT)
Date: Thu, 03 Nov 2022 16:48:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000eb0f4705ec999859@google.com>
Subject: [syzbot] KASAN: use-after-free Read in drm_gem_handle_delete
From: syzbot <syzbot+6a195db6dbcc80732ab9@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maxime@cerno.tech, steven.price@arm.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

Hello,

syzbot found the following issue on:

HEAD commit:    b229b6ca5abb Merge tag 'perf-tools-fixes-for-v6.1-2022-10-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14dddf5e880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
dashboard link: https://syzkaller.appspot.com/bug?extid=6a195db6dbcc80732ab9
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a7054f95968/disk-b229b6ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/907d97ef4d30/vmlinux-b229b6ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f5f3eb6d623/bzImage-b229b6ca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6a195db6dbcc80732ab9@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in drm_gem_object_release_handle drivers/gpu/drm/drm_gem.c:239 [inline]
BUG: KASAN: use-after-free in drm_gem_handle_delete+0x149/0x160 drivers/gpu/drm/drm_gem.c:273
Read of size 8 at addr ffff8880742879e8 by task syz-executor.4/5245

CPU: 0 PID: 5245 Comm: syz-executor.4 Not tainted 6.1.0-rc2-syzkaller-00105-gb229b6ca5abb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:284 [inline]
 print_report+0x15e/0x45d mm/kasan/report.c:395
 kasan_report+0xbb/0x1f0 mm/kasan/report.c:495
 drm_gem_object_release_handle drivers/gpu/drm/drm_gem.c:239 [inline]
 drm_gem_handle_delete+0x149/0x160 drivers/gpu/drm/drm_gem.c:273
 drm_mode_destroy_dumb drivers/gpu/drm/drm_dumb_buffers.c:145 [inline]
 drm_mode_destroy_dumb_ioctl+0xf2/0x140 drivers/gpu/drm/drm_dumb_buffers.c:153
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:788
 drm_ioctl+0x3e2/0xa30 drivers/gpu/drm/drm_ioctl.c:891
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f649b68b5a9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f649c434168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f649b7ac050 RCX: 00007f649b68b5a9
RDX: 0000000020000200 RSI: 00000000c00464b4 RDI: 0000000000000003
RBP: 00007f649b6e67b0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f649b8cfb1f R14: 00007f649c434300 R15: 0000000000022000
 </TASK>

Allocated by task 5186:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:45
 kasan_set_track+0x21/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:371 [inline]
 ____kasan_kmalloc mm/kasan/common.c:330 [inline]
 __kasan_kmalloc+0xa1/0xb0 mm/kasan/common.c:380
 kmalloc include/linux/slab.h:576 [inline]
 kzalloc include/linux/slab.h:712 [inline]
 vgem_gem_create_object+0x38/0xb0 drivers/gpu/drm/vgem/vgem_drv.c:98
 __drm_gem_shmem_create+0x80/0x480 drivers/gpu/drm/drm_gem_shmem_helper.c:62
 drm_gem_shmem_create drivers/gpu/drm/drm_gem_shmem_helper.c:127 [inline]
 drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:424 [inline]
 drm_gem_shmem_dumb_create+0x13c/0x380 drivers/gpu/drm/drm_gem_shmem_helper.c:534
 drm_mode_create_dumb+0x26c/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:96
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:788
 drm_ioctl+0x3e2/0xa30 drivers/gpu/drm/drm_ioctl.c:891
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 5186:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:45
 kasan_set_track+0x21/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2a/0x40 mm/kasan/generic.c:511
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x160/0x1c0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:177 [inline]
 slab_free_hook mm/slub.c:1724 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1750
 slab_free mm/slub.c:3661 [inline]
 __kmem_cache_free+0xab/0x3b0 mm/slub.c:3674
 drm_gem_object_free drivers/gpu/drm/drm_gem.c:961 [inline]
 kref_put include/linux/kref.h:65 [inline]
 __drm_gem_object_put include/drm/drm_gem.h:430 [inline]
 drm_gem_object_put include/drm/drm_gem.h:443 [inline]
 drm_gem_mmap+0x4f6/0x770 drivers/gpu/drm/drm_gem.c:1121
 call_mmap include/linux/fs.h:2196 [inline]
 mmap_region+0x6bf/0x1c00 mm/mmap.c:2625
 do_mmap+0x825/0xf50 mm/mmap.c:1412
 vm_mmap_pgoff+0x1ab/0x270 mm/util.c:520
 ksys_mmap_pgoff+0x41b/0x5a0 mm/mmap.c:1458
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Last potentially related work creation:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xbc/0xd0 mm/kasan/generic.c:481
 kvfree_call_rcu+0x74/0x8f0 kernel/rcu/tree.c:3343
 neigh_destroy+0x431/0x630 net/core/neighbour.c:912
 neigh_release include/net/neighbour.h:449 [inline]
 neigh_cleanup_and_release+0x271/0x3d0 net/core/neighbour.c:103
 neigh_del net/core/neighbour.c:225 [inline]
 neigh_remove_one+0x37d/0x460 net/core/neighbour.c:246
 neigh_forced_gc net/core/neighbour.c:276 [inline]
 neigh_alloc net/core/neighbour.c:447 [inline]
 ___neigh_create+0x191f/0x2a20 net/core/neighbour.c:642
 ip6_finish_output2+0xfb8/0x1520 net/ipv6/ip6_output.c:125
 __ip6_finish_output net/ipv6/ip6_output.c:195 [inline]
 ip6_finish_output+0x690/0x1160 net/ipv6/ip6_output.c:206
 NF_HOOK_COND include/linux/netfilter.h:291 [inline]
 ip6_output+0x1ed/0x540 net/ipv6/ip6_output.c:227
 dst_output include/net/dst.h:445 [inline]
 NF_HOOK include/linux/netfilter.h:302 [inline]
 ndisc_send_skb+0xa5f/0x1730 net/ipv6/ndisc.c:508
 ndisc_send_rs+0x12e/0x6f0 net/ipv6/ndisc.c:718
 addrconf_rs_timer+0x3ed/0x810 net/ipv6/addrconf.c:3931
 call_timer_fn+0x1da/0x7c0 kernel/time/timer.c:1474
 expire_timers kernel/time/timer.c:1519 [inline]
 __run_timers.part.0+0x6a2/0xaf0 kernel/time/timer.c:1790
 __run_timers kernel/time/timer.c:1768 [inline]
 run_timer_softirq+0xb3/0x1d0 kernel/time/timer.c:1803
 __do_softirq+0x1f7/0xad8 kernel/softirq.c:571

The buggy address belongs to the object at ffff888074287800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 488 bytes inside of
 1024-byte region [ffff888074287800, ffff888074287c00)

The buggy address belongs to the physical page:
page:ffffea0001d0a000 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x74280
head:ffffea0001d0a000 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 dead000000000100 dead000000000122 ffff888011841dc0
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2a20(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3600, tgid 3595 (syz-fuzzer), ts 51791917954, free_ts 51493551447
 prep_new_page mm/page_alloc.c:2538 [inline]
 get_page_from_freelist+0x10b5/0x2d50 mm/page_alloc.c:4287
 __alloc_pages+0x1c7/0x5a0 mm/page_alloc.c:5554
 alloc_pages+0x1a6/0x270 mm/mempolicy.c:2285
 alloc_slab_page mm/slub.c:1794 [inline]
 allocate_slab+0x213/0x300 mm/slub.c:1939
 new_slab mm/slub.c:1992 [inline]
 ___slab_alloc+0xa91/0x1400 mm/slub.c:3180
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3279
 slab_alloc_node mm/slub.c:3364 [inline]
 __kmem_cache_alloc_node+0x191/0x3e0 mm/slub.c:3437
 __do_kmalloc_node mm/slab_common.c:954 [inline]
 __kmalloc_node_track_caller+0x45/0xc0 mm/slab_common.c:975
 kmalloc_reserve net/core/skbuff.c:437 [inline]
 __alloc_skb+0xd9/0x2f0 net/core/skbuff.c:509
 alloc_skb include/linux/skbuff.h:1267 [inline]
 __tcp_send_ack.part.0+0x67/0x760 net/ipv4/tcp_output.c:3960
 __tcp_send_ack net/ipv4/tcp_output.c:3992 [inline]
 tcp_send_ack+0x7d/0xa0 net/ipv4/tcp_output.c:3992
 __tcp_cleanup_rbuf+0x356/0x470 net/ipv4/tcp.c:1617
 tcp_recvmsg_locked+0x72c/0x22c0 net/ipv4/tcp.c:2649
 tcp_recvmsg+0x113/0x620 net/ipv4/tcp.c:2679
 inet_recvmsg+0x110/0x5d0 net/ipv4/af_inet.c:859
 sock_recvmsg_nosec net/socket.c:995 [inline]
 sock_recvmsg net/socket.c:1013 [inline]
 sock_recvmsg net/socket.c:1009 [inline]
 sock_read_iter+0x344/0x470 net/socket.c:1086
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1458 [inline]
 free_pcp_prepare+0x65c/0xd90 mm/page_alloc.c:1508
 free_unref_page_prepare mm/page_alloc.c:3386 [inline]
 free_unref_page+0x19/0x4d0 mm/page_alloc.c:3482
 __unfreeze_partials+0x17c/0x1a0 mm/slub.c:2586
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0x62/0x80 mm/kasan/common.c:302
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slab.h:737 [inline]
 slab_alloc_node mm/slub.c:3398 [inline]
 slab_alloc mm/slub.c:3406 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3413 [inline]
 kmem_cache_alloc+0x2ac/0x3c0 mm/slub.c:3422
 mt_alloc_one lib/maple_tree.c:152 [inline]
 mas_alloc_nodes+0x429/0x810 lib/maple_tree.c:1231
 mas_node_count_gfp lib/maple_tree.c:1316 [inline]
 mas_preallocate+0x1b7/0x360 lib/maple_tree.c:5719
 do_mas_align_munmap+0x11c/0xee0 mm/mmap.c:2314
 do_mas_munmap+0x26a/0x2b0 mm/mmap.c:2502
 mmap_region+0x219/0x1c00 mm/mmap.c:2550
 do_mmap+0x825/0xf50 mm/mmap.c:1412
 vm_mmap_pgoff+0x1ab/0x270 mm/util.c:520
 ksys_mmap_pgoff+0x79/0x5a0 mm/mmap.c:1458
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80

Memory state around the buggy address:
 ffff888074287880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888074287900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888074287980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888074287a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888074287a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
