Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950DF9842E9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B1910E6AB;
	Tue, 24 Sep 2024 10:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jN3rDo5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6410E6AB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:03:19 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso824691766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727172198; x=1727776998; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=85G3Vin5z+i/xg8UtxiVGbhVcJNEiBfKQInxf4kzVSY=;
 b=jN3rDo5S6JY6uYXNSL1er0jo39rUxzRhDk1atwyhG6Q55yfMsvLgPcSYcJuP6E+1jQ
 /urv2WwAkn+bDTgz+mJcHhNAO6b5l5ra2PnmDFiXWPW7bsevhnAfUH2lKhUHLvDE5q59
 8O6XP18pHEaD+s1MJO6ewKzY5MwrEZaFi5KJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727172198; x=1727776998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85G3Vin5z+i/xg8UtxiVGbhVcJNEiBfKQInxf4kzVSY=;
 b=UOR57wbcEbr3vHARWDaWNdTvtK/lNt3LYwc9HUhfWPpgrvtWTVLs+Pvv7W0fWxd7RL
 DcpkyzSYtSEVvE27zkyNRcoScVZN8XX0ey/Xy95rYUGq6Ywv6XNQgNS9/5YM5DUsnQsf
 BrY1JZbraqgU60eCcNoaprfSGVir5uzphRiOHRe8YzLEnSCnUGf+BhbC3aFgHsBkxRBw
 gdzKmqxbYquZqL5+7NawhnzlWVeSSx+JOhPmtfsrk1/8VilCwhYp8j0jiZUcgg7uO9HJ
 lUODFLOwydKz697A6dPrnX1Oz9GA3W/xHr3bt+hdS3fPj4YjYfF8PrmMD2uQCHObtzcu
 sfMA==
X-Gm-Message-State: AOJu0YxdceJAkbrPTNuTfjb03Xyg7RQ0N2+wF7qY2NT6xPYIVrX/oENm
 cX84O/pMTIITsBNviMNoZZH6Z76H5bmePi7KkQs/0icFQ/YQQmF35meK9PD3DXU=
X-Google-Smtp-Source: AGHT+IGAwZ46blQJYTyg0QiFrxGFAfhabnLLYvLZutLYWqsWVrABggDm86HgD+y+BFUxHBLIwDMDtA==
X-Received: by 2002:a17:907:3f19:b0:a86:43c0:4270 with SMTP id
 a640c23a62f3a-a90d4fbc6a1mr1666930966b.13.1727172198168; 
 Tue, 24 Sep 2024 03:03:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f188bsm64698966b.153.2024.09.24.03.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:03:17 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:03:15 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v3] drm/scheduler: Improve documentation
Message-ID: <ZvKOY4xJWBFLBmMH@phenom.ffwll.local>
References: <20240917144732.2758572-1-shuicheng.lin@intel.com>
 <DM4PR11MB54568532CCCCE21AA2833334EA6E2@DM4PR11MB5456.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54568532CCCCE21AA2833334EA6E2@DM4PR11MB5456.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Sun, Sep 22, 2024 at 05:29:36PM +0000, Lin, Shuicheng wrote:
> Hi all,
> I am not familiar with the process yet. To get it merged, should I add more mail-list or how to notify the maintainers?
> Thanks in advance for your guide.

drm/sched is a bit undermaintained, things unfortunately fall through
cracks. I've picked this up and merged it to drm-misc-next, thanks a lot.
-Sima

> 
> Best Regards
> Shuicheng
> 
> > -----Original Message-----
> > From: Lin, Shuicheng <shuicheng.lin@intel.com>
> > Sent: Tuesday, September 17, 2024 7:48 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Philipp Stanner
> > <pstanner@redhat.com>
> > Subject: [PATCH v3] drm/scheduler: Improve documentation
> > 
> > Function drm_sched_entity_push_job() doesn't have a return value, remove the
> > return value description for it.
> > Correct several other typo errors.
> > 
> > v2 (Philipp):
> > - more correction with related comments.
> > 
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Reviewed-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++------
> >  drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
> >  include/drm/gpu_scheduler.h              | 12 ++++++------
> >  include/linux/dma-resv.h                 |  6 +++---
> >  4 files changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 58c8161289fe..ffa3e765f5db 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -51,7 +51,7 @@
> >   * drm_sched_entity_set_priority(). For changing the set of schedulers
> >   * @sched_list at runtime see drm_sched_entity_modify_sched().
> >   *
> > - * An entity is cleaned up by callind drm_sched_entity_fini(). See also
> > + * An entity is cleaned up by calling drm_sched_entity_fini(). See also
> >   * drm_sched_entity_destroy().
> >   *
> >   * Returns 0 on success or a negative error code on failure.
> > @@ -370,8 +370,8 @@ static void drm_sched_entity_clear_dep(struct
> > dma_fence *f,  }
> > 
> >  /*
> > - * drm_sched_entity_clear_dep - callback to clear the entities dependency and
> > - * wake up scheduler
> > + * drm_sched_entity_wakeup - callback to clear the entity's dependency
> > + and
> > + * wake up the scheduler
> >   */
> >  static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  				    struct dma_fence_cb *cb)
> > @@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct dma_fence
> > *f,
> >   * @entity: scheduler entity
> >   * @priority: scheduler priority
> >   *
> > - * Update the priority of runqueus used for the entity.
> > + * Update the priority of runqueues used for the entity.
> >   */
> >  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >  				   enum drm_sched_priority priority) @@ -574,8
> > +574,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >   * fence sequence number this function should be called with
> > drm_sched_job_arm()
> >   * under common lock for the struct drm_sched_entity that was set up for
> >   * @sched_job in drm_sched_job_init().
> > - *
> > - * Returns 0 for success, negative error code otherwise.
> >   */
> >  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)  { diff --git
> > a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index ab53ab486fe6..cadf1662bc01 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -41,7 +41,7 @@
> >   * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> >   *    the hardware.
> >   *
> > - * The jobs in a entity are always scheduled in the order that they were pushed.
> > + * The jobs in an entity are always scheduled in the order in which they were
> > pushed.
> >   *
> >   * Note that once a job was taken from the entities queue and pushed to the
> >   * hardware, i.e. the pending queue, the entity must not be referenced anymore
> > @@ -1339,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > *sched)
> >  		list_for_each_entry(s_entity, &rq->entities, list)
> >  			/*
> >  			 * Prevents reinsertion and marks job_queue as idle,
> > -			 * it will removed from rq in drm_sched_entity_fini
> > +			 * it will be removed from the rq in
> > drm_sched_entity_fini()
> >  			 * eventually
> >  			 */
> >  			s_entity->stopped = true;
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index
> > fe8edb917360..ef23113451e4 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -33,11 +33,11 @@
> >  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> > 
> >  /**
> > - * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> > + * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
> >   *
> >   * Setting this flag on a scheduler fence prevents pipelining of jobs depending
> >   * on this fence. In other words we always insert a full CPU round trip before
> > - * dependen jobs are pushed to the hw queue.
> > + * dependent jobs are pushed to the hw queue.
> >   */
> >  #define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
> > 
> > @@ -71,7 +71,7 @@ enum drm_sched_priority {
> >  	DRM_SCHED_PRIORITY_COUNT
> >  };
> > 
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > +/* Used to choose between FIFO and RR job-scheduling */
> >  extern int drm_sched_policy;
> > 
> >  #define DRM_SCHED_POLICY_RR    0
> > @@ -198,7 +198,7 @@ struct drm_sched_entity {
> >  	 *
> >  	 * Points to the finished fence of the last scheduled job. Only written
> >  	 * by the scheduler thread, can be accessed locklessly from
> > -	 * drm_sched_job_arm() iff the queue is empty.
> > +	 * drm_sched_job_arm() if the queue is empty.
> >  	 */
> >  	struct dma_fence __rcu		*last_scheduled;
> > 
> > @@ -247,7 +247,7 @@ struct drm_sched_entity {
> >   * @sched: the scheduler to which this rq belongs to.
> >   * @entities: list of the entities to be scheduled.
> >   * @current_entity: the entity which is to be scheduled.
> > - * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
> > + * @rb_tree_root: root of time based priority queue of entities for
> > + FIFO scheduling
> >   *
> >   * Run queue is a set of entities scheduling command submissions for
> >   * one specific ring. It implements the scheduling policy that selects @@ -321,7
> > +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence
> > *f);
> >   * @s_fence: contains the fences for the scheduling of job.
> >   * @finish_cb: the callback for the finished fence.
> >   * @credits: the number of credits this job contributes to the scheduler
> > - * @work: Helper to reschdeule job kill to different context.
> > + * @work: Helper to reschedule job kill to different context.
> >   * @id: a unique id assigned to each job scheduled on the scheduler.
> >   * @karma: increment on every hang caused by this job. If this exceeds the hang
> >   *         limit of the scheduler then the job is marked guilty and will not
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h index
> > 8d0e34dad446..c5ab6fd9ebe8 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -105,10 +105,10 @@ enum dma_resv_usage {
> >  	 * This should be used by submissions which don't want to participate in
> >  	 * any implicit synchronization.
> >  	 *
> > -	 * The most common case are preemption fences, page table updates,
> > TLB
> > -	 * flushes as well as explicit synced user submissions.
> > +	 * The most common cases are preemption fences, page table updates,
> > TLB
> > +	 * flushes as well as explicitly synced user submissions.
> >  	 *
> > -	 * Explicit synced user user submissions can be promoted to
> > +	 * Explicitly synced user submissions can be promoted to
> >  	 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed
> > using
> >  	 * dma_buf_import_sync_file() when implicit synchronization should
> >  	 * become necessary after initial adding of the fence.
> > --
> > 2.25.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
