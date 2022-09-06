Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E35AE178
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95AD10E595;
	Tue,  6 Sep 2022 07:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E1010E595
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:44:57 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z6so16049417lfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zwx3jUyHyoTVAwcDukId8hXy3HW+VA9rf/zlu9PzbFU=;
 b=ObzXQ7J3OvkIQ6gZ70kM5FGwzKodiZ3+3Q/0mYnov470kXz+MYzUkmbNhIcyVZiiYQ
 NUTfAzy8l8umt5nzS/5QuH55EuiqZwFKAWMG6ZZJ2XaTVpmQsKlaj533ig5sdA6lddqU
 RbUkPxNf1aEGRa1dvWoJCw9V0GmUjmXGUdPNRoB8xn9uJMPP5NeLrYjao0OuyhWKmhOa
 GWY4mrZcbPg5sUgzp5k+BHtdPilG0hhtXiccDYkQXAjo2YYA0uWN/Kg6S0U63umzF7Eq
 buxkY/d8LT4WpcgWub4VDeLAlTpia5aSdxIq1rVEkpblsZxJsrMbNYYshbtGySbIHLIS
 ZmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zwx3jUyHyoTVAwcDukId8hXy3HW+VA9rf/zlu9PzbFU=;
 b=sY1LxSdmFcCFzf+NcQK6d2tOoD0I9eKcInG0DtKG0ExfWklL58Y1Ux/CT62cR92NhA
 uYZPfY8Lc/axTyjaLDbJSA5M4b3/MTTyFROIHMj4KSezplJzW5lzSNyZXGVWm4YwTuzw
 SunGy/GqzGfdxrJkD0v3j9lwXfPrtt+Qoh4SAy1SlL/bvLkrv6boZfuO9N2cSYqqZjt+
 4rjv0zsnkE0VppZGz+/FsulibKoF7sKESq16Bapm8R6+RI7NvAyuyilG37YxzWMN5kFM
 2w9Hgj19QgnQ6aiJQ4YIimk6jA93mrMYKPU+npnWHY3nOJaSAJ+q2ljvjFGpr8WKaXLw
 ecVQ==
X-Gm-Message-State: ACgBeo0YIoEG7bIInrDHML3Dtg/zqtfolECsT/JIpYVK+W7AIfw/HK5g
 xaBA0BZCg1oRiFnEHpsPfazpASsaLuRexOaWyUuBAA==
X-Google-Smtp-Source: AA6agR4drPQPNZ8n/PVJ8ef1q2TTiog3iOJLgAgjDM1oM06im3bc/dVZQPJCeSqyLN1FNltjUdl1NXSEDodR7ziNvu0=
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr19055200lfr.598.1662450295446; Tue, 06
 Sep 2022 00:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fad77705e7fd40fb@google.com>
In-Reply-To: <000000000000fad77705e7fd40fb@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 6 Sep 2022 09:44:43 +0200
Message-ID: <CACT4Y+YN_osf55_PVs1jQQiAMmqnzUp1Sv2CvUnMg888ZPKM1A@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in task_work_run (2)
To: syzbot <syzbot+9228d6098455bb209ec8@syzkaller.appspotmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org
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
Cc: axboe@kernel.dk, keescook@chromium.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com, asml.silence@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Sept 2022 at 09:36, syzbot
<syzbot+9228d6098455bb209ec8@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c5e4d5e99162 Merge tag 'fscache-fixes-20220831' of git://g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=142e0e1b080000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9c5c41fc03fda66f
> dashboard link: https://syzkaller.appspot.com/bug?extid=9228d6098455bb209ec8
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9228d6098455bb209ec8@syzkaller.appspotmail.com

Looks like the issue is in dma-buf.c
+dma-buf.c maintainers


> ==================================================================
> BUG: KASAN: use-after-free in task_work_run+0x126/0x1c0 kernel/task_work.c:176
> Read of size 8 at addr ffff88801d1fe500 by task syz-executor.2/18582
>
> CPU: 0 PID: 18582 Comm: syz-executor.2 Not tainted 6.0.0-rc3-syzkaller-00031-gc5e4d5e99162 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
>  print_address_description+0x65/0x4b0 mm/kasan/report.c:317
>  print_report+0x108/0x220 mm/kasan/report.c:433
>  kasan_report+0xfb/0x130 mm/kasan/report.c:495
>  task_work_run+0x126/0x1c0 kernel/task_work.c:176
>  resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
>  exit_to_user_mode_loop+0x134/0x160 kernel/entry/common.c:169
>  exit_to_user_mode_prepare+0xad/0x110 kernel/entry/common.c:201
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>  syscall_exit_to_user_mode+0x2e/0x60 kernel/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f287f289279
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f28804cd168 EFLAGS: 00000246 ORIG_RAX: 0000000000000119
> RAX: 0000000000000001 RBX: 00007f287f39bf80 RCX: 00007f287f289279
> RDX: 0000000000000001 RSI: 0000000020000000 RDI: 0000000000000003
> RBP: 00007f287f2e32e9 R08: 0000000000000000 R09: 0000000000000000
> R10: 00000000000006ff R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffd34f4ba0f R14: 00007f28804cd300 R15: 0000000000022000
>  </TASK>
>
> Allocated by task 18586:
>  kasan_save_stack mm/kasan/common.c:38 [inline]
>  kasan_set_track mm/kasan/common.c:45 [inline]
>  set_alloc_info mm/kasan/common.c:437 [inline]
>  __kasan_slab_alloc+0xb2/0xe0 mm/kasan/common.c:470
>  kasan_slab_alloc include/linux/kasan.h:224 [inline]
>  slab_post_alloc_hook mm/slab.h:727 [inline]
>  slab_alloc_node mm/slub.c:3243 [inline]
>  slab_alloc mm/slub.c:3251 [inline]
>  __kmem_cache_alloc_lru mm/slub.c:3258 [inline]
>  kmem_cache_alloc+0x1a6/0x310 mm/slub.c:3268
>  kmem_cache_zalloc include/linux/slab.h:723 [inline]
>  __alloc_file+0x26/0x230 fs/file_table.c:138
>  alloc_empty_file+0xa9/0x1b0 fs/file_table.c:187
>  alloc_file+0x58/0x5e0 fs/file_table.c:229
>  alloc_file_pseudo+0x260/0x300 fs/file_table.c:272
>  dma_buf_getfile drivers/dma-buf/dma-buf.c:534 [inline]
>  dma_buf_export+0x634/0x920 drivers/dma-buf/dma-buf.c:652
>  drm_gem_dmabuf_export drivers/gpu/drm/drm_prime.c:253 [inline]
>  drm_gem_prime_export+0x255/0x400 drivers/gpu/drm/drm_prime.c:895
>  export_and_register_object drivers/gpu/drm/drm_prime.c:397 [inline]
>  drm_gem_prime_handle_to_fd+0x3e6/0x530 drivers/gpu/drm/drm_prime.c:465
>  drm_ioctl_kernel+0x33e/0x4f0 drivers/gpu/drm/drm_ioctl.c:782
>  drm_ioctl+0x626/0xa10 drivers/gpu/drm/drm_ioctl.c:885
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>  __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> Freed by task 18595:
>  kasan_save_stack mm/kasan/common.c:38 [inline]
>  kasan_set_track+0x4c/0x70 mm/kasan/common.c:45
>  kasan_set_free_info+0x1f/0x40 mm/kasan/generic.c:370
>  ____kasan_slab_free+0xd8/0x120 mm/kasan/common.c:367
>  kasan_slab_free include/linux/kasan.h:200 [inline]
>  slab_free_hook mm/slub.c:1754 [inline]
>  slab_free_freelist_hook+0x12e/0x1a0 mm/slub.c:1780
>  slab_free mm/slub.c:3534 [inline]
>  kmem_cache_free+0x95/0x1d0 mm/slub.c:3551
>  rcu_do_batch kernel/rcu/tree.c:2245 [inline]
>  rcu_core+0xa61/0x1710 kernel/rcu/tree.c:2505
>  __do_softirq+0x382/0x793 kernel/softirq.c:571
>
> Last potentially related work creation:
>  kasan_save_stack+0x3b/0x60 mm/kasan/common.c:38
>  __kasan_record_aux_stack+0xaf/0xc0 mm/kasan/generic.c:348
>  call_rcu+0x163/0x9c0 kernel/rcu/tree.c:2793
>  task_work_run+0x146/0x1c0 kernel/task_work.c:177
>  resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
>  exit_to_user_mode_loop+0x134/0x160 kernel/entry/common.c:169
>  exit_to_user_mode_prepare+0xad/0x110 kernel/entry/common.c:201
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>  syscall_exit_to_user_mode+0x2e/0x60 kernel/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> Second to last potentially related work creation:
>  kasan_save_stack+0x3b/0x60 mm/kasan/common.c:38
>  __kasan_record_aux_stack+0xaf/0xc0 mm/kasan/generic.c:348
>  task_work_add+0x2f/0x200 kernel/task_work.c:48
>  fput+0xdc/0x1a0 fs/file_table.c:381
>  dma_buf_poll_cb drivers/dma-buf/dma-buf.c:213 [inline]
>  dma_buf_poll+0x53a/0x680 drivers/dma-buf/dma-buf.c:295
>  vfs_poll include/linux/poll.h:88 [inline]
>  ep_item_poll fs/eventpoll.c:853 [inline]
>  ep_send_events fs/eventpoll.c:1692 [inline]
>  ep_poll+0xb27/0x1e60 fs/eventpoll.c:1821
>  do_epoll_wait+0x1a2/0x210 fs/eventpoll.c:2256
>  do_epoll_pwait fs/eventpoll.c:2290 [inline]
>  __do_sys_epoll_pwait fs/eventpoll.c:2303 [inline]
>  __se_sys_epoll_pwait+0x28e/0x480 fs/eventpoll.c:2297
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> The buggy address belongs to the object at ffff88801d1fe500
>  which belongs to the cache filp of size 456
> The buggy address is located 0 bytes inside of
>  456-byte region [ffff88801d1fe500, ffff88801d1fe6c8)
>
> The buggy address belongs to the physical page:
> page:ffffea0000747f80 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1d1fe
> head:ffffea0000747f80 order:1 compound_mapcount:0 compound_pincount:0
> memcg:ffff888072449c01
> flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
> raw: 00fff00000010200 ffffea00005ddf80 dead000000000002 ffff888140007a00
> raw: 0000000000000000 00000000000c000c 00000001ffffffff ffff888072449c01
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3111, tgid 3111 (v4l_id), ts 20130623440, free_ts 19733718234
>  prep_new_page mm/page_alloc.c:2532 [inline]
>  get_page_from_freelist+0x72b/0x7a0 mm/page_alloc.c:4283
>  __alloc_pages+0x259/0x560 mm/page_alloc.c:5515
>  alloc_slab_page+0x70/0xf0 mm/slub.c:1824
>  allocate_slab+0x5e/0x520 mm/slub.c:1969
>  new_slab mm/slub.c:2029 [inline]
>  ___slab_alloc+0x42e/0xce0 mm/slub.c:3031
>  __slab_alloc mm/slub.c:3118 [inline]
>  slab_alloc_node mm/slub.c:3209 [inline]
>  slab_alloc mm/slub.c:3251 [inline]
>  __kmem_cache_alloc_lru mm/slub.c:3258 [inline]
>  kmem_cache_alloc+0x25d/0x310 mm/slub.c:3268
>  kmem_cache_zalloc include/linux/slab.h:723 [inline]
>  __alloc_file+0x26/0x230 fs/file_table.c:138
>  alloc_empty_file+0xa9/0x1b0 fs/file_table.c:187
>  path_openat+0xf1/0x2e00 fs/namei.c:3677
>  do_filp_open+0x275/0x500 fs/namei.c:3718
>  do_sys_openat2+0x13b/0x500 fs/open.c:1311
>  do_sys_open fs/open.c:1327 [inline]
>  __do_sys_openat fs/open.c:1343 [inline]
>  __se_sys_openat fs/open.c:1338 [inline]
>  __x64_sys_openat+0x243/0x290 fs/open.c:1338
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> page last free stack trace:
>  reset_page_owner include/linux/page_owner.h:24 [inline]
>  free_pages_prepare mm/page_alloc.c:1449 [inline]
>  free_pcp_prepare+0x812/0x900 mm/page_alloc.c:1499
>  free_unref_page_prepare mm/page_alloc.c:3380 [inline]
>  free_unref_page+0x7d/0x630 mm/page_alloc.c:3476
>  qlist_free_all+0x2b/0x70 mm/kasan/quarantine.c:187
>  kasan_quarantine_reduce+0x169/0x180 mm/kasan/quarantine.c:294
>  __kasan_slab_alloc+0x2f/0xe0 mm/kasan/common.c:447
>  kasan_slab_alloc include/linux/kasan.h:224 [inline]
>  slab_post_alloc_hook mm/slab.h:727 [inline]
>  slab_alloc_node mm/slub.c:3243 [inline]
>  slab_alloc mm/slub.c:3251 [inline]
>  __kmem_cache_alloc_lru mm/slub.c:3258 [inline]
>  kmem_cache_alloc+0x1a6/0x310 mm/slub.c:3268
>  vm_area_alloc+0x20/0xe0 kernel/fork.c:459
>  mmap_region+0xb4a/0x16f0 mm/mmap.c:1732
>  do_mmap+0x7a7/0xdf0 mm/mmap.c:1540
>  vm_mmap_pgoff+0x1e5/0x2f0 mm/util.c:552
>  ksys_mmap_pgoff+0x48c/0x6d0 mm/mmap.c:1586
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> Memory state around the buggy address:
>  ffff88801d1fe400: fb fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc
>  ffff88801d1fe480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff88801d1fe500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ffff88801d1fe580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88801d1fe600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000fad77705e7fd40fb%40google.com.
