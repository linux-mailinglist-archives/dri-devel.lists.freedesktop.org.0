Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8CBCC3F0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898D10EB85;
	Fri, 10 Oct 2025 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="k1IQxalh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JfTrSfie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B3E10EB82;
 Fri, 10 Oct 2025 08:59:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cjgfM0WcNz9tVV;
 Fri, 10 Oct 2025 10:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760086763; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgfqpLwuyiWJ25uh4l3f6cHLoCE5xo3gWB8BjnWumBI=;
 b=k1IQxalhj4xhjXBK6uQ9BUHH6h37djiKADYYzrn+zUpwHDqt/i05sfYdFzWe4++BfivyXJ
 uz6nkkqN4fSnhoALTcyHecPgvM/Sx34tExLhRmg8IvQ4rvPGQwy0lrpReRpUHHpfKiLBjl
 QyiQcS2KiiXgffg9pARzBjGu0UAb7VDu2/Ks8u2N2q78L/U42NxrLohsPtsO61rMI/etSL
 LZlcRz9wSUNNaG2MI/k25KU0S9bc5az5fEQy6Ys7r5NP1NaHDaKIyj5oEmL59o26FRzXx9
 7nQDeDimVE/GEqDyQ6p/yhZYJ9fhwQJDQfJoUQutF0zZ/q9Qmmkfcub5QF8/6g==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JfTrSfie;
 spf=pass (outgoing_mbo_mout: domain of phasta@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=phasta@mailbox.org
Message-ID: <3f087bf5e1adb4d1af064a2d246b53bd9cec434f.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760086761; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgfqpLwuyiWJ25uh4l3f6cHLoCE5xo3gWB8BjnWumBI=;
 b=JfTrSfie3yaJE5PmY3oP7/0BPy6U/DfqMBS0UMR3iBZWRu+msn3sy1soVlrInKycyY8Y24
 ncM3qiUBgb49XC6ajOpFYlLejYFa+G6cLz4oFgskioEkjXtUQgyURnODx5li0qY+rDjzyi
 aNpscK/t/skUH2sA9yiEMVZrGKm57t15zLU8D2MwM/oCf8zwuene8sUJzD2TMXo24qJZUO
 s2kSaxWt0M8GKv0J6B5lS6HOD3FA0eIU8ZqB9jkkNVf1U5+VV2/6WJyC0yhZs6qjcZIcXh
 F+jUo42F3IY6LpXhUeXZ3apxaYhbU9huVni6juxX0GMl1YEZHjFejpVMCUp3NQ==
Subject: Re: [PATCH 00/28] Fair DRM scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Leo Liu
 <Leo.Liu@amd.com>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>
Date: Fri, 10 Oct 2025 10:59:11 +0200
In-Reply-To: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f7472a4a05f8efc037f
X-MBO-RS-META: qrmr4r85xrt78yyc6q8c8bah4gapzcpt
X-Rspamd-Queue-Id: 4cjgfM0WcNz9tVV
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> [disclaimer]
> Please note that as this series includes patches which touch a good numbe=
r of
> drivers, I did not copy everyone on everything. Assumption is people are
> subscribed to dri-devel and for context can look at the whole series ther=
e.
> [/disclaimer]
>=20
> As a summary, the new scheduling algorithm is insipired by the original L=
inux
> CFS and so far no scheduling regressions have been found relative to FIFO=
.
> There are improvements in fairness and scheduling of interactive clients =
when
> running in parallel with a heavy GPU load (for example Pierre-Eric has on=
e
> viewperf medical test which shows a nice improvement with amdgpu).
>=20
> On the high level main advantages of the series are:
>=20
> =C2=A01. Scheduling quality - schedules better than FIFO, solves priority=
 starvation.
> =C2=A02. Code simplification - no more multiple run queues and multiple a=
lgorithms.
> =C2=A03. Virtual GPU time based scheduling enables relatively simple addi=
tion
> =C2=A0=C2=A0=C2=A0 of a scheduling cgroup controller in the future.
>=20
> There is a little bit more detailed write up on the motivation and result=
s in
> the form of a blog post which may be easier to read:
> https://blogs.igalia.com/tursulin/fair-er-drm-gpu-scheduler/
>=20
> First patches add some unit tests which allow for easy evaluation of sche=
duling
> behaviour against different client submission patterns. From there onward=
s it is
> hopefully a natural progression of cleanups, enablers, adding the fair po=
licy,
> and finally removing FIFO and RR and simplifying the code base due no mor=
e need
> for multiple run queues.
>=20
> Series is structured in a way where we could apply the first 12 patches (=
up to
> and including "drm/sched: Switch default policy to fair") in one kernel r=
elease
> and then follow up with the rest of the cleanups after a release or two i=
f
> things will be looking fine. Until the remainder of the series would be m=
erged
> it would be easy to flip the default algorithm back.
>=20
> Onto the performance evaluation. As a headline result I have tested three
> simultaneous clients on the Steam Deck:
>=20
> One instance of a deferredmultisampling Vulkan demo running with low prio=
rity,
> one normal priority instance of the same demo, and the Unigine Heaven ben=
chmark.
>=20
> With the FIFO scheduler we can see that the low priority client is comple=
tely
> starved and the GPU time distribution between the other two clients is un=
even:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/fifo-starvation.png
>=20
> Switching to the fair scheduler, GPU time distribution is almost equal an=
d the
> low priority client does get a small share of the GPU:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/fair-no-starvation.png
>=20
> Moving onto the synthetic submission patterns, they are about two simulta=
neous
> clients which broadly cover the following categories:
>=20
> =C2=A0* Deep queue clients
> =C2=A0* Hogs versus interactive
> =C2=A0* Priority handling
>=20
> Lets look at the results:
>=20
> 1. Two normal priority deep queue clients.
>=20
> These ones submit one second worth of 8ms jobs. As fast as they can, no
> dependencies etc. There is no difference in runtime between FIFO and fair=
 but
> the latter allows both clients to progress with work more evenly:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/normal-normal.png
>=20
> (X axis is time, Y is submitted queue-depth, hence lowering of qd corresp=
onds
> =C2=A0 with work progress for both clients, tested with both schedulers s=
eparately.)
>=20
> Round-robin is the same as fair here.
>=20
> 2. Same two clients but one is now low priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/normal-low.png
>=20
> Normal priority client is a solid line, low priority dotted. We can see h=
ow FIFO
> completely starves the low priority client until the normal priority is f=
ully
> done. Only then the low priority client gets any GPU time.
>=20
> In constrast, fair scheduler allows some GPU time to the low priority cli=
ent.
>=20
> Here round-robin flavours are the same as FIFO (same starvation issue).
>=20
> 3. Same clients but now high versus normal priority.
>=20
> Similar behaviour as in the previous one with normal a bit less de-priori=
tised
> relative to high, than low was against normal.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png
>=20
> And again round-robin flavours are the same as FIFO.
>=20
> 4. Heavy load vs interactive client.
>=20
> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed=
 by a
> 2.5ms wait. Interactive client emits a 10% GPU load in the format of 1x 1=
ms job
> followed by a 9ms wait.
>=20
> This simulates an interactive graphical client used on top of a relativel=
y heavy
> background load but no GPU oversubscription.
>=20
> Graphs show the interactive client only and from now on, instead of looki=
ng at
> the client's queue depth, we look at its "fps".
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/251008/4-heavy-vs-inter=
active.png
>=20
> Here round-robin and round-robin rewritten on top of FIFO are best, with =
the
> fair algorithm being very close. FIFO is clearly the worst.
>=20
> 5. An even heavier load vs interactive client.
>=20
> This one is oversubscribing the GPU by submitting 4x 50ms jobs and waitin=
g for
> only one microsecond before repeating the cycle. Interactive client is th=
e same
> 10% as above.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/251008/4-very-heavy-vs-=
interactive.png
>=20
> Here FIFO is even worse and fair is again almost as good as the two round=
-robin
> flavours.
>=20
> 6. Low priority GPU hog versus heavy-interactive.
>=20
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/251008/4-low-hog-vs-int=
eractive.png
>=20
> All schedulers appear to handle this almost equally well but FIFO could s=
till be
> the last while fair has a slight lead.
>=20
> As before, I am looking for feedback, ideas for what other kinds of submi=
ssion
> scenarios to test, testing on different GPUs and of course reviews.
>=20
> v2:
> =C2=A0* Fixed many rebase errors.
> =C2=A0* Added some new patches.
> =C2=A0* Dropped single shot dependecy handling.
>=20
> v3:
> =C2=A0* Added scheduling quality unit tests.
> =C2=A0* Refined a tiny bit by adding some fairness.
> =C2=A0* Dropped a few patches for now.
>=20
> v4:
> =C2=A0* Replaced deadline with fair!
> =C2=A0* Refined scheduling quality unit tests.
> =C2=A0* Pulled one cleanup patch earlier.
> =C2=A0* Fixed "drm/sched: Avoid double re-lock on the job free path".
>=20
> v5:
> =C2=A0* Rebase on top of latest upstream DRM scheduler changes.
> =C2=A0* Kerneldoc fixup.
> =C2=A0* Improve commit message justification for one patch. (Philipp)
> =C2=A0* Add comment in drm_sched_alloc_wq. (Christian)
>=20
> v6:
> =C2=A0* Rebase for "drm/sched: De-clutter drm_sched_init" getting merged.
> =C2=A0* Avoid NULL rq dereference from a bad rebase. (Maira)
> =C2=A0* Added some kerneldoc throughout. (Maira)
> =C2=A0* Removed some lockdep annotations not belonging to one patch. (Mai=
ra)
> =C2=A0* Use dma_fence_is_signaled in "drm/sched: Avoid double re-lock on =
the job free path". (Maira, Philipp)
>=20
> v7:
> =C2=A0* Rebase for some prep patches getting merged.
> =C2=A0* Dropped submit all ready jobs patch.
> =C2=A0* Fixed 64-bit division in unit tests.
> =C2=A0* Fixed some more rebase and patch re-ordering mistakes.
> =C2=A0* Preserve entity RR order when re-entering the queue.
> =C2=A0* Fine tuned the queue re-enter logic for better behaviour with int=
eractive
> =C2=A0=C2=A0 clients.
> =C2=A0* Removed some static inlines.
> =C2=A0* Added more kerneldoc.
> =C2=A0* Done some benchmarks in the round-robin scheduling modes.
>=20
> v8:
> =C2=A0* Rebased for upstream changes.
> =C2=A0* Added assert for reverse numerical order of DRM_SCHED_PRIORITY en=
ums.
> =C2=A0* Fixed head of rq priority updates.
>=20
> v9:
> =C2=A0* RFC -> PATCH for the series as agreed during the XDC.

So this is not v9 of an RFC, but v1 of the actual series :)

I think you wanna mark the old changelog section as belonging to the
RFC, since this one will likely move to v2 etc., which might cause
confusion.

P.

> =C2=A0* Updated interactive benchmark graphs.
> =C2=A0* Improved handling of interactive clients by replacing the random =
noise on tie
> =C2=A0=C2=A0 approach with the average job duration statistics.
> =C2=A0* Document in code why we track entity GPU stats in a reference cou=
nted structures.
> =C2=A0* Document the new structure fields added by the fair policy.
> =C2=A0* Undo some tab vs spaces damage.
> =C2=A0* More accurate wording in the fair policy commit message.
> =C2=A0* Default to fair policy in a separate patch.
> =C2=A0* Renamed drm_sched_rq_select_entity to drm_sched_select_entity and=
 make it only take sched.
> =C2=A0* Fixed kerneldoc after removing scheduling policies and renaming t=
he rq.
> =C2=A0* Reversed arguments of drm_sched_rq_init and cleanup callers. (New=
 patch)
> =C2=A0* Removed unused num_rqs from struct drm_sched_args. (New patches)
> =C2=A0* Unit tests:
> =C2=A0=C2=A0 * Added wait duration comments.
> =C2=A0=C2=A0 * Data structure comments.
> =C2=A0=C2=A0 * Better name for a local variable.
> =C2=A0=C2=A0 * Added comment to the short job duration assert.
> =C2=A0=C2=A0 * Added comment for cond_resched().
> =C2=A0=C2=A0 * Tweaked some comments
> =C2=A0=C2=A0 * Added client_done() helper and documented the READ_ONCE.
> =C2=A0=C2=A0 * Clarified cycles per second calculation.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> CC: Leo Liu <Leo.Liu@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
>=20
> Tvrtko Ursulin (28):
> =C2=A0 drm/sched: Reverse drm_sched_rq_init arguments
> =C2=A0 drm/sched: Add some scheduling quality unit tests
> =C2=A0 drm/sched: Add some more scheduling quality unit tests
> =C2=A0 drm/sched: Implement RR via FIFO
> =C2=A0 drm/sched: Consolidate entity run queue management
> =C2=A0 drm/sched: Move run queue related code into a separate file
> =C2=A0 drm/sched: Free all finished jobs at once
> =C2=A0 drm/sched: Account entity GPU time
> =C2=A0 drm/sched: Remove idle entity from tree
> =C2=A0 drm/sched: Add fair scheduling policy
> =C2=A0 drm/sched: Favour interactive clients slightly
> =C2=A0 drm/sched: Switch default policy to fair
> =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> =C2=A0 drm/sched: Embed run queue singleton into the scheduler
> =C2=A0 accel/amdxdna: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 accel/rocket: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/etnaviv: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/imagination: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/lima: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/msm: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/nouveau: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/panfrost: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/panthor: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/sched: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/v3d: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/xe: Remove drm_sched_init_args->num_rqs usage
> =C2=A0 drm/sched: Remove drm_sched_init_args->num_rqs
>=20
> =C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/accel/rocket/rocket_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 27 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/msm/msm_gem_vma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 132 ++-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 99 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 402 ++------
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 354 +++++++
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 |=C2=A0=C2=A0 1 =
-
> =C2=A0.../gpu/drm/scheduler/tests/tests_scheduler.c | 878 +++++++++++++++=
+++
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/xe/xe_dep_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 43 +-
> =C2=A032 files changed, 1494 insertions(+), 500 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.=
c
>=20

