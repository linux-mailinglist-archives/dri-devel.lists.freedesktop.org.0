Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C24AFC88D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97410E05E;
	Tue,  8 Jul 2025 10:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="P0eEbUO/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ImBqoDvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3325A10E05E;
 Tue,  8 Jul 2025 10:41:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bbyM502yfz9slL;
 Tue,  8 Jul 2025 12:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751971265; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26yb6yCQ/RIe6EcRodj4lJAYo+4HNIdL4tYwNwn8o4I=;
 b=P0eEbUO/yP86Nq/bYhWLI/MnA+GKmJjonwFfLJ47NrLU7OPWp1E90WNL9T9f6qa7tm8Qty
 mRYarPQdpH93N7SEZw/nzUYYdeV8ehbicOQZ8uPw/W79svx8Own85xU/M/rg+wAIAiA37v
 RuaJ2JvXaRCMiGr16kr4sHF7L8rESRgE85P8E590aNJaSJfHFWrW14qZuqB+Y51RAok6YK
 Y3kl1CooBWADQeFH77PD0asx0NxnoqHncfu3oIs1eF6jJZOdegGU1E1p8fhuI+2YuR033A
 qkYJM/YxMoO93fEi5Ujhv5OUuEJRpIzfeOZxf9TlV8J8n498Cxmga0IFz7V4wA==
Message-ID: <689a45f8e931607652ba302e3cf56f066ed7f3c7.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751971262; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26yb6yCQ/RIe6EcRodj4lJAYo+4HNIdL4tYwNwn8o4I=;
 b=ImBqoDvfUphCt0uHG/1qPxjaXTsJKIxFvfQXkVuDsLP/rFe6LFIFHwqGQHzP2zW45e+zF+
 v44KL4Ki++0G8pPCK1kdYGXZIcshPazbn0+SefYDoCYD7OCI8/VE3K2LJFEDPm3Pou670b
 a+rcjV5Tn3RLH/eEpQ3QOzDPzIP6toPMcHirWqD/c8ZXe2qP4YAewKBlQejSCMnVCtCSqb
 5yDYuAXWwegS6lac/yB9yxQbXsXE1I5blOpV09TkCgWsW1+NPz2DUxPsSMdN/xAxTxAues
 VbePrj9FW3SDC1nN4L6dqy97Ev+oK/X7Ni6bTbTItRHK2bDLEI99Ceyo1HZscA==
Subject: Re: [PATCH v6 00/15] Fair DRM scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Leo Liu
 <Leo.Liu@amd.com>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>
Date: Tue, 08 Jul 2025 12:40:58 +0200
In-Reply-To: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: m9jt4qfd5d3rpwd7yf3xr8asrdemd4cm
X-MBO-RS-ID: 167f8f564752480ba99
X-Rspamd-Queue-Id: 4bbyM502yfz9slL
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

You keep forgetting the "RFC" in your recent series's. Please add it
next time.

P.

On Tue, 2025-07-08 at 10:51 +0100, Tvrtko Ursulin wrote:
> As a summary, the new scheduling algorithm is insipired by the
> original Linux
> CFS and so far no scheduling regressions have been found. There are
> improvements
> in fairness and scheduling of interactive clients when running in
> parallel with
> a heavy GPU load (for example Pierre-Eric has one viewperf medical
> test which
> shows a nice improvement with amdgpu).
>=20
> On the high level main advantages of the series are:
>=20
> =C2=A01. Scheduling quality - schedules better than FIFO, solves priority
> starvation.
> =C2=A02. Code simplification - no more multiple run queues and multiple
> algorithms.
> =C2=A03. Virtual GPU time based scheduling enables relatively simple
> addition
> =C2=A0=C2=A0=C2=A0 of a scheduling cgroup controller in the future.
>=20
> There is a little bit more detailed write up on the motivation and
> results in
> the form of a blog post which may be easier to read:
> https://blogs.igalia.com/tursulin/fair-er-drm-gpu-scheduler/
>=20
> First patches add some unit tests which allow for easy evaluation of
> scheduling
> behaviour against different client submission patterns. From there
> onwards it is
> hopefully a natural progression of cleanups, enablers, adding the
> fair policy,
> and finally removing FIFO and RR and simplifying the code base due no
> more need
> for multiple run queues.
>=20
> As a headline result I have tested three simultaneous clients on the
> Steam Deck:
>=20
> One instance of a deferredmultisampling Vulkan demo running with low
> priority,
> one normal priority instance of the same demo, and the Unigine Heaven
> benchmark.
>=20
> With the FIFO scheduler we can see that the low priority client is
> completely
> starved and the GPU time distribution between the other two clients
> is uneven:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/fifo-starvation.png
>=20
> Switching to the fair scheduler, GPU time distribution is almost
> equal and the
> low priority client does get a small share of the GPU:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/fair-no-starvation.png
>=20
> Moving onto the synthetic submission patterns, they are about two
> simultaneous
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
> These ones submit one second worth of 8ms jobs. As fast as they can,
> no
> dependencies etc. There is no difference in runtime between FIFO and
> fair but
> the latter allows both clients to progress with work more evenly:
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/normal-normal.png
>=20
> (X axis is time, Y is submitted queue-depth, hence lowering of qd
> corresponds
> =C2=A0 with work progress for both clients, tested with both schedulers
> separately.)
>=20
> 2. Same two clients but one is now low priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/normal-low.png
>=20
> Normal priority client is a solid line, low priority dotted. We can
> see how FIFO
> completely starves the low priority client until the normal priority
> is fully
> done. Only then the low priority client gets any GPU time.
>=20
> In constrast, fair scheduler allows some GPU time to the low priority
> client.
>=20
> 3. Same clients but now high versus normal priority.
>=20
> Similar behaviour as in the previous one with normal a bit less de-
> prioritised
> relative to high, than low was against normal.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png
>=20
> 4. Heavy load vs interactive client.
>=20
> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs
> followed by a
> 2.5ms wait. Interactive client emits a 10% GPU load in the format of
> 1x 1ms job
> followed by a 9ms wait.
>=20
> This simulates an interactive graphical client used on top of a
> relatively heavy
> background load but no GPU oversubscription.
>=20
> Graphs show the interactive client only and from now on, instead of
> looking at
> the client's queue depth, we look at its "fps".
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/heavy-interactive.png
>=20
> We can see that fair scheduler allows a higher fps for the
> interactive client
> which is good.
>=20
> 5. An even heavier load vs interactive client.
>=20
> This one is oversubscribing the GPU by submitting 4x 50ms jobs and
> waiting for
> only one microsecond before repeating the cycle. Interactive client
> is thje same
> 10% as above.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/veryheavy-interactive.p=
ng
>=20
> Here the difference is even more dramatic with fair scheduler
> enabling ~3x the
> framerate for the interactive client.
>=20
> 6. Low priority GPU hog versus heavy-interactive.
>=20
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/lowhog-interactive.png
>=20
> Slight win for the fair scheduler but could be just noise.
>=20
> 7. Last set of test scenarios will have three subgroups.
>=20
> In all cases we have two interactive (synchronous, single job at a
> time) clients
> with a 50% "duty cycle" GPU time usage.
>=20
> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
>=20
> a) Both normal priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/5050-short.png
> https://people.igalia.com/tursulin/drm-sched-fair/5050-long.png
>=20
> Both schedulers favour the higher frequency duty cycle with fair
> giving it a
> little bit more which should be good for interactivity.
>=20
> b) Normal vs low priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-normal.=
png
> https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-low.png
>=20
> Fair scheduler gives a bit more GPU time to the normal priority
> client which is
> again good.
>=20
> c) High vs normal priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-high.p=
ng
> https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-normal=
.png
>=20
> Again, fair scheduler gives a bit more share to the higher priority
> client.
>=20
> As before, I am looking for feedback, ideas for what other kinds of
> submission
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
> =C2=A0* Removed some lockdep annotations not belonging to one patch.
> (Maira)
> =C2=A0* Use dma_fence_is_signaled in "drm/sched: Avoid double re-lock on
> the job free path". (Maira, Philipp)
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> CC: Leo Liu <Leo.Liu@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
>=20
> Tvrtko Ursulin (15):
> =C2=A0 drm/sched: Add some scheduling quality unit tests
> =C2=A0 drm/sched: Add some more scheduling quality unit tests
> =C2=A0 drm/sched: Avoid double re-lock on the job free path
> =C2=A0 drm/sched: Consolidate drm_sched_job_timedout
> =C2=A0 drm/sched: Consolidate drm_sched_rq_select_entity_rr
> =C2=A0 drm/sched: Implement RR via FIFO
> =C2=A0 drm/sched: Consolidate entity run queue management
> =C2=A0 drm/sched: Move run queue related code into a separate file
> =C2=A0 drm/sched: Free all finished jobs at once
> =C2=A0 drm/sched: Account entity GPU time
> =C2=A0 drm/sched: Remove idle entity from tree
> =C2=A0 drm/sched: Add fair scheduling policy
> =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> =C2=A0 drm/sched: Queue all free credits in one worker invocation
> =C2=A0 drm/sched: Embed run queue singleton into the scheduler
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
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
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 131 ++-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 | 146 =
+++-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 548 +++---------
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 221 +++++
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../gpu/drm/scheduler/tests/tests_scheduler.c | 815
> ++++++++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 31 +-
> =C2=A015 files changed, 1396 insertions(+), 565 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.=
c
>=20

