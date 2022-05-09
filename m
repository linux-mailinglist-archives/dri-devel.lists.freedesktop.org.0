Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29F52067F
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 23:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2210E7FE;
	Mon,  9 May 2022 21:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Mon, 09 May 2022 21:11:55 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD05010E7FE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 21:11:55 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 249L5N4k003387
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 17:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652130331; bh=BunAaHafxIwGSXvWzTaUU2Vd3jcLoKB1GDg8ARz5CFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=jwI6tpOrZkkrs7rudt5a0xznN76pi4kIUUiO2bRgM1P/m+tCbVMM7+WAro6O2PJAe
 bmGE7hS5FYkS7AoBHli4VdqAG7cQLodlLI4s3MZ11nPEx2q4zGIyOmcArIvWk0hmD9
 nM8YYq0eeOXAopMyfLMrQCV/r/JJV/ylPLRLhT3HFKHqyBHTYtfIKFCOgjtabhR8Gx
 83C3FezWT2NSUGtQ1fQKxDcgaQnDIL9eTgHq/Rp3TBmVQusDfOsES5FZ/OPh8OPST0
 fnlHf/Er4NX5KHJzayv2m7OnvjNETUkLcdJ9Sut0/5rQUrvu7tPzq/L3Yf9yCrt5Zb
 uzaDu6s2oQotQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 83C1115C3F0A; Mon,  9 May 2022 17:05:23 -0400 (EDT)
Date: Mon, 9 May 2022 17:05:23 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnmCE2iwa0MSqocr@mit.edu>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I tried DEPT-v6 applied against 5.18-rc5, and it reported the
following positive.

The reason why it's nonsense is that in context A's [W] wait:

[ 1538.545054] [W] folio_wait_bit_common(pglocked:0):
[ 1538.545370] [<ffffffff81259944>] __filemap_get_folio+0x3e4/0x420
[ 1538.545763] stacktrace:
[ 1538.545928]       folio_wait_bit_common+0x2fa/0x460
[ 1538.546248]       __filemap_get_folio+0x3e4/0x420
[ 1538.546558]       pagecache_get_page+0x11/0x40
[ 1538.546852]       ext4_mb_init_group+0x80/0x2e0
[ 1538.547152]       ext4_mb_good_group_nolock+0x2a3/0x2d0

... we're reading the block allocation bitmap into the page cache.
This does not correspond to a real inode, and so we don't actually
take ei->i_data_sem in this on the psuedo-inode used.

In contast, context's B's [W] and [E]'s stack traces, the
folio_wait_bit is clearly associated with page which is mapped to a
real inode:

[ 1538.553656] [W] down_write(&ei->i_data_sem:0):
[ 1538.553948] [<ffffffff8141c01b>] ext4_map_blocks+0x17b/0x680
[ 1538.554320] stacktrace:
[ 1538.554485]       ext4_map_blocks+0x17b/0x680
[ 1538.554772]       mpage_map_and_submit_extent+0xef/0x530
[ 1538.555122]       ext4_writepages+0x798/0x990
[ 1538.555409]       do_writepages+0xcf/0x1c0
[ 1538.555682]       __writeback_single_inode+0x58/0x3f0
[ 1538.556014]       writeback_sb_inodes+0x210/0x540
  		     ...

[ 1538.558621] [E] folio_wake_bit(pglocked:0):
[ 1538.558896] [<ffffffff814418c0>] ext4_bio_write_page+0x400/0x560
[ 1538.559290] stacktrace:
[ 1538.559455]       ext4_bio_write_page+0x400/0x560
[ 1538.559765]       mpage_submit_page+0x5c/0x80
[ 1538.560051]       mpage_map_and_submit_buffers+0x15a/0x250
[ 1538.560409]       mpage_map_and_submit_extent+0x134/0x530
[ 1538.560764]       ext4_writepages+0x798/0x990
[ 1538.561057]       do_writepages+0xcf/0x1c0
[ 1538.561329]       __writeback_single_inode+0x58/0x3f0
		...


In any case, this will ***never*** deadlock, and it's due to DEPT
fundamentally not understanding that waiting on different pages may be
due to inodes that come from completely different inodes, and so there
is zero possible chance this would never deadlock.

I suspect there will be similar false positives for tests (or
userspace) that uses copy_file_range(2) or send_file(2) system calls.

I've included the full DEPT log report below.

						- Ted

generic/011		[20:11:16][ 1533.411773] run fstests generic/011 at 2022-05-07 20:11:16
[ 1533.509603] DEPT_INFO_ONCE: Need to expand the ring buffer.
[ 1536.910044] DEPT_INFO_ONCE: Pool(wait) is empty.
[ 1538.533315] ===================================================
[ 1538.533793] DEPT: Circular dependency has been detected.
[ 1538.534199] 5.18.0-rc5-xfstests-dept-00021-g8d3d751c9964 #571 Not tainted
[ 1538.534645] ---------------------------------------------------
[ 1538.535035] summary
[ 1538.535177] ---------------------------------------------------
[ 1538.535567] *** DEADLOCK ***
[ 1538.535567] 
[ 1538.535854] context A
[ 1538.536008]     [S] down_write(&ei->i_data_sem:0)
[ 1538.536323]     [W] folio_wait_bit_common(pglocked:0)
[ 1538.536655]     [E] up_write(&ei->i_data_sem:0)
[ 1538.536958] 
[ 1538.537063] context B
[ 1538.537216]     [S] (unknown)(pglocked:0)
[ 1538.537480]     [W] down_write(&ei->i_data_sem:0)
[ 1538.537789]     [E] folio_wake_bit(pglocked:0)
[ 1538.538082] 
[ 1538.538184] [S]: start of the event context
[ 1538.538460] [W]: the wait blocked
[ 1538.538680] [E]: the event not reachable
[ 1538.538939] ---------------------------------------------------
[ 1538.539327] context A's detail
[ 1538.539530] ---------------------------------------------------
[ 1538.539918] context A
[ 1538.540072]     [S] down_write(&ei->i_data_sem:0)
[ 1538.540382]     [W] folio_wait_bit_common(pglocked:0)
[ 1538.540712]     [E] up_write(&ei->i_data_sem:0)
[ 1538.541015] 
[ 1538.541119] [S] down_write(&ei->i_data_sem:0):
[ 1538.541410] [<ffffffff8141c01b>] ext4_map_blocks+0x17b/0x680
[ 1538.541782] stacktrace:
[ 1538.541946]       ext4_map_blocks+0x17b/0x680
[ 1538.542234]       ext4_getblk+0x5f/0x1f0
[ 1538.542493]       ext4_bread+0xc/0x70
[ 1538.542736]       ext4_append+0x48/0xf0
[ 1538.542991]       ext4_init_new_dir+0xc8/0x160
[ 1538.543284]       ext4_mkdir+0x19a/0x320
[ 1538.543542]       vfs_mkdir+0x83/0xe0
[ 1538.543788]       do_mkdirat+0x8c/0x130
[ 1538.544042]       __x64_sys_mkdir+0x29/0x30
[ 1538.544319]       do_syscall_64+0x40/0x90
[ 1538.544584]       entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 1538.544949] 
[ 1538.545054] [W] folio_wait_bit_common(pglocked:0):
[ 1538.545370] [<ffffffff81259944>] __filemap_get_folio+0x3e4/0x420
[ 1538.545763] stacktrace:
[ 1538.545928]       folio_wait_bit_common+0x2fa/0x460
[ 1538.546248]       __filemap_get_folio+0x3e4/0x420
[ 1538.546558]       pagecache_get_page+0x11/0x40
[ 1538.546852]       ext4_mb_init_group+0x80/0x2e0
[ 1538.547152]       ext4_mb_good_group_nolock+0x2a3/0x2d0
[ 1538.547496]       ext4_mb_regular_allocator+0x391/0x780
[ 1538.547840]       ext4_mb_new_blocks+0x44e/0x720
[ 1538.548145]       ext4_ext_map_blocks+0x7f1/0xd00
[ 1538.548455]       ext4_map_blocks+0x19e/0x680
[ 1538.548743]       ext4_getblk+0x5f/0x1f0
[ 1538.549006]       ext4_bread+0xc/0x70
[ 1538.549250]       ext4_append+0x48/0xf0
[ 1538.549505]       ext4_init_new_dir+0xc8/0x160
[ 1538.549798]       ext4_mkdir+0x19a/0x320
[ 1538.550058]       vfs_mkdir+0x83/0xe0
[ 1538.550302]       do_mkdirat+0x8c/0x130
[ 1538.550557] 
[ 1538.550660] [E] up_write(&ei->i_data_sem:0):
[ 1538.550940] (N/A)
[ 1538.551071] ---------------------------------------------------
[ 1538.551459] context B's detail
[ 1538.551662] ---------------------------------------------------
[ 1538.552047] context B
[ 1538.552202]     [S] (unknown)(pglocked:0)
[ 1538.552466]     [W] down_write(&ei->i_data_sem:0)
[ 1538.552775]     [E] folio_wake_bit(pglocked:0)
[ 1538.553071] 
[ 1538.553174] [S] (unknown)(pglocked:0):
[ 1538.553422] (N/A)
[ 1538.553553] 
[ 1538.553656] [W] down_write(&ei->i_data_sem:0):
[ 1538.553948] [<ffffffff8141c01b>] ext4_map_blocks+0x17b/0x680
[ 1538.554320] stacktrace:
[ 1538.554485]       ext4_map_blocks+0x17b/0x680
[ 1538.554772]       mpage_map_and_submit_extent+0xef/0x530
[ 1538.555122]       ext4_writepages+0x798/0x990
[ 1538.555409]       do_writepages+0xcf/0x1c0
[ 1538.555682]       __writeback_single_inode+0x58/0x3f0
[ 1538.556014]       writeback_sb_inodes+0x210/0x540
[ 1538.556324]       __writeback_inodes_wb+0x4c/0xe0
[ 1538.556635]       wb_writeback+0x298/0x450
[ 1538.556911]       wb_do_writeback+0x29e/0x320
[ 1538.557199]       wb_workfn+0x6a/0x2c0
[ 1538.557447]       process_one_work+0x302/0x650
[ 1538.557743]       worker_thread+0x55/0x400
[ 1538.558013]       kthread+0xf0/0x120
[ 1538.558251]       ret_from_fork+0x1f/0x30
[ 1538.558518] 
[ 1538.558621] [E] folio_wake_bit(pglocked:0):
[ 1538.558896] [<ffffffff814418c0>] ext4_bio_write_page+0x400/0x560
[ 1538.559290] stacktrace:
[ 1538.559455]       ext4_bio_write_page+0x400/0x560
[ 1538.559765]       mpage_submit_page+0x5c/0x80
[ 1538.560051]       mpage_map_and_submit_buffers+0x15a/0x250
[ 1538.560409]       mpage_map_and_submit_extent+0x134/0x530
[ 1538.560764]       ext4_writepages+0x798/0x990
[ 1538.561057]       do_writepages+0xcf/0x1c0
[ 1538.561329]       __writeback_single_inode+0x58/0x3f0
[ 1538.561662]       writeback_sb_inodes+0x210/0x540
[ 1538.561973]       __writeback_inodes_wb+0x4c/0xe0
[ 1538.562283]       wb_writeback+0x298/0x450
[ 1538.562555]       wb_do_writeback+0x29e/0x320
[ 1538.562842]       wb_workfn+0x6a/0x2c0
[ 1538.563095]       process_one_work+0x302/0x650
[ 1538.563387]       worker_thread+0x55/0x400
[ 1538.563658]       kthread+0xf0/0x120
[ 1538.563895]       ret_from_fork+0x1f/0x30
[ 1538.564161] ---------------------------------------------------
[ 1538.564548] information that might be helpful
[ 1538.564832] ---------------------------------------------------
[ 1538.565223] CPU: 1 PID: 46539 Comm: dirstress Not tainted 5.18.0-rc5-xfstests-dept-00021-g8d3d751c9964 #571
[ 1538.565854] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
[ 1538.566394] Call Trace:
[ 1538.566559]  <TASK>
[ 1538.566701]  dump_stack_lvl+0x4f/0x68
[ 1538.566945]  print_circle.cold+0x15b/0x169
[ 1538.567218]  ? print_circle+0xe0/0xe0
[ 1538.567461]  cb_check_dl+0x55/0x60
[ 1538.567687]  bfs+0xd5/0x1b0
[ 1538.567874]  add_dep+0xd3/0x1a0
[ 1538.568083]  ? __filemap_get_folio+0x3e4/0x420
[ 1538.568374]  add_wait+0xe3/0x250
[ 1538.568590]  ? __filemap_get_folio+0x3e4/0x420
[ 1538.568886]  dept_wait_split_map+0xb1/0x130
[ 1538.569163]  folio_wait_bit_common+0x2fa/0x460
[ 1538.569456]  ? lock_is_held_type+0xfc/0x130
[ 1538.569733]  __filemap_get_folio+0x3e4/0x420
[ 1538.570013]  ? __lock_release+0x1b2/0x2c0
[ 1538.570278]  pagecache_get_page+0x11/0x40
[ 1538.570543]  ext4_mb_init_group+0x80/0x2e0
[ 1538.570813]  ? ext4_get_group_desc+0xb2/0x200
[ 1538.571102]  ext4_mb_good_group_nolock+0x2a3/0x2d0
[ 1538.571418]  ext4_mb_regular_allocator+0x391/0x780
[ 1538.571733]  ? rcu_read_lock_sched_held+0x3f/0x70
[ 1538.572044]  ? trace_kmem_cache_alloc+0x2c/0xd0
[ 1538.572343]  ? kmem_cache_alloc+0x1f7/0x3f0
[ 1538.572618]  ext4_mb_new_blocks+0x44e/0x720
[ 1538.572896]  ext4_ext_map_blocks+0x7f1/0xd00
[ 1538.573179]  ? find_held_lock+0x2b/0x80
[ 1538.573434]  ext4_map_blocks+0x19e/0x680
[ 1538.573693]  ext4_getblk+0x5f/0x1f0
[ 1538.573927]  ext4_bread+0xc/0x70
[ 1538.574141]  ext4_append+0x48/0xf0
[ 1538.574369]  ext4_init_new_dir+0xc8/0x160
[ 1538.574634]  ext4_mkdir+0x19a/0x320
[ 1538.574866]  vfs_mkdir+0x83/0xe0
[ 1538.575082]  do_mkdirat+0x8c/0x130
[ 1538.575308]  __x64_sys_mkdir+0x29/0x30
[ 1538.575557]  do_syscall_64+0x40/0x90
[ 1538.575795]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 1538.576128] RIP: 0033:0x7f0960466b07
[ 1538.576367] Code: 1f 40 00 48 8b 05 89 f3 0c 00 64 c7 00 5f 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 f3 0c 00 f7 d8 64 89 01 48
[ 1538.577576] RSP: 002b:00007ffd0fa955a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
[ 1538.578069] RAX: ffffffffffffffda RBX: 0000000000000239 RCX: 00007f0960466b07
[ 1538.578533] RDX: 0000000000000000 RSI: 00000000000001ff RDI: 00007ffd0fa955d0
[ 1538.578995] RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000010
[ 1538.579458] R10: 00007ffd0fa95345 R11: 0000000000000246 R12: 00000000000003e8
[ 1538.579923] R13: 0000000000000000 R14: 00007ffd0fa955d0 R15: 00007ffd0fa95dd0
[ 1538.580389]  </TASK>
[ 1540.581382] EXT4-fs (vdb): mounted filesystem with ordered data mode. Quota mode: none.
 [20:11:24] 8s


P.S.  Later on the console, the test ground to the halt because DEPT
started WARNING over and over and over again....

[ 3129.686102] DEPT_WARN_ON: dt->ecxt_held_pos == DEPT_MAX_ECXT_HELD
[ 3129.686396]  ? __might_fault+0x32/0x80
[ 3129.686660] WARNING: CPU: 1 PID: 107320 at kernel/dependency/dept.c:1537 add_ecxt+0x1c0/0x1d0
[ 3129.687040]  ? __might_fault+0x32/0x80
[ 3129.687282] CPU: 1 PID: 107320 Comm: aio-stress Tainted: G        W         5.18.0-rc5-xfstests-dept-00021-g8d3d751c9964 #571

with multiple CPU's completely spamming the serial console.  This
should probably be a WARN_ON_ONCE, or some thing that disables DEPT
entirely, since apparently won't be any useful DEPT reports (or any
useful kernel work, for that matteR) is going to be happening after
this.

