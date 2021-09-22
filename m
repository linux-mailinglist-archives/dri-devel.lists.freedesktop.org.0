Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F048C414C88
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3381A6EC62;
	Wed, 22 Sep 2021 14:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A09A6EC62
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 14:57:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so7762402wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BrU/KsrCEnifMc+fy3DgWiIyWg8Bqog2sCDUUAiwOq4=;
 b=pFK/z94pbsqPKqXftTspz6cdl9kTpye5aG9h63sOO5OCVqKp0oAj5WjkRnN6oErpzp
 Zvb/gHO6hrShuU/n6NFhj2Bq+XubYYw3/Xwy+IF5YfehWGN238+FlAxJQcSRk+qvaJcX
 uDLQEXVKrcm3/TnQGNhmZp7hk2pO52aiVxIOs3jFsy9A6RwEJaQycuSuxIPV0lo/tpO1
 yNG3RaTVAxPn8xnv5N9eeVRJUI5uYnVPjN0AMnPGXIL39wFl3aJ5gENyCJgMQv5K/9Yr
 theFALwkEnNf2Axwg8zkhuPykBTZuTzCxbX+YHVOMlmfCWtoGOIZVWH5e7A2KjzON0qk
 JEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BrU/KsrCEnifMc+fy3DgWiIyWg8Bqog2sCDUUAiwOq4=;
 b=ua4ZDzdwo8uQwW/jMeHQeRhC7xfZIDH9urL3Xky1EqbGuXGkwLpdiDpvvJnzOvd1hs
 oDS4TJk9bHMyuBA7/iCEjq/TKV076y8NDy7Y1aO5wTc57aQtSowPZpIGVCtpdenWTVoo
 SQh/LoeExvy6C/aSOLTXEeqlI0zwR1oCCtSKxM+18OIVFICxzcl5v9DBSpXL+HCrbxdQ
 gSwJJzih3xvbmSfpHLaYlvj7bYI+dWuefH7mbqWHHP389cbNjlMZzSQ/TM/rg8mCy0eA
 SRUKxNAS6WsZmkn++5/Zodqw9p2OtVkOZch9NM7HmcySQQcKAmwLDgDcDD3DyJkWHgx0
 17IA==
X-Gm-Message-State: AOAM533FjBhVaugmAL5D4u62SHeNLiXjHIs/nMtsAYbacKCKNtM5/jJ+
 op79uHQ0UxsaeytL4LYTpffrX7dAs664kp+7HL8=
X-Google-Smtp-Source: ABdhPJwuUrAfr0zttIsQhsaA7GxT4cjOgCwVQnnFYRFomGp8ouc6Lm6m5E4rJ+r2I7Aip0AsqQ7bIS2fSuqhJ0m50Hw=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr10845312wmr.168.1632322644676; 
 Wed, 22 Sep 2021 07:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <101628ea-23c9-4bc0-5abc-a5b71b0fccc1@amd.com>
 <CAF6AEGt+jiJLaTDVnnVrZm-766OhPfj9wESJxP-FrX3S_c67gQ@mail.gmail.com>
 <d8f43401-c673-b9ce-d5ca-090fec2cb4c3@amd.com>
 <CAF6AEGsnN8sEeXuefB--pDApXeWYR2RVss=jUnz0ORh68SBP1A@mail.gmail.com>
 <ff396c19-c6ed-5f25-32df-c404bc8ea661@amd.com>
In-Reply-To: <ff396c19-c6ed-5f25-32df-c404bc8ea661@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Sep 2021 08:01:56 -0700
Message-ID: <CAF6AEGupLaG2GuSvY0qerWD7sB6JAzDgyx_XP2eHYqy+Of5f0w@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>, 
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 22, 2021 at 7:31 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2021-09-21 11:32 p.m., Rob Clark wrote:
> > On Tue, Sep 21, 2021 at 7:18 PM Andrey Grodzovsky
> > <andrey.grodzovsky@amd.com> wrote:
> >>
> >> On 2021-09-21 4:47 p.m., Rob Clark wrote:
> >>> On Tue, Sep 21, 2021 at 1:09 PM Andrey Grodzovsky
> >>> <andrey.grodzovsky@amd.com> wrote:
> >>>> On 2021-09-03 2:47 p.m., Rob Clark wrote:
> >>>>
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> As the finished fence is the one that is exposed to userspace, and
> >>>>> therefore the one that other operations, like atomic update, would
> >>>>> block on, we need to propagate the deadline from from the finished
> >>>>> fence to the actual hw fence.
> >>>>>
> >>>>> v2: Split into drm_sched_fence_set_parent() (ckoenig)
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
> >>>>>     drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
> >>>>>     include/drm/gpu_scheduler.h             |  8 ++++++
> >>>>>     3 files changed, 43 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>> index bcea035cf4c6..4fc41a71d1c7 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> >>>>> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> >>>>>         dma_fence_put(&fence->scheduled);
> >>>>>     }
> >>>>>
> >>>>> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> >>>>> +                                               ktime_t deadline)
> >>>>> +{
> >>>>> +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
> >>>>> +     unsigned long flags;
> >>>>> +
> >>>>> +     spin_lock_irqsave(&fence->lock, flags);
> >>>>> +
> >>>>> +     /* If we already have an earlier deadline, keep it: */
> >>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> >>>>> +         ktime_before(fence->deadline, deadline)) {
> >>>>> +             spin_unlock_irqrestore(&fence->lock, flags);
> >>>>> +             return;
> >>>>> +     }
> >>>>> +
> >>>>> +     fence->deadline = deadline;
> >>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> >>>>> +
> >>>>> +     spin_unlock_irqrestore(&fence->lock, flags);
> >>>>> +
> >>>>> +     if (fence->parent)
> >>>>> +             dma_fence_set_deadline(fence->parent, deadline);
> >>>>> +}
> >>>>> +
> >>>>>     static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> >>>>>         .get_driver_name = drm_sched_fence_get_driver_name,
> >>>>>         .get_timeline_name = drm_sched_fence_get_timeline_name,
> >>>>> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> >>>>>         .get_driver_name = drm_sched_fence_get_driver_name,
> >>>>>         .get_timeline_name = drm_sched_fence_get_timeline_name,
> >>>>>         .release = drm_sched_fence_release_finished,
> >>>>> +     .set_deadline = drm_sched_fence_set_deadline_finished,
> >>>>>     };
> >>>>>
> >>>>>     struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> >>>>> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> >>>>>     }
> >>>>>     EXPORT_SYMBOL(to_drm_sched_fence);
> >>>>>
> >>>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> >>>>> +                             struct dma_fence *fence)
> >>>>> +{
> >>>>> +     s_fence->parent = dma_fence_get(fence);
> >>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >>>>> +                  &s_fence->finished.flags))
> >>>>> +             dma_fence_set_deadline(fence, s_fence->deadline);
> >>>> I believe above you should pass be s_fence->finished to
> >>>> dma_fence_set_deadline
> >>>> instead it fence which is the HW fence itself.
> >>> Hmm, unless this has changed recently with some patches I don't have,
> >>> s_fence->parent is the one signalled by hw, so it is the one we want
> >>> to set the deadline on
> >>>
> >>> BR,
> >>> -R
> >>
> >> No it didn't change. But then when exactly will
> >> drm_sched_fence_set_deadline_finished
> >> execute such that fence->parent != NULL ? In other words, I am not clear
> >> how propagation
> >> happens otherwise - if dma_fence_set_deadline is called with the HW
> >> fence then the assumption
> >> here is that driver provided driver specific
> >> dma_fence_ops.dma_fence_set_deadline callback executes
> >> but I was under impression that drm_sched_fence_set_deadline_finished is
> >> the one that propagates
> >> the deadline to the HW fence's callback and for it to execute
> >> dma_fence_set_deadline needs to be called
> >> with s_fence->finished.
> > Assuming I didn't screw up drm/msm conversion to scheduler,
> > &s_fence->finished is the one that will be returned to userspace.. and
> > later passed back to kernel for atomic commit (or to the compositor).
> > So it is the one that fence->set_deadline() will be called on.  But
> > s_fence->parent is the actual hw fence that needs to know about the
> > deadline.  Depending on whether or not the job has been written into
> > hw ringbuffer or not, there are two cases:
> >
> > 1) not scheduled yet, s_fence will store the deadline and propagate it
> > later once s_fence->parent is known
>
>
> And by later you mean the call to drm_sched_fence_set_parent
> after HW fence is returned  ? If yes I think i get it now.

Yup :-)

BR,
-R

> Andrey
>
>
> > 2) already scheduled, in which case s_fence->finished.set_deadline
> > will propagate it directly to the real fence
> >
> > BR,
> > -R
> >
> >> Andrey
> >>
> >>
> >>
> >>>> Andrey
> >>>>
> >>>>
> >>>>> +}
> >>>>> +
> >>>>>     struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> >>>>>                                               void *owner)
> >>>>>     {
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> index 595e47ff7d06..27bf0ac0625f 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
> >>>>>                 drm_sched_fence_scheduled(s_fence);
> >>>>>
> >>>>>                 if (!IS_ERR_OR_NULL(fence)) {
> >>>>> -                     s_fence->parent = dma_fence_get(fence);
> >>>>> +                     drm_sched_fence_set_parent(s_fence, fence);
> >>>>>                         r = dma_fence_add_callback(fence, &sched_job->cb,
> >>>>>                                                    drm_sched_job_done_cb);
> >>>>>                         if (r == -ENOENT)
> >>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> >>>>> index 7f77a455722c..158ddd662469 100644
> >>>>> --- a/include/drm/gpu_scheduler.h
> >>>>> +++ b/include/drm/gpu_scheduler.h
> >>>>> @@ -238,6 +238,12 @@ struct drm_sched_fence {
> >>>>>              */
> >>>>>         struct dma_fence                finished;
> >>>>>
> >>>>> +     /**
> >>>>> +      * @deadline: deadline set on &drm_sched_fence.finished which
> >>>>> +      * potentially needs to be propagated to &drm_sched_fence.parent
> >>>>> +      */
> >>>>> +     ktime_t                         deadline;
> >>>>> +
> >>>>>             /**
> >>>>>              * @parent: the fence returned by &drm_sched_backend_ops.run_job
> >>>>>              * when scheduling the job on hardware. We signal the
> >>>>> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >>>>>                                    enum drm_sched_priority priority);
> >>>>>     bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> >>>>>
> >>>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> >>>>> +                             struct dma_fence *fence);
> >>>>>     struct drm_sched_fence *drm_sched_fence_alloc(
> >>>>>         struct drm_sched_entity *s_entity, void *owner);
> >>>>>     void drm_sched_fence_init(struct drm_sched_fence *fence,
