Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA147EFB7A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B18610E775;
	Fri, 17 Nov 2023 22:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFC10E775
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:32:15 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5c08c47c055so27570397b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700260335; x=1700865135; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vO8obQU3c0GbuVAF4lpzfryzwtfaagCOqzEZ8abCgHs=;
 b=bcez0dacEvgaCkSp7gs3QA4j3bPEUXqYpAxUWtrOC4hF0CBNXtMVTBWjP2wopCq/3h
 e9y7EIzBoQMNX41FTjAYbOj53k4sVob5BBPB3OabW+eYn1TLWMVpB365ELVxoSsm/q+L
 Su0irzZ0L9UX/IKGfHBVIBjjq37wOvyH5mIVi7uFzigQXNV1iF9HKSMhGXOiBSYYQ+a9
 Qr5PFfKq++u8aqn8ZcCsctwvOEHx889n4Z7SOdYEjvlRTsMUqBuYqPslV6ZJ390yRoW/
 ueiwMuIfStWzoq8Cq9IebslMxV+NzcUfp95JM2PuyMbkUi3B97CxtEKFYYtvOYVDqxbI
 zs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700260335; x=1700865135;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vO8obQU3c0GbuVAF4lpzfryzwtfaagCOqzEZ8abCgHs=;
 b=fvjGDnhvKz0s8N3qtb4mSdjUasilKgPEw3WYZgnEX6jeQPK56y05Gx4pFKKu9Fc3OE
 sI+cUsvOqL0ckB4O4egjx+eCkhAYj5g2wVKnp5xjhxr3t7+lYVr7Do3tf/SDygx51/dC
 ioMOgucgwNgO3j6SFz7YzAUpC1fWxBlFfesAqK2z5w7fUvrEbXqO9O79W/rl2EUw8lNr
 WlEZj6h1OFpslscJZitHWDwbg0sLbD4FfGFA9TMYAGRsVFj38GYJ3IEG5n7koLWRpEzK
 C/RQh5lg3EzAM5rf216w0PsPbE8JOw8Z1SKshSQLiRFRnRMz0ag3FQGKoz6NGriAWcO3
 s44A==
X-Gm-Message-State: AOJu0YyhOlV9BQ9QOh9RLPdiSRlkX6q113noM5cCTpgkN3yY771npn+y
 H+3o3Bf+6Nqb8R2cNghN1NY=
X-Google-Smtp-Source: AGHT+IHGc/yjVgCI8JSwWVF9P202FbYVtnUW/UQRpu5hoIKZhdFtdRf7Sw1ppDdpLQMBZP5YwvOqCw==
X-Received: by 2002:a0d:ff45:0:b0:577:189b:ad4 with SMTP id
 p66-20020a0dff45000000b00577189b0ad4mr1030432ywf.48.1700260334708; 
 Fri, 17 Nov 2023 14:32:14 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a0df704000000b00559fb950d9fsm738569ywf.45.2023.11.17.14.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 14:32:13 -0800 (PST)
Message-ID: <6f158a9d-3ac2-4b4f-984a-c6616ae1fe0d@gmail.com>
Date: Fri, 17 Nov 2023 17:32:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.3
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dakr@redhat.com, airlied@gmail.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org
References: <20231116141547.206695-1-christian.koenig@amd.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20231116141547.206695-1-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------00rd4o20w6033T9J1YcAWPDX"
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------00rd4o20w6033T9J1YcAWPDX
Content-Type: multipart/mixed; boundary="------------0whFNqY0Buk0PtFT04PEKxSK";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dakr@redhat.com, airlied@gmail.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <6f158a9d-3ac2-4b4f-984a-c6616ae1fe0d@gmail.com>
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
References: <20231116141547.206695-1-christian.koenig@amd.com>
In-Reply-To: <20231116141547.206695-1-christian.koenig@amd.com>

--------------0whFNqY0Buk0PtFT04PEKxSK
Content-Type: multipart/mixed; boundary="------------czgWK42goT5ZfNb9UovN036y"

--------------czgWK42goT5ZfNb9UovN036y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 2023-11-16 09:15, Christian K=C3=B6nig wrote:
> Start to improve the scheduler document. Especially document the
> lifetime of each of the objects as well as the restrictions around
> DMA-fence handling and userspace compatibility.
>=20
> v2: Some improvements suggested by Danilo, add section about error
>     handling.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst           |  36 +++++
>  drivers/gpu/drm/scheduler/sched_main.c | 174 +++++++++++++++++++++----=

>  2 files changed, 188 insertions(+), 22 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rs=
t
> index acc5901ac840..112463fa9f3a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,12 +552,48 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
> =20
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
> =20
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Flow Control
> =20
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>  Scheduler Function References
>  -----------------------------
> =20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 044a8c4875ba..026123497b0e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,28 +24,122 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push j=
obs
> - * into software queues which are then scheduled on a hardware run que=
ue.
> - * The software queues have a priority among them. The scheduler selec=
ts the entities
> - * from the run queue using a FIFO. The scheduler provides dependency =
handling
> - * features among jobs. The driver is supposed to provide callback fun=
ctions for
> - * backend operations to the scheduler like submitting a job to hardwa=
re run queue,
> - * returning the dependencies of a job etc.
> - *
> - * The organisation of the scheduler is the following:
> - *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities=

> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be schedu=
led on
> - *    the hardware.
> - *
> - * The jobs in a entity are always scheduled in the order that they we=
re pushed.
> - *
> - * Note that once a job was taken from the entities queue and pushed t=
o the
> - * hardware, i.e. the pending queue, the entity must not be referenced=
 anymore
> - * through the jobs entity pointer.
> + * The GPU scheduler implements some logic to decide which command sub=
mission
> + * to push next to the hardware. Another major use case of the GPU sch=
eduler

You can't start a 2nd sentence with "Another major use ...", not unless y=
ou'd been
discussing the other major use for at least a few paragraphs, but not aft=
er just
once sentence.

Get rid of "some" in "some logic", and just say "implements logic to ..."=


Then 2nd sentence should say, "The GPU scheduler also enforces correct ..=
=2E"

> + * is to enforce correct driver behavior around those command submissi=
ons.
> + * Because of this it's also used by drivers which don't need the actu=
al
> + * scheduling functionality.
> + *
> + * All callbacks the driver needs to implement are restricted by DMA-f=
ence
> + * signaling rules to guarantee deadlock free forward progress. This e=
specially

"deadlock-free"

Link to "DMA-fence signaling rules" would be nice to have. Can't mention =
them,
and not provide a link. Naturally someone reading this would immediately =
ask themselves,
"What are the ``DMA-fence signaling rules''?", and if they don't need to =
ask themselves
this, then they probably mostly know all of this here too.

> + * means that for normal operation no memory can be allocated in a cal=
lback.

What callback? Perhaps say, "callback into the driver", or name it/them,
as they're in the code.

> + * All memory which is needed for pushing the job to the hardware must=
 be

"pushing _a_ job"

> + * allocated before arming a job. It also means that no locks can be t=
aken
> + * under which memory might be allocated as well.
> + *
> + * Memory which is optional to allocate, for example for device core d=
umping or
> + * debugging, *must* be allocated with GFP_NOWAIT and appropriate erro=
r
> + * handling taking if that allocation fails. GFP_ATOMIC should only be=
 used if
> + * absolutely necessary since dipping into the special atomic reserves=
 is
> + * usually not justified for a GPU driver.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object contains submission dependencies in the form of=
 DMA-fence
> + * objects. Drivers can also implement an optional prepare_job callbac=
k which

Drop "also".

> + * returns additional dependencies as DMA-fence objects. It's importan=
t to note
> + * that this callback can't allocate memory or grab locks under which =
memory is
> + * allocated.

Probably say "that this callback into the driver cannot allocate" for cla=
rity.

> + *
> + * Drivers should use this as base class for an object which contains =
the
> + * necessary state to push the command submission to the hardware.

"this"? The context is lost by this sentence and you should say "Drivers =
should
use the job structure as a base for an object which contains ..."

I'd stray away from using the word "class".

> + *
> + * The lifetime of the job object should at least be from pushing it i=
nto the
> + * scheduler until the scheduler notes through the free callback that =
a job

"the free callback"? Perhaps be more specific here with something like,
"struct drm_sched_backend_jobs::free_job callback".

> + * isn't needed any more. Drivers can of course keep their job object =
alive
> + * longer than that, but that's outside of the scope of the scheduler
> + * component. Job initialization is split into two parts, drm_sched_jo=
b_init()

This "Job initialization is split into ..." needs to start on a new parag=
raph.

> + * and drm_sched_job_arm(). It's important to note that after arming a=
 job

These two functions need to be listed, numeric or alphabetic, something l=
ike,

	Job initialization is split into two parts,
		a) drm_sched_job_init(), which <explain here what it does and
		   why drivers should/would call it and what is expected from them>, an=
d
		b) drm_sched_arm_job(), which <explain here what this does and
		   why drivers should/would call this and what is expected from them>.

> + * drivers must follow the DMA-fence rules and can't easily allocate m=
emory
> + * or takes locks under which memory is allocated.

I wouldn't use contractions for things which are forbidden and would do

s/can't/cannot/g

A link to those "DMA-fence rules" would be helpful.

> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object which is a container for jobs which should execut=
e

Drop "which" globally.
"Container of" not "for".
s/should/generally/

To become this,

	The entity object is a container of jobs which generally execute ...

Still a better way to explain what something _is_, is to start with,

	The entity object represents a context/user process/etc., which generate=
s
	jobs to be executed by the GPU. It holds incoming jobs in its "job_queue=
".
	Entities are generally allowed to run on one or more schedulers via thei=
r
	"sched_list" member.

Something like that.

> + * sequentially. Drivers should create an entity for each individual c=
ontext
> + * they maintain for command submissions which can run in parallel.

Drop "should" to become,
	Drivers create an entity ...

> + *
> + * The lifetime of the entity should *not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush

"their" here would be ambiguous to a first-time reader. Perhaps
clarify that it is the process' file ops.

> + * callback. So it's possible that an entity object is not alive any
> + * more while jobs from it are still running on the hardware.
> + *
> + * Background is that for compatibility reasons with existing

"Background" --> "The reason for this is for compatibility with existing =
=2E.."

> + * userspace all results of a command submission should become visible=

> + * externally even after after a process exits. This is normal POSIX b=
ehavior

Remove one of the "after".

> + * for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain exec=
utable
> + * shaders enabling processes to evade their termination by offloading=
 work to
> + * the GPU. So when a process is terminated with a SIGKILL the entity =
object
> + * makes sure that jobs are freed without running them while still mai=
ntaining
> + * correct sequential order for signaling fences.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a DMA-fence provided by the driver as =
result of
> + * running jobs. Drivers need to make sure that the normal DMA-fence s=
emantics
> + * are followed for this object. It's important to note that the memor=
y for
> + * this object can *not* be allocated in the run_job callback since th=
at would
> + * violate the requirements for the DMA-fence implementation. The sche=
duler
> + * maintains a timeout handler which triggers if this fence doesn't si=
gnal in
> + * a configurable time frame.

"frame" --> "period" or "interval".

It would greatly help to suggest where/how the hw fence should be allocat=
ed,
and give suggestions to drivers.

> + *
> + * The lifetime of this object follows DMA-fence ref-counting rules, t=
he
> + * scheduler takes ownership of the reference returned by the driver a=
nd drops
> + * it when it's not needed any more.

Clarify the callback:
"of the reference returned by the driver in the run_job callback and drop=
s it ..."

"when it's not needed any more" should be clarified since the lifetime is=
 attempted
to be clarified in this paragraph here.

> + */
> +
> +/**
> + * DOC: Scheduler Fence Object

As these all refer to real structs, it would help to name them
in the DOC, as in "struct drm_sched_fence".

> + *
> + * The scheduler fence object which encapsulates the whole time from p=
ushing

See my comments in v1.

Also, "The scheduler fence object, struct drm_sched_fence, ..."
Name it explicitly so that the reader knows exactly which structure it is=
=2E

> + * the job into the scheduler until the hardware has finished processi=
ng it.
> + * This is internally managed by the scheduler, but drivers can grab a=
dditional
> + * reference to it after arming a job. The implementation provides DMA=
-fence
> + * interfaces for signaling both scheduling of a command submission as=
 well as
> + * finishing of processing.

"for signalling both scheduling of a command" is confusing.

I'd probably list them in an alphabetized list, as in
	The drm_sched_fence structure contains two DMA fences,
	a) "scheduled" which is signalled by ..., when ..., and
	b) "finished" which is signalled by ... when ...

> + *
> + * The lifetime of this object also follows normal DMA-fence ref-count=
ing
> + * rules. The finished fence is the one normally exposed outside of th=
e
> + * scheduler, but the driver can grab references to both the scheduled=
 as well
> + * as the finished fence when needed for pipe-lining optimizations.

"as well as" --> "and"

> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects

Perhaps list their names,
struct drm_gpu_scheduler,
struct drm_sched_rq.

> + *
> + * The scheduler object itself does the actual work of selecting a job=
 and
> + * pushing it to the hardware. Both FIFO and RR selection algorithm ar=
e
> + * supported, but FIFO is preferred for many use cases.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Be=
fore
> + * destroying the scheduler the driver must ensure that all hardware p=
rocessing
> + * involving this scheduler object has finished by calling for example=

> + * disable_irq(). It is *not* sufficient to wait for the hardware fenc=
e here
> + * since this doesn't guarantee that all callback processing has finis=
hed.

Perhaps give an alternative of what *is* sufficient, as to give guideline=
s
to driver writers.

> + *
> + * The run queue object is a container of entities for a certain prior=
ity

"for a certain" --> "of a certain"

> + * level. This object is internally managed by the scheduler and drive=
rs
> + * shouldn't touch them directly. The lifetime of run queues are bound=
 to the

"touch it directly"
"is bound to"

> + * schedulers lifetime.
>   */
> =20
>  /**
> @@ -72,6 +166,42 @@
>   * limit.
>   */
> =20
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors schould be signaled by using dma_fence_set_error() on the ha=
rdware

Run this patch through spell-check.

> + * fence object before signaling it. Errors are then bubbled up from t=
he
> + * hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using =
the
> + * drm_sched_entity_error() function which can be used to cancel queue=
d
> + * submissions in the run_job callback as well as preventing pushing f=
urther
> + * ones into the entity in the drivers submission function.
> + *
> + * When the hardware fence fails to signal in a configurable amount of=
 time the
> + * timedout_job callback is issued. The driver should then follow the =
procedure
> + * described on the &struct drm_sched_backend_ops.timedout_job callbac=
k (TODO:
> + * The timeout handler should probably switch to using the hardware fe=
nce as
> + * parameter instead of the job. Otherwise the handling will always ra=
ce
> + * between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting=
 jobs

"scheduler is also used to provide"

> + * with replacing the hardware fence during reset handling. This funct=
ionality
> + * is now marked as deprecated. This has proven to be fundamentally ra=
cy and
> + * not compatible with DMA-fence rules and shouldn't be used in any ne=
w code.
> + *
> + * Additional there is the drm_sched_increase_karma() function which t=
ries to

"In addition," or "Additionally,"

> + * find the entity which submitted a job and increases it's 'karma'
> + * atomic variable to prevent re-submitting jobs from this entity. Thi=
s has
> + * quite some overhead and re-submitting jobs is now marked as depreca=
ted. So
> + * using this function is rather discouraged.

Perhaps add,
	"This function, as well as this 'karma'-business is slated for removal."=


> + *
> + * Drivers can still re-create the GPU state should it be lost during =
timeout
> + * handling when they can guarantee that forward progress is made and =
this
> + * doesn't cause another timeout. But this is strongly hardware specif=
ic and
> + * out of the scope of the general GPU scheduler.
> + */
> +
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>

--=20
Regards,
Luben

--------------czgWK42goT5ZfNb9UovN036y
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------czgWK42goT5ZfNb9UovN036y--

--------------0whFNqY0Buk0PtFT04PEKxSK--

--------------00rd4o20w6033T9J1YcAWPDX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZVfp5AUDAAAAAAAKCRBMFUeUMaM0rxxV
AP9g+KYvbU4zFzov7or3APk5OD2MzyJWHrMbBj6yVddI6gEAimr+BpVTsaaloRVX7KuKXPF/xWmi
JozL51H1w2pxqg0=
=l6QU
-----END PGP SIGNATURE-----

--------------00rd4o20w6033T9J1YcAWPDX--
