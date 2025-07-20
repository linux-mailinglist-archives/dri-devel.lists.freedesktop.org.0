Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB93B0B978
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 02:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1B810E468;
	Mon, 21 Jul 2025 00:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="fFn5A48N";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="KOgLm4Ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Mon, 21 Jul 2025 00:06:10 UTC
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A510E468
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 00:06:10 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id B006DEC021A;
 Sun, 20 Jul 2025 19:58:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sun, 20 Jul 2025 19:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1753055913; x=1753142313; bh=7V2wx+YWwXcAaQ9XATs+t
 m1Ay3IgA1F7IrlyT3MOxQI=; b=fFn5A48NsvQN86HCVIdvTvJPOvrQa4fMMbAlz
 LWup+/oT5lnLdhETA8vsQk51UHRf1M3ZRuGg/wsmJ88PefB8emdRMWOR/Jo18lW7
 X0z9OiVzRU33/o2VSm75jbT7W7giNqnk9uoUCtLDp3FUpkBtZXf23XN0Wi3jLhiI
 PxMZO6sTrgQeuE4qn+3ZTAl5+MiimrzruUSHaQOWFgPfEyiN+6m+X2Dm/rRiMehb
 tDDesLiBvC8OtSBjM2txaZKs4fIYz6wKfTPgiEz4qDieDrfUOmVitkmptDPC5bLk
 HR57t0eKuRuRThln2n/nGkXjP0pC40mfsg/H+GXvc2TBCRdKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1753055913; x=1753142313; bh=7V2wx+YWwXcAaQ9XATs+tm1Ay3IgA1F7Irl
 yT3MOxQI=; b=KOgLm4HoxObRBr0YtkYnenBZ1/Ic22YyzJLAMUNyDVM/6SVlSdD
 U1bbkHPeJS0yRxwvMUjbxK2rSWUyzj2nI1ECWavi2wCgWsG0P/edYv7uOedngQP8
 s6DdbkTjxwXMcDdOTFTRu6/d2fFnzmuoTaIQ6LK5t3B4TDd0SHYpWBEBPTA3qljQ
 a0fTdGZeM5kFuNo8JFlNaUuVjmC4/+qpik/l3aVcdBttCTEjtoEkE5V743VshBBJ
 3P8dmi8QBggjUEi9wupBc7t8Wdo0w9ZxE5m6J2zRmT3NWDq9jCvOhwT5MmOB9Vm7
 LC0bKf3RsJnUUHTLzbJp5zSWleQXjMueWRA==
X-ME-Sender: <xms:qIJ9aNXWZGEk5bqQMizqPxdiLSNDp3In_gDZxjcsASj6udKjqYaBng>
 <xme:qIJ9aH_rg1p4aVH4DUhcU42S3T7rUWhNE57_8Ubg9eN4OGwCjgoHMad65A33gGtnO
 jICOaHOMOuA0nL7Jw8>
X-ME-Received: <xmr:qIJ9aPj-mfciWJmOMeigiBg86gzIAIp9CcXBMTIZBKkveIbX4BBJmfQ87G_JrLC_KeGQA7s-t7ljN0ZEXNwyvcVCuVvRUksnc-8VSrybVtGN4y_L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomheplfgrmhgvshcuhfhlohifvghrshcuoegsohhlugdriihonhgvvdefjeef
 sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfevgfekiedutdduhf
 eggfeivdeuhfehtdffjedttdefkeeifeeijeevtefhgeehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsgholhgurdiiohhnvgdvfeejfeesfh
 grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphho
 uhhtpdhrtghpthhtohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtghomhdprh
 gtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhhrghsthgr
 sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtkhhovghnihhgrdhlvghitghhthiiuh
 hmvghrkhgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghn
 khhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprg
 hrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhu
 shgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpth
 htohepshhimhhonhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:qIJ9aLeDq__VJhx-bxPnwwprgVLVI9YAjgVCMPole191QfKxoDL9gw>
 <xmx:qIJ9aAKEPKe0tKiQOBnXMa0ATfSaZQGmm9odrFeqVM8R2WmAp99abQ>
 <xmx:qIJ9aAl04DT2X2VEVY_m-W6GpgqKy6Ozh5xmOHpDWy8L0PvHFhvDEQ>
 <xmx:qIJ9aAfuAFNkxNb4RJjDPYUeFb-C9UDy4VBueGcVxflxVSSgwJEedw>
 <xmx:qYJ9aLvaJegywwX3q5vzSim83O2DyelfteIOpJDsuAbf2fw6CPZUn2Gc>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 19:58:30 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: matthew.brost@intel.com, dakr@kernel.org, phasta@kernel.org,
 ckoenig.leichtzumerken@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/sched: Prevent stopped entities from being added to the
 run queue.
Date: Sun, 20 Jul 2025 16:56:06 -0700
Message-ID: <20250720235748.2798-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fixes an issue where entities are added to the run queue in
drm_sched_rq_update_fifo_locked after being killed, causing a
slab-use-after-free error.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
This issue was detected by syzkaller running on a Steam Deck OLED.
Unfortunately I don't have a reproducer for it. I've
included the KASAN reports below:

==================================================================
BUG: KASAN: slab-use-after-free in rb_next+0xda/0x160 lib/rbtree.c:505
Read of size 8 at addr ffff8881805085e0 by task kworker/u32:12/192
CPU: 3 UID: 0 PID: 192 Comm: kworker/u32:12 Not tainted 6.14.0-flowejam-+ #1
Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
 print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:408
 print_report+0xfc/0x1ff mm/kasan/report.c:521
 kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
 rb_next+0xda/0x160 lib/rbtree.c:505
 drm_sched_rq_select_entity_fifo drivers/gpu/drm/scheduler/sched_main.c:332 [inline] [gpu_sched]
 drm_sched_select_entity+0x497/0x720 drivers/gpu/drm/scheduler/sched_main.c:1081 [gpu_sched]
 drm_sched_run_job_work+0x2e/0x710 drivers/gpu/drm/scheduler/sched_main.c:1206 [gpu_sched]
 process_one_work+0x9c0/0x17e0 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x734/0x1060 kernel/workqueue.c:3400
 kthread+0x3fd/0x810 kernel/kthread.c:464
 ret_from_fork+0x53/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Allocated by task 73472:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
 kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
 amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1402 [amdgpu]
 drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
 drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
 drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
 drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
 chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
 do_dentry_open+0x743/0x1bf0 fs/open.c:956
 vfs_open+0x87/0x3f0 fs/open.c:1086
 do_open+0x72f/0xf80 fs/namei.c:3830
 path_openat+0x2ec/0x770 fs/namei.c:3989
 do_filp_open+0x1ff/0x420 fs/namei.c:4016
 do_sys_openat2+0x181/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x149/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
Freed by task 73472:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x14f/0x4d0 mm/slub.c:4757
 amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1538 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 get_signal+0x1be/0x19d0 kernel/signal.c:2809
 arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
The buggy address belongs to the object at ffff888180508000
The buggy address is located 1504 bytes inside of
The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x180508
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
page_type: f5(slab)
raw: 0017ffffc0000040 ffff888100043180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0017ffffc0000040 ffff888100043180 dead000000000100 dead000000000122
head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0017ffffc0000003 ffffea0006014201 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
Memory state around the buggy address:
 ffff888180508480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888180508500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888180508580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff888180508600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888180508680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in rb_set_parent_color include/linux/rbtree_augmented.h:191 [inline]
BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/linux/rbtree_augmented.h:312 [inline]
BUG: KASAN: slab-use-after-free in rb_erase+0x157c/0x1b10 lib/rbtree.c:443
Write of size 8 at addr ffff88816414c5d0 by task syz.2.3004/12376
CPU: 7 UID: 65534 PID: 12376 Comm: syz.2.3004 Not tainted 6.14.0-flowejam-+ #1
Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
 print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:408
 print_report+0xfc/0x1ff mm/kasan/report.c:521
 kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
 rb_set_parent_color include/linux/rbtree_augmented.h:191 [inline]
 __rb_erase_augmented include/linux/rbtree_augmented.h:312 [inline]
 rb_erase+0x157c/0x1b10 lib/rbtree.c:443
 rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sched]
 drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sched_main.c:154 [inline] [gpu_sched]
 drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/scheduler/sched_main.c:243 [gpu_sched]
 drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/scheduler/sched_entity.c:237 [gpu_sched]
 drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.c:232 [inline] [gpu_sched]
 drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sched_entity.c:331 [gpu_sched]
 amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:529 [inline] [amdgpu]
 amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2752 [amdgpu]
 amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1526 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x841/0xf60 kernel/exit.c:938
 do_group_exit+0xda/0x2b0 kernel/exit.c:1087
 get_signal+0x171f/0x19d0 kernel/signal.c:3036
 arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f2d90da36ed
Code: Unable to access opcode bytes at 0x7f2d90da36c3.
RSP: 002b:00007f2d91b710d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: 0000000000000000 RBX: 00007f2d90fe6088 RCX: 00007f2d90da36ed
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f2d90fe6088
RBP: 00007f2d90fe6080 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2d90fe608c
R13: 0000000000000000 R14: 0000000000000002 R15: 00007ffc34a67bd0
 </TASK>
Allocated by task 12381:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
 kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
 amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1402 [amdgpu]
 drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
 drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
 drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
 drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
 chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
 do_dentry_open+0x743/0x1bf0 fs/open.c:956
 vfs_open+0x87/0x3f0 fs/open.c:1086
 do_open+0x72f/0xf80 fs/namei.c:3830
 path_openat+0x2ec/0x770 fs/namei.c:3989
 do_filp_open+0x1ff/0x420 fs/namei.c:4016
 do_sys_openat2+0x181/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x149/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
Freed by task 12381:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x14f/0x4d0 mm/slub.c:4757
 amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1538 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 get_signal+0x1be/0x19d0 kernel/signal.c:2809
 arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
The buggy address belongs to the object at ffff88816414c000
The buggy address is located 1488 bytes inside of
The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x164148
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
page_type: f5(slab)
raw: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 0000000000000000
head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0017ffffc0000003 ffffea0005905201 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
Memory state around the buggy address:
 ffff88816414c480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88816414c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88816414c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88816414c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88816414c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/linux/rbtree_augmented.h:259 [inline]
BUG: KASAN: slab-use-after-free in rb_erase+0xf5d/0x1b10 lib/rbtree.c:443
Read of size 8 at addr ffff88812ebcc5e0 by task syz.1.814/6553
CPU: 0 UID: 65534 PID: 6553 Comm: syz.1.814 Not tainted 6.14.0-flowejam-+ #1
Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
 print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:408
 print_report+0xfc/0x1ff mm/kasan/report.c:521
 kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
 __rb_erase_augmented include/linux/rbtree_augmented.h:259 [inline]
 rb_erase+0xf5d/0x1b10 lib/rbtree.c:443
 rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sched]
 drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sched_main.c:154 [inline] [gpu_sched]
 drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/scheduler/sched_main.c:243 [gpu_sched]
 drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/scheduler/sched_entity.c:237 [gpu_sched]
 drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.c:232 [inline] [gpu_sched]
 drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sched_entity.c:331 [gpu_sched]
 amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:529 [inline] [amdgpu]
 amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2752 [amdgpu]
 amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1526 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7fd23eba36ed
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc2943a358 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007ffc2943a428 RCX: 00007fd23eba36ed
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fd23ede7ba0 R08: 0000000000000001 R09: 0000000c00000000
R10: 00007fd23ea00000 R11: 0000000000000246 R12: 00007fd23ede5fac
R13: 00007fd23ede5fa0 R14: 0000000000059ad1 R15: 0000000000059a8e
 </TASK>
Allocated by task 6559:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
 kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
 amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1402 [amdgpu]
 drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
 drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
 drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
 drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
 chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
 do_dentry_open+0x743/0x1bf0 fs/open.c:956
 vfs_open+0x87/0x3f0 fs/open.c:1086
 do_open+0x72f/0xf80 fs/namei.c:3830
 path_openat+0x2ec/0x770 fs/namei.c:3989
 do_filp_open+0x1ff/0x420 fs/namei.c:4016
 do_sys_openat2+0x181/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x149/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
Freed by task 6559:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x14f/0x4d0 mm/slub.c:4757
 amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1538 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 get_signal+0x1be/0x19d0 kernel/signal.c:2809
 arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
The buggy address belongs to the object at ffff88812ebcc000
The buggy address is located 1504 bytes inside of
The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12ebc8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
page_type: f5(slab)
raw: 0017ffffc0000040 ffff888100058780 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0017ffffc0000040 ffff888100058780 dead000000000122 0000000000000000
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0017ffffc0000003 ffffea0004baf201 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
Memory state around the buggy address:
 ffff88812ebcc480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88812ebcc500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88812ebcc580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff88812ebcc600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88812ebcc680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
==================================================================
BUG: KASAN: slab-use-after-free in drm_sched_entity_compare_before drivers/gpu/drm/scheduler/sched_main.c:147 [inline] [gpu_sched]
BUG: KASAN: slab-use-after-free in rb_add_cached include/linux/rbtree.h:174 [inline] [gpu_sched]
BUG: KASAN: slab-use-after-free in drm_sched_rq_update_fifo_locked+0x47b/0x540 drivers/gpu/drm/scheduler/sched_main.c:175 [gpu_sched]
Read of size 8 at addr ffff8881208445c8 by task syz.1.49115/146644
CPU: 7 UID: 65534 PID: 146644 Comm: syz.1.49115 Not tainted 6.14.0-flowejam-+ #1
Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
 print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:408
 print_report+0xfc/0x1ff mm/kasan/report.c:521
 kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
 drm_sched_entity_compare_before drivers/gpu/drm/scheduler/sched_main.c:147 [inline] [gpu_sched]
 rb_add_cached include/linux/rbtree.h:174 [inline] [gpu_sched]
 drm_sched_rq_update_fifo_locked+0x47b/0x540 drivers/gpu/drm/scheduler/sched_main.c:175 [gpu_sched]
 drm_sched_entity_push_job+0x509/0x5d0 drivers/gpu/drm/scheduler/sched_entity.c:623 [gpu_sched]
 amdgpu_job_submit+0x1a4/0x270 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:314 [amdgpu]
 amdgpu_vm_sdma_commit+0x1f9/0x7d0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:122 [amdgpu]
 amdgpu_vm_pt_clear+0x540/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:422 [amdgpu]
 amdgpu_vm_init+0x9c2/0x12f0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2609 [amdgpu]
 amdgpu_driver_open_kms+0x274/0x660 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1418 [amdgpu]
 drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
 drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
 drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
 drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
 chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
 do_dentry_open+0x743/0x1bf0 fs/open.c:956
 vfs_open+0x87/0x3f0 fs/open.c:1086
 do_open+0x72f/0xf80 fs/namei.c:3830
 path_openat+0x2ec/0x770 fs/namei.c:3989
 do_filp_open+0x1ff/0x420 fs/namei.c:4016
 do_sys_openat2+0x181/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x149/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7feb303a36ed
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007feb3123c018 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007feb305e5fa0 RCX: 00007feb303a36ed
RDX: 0000000000000002 RSI: 0000200000000140 RDI: ffffffffffffff9c
RBP: 00007feb30447722 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007feb305e5fa0 R15: 00007ffcfd0a3460
 </TASK>
Allocated by task 146638:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
 kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
 amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1402 [amdgpu]
 drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
 drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
 drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
 drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
 chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
 do_dentry_open+0x743/0x1bf0 fs/open.c:956
 vfs_open+0x87/0x3f0 fs/open.c:1086
 do_open+0x72f/0xf80 fs/namei.c:3830
 path_openat+0x2ec/0x770 fs/namei.c:3989
 do_filp_open+0x1ff/0x420 fs/namei.c:4016
 do_sys_openat2+0x181/0x1e0 fs/open.c:1428
 do_sys_open fs/open.c:1443 [inline]
 __do_sys_openat fs/open.c:1459 [inline]
 __se_sys_openat fs/open.c:1454 [inline]
 __x64_sys_openat+0x149/0x210 fs/open.c:1454
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
Freed by task 146638:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x14f/0x4d0 mm/slub.c:4757
 amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1538 [amdgpu]
 drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
 drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
 drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
 drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
 __fput+0x402/0xb50 fs/file_table.c:464
 task_work_run+0x155/0x250 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:218
 do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
The buggy address belongs to the object at ffff888120844000
The buggy address is located 1480 bytes inside of
The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x120840
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
page_type: f5(slab)
raw: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead000000000002
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead000000000002
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0017ffffc0000003 ffffea0004821001 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
Memory state around the buggy address:
 ffff888120844480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888120844500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888120844580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff888120844600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888120844680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bfea608a7106..997a2cc1a635 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 
 	entity->oldest_job_waiting = ts;
 
-	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
-		      drm_sched_entity_compare_before);
+	if (!entity->stopped) {
+		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
+			      drm_sched_entity_compare_before);
+	}
 }
 
 /**
-- 
2.49.0

