Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CC9D5073
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 17:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4490C10E9B1;
	Thu, 21 Nov 2024 16:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HvUnsxGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C7310E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 16:05:49 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so8966755e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1732205147; x=1732809947;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEAaIFollmGbkAyp3AHhRVP5SIOvpa6F1CuzSDWZFfM=;
 b=HvUnsxGukdqf8a1SzhiYeGo/D6OK3YitR4t7dtZF4T1r0/h4SxIwYo67gMJVaOFjqf
 sEKWEX3BgQhYqV6qL6gEjODnxjdbUH9gv7bIe+HAu78Itr7R/IPm3av68aZ9wHAX/3rM
 EEoMcE/k3Qj1sV7X3XM5k6JkqZyEJeiLWPxaCLqJQU/MApLh2IHFwuATT9RhQN1J08j0
 j18gX3ChhKpJn/MY5/GKmBa61JnTMB4up7g7XXVpShvyiY2KA9oJmcWqop6QZeelwvuV
 qvwlYnwubMe7S59dRA5v6yYINLCs/vJb8ld6a7/5N/ZShQnm/NypmZcQEjCiBdf4UfX9
 W6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732205147; x=1732809947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEAaIFollmGbkAyp3AHhRVP5SIOvpa6F1CuzSDWZFfM=;
 b=T9hgC1ZwFKYlwNxLkVphhGBrj0gdN6sLIhijW5s5hMk1io+4jzF3VkI+wjIe4SYt4G
 YskNYIyyYMCOInNK51e4qSz1eZjPYue8cwek//REGkm0eOWnrREevgY8o4JHIV+tpIGC
 YiNlt45FCcjaUxJgWfG0iFOXT+HuMkBcuy474cgJowBQJGbJuKWLoWfZHZA0QNKykGVz
 0pxVC3vxWG3nVW1xGVtEd7LaLmYsyo1yaMWA0367SXBfGJGzQy+Ix7D8wTH6TyTjBeKT
 N+dC2wmsESfsiPhNjB/OyDGrmdc9WRV4O1NzD6wkltOa/iJZ03HFjGJsa5nocgKHGXAc
 yqaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8qzzieC4TIXzoodHqGadyUYcR6VskEusO+KwZIqSjVEY0FENuhPbj+4zsSAx4ys6lpIQWv6U38SU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgiZSJ/ozm9DPUGQWTQ9UAeHlfboCGwUci2eF/STVIZUY/lSKE
 XgGO6oGuumtntJBykIPcATArLHefSAEF+dBS+QiM/BMNGUDRw6D3EElD1DF2Mw4Ny58dP5ZPe9i
 vd/M9TxK80CP2xTZbQqTj7iyNyot1EDSoZv2t
X-Gm-Gg: ASbGncv5Gntwvz4GH7vzX+a/+lbOEDxAzgk59Du2L5c6CaAuCtt7sVJuJlsesumDK1+
 OnkYsMozNB1hhHDW+Ne4XuOeLNCGjQYeglBsxzidRyJaDknpf15ROkS8h9NuyhQ==
X-Google-Smtp-Source: AGHT+IGmNqvNXb2DSqa03STb7qfR1tFxwoMJdZnTGvCUv2SFAeidQb5w5dsrd1AhJ92533DrXXthWiLaMUqXQW4DGSk=
X-Received: by 2002:a05:6000:184f:b0:382:45e7:9bb9 with SMTP id
 ffacd0b85a97d-38254b1f2abmr5347282f8f.54.1732205146402; Thu, 21 Nov 2024
 08:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20241115103548.90605-2-pstanner@redhat.com>
In-Reply-To: <20241115103548.90605-2-pstanner@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 17:05:34 +0100
Message-ID: <CAH5fLghFVxYUz0PRKq3_xsvaYpaaCGXBg9AOUnkYfiUpo70dTg@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: Philipp Stanner <pstanner@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Luben Tuikov <ltuikov89@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Nov 15, 2024 at 11:36=E2=80=AFAM Philipp Stanner <pstanner@redhat.c=
om> wrote:
>
> The various objects defined and used by the GPU scheduler are currently
> not fully documented. Furthermore, there is no documentation yet
> informing drivers about how they should handle timeouts.
>
> Add documentation describing the scheduler's objects and timeout
> procedure. Consistently, update drm_sched_backend_ops.timedout_job()'s
> documentation.
>
> Co-developed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> I shamelessly stole- ahm, borrowed this documentation patch that
> Christian had submitted a year ago:
>
> https://lore.kernel.org/dri-devel/20231116141547.206695-1-christian.koeni=
g@amd.com/
>
> I took feedback from last year into account where applicable, but it's
> probably a good idea if you all take a close look again.
>
> P.
> ---
>  Documentation/gpu/drm-mm.rst           |  36 +++++
>  drivers/gpu/drm/scheduler/sched_main.c | 200 ++++++++++++++++++++++---
>  include/drm/gpu_scheduler.h            |  16 +-
>  3 files changed, 225 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
>
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler and Run Queue Objects
> +
>  Flow Control
>  ------------
>
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Flow Control
>
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>  Scheduler Function References
>  -----------------------------
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index e97c6c60bc96..76eb46281985 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,155 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push job=
s
> - * into software queues which are then scheduled on a hardware run queue=
.
> - * The software queues have a priority among them. The scheduler selects=
 the entities
> - * from the run queue using a FIFO. The scheduler provides dependency ha=
ndling
> - * features among jobs. The driver is supposed to provide callback funct=
ions for
> - * backend operations to the scheduler like submitting a job to hardware=
 run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is shared infrastructure intended to help drivers m=
anaging
> + * command submission to their hardware.
>   *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with=
 the
> + * driver through callbacks which the latter can register.
>   *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be schedule=
d on
> - *    the hardware.
> + * In particular, the scheduler takes care of:
> + *   - Ordering command submissions
> + *   - Signalling DMA fences, e.g., for finished commands
> + *   - Taking dependencies between command submissions into account
> + *   - Handling timeouts for command submissions

For the signalling case, you say "e.g.". Does that mean it also
signals DMA fences in other cases?

> - * The jobs in a entity are always scheduled in the order that they were=
 pushed.
> + * All callbacks the driver needs to implement are restricted by DMA-fen=
ce
> + * signaling rules to guarantee deadlock free forward progress. This esp=
ecially
> + * means that for normal operation no memory can be allocated in a callb=
ack.
> + * All memory which is needed for pushing the job to the hardware must b=
e
> + * allocated before arming a job. It also means that no locks can be tak=
en
> + * under which memory might be allocated as well.
>   *
> - * Note that once a job was taken from the entities queue and pushed to =
the
> - * hardware, i.e. the pending queue, the entity must not be referenced a=
nymore
> - * through the jobs entity pointer.
> + * Memory which is optional to allocate, for example for device core dum=
ping or
> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate error
> + * handling if that allocation fails. GFP_ATOMIC should only be used if
> + * absolutely necessary since dipping into the special atomic reserves i=
s
> + * usually not justified for a GPU driver.
> + *
> + * Note especially the following about the scheduler's historic backgrou=
nd that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N entities share one scheduler, and the scheduler d=
ecides
> + * which job to pick from which entity and move it to the hardware ring =
next
> + * (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary n=
umber
> + * of hardware rings and it's a firmware scheduler which actually decide=
s which
> + * job will run next. In such setups, the GPU scheduler is still used (e=
.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore.=
 It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In =
such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object (drm_sched_job) contains submission dependencies =
in the
> + * form of DMA-fence objects. Drivers can also implement an optional
> + * prepare_job callback which returns additional dependencies as DMA-fen=
ce
> + * objects. It's important to note that this callback can't allocate mem=
ory or
> + * grab locks under which memory is allocated.
> + *
> + * Drivers should use this as base class for an object which contains th=
e
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting=
 it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has i=
nvoked
> + * drm_sched_backend_ops.free_job() and, thereby, has indicated that it =
does
> + * not need the job anymore. Drivers can of course keep their job object=
 alive
> + * for longer than that, but that's outside of the scope of the schedule=
r
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job=
.
> + *      Drivers don't have to be mindful of this function's consequences=
 and
> + *      its effects can be reverted through drm_sched_job_cleanup().
> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. =
This
> + *      activates the job's fence, i.e., it registers the callbacks. Thu=
s,
> + *      inevitably, the callbacks will access the job and its memory at =
some
> + *      point in the future. This means that once drm_sched_job_arm() ha=
s been
> + *      called, the job structure has to be valid until the scheduler in=
voked
> + *      drm_sched_backend_ops.free_job().

This is written as-if there could be multiple callbacks in a single
job. Is that the case?

Also typo: "invoked" -> "invokes".

> + * It's important to note that after arming a job drivers must follow th=
e
> + * DMA-fence rules and can't easily allocate memory or takes locks under=
 which
> + * memory is allocated.

comma? "job, drivers"
typo: "or takes" -> "or take"

> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (drm_sched_entity) which is a container for jobs wh=
ich
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can ru=
n in
> + * parallel.

This is a bit awkward, how about: "The entity object is a container
for jobs that should execute sequentially."

> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardwa=
re.

To be clear ... this is about not letting processes run code after
dying, and not because something you're using gets freed after
flush(), correct?

> + * This is done because all results of a command submission should becom=
e
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain execut=
able
> + * shaders enabling processes to evade their termination by offloading w=
ork to
> + * the GPU. So when a process is terminated with a SIGKILL the entity ob=
ject
> + * makes sure that jobs are freed without running them while still maint=
aining
> + * correct sequential order for signaling fences.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a DMA-fence provided by the driver as re=
sult of
> + * running jobs. Drivers need to make sure that the normal DMA-fence sem=
antics
> + * are followed for this object. It's important to note that the memory =
for
> + * this object can *not* be allocated in drm_sched_backend_ops.run_job()=
 since
> + * that would violate the requirements for the DMA-fence implementation.=
 The
> + * scheduler maintains a timeout handler which triggers if this fence do=
esn't
> + * signal within a configurable amount of time.
> + *
> + * The lifetime of this object follows DMA-fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (drm_sched_fence) which encapsulates the w=
hole
> + * time from pushing the job into the scheduler until the hardware has f=
inished
> + * processing it. This is internally managed by the scheduler, but drive=
rs can
> + * grab additional reference to it after arming a job. The implementatio=
n
> + * provides DMA-fence interfaces for signaling both scheduling of a comm=
and
> + * submission as well as finishing of processing.

typo: "an additional reference" or "additional references"

> + * The lifetime of this object also follows normal DMA-fence refcounting=
 rules.
> + * The finished fence is the one normally exposed to the outside world, =
but the
> + * driver can grab references to both the scheduled as well as the finis=
hed
> + * fence when needed for pipelining optimizations.

When you refer to the "scheduled fence" and the "finished fence",
these are referring to "a fence indicating when the job was scheduled
/ finished", rather than "a fence which was scheduled for execution
and has now become finished", correct? I think the wording could be a
bit clearer here.

Alice
