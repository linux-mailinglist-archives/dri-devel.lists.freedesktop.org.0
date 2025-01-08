Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E5A05720
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B4110E82B;
	Wed,  8 Jan 2025 09:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eQGlPsji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144DC10E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736329330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SapAHYg29hQCsDRuEPb8a84S87jfvUDYh1g6iQOAtWY=;
 b=eQGlPsjiUGtvgAmtA0WqORV7SLKxbU3r2Cb/IY5sYVx3gatq3ZOaDXP92l+dfObp2tYcDl
 rfVquJ2JVg3Q2TiVBnLJX953dTeGJ+gWQBRphXmMNk4UYNFUIz7ZBIzKlmg/AFMZ5bjKfz
 2Lkug2v8s/8GE9C3nQuxNj956+K+T5k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-7Fmw0dXNMISLOuJf7VS-bw-1; Wed, 08 Jan 2025 04:42:08 -0500
X-MC-Unique: 7Fmw0dXNMISLOuJf7VS-bw-1
X-Mimecast-MFC-AGG-ID: 7Fmw0dXNMISLOuJf7VS-bw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385dcadffebso8063978f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 01:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736329327; x=1736934127;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SapAHYg29hQCsDRuEPb8a84S87jfvUDYh1g6iQOAtWY=;
 b=nz1uKbmvxQtXGMwwlHp4A+aUQbEN8cXSh8biyVqPBxzWNT45NWz0aWR6eM88o3TCUx
 T8NtHjEr2LpybuwD66VZ5+ipXRj4FUfQb27uOJb1+YVhhm8ibvl4L0WnbHhjOKo2qPXm
 YX2DS8V8FHpthYosj8QTTZRORDdEVHTKCKZyrDhIX1ik/eXDRa801Yd630XsPW+Pqv06
 7ELmcNyC457CGc4QOuYnVSWFxhgm7Lozr7SNcNkkOrlOuUEb8dto3YqRiY8PbFTq9qIF
 U/YBCeXO6ol0iuSLQ4W+t27XOO8FoH2ZF4xlcX68gLjGKwJoDwe6YDRJfDCaZeyffi8E
 S2uQ==
X-Gm-Message-State: AOJu0YxQAL4cQ/4zKElJ7XLWYaGGmGnRw0IKoxYzNDsScV6mhtahMQia
 Xk3WvAVw/VskQK8bk8cpeHNvU+o/gGhIXzo5QqZxlXCLZrFFxZ3C2EX/zPGRiozpMMZSFbtQqjR
 eU8rkb9kw95YcaQQ1gzHKQGxCYLBfmzEJz8JKYMlXoxPreZCUlZpssu7+s3jns+3oIQ==
X-Gm-Gg: ASbGnctHA2uqeiTQWSbfpOaDmzW5u5WmRXLXtl9Jb+8kCd8jelt++oAAoED037DHxwG
 mY2RkuU0El4/5rff51c2QfECKQSKUjVzxxEbAnJKVZ2vr/pYNZ0zjHJAe3lSJXycAnPUI8/Zu2m
 1vAbInO4+Ov+MRl4H60E653dGmgmn3IlowN0m9DZyJFO4qtKeIPno1Dfz4YbxjuZz3EBT+yyUeQ
 pM/9mH0cXmnI8/w73TDoWtK/O8U36HHW+TMnE3GbzLp6g==
X-Received: by 2002:a05:6000:470d:b0:382:4b52:ffcc with SMTP id
 ffacd0b85a97d-38a870826d9mr1619900f8f.0.1736329327415; 
 Wed, 08 Jan 2025 01:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEQ9mbn3hPwNCFQlnfQWqi2cSaEhFvr2AJtg/qJKd15l1wdUtBA8bt/xQb/8bmXPFVKS4RPg==
X-Received: by 2002:a05:6000:470d:b0:382:4b52:ffcc with SMTP id
 ffacd0b85a97d-38a870826d9mr1619870f8f.0.1736329326998; 
 Wed, 08 Jan 2025 01:42:06 -0800 (PST)
Received: from pollux ([2a00:79c0:618:8300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e02075sm14782615e9.27.2025.01.08.01.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:42:06 -0800 (PST)
Date: Wed, 8 Jan 2025 10:42:04 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [RFC 03/14] drm/sched: Implement RR via FIFO
Message-ID: <Z35IbF2QPZ3NAirM@pollux>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-4-tursulin@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20241230165259.95855-4-tursulin@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y3b0HFnLU5_2qYxTaNLU6gq-bv33z1DfOD4Kmpp3aC0_1736329327
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

On Mon, Dec 30, 2024 at 04:52:48PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Round-robin being the non-default policy and unclear how much it is used,

I don't know either, but would be nice if we could instead remove it.

> we can notice that it can be implemented using the FIFO data structures if
> we only invent a fake submit timestamp which is monotonically increasing
> inside drm_sched_rq instances.
> 
> So instead of remembering which was the last entity the scheduler worker
> picked, we can bump the picked one to the bottom of the tree, achieving
> the same round-robin behaviour.
> 
> Advantage is that we can consolidate to a single code path and remove a
> bunch of code. Downside is round-robin mode now needs to lock on the job
> pop path but that should not be visible.

I guess you did you test both scheduler strategies with this change?

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 53 ++++++++-----
>  drivers/gpu/drm/scheduler/sched_main.c   | 99 +++---------------------
>  include/drm/gpu_scheduler.h              |  5 +-
>  3 files changed, 48 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 8e910586979e..cb5f596b48b7 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -473,9 +473,20 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>  	return NULL;
>  }
>  
> +static ktime_t
> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> +{
> +	lockdep_assert_held(&rq->lock);
> +
> +	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
> +
> +	return rq->rr_deadline;
> +}
> +
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  {
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job, *next_job;
> +	struct drm_sched_rq *rq;
>  
>  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>  	if (!sched_job)
> @@ -510,24 +521,28 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> -		struct drm_sched_job *next;
> -		struct drm_sched_rq *rq;
> +	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>  
> -		spin_lock(&entity->lock);
> -		rq = entity->rq;
> -		spin_lock(&rq->lock);
> -		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> -		if (next) {
> -			drm_sched_rq_update_fifo_locked(entity, rq,
> -							next->submit_ts);
> -		} else {
> -			drm_sched_rq_remove_fifo_locked(entity, rq);
> -		}
> -		spin_unlock(&rq->lock);
> -		spin_unlock(&entity->lock);
> +	spin_lock(&entity->lock);
> +	rq = entity->rq;
> +	spin_lock(&rq->lock);
> +
> +	if (next_job) {
> +		ktime_t ts;
> +
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			ts = next_job->submit_ts;
> +		else
> +			ts = drm_sched_rq_get_rr_deadline(rq);
> +
> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	} else {
> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>  	}
>  
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +
>  	/* Jobs and entities might have different lifecycles. Since we're
>  	 * removing the job from the entities queue, set the jobs entity pointer
>  	 * to NULL to prevent any future access of the entity through this job.
> @@ -624,9 +639,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  		spin_lock(&rq->lock);
>  		drm_sched_rq_add_entity(rq, entity);
> -
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> +		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> +			submit_ts = drm_sched_rq_get_rr_deadline(rq);
> +		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>  
>  		spin_unlock(&rq->lock);
>  		spin_unlock(&entity->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9beb4c611988..eb22b1b7de36 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -189,7 +189,6 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
>  	rq->rb_tree_root = RB_ROOT_CACHED;
> -	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
>  
> @@ -235,82 +234,13 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  	atomic_dec(rq->sched->score);
>  	list_del_init(&entity->list);
>  
> -	if (rq->current_entity == entity)
> -		rq->current_entity = NULL;
> -
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity, rq);
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>  
>  	spin_unlock(&rq->lock);
>  }
>  
>  /**
> - * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Try to find the next ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if an
> - * entity was ready, but the scheduler had insufficient credits to accommodate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> -			      struct drm_sched_rq *rq)
> -{
> -	struct drm_sched_entity *entity;
> -
> -	spin_lock(&rq->lock);
> -
> -	entity = rq->current_entity;
> -	if (entity) {
> -		list_for_each_entry_continue(entity, &rq->entities, list) {
> -			if (drm_sched_entity_is_ready(entity)) {
> -				/* If we can't queue yet, preserve the current
> -				 * entity in terms of fairness.
> -				 */
> -				if (!drm_sched_can_queue(sched, entity)) {
> -					spin_unlock(&rq->lock);
> -					return ERR_PTR(-ENOSPC);
> -				}
> -
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> -				spin_unlock(&rq->lock);
> -				return entity;
> -			}
> -		}
> -	}
> -
> -	list_for_each_entry(entity, &rq->entities, list) {
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> -			spin_unlock(&rq->lock);
> -			return entity;
> -		}
> -
> -		if (entity == rq->current_entity)
> -			break;
> -	}
> -
> -	spin_unlock(&rq->lock);
> -
> -	return NULL;
> -}
> -
> -/**
> - * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + * drm_sched_rq_select_entity - Select an entity which provides a job to run
>   *
>   * @sched: the gpu scheduler
>   * @rq: scheduler run queue to check.
> @@ -322,32 +252,29 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>   * its job; return NULL, if no ready entity was found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			   struct drm_sched_rq *rq)
>  {
> +	struct drm_sched_entity *entity = NULL;
>  	struct rb_node *rb;
>  
>  	spin_lock(&rq->lock);
>  	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> -		struct drm_sched_entity *entity;
> -
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
>  			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> +				entity = ERR_PTR(-ENOSPC);
> +				break;
>  			}
>  
>  			reinit_completion(&entity->entity_idle);
>  			break;
>  		}
> +		entity = NULL;
>  	}
>  	spin_unlock(&rq->lock);
>  
> -	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +	return entity;
>  }

The whole diff of drm_sched_rq_select_entity_fifo() (except for the name) has
nothing to do with the patch, does it?

If you want refactor things, please do it in a separate patch.

>  
>  /**
> @@ -1045,20 +972,18 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>  static struct drm_sched_entity *
>  drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  {
> -	struct drm_sched_entity *entity;
> +	struct drm_sched_entity *entity = NULL;
>  	int i;
>  
>  	/* Start with the highest priority.
>  	 */
>  	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> +		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>  		if (entity)
>  			break;
>  	}
>  
> -	return IS_ERR(entity) ? NULL : entity;
> +	return IS_ERR(entity) ? NULL : entity;;
>  }
>  
>  /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 978ca621cc13..db65600732b9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -245,8 +245,7 @@ struct drm_sched_entity {
>   * struct drm_sched_rq - queue of entities to be scheduled.
>   *
>   * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root and @current_entity.
> - * @current_entity: the entity which is to be scheduled.
> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
>   * @entities: list of the entities to be scheduled.
>   * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>   *
> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>  
>  	spinlock_t			lock;
>  	/* Following members are protected by the @lock: */
> -	struct drm_sched_entity		*current_entity;
> +	ktime_t				rr_deadline;
>  	struct list_head		entities;
>  	struct rb_root_cached		rb_tree_root;
>  };
> -- 
> 2.47.1
> 

