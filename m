Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9B3B3169
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182286EC12;
	Thu, 24 Jun 2021 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D32B36EC12;
 Thu, 24 Jun 2021 14:32:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7287106F;
 Thu, 24 Jun 2021 07:32:30 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52E303F718;
 Thu, 24 Jun 2021 07:32:26 -0700 (PDT)
Subject: Re: [PATCH 03/11] drm/sched: drop entity parameter from
 drm_sched_push_job
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-4-daniel.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Message-ID: <6f0f9438-38a1-f2cb-efba-c8b33c8bcfaa@arm.com>
Date: Thu, 24 Jun 2021 15:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624140025.438303-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, lima@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2021 15:00, Daniel Vetter wrote:
> Originally a job was only bound to the queue when we pushed this, but
> now that's done in drm_sched_job_init, making that parameter entirely
> redundant.
> 
> Remove it.
> 
> The same applies to the context parameter in
> lima_sched_context_queue_task, simplify that too.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c  | 2 +-
>  drivers/gpu/drm/lima/lima_gem.c          | 3 +--
>  drivers/gpu/drm/lima/lima_sched.c        | 5 ++---
>  drivers/gpu/drm/lima/lima_sched.h        | 3 +--
>  drivers/gpu/drm/panfrost/panfrost_job.c  | 2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++----
>  drivers/gpu/drm/v3d/v3d_gem.c            | 2 +-
>  include/drm/gpu_scheduler.h              | 3 +--
>  10 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index a4ec092af9a7..18f63567fb69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1267,7 +1267,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  
>  	trace_amdgpu_cs_ioctl(job);
>  	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>  
>  	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 5ddb955d2315..b8609cccc9c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -174,7 +174,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>  
>  	*f = dma_fence_get(&job->base.s_fence->finished);
>  	amdgpu_job_free_resources(job);
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index af1671f01c7f..77995f190790 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -178,7 +178,7 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>  	/* the scheduler holds on to the job now */
>  	kref_get(&submit->refcount);
>  
> -	drm_sched_entity_push_job(&submit->sched_job, sched_entity);
> +	drm_sched_entity_push_job(&submit->sched_job);
>  
>  out_unlock:
>  	mutex_unlock(&submit->gpu->fence_lock);
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index de62966243cd..c528f40981bb 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -359,8 +359,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
>  			goto err_out2;
>  	}
>  
> -	fence = lima_sched_context_queue_task(
> -		submit->ctx->context + submit->pipe, submit->task);
> +	fence = lima_sched_context_queue_task(submit->task);
>  
>  	for (i = 0; i < submit->nr_bos; i++) {
>  		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index bd1af1fd8c0f..de7e71c42a69 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -177,13 +177,12 @@ void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>  	drm_sched_entity_fini(&context->base);
>  }
>  
> -struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
> -						struct lima_sched_task *task)
> +struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task)
>  {
>  	struct dma_fence *fence = dma_fence_get(&task->base.s_fence->finished);
>  
>  	trace_lima_task_submit(task);
> -	drm_sched_entity_push_job(&task->base, &context->base);
> +	drm_sched_entity_push_job(&task->base);
>  	return fence;
>  }
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index 90f03c48ef4a..ac70006b0e26 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -98,8 +98,7 @@ int lima_sched_context_init(struct lima_sched_pipe *pipe,
>  			    atomic_t *guilty);
>  void lima_sched_context_fini(struct lima_sched_pipe *pipe,
>  			     struct lima_sched_context *context);
> -struct dma_fence *lima_sched_context_queue_task(struct lima_sched_context *context,
> -						struct lima_sched_task *task);
> +struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task);
>  
>  int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name);
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 1e950534b9b0..2d01a670a4e8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -257,7 +257,7 @@ int panfrost_job_push(struct panfrost_job *job)
>  
>  	kref_get(&job->refcount); /* put by scheduler job completion */
>  
> -	drm_sched_entity_push_job(&job->base, entity);
> +	drm_sched_entity_push_job(&job->base);
>  
>  	mutex_unlock(&pfdev->sched_lock);
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index b6f72fafd504..2ab1b9e648f2 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -493,9 +493,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  
>  /**
>   * drm_sched_entity_push_job - Submit a job to the entity's job queue
> - *
>   * @sched_job: job to submit
> - * @entity: scheduler entity
>   *
>   * Note: To guarantee that the order of insertion to queue matches the job's
>   * fence sequence number this function should be called with drm_sched_job_arm()
> @@ -503,9 +501,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
> -			       struct drm_sched_entity *entity)
> +void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
> +	struct drm_sched_entity *entity = sched_job->entity;
>  	bool first;
>  
>  	trace_drm_sched_job(sched_job, entity);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 4eb354226972..ac608eb9b594 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -480,7 +480,7 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>  	/* put by scheduler job completion */
>  	kref_get(&job->refcount);
>  
> -	drm_sched_entity_push_job(&job->base, &v3d_priv->sched_entity[queue]);
> +	drm_sched_entity_push_job(&job->base);
>  
>  	return 0;
>  }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e4d7e1496296..55e0acf8015a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -372,8 +372,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>  void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
> -			       struct drm_sched_entity *entity);
> +void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority);
>  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> 

