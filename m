Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046ADB0E493
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 22:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF110E18F;
	Tue, 22 Jul 2025 20:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="X6lKGQjY";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="e6iNMk8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jul 2025 20:11:11 UTC
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616E10E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:11:11 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 7CB277A03D3;
 Tue, 22 Jul 2025 16:05:24 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-06.internal (MEProxy); Tue, 22 Jul 2025 16:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1753214724;
 x=1753301124; bh=jw9glWTfMVAKS2lFgHNFzUof2SUYMJsPSI2QW7tax3U=; b=
 X6lKGQjYPD7s3ihIeaYxO8ntYLQz/VT1Xl+62mDKmcbhE2xdPEdYZ9eXgnrNkcmA
 +jdko8I9PYxup47F61AjU/oSxV6nQ1w/RNfDh3UpsgPbTd7bGpy7q+XU9endsqVc
 QgJNz/FCls41aXpihWQZ5pjOzCbe1DGnKw5pZBSrw323r0B69+92eF/IZn82U8aA
 Z2iFm1DNVbkHa6UL2wNDnaqV0wjYcUgQCd/v0qbl3mdO9TmaL+Q1FxZcwFrWA7c+
 RhXYZwhMlGxzcPPkkcK3RwUMEvwo5tc/ZfAq5mQrGew7j0nZu+UVmlpOUhfErCdD
 KpPH5HnbpzRq90IPPpwYtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753214724; x=
 1753301124; bh=jw9glWTfMVAKS2lFgHNFzUof2SUYMJsPSI2QW7tax3U=; b=e
 6iNMk8WoKS5WBHIvqR7fpS26ZvLVDUobbAKhF4S281wCh1siKUVxu/D3NMBDnUV9
 1fo4whiZdgrD5CDdazG25n5TCyy0B/GTkyHmahEgO8kF1COdxPM0clhNLegg1yti
 S8x+5yHSDcKQ9GlkiJmCLsVrctQ2a0x+GYPIhCSnkdL7rJceTYCRGvGkzWIiHjFg
 qVJzr4/bxz70jipmuyxdicJx4hURHEz23/pOzyGq9QlWTsp5Yu8D7wX6paTG8gbR
 Lbta1KFB/K0nBARBIulN/ZS45ZVL2gXxd6H7V3CW5kStTMGbKwMyANSYGCaqyI3F
 uzI+NN+pB6f7P+AzpdxEg==
X-ME-Sender: <xms:A-9_aGswHSPr0obAeLrouEPF6eCo5hMoe_vOOEkwwUY-WuwHSrB3YA>
 <xme:A-9_aLfbh-G2m5c9wlGueoShOkAWxrN3XI2XozyjtbpxgAvqxBS30IiVho7ojpN3Y
 4j71ifielDWVREkneI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejheekvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomheplfgrmhgvshcu
 oegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepudduvdehgeeihfduffekudevgffhleelffdtjedutdetvedtudffgfeuvdeu
 vdehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhlugdriihonhgvvdefjeefsehfrghs
 thhmrghilhdrtghomhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuth
 dprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegtkhhovghnihhgrdhlvghitghhth
 iiuhhmvghrkhgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehtvhhrthhkohdruhhr
 shhulhhinhesihhgrghlihgrrdgtohhmpdhrtghpthhtohepmhgrthhthhgvfidrsghroh
 hsthesihhnthgvlhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
 pdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepph
 hhrghsthgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghn
 khhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:A-9_aChw8pSXGjwtJODJdCfNKuQ8HVf761yR51bM9mqv_adrCU54aA>
 <xmx:A-9_aO1QpP0suLycryZS5mCwsCGN5XX6fo5913-8VHXZ9YiSzqbDaA>
 <xmx:A-9_aAiHjtsRKWmuaoBPbvvfaVvHOblds2697ncCwWtTUQ6dPboOvA>
 <xmx:A-9_aH-zi4gSUDuOVhJB916fwZf037mHW-CJHdAzDVOP0NHwI_XYgw>
 <xmx:BO9_aOWKb4Aj7s9bvGHxFn0VI9PoH0q5sa4jK0OdajJnaICe72eotkj9>
Feedback-ID: ibd7e4881:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id E921E780070; Tue, 22 Jul 2025 16:05:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T77a992bd37273535
Date: Tue, 22 Jul 2025 13:05:02 -0700
From: James <bold.zone2373@fastmail.com>
To: phasta@kernel.org, matthew.brost@intel.com, dakr@kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, "Shuah Khan" <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Message-Id: <a6b4f8a2-7be1-4bc7-9700-fe7e52e21ea4@app.fastmail.com>
In-Reply-To: <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 21, 2025, at 1:16 AM, Philipp Stanner wrote:
> On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
>> +Cc Tvrtko, who's currently reworking FIFO and RR.
>>=20
>> On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
>> > Fixes an issue where entities are added to the run queue in
>> > drm_sched_rq_update_fifo_locked after being killed, causing a
>> > slab-use-after-free error.
>> >=20
>> > Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
>> > ---
>> > This issue was detected by syzkaller running on a Steam Deck OLED.
>> > Unfortunately I don't have a reproducer for it. I've
>>=20
>> Well, now that's kind of an issue =E2=80=93 if you don't have a repro=
ducer, how
>> can you know that your patch is correct? How can we?
>>=20
>> It would certainly be good to know what the fuzz testing framework
>> does.
>>=20
>> > included the KASAN reports below:
>>=20
>>=20
>> Anyways, KASAN reports look interesting. But those might be many
>> different issues. Again, would be good to know what the fuzzer has be=
en
>> testing. Can you maybe split this fuzz test into sub-tests? I suspsect
>> those might be different faults.
>>=20
>>=20
>> Anyways, taking a first look=E2=80=A6
>>=20
>>=20
>> >=20
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > BUG: KASAN: slab-use-after-free in rb_next+0xda/0x160 lib/rbtree.c:=
505
>> > Read of size 8 at addr ffff8881805085e0 by task kworker/u32:12/192
>> > CPU: 3 UID: 0 PID: 192 Comm: kworker/u32:12 Not tainted 6.14.0-flow=
ejam-+ #1
>> > Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> > Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
>> > Call Trace:
>> > =C2=A0<TASK>
>> > =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
>> > =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
>> > =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/rep=
ort.c:408
>> > =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
>> > =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
>> > =C2=A0rb_next+0xda/0x160 lib/rbtree.c:505
>> > =C2=A0drm_sched_rq_select_entity_fifo drivers/gpu/drm/scheduler/sch=
ed_main.c:332 [inline] [gpu_sched]
>> > =C2=A0drm_sched_select_entity+0x497/0x720 drivers/gpu/drm/scheduler=
/sched_main.c:1081 [gpu_sched]
>> > =C2=A0drm_sched_run_job_work+0x2e/0x710 drivers/gpu/drm/scheduler/s=
ched_main.c:1206 [gpu_sched]
>> > =C2=A0process_one_work+0x9c0/0x17e0 kernel/workqueue.c:3238
>> > =C2=A0process_scheduled_works kernel/workqueue.c:3319 [inline]
>> > =C2=A0worker_thread+0x734/0x1060 kernel/workqueue.c:3400
>> > =C2=A0kthread+0x3fd/0x810 kernel/kthread.c:464
>> > =C2=A0ret_from_fork+0x53/0x80 arch/x86/kernel/process.c:148
>> > =C2=A0ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>> > =C2=A0</TASK>
>> > Allocated by task 73472:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>> > =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
>> > =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
>> > =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
>> > =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:1402 [amdgpu]
>> > =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
>> > =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
>> > =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
>> > =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
>> > =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
>> > =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
>> > =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
>> > =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
>> > =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
>> > =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
>> > =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
>> > =C2=A0do_sys_open fs/open.c:1443 [inline]
>> > =C2=A0__do_sys_openat fs/open.c:1459 [inline]
>> > =C2=A0__se_sys_openat fs/open.c:1454 [inline]
>> > =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
>> > =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> > =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > Freed by task 73472:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
>> > =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
>> > =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
>> > =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
>> > =C2=A0slab_free_hook mm/slub.c:2353 [inline]
>> > =C2=A0slab_free mm/slub.c:4609 [inline]
>> > =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
>> > =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1538 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
>> > =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c=
:337
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > The buggy address belongs to the object at ffff888180508000
>> > The buggy address is located 1504 bytes inside of
>> > The buggy address belongs to the physical page:
>> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:=
0x180508
>> > head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincou=
nt:0
>> > flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1ffff=
f)
>> > page_type: f5(slab)
>> > raw: 0017ffffc0000040 ffff888100043180 dead000000000100 dead0000000=
00122
>> > raw: 0000000000000000 0000000080020002 00000000f5000000 00000000000=
00000
>> > head: 0017ffffc0000040 ffff888100043180 dead000000000100 dead000000=
000122
>> > head: 0000000000000000 0000000080020002 00000000f5000000 0000000000=
000000
>> > head: 0017ffffc0000003 ffffea0006014201 ffffffffffffffff 0000000000=
000000
>> > head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000=
000000
>> > page dumped because: kasan: bad access detected
>> > Memory state around the buggy address:
>> > =C2=A0ffff888180508480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff888180508500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > > ffff888180508580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>> > =C2=A0ffff888180508600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff888180508680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > BUG: KASAN: slab-use-after-free in rb_set_parent_color include/linu=
x/rbtree_augmented.h:191 [inline]
>> > BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/lin=
ux/rbtree_augmented.h:312 [inline]
>> > BUG: KASAN: slab-use-after-free in rb_erase+0x157c/0x1b10 lib/rbtre=
e.c:443
>> > Write of size 8 at addr ffff88816414c5d0 by task syz.2.3004/12376
>> > CPU: 7 UID: 65534 PID: 12376 Comm: syz.2.3004 Not tainted 6.14.0-fl=
owejam-+ #1
>> > Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> > Call Trace:
>> > =C2=A0<TASK>
>> > =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
>> > =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
>> > =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/rep=
ort.c:408
>> > =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
>> > =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
>> > =C2=A0rb_set_parent_color include/linux/rbtree_augmented.h:191 [inl=
ine]
>> > =C2=A0__rb_erase_augmented include/linux/rbtree_augmented.h:312 [in=
line]
>> > =C2=A0rb_erase+0x157c/0x1b10 lib/rbtree.c:443
>> > =C2=A0rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sche=
d]
>> > =C2=A0drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sch=
ed_main.c:154 [inline] [gpu_sched]
>> > =C2=A0drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/schedu=
ler/sched_main.c:243 [gpu_sched]
>> > =C2=A0drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/sched=
uler/sched_entity.c:237 [gpu_sched]
>> > =C2=A0drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.=
c:232 [inline] [gpu_sched]
>> > =C2=A0drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sc=
hed_entity.c:331 [gpu_sched]
>> > =C2=A0amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.=
c:529 [inline] [amdgpu]
>> > =C2=A0amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu=
_vm.c:2752 [amdgpu]
>> > =C2=A0amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1526 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0exit_task_work include/linux/task_work.h:40 [inline]
>> > =C2=A0do_exit+0x841/0xf60 kernel/exit.c:938
>> > =C2=A0do_group_exit+0xda/0x2b0 kernel/exit.c:1087
>> > =C2=A0get_signal+0x171f/0x19d0 kernel/signal.c:3036
>> > =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c=
:337
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > RIP: 0033:0x7f2d90da36ed
>> > Code: Unable to access opcode bytes at 0x7f2d90da36c3.
>> > RSP: 002b:00007f2d91b710d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
0ca
>> > RAX: 0000000000000000 RBX: 00007f2d90fe6088 RCX: 00007f2d90da36ed
>> > RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f2d90fe6088
>> > RBP: 00007f2d90fe6080 R08: 0000000000000000 R09: 0000000000000000
>> > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2d90fe608c
>> > R13: 0000000000000000 R14: 0000000000000002 R15: 00007ffc34a67bd0
>> > =C2=A0</TASK>
>> > Allocated by task 12381:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>> > =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
>> > =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
>> > =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
>> > =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:1402 [amdgpu]
>> > =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
>> > =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
>> > =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
>> > =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
>> > =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
>> > =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
>> > =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
>> > =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
>> > =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
>> > =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
>> > =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
>> > =C2=A0do_sys_open fs/open.c:1443 [inline]
>> > =C2=A0__do_sys_openat fs/open.c:1459 [inline]
>> > =C2=A0__se_sys_openat fs/open.c:1454 [inline]
>> > =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
>> > =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> > =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > Freed by task 12381:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
>> > =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
>> > =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
>> > =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
>> > =C2=A0slab_free_hook mm/slub.c:2353 [inline]
>> > =C2=A0slab_free mm/slub.c:4609 [inline]
>> > =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
>> > =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1538 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
>> > =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c=
:337
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > The buggy address belongs to the object at ffff88816414c000
>> > The buggy address is located 1488 bytes inside of
>> > The buggy address belongs to the physical page:
>> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:=
0x164148
>> > head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincou=
nt:0
>> > flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1ffff=
f)
>> > page_type: f5(slab)
>> > raw: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 00000000000=
00000
>> > raw: 0000000000000000 0000000080020002 00000000f5000000 00000000000=
00000
>> > head: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 0000000000=
000000
>> > head: 0000000000000000 0000000080020002 00000000f5000000 0000000000=
000000
>> > head: 0017ffffc0000003 ffffea0005905201 ffffffffffffffff 0000000000=
000000
>> > head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000=
000000
>> > page dumped because: kasan: bad access detected
>> > Memory state around the buggy address:
>> > =C2=A0ffff88816414c480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff88816414c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > > ffff88816414c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^
>> > =C2=A0ffff88816414c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff88816414c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/lin=
ux/rbtree_augmented.h:259 [inline]
>> > BUG: KASAN: slab-use-after-free in rb_erase+0xf5d/0x1b10 lib/rbtree=
.c:443
>> > Read of size 8 at addr ffff88812ebcc5e0 by task syz.1.814/6553
>> > CPU: 0 UID: 65534 PID: 6553 Comm: syz.1.814 Not tainted 6.14.0-flow=
ejam-+ #1
>> > Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> > Call Trace:
>> > =C2=A0<TASK>
>> > =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
>> > =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
>> > =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/rep=
ort.c:408
>> > =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
>> > =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
>> > =C2=A0__rb_erase_augmented include/linux/rbtree_augmented.h:259 [in=
line]
>> > =C2=A0rb_erase+0xf5d/0x1b10 lib/rbtree.c:443
>> > =C2=A0rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sche=
d]
>> > =C2=A0drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sch=
ed_main.c:154 [inline] [gpu_sched]
>> > =C2=A0drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/schedu=
ler/sched_main.c:243 [gpu_sched]
>> > =C2=A0drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/sched=
uler/sched_entity.c:237 [gpu_sched]
>> > =C2=A0drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.=
c:232 [inline] [gpu_sched]
>> > =C2=A0drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sc=
hed_entity.c:331 [gpu_sched]
>> > =C2=A0amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.=
c:529 [inline] [amdgpu]
>> > =C2=A0amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu=
_vm.c:2752 [amdgpu]
>> > =C2=A0amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1526 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0resume_user_mode_work include/linux/resume_user_mode.h:50 [in=
line]
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > RIP: 0033:0x7fd23eba36ed
>> > Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 4=
8 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d=
 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
>> > RSP: 002b:00007ffc2943a358 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
1b4
>> > RAX: 0000000000000000 RBX: 00007ffc2943a428 RCX: 00007fd23eba36ed
>> > RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
>> > RBP: 00007fd23ede7ba0 R08: 0000000000000001 R09: 0000000c00000000
>> > R10: 00007fd23ea00000 R11: 0000000000000246 R12: 00007fd23ede5fac
>> > R13: 00007fd23ede5fa0 R14: 0000000000059ad1 R15: 0000000000059a8e
>> > =C2=A0</TASK>
>> > Allocated by task 6559:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>> > =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
>> > =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
>> > =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
>> > =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:1402 [amdgpu]
>> > =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
>> > =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
>> > =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
>> > =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
>> > =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
>> > =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
>> > =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
>> > =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
>> > =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
>> > =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
>> > =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
>> > =C2=A0do_sys_open fs/open.c:1443 [inline]
>> > =C2=A0__do_sys_openat fs/open.c:1459 [inline]
>> > =C2=A0__se_sys_openat fs/open.c:1454 [inline]
>> > =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
>> > =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> > =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > Freed by task 6559:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
>> > =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
>> > =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
>> > =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
>> > =C2=A0slab_free_hook mm/slub.c:2353 [inline]
>> > =C2=A0slab_free mm/slub.c:4609 [inline]
>> > =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
>> > =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1538 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
>> > =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c=
:337
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > The buggy address belongs to the object at ffff88812ebcc000
>> > The buggy address is located 1504 bytes inside of
>> > The buggy address belongs to the physical page:
>> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:=
0x12ebc8
>> > head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincou=
nt:0
>> > flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1ffff=
f)
>> > page_type: f5(slab)
>> > raw: 0017ffffc0000040 ffff888100058780 dead000000000122 00000000000=
00000
>> > raw: 0000000000000000 0000000000020002 00000000f5000000 00000000000=
00000
>> > head: 0017ffffc0000040 ffff888100058780 dead000000000122 0000000000=
000000
>> > head: 0000000000000000 0000000000020002 00000000f5000000 0000000000=
000000
>> > head: 0017ffffc0000003 ffffea0004baf201 ffffffffffffffff 0000000000=
000000
>> > head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000=
000000
>> > page dumped because: kasan: bad access detected
>> > Memory state around the buggy address:
>> > =C2=A0ffff88812ebcc480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff88812ebcc500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > > ffff88812ebcc580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>> > =C2=A0ffff88812ebcc600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff88812ebcc680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > BUG: KASAN: slab-use-after-free in drm_sched_entity_compare_before =
drivers/gpu/drm/scheduler/sched_main.c:147 [inline] [gpu_sched]
>> > BUG: KASAN: slab-use-after-free in rb_add_cached include/linux/rbtr=
ee.h:174 [inline] [gpu_sched]
>> > BUG: KASAN: slab-use-after-free in drm_sched_rq_update_fifo_locked+=
0x47b/0x540 drivers/gpu/drm/scheduler/sched_main.c:175 [gpu_sched]
>> > Read of size 8 at addr ffff8881208445c8 by task syz.1.49115/146644
>> > CPU: 7 UID: 65534 PID: 146644 Comm: syz.1.49115 Not tainted 6.14.0-=
flowejam-+ #1
>> > Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> > Call Trace:
>> > =C2=A0<TASK>
>> > =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
>> > =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
>> > =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/rep=
ort.c:408
>> > =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
>> > =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
>> > =C2=A0drm_sched_entity_compare_before drivers/gpu/drm/scheduler/sch=
ed_main.c:147 [inline] [gpu_sched]
>> > =C2=A0rb_add_cached include/linux/rbtree.h:174 [inline] [gpu_sched]
>> > =C2=A0drm_sched_rq_update_fifo_locked+0x47b/0x540 drivers/gpu/drm/s=
cheduler/sched_main.c:175 [gpu_sched]
>> > =C2=A0drm_sched_entity_push_job+0x509/0x5d0 drivers/gpu/drm/schedul=
er/sched_entity.c:623 [gpu_sched]
>>=20
>> This might be a race between entity killing and the push_job. Let's
>> look at your patch below=E2=80=A6
>>=20
>> > =C2=A0amdgpu_job_submit+0x1a4/0x270 drivers/gpu/drm/amd/amdgpu/amdg=
pu_job.c:314 [amdgpu]
>> > =C2=A0amdgpu_vm_sdma_commit+0x1f9/0x7d0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_vm_sdma.c:122 [amdgpu]
>> > =C2=A0amdgpu_vm_pt_clear+0x540/0x6b0 drivers/gpu/drm/amd/amdgpu/amd=
gpu_vm_pt.c:422 [amdgpu]
>> > =C2=A0amdgpu_vm_init+0x9c2/0x12f0 drivers/gpu/drm/amd/amdgpu/amdgpu=
_vm.c:2609 [amdgpu]
>> > =C2=A0amdgpu_driver_open_kms+0x274/0x660 drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:1418 [amdgpu]
>> > =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
>> > =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
>> > =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
>> > =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
>> > =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
>> > =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
>> > =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
>> > =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
>> > =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
>> > =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
>> > =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
>> > =C2=A0do_sys_open fs/open.c:1443 [inline]
>> > =C2=A0__do_sys_openat fs/open.c:1459 [inline]
>> > =C2=A0__se_sys_openat fs/open.c:1454 [inline]
>> > =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
>> > =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> > =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > RIP: 0033:0x7feb303a36ed
>> > Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 4=
8 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d=
 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
>> > RSP: 002b:00007feb3123c018 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
101
>> > RAX: ffffffffffffffda RBX: 00007feb305e5fa0 RCX: 00007feb303a36ed
>> > RDX: 0000000000000002 RSI: 0000200000000140 RDI: ffffffffffffff9c
>> > RBP: 00007feb30447722 R08: 0000000000000000 R09: 0000000000000000
>> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> > R13: 0000000000000001 R14: 00007feb305e5fa0 R15: 00007ffcfd0a3460
>> > =C2=A0</TASK>
>> > Allocated by task 146638:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>> > =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
>> > =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
>> > =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
>> > =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu=
/amdgpu_kms.c:1402 [amdgpu]
>> > =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
>> > =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
>> > =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
>> > =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
>> > =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
>> > =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
>> > =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
>> > =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
>> > =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
>> > =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
>> > =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
>> > =C2=A0do_sys_open fs/open.c:1443 [inline]
>> > =C2=A0__do_sys_openat fs/open.c:1459 [inline]
>> > =C2=A0__se_sys_openat fs/open.c:1454 [inline]
>> > =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
>> > =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> > =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > Freed by task 146638:
>> > =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
>> > =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> > =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
>> > =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
>> > =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
>> > =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
>> > =C2=A0slab_free_hook mm/slub.c:2353 [inline]
>> > =C2=A0slab_free mm/slub.c:4609 [inline]
>> > =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
>> > =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/a=
mdgpu/amdgpu_kms.c:1538 [amdgpu]
>> > =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:2=
55
>> > =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
>> > =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.=
c:278
>> > =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
>> > =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
>> > =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
>> > =C2=A0resume_user_mode_work include/linux/resume_user_mode.h:50 [in=
line]
>> > =C2=A0exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
>> > =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [i=
nline]
>> > =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [i=
nline]
>> > =C2=A0syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:2=
18
>> > =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
>> > =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > The buggy address belongs to the object at ffff888120844000
>> > The buggy address is located 1480 bytes inside of
>> > The buggy address belongs to the physical page:
>> > page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:=
0x120840
>> > head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincou=
nt:0
>> > flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1ffff=
f)
>> > page_type: f5(slab)
>> > raw: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead0000000=
00002
>> > raw: 0000000000000000 0000000000020002 00000000f5000000 00000000000=
00000
>> > head: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead000000=
000002
>> > head: 0000000000000000 0000000000020002 00000000f5000000 0000000000=
000000
>> > head: 0017ffffc0000003 ffffea0004821001 ffffffffffffffff 0000000000=
000000
>> > head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000=
000000
>> > page dumped because: kasan: bad access detected
>> > Memory state around the buggy address:
>> > =C2=A0ffff888120844480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff888120844500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > > ffff888120844580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>> > =C2=A0ffff888120844600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =C2=A0ffff888120844680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb f=
b fb
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 6 ++++--
>> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
>> > index bfea608a7106..997a2cc1a635 100644
>> > --- a/drivers/gpu/drm/scheduler/sched_main.c
>> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct dr=
m_sched_entity *entity,
>> > =C2=A0
>> > =C2=A0	entity->oldest_job_waiting =3D ts;
>> > =C2=A0
>> > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
>> > +	if (!entity->stopped) {
>> > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
>> > +	}
>>=20
>> If this is a race, then this patch here is broken, too, because you're
>> checking the 'stopped' boolean as the callers of that function do, too
>> =E2=80=93 just later. :O
>>=20
>> Could still race, just less likely.
>>=20
>> The proper way to fix it would then be to address the issue where the
>> locking is supposed to happen. Let's look at, for example,
>> drm_sched_entity_push_job():
>>=20
>>=20
>> void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>> {
>> 	(Bla bla bla)
>>=20
>> =C2=A0	=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6
>>=20
>> 	/* first job wakes up scheduler */
>> 	if (first) {
>> 		struct drm_gpu_scheduler *sched;
>> 		struct drm_sched_rq *rq;
>>=20
>> 		/* Add the entity to the run queue */
>> 		spin_lock(&entity->lock);
>> 		if (entity->stopped) {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <---- Aha!
>> 			spin_unlock(&entity->lock);
>>=20
>> 			DRM_ERROR("Trying to push to a killed entity\n");
>> 			return;
>> 		}
>>=20
>> 		rq =3D entity->rq;
>> 		sched =3D rq->sched;
>>=20
>> 		spin_lock(&rq->lock);
>> 		drm_sched_rq_add_entity(rq, entity);
>>=20
>> 		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>> 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
>>=20
>> 		spin_unlock(&rq->lock);
>> 		spin_unlock(&entity->lock);
>>=20
>> But the locks are still being hold. So that "shouldn't be happening"(=
tm).
>>=20
>> Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
>> stop entities. The former holds appropriate locks, but drm_sched_fini=
()
>> doesn't. So that looks like a hot candidate to me. Opinions?
>>=20
>> On the other hand, aren't drivers prohibited from calling
>> drm_sched_entity_push_job() after calling drm_sched_fini()? If the
>> fuzzer does that, then it's not the scheduler's fault.
>>=20
>> Could you test adding spin_lock(&entity->lock) to drm_sched_fini()?
>
> Ah no, forget about that.
>
> In drm_sched_fini(), you'd have to take the locks in reverse order as
> in drm_sched_entity_push/pop_job(), thereby replacing race with
> deadlock.
>
> I suspect that this is an issue in amdgpu. But let's wait for
> Christian.
>
>
> P.
>
>
>>=20
>> Would be cool if Tvrtko and Christian take a look. Maybe we even have=
 a
>> fundamental design issue.
>>=20
>>=20
>> Regards
>> P.
>>=20
>>=20
>> > =C2=A0}
>> > =C2=A0
>> > =C2=A0/**
>>

Thanks for taking a look at this. I did try to get a reproducer using sy=
zkaller, without success. I can attempt it myself but I expect it will t=
ake me some time, if I'm able to at all with this bug. I did run some of=
 the igt-gpu-tools tests (amdgpu and drm ones), and there was no differe=
nce after the changes on my system. After this change I wasn't running i=
nto the UAF errors after 100k+ executions but I see what you mean, Phili=
pp - perhaps it's missing the root issue.=20

FYI, as an experiment I forced the use of RR with "drm_sched_policy =3D =
DRM_SCHED_POLICY_RR", and I'm not seeing any slab-use-after-frees, so ma=
ybe the problem is with the FIFO implementation?=20

For now, the closest thing to a reproducer I can provide is my syzkaller=
 config, in case anyone else is able to try this with a Steam Deck OLED.=
 I've included this below along with an example program run by syzkaller=
 (in generated C code and a Syz language version).
---------------------------------------------------
{
	"target": "linux/amd64",
	"http": "127.0.0.1:56741",
	"sshkey" : "/path",
	"workdir": "/path",
	"kernel_obj": "/path",
	"kernel_src": "/path",
	"syzkaller": "/path",
	"sandbox": "setuid",
	"type": "isolated",
	"enable_syscalls": ["openat$drirender128", "ioctl$DRM_*", "close"],
	"disable_syscalls": ["ioctl$DRM_IOCTL_SYNCOBJ_*"],
	"reproduce": false,
	"vm": {
		"targets" : [ "10.0.0.1" ],
		"pstore": false,
		"target_dir" : "/path",
                "target_reboot" : true
	}
}
---------------------------------------------------
Generated C program:

// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE=20

#include <endian.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

uint64_t r[15] =3D {0xffffffffffffffff, 0xffffffffffffffff, 0xffffffffff=
ffffff, 0xffffffffffffffff, 0xffffffffffffffff, 0x0, 0xffffffffffffffff,=
 0x0, 0x0, 0xffffffffffffffff, 0x0, 0x0, 0xffffffffffffffff, 0xfffffffff=
fffffff, 0xffffffffffffffff};

int main(void)
{
		syscall(__NR_mmap, /*addr=3D*/0x1ffffffff000ul, /*len=3D*/0x1000ul, /*=
prot=3D*/0ul, /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/0x32ul, /*f=
d=3D*/(intptr_t)-1, /*offset=3D*/0ul);
	syscall(__NR_mmap, /*addr=3D*/0x200000000000ul, /*len=3D*/0x1000000ul, =
/*prot=3DPROT_WRITE|PROT_READ|PROT_EXEC*/7ul, /*flags=3DMAP_FIXED|MAP_AN=
ONYMOUS|MAP_PRIVATE*/0x32ul, /*fd=3D*/(intptr_t)-1, /*offset=3D*/0ul);
	syscall(__NR_mmap, /*addr=3D*/0x200001000000ul, /*len=3D*/0x1000ul, /*p=
rot=3D*/0ul, /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/0x32ul, /*fd=
=3D*/(intptr_t)-1, /*offset=3D*/0ul);
	const char* reason;
	(void)reason;
				intptr_t res =3D 0;
	if (write(1, "executing program\n", sizeof("executing program\n") - 1))=
 {}
memcpy((void*)0x200000000200, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000200ul, /*flags=3DO_SYNC*/0x101000, /*mode=3D*/0);
	if (res !=3D -1)
		r[0] =3D res;
*(uint32_t*)0x200000002440 =3D 0;
*(uint32_t*)0x200000002444 =3D 0x80000;
	syscall(__NR_ioctl, /*fd=3D*/r[0], /*cmd=3D*/0xc00c642d, /*arg=3D*/0x20=
0000002440ul);
memcpy((void*)0x2000000001c0, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x2000000001c0ul, /*flags=3DO_NOFOLLOW|O_CREAT|O_CLOEXEC*/0xa0040, /*mod=
e=3D*/0);
	if (res !=3D -1)
		r[1] =3D res;
	syscall(__NR_ioctl, /*fd=3D*/r[1], /*cmd=3D*/0x4b47, /*arg=3D*/0ul);
memcpy((void*)0x200000000300, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000300ul, /*flags=3DO_SYNC|O_NONBLOCK|O_LARGEFILE*/0x109800, /*m=
ode=3D*/0);
	if (res !=3D -1)
		r[2] =3D res;
memcpy((void*)0x200000000100, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000100ul, /*flags=3D*/0, /*mode=3D*/0);
	if (res !=3D -1)
		r[3] =3D res;
	syscall(__NR_ioctl, /*fd=3D*/r[3], /*cmd=3D*/0x80f86406, /*arg=3D*/0ul);
memcpy((void*)0x200000000440, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000440ul, /*flags=3DO_NONBLOCK|O_CREAT*/0x840, /*mode=3D*/0);
	if (res !=3D -1)
		r[4] =3D res;
*(uint64_t*)0x200000000fc0 =3D 0;
*(uint32_t*)0x200000000fc8 =3D 0;
*(uint32_t*)0x200000000fcc =3D 0;
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[4], /*cmd=3D*/0xc06864a1, /*arg=3D=
*/0x200000000fc0ul);
	if (res !=3D -1)
r[5] =3D *(uint32_t*)0x200000000fd0;
	syscall(__NR_close, /*fd=3D*/r[2]);
*(uint32_t*)0x200000000000 =3D 0;
*(uint32_t*)0x200000000004 =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[4], /*cmd=3D*/0xc00c642d, /*arg=3D*/0x20=
0000000000ul);
*(uint32_t*)0x200000000040 =3D 0;
*(uint32_t*)0x200000000044 =3D 0;
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[3], /*cmd=3D*/0xc00c642d, /*arg=3D=
*/0x200000000040ul);
	if (res !=3D -1)
r[6] =3D *(uint32_t*)0x200000000048;
*(uint32_t*)0x200000000080 =3D 0;
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[2], /*cmd=3D*/0xc010640b, /*arg=3D=
*/0x200000000080ul);
	if (res !=3D -1)
r[7] =3D *(uint32_t*)0x200000000084;
*(uint32_t*)0x2000000000c0 =3D 0;
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[4], /*cmd=3D*/0xc010640b, /*arg=3D=
*/0x2000000000c0ul);
	if (res !=3D -1)
r[8] =3D *(uint32_t*)0x2000000000c4;
memcpy((void*)0x2000000001c0, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x2000000001c0ul, /*flags=3DO_NOFOLLOW|O_CREAT|O_CLOEXEC*/0xa0040, /*mod=
e=3D*/0);
	if (res !=3D -1)
		r[9] =3D res;
	syscall(__NR_ioctl, /*fd=3D*/r[9], /*cmd=3D*/0x5421, /*arg=3D*/0ul);
*(uint32_t*)0x200000000180 =3D r[5];
*(uint32_t*)0x200000000184 =3D 0x2534dd8;
*(uint32_t*)0x200000000188 =3D 7;
*(uint32_t*)0x20000000018c =3D 3;
*(uint32_t*)0x200000000190 =3D 2;
*(uint32_t*)0x2000000001a4 =3D 0x97;
*(uint32_t*)0x2000000001a8 =3D 0x74c83423;
*(uint32_t*)0x2000000001ac =3D 4;
*(uint32_t*)0x2000000001b0 =3D 8;
*(uint32_t*)0x2000000001b4 =3D 6;
*(uint32_t*)0x2000000001b8 =3D 0x7f;
*(uint32_t*)0x2000000001bc =3D 0;
*(uint32_t*)0x2000000001c0 =3D 9;
*(uint64_t*)0x2000000001c8 =3D 3;
*(uint64_t*)0x2000000001d0 =3D 0;
*(uint64_t*)0x2000000001d8 =3D 1;
*(uint64_t*)0x2000000001e0 =3D 1;
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[3], /*cmd=3D*/0xc06864ce, /*arg=3D=
*/0x200000000180ul);
	if (res !=3D -1)
r[10] =3D *(uint32_t*)0x200000000198;
*(uint32_t*)0x200000000200 =3D r[5];
*(uint32_t*)0x200000000204 =3D 1;
*(uint32_t*)0x200000000208 =3D 1;
*(uint32_t*)0x20000000020c =3D 0;
*(uint32_t*)0x200000000210 =3D 1;
*(uint32_t*)0x200000000214 =3D r[7];
*(uint32_t*)0x200000000218 =3D r[8];
*(uint32_t*)0x20000000021c =3D 0;
*(uint32_t*)0x200000000220 =3D r[10];
*(uint32_t*)0x200000000224 =3D 9;
*(uint32_t*)0x200000000228 =3D 7;
*(uint32_t*)0x20000000022c =3D 2;
*(uint32_t*)0x200000000230 =3D 2;
*(uint32_t*)0x200000000234 =3D 0x400;
*(uint32_t*)0x200000000238 =3D 0x367;
*(uint32_t*)0x20000000023c =3D 7;
*(uint32_t*)0x200000000240 =3D 8;
*(uint64_t*)0x200000000248 =3D 0x3e;
*(uint64_t*)0x200000000250 =3D 3;
*(uint64_t*)0x200000000258 =3D 9;
*(uint64_t*)0x200000000260 =3D 6;
	syscall(__NR_ioctl, /*fd=3D*/r[6], /*cmd=3D*/0xc06864b8, /*arg=3D*/0x20=
0000000200ul);
	res =3D syscall(__NR_ioctl, /*fd=3D*/r[6], /*cmd=3D*/0xc0086420, /*arg=3D=
*/0x200000000140ul);
	if (res !=3D -1)
r[11] =3D *(uint32_t*)0x200000000140;
*(uint32_t*)0x200000000280 =3D r[11];
*(uint32_t*)0x200000000284 =3D 0x26;
	syscall(__NR_ioctl, /*fd=3D*/r[3], /*cmd=3D*/0x4008642a, /*arg=3D*/0x20=
0000000280ul);
memcpy((void*)0x200000000300, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000300ul, /*flags=3DO_SYNC|O_NONBLOCK|O_LARGEFILE*/0x109800, /*m=
ode=3D*/0);
	if (res !=3D -1)
		r[12] =3D res;
memcpy((void*)0x200000000100, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000100ul, /*flags=3D*/0, /*mode=3D*/0);
	if (res !=3D -1)
		r[13] =3D res;
	syscall(__NR_ioctl, /*fd=3D*/r[13], /*cmd=3D*/0x80f86406, /*arg=3D*/0ul=
);
memcpy((void*)0x200000000440, "/dev/dri/renderD128\000", 20);
	res =3D syscall(__NR_openat, /*fd=3D*/0xffffffffffffff9cul, /*file=3D*/=
0x200000000440ul, /*flags=3DO_NONBLOCK|O_CREAT*/0x840, /*mode=3D*/0);
	if (res !=3D -1)
		r[14] =3D res;
*(uint64_t*)0x200000000fc0 =3D 0;
*(uint32_t*)0x200000000fc8 =3D 0;
*(uint32_t*)0x200000000fcc =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[14], /*cmd=3D*/0xc06864a1, /*arg=3D*/0x2=
00000000fc0ul);
	syscall(__NR_close, /*fd=3D*/r[12]);
*(uint32_t*)0x200000000000 =3D 0;
*(uint32_t*)0x200000000004 =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[14], /*cmd=3D*/0xc00c642d, /*arg=3D*/0x2=
00000000000ul);
*(uint32_t*)0x200000000040 =3D 0;
*(uint32_t*)0x200000000044 =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[13], /*cmd=3D*/0xc00c642d, /*arg=3D*/0x2=
00000000040ul);
*(uint32_t*)0x200000000080 =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[12], /*cmd=3D*/0xc010640b, /*arg=3D*/0x2=
00000000080ul);
*(uint32_t*)0x2000000000c0 =3D 0;
	syscall(__NR_ioctl, /*fd=3D*/r[14], /*cmd=3D*/0xc010640b, /*arg=3D*/0x2=
000000000c0ul);
	return 0;
}

---------------------------------------------------
Syzkaller program (Syz language):

r0 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000200), 0x1010=
00, 0x0)
ioctl$DRM_IOCTL_PRIME_HANDLE_TO_FD(r0, 0xc00c642d, &(0x7f0000002440)=3D{=
0x0, 0x80000})
r1 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f00000001c0), 0xa004=
0, 0x0)
ioctl$DRM_IOCTL_RES_CTX(r1, 0x4b47, 0x0)
r2 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000300), 0x1098=
00, 0x0)
r3 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000100), 0x0, 0=
x0)
ioctl$DRM_IOCTL_GET_STATS(r3, 0x80f86406, 0x0)
r4 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000440), 0x840,=
 0x0)
ioctl$DRM_IOCTL_MODE_GETCRTC(r4, 0xc06864a1, &(0x7f0000000fc0)=3D{0x0, 0=
x0, 0x0, <r5=3D>0x0})
close(r2)
ioctl$DRM_IOCTL_PRIME_HANDLE_TO_FD(r4, 0xc00c642d, &(0x7f0000000000))
ioctl$DRM_IOCTL_PRIME_HANDLE_TO_FD(r3, 0xc00c642d, &(0x7f0000000040)=3D{=
0x0, 0x0, <r6=3D>0xffffffffffffffff})
ioctl$DRM_IOCTL_GEM_OPEN(r2, 0xc010640b, &(0x7f0000000080)=3D{0x0, <r7=3D=
>0x0})
ioctl$DRM_IOCTL_GEM_OPEN(r4, 0xc010640b, &(0x7f00000000c0)=3D{0x0, <r8=3D=
>0x0})
r9 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f00000001c0), 0xa004=
0, 0x0)
ioctl$DRM_IOCTL_RES_CTX(r9, 0x5421, 0x0)
ioctl$DRM_IOCTL_MODE_GETFB2(r3, 0xc06864ce, &(0x7f0000000180)=3D{r5, 0x2=
534dd8, 0x7, 0x3, 0x2, [0x0, <r10=3D>0x0], [0x97, 0x74c83423, 0x4, 0x8],=
 [0x6, 0x7f, 0x0, 0x9], [0x3, 0x0, 0x1, 0x1]})
ioctl$DRM_IOCTL_MODE_ADDFB2(r6, 0xc06864b8, &(0x7f0000000200)=3D{r5, 0x1=
, 0x1, 0x0, 0x1, [r7, r8, 0x0, r10], [0x9, 0x7, 0x2, 0x2], [0x400, 0x367=
, 0x7, 0x8], [0x3e, 0x3, 0x9, 0x6]})
ioctl$DRM_IOCTL_ADD_CTX(r6, 0xc0086420, &(0x7f0000000140)=3D{<r11=3D>0x0=
})
ioctl$DRM_IOCTL_LOCK(r3, 0x4008642a, &(0x7f0000000280)=3D{r11, 0x26})
r12 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000300), 0x109=
800, 0x0)
r13 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000100), 0x0, =
0x0)
ioctl$DRM_IOCTL_GET_STATS(r13, 0x80f86406, 0x0)
r14 =3D openat$drirender128(0xffffffffffffff9c, &(0x7f0000000440), 0x840=
, 0x0)
ioctl$DRM_IOCTL_MODE_GETCRTC(r14, 0xc06864a1, &(0x7f0000000fc0)=3D{0x0})
close(r12)
ioctl$DRM_IOCTL_PRIME_HANDLE_TO_FD(r14, 0xc00c642d, &(0x7f0000000000))
ioctl$DRM_IOCTL_PRIME_HANDLE_TO_FD(r13, 0xc00c642d, &(0x7f0000000040))
ioctl$DRM_IOCTL_GEM_OPEN(r12, 0xc010640b, &(0x7f0000000080))
ioctl$DRM_IOCTL_GEM_OPEN(r14, 0xc010640b, &(0x7f00000000c0))
