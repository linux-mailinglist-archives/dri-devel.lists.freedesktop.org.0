Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE68A195CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 16:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0510E71C;
	Wed, 22 Jan 2025 15:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Wu/oudU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629AD10E70E;
 Wed, 22 Jan 2025 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737561071;
 bh=qtWpD+f67z2nccJZ6CAzEHvQKdF69RdJiKk3FSe+6Ok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wu/oudU6znd9BDRWUg5beoPtia/Zqma+Rz0voT3BlxdAOSmVsTdqCjhjHpZZ7EqsY
 C9i8fE9sBPeZjtdlaawob5nondx+UcCN7oyRywgWQuDPZ6i5odhh8Ctld+qjgP4yG8
 Uf5Pd+Y6WmJIua+9ect8ghr3eP3rhc38ACUAb7xAvIvQpgdhtO+PDoO+8OrmVjW7/1
 L0mdLtJBti7xXDwQL9wo7K1gsWuH0qJHvggWNy65k02mxPlTSeoO9O06Qb7mcsDSzy
 LgwxqTdvZyWxQ300pD2YcQ1v+WRlZ9JZflqirCZ8jXe8HawgAYyl44Cb94ORLPHCQ3
 zDeEmMcWuHU2A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D7FF17E0D72;
 Wed, 22 Jan 2025 16:51:10 +0100 (CET)
Date: Wed, 22 Jan 2025 16:51:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>, Melissa
 Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <20250122165104.536c4143@collabora.com>
In-Reply-To: <20250122140818.45172-3-phasta@kernel.org>
References: <20250122140818.45172-3-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Jan 2025 15:08:20 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group *group,
>  		   const struct drm_panthor_queue_create *args)
>  {
>  	struct drm_gpu_scheduler *drm_sched;
> +	struct drm_sched_init_params sched_params;

nit: Could we use a struct initializer instead of a
memset(0)+field-assignment?

	struct drm_sched_init_params sched_params = {
		.ops = &panthor_queue_sched_ops,
		.submit_wq = group->ptdev->scheduler->wq,
		.num_rqs = 1,
		.credit_limit = args->ringbuf_size / sizeof(u64),
		.hang_limit = 0,
		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
		.timeout_wq = group->ptdev->reset.wq,
		.name = "panthor-queue",
		.dev = group->ptdev->base.dev,
        };

The same comment applies the panfrost changes BTW.

>  	struct panthor_queue *queue;
>  	int ret;
>  
> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group *group,
>  	if (!queue)
>  		return ERR_PTR(-ENOMEM);
>  
> +	memset(&sched_params, 0, sizeof(struct drm_sched_init_params));
> +
>  	queue->fence_ctx.id = dma_fence_context_alloc(1);
>  	spin_lock_init(&queue->fence_ctx.lock);
>  	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group *group,
>  	if (ret)
>  		goto err_free_queue;
>  
> +	sched_params.ops = &panthor_queue_sched_ops;
> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
> +	sched_params.num_rqs = 1;
>  	/*
> -	 * Credit limit argument tells us the total number of instructions
> +	 * The credit limit argument tells us the total number of instructions
>  	 * across all CS slots in the ringbuffer, with some jobs requiring
>  	 * twice as many as others, depending on their profiling status.
>  	 */
> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
> -			     group->ptdev->scheduler->wq, 1,
> -			     args->ringbuf_size / sizeof(u64),
> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -			     group->ptdev->reset.wq,
> -			     NULL, "panthor-queue", group->ptdev->base.dev);
> +	sched_params.credit_limit = args->ringbuf_size / sizeof(u64);
> +	sched_params.hang_limit = 0;
> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	sched_params.timeout_wq = group->ptdev->reset.wq;
> +	sched_params.score = NULL;
> +	sched_params.name = "panthor-queue";
> +	sched_params.dev = group->ptdev->base.dev;
> +
> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
>  	if (ret)
>  		goto err_free_queue;
