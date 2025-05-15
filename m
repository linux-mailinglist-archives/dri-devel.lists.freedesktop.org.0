Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F8AB8C0D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECDD10E908;
	Thu, 15 May 2025 16:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UK6iTSbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734110E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:15:20 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3d817bc6eb0so5651365ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747325720; x=1747930520;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prsqP4nD217ZbIH9QBiPBpSKysXGw5zY0pcLHNKvFfo=;
 b=UK6iTSbj239+sg7xpcfoPA8piZ2Np474/Qc5LTiKKxNG6fIrljo0yAcYJSUwPAm8Cr
 nR7hkiw6yaP/sHG/47dJmQp+2wshVjFRwgcvbkuRQPCEKCj81hBDo1Df7ruk2sxbdhyW
 sj/blGWSzoCPl4954fwAejbx9diPeZ2DQQ0Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325720; x=1747930520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prsqP4nD217ZbIH9QBiPBpSKysXGw5zY0pcLHNKvFfo=;
 b=BlB6k2ZPq11vkYg0XLA+bTVOpiGAih0AGYJ8DJQCx9avDL311CtrN9pfgzRM89SjuO
 icEtaezkmjaQVy7n+XQ/TwGqzN5Wm+7i+VfIqNT7AKdtA+zz1WZGXfsQFPAWRGh2uSjM
 GK4lOdW/9KjDIG4SaiIuOJNLyOJWydPSvdrXKP271Kif7f9jZuSfsmIt1/Pkk3+HEKeT
 3fS/06UI7LFqj2bZ/GH/SBqXsahoEJjaaD5YBgKc8DIxVv/VCtj7iK40GDlDwftAwh/l
 Lt2jfYqjZxq5nggAgcEBuo5/zQARogNZQvPbcuCPp8WiaSy/pbTTIOTWc+VDN1itRZmS
 tleQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw82RdMrl9WPLSDHIPt6Gc9eB4HqI5GrxIofdXXIfUUldfRNMmThDbo5G634BHANdG+thuq6sLrgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOpTUm8yqZv3rePHZBcBTmTR8dmIlfiePX6cQhQXKnX1kz8mG4
 +zBiFTG4KNH5lE2iJU9l3EftMufXgq3I2OqK9B1bHG7IrPAWx2oKxXVRGfVCBhR4QfAmvSIi24g
 xO95HfqhJxcbY53L213RmrwDaC8QrVEo282BdDI55
X-Gm-Gg: ASbGncvU+5/1vtGb9QbH16J+CANU9+CX3EG3kmFIx8zWCSsByaLI7GoMZTk9vGt6Ty5
 sXsa0BeYd0hvaYGmRXFi/Wl5d6a8eQEGi+TIyUPy6seNHZYB0PlQGQPmDKM3k6Ax6jG7nFWzOY8
 XqQSE+7Jr4ePM3IN/P+H0cwvl3uDLP3/2ayW7Wp70SAOlDwIA4Ioi9soCtacqxdmw6BZ4=
X-Google-Smtp-Source: AGHT+IFkg4IcMTLJxZT2Ip8DIdDTDuTHvjElsNxFmWMgla8933AUxoHLWahuhWUOpQ9EN6P27inOKdRo2eE+a34iAwI=
X-Received: by 2002:a05:6e02:1745:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3db843383f3mr3428435ab.19.1747325719826; Thu, 15 May 2025
 09:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
In-Reply-To: <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 15 May 2025 09:15:08 -0700
X-Gm-Features: AX0GCFtFODqrTO3H3dBowcUSsEdz5qQZdMlabkP_W3dElVRS6DjZ3druTsaG-j8
Message-ID: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: phasta@kernel.org
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Connor Abbott <cwabbott0@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>,
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

On Thu, May 15, 2025 at 2:28=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> Hello,
>
> On Wed, 2025-05-14 at 09:59 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Similar to the existing credit limit mechanism, but applying to jobs
> > enqueued to the scheduler but not yet run.
> >
> > The use case is to put an upper bound on preallocated, and
> > potentially
> > unneeded, pgtable pages.  When this limit is exceeded, pushing new
> > jobs
> > will block until the count drops below the limit.
>
> the commit message doesn't make clear why that's needed within the
> scheduler.
>
> From what I understand from the cover letter, this is a (rare?) Vulkan
> feature. And as important as Vulkan is, it's the drivers that implement
> support for it. I don't see why the scheduler is a blocker.

Maybe not rare, or at least it comes up with a group of deqp-vk tests ;-)

Basically it is a way to throttle userspace to prevent it from OoM'ing
itself.  (I suppose userspace could throttle itself, but it doesn't
really know how much pre-allocation will need to be done for pgtable
updates.)

> All the knowledge about when to stop pushing into the entity is in the
> driver, and the scheduler obtains all the knowledge about that from the
> driver anyways.
>
> So you could do
>
> if (my_vulkan_condition())
>    drm_sched_entity_push_job();
>
> couldn't you?

It would need to reach in and use the sched's job_scheduled
wait_queue_head_t...  if that isn't too ugly, maybe the rest could be
implemented on top of sched.  But it seemed like a reasonable thing
for the scheduler to support directly.

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
> >  drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
> >  include/drm/gpu_scheduler.h              | 13 ++++++++++++-
> >  3 files changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index dc0e60d2c14b..c5f688362a34 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct
> > drm_sched_entity *entity)
> >   * under common lock for the struct drm_sched_entity that was set up
> > for
> >   * @sched_job in drm_sched_job_init().
> >   */
> > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>
> Return code would need to be documented in the docstring, too. If we'd
> go for that solution.
>
> >  {
> >       struct drm_sched_entity *entity =3D sched_job->entity;
> > +     struct drm_gpu_scheduler *sched =3D sched_job->sched;
> >       bool first;
> >       ktime_t submit_ts;
> > +     int ret;
> > +
> > +     ret =3D wait_event_interruptible(
> > +                     sched->job_scheduled,
> > +                     atomic_read(&sched->enqueue_credit_count) <=3D
> > +                     sched->enqueue_credit_limit);
>
> This very significantly changes the function's semantics. This function
> is used in a great many drivers, and here it would be transformed into
> a function that can block.
>
> From what I see below those credits are to be optional. But even if, it
> needs to be clearly documented when a function can block.

Sure.  The behavior changes only for drivers that use the
enqueue_credit_limit, so other drivers should be unaffected.

I can improve the docs.

(Maybe push_credit or something else would be a better name than
enqueue_credit?)

>
> > +     if (ret)
> > +             return ret;
> > +     atomic_add(sched_job->enqueue_credits, &sched-
> > >enqueue_credit_count);
> >
> >       trace_drm_sched_job(sched_job, entity);
> >       atomic_inc(entity->rq->sched->score);
> > @@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct
> > drm_sched_job *sched_job)
> >                       spin_unlock(&entity->lock);
> >
> >                       DRM_ERROR("Trying to push to a killed
> > entity\n");
> > -                     return;
> > +                     return -EINVAL;
> >               }
> >
> >               rq =3D entity->rq;
> > @@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct
> > drm_sched_job *sched_job)
> >
> >               drm_sched_wakeup(sched);
> >       }
> > +
> > +     return 0;
> >  }
> >  EXPORT_SYMBOL(drm_sched_entity_push_job);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 9412bffa8c74..1102cca69cb4 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> >
> >       trace_drm_run_job(sched_job, entity);
> >       fence =3D sched->ops->run_job(sched_job);
> > +     atomic_sub(sched_job->enqueue_credits, &sched-
> > >enqueue_credit_count);
> >       complete_all(&entity->entity_idle);
> >       drm_sched_fence_scheduled(s_fence, fence);
> >
> > @@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> >
> >       sched->ops =3D args->ops;
> >       sched->credit_limit =3D args->credit_limit;
> > +     sched->enqueue_credit_limit =3D args->enqueue_credit_limit;
> >       sched->name =3D args->name;
> >       sched->timeout =3D args->timeout;
> >       sched->hang_limit =3D args->hang_limit;
> > @@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> >       INIT_LIST_HEAD(&sched->pending_list);
> >       spin_lock_init(&sched->job_list_lock);
> >       atomic_set(&sched->credit_count, 0);
> > +     atomic_set(&sched->enqueue_credit_count, 0);
> >       INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> >       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> >       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index da64232c989d..d830ffe083f1 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> > dma_fence *f);
> >   * @s_fence: contains the fences for the scheduling of job.
> >   * @finish_cb: the callback for the finished fence.
> >   * @credits: the number of credits this job contributes to the
> > scheduler
> > + * @enqueue_credits: the number of enqueue credits this job
> > contributes
> >   * @work: Helper to reschedule job kill to different context.
> >   * @id: a unique id assigned to each job scheduled on the scheduler.
> >   * @karma: increment on every hang caused by this job. If this
> > exceeds the hang
> > @@ -366,6 +367,7 @@ struct drm_sched_job {
> >
> >       enum drm_sched_priority         s_priority;
> >       u32                             credits;
> > +     u32                             enqueue_credits;
>
> What's the policy of setting this?
>
> drm_sched_job_init() and drm_sched_job_arm() are responsible for
> initializing jobs.

It should be set before drm_sched_entity_push_job().  I wouldn't
really expect drivers to know the value at drm_sched_job_init() time.
But they would by the time drm_sched_entity_push_job() is called.

> >       /** @last_dependency: tracks @dependencies as they signal */
> >       unsigned int                    last_dependency;
> >       atomic_t                        karma;
> > @@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
> >   * @ops: backend operations provided by the driver.
> >   * @credit_limit: the credit limit of this scheduler
> >   * @credit_count: the current credit count of this scheduler
> > + * @enqueue_credit_limit: the credit limit of jobs pushed to
> > scheduler and not
> > + *                        yet run
> > + * @enqueue_credit_count: the current crdit count of jobs pushed to
> > scheduler
> > + *                        but not yet run
> >   * @timeout: the time after which a job is removed from the
> > scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> >   * @num_rqs: Number of run-queues. This is at most
> > DRM_SCHED_PRIORITY_COUNT,
> > @@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
> >       const struct drm_sched_backend_ops      *ops;
> >       u32                             credit_limit;
> >       atomic_t                        credit_count;
> > +     u32                             enqueue_credit_limit;
> > +     atomic_t                        enqueue_credit_count;
> >       long                            timeout;
> >       const char                      *name;
> >       u32                             num_rqs;
> > @@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
> >   * @num_rqs: Number of run-queues. This may be at most
> > DRM_SCHED_PRIORITY_COUNT,
> >   *        as there's usually one run-queue per priority, but may
> > be less.
> >   * @credit_limit: the number of credits this scheduler can hold from
> > all jobs
> > + * @enqueue_credit_limit: the number of credits that can be enqueued
> > before
> > + *                        drm_sched_entity_push_job() blocks
>
> Is it optional or not? Can it be deactivated?
>
> It seems to me that it is optional, and so far only used in msm. If
> there are no other parties in need for that mechanism, the right place
> to have this feature probably is msm, which has all the knowledge about
> when to block already.
>

As with the existing credit_limit, it is optional.  Although I think
it would be also useful for other drivers that use drm sched for
VM_BIND queues, for the same reason.

BR,
-R

>
> Regards
> P.
>
>
> >   * @hang_limit: number of times to allow a job to hang before
> > dropping it.
> >   *           This mechanism is DEPRECATED. Set it to 0.
> >   * @timeout: timeout value in jiffies for submitted jobs.
> > @@ -564,6 +574,7 @@ struct drm_sched_init_args {
> >       struct workqueue_struct *timeout_wq;
> >       u32 num_rqs;
> >       u32 credit_limit;
> > +     u32 enqueue_credit_limit;
> >       unsigned int hang_limit;
> >       long timeout;
> >       atomic_t *score;
> > @@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >                      struct drm_sched_entity *entity,
> >                      u32 credits, void *owner);
> >  void drm_sched_job_arm(struct drm_sched_job *job);
> > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> >  int drm_sched_job_add_dependency(struct drm_sched_job *job,
> >                                struct dma_fence *fence);
> >  int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
>
