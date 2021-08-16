Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B36B3ED9FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 17:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B2C89FC5;
	Mon, 16 Aug 2021 15:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D061C89AB3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 15:38:23 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v2so16694773edq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Zz0i158XnyKqiJFtiKT4TYdtbve1kSwEIiogz0ebpoI=;
 b=JxwjN2iDUBGXxVXoqY/+xQUkSXCMijRzxtlhtizG5c12hoGUQzZtddjck5FXqPfjIT
 pxXrkXYyVczl6qct/IPmvQYqPYZQdW9l4urX5hqE+DZk8R7Djy87nDpcnx0SM4I0gEii
 mowizmb1hHSAf1NHdsRXQ9JixP63lNOIk2i4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Zz0i158XnyKqiJFtiKT4TYdtbve1kSwEIiogz0ebpoI=;
 b=dFDCEp4+Qh2HeYl1yelqOdNH1/ZxcXwllWygLNH6BiILBFIwhhxuiPUHxfXyFAdBKv
 jQqkjiTcvqnI4BcGgVd8FIrI9zujDf7w/Pi+O1dt/W0/i14PGNzOYCjNOCmP4DqDyjMA
 iE7YAVQlTwfROBNiZPTZiPLe6orAkBFSauRdrpa4ywi/7aUmLOJGtEMLstRUtBJ8CTX3
 MjLhPfbg20BUqJumT9dj/AdenkDe0yWIvMJizYcPxufNLoylzY/pguVNWRARfxEOg+NV
 +4IamS4fQ4Pop45q+vRg4ToZv9j6N9oKxvs0sG5LGnYIEjg+QafwO58pKKnI7w2rV0O4
 3wKg==
X-Gm-Message-State: AOAM530lbQ3aNprLBmB+Sav/8s63iYs8PeZ06FSu3Qn2POIfXYko6wL5
 XKlYvluKDZWyIzSgdbQbc9G+rw==
X-Google-Smtp-Source: ABdhPJyDPOVbyYl5vIg+1nXNQXy12uOWye4psZro1XNL/+QDZbWjstraISzUJO4itysqHwRE9W4sMA==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr4120350edd.151.1629128302348; 
 Mon, 16 Aug 2021 08:38:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id kz15sm3838111ejc.103.2021.08.16.08.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 08:38:21 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:38:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v2 4/5] drm/scheduler: Add fence deadline support
Message-ID: <YRqGazgGJ2NAIzg2@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
References: <20210807183804.459850-1-robdclark@gmail.com>
 <20210807183804.459850-5-robdclark@gmail.com>
 <e28020c5-3da3-c721-96df-9a115f105bf7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e28020c5-3da3-c721-96df-9a115f105bf7@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 16, 2021 at 12:14:35PM +0200, Christian König wrote:
> Am 07.08.21 um 20:37 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > As the finished fence is the one that is exposed to userspace, and
> > therefore the one that other operations, like atomic update, would
> > block on, we need to propagate the deadline from from the finished
> > fence to the actual hw fence.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>

I guess you're already letting the compositor run at a higher gpu priority
so that your deadline'd drm_sched_job isn't stuck behind the app rendering
the next frame?

I'm not sure whether you wire that one up as part of the conversion to
drm/sched. Without that I think we might need to ponder how we can do a
prio-boost for these, e.g. within a scheduling class we pick the jobs with
the nearest deadline first, before we pick others.
-Daniel

> > ---
> >   drivers/gpu/drm/scheduler/sched_fence.c | 25 +++++++++++++++++++++++++
> >   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
> >   include/drm/gpu_scheduler.h             |  6 ++++++
> >   3 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 69de2c76731f..f389dca44185 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> >   	dma_fence_put(&fence->scheduled);
> >   }
> > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> > +						  ktime_t deadline)
> > +{
> > +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&fence->lock, flags);
> > +
> > +	/* If we already have an earlier deadline, keep it: */
> > +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > +	    ktime_before(fence->deadline, deadline)) {
> > +		spin_unlock_irqrestore(&fence->lock, flags);
> > +		return;
> > +	}
> > +
> > +	fence->deadline = deadline;
> > +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > +
> > +	spin_unlock_irqrestore(&fence->lock, flags);
> > +
> > +	if (fence->parent)
> > +		dma_fence_set_deadline(fence->parent, deadline);
> > +}
> > +
> >   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> >   	.get_driver_name = drm_sched_fence_get_driver_name,
> >   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> >   	.get_driver_name = drm_sched_fence_get_driver_name,
> >   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> >   	.release = drm_sched_fence_release_finished,
> > +	.set_deadline = drm_sched_fence_set_deadline_finished,
> >   };
> >   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a2a953693b45..3ab0900d3596 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
> >   		if (!IS_ERR_OR_NULL(fence)) {
> >   			s_fence->parent = dma_fence_get(fence);
> > +			if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > +				     &s_fence->finished.flags))
> > +				dma_fence_set_deadline(fence, s_fence->deadline);
> 
> Maybe move this into a dma_sched_fence_set_parent() function.
> 
> Apart from that looks good to me.
> 
> Regards,
> Christian.
> 
> >   			r = dma_fence_add_callback(fence, &sched_job->cb,
> >   						   drm_sched_job_done_cb);
> >   			if (r == -ENOENT)
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index d18af49fd009..0f08ade614ae 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -144,6 +144,12 @@ struct drm_sched_fence {
> >            */
> >   	struct dma_fence		finished;
> > +	/**
> > +	 * @deadline: deadline set on &drm_sched_fence.finished which
> > +	 * potentially needs to be propagated to &drm_sched_fence.parent
> > +	 */
> > +	ktime_t				deadline;
> > +
> >           /**
> >            * @parent: the fence returned by &drm_sched_backend_ops.run_job
> >            * when scheduling the job on hardware. We signal the
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
