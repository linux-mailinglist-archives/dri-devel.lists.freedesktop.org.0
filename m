Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A767940AF0D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286A089B33;
	Tue, 14 Sep 2021 13:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961989A9B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:38:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y132so9304064wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Y4e5uc+b/mXvn82YV560U0kDtuDse53Hm+g6AvhQ+10=;
 b=cRCGLSjpOumdJWDUZpWUygx0y5XwpVaxvf0ABlKpZc4NDoxDDxSU1Bm6TePvE3ZCR7
 z2Fhwwrp4ZzquB4zaVLA08XBG+Kdhd0tEfg0fzVXF6WvTlOe2cgpTjqJsUZvg0VJj2PB
 xdd2lsKtIYiVDJPebDIntj9d47YW3lhkKXJJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Y4e5uc+b/mXvn82YV560U0kDtuDse53Hm+g6AvhQ+10=;
 b=iF20ZoSuc7gIwke7VR7RhNC3iaakcBXnXRP70p+NmpjmX19vHEMGqTz7VH1xnNrgna
 bQvnWbosvmfBW4MyD8ooZbLMo7VRxfIknrJFdbrw+X3qfm+QYdt4ath6KIUmxp0EqS2R
 6YFrKDddHSpSoG77fOyh8QhgR+AyltSUF6HSrVYn13VJfetJtalmPOt+Kx14SnipGcOG
 FHnIbSTQjHlcaBMvizv/F7/V3UA6co0pQBv1NFlfDE3aY/3VHxBBqPrASHpULkoeJDfz
 PkskRG8u5jNeJPLGCwmy2DDIwCgAN2YIh/Gzeyti1z+faC5MPv5lSc3rAgxX+T27lWQR
 TiJg==
X-Gm-Message-State: AOAM532nPeMfcmvrc9P8btOTYnNICBaY+pbZeyjfZgg03rH5igfZqq7h
 zRef8+61qOSbnqCnupyOSJxEcA==
X-Google-Smtp-Source: ABdhPJy44heDH0/myzM0p4WV8kDMxZciiPNEvcqA3vLhsHkOYn6T2IYrGqjVF1OkN3TnBwEJXU4emg==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr2326509wmb.101.1631626736944; 
 Tue, 14 Sep 2021 06:38:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j18sm10195344wro.1.2021.09.14.06.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:38:56 -0700 (PDT)
Date: Tue, 14 Sep 2021 15:38:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
Message-ID: <YUCl7cHXpgGa6DhP@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <YTj2scNdCHAdF+cl@phenom.ffwll.local>
 <0bb5f8e0-9c42-c97f-16bd-8dbe0f878157@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bb5f8e0-9c42-c97f-16bd-8dbe0f878157@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Sep 09, 2021 at 08:22:59AM +0200, Christian König wrote:
> Am 08.09.21 um 19:45 schrieb Daniel Vetter:
> > On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > As the finished fence is the one that is exposed to userspace, and
> > > therefore the one that other operations, like atomic update, would
> > > block on, we need to propagate the deadline from from the finished
> > > fence to the actual hw fence.
> > > 
> > > v2: Split into drm_sched_fence_set_parent() (ckoenig)
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
> > >   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> > >   include/drm/gpu_scheduler.h             |  8 ++++++
> > >   3 files changed, 43 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > > index bcea035cf4c6..4fc41a71d1c7 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> > >   	dma_fence_put(&fence->scheduled);
> > >   }
> > > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> > > +						  ktime_t deadline)
> > > +{
> > > +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&fence->lock, flags);
> > > +
> > > +	/* If we already have an earlier deadline, keep it: */
> > > +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > > +	    ktime_before(fence->deadline, deadline)) {
> > > +		spin_unlock_irqrestore(&fence->lock, flags);
> > > +		return;
> > > +	}
> > > +
> > > +	fence->deadline = deadline;
> > > +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > > +
> > > +	spin_unlock_irqrestore(&fence->lock, flags);
> > > +
> > > +	if (fence->parent)
> > > +		dma_fence_set_deadline(fence->parent, deadline);
> > > +}
> > > +
> > >   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> > >   	.get_driver_name = drm_sched_fence_get_driver_name,
> > >   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> > > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> > >   	.get_driver_name = drm_sched_fence_get_driver_name,
> > >   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> > >   	.release = drm_sched_fence_release_finished,
> > > +	.set_deadline = drm_sched_fence_set_deadline_finished,
> > >   };
> > >   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > > @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > >   }
> > >   EXPORT_SYMBOL(to_drm_sched_fence);
> > > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > > +				struct dma_fence *fence)
> > > +{
> > > +	s_fence->parent = dma_fence_get(fence);
> > > +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > +		     &s_fence->finished.flags))
> > Don't you need the spinlock here too to avoid races? test_bit is very
> > unordered, so guarantees nothing. Spinlock would need to be both around
> > ->parent = and the test_bit.
> > 
> > Entirely aside, but there's discussions going on to preallocate the hw
> > fence somehow. If we do that we could make the deadline forwarding
> > lockless here. Having a spinlock just to set the parent is a bit annoying
> 
> Well previously we didn't needed the spinlock to set the parent because the
> parent wasn't used outside of the main thread.
> 
> This becomes an issue now because we can race with setting the deadline. So
> yeah we probably do need the spinlock here now.

Yeah tbh this is the part I don't like, because it means the scheduler
thread locking becomes more complex.

We might need to look at this again when we include stuff like boosting
priorities and things like that. Maybe it would be better if we have a
request queue which the scheduler thread could then pick up whenever it
gets around to the next scheduling decision?

I think for now just the spinlock in more places should be fine.
-Daniel


> Christian.
> 
> > ...
> > 
> > Alternative is that you do this locklessly with barriers and a _lot_ of
> > comments. Would be good to benchmark whether the overhead matters though
> > first.
> > -Daniel
> > 
> > > +		dma_fence_set_deadline(fence, s_fence->deadline);
> > > +}
> > > +
> > >   struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> > >   					      void *owner)
> > >   {
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 595e47ff7d06..27bf0ac0625f 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
> > >   		drm_sched_fence_scheduled(s_fence);
> > >   		if (!IS_ERR_OR_NULL(fence)) {
> > > -			s_fence->parent = dma_fence_get(fence);
> > > +			drm_sched_fence_set_parent(s_fence, fence);
> > >   			r = dma_fence_add_callback(fence, &sched_job->cb,
> > >   						   drm_sched_job_done_cb);
> > >   			if (r == -ENOENT)
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index 7f77a455722c..158ddd662469 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -238,6 +238,12 @@ struct drm_sched_fence {
> > >            */
> > >   	struct dma_fence		finished;
> > > +	/**
> > > +	 * @deadline: deadline set on &drm_sched_fence.finished which
> > > +	 * potentially needs to be propagated to &drm_sched_fence.parent
> > > +	 */
> > > +	ktime_t				deadline;
> > > +
> > >           /**
> > >            * @parent: the fence returned by &drm_sched_backend_ops.run_job
> > >            * when scheduling the job on hardware. We signal the
> > > @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> > >   				   enum drm_sched_priority priority);
> > >   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> > > +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > > +				struct dma_fence *fence);
> > >   struct drm_sched_fence *drm_sched_fence_alloc(
> > >   	struct drm_sched_entity *s_entity, void *owner);
> > >   void drm_sched_fence_init(struct drm_sched_fence *fence,
> > > -- 
> > > 2.31.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
