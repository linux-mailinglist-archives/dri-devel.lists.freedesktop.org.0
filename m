Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74850A03D6E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B0910E113;
	Tue,  7 Jan 2025 11:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="rJpmq6Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1276E10E113
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:17:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1236156766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736248587; x=1736853387;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVgVpCZAL74OebOmBvPyv1eAeY0MWoG698h9jVloCgo=;
 b=rJpmq6Z/Ew++nfVtCJ74JMMyLJeiDKzxobQ7MrY5dEiRr2hzqC3bmgqpyjujrmHv+N
 /a8eGF9Y4cPXkWG/OMPlkIiGA7bDjNZoXoao9LdfAS1Eh2BmOut8IV5y2sKwyhdHvJLP
 i+8REI5ehRBnq2KiPjIy0VqFiudSE7PmFQSB6SKMSV1P/Udr6TEbjSgh2G7pWyEwVdg6
 bKLWbO8KJ0IveVzoz2kjYr5tq/TuL5u/wlxlYCnhVhuzPfrUOk2E4W2elI+JwjCw3Kb/
 dxboYrwYXU7uc+aXNoIzHsJT3seLsrdkv98tNQywchXthodXImBEyp/KNmkIZejXRnNc
 bgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736248587; x=1736853387;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVgVpCZAL74OebOmBvPyv1eAeY0MWoG698h9jVloCgo=;
 b=C2SWBDpKMmwnDqHL1JfxPHRhbcb/81j0gotMisvnAihcnsMTXKn5KdiUWUyOYPMezy
 0tlRRunUEcC3KD/+f0tIPFpUqtD8uGh5rzwKOcfLbgL3aXpt8w0BtT0PFZmbmdNCni9b
 sFBbNfYEqtUdLZ0wWtPk51O2VhOsBnrQmb9xcfwDULMst1CMiuyMfzkub/htX3n5rrv4
 MJLUrfIlrbqwt5GRDwC3+9zr+qyrhP1detU+yTUrM6Jp731Fq55mKZBH65ihUpVAVxWg
 HzyRenmrt9Cv0XapiH6IJbLwF50yPVwBuf6shgGBq/x+5fl40rKRGGrWrQNTKQ7WZiiu
 57aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMcIttWmfkWZLrwgw0lmd17c1g6hGL9IFutmccCjMT1+wh6Z3YwyHdRzp5ongCdyOgs/gojKa2VsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRVm1Xlg8+V4mC19BU1bEm7xF2I3iyWQpvWJd2DbNYNZdKlCHn
 RadmEZvyQJOgzmcoJRXHA7DhcjCvebxh+Xb36+QPV+ZOb3J06/6oUwmSvaHUYMvdTMhTcykDIKP
 RLQM=
X-Gm-Gg: ASbGncuEbWhzqoOwOWIRO8Xe72E1g2Uj9zuWyHBKeofKecaGxXietwmMgoF19EJ84yt
 8wx1X0wirIURAIR+KHJrBQhHXqBeb9xRdmTJPfWJwYsbtUv6X+hnhOtOLpv895uVTJk7sBr4j+l
 J0x565ooYa6x9SWg0mCcVn627hpODtIiJnZ1oZspgaXEvTQ9IPV2l4a0Y0A5W09G4Iwc1JD2iiC
 xkw6ZnmGuTjE6ylqdMVB5dg5nnFJdJPO4y+G7HXyx+ybgd9HlgYO0B597l7jtRrrJbhPu3r
X-Google-Smtp-Source: AGHT+IGY/AY6FV6ldgQ8Jm4Y3sPRWT94I8fjlEhUjpE5bpJgrDOb16FQn0xsYtduC924NzcD1x9seA==
X-Received: by 2002:a05:600c:a0a:b0:434:f0df:9f6 with SMTP id
 5b1f17b1804b1-4366854737fmr549667725e9.3.1736248244305; 
 Tue, 07 Jan 2025 03:10:44 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e219sm50818931f8f.84.2025.01.07.03.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 03:10:43 -0800 (PST)
Message-ID: <aa733153-0109-4f74-85be-c0889e8f82ee@ursulin.net>
Date: Tue, 7 Jan 2025 11:10:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-12-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241230165259.95855-12-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 30/12/2024 16:52, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Now that the scheduling policy is deadline based it feels completely
> natural to allow propagating externaly set deadlines to the scheduler.
> 
> Scheduler deadlines are not a guarantee but as the dma-fence facility is
> already in use by userspace lets wire it up.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 30 +++++++++++++++++++++++-
>   drivers/gpu/drm/scheduler/sched_fence.c  |  3 +++
>   drivers/gpu/drm/scheduler/sched_rq.c     | 16 +++++++++++++
>   include/drm/gpu_scheduler.h              |  8 +++++++
>   4 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 14bc3f797079..c5a4c04b2455 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -385,7 +385,24 @@ ktime_t
>   drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>   				  struct drm_sched_job *job)
>   {
> -	return __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
> +	struct drm_sched_fence *s_fence = job->s_fence;
> +	struct dma_fence *fence = &s_fence->finished;
> +	ktime_t deadline;
> +
> +	deadline = __drm_sched_entity_get_job_deadline(entity, job->submit_ts);
> +	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
> +	    ktime_before(s_fence->deadline, deadline))
> +		deadline = s_fence->deadline;
> +
> +	return deadline;
> +}
> +
> +void drm_sched_entity_set_deadline(struct drm_sched_entity *entity,
> +				   ktime_t deadline)
> +{
> +	spin_lock(&entity->lock);
> +	drm_sched_rq_update_deadline(entity->rq, entity, deadline);
> +	spin_unlock(&entity->lock);
>   }
>   
>   /*
> @@ -536,8 +553,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>    */
>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   {
> +	struct drm_sched_fence *s_fence = sched_job->s_fence;
>   	struct drm_sched_entity *entity = sched_job->entity;
> +	struct dma_fence *fence = &s_fence->finished;
>   	ktime_t submit_ts = ktime_get();
> +	ktime_t fence_deadline;
>   	bool first;
>   
>   	trace_drm_sched_job(sched_job, entity);
> @@ -552,6 +572,11 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	 * Make sure to set the submit_ts first, to avoid a race.
>   	 */
>   	sched_job->submit_ts = submit_ts;
> +	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags))
> +		fence_deadline = s_fence->deadline;
> +	else
> +		fence_deadline = KTIME_MAX;
> +
>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>   
>   	/* first job wakes up scheduler */
> @@ -560,6 +585,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   
>   		submit_ts = __drm_sched_entity_get_job_deadline(entity,
>   								submit_ts);
> +		if (ktime_before(fence_deadline, submit_ts))
> +			submit_ts = fence_deadline;
> +
>   		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
>   		if (sched)
>   			drm_sched_wakeup(sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 0f35f009b9d3..dfc7f50d4e0d 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   
>   	spin_unlock_irqrestore(&fence->lock, flags);
>   
> +	drm_sched_entity_set_deadline(fence->entity, deadline);

This I think needs re-work too becuase entities must not be acccessed 
from jobs. Sigh. I can make it update the deadline inside the job itself 
which will be applied when the job becomes first in the queue.

Regards,

Tvrtko

> +
>   	/*
>   	 * smp_load_aquire() to ensure that if we are racing another
>   	 * thread calling drm_sched_fence_set_parent(), that we see
> @@ -223,6 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   {
>   	unsigned seq;
>   
> +	fence->entity = entity;
>   	fence->sched = entity->rq->sched;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> index 1a454384ab25..e96c8ca9c54b 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -148,6 +148,22 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>   	spin_unlock(&entity->lock);
>   }
>   
> +void drm_sched_rq_update_deadline(struct drm_sched_rq *rq,
> +				  struct drm_sched_entity *entity,
> +				  ktime_t deadline)
> +{
> +	lockdep_assert_held(&entity->lock);
> +
> +	if (ktime_before(deadline, entity->oldest_job_waiting)) {
> +		spin_lock(&rq->lock);
> +		if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +			__drm_sched_rq_remove_tree_locked(entity, rq);
> +			__drm_sched_rq_add_tree_locked(entity, rq, deadline);
> +		}
> +		spin_unlock(&rq->lock);
> +	}
> +}
> +
>   /**
>    * drm_sched_rq_select_entity - Select an entity which provides a job to run
>    *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 85f3a0d5a7be..c68dce8af063 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -291,6 +291,9 @@ struct drm_sched_fence {
>            * &drm_sched_fence.finished fence once parent is signalled.
>            */
>   	struct dma_fence		*parent;
> +
> +	struct drm_sched_entity		*entity;
> +
>           /**
>            * @sched: the scheduler instance to which the job having this struct
>            * belongs to.
> @@ -597,6 +600,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>   struct drm_sched_entity *
>   drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>   			   struct drm_sched_rq *rq);
> +void drm_sched_rq_update_deadline(struct drm_sched_rq *rq,
> +				  struct drm_sched_entity *entity,
> +				  ktime_t deadline);
>   
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,
> @@ -612,6 +618,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> +void drm_sched_entity_set_deadline(struct drm_sched_entity *entity,
> +				   ktime_t deadline);
>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>   ktime_t drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>   					  struct drm_sched_job *job);
