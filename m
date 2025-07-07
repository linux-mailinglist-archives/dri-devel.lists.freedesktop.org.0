Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA3AFB32D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9098110E044;
	Mon,  7 Jul 2025 12:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr/sGjUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D510E044;
 Mon,  7 Jul 2025 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751891164; x=1783427164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x+eQU20saac2ebjfkjj590lSextm/Z+6yqcPljJ6GK4=;
 b=Qr/sGjURHw13qOy0Y60vpo6SeE7eMhNsCuKahqo4TB62y9GIzs0UFVY4
 35eLgjHMkiBcZ/EXY61cNy98UJ1Hm61wS/yGQipznoNw+NB/aHDSjLBtF
 jwG5pjffnZ+BIvmLKQxmj4MwZAorHoXuQwIM4O8cH39hAIEODkhnkNbhH
 8MwTvYToBmMXIqtipjuFfrBrN0JI6mbf2kBdKx7GcXhDvw4Xg7qs1eE3a
 dSBDjEkSm66X5ldx79WQLCpW2MT+pBYa2i8Bkyai17keKPVhsAcAvvGxg
 Jl2vzgMDQjJ3TT5NT8Jg4L/q6RBMkgeaDLJtXG3pW3r89uzOIXGkyVU6+ A==;
X-CSE-ConnectionGUID: W2kThlzDRf25vBDv+/qyRg==
X-CSE-MsgGUID: 0LTcj1BDTfyNrXGCFjpG0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57878070"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="57878070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:25:55 -0700
X-CSE-ConnectionGUID: eI2iovWaRs6O7c6BAdLBwQ==
X-CSE-MsgGUID: uRf7iaeBSXqTMzcQb9GuQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159547096"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:25:52 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Mon, 07 Jul 2025 14:25:48 +0200
Message-ID: <2191571.OBFZWjSADL@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Christian,

I've taken over that old issue and have a few questions to you.

On Thursday, 27 February 2025 15:11:39 CEST Christian K=C3=B6nig wrote:
> Am 27.02.25 um 13:52 schrieb Andi Shyti:
> > Hi Nitin,
> >
> > On Wed, Feb 26, 2025 at 09:25:34PM +0530, Nitin Gote wrote:
> >> Give the scheduler a chance to breath by calling cond_resched()
> >> as some of the loops may take some time on old machines (like apl/bsw/
pnv),
> >> and so catch the attention of the watchdogs.
> >>
> >> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> >> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > This patch goes beyond the intel-gfx domain so that you need to
> > add some people in Cc. By running checkpatch, you should add:
> >
> > Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING=20
=46RAMEWORK)
> > "Christian K=C3=B6nig" <christian.koenig@amd.com> (maintainer:DMA BUFFE=
R=20
SHARING FRAMEWORK)
> > linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
> > dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK)
> >
> > I added them now, but you might still be asked to resend.
> >
> > Said that, at a first glance, I don't have anything against this
> > patch.
>=20
> There has been some push to deprecate cond_resched() cause it is almost=20
always not appropriate.
>=20
> Saying that if I'm not completely mistaken that here is also not 100%=20
correct usage.
>=20
> Question is why is the test taking 26 (busy?) seconds to complete? That=20
sounds really long even for a very old CPU.

The failing test case operates on a dma fence chain built of 4096 dma fence=
s.  =20
Am I right that a single dma_fence_signal() call may result in up to 4096=20
levels of nested sub-calls to dma_fence_chain_cb()?   The test case signals=
=20
each fence of the chain in a loop, starting from the last one.  Then, =20
dma_fence_chain_cb() is called 4096 * (4096 + 1) / 2 (an arithmetic series)=
 ~=3D=20
8.4 milion times, isn't it?

On most powerful gen12 machines used in CI, that test case takes slightly l=
ess=20
than 3s, on low end few years old machines -- ~ 10s.  Should we be surprise=
d=20
that it takes over 20s on the least powerful one (gen3 PineView Atom)?  And=
,=20
while reproducing the issue, I've never seen any unrecoverable deadlocks.  =
It=20
just takes time to complete the loop.

Does that address your doubts?

Assuming the commit message will be extended and provide the above=20
explanation, I can still imagine a few ways of "fixing" that issue.  We can=
=20
just limit the chain length and still execute all those dma_fence_signal()=
=20
calls without taking a breath, but why?  Or we can somehow measure expected=
=20
processing speed before running the exercise and limit the chain size=20
accordingly at runtime, which in turn seems an overcomplication to me.  Or,=
 we=20
can agree that there is no point in avoiding that process being potentially=
=20
swapped out from the CPU and take the approach proposed by Nitin, perhaps=20
limited to this particular problematic test case.  And, I can see=20
cond_resched() still used in recent patches.

Would any of those options be acceptable for you?

Thanks,
Janusz

>=20
> Do we maybe have an udelay() here which should have been an usleep() or=20
similar?
>=20
> Regards,
> Christian.
>=20
> >
> > Andi
> >
> >> ---
> >> Hi,
> >>
> >> For reviewer reference, adding here watchdog issue seen on old machines
> >> during dma-fence-chain subtests testing. This log is retrieved from=20
device
> >> pstore log while testing dam-buf@all-tests:
> >>
> >> dma-buf: Running dma_fence_chain
> >> Panic#1 Part7
> >> <6> sizeof(dma_fence_chain)=3D184
> >> <6> dma-buf: Running dma_fence_chain/sanitycheck
> >> <6> dma-buf: Running dma_fence_chain/find_seqno
> >> <6> dma-buf: Running dma_fence_chain/find_signaled
> >> <6> dma-buf: Running dma_fence_chain/find_out_of_order
> >> <6> dma-buf: Running dma_fence_chain/find_gap
> >> <6> dma-buf: Running dma_fence_chain/find_race
> >> <6> Completed 4095 cycles
> >> <6> dma-buf: Running dma_fence_chain/signal_forward
> >> <6> dma-buf: Running dma_fence_chain/signal_backward
> >> <6> dma-buf: Running dma_fence_chain/wait_forward
> >> <6> dma-buf: Running dma_fence_chain/wait_backward
> >> <0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
> >> Panic#1 Part6
> >> <4> irq event stamp: 415735
> >> <4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>]=20
handle_softirqs+0xab/0x4d0
> >> <4> hardirqs last disabled at (415735): [<ffffffff827c7e31>]=20
sysvec_apic_timer_interrupt+0x11/0xc0
> >> <4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>]=20
__irq_exit_rcu+0x13f/0x160
> >> <4> softirqs last disabled at (415733): [<ffffffff813d3f8f>]=20
__irq_exit_rcu+0x13f/0x160
> >> <4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-
next_483-g7b91683e7de7+ #1
> >> <4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS=20
AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
> >> <4> RIP: 0010:handle_softirqs+0xb1/0x4d0
> >> <4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
> >> <4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> >> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> >> <4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
> >> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
> >> <4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
> >> <4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000)=20
knlGS:0000000000000000
> >> Panic#1 Part5
> >> <4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> <4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
> >> <4> Call Trace:
> >> <4>  <IRQ>
> >> <4>  ? show_regs+0x6c/0x80
> >> <4>  ? watchdog_timer_fn+0x247/0x2d0
> >> <4>  ? __pfx_watchdog_timer_fn+0x10/0x10
> >> <4>  ? __hrtimer_run_queues+0x1d0/0x420
> >> <4>  ? hrtimer_interrupt+0x116/0x290
> >> <4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
> >> <4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
> >> <4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
> >> <4>  ? handle_softirqs+0xb1/0x4d0
> >> <4>  __irq_exit_rcu+0x13f/0x160
> >> <4>  irq_exit_rcu+0xe/0x20
> >> <4>  sysvec_irq_work+0xa0/0xc0
> >> <4>  </IRQ>
> >> <4>  <TASK>
> >> <4>  asm_sysvec_irq_work+0x1b/0x20
> >> <4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
> >> <4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
> >> <4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
> >> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> >> <4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
> >> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
> >> <4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
> >> Panic#1 Part4
> >> <4> dma_fence_signal+0x49/0xb0
> >> <4> wait_backward+0xf8/0x140 [dmabuf_selftests]
> >> <4> __subtests+0x75/0x1f0 [dmabuf_selftests]
> >> <4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
> >> <4> st_init+0x6a/0xff0 [dmabuf_selftests]
> >> <4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
> >> <4> do_one_initcall+0x79/0x400
> >> <4> do_init_module+0x97/0x2a0
> >> <4> load_module+0x2c23/0x2f60
> >> <4> init_module_from_file+0x97/0xe0
> >> <4> ? init_module_from_file+0x97/0xe0
> >> <4> idempotent_init_module+0x134/0x350
> >> <4> __x64_sys_finit_module+0x77/0x100
> >> <4> x64_sys_call+0x1f37/0x2650
> >> <4> do_syscall_64+0x91/0x180
> >> <4> ? trace_hardirqs_off+0x5d/0xe0
> >> <4> ? syscall_exit_to_user_mode+0x95/0x260
> >> <4> ? do_syscall_64+0x9d/0x180
> >> <4> ? do_syscall_64+0x9d/0x180
> >> <4> ? irqentry_exit+0x77/0xb0
> >> <4> ? sysvec_apic_timer_interrupt+0x57/0xc0
> >> <4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >> <4> RIP: 0033:0x77521e72725d
> >>
> >>
> >>  drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
> >>  1 file changed, 11 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-
dma-fence-chain.c
> >> index ed4b323886e4..328a66ed59e5 100644
> >> --- a/drivers/dma-buf/st-dma-fence-chain.c
> >> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> >> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
> >> =20
> >>  	for (i =3D 0; i < fc.chain_length; i++) {
> >>  		dma_fence_signal(fc.fences[i]);
> >> +		cond_resched();
> >> =20
> >>  		if (!dma_fence_is_signaled(fc.chains[i])) {
> >>  			pr_err("chain[%d] not signaled!\n", i);
> >> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
> >> =20
> >>  	for (i =3D fc.chain_length; i--; ) {
> >>  		dma_fence_signal(fc.fences[i]);
> >> +		cond_resched();
> >> =20
> >>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
> >>  			pr_err("chain[%d] is signaled!\n", i);
> >> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
> >>  	get_task_struct(tsk);
> >>  	yield_to(tsk, true);
> >> =20
> >> -	for (i =3D 0; i < fc.chain_length; i++)
> >> +	for (i =3D 0; i < fc.chain_length; i++) {
> >>  		dma_fence_signal(fc.fences[i]);
> >> +		cond_resched();
> >> +	}
> >> =20
> >>  	err =3D kthread_stop_put(tsk);
> >> =20
> >> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
> >>  	get_task_struct(tsk);
> >>  	yield_to(tsk, true);
> >> =20
> >> -	for (i =3D fc.chain_length; i--; )
> >> +	for (i =3D fc.chain_length; i--; ) {
> >>  		dma_fence_signal(fc.fences[i]);
> >> +		cond_resched();
> >> +	}
> >> =20
> >>  	err =3D kthread_stop_put(tsk);
> >> =20
> >> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
> >>  	get_task_struct(tsk);
> >>  	yield_to(tsk, true);
> >> =20
> >> -	for (i =3D 0; i < fc.chain_length; i++)
> >> +	for (i =3D 0; i < fc.chain_length; i++) {
> >>  		dma_fence_signal(fc.fences[i]);
> >> +		cond_resched();
> >> +	}
> >> =20
> >>  	err =3D kthread_stop_put(tsk);
> >> =20
>=20
>=20




