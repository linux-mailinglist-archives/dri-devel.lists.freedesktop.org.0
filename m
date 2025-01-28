Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E56A20C62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 15:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F44010E677;
	Tue, 28 Jan 2025 14:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S7PGHln4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2632810E67D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738076181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyY0oAZptbHzY22xeUFXI+duf4ILxw1MXfvQR77MqxY=;
 b=S7PGHln4TxYIQE8Z1vCRTjcCW/4uRlp/2bcMcOgYK5WOjFrA2scJ6ArSe4R1sTpPS2ZuaR
 BP+v9hLZ1obbxusEHNJgaUR/oubVsN566oPzIzvBGnwi1Fkhn+WQrTVQ5vvrWf1LCVuE23
 zRKv+22jxpj4Gf/CRVXXz6h/mJpJjV8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-B_ZX4dX0Op-nj8LEoH2PCA-1; Tue, 28 Jan 2025 09:56:20 -0500
X-MC-Unique: B_ZX4dX0Op-nj8LEoH2PCA-1
X-Mimecast-MFC-AGG-ID: B_ZX4dX0Op-nj8LEoH2PCA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385d7611ad3so3123092f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 06:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738076179; x=1738680979;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JyY0oAZptbHzY22xeUFXI+duf4ILxw1MXfvQR77MqxY=;
 b=qzFDqDO4RXdeC40ZM3tNuQH8qA0Gzv5VzvUgEi5MsAvD8MoW/MzhidlJNJj2wgRyc9
 5qNHMgGJyjA/6jl9+xCgJA8Sf8Ecqx0T7BT7evKxhdVbF8vHMq+/CH24WO0mMP9l5ziK
 JgKgUQR0AB65gxxH8YAqH7WDrEQYo+qGvXw5RhYoxydfPt6BEqpEuE5KshMhhD/xqpC+
 gOkEoSErFe1p+AEaSWURAvmxwvxCbe+L9Lb24sIPZDHpBGpDKN0gFYdUPjAinjm8UF4r
 3iZ0S4A0DlxBeMlLVwF9NjimwxGkMSyNdP87JYiimnghfimkP2QJfjSui0khaj229amG
 2V4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3UDfY/uFe7bJEeZ8E/tMlLUwxU0xVspejx4m47pg+9CKR+hYrsLu+aE6d08H5txv/ujc0d8K8gq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6Vlbll824syP8BRkw56lvRw366PPtD0J8KIjlT6AnhBi3HcN8
 EkzgvSgHXKf58g89ejeOdjv9d6N0uGJ2Wi3koVvzatx87d7IHQfFPbhuFZACQUS0SlNZ0YF9lW8
 UjYgsq5fPCBxEE31Gu8f6Xv5nREF1jxB4ayfDJgU55flOKWl+nxVnALI2FcIz3y3gJA==
X-Gm-Gg: ASbGnctjCNNRs+uJ8d1vYue3vRd8oOxR4COdhwSHxFjq6Rz7UmTKRJ3XXe9z+0aKvq7
 xFPKcUWA+S6TQ/pJRyqDPpVnxosQoeRC9BL2KgmhsWGsRcZ3TLvnZgZ+YVLwko14WJ3PJDNPBRN
 MO4u7al94ZNYY7aahW5DSeUOsBTtHaedOaaYC5K0aicPFvaSWwkXAIyoKG1f/jA+JYUtbc66kIm
 SKc/ab2wf8CecTXlyhI8ljj+qNnpK+xCLx3WQMnecRnIj1+BBBtQ3y7ZQiL1OPGlWI2kw==
X-Received: by 2002:a5d:64a1:0:b0:385:ddd2:6ab7 with SMTP id
 ffacd0b85a97d-38bf57d3802mr39827217f8f.52.1738076179019; 
 Tue, 28 Jan 2025 06:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKtrd6jiCos5KSLcpnfjZCje1+t6NcoTUK7GlIGkHjSuKlfloFFwkqMQuE9zzZr8POUgbRcg==
X-Received: by 2002:a5d:64a1:0:b0:385:ddd2:6ab7 with SMTP id
 ffacd0b85a97d-38bf57d3802mr39827179f8f.52.1738076178458; 
 Tue, 28 Jan 2025 06:56:18 -0800 (PST)
Received: from pollux ([2a00:79c0:600:2c00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1baf65sm14593746f8f.64.2025.01.28.06.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 06:56:17 -0800 (PST)
Date: Tue, 28 Jan 2025 15:56:15 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5jwD0DxNrMdo-q8@pollux>
References: <20250128142927.103290-2-phasta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WxS9r5DgQ7CsgOTK0zr7PpgmKYB9lxVFAX72XMzzONY_1738076179
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Tue, Jan 28, 2025 at 03:29:27PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Point out that the hang-limit is deprecated. (Christian)
>   - Initialize the structs to 0 at declaration. (Planet Earth)
>   - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>   - Make the structs const where possible. (Boris)
>   - v3d: Use just 1, universal, function for sched-init. (Maíra)
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>  drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>  drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>  drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>  drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>  drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>  drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>  drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>  include/drm/gpu_scheduler.h                | 37 ++++++++++--
>  14 files changed, 206 insertions(+), 151 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 4412f2711fb5..b5aac8eebfdd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  {
>  	struct drm_gpu_scheduler *drm_sched = &sched->base;
>  	struct drm_sched_entity *entity = &sched->entity;
> -	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +	const struct drm_sched_init_args args = {
> +		.ops = &nouveau_sched_ops,
> +		.submit_wq = wq,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = credit_limit,
> +		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> +		.name = "nouveau_sched",
> +		.dev = drm->dev->dev
> +	};
>  	int ret;
>  
>  	if (!wq) {
> @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  		sched->wq = wq;

This change breaks Nouveau, you need to set args.submit_wq here as well.

>  	}
>  
> -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> -			     NOUVEAU_SCHED_PRIORITY_COUNT,
> -			     credit_limit, 0, timeout,
> -			     NULL, NULL, "nouveau_sched", drm->dev->dev);
> +	ret = drm_sched_init(drm_sched, &args);
>  	if (ret)
>  		goto fail_wq;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5844a7f639e0..44713cfdcd74 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3284,6 +3284,22 @@ static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
>  		   const struct drm_panthor_queue_create *args)
>  {
> +	const struct drm_sched_init_args sched_args = {
> +		.ops = &panthor_queue_sched_ops,
> +		.submit_wq = group->ptdev->scheduler->wq,
> +		.num_rqs = 1,
> +		/*
> +		 * The credit limit argument tells us the total number of
> +		 * instructions across all CS slots in the ringbuffer, with
> +		 * some jobs requiring twice as many as others, depending on
> +		 * their profiling status.
> +		 */
> +		.credit_limit = args->ringbuf_size / sizeof(u64),
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout_wq = group->ptdev->reset.wq,
> +		.name = "panthor-queue",
> +		.dev = group->ptdev->base.dev
> +	};
>  	struct drm_gpu_scheduler *drm_sched;
>  	struct panthor_queue *queue;
>  	int ret;
> @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group *group,
>  	if (ret)
>  		goto err_free_queue;
>  
> -	/*
> -	 * Credit limit argument tells us the total number of instructions
> -	 * across all CS slots in the ringbuffer, with some jobs requiring
> -	 * twice as many as others, depending on their profiling status.
> -	 */
> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
> -			     group->ptdev->scheduler->wq, 1,
> -			     args->ringbuf_size / sizeof(u64),
> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -			     group->ptdev->reset.wq,
> -			     NULL, "panthor-queue", group->ptdev->base.dev);
> +

This creates two empty lines.

> +	ret = drm_sched_init(&queue->scheduler, &sched_args);
>  	if (ret)
>  		goto err_free_queue;
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..6295b2654a7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   * drm_sched_init - Init a gpu scheduler instance
>   *
>   * @sched: scheduler instance
> - * @ops: backend operations for this scheduler
> - * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> - *	       allocated and used
> - * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
> - * @credit_limit: the number of credits this scheduler can hold from all jobs
> - * @hang_limit: number of times to allow a job to hang before dropping it
> - * @timeout: timeout value in jiffies for the scheduler
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> - *		used
> - * @score: optional score atomic shared with other schedulers
> - * @name: name used for debugging
> - * @dev: target &struct device
> + * @args: scheduler initialization arguments
>   *
>   * Return 0 on success, otherwise error code.
>   */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
>  {
>  	int i;
>  
> -	sched->ops = ops;
> -	sched->credit_limit = credit_limit;
> -	sched->name = name;
> -	sched->timeout = timeout;
> -	sched->timeout_wq = timeout_wq ? : system_wq;
> -	sched->hang_limit = hang_limit;
> -	sched->score = score ? score : &sched->_score;
> -	sched->dev = dev;
> +	sched->ops = args->ops;
> +	sched->credit_limit = args->credit_limit;
> +	sched->name = args->name;
> +	sched->timeout = args->timeout;
> +	sched->timeout_wq = args->timeout_wq ? : system_wq;
> +	sched->hang_limit = args->hang_limit;
> +	sched->score = args->score ? args->score : &sched->_score;
> +	sched->dev = args->dev;
>  
> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> +	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>  		/* This is a gross violation--tell drivers what the  problem is.
>  		 */
>  		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		return 0;
>  	}
>  
> -	if (submit_wq) {
> -		sched->submit_wq = submit_wq;
> +	if (args->submit_wq) {
> +		sched->submit_wq = args->submit_wq;
>  		sched->own_submit_wq = false;
>  	} else {
>  #ifdef CONFIG_LOCKDEP
> -		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(args->name,
>  								       WQ_MEM_RECLAIM,
>  								       &drm_sched_lockdep_map);
>  #else
> -		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> +		sched->submit_wq = alloc_ordered_workqueue(args->name, WQ_MEM_RECLAIM);
>  #endif
>  		if (!sched->submit_wq)
>  			return -ENOMEM;
> @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		sched->own_submit_wq = true;
>  	}
>  
> -	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
> +	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
>  					GFP_KERNEL | __GFP_ZERO);
>  	if (!sched->sched_rq)
>  		goto Out_check_own;
> -	sched->num_rqs = num_rqs;
> +	sched->num_rqs = args->num_rqs;
>  	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>  		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>  		if (!sched->sched_rq[i])
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..db1c52dcf1a6 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
>  static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args args = {
> +		.ops = &drm_sched_ops,
> +		.num_rqs = 1,
> +		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.hang_limit = XE_SCHED_HANG_LIMIT,
> +		.timeout = XE_SCHED_JOB_TIMEOUT,
> +		.name = q->hwe->name,
> +		.dev = gt_to_xe(q->gt)->drm.dev
> +	};
>  	struct xe_execlist_exec_queue *exl;
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	int err;
> @@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  
>  	exl->q = q;
>  
> -	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> -			     q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> -			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> -			     NULL, NULL, q->hwe->name,
> -			     gt_to_xe(q->gt)->drm.dev);
> +

Two empty lines here as well.

> +	err = drm_sched_init(&exl->sched, &args);
>  	if (err)
>  		goto err_free;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 50361b4638f9..be95f4cca007 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -63,13 +63,24 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>  		  atomic_t *score, const char *name,
>  		  struct device *dev)
>  {
> +	const struct drm_sched_init_args args = {
> +		.ops = ops,
> +		.submit_wq = submit_wq,
> +		.num_rqs = 1,
> +		.credit_limit = hw_submission,
> +		.hang_limit = hang_limit,
> +		.timeout = timeout,
> +		.timeout_wq = timeout_wq,
> +		.score = score,
> +		.name = name,
> +		.dev = dev
> +	};
> +
>  	sched->ops = xe_ops;
>  	INIT_LIST_HEAD(&sched->msgs);
>  	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
>  
> -	return drm_sched_init(&sched->base, ops, submit_wq, 1, hw_submission,
> -			      hang_limit, timeout, timeout_wq, score, name,
> -			      dev);
> +	return drm_sched_init(&sched->base, &args);
>  }
>  
>  void xe_sched_fini(struct xe_gpu_scheduler *sched)
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a0ff08123f07..f0f5435598a8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
>  	struct device			*dev;
>  };
>  
> +/**
> + * struct drm_sched_init_args - parameters for initializing a DRM GPU scheduler
> + *
> + * @ops: backend operations provided by the driver
> + * @submit_wq: workqueue to use for submission. May be NULL.
> + *	If NULL, an ordered wq is allocated and used.
> + * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
> + *	as there's usually one run-queue per priority, but may be less.
> + * @credit_limit: the number of credits this scheduler can hold from all jobs
> + * @hang_limit: number of times to allow a job to hang before dropping it.
> + *	This mechanism is DEPRECATED. Set it to 0.
> + * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. May be NULL.
> + *	If NULL, the system_wq is used.
> + * @score: score atomic shared with other schedulers. May be NULL.
> + * @name: name used for debugging
> + * @dev: associated device. Used for debugging
> + */

This is weirdly formatted. Please align line breaks with the corresponding
number of spaces.

> +struct drm_sched_init_args {
> +	const struct drm_sched_backend_ops *ops;
> +	struct workqueue_struct *submit_wq;
> +	struct workqueue_struct *timeout_wq;
> +	u32 num_rqs;
> +	u32 credit_limit;
> +	unsigned int hang_limit;
> +	long timeout;
> +	atomic_t *score;
> +	const char *name;
> +	struct device *dev;
> +};
> +
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		const struct drm_sched_init_args *args);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,
> -- 
> 2.47.1
> 

