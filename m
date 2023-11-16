Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405797EE6F5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37BD10E660;
	Thu, 16 Nov 2023 18:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB1B10E660
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:44:32 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1e9a757e04eso1141457fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700160271; x=1700765071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82orHsgVxlONz5S6Zq++4YPChd1T3L6HqBWEZ3haFUU=;
 b=HpjlY9sDoCkicVEKjoJfXZ9UUQFxp/xLjYRHG8mHbTMBAneSTtG9atZ0poJ6E/UREy
 7ffTaSIfkZDeV8n6PlWd8sRb0Eq3EhMKE0ugeerdxAJQc7M/Qg7RefaWXZkxITNY2ImF
 Pra+G0MwRUgak0+x0vkMXzF1q4so8ityidjw1id9orGWxqDUN2kVcEiybedBrWX9ZUEn
 Ytcd9y5D/owYLjZEcpdSA5JwXu1nphwJ74fmNcbdzYJWNuVHi57QkgM7gX2dWMK8zCFI
 6Lkv3aptCA5UU1+oTl3WBgO3qfj+EQ7fdDnlLFv2pYa1Y7ev8zow2YzZDiHzp7QaZ8ZA
 Z1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700160271; x=1700765071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82orHsgVxlONz5S6Zq++4YPChd1T3L6HqBWEZ3haFUU=;
 b=QKgqaiyM3/HYJs70rs/sT7y9VUlSJKJ8Cc3TuDvDDLNDz4hxDEXLDZbs/VF1re6l1L
 2/aGp9Ucmd0865QSSlAkc9PripLJ7b9KclOmOqe095wkyBLEcFgHdpfqYPHTOz/yI/f/
 LFYAeAicy/9WBvlnRsccLyUX2qxgj+Oegp18djmApz7TaEM+5AG7gycUp+fZUCnbXToy
 0PrLJO7rR3bVKi+g19Ix2ZNmKOEuxq4wtGGL2qfol8Y/PaSncQCwlTG6oqlCMckGYuOl
 NdcQdhNZnNuzOFXyLCDGYiRFFe3dDsNZZeE45mwDM2KZ8cXVr9MSAggDQbZFqiN7yWYD
 1rvQ==
X-Gm-Message-State: AOJu0YzIQABU0JKWFERTVPyePMKQPr/fEgbUIhX/8sbmhJIVzRlltpa6
 nSgdO20Ip7H18lZ98AxrXGbotUue5uqVC3gbTR8=
X-Google-Smtp-Source: AGHT+IETWhIrQmqptrfqLY0hF1+cgVd/4Lenqu8nCEa9vX6gN8Evc0FA4ZP2xHRUCOzfnw30bfzVF+u19tTz7mvIvl4=
X-Received: by 2002:a05:6871:5310:b0:1e9:9546:1dd with SMTP id
 hx16-20020a056871531000b001e9954601ddmr1369252oac.22.1700160271515; Thu, 16
 Nov 2023 10:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20231116141547.206695-1-christian.koenig@amd.com>
In-Reply-To: <20231116141547.206695-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 13:44:20 -0500
Message-ID: <CADnq5_MPGwWr3j3Gj1o87W=30W9-VfdxTonK4AkYVH1JMEKddQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: matthew.brost@intel.com, ltuikov89@gmail.com,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 dakr@redhat.com, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 12:52=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Start to improve the scheduler document. Especially document the
> lifetime of each of the objects as well as the restrictions around
> DMA-fence handling and userspace compatibility.

A few minor grammatical suggestions below.

>
> v2: Some improvements suggested by Danilo, add section about error
>     handling.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst           |  36 +++++
>  drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++----
>  2 files changed, 188 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index acc5901ac840..112463fa9f3a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,12 +552,48 @@ Overview
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
> index 044a8c4875ba..026123497b0e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,122 @@
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
> - *
> - * The organisation of the scheduler is the following:
> - *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be schedule=
d on
> - *    the hardware.
> - *
> - * The jobs in a entity are always scheduled in the order that they were=
 pushed.
> - *
> - * Note that once a job was taken from the entities queue and pushed to =
the
> - * hardware, i.e. the pending queue, the entity must not be referenced a=
nymore
> - * through the jobs entity pointer.
> + * The GPU scheduler implements some logic to decide which command submi=
ssion

s/some//

> + * to push next to the hardware. Another major use case of the GPU sched=
uler

s/use case/feature/

> + * is to enforce correct driver behavior around those command submission=
s.
> + * Because of this it's also used by drivers which don't need the actual

s/it's/it can also/

> + * scheduling functionality.
> + *
> + * All callbacks the driver needs to implement are restricted by DMA-fen=
ce
> + * signaling rules to guarantee deadlock free forward progress. This esp=
ecially

s/especially//

> + * means that for normal operation no memory can be allocated in a callb=
ack.
> + * All memory which is needed for pushing the job to the hardware must b=
e
> + * allocated before arming a job. It also means that no locks can be tak=
en

s/also//

> + * under which memory might be allocated as well.
> + *
> + * Memory which is optional to allocate, for example for device core dum=
ping or
> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate error
> + * handling taking if that allocation fails. GFP_ATOMIC should only be u=
sed if

s/taking/taken/

> + * absolutely necessary since dipping into the special atomic reserves i=
s
> + * usually not justified for a GPU driver.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object contains submission dependencies in the form of D=
MA-fence
> + * objects. Drivers can also implement an optional prepare_job callback =
which
> + * returns additional dependencies as DMA-fence objects. It's important =
to note

s/it's/it is/

> + * that this callback can't allocate memory or grab locks under which me=
mory is
> + * allocated.
> + *
> + * Drivers should use this as base class for an object which contains th=
e

s/this as/this object as/

> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object should at least be from pushing it int=
o the

s/should at least be/should span/

> + * scheduler until the scheduler notes through the free callback that a =
job
> + * isn't needed any more. Drivers can of course keep their job object al=
ive
> + * longer than that, but that's outside of the scope of the scheduler
> + * component. Job initialization is split into two parts, drm_sched_job_=
init()
> + * and drm_sched_job_arm(). It's important to note that after arming a j=
ob

Describe why we have job_init() and job_arm().

> + * drivers must follow the DMA-fence rules and can't easily allocate mem=
ory
> + * or takes locks under which memory is allocated.

s/takes/take/

> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object which is a container for jobs which should execute

s/which//

> + * sequentially. Drivers should create an entity for each individual con=
text
> + * they maintain for command submissions which can run in parallel.
> + *
> + * The lifetime of the entity should *not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush
> + * callback. So it's possible that an entity object is not alive any
> + * more while jobs from it are still running on the hardware.

s/So it's possible that an entity object is not alive any more/It is
possible that an entity may be freed/

> + *
> + * Background is that for compatibility reasons with existing

s/Background is that for/For/

> + * userspace all results of a command submission should become visible
> + * externally even after after a process exits. This is normal POSIX beh=
avior

s/after after/after/

> + * for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain execut=
able
> + * shaders enabling processes to evade their termination by offloading w=
ork to
> + * the GPU. So when a process is terminated with a SIGKILL the entity ob=
ject

s/The problem with this approach is that GPU submissions contain
executable shaders enabling processes to evade their termination by
offloading work to the GPU/
GPU submissions contain work executing on the GPU which leaves an
aspect of the process behind even after process termination/

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

s/It's/It is/

> + * this object can *not* be allocated in the run_job callback since that=
 would
> + * violate the requirements for the DMA-fence implementation. The schedu=
ler
> + * maintains a timeout handler which triggers if this fence doesn't sign=
al in
> + * a configurable time frame.
> + *
> + * The lifetime of this object follows DMA-fence ref-counting rules, the
> + * scheduler takes ownership of the reference returned by the driver and=
 drops
> + * it when it's not needed any more.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object which encapsulates the whole time from pus=
hing

s/which//

> + * the job into the scheduler until the hardware has finished processing=
 it.
> + * This is internally managed by the scheduler, but drivers can grab add=
itional
> + * reference to it after arming a job. The implementation provides DMA-f=
ence
> + * interfaces for signaling both scheduling of a command submission as w=
ell as
> + * finishing of processing.
> + *
> + * The lifetime of this object also follows normal DMA-fence ref-countin=
g
> + * rules. The finished fence is the one normally exposed outside of the
> + * scheduler, but the driver can grab references to both the scheduled a=
s well
> + * as the finished fence when needed for pipe-lining optimizations.

s/pipe-lining/pipelining/

> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself does the actual work of selecting a job a=
nd

s/itself//

> + * pushing it to the hardware. Both FIFO and RR selection algorithm are

s/FIFO and RR selection algorithm/FIFO and Round Robin (RR) selection
algorithms/

> + * supported, but FIFO is preferred for many use cases.

s/is preferred for many use cases/is the default and preferred for
most use cases/

> + *
> + * The lifetime of the scheduler is managed by the driver using it. Befo=
re
> + * destroying the scheduler the driver must ensure that all hardware pro=
cessing

s/scheduler the/scheduler, the/

> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence =
here
> + * since this doesn't guarantee that all callback processing has finishe=
d.

I'm not quite sure what you are trying to say here.  I think the idea
is that the driver must wait for all signalling mechanisms (IRQ
handlers, callbacks, etc.) that might need access to the scheduler
object.

> + *
> + * The run queue object is a container of entities for a certain priorit=
y
> + * level. This object is internally managed by the scheduler and drivers

s/This object is/These objects are

> + * shouldn't touch them directly. The lifetime of run queues are bound t=
o the
> + * schedulers lifetime.
>   */
>
>  /**
> @@ -72,6 +166,42 @@
>   * limit.
>   */
>
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors schould be signaled by using dma_fence_set_error() on the hard=
ware

s/schould/should/

> + * fence object before signaling it. Errors are then bubbled up from the
> + * hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using th=
e
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in the run_job callback as well as preventing pushing fur=
ther

s/further/additional/

> + * ones into the entity in the drivers submission function.

s/ones/jobs/
s/drivers/driver's/

> + *
> + * When the hardware fence fails to signal in a configurable amount of t=
ime the
> + * timedout_job callback is issued. The driver should then follow the pr=
ocedure
> + * described on the &struct drm_sched_backend_ops.timedout_job callback =
(TODO:
> + * The timeout handler should probably switch to using the hardware fenc=
e as
> + * parameter instead of the job. Otherwise the handling will always race
> + * between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting j=
obs

s/The scheduler also used to provided/NOTE: The scheduler used to provide/

> + * with replacing the hardware fence during reset handling. This functio=
nality

s/with replacing/while replacing/

> + * is now marked as deprecated. This has proven to be fundamentally racy=
 and
> + * not compatible with DMA-fence rules and shouldn't be used in any new =
code.
> + *
> + * Additional there is the drm_sched_increase_karma() function which tri=
es to

s/Additional/Additionally, /

> + * find the entity which submitted a job and increases it's 'karma'

s/it's/its/

> + * atomic variable to prevent re-submitting jobs from this entity. This =
has
> + * quite some overhead and re-submitting jobs is now marked as deprecate=
d. So
> + * using this function is rather discouraged.

s/rather//

> + *
> + * Drivers can still re-create the GPU state should it be lost during ti=
meout
> + * handling when they can guarantee that forward progress is made and th=
is
> + * doesn't cause another timeout. But this is strongly hardware specific=
 and

s/doesn't/will not/

> + * out of the scope of the general GPU scheduler.
> + */
> +
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> --
> 2.34.1
>
