Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B954AB8C3B
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9D710E264;
	Thu, 15 May 2025 16:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d3gd1Wcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B70A10E264;
 Thu, 15 May 2025 16:22:30 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-742666a96fdso225864b3a.2; 
 Thu, 15 May 2025 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747326149; x=1747930949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dnuHITISbZCryzcYYfJ1faiJN4OA5KhLLbpmpip+YE=;
 b=d3gd1WcxFBThpyq0FFdF3tItMsNI80+210ONjUeHuAY/UGRDLAZRAt3THi/qfaY9dM
 VzrnE3hZQAXVgCnEFbWkWSVUk01cv2YalQIl5Crzld87Yz+0hwY74VutHIMsNMnQrzRP
 JrCAL+zprxiAG9eIJ4AUVfUWPUIiIWB2fWIfVoWLH0V7GOACgEBxDOY0bnHf5G2UAyFt
 xUAESzXs4oBh4qnokBdMv/HUlpRsm7l2/tGuiej0SPRbWkCPoXpIA1o/EJEi5z+4m52i
 JxgnRAGrNPjtx71waKLqcqzFq26xPZ1Jc6+IE+ejWc3q9jfz8ZklkH+RZTm1QiERlAQe
 oHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747326149; x=1747930949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dnuHITISbZCryzcYYfJ1faiJN4OA5KhLLbpmpip+YE=;
 b=XEppBA1o3OKX13wenWyE+/WfNItP5xa5xA8d6IvJtAT6N/Mm6Sf9RYyIqWibEVqlMy
 PDBnXM8fqwV/8KpnRuyyno9mIEI1MNc8EJbulyVeEDmOGIUKOfOpevQJbftrk4yRl6Hm
 M2r2T0KY8o8r7JvP7pybJixXgPW8TKXlupfcIapqU8u+Xunjd+Vp1mVEaKui+NjNLUr9
 EhiT/WkVhmrlmeY3vQ8+Q9H0zQeDbmbFZJ/hXt2MCcNJGcytn/BX9fI4YWzGXOJ6daBW
 7D0FHLWI1LlMSGFNMDiQqYBbsEhpnXiScxT8ITVmdhoyQ4y/DQ0kgHOLV8R8NY6CYDAr
 vTZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNN3OjGGi8WtKqgze40+1nSLma350srC6n/bcCJouBEYWo/HD1ivoEywvZtzLVb/t64KYDguiuWXo=@lists.freedesktop.org,
 AJvYcCWIFnn6ebZf9JAXxMcbkRUlVrDFBWmYoh26UxbamXh/EgOjwNTpEuy6R0StCFfobFymJHbgtK4MmVq4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznL51S0GAlDBvoqLFh7TCUYUOpyNbWrIwaYDpA/LTQXMBxqHqS
 829lYWkKvAxXYqCmrzIUYsFF/lToTnd5srl/ldh4df3S5nuECeezH1qPDm65lKy7eXb+SxSTcHo
 gvRPWfJz5vEEKFbT0+MHJ/RppHQ0=
X-Gm-Gg: ASbGnctVnWFUbE+SyKbEiCBeYD10/nGlgRADLS8qI5Mk6x7dGTzb+WAxhrGVLbZ+/U6
 +CBz2idCt7Seh1c0/kOfuNB1psbgfSCoDwsEsX5D6dRvArXjmIwH+HgSPjPmxIsIut/OjRyqq5D
 6qDQ48aQDU77XqAy3YcJMyJL0kzCgd7WyL
X-Google-Smtp-Source: AGHT+IGDrppLeiEOAmcXZ4RatqM9xE1mB3QXgajVWSiOeBux307sSrkk+V8xrvG9oFf3pRfDxCa5jV0aozgF5xujnSA=
X-Received: by 2002:a05:6a00:440f:b0:73e:2b50:426 with SMTP id
 d2e1a72fcca58-74289346a54mr3873105b3a.4.1747326149270; Thu, 15 May 2025
 09:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
In-Reply-To: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 12:22:18 -0400
X-Gm-Features: AX0GCFt7Y11kBzniJeDYgnDSbJ3ImpGv0Tt7fACDmfGKpd_7Dr5U0_pV53pUE-A
Message-ID: <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Rob Clark <robdclark@chromium.org>
Cc: phasta@kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 15, 2025 at 12:15=E2=80=AFPM Rob Clark <robdclark@chromium.org>=
 wrote:
>
> On Thu, May 15, 2025 at 2:28=E2=80=AFAM Philipp Stanner <phasta@mailbox.o=
rg> wrote:
> >
> > Hello,
> >
> > On Wed, 2025-05-14 at 09:59 -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Similar to the existing credit limit mechanism, but applying to jobs
> > > enqueued to the scheduler but not yet run.
> > >
> > > The use case is to put an upper bound on preallocated, and
> > > potentially
> > > unneeded, pgtable pages.  When this limit is exceeded, pushing new
> > > jobs
> > > will block until the count drops below the limit.
> >
> > the commit message doesn't make clear why that's needed within the
> > scheduler.
> >
> > From what I understand from the cover letter, this is a (rare?) Vulkan
> > feature. And as important as Vulkan is, it's the drivers that implement
> > support for it. I don't see why the scheduler is a blocker.
>
> Maybe not rare, or at least it comes up with a group of deqp-vk tests ;-)
>
> Basically it is a way to throttle userspace to prevent it from OoM'ing
> itself.  (I suppose userspace could throttle itself, but it doesn't
> really know how much pre-allocation will need to be done for pgtable
> updates.)

For some context, other drivers have the concept of a "synchronous"
VM_BIND ioctl which completes immediately, and drivers implement it by
waiting for the whole thing to finish before returning. But this
doesn't work for native context, where everything has to be
asynchronous, so we're trying a new approach where we instead submit
an asynchronous bind for "normal" (non-sparse/driver internal)
allocations and only attach its out-fence to the in-fence of
subsequent submits to other queues. Once you do this then you need a
limit like this to prevent memory usage from pending page table
updates from getting out of control. Other drivers haven't needed this
yet, but they will when they get native context support.

Connor

>
> > All the knowledge about when to stop pushing into the entity is in the
> > driver, and the scheduler obtains all the knowledge about that from the
> > driver anyways.
> >
> > So you could do
> >
> > if (my_vulkan_condition())
> >    drm_sched_entity_push_job();
> >
> > couldn't you?
>
> It would need to reach in and use the sched's job_scheduled
> wait_queue_head_t...  if that isn't too ugly, maybe the rest could be
> implemented on top of sched.  But it seemed like a reasonable thing
> for the scheduler to support directly.
>
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
> > >  drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
> > >  include/drm/gpu_scheduler.h              | 13 ++++++++++++-
> > >  3 files changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index dc0e60d2c14b..c5f688362a34 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct
> > > drm_sched_entity *entity)
> > >   * under common lock for the struct drm_sched_entity that was set up
> > > for
> > >   * @sched_job in drm_sched_job_init().
> > >   */
> > > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >
> > Return code would need to be documented in the docstring, too. If we'd
> > go for that solution.
> >
> > >  {
> > >       struct drm_sched_entity *entity =3D sched_job->entity;
> > > +     struct drm_gpu_scheduler *sched =3D sched_job->sched;
> > >       bool first;
> > >       ktime_t submit_ts;
> > > +     int ret;
> > > +
> > > +     ret =3D wait_event_interruptible(
> > > +                     sched->job_scheduled,
> > > +                     atomic_read(&sched->enqueue_credit_count) <=3D
> > > +                     sched->enqueue_credit_limit);
> >
> > This very significantly changes the function's semantics. This function
> > is used in a great many drivers, and here it would be transformed into
> > a function that can block.
> >
> > From what I see below those credits are to be optional. But even if, it
> > needs to be clearly documented when a function can block.
>
> Sure.  The behavior changes only for drivers that use the
> enqueue_credit_limit, so other drivers should be unaffected.
>
> I can improve the docs.
>
> (Maybe push_credit or something else would be a better name than
> enqueue_credit?)
>
> >
> > > +     if (ret)
> > > +             return ret;
> > > +     atomic_add(sched_job->enqueue_credits, &sched-
> > > >enqueue_credit_count);
> > >
> > >       trace_drm_sched_job(sched_job, entity);
> > >       atomic_inc(entity->rq->sched->score);
> > > @@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct
> > > drm_sched_job *sched_job)
> > >                       spin_unlock(&entity->lock);
> > >
> > >                       DRM_ERROR("Trying to push to a killed
> > > entity\n");
> > > -                     return;
> > > +                     return -EINVAL;
> > >               }
> > >
> > >               rq =3D entity->rq;
> > > @@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct
> > > drm_sched_job *sched_job)
> > >
> > >               drm_sched_wakeup(sched);
> > >       }
> > > +
> > > +     return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_sched_entity_push_job);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 9412bffa8c74..1102cca69cb4 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct
> > > work_struct *w)
> > >
> > >       trace_drm_run_job(sched_job, entity);
> > >       fence =3D sched->ops->run_job(sched_job);
> > > +     atomic_sub(sched_job->enqueue_credits, &sched-
> > > >enqueue_credit_count);
> > >       complete_all(&entity->entity_idle);
> > >       drm_sched_fence_scheduled(s_fence, fence);
> > >
> > > @@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched, const struct drm_sched_init_
> > >
> > >       sched->ops =3D args->ops;
> > >       sched->credit_limit =3D args->credit_limit;
> > > +     sched->enqueue_credit_limit =3D args->enqueue_credit_limit;
> > >       sched->name =3D args->name;
> > >       sched->timeout =3D args->timeout;
> > >       sched->hang_limit =3D args->hang_limit;
> > > @@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched, const struct drm_sched_init_
> > >       INIT_LIST_HEAD(&sched->pending_list);
> > >       spin_lock_init(&sched->job_list_lock);
> > >       atomic_set(&sched->credit_count, 0);
> > > +     atomic_set(&sched->enqueue_credit_count, 0);
> > >       INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > >       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > >       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index da64232c989d..d830ffe083f1 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> > > dma_fence *f);
> > >   * @s_fence: contains the fences for the scheduling of job.
> > >   * @finish_cb: the callback for the finished fence.
> > >   * @credits: the number of credits this job contributes to the
> > > scheduler
> > > + * @enqueue_credits: the number of enqueue credits this job
> > > contributes
> > >   * @work: Helper to reschedule job kill to different context.
> > >   * @id: a unique id assigned to each job scheduled on the scheduler.
> > >   * @karma: increment on every hang caused by this job. If this
> > > exceeds the hang
> > > @@ -366,6 +367,7 @@ struct drm_sched_job {
> > >
> > >       enum drm_sched_priority         s_priority;
> > >       u32                             credits;
> > > +     u32                             enqueue_credits;
> >
> > What's the policy of setting this?
> >
> > drm_sched_job_init() and drm_sched_job_arm() are responsible for
> > initializing jobs.
>
> It should be set before drm_sched_entity_push_job().  I wouldn't
> really expect drivers to know the value at drm_sched_job_init() time.
> But they would by the time drm_sched_entity_push_job() is called.
>
> > >       /** @last_dependency: tracks @dependencies as they signal */
> > >       unsigned int                    last_dependency;
> > >       atomic_t                        karma;
> > > @@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
> > >   * @ops: backend operations provided by the driver.
> > >   * @credit_limit: the credit limit of this scheduler
> > >   * @credit_count: the current credit count of this scheduler
> > > + * @enqueue_credit_limit: the credit limit of jobs pushed to
> > > scheduler and not
> > > + *                        yet run
> > > + * @enqueue_credit_count: the current crdit count of jobs pushed to
> > > scheduler
> > > + *                        but not yet run
> > >   * @timeout: the time after which a job is removed from the
> > > scheduler.
> > >   * @name: name of the ring for which this scheduler is being used.
> > >   * @num_rqs: Number of run-queues. This is at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > > @@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
> > >       const struct drm_sched_backend_ops      *ops;
> > >       u32                             credit_limit;
> > >       atomic_t                        credit_count;
> > > +     u32                             enqueue_credit_limit;
> > > +     atomic_t                        enqueue_credit_count;
> > >       long                            timeout;
> > >       const char                      *name;
> > >       u32                             num_rqs;
> > > @@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
> > >   * @num_rqs: Number of run-queues. This may be at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > >   *        as there's usually one run-queue per priority, but may
> > > be less.
> > >   * @credit_limit: the number of credits this scheduler can hold from
> > > all jobs
> > > + * @enqueue_credit_limit: the number of credits that can be enqueued
> > > before
> > > + *                        drm_sched_entity_push_job() blocks
> >
> > Is it optional or not? Can it be deactivated?
> >
> > It seems to me that it is optional, and so far only used in msm. If
> > there are no other parties in need for that mechanism, the right place
> > to have this feature probably is msm, which has all the knowledge about
> > when to block already.
> >
>
> As with the existing credit_limit, it is optional.  Although I think
> it would be also useful for other drivers that use drm sched for
> VM_BIND queues, for the same reason.
>
> BR,
> -R
>
> >
> > Regards
> > P.
> >
> >
> > >   * @hang_limit: number of times to allow a job to hang before
> > > dropping it.
> > >   *           This mechanism is DEPRECATED. Set it to 0.
> > >   * @timeout: timeout value in jiffies for submitted jobs.
> > > @@ -564,6 +574,7 @@ struct drm_sched_init_args {
> > >       struct workqueue_struct *timeout_wq;
> > >       u32 num_rqs;
> > >       u32 credit_limit;
> > > +     u32 enqueue_credit_limit;
> > >       unsigned int hang_limit;
> > >       long timeout;
> > >       atomic_t *score;
> > > @@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> > >                      struct drm_sched_entity *entity,
> > >                      u32 credits, void *owner);
> > >  void drm_sched_job_arm(struct drm_sched_job *job);
> > > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > >  int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > >                                struct dma_fence *fence);
> > >  int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> >
