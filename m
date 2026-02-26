Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN49K3w3oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:07:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8281A591D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194C110E8FF;
	Thu, 26 Feb 2026 12:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="yfG9173G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QQwOsbfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8810E8FC;
 Thu, 26 Feb 2026 12:07:20 +0000 (UTC)
Date: Thu, 26 Feb 2026 13:07:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1772107637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7DHd4YrW2ZSEM1imCWenSnVLlRamUHUYJ6oBJozRB4=;
 b=yfG9173GGEUfw94vLam1jS2uNf6x4mqxZyIJzFMno2axFDcEafHVSqFuCFEoE67p12eyCm
 G5FWYQjIvfZccyDGdE7Newbz2pYtJRkfdc+C/ph/SKATotfLznryX/0zdU8ARVuEkT1QZW
 Ln0CVC0V0GSsDJcqIBhqPL0UZ8I0sgcqUU2V86Ry8/9o3tF4sBVje6vUUZSUz+V32z0YZc
 6lQXYionZXLD8oxwmzZc0T4TDYZz4iLMYoynyoniYKZcxXRuGEhOQiXnkF/AmWkz8Gq+o+
 9bpgndQarbeo4xHCftYHcUMPsalfHspokrOVY3ISWDfSHxGKw2yuea3eYm77Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1772107637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A7DHd4YrW2ZSEM1imCWenSnVLlRamUHUYJ6oBJozRB4=;
 b=QQwOsbfBnSmS2mAUhg8PIH6BLHs3Uk0NofpFunSU6vCKYBIHMCECExzbTQd5TyajMbNi26
 dcSomuW3q/TfAkAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
Message-ID: <20260226120715.6Ug1Qkse@linutronix.de>
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260224162703.Q_taYjEC@linutronix.de>
 <20260224165903.2mn24oQy@linutronix.de>
 <20260225075806.XNtXjZ5E@linutronix.de>
 <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,linutronix.de:mid,linutronix.de:dkim,01.org:url]
X-Rspamd-Queue-Id: 0A8281A591D
X-Rspamd-Action: no action

On 2026-02-25 21:06:05 [+0100], Maarten Lankhorst wrote:
> Hey,
Hi,

> After realizing the uncore lock only needed to be converted to a raw spinlock
> because the testcase was broken, I tested the alternative fix of using
> sleeping context only in the selftests:
> https://patchwork.freedesktop.org/patch/707063/?series=162145&rev=1

I have some memory that makeing uncore raw "solved" the tracing problem
but the latencies jumped at the same.

Since you did test XE only, xe does not show the lockup. I spills this
however:

|[    T632] ============================================
|[    T632] WARNING: possible recursive locking detected
|[    T632] 7.0.0-rc1-plain+ #5 Tainted: G     U      E
|[    T632] --------------------------------------------
|[    T632] kworker/u32:13/632 is trying to acquire lock:
|[    T632] ffff8efb858e7c58 (&fence->inline_lock){+.+.}-{2:2}, at: dma_fence_add_callback+0x4b/0x100
|[    T632]
|           but task is already holding lock:
|[    T632] ffff8efb524a1b58 (&fence->inline_lock){+.+.}-{2:2}, at: dma_fence_add_callback+0x4b/0x100
|[    T632]
|           other info that might help us debug this:
|[    T632]  Possible unsafe locking scenario:
|[    T632]        CPU0
|[    T632]        ----
|[    T632]   lock(&fence->inline_lock);
|[    T632]   lock(&fence->inline_lock);
|[    T632]
|            *** DEADLOCK ***
|[    T632]  May be due to missing lock nesting notation
|[    T632] 5 locks held by kworker/u32:13/632:
|[    T632]  #0: ffffffffc0ba3540 (drm_sched_lockdep_map){+.+.}-{0:0}, at: process_one_work+0x57a/0x600
|[    T632]  #1: ffffcf7f020f7e48 ((work_completion)(&sched->work_run_job)){+.+.}-{0:0}, at: process_one_work+0x1dc/0x600
|[    T632]  #2: ffff8efb524a1b58 (&fence->inline_lock){+.+.}-{2:2}, at: dma_fence_add_callback+0x4b/0x100
|[    T632]  #3: ffffffffb60fecc0 (rcu_read_lock){....}-{1:2}, at: rt_spin_lock+0xe6/0x1d0
|[    T632]  #4: ffffffffb60fecc0 (rcu_read_lock){....}-{1:2}, at: __dma_fence_enable_signaling+0x59/0x320
|[    T632]
|           stack backtrace:
|[    T632] CPU: 6 UID: 0 PID: 632 Comm: kworker/u32:13 Tainted: G     U      E       7.0.0-rc1-plain+ #5 PREEMPT_{RT,(lazy)}
|[    T632] Tainted: [U]=USER, [E]=UNSIGNED_MODULE
|[    T632] Hardware name: LENOVO 20TD00GLGE/20TD00GLGE, BIOS R1EET64W(1.64 ) 03/18/2025
|[    T632] Workqueue:  drm_sched_run_job_work [gpu_sched]
|[    T632] Call Trace:
|[    T632]  <TASK>
|[    T632]  dump_stack_lvl+0x6e/0xa0
|[    T632]  print_deadlock_bug.cold+0xc0/0xcd
|[    T632]  __lock_acquire+0x1232/0x2180
|[    T632]  lock_acquire+0xca/0x2f0
|[    T632]  rt_spin_lock+0x3f/0x1d0
|[    T632]  dma_fence_add_callback+0x4b/0x100
|[    T632]  dma_fence_chain_enable_signaling+0x11e/0x280
|[    T632]  __dma_fence_enable_signaling+0xc8/0x320
|[    T632]  dma_fence_add_callback+0x53/0x100
|[    T632]  drm_sched_entity_pop_job+0xf5/0x550 [gpu_sched]
|[    T632]  drm_sched_run_job_work+0x136/0x470 [gpu_sched]
|[    T632]  process_one_work+0x21d/0x600
|[    T632]  worker_thread+0x1d9/0x3b0
|[    T632]  kthread+0xf4/0x130
|[    T632]  ret_from_fork+0x3a5/0x430
|[    T632]  ret_from_fork_asm+0x1a/0x30
|[    T632]  </TASK>

Nothing else so far.

> With that the reset selftest works as expected.
> 
> But I do see some weird lockdep splats and aborts after that fixed the uncore lock testcases:
> https://patchwork.freedesktop.org/series/162145/
> 
> I believe it could be a different instance of:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162145v1/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html#dmesg-warnings904
> 
> Which is tracked under:
> 
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15759
> 
> Perhaps those are related to what you are seeing?

Not sure if it was the uncore in both cases. If you have an update
series somewhere I could pull and check. In meantime I would look what
causes the lockup on i915.

> Also don't use that series for anything but CI results, I rather want to submit
> a new version of this series.

So I am brave for using it on my actual HW then ;)

> Kind regards,
> ~Maarten Lankhorst

Sebastian
