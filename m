Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C076E3CC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648D610E5E9;
	Thu,  3 Aug 2023 08:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0610E5D8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:58:39 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bca018afe8so109621a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691053118; x=1691657918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZaij3UzVrP13S+LxMJrss2gZRTVilN33X2w9fSdRvg=;
 b=cUPi2R+IYuEJsOcl6dvzJfxwfmqf1LBHMKHdAaIWH+bt1eZwk+KBTuhJrz64l1WV/K
 lmKdUhaoirts5rPG+wkPGn5+z3SYPndYxZ20dbAh1FwE0UXstzrz0+7J0HBv6JzijNpo
 W5rFMDi5HP2FKW2CxxG7CxpDDH0Ev72Jvz3LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691053118; x=1691657918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZaij3UzVrP13S+LxMJrss2gZRTVilN33X2w9fSdRvg=;
 b=mGBJqjoi125CQv31ziJPZBH+3J17eiBm7Ejk0ic0xvT9l1lXYn9Js3rc6CVp4qHPg+
 FWoDkNrSvTYlspWAJ2YI4CxPNsjVQSCI0lqq07ZJe9ixYa3p+u6ZI8scGfv1ewfVy+LL
 58IPeJxSqsOzQU4JOjilcmd/zw1KWXNVb6dBvy/nVA/gVh2JSbn5NDuBg/ng0G6yLaAK
 Ebf6fZUxeFZAbwUjUma3PQns+Ig4IthNrmHG4Yy0jOQdDOVKTVkIaiKVgFoVZq6IA4nK
 XmzvfYpBU4Tl7eKD5z2dOF2umXz1uu07MazmVqP297PtFBMgNW29DqhM3JLrotNGz7mP
 zyLg==
X-Gm-Message-State: ABy/qLanHzBA1hO1x/wWZijQu8Ife8Ml8tTqL4sLKcAKd0h8v3W75gel
 tENNOv0facm/9/8wgXg2mUx3NitLy3xdutZtYNyMWg==
X-Google-Smtp-Source: APBJJlHUrgWbmX2tOsLx0YictzkeVqREBFrG30QtWmMj6iGy9xytHnHdhENZGIu1UqqdQnFbMGuIOphfJC5kNSEyWQo=
X-Received: by 2002:a05:6870:d107:b0:1bb:724f:2bca with SMTP id
 e7-20020a056870d10700b001bb724f2bcamr14692224oac.1.1691053118429; Thu, 03 Aug
 2023 01:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
In-Reply-To: <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Aug 2023 10:58:26 +0200
Message-ID: <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 robdclark@chromium.org, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 10:53, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 01.08.23 um 22:50 schrieb Matthew Brost:
> > Add generic schedule message interface which sends messages to backend
> > from the drm_gpu_scheduler main submission thread. The idea is some of
> > these messages modify some state in drm_sched_entity which is also
> > modified during submission. By scheduling these messages and submission
> > in the same thread their is not race changing states in
> > drm_sched_entity.
> >
> > This interface will be used in XE, new Intel GPU driver, to cleanup,
> > suspend, resume, and change scheduling properties of a drm_sched_entity=
.
> >
> > The interface is designed to be generic and extendable with only the
> > backend understanding the messages.
>
> I'm still extremely frowned on this.
>
> If you need this functionality then let the drivers decide which
> runqueue the scheduler should use.
>
> When you then create a single threaded runqueue you can just submit work
> to it and serialize this with the scheduler work.
>
> This way we wouldn't duplicate this core kernel function inside the
> scheduler.

Yeah that's essentially the design we picked for the tdr workers,
where some drivers have requirements that all tdr work must be done on
the same thread (because of cross-engine coordination issues). But
that would require that we rework the scheduler as a pile of
self-submitting work items, and I'm not sure that actually fits all
that well into the core workqueue interfaces either.

Worst case I think this isn't a dead-end and can be refactored to
internally use the workqueue services, with the new functions here
just being dumb wrappers until everyone is converted over. So it
doesn't look like an expensive mistake, if it turns out to be a
mistake.
-Daniel


> Regards,
> Christian.
>
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++=
-
> >   include/drm/gpu_scheduler.h            | 29 +++++++++++++-
> >   2 files changed, 78 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 2597fb298733..84821a124ca2 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **s=
ched_list,
> >   }
> >   EXPORT_SYMBOL(drm_sched_pick_best);
> >
> > +/**
> > + * drm_sched_add_msg - add scheduler message
> > + *
> > + * @sched: scheduler instance
> > + * @msg: message to be added
> > + *
> > + * Can and will pass an jobs waiting on dependencies or in a runnable =
queue.
> > + * Messages processing will stop if schedule run wq is stopped and res=
ume when
> > + * run wq is started.
> > + */
> > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > +                    struct drm_sched_msg *msg)
> > +{
> > +     spin_lock(&sched->job_list_lock);
> > +     list_add_tail(&msg->link, &sched->msgs);
> > +     spin_unlock(&sched->job_list_lock);
> > +
> > +     drm_sched_run_wq_queue(sched);
> > +}
> > +EXPORT_SYMBOL(drm_sched_add_msg);
> > +
> > +/**
> > + * drm_sched_get_msg - get scheduler message
> > + *
> > + * @sched: scheduler instance
> > + *
> > + * Returns NULL or message
> > + */
> > +static struct drm_sched_msg *
> > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > +{
> > +     struct drm_sched_msg *msg;
> > +
> > +     spin_lock(&sched->job_list_lock);
> > +     msg =3D list_first_entry_or_null(&sched->msgs,
> > +                                    struct drm_sched_msg, link);
> > +     if (msg)
> > +             list_del(&msg->link);
> > +     spin_unlock(&sched->job_list_lock);
> > +
> > +     return msg;
> > +}
> > +
> >   /**
> >    * drm_sched_main - main scheduler thread
> >    *
> > @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
> >               container_of(w, struct drm_gpu_scheduler, work_run);
> >       struct drm_sched_entity *entity;
> >       struct drm_sched_job *cleanup_job;
> > +     struct drm_sched_msg *msg;
> >       int r;
> >
> >       if (READ_ONCE(sched->pause_run_wq))
> > @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *=
w)
> >
> >       cleanup_job =3D drm_sched_get_cleanup_job(sched);
> >       entity =3D drm_sched_select_entity(sched);
> > +     msg =3D drm_sched_get_msg(sched);
> >
> > -     if (!entity && !cleanup_job)
> > +     if (!entity && !cleanup_job && !msg)
> >               return; /* No more work */
> >
> >       if (cleanup_job)
> >               sched->ops->free_job(cleanup_job);
> > +     if (msg)
> > +             sched->ops->process_msg(msg);
> >
> >       if (entity) {
> >               struct dma_fence *fence;
> > @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
> >               sched_job =3D drm_sched_entity_pop_job(entity);
> >               if (!sched_job) {
> >                       complete_all(&entity->entity_idle);
> > -                     if (!cleanup_job)
> > +                     if (!cleanup_job && !msg)
> >                               return; /* No more work */
> >                       goto again;
> >               }
> > @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
> >
> >       init_waitqueue_head(&sched->job_scheduled);
> >       INIT_LIST_HEAD(&sched->pending_list);
> > +     INIT_LIST_HEAD(&sched->msgs);
> >       spin_lock_init(&sched->job_list_lock);
> >       atomic_set(&sched->hw_rq_count, 0);
> >       INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index df1993dd44ae..267bd060d178 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
> >       DRM_GPU_SCHED_STAT_ENODEV,
> >   };
> >
> > +/**
> > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run qu=
eue)
> > + * message
> > + *
> > + * Generic enough for backend defined messages, backend can expand if =
needed.
> > + */
> > +struct drm_sched_msg {
> > +     /** @link: list link into the gpu scheduler list of messages */
> > +     struct list_head                link;
> > +     /**
> > +      * @private_data: opaque pointer to message private data (backend=
 defined)
> > +      */
> > +     void                            *private_data;
> > +     /** @opcode: opcode of message (backend defined) */
> > +     unsigned int                    opcode;
> > +};
> > +
> >   /**
> >    * struct drm_sched_backend_ops - Define the backend operations
> >    *  called by the scheduler
> > @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
> >            * and it's time to clean it up.
> >        */
> >       void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +     /**
> > +      * @process_msg: Process a message. Allowed to block, it is this
> > +      * function's responsibility to free message if dynamically alloc=
ated.
> > +      */
> > +     void (*process_msg)(struct drm_sched_msg *msg);
> >   };
> >
> >   /**
> > @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
> >    * @timeout: the time after which a job is removed from the scheduler=
.
> >    * @name: name of the ring for which this scheduler is being used.
> >    * @sched_rq: priority wise array of run queues.
> > + * @msgs: list of messages to be processed in @work_run
> >    * @job_scheduled: once @drm_sched_entity_do_release is called the sc=
heduler
> >    *                 waits on this wait queue until all the scheduled j=
obs are
> >    *                 finished.
> > @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
> >    * @job_id_count: used to assign unique id to the each job.
> >    * @run_wq: workqueue used to queue @work_run
> >    * @timeout_wq: workqueue used to queue @work_tdr
> > - * @work_run: schedules jobs and cleans up entities
> > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> >    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout aft=
er the
> >    *            timeout interval is over.
> >    * @pending_list: the list of jobs which are currently in the job que=
ue.
> > @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
> >       long                            timeout;
> >       const char                      *name;
> >       struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT=
];
> > +     struct list_head                msgs;
> >       wait_queue_head_t               job_scheduled;
> >       atomic_t                        hw_rq_count;
> >       atomic64_t                      job_id_count;
> > @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched=
_entity *entity,
> >
> >   void drm_sched_job_cleanup(struct drm_sched_job *job);
> >   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > +                    struct drm_sched_msg *msg);
> >   void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> >   void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> >   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched=
_job *bad);
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
