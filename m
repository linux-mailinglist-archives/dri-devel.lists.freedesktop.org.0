Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CFBA2200D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 16:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3010E817;
	Wed, 29 Jan 2025 15:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ezj6H8Xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7927010E0EC;
 Wed, 29 Jan 2025 15:18:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Yjm5G74KNz9tGG;
 Wed, 29 Jan 2025 16:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1738163923; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHBV99Q6sz+yPfAf4d2csh0Uat+UJb0v4dpSeawHhlM=;
 b=Ezj6H8XvfTw4yJB2ka/sU++C7x1qpjmKNN7oAGHzo1jpSXEVMmRwwIlIY9tFg75oCe+GLR
 mVYGvMcBYxviYQN3KFYJz+LmJZOU5lMia3ur4GgBWFm/EQRqpPC1WW4qVNJ3y0iVRIS4gI
 Dkion5qaslP+NYVpzjNG/euId2WaJO3UDXYUGBjOHKPD08lgDQfnHcDUgGPbndf13/RYvE
 YzC6PTjM9hbb/tY9+NI7Dtt9j+RQlR6QS8IuWVIAgW1jqihUDY7HEwZ2hceGNX2sCsg4Ty
 CfQvjCIkoea0KOqWmv31YnX0nFQiJ74xZYTmARyqJuHE4j47Fwj6UMOpbS/oLw==
Message-ID: <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@redhat.com>, Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>,  Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,  Lijo
 Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang
 Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 16:18:30 +0100
In-Reply-To: <Z5jwD0DxNrMdo-q8@pollux>
References: <20250128142927.103290-2-phasta@kernel.org>
 <Z5jwD0DxNrMdo-q8@pollux>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 503993226b418d66387
X-MBO-RS-META: x73y1msajusiumr38kf8wqyrmtupf4cm
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

On Tue, 2025-01-28 at 15:56 +0100, Danilo Krummrich wrote:
> On Tue, Jan 28, 2025 at 03:29:27PM +0100, Philipp Stanner wrote:
> > drm_sched_init() has a great many parameters and upcoming new
> > functionality for the scheduler might add even more. Generally, the
> > great number of parameters reduces readability and has already
> > caused
> > one missnaming in:
> >=20
> > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > nouveau_sched_init()").
> >=20
> > Introduce a new struct for the scheduler init parameters and port
> > all
> > users.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Changes in v2:
> > =C2=A0 - Point out that the hang-limit is deprecated. (Christian)
> > =C2=A0 - Initialize the structs to 0 at declaration. (Planet Earth)
> > =C2=A0 - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
> > =C2=A0 - Make the structs const where possible. (Boris)
> > =C2=A0 - v3d: Use just 1, universal, function for sched-init. (Ma=C3=AD=
ra)
> > ---
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
> > =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 | 20 ++=
+----
> > =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 | 18 ++=
++--
> > =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> > =C2=A0drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 17 +++---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 | 15 ++=
+--
> > =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 | 20 ++=
++---
> > =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 +++--
> > =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 | 29 ++=
+++----
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
50 ++++++----------
> > =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68 +++++++++---------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 17 +++++-
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++--
> > =C2=A014 files changed, 206 insertions(+), 151 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 4412f2711fb5..b5aac8eebfdd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0{
> > =C2=A0	struct drm_gpu_scheduler *drm_sched =3D &sched->base;
> > =C2=A0	struct drm_sched_entity *entity =3D &sched->entity;
> > -	const long timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > +	const struct drm_sched_init_args args =3D {
> > +		.ops =3D &nouveau_sched_ops,
> > +		.submit_wq =3D wq,
> > +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> > +		.credit_limit =3D credit_limit,
> > +		.timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> > +		.name =3D "nouveau_sched",
> > +		.dev =3D drm->dev->dev
> > +	};
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (!wq) {
> > @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0		sched->wq =3D wq;

Do you want it set here=20

args.submit_wq =3D wq;

or below, outside the if-block? Should be the same AFAICS


>=20
> This change breaks Nouveau, you need to set args.submit_wq here as
> well.

I overlooked the allocation below.


P.

>=20
> > =C2=A0	}
> > =C2=A0
> > -	ret =3D drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_SCHED_PRIORITY_COUNT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 credit_limit, 0, timeout,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, "nouveau_sched", drm-
> > >dev->dev);
> > +	ret =3D drm_sched_init(drm_sched, &args);
> > =C2=A0	if (ret)
> > =C2=A0		goto fail_wq;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 5844a7f639e0..44713cfdcd74 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3284,6 +3284,22 @@ static struct panthor_queue *
> > =C2=A0group_create_queue(struct panthor_group *group,
> > =C2=A0		=C2=A0=C2=A0 const struct drm_panthor_queue_create *args)
> > =C2=A0{
> > +	const struct drm_sched_init_args sched_args =3D {
> > +		.ops =3D &panthor_queue_sched_ops,
> > +		.submit_wq =3D group->ptdev->scheduler->wq,
> > +		.num_rqs =3D 1,
> > +		/*
> > +		 * The credit limit argument tells us the total
> > number of
> > +		 * instructions across all CS slots in the
> > ringbuffer, with
> > +		 * some jobs requiring twice as many as others,
> > depending on
> > +		 * their profiling status.
> > +		 */
> > +		.credit_limit =3D args->ringbuf_size / sizeof(u64),
> > +		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > +		.timeout_wq =3D group->ptdev->reset.wq,
> > +		.name =3D "panthor-queue",
> > +		.dev =3D group->ptdev->base.dev
> > +	};
> > =C2=A0	struct drm_gpu_scheduler *drm_sched;
> > =C2=A0	struct panthor_queue *queue;
> > =C2=A0	int ret;
> > @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0	if (ret)
> > =C2=A0		goto err_free_queue;
> > =C2=A0
> > -	/*
> > -	 * Credit limit argument tells us the total number of
> > instructions
> > -	 * across all CS slots in the ringbuffer, with some jobs
> > requiring
> > -	 * twice as many as others, depending on their profiling
> > status.
> > -	 */
> > -	ret =3D drm_sched_init(&queue->scheduler,
> > &panthor_queue_sched_ops,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size / sizeof(u64),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group->ptdev-
> > >base.dev);
> > +
>=20
> This creates two empty lines.
>=20
> > +	ret =3D drm_sched_init(&queue->scheduler, &sched_args);
> > =C2=A0	if (ret)
> > =C2=A0		goto err_free_queue;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index a48be16ab84f..6295b2654a7c 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0 * drm_sched_init - Init a gpu scheduler instance
> > =C2=A0 *
> > =C2=A0 * @sched: scheduler instance
> > - * @ops: backend operations for this scheduler
> > - * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > - *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > - * @num_rqs: number of runqueues, one for each priority, up to
> > DRM_SCHED_PRIORITY_COUNT
> > - * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > - * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > - * @timeout: timeout value in jiffies for the scheduler
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > - *		used
> > - * @score: optional score atomic shared with other schedulers
> > - * @name: name used for debugging
> > - * @dev: target &struct device
> > + * @args: scheduler initialization arguments
> > =C2=A0 *
> > =C2=A0 * Return 0 on success, otherwise error code.
> > =C2=A0 */
> > -int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev)
> > +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct
> > drm_sched_init_args *args)
> > =C2=A0{
> > =C2=A0	int i;
> > =C2=A0
> > -	sched->ops =3D ops;
> > -	sched->credit_limit =3D credit_limit;
> > -	sched->name =3D name;
> > -	sched->timeout =3D timeout;
> > -	sched->timeout_wq =3D timeout_wq ? : system_wq;
> > -	sched->hang_limit =3D hang_limit;
> > -	sched->score =3D score ? score : &sched->_score;
> > -	sched->dev =3D dev;
> > +	sched->ops =3D args->ops;
> > +	sched->credit_limit =3D args->credit_limit;
> > +	sched->name =3D args->name;
> > +	sched->timeout =3D args->timeout;
> > +	sched->timeout_wq =3D args->timeout_wq ? : system_wq;
> > +	sched->hang_limit =3D args->hang_limit;
> > +	sched->score =3D args->score ? args->score : &sched->_score;
> > +	sched->dev =3D args->dev;
> > =C2=A0
> > -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > +	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > =C2=A0		/* This is a gross violation--tell drivers what
> > the=C2=A0 problem is.
> > =C2=A0		 */
> > =C2=A0		drm_err(sched, "%s: num_rqs cannot be greater than
> > DRM_SCHED_PRIORITY_COUNT\n",
> > @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0		return 0;
> > =C2=A0	}
> > =C2=A0
> > -	if (submit_wq) {
> > -		sched->submit_wq =3D submit_wq;
> > +	if (args->submit_wq) {
> > +		sched->submit_wq =3D args->submit_wq;
> > =C2=A0		sched->own_submit_wq =3D false;
> > =C2=A0	} else {
> > =C2=A0#ifdef CONFIG_LOCKDEP
> > -		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(name,
> > +		sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(args->name,
> > =C2=A0								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 WQ_MEM_RECLAIM,
> > =C2=A0								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> > =C2=A0#else
> > -		sched->submit_wq =3D alloc_ordered_workqueue(name,
> > WQ_MEM_RECLAIM);
> > +		sched->submit_wq =3D alloc_ordered_workqueue(args-
> > >name, WQ_MEM_RECLAIM);
> > =C2=A0#endif
> > =C2=A0		if (!sched->submit_wq)
> > =C2=A0			return -ENOMEM;
> > @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0		sched->own_submit_wq =3D true;
> > =C2=A0	}
> > =C2=A0
> > -	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> > >sched_rq),
> > +	sched->sched_rq =3D kmalloc_array(args->num_rqs,
> > sizeof(*sched->sched_rq),
> > =C2=A0					GFP_KERNEL | __GFP_ZERO);
> > =C2=A0	if (!sched->sched_rq)
> > =C2=A0		goto Out_check_own;
> > -	sched->num_rqs =3D num_rqs;
> > +	sched->num_rqs =3D args->num_rqs;
> > =C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > i++) {
> > =C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> > >sched_rq[i]), GFP_KERNEL);
> > =C2=A0		if (!sched->sched_rq[i])
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index a8c416a48812..db1c52dcf1a6 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops
> > drm_sched_ops =3D {
> > =C2=A0static int execlist_exec_queue_init(struct xe_exec_queue *q)
> > =C2=A0{
> > =C2=A0	struct drm_gpu_scheduler *sched;
> > +	const struct drm_sched_init_args args =3D {
> > +		.ops =3D &drm_sched_ops,
> > +		.num_rqs =3D 1,
> > +		.credit_limit =3D q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > +		.hang_limit =3D XE_SCHED_HANG_LIMIT,
> > +		.timeout =3D XE_SCHED_JOB_TIMEOUT,
> > +		.name =3D q->hwe->name,
> > +		.dev =3D gt_to_xe(q->gt)->drm.dev
> > +	};
> > =C2=A0	struct xe_execlist_exec_queue *exl;
> > =C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> > =C2=A0	int err;
> > @@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct
> > xe_exec_queue *q)
> > =C2=A0
> > =C2=A0	exl->q =3D q;
> > =C2=A0
> > -	err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 XE_SCHED_HANG_LIMIT,
> > XE_SCHED_JOB_TIMEOUT,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, q->hwe->name,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0 gt_to_xe(q->gt)->drm.dev);
> > +
>=20
> Two empty lines here as well.
>=20
> > +	err =3D drm_sched_init(&exl->sched, &args);
> > =C2=A0	if (err)
> > =C2=A0		goto err_free;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 50361b4638f9..be95f4cca007 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -63,13 +63,24 @@ int xe_sched_init(struct xe_gpu_scheduler
> > *sched,
> > =C2=A0		=C2=A0 atomic_t *score, const char *name,
> > =C2=A0		=C2=A0 struct device *dev)
> > =C2=A0{
> > +	const struct drm_sched_init_args args =3D {
> > +		.ops =3D ops,
> > +		.submit_wq =3D submit_wq,
> > +		.num_rqs =3D 1,
> > +		.credit_limit =3D hw_submission,
> > +		.hang_limit =3D hang_limit,
> > +		.timeout =3D timeout,
> > +		.timeout_wq =3D timeout_wq,
> > +		.score =3D score,
> > +		.name =3D name,
> > +		.dev =3D dev
> > +	};
> > +
> > =C2=A0	sched->ops =3D xe_ops;
> > =C2=A0	INIT_LIST_HEAD(&sched->msgs);
> > =C2=A0	INIT_WORK(&sched->work_process_msg,
> > xe_sched_process_msg_work);
> > =C2=A0
> > -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
> > hw_submission,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hang_limit, timeout, timeout_wq,
> > score, name,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> > +	return drm_sched_init(&sched->base, &args);
> > =C2=A0}
> > =C2=A0
> > =C2=A0void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index a0ff08123f07..f0f5435598a8 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
> > =C2=A0	struct device			*dev;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct drm_sched_init_args - parameters for initializing a DRM
> > GPU scheduler
> > + *
> > + * @ops: backend operations provided by the driver
> > + * @submit_wq: workqueue to use for submission. May be NULL.
> > + *	If NULL, an ordered wq is allocated and used.
> > + * @num_rqs: Number of run-queues. This may be at most
> > DRM_SCHED_PRIORITY_COUNT,
> > + *	as there's usually one run-queue per priority, but may be
> > less.
> > + * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > + * @hang_limit: number of times to allow a job to hang before
> > dropping it.
> > + *	This mechanism is DEPRECATED. Set it to 0.
> > + * @timeout: timeout value in jiffies for the scheduler
> > + * @timeout_wq: workqueue to use for timeout work. May be NULL.
> > + *	If NULL, the system_wq is used.
> > + * @score: score atomic shared with other schedulers. May be NULL.
> > + * @name: name used for debugging
> > + * @dev: associated device. Used for debugging
> > + */
>=20
> This is weirdly formatted. Please align line breaks with the
> corresponding
> number of spaces.
>=20
> > +struct drm_sched_init_args {
> > +	const struct drm_sched_backend_ops *ops;
> > +	struct workqueue_struct *submit_wq;
> > +	struct workqueue_struct *timeout_wq;
> > +	u32 num_rqs;
> > +	u32 credit_limit;
> > +	unsigned int hang_limit;
> > +	long timeout;
> > +	atomic_t *score;
> > +	const char *name;
> > +	struct device *dev;
> > +};
> > +
> > =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev);
> > +		const struct drm_sched_init_args *args);
> > =C2=A0
> > =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched);
> > =C2=A0int drm_sched_job_init(struct drm_sched_job *job,
> > --=20
> > 2.47.1
> >=20
>=20

