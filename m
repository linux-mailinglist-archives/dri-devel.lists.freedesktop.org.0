Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A12785C4D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 17:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9D10E437;
	Wed, 23 Aug 2023 15:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0DD10E437;
 Wed, 23 Aug 2023 15:41:32 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5710b054710so641856eaf.1; 
 Wed, 23 Aug 2023 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692805291; x=1693410091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVl3H0TG94lBCPlKnbQPt5VJQEmrDRwLtB4/zzBuTEM=;
 b=R1hJfsCk5ZFM6zkFW2R5Uij8abftK5qoJhTeWPLnwgCyGGk6oYHIxdzR/VEEIKtqlT
 5Aj4iY7v0x6cpSLTlv64BbyynwyFLWj+/Eruf1w6NMTZV9dJAv8HPFxMFmSO5eJWE3bt
 cioAnt0HfSeI2UOGlDVP/+a7stM2W1T+mpgIlWauPD4xyefOE/0YGKyQwyQ7zurw7OIE
 kC0M4ncKyjczihttvmIAElBbShzY03M8ZLS9RWW62Ohnitqt8OpwpwKIeGfLcLkX/hNw
 affx6VrAbZRM0KoTpwzWroVKulc2BMhW6Y7ZKOkJIfUVdGyJm5XeATrxPNa07e01ffl+
 gaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692805291; x=1693410091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVl3H0TG94lBCPlKnbQPt5VJQEmrDRwLtB4/zzBuTEM=;
 b=ifClytmXIObkZWEAaligCC75kud2MuXinqdYFTIiBfxu6PPrg96j/i46UUYmIjziAY
 3isRjHAvVxYNVoMHvcWJh/5kUBnd3J5FTlGeD5AI+MGGyDhe46dJgM3Kv58hbECL0i70
 I/coIGy4EeoOuXASrRddIepqKKN2mdttRHnnf6mwzQA3j4q+gAVXc83SMLJMGBWCBmJJ
 LjO1+T/Z1ddfCiJb0QeZD8dlas7qhtSBBMrLcG/AY3pHaWLSFeaBS+/2aiwCvvEdjVg/
 sMJ1Dq8iZmkh0AyXAc4bCZ9FoPo75i/KUfVKc737YrQBnw1ce48L6Uyk3X8wY2YDSFtI
 45uA==
X-Gm-Message-State: AOJu0YxWfHUsiyunaCSRb3FKmxOTCNyQKsN32Ck10P0h7dZRRklknuqU
 rplB+jbFijHZGH+5hoMyfAfoTKeIyyFuFZmKfUQ=
X-Google-Smtp-Source: AGHT+IGKBrMTKzazD03D8JgCrlQEL/4aMTMGbz7watyw5inlAvEnllmzn1bCUtQfLzoaLVHySV7PKDcK5qR1zRzb1pE=
X-Received: by 2002:a4a:2a07:0:b0:571:24b4:15b7 with SMTP id
 k7-20020a4a2a07000000b0057124b415b7mr1030551oof.1.1692805291297; Wed, 23 Aug
 2023 08:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
 <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
 <eb95b02f-7ffa-0cff-eac4-2bd8d12da730@amd.com>
 <ZOYkmAbzRFZzzQKK@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZOYkmAbzRFZzzQKK@DUT025-TGLU.fm.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Aug 2023 11:41:19 -0400
Message-ID: <CADnq5_N9tn+iBbeGDBu5GMVEzrBA5zzZfEKizp=T21OvowtNhw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 11:26=E2=80=AFAM Matthew Brost <matthew.brost@intel=
.com> wrote:
>
> On Wed, Aug 23, 2023 at 09:10:51AM +0200, Christian K=C3=B6nig wrote:
> > Am 23.08.23 um 05:27 schrieb Matthew Brost:
> > > [SNIP]
> > > > That is exactly what I want to avoid, tying the TDR to the job is w=
hat some
> > > > AMD engineers pushed for because it looked like a simple solution a=
nd made
> > > > the whole thing similar to what Windows does.
> > > >
> > > > This turned the previous relatively clean scheduler and TDR design =
into a
> > > > complete nightmare. The job contains quite a bunch of things which =
are not
> > > > necessarily available after the application which submitted the job=
 is torn
> > > > down.
> > > >
> > > Agree the TDR shouldn't be accessing anything application specific
> > > rather just internal job state required to tear the job down on the
> > > hardware.
> > > > So what happens is that you either have stale pointers in the TDR w=
hich can
> > > > go boom extremely easily or we somehow find a way to keep the neces=
sary
> > > I have not experenced the TDR going boom in Xe.
> > >
> > > > structures (which include struct thread_info and struct file for th=
is driver
> > > > connection) alive until all submissions are completed.
> > > >
> > > In Xe we keep everything alive until all submissions are completed. B=
y
> > > everything I mean the drm job, entity, scheduler, and VM via a refere=
nce
> > > counting scheme. All of these structures are just kernel state which =
can
> > > safely be accessed even if the application has been killed.
> >
> > Yeah, but that might just not be such a good idea from memory managemen=
t
> > point of view.
> >
> > When you (for example) kill a process all resource from that progress s=
hould
> > at least be queued to be freed more or less immediately.
> >
>
> We do this, the TDR kicks jobs off the hardware as fast as the hw
> interface allows and signals all pending hw fences immediately after.
> Free jobs then is immediately called and the reference count goes to
> zero. I think max time for all of this to occur is a handful of ms.
>
> > What Linux is doing for other I/O operations is to keep the relevant pa=
ges
> > alive until the I/O operation is completed, but for GPUs that usually m=
eans
> > keeping most of the memory of the process alive and that in turn is rea=
lly
> > not something you can do.
> >
> > You can of course do this if your driver has a reliable way of killing =
your
> > submissions and freeing resources in a reasonable amount of time. This
> > should then be done in the flush callback.
> >
>
> 'flush callback' - Do you mean drm_sched_entity_flush? I looked at that
> and think that function doesn't even work for what I tell. It flushes
> the spsc queue but what about jobs on the hardware, how do those get
> killed?
>
> As stated we do via the TDR which is rather clean design and fits with
> our reference couting scheme.
>
> > > If we need to teardown on demand we just set the TDR to a minimum val=
ue and
> > > it kicks the jobs off the hardware, gracefully cleans everything up a=
nd
> > > drops all references. This is a benefit of the 1 to 1 relationship, n=
ot
> > > sure if this works with how AMDGPU uses the scheduler.
> > >
> > > > Delaying application tear down is also not an option because then y=
ou run
> > > > into massive trouble with the OOM killer (or more generally OOM han=
dling).
> > > > See what we do in drm_sched_entity_flush() as well.
> > > >
> > > Not an issue for Xe, we never call drm_sched_entity_flush as our
> > > referencing counting scheme is all jobs are finished before we attemp=
t
> > > to tear down entity / scheduler.
> >
> > I don't think you can do that upstream. Calling drm_sched_entity_flush(=
) is
> > a must have from your flush callback for the file descriptor.
> >
>
> Again 'flush callback'? What are you refering too.
>
> And why does drm_sched_entity_flush need to be called, doesn't seem to
> do anything useful.
>
> > Unless you have some other method for killing your submissions this wou=
ld
> > give a path for a deny of service attack vector when the Xe driver is i=
n
> > use.
> >
>
> Yes, once th TDR fires is disallows all new submissions at the exec
> IOCTL plus flushes any pending submissions as fast as possible.
>
> > > > Since adding the TDR support we completely exercised this through i=
n the
> > > > last two or three years or so. And to sum it up I would really like=
 to get
> > > > away from this mess again.
> > > >
> > > > Compared to that what i915 does is actually rather clean I think.
> > > >
> > > Not even close, resets where a nightmare in the i915 (I spend years
> > > trying to get this right and probably still completely work) and in X=
e
> > > basically got it right on the attempt.
> > >
> > > > >    Also in Xe some of
> > > > > things done in free_job cannot be from an IRQ context, hence call=
ing
> > > > > this from the scheduler worker is rather helpful.
> > > > Well putting things for cleanup into a workitem doesn't sounds like
> > > > something hard.
> > > >
> > > That is exactly what we doing in the scheduler with the free_job
> > > workitem.
> >
> > Yeah, but I think that we do it in the scheduler and not the driver is
> > problematic.
> >
>
> Disagree, a common clean callback from a non-irq contexts IMO is a good
> design rather than each driver possibly having its own worker for
> cleanup.
>
> > For the scheduler it shouldn't care about the job any more as soon as t=
he
> > driver takes over.
> >
>
> This a massive rewrite for all users of the DRM scheduler, I'm saying
> for Xe what you are suggesting makes little to no sense.
>
> I'd like other users of the DRM scheduler to chime in on what you
> purposing. The scope of this change affects 8ish drivers that would
> require buy in each of the stakeholders. I certainly can't change of
> these drivers as I don't feel comfortable in all of those code bases nor
> do I have hardware to test all of these drivers.
>
> > >
> > > > Question is what do you really need for TDR which is not inside the=
 hardware
> > > > fence?
> > > >
> > > A reference to the entity to be able to kick the job off the hardware=
.
> > > A reference to the entity, job, and VM for error capture.
> > >
> > > We also need a reference to the job for recovery after a GPU reset so
> > > run_job can be called again for innocent jobs.
> >
> > Well exactly that's what I'm massively pushing back. Letting the schedu=
ler
> > call run_job() for the same job again is *NOT* something you can actual=
ly
> > do.
> >
>
> But lots of drivers do this already and the DRM scheduler documents
> this.
>
> > This pretty clearly violates some of the dma_fence constrains and has c=
ause
> > massively headaches for me already.
> >
>
> Seems to work fine in Xe.
>
> > What you can do is to do this inside your driver, e.g. take the jobs an=
d
> > push them again to the hw ring or just tell the hw to start executing a=
gain
> > from a previous position.
> >
>
> Again this now is massive rewrite of many drivers.
>
> > BTW that re-submitting of jobs seems to be a no-go from userspace
> > perspective as well. Take a look at the Vulkan spec for that, at least =
Marek
> > pretty much pointed out that we should absolutely not do this inside th=
e
> > kernel.
> >
>
> Yes if the job causes the hang, we ban the queue. Typcially only per
> entity (queue) resets are done in Xe but occasionally device level
> resets are done (issues with hardware) and innocent jobs / entities call
> run_job again.

If the engine is reset and the job was already executing, how can you
determine that it's in a good state to resubmit?  What if some
internal fence or semaphore in memory used by the logic in the command
buffer has been signaled already and then you resubmit the job and it
now starts executing with different input state?

Alex

>
> > The generally right approach seems to be to cleanly signal to userspace=
 that
> > something bad happened and that userspace then needs to submit things a=
gain
> > even for innocent jobs.
> >
>
> I disagree that innocent jobs should be banned. What you are suggesting
> is if a device reset needs to be done we kill / ban every user space queu=
e.
> Thats seems like overkill. Not seeing where that is stated in this doc
> [1], it seems to imply that only jobs that are stuck results in bans.
>
> Matt
>
> [1] https://patchwork.freedesktop.org/patch/553465/?series=3D119883&rev=
=3D3
>
> > Regards,
> > Christian.
> >
> > >
> > > All of this leads to believe we need to stick with the design.
> > >
> > > Matt
> > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > > The HW fence can live for longer as it can be installed in dma-re=
sv
> > > > > slots, syncobjs, etc... If the job and hw fence are combined now =
we
> > > > > holding on the memory for the longer and perhaps at the mercy of =
the
> > > > > user. We also run the risk of the final put being done from an IR=
Q
> > > > > context which again wont work in Xe as it is currently coded. Las=
tly 2
> > > > > jobs from the same scheduler could do the final put in parallel, =
so
> > > > > rather than having free_job serialized by the worker now multiple=
 jobs
> > > > > are freeing themselves at the same time. This might not be an iss=
ue but
> > > > > adds another level of raceyness that needs to be accounted for. N=
one of
> > > > > this sounds desirable to me.
> > > > >
> > > > > FWIW what you suggesting sounds like how the i915 did things
> > > > > (i915_request and hw fence in 1 memory alloc) and that turned out=
 to be
> > > > > a huge mess. As rule of thumb I generally do the opposite of what=
ever
> > > > > the i915 did.
> > > > >
> > > > > Matt
> > > > >
> > > > > > Christian.
> > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > > > > All the lifetime issues we had came from ignoring this fact=
 and I think we
> > > > > > > > should push for fixing this design up again.
> > > > > > > >
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > >
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 137 +++++++=
+++++++++++-------
> > > > > > > > >      include/drm/gpu_scheduler.h            |   8 +-
> > > > > > > > >      2 files changed, 106 insertions(+), 39 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/dri=
vers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > index cede47afc800..b67469eac179 100644
> > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(str=
uct drm_sched_rq *rq,
> > > > > > > > >       * drm_sched_rq_select_entity_rr - Select an entity =
which could provide a job to run
> > > > > > > > >       *
> > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > >       *
> > > > > > > > >       * Try to find a ready entity, returns NULL if none =
found.
> > > > > > > > >       */
> > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, b=
ool dequeue)
> > > > > > > > >      {
> > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct=
 drm_sched_rq *rq)
> > > > > > > > >         if (entity) {
> > > > > > > > >                 list_for_each_entry_continue(entity, &rq-=
>entities, list) {
> > > > > > > > >                         if (drm_sched_entity_is_ready(ent=
ity)) {
> > > > > > > > > -                               rq->current_entity =3D en=
tity;
> > > > > > > > > -                               reinit_completion(&entity=
->entity_idle);
> > > > > > > > > +                               if (dequeue) {
> > > > > > > > > +                                       rq->current_entit=
y =3D entity;
> > > > > > > > > +                                       reinit_completion=
(&entity->entity_idle);
> > > > > > > > > +                               }
> > > > > > > > >                                 spin_unlock(&rq->lock);
> > > > > > > > >                                 return entity;
> > > > > > > > >                         }
> > > > > > > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct=
 drm_sched_rq *rq)
> > > > > > > > >         list_for_each_entry(entity, &rq->entities, list) =
{
> > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > -                       rq->current_entity =3D entity;
> > > > > > > > > -                       reinit_completion(&entity->entity=
_idle);
> > > > > > > > > +                       if (dequeue) {
> > > > > > > > > +                               rq->current_entity =3D en=
tity;
> > > > > > > > > +                               reinit_completion(&entity=
->entity_idle);
> > > > > > > > > +                       }
> > > > > > > > >                         spin_unlock(&rq->lock);
> > > > > > > > >                         return entity;
> > > > > > > > >                 }
> > > > > > > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struc=
t drm_sched_rq *rq)
> > > > > > > > >       * drm_sched_rq_select_entity_fifo - Select an entit=
y which provides a job to run
> > > > > > > > >       *
> > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > >       *
> > > > > > > > >       * Find oldest waiting ready entity, returns NULL if=
 none found.
> > > > > > > > >       */
> > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq,=
 bool dequeue)
> > > > > > > > >      {
> > > > > > > > >         struct rb_node *rb;
> > > > > > > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(stru=
ct drm_sched_rq *rq)
> > > > > > > > >                 entity =3D rb_entry(rb, struct drm_sched_=
entity, rb_tree_node);
> > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > -                       rq->current_entity =3D entity;
> > > > > > > > > -                       reinit_completion(&entity->entity=
_idle);
> > > > > > > > > +                       if (dequeue) {
> > > > > > > > > +                               rq->current_entity =3D en=
tity;
> > > > > > > > > +                               reinit_completion(&entity=
->entity_idle);
> > > > > > > > > +                       }
> > > > > > > > >                         break;
> > > > > > > > >                 }
> > > > > > > > >         }
> > > > > > > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(str=
uct drm_sched_rq *rq)
> > > > > > > > >      }
> > > > > > > > >      /**
> > > > > > > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > > > > > > + * drm_sched_run_job_queue - queue job submission
> > > > > > > > >       * @sched: scheduler instance
> > > > > > > > >       */
> > > > > > > > > -static void drm_sched_submit_queue(struct drm_gpu_schedu=
ler *sched)
> > > > > > > > > +static void drm_sched_run_job_queue(struct drm_gpu_sched=
uler *sched)
> > > > > > > > >      {
> > > > > > > > >         if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > -               queue_work(sched->submit_wq, &sched->work=
_submit);
> > > > > > > > > +               queue_work(sched->submit_wq, &sched->work=
_run_job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static struct drm_sched_entity *
> > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched,=
 bool dequeue);
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_run_job_queue_if_ready - queue job submissi=
on if ready
> > > > > > > > > + * @sched: scheduler instance
> > > > > > > > > + */
> > > > > > > > > +static void drm_sched_run_job_queue_if_ready(struct drm_=
gpu_scheduler *sched)
> > > > > > > > > +{
> > > > > > > > > +       if (drm_sched_select_entity(sched, false))
> > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_free_job_queue - queue free job
> > > > > > > > > + *
> > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > + */
> > > > > > > > > +static void drm_sched_free_job_queue(struct drm_gpu_sche=
duler *sched)
> > > > > > > > > +{
> > > > > > > > > +       if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > +               queue_work(sched->submit_wq, &sched->work=
_free_job);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_free_job_queue_if_ready - queue free job if=
 ready
> > > > > > > > > + *
> > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > + */
> > > > > > > > > +static void drm_sched_free_job_queue_if_ready(struct drm=
_gpu_scheduler *sched)
> > > > > > > > > +{
> > > > > > > > > +       struct drm_sched_job *job;
> > > > > > > > > +
> > > > > > > > > +       spin_lock(&sched->job_list_lock);
> > > > > > > > > +       job =3D list_first_entry_or_null(&sched->pending_=
list,
> > > > > > > > > +                                      struct drm_sched_j=
ob, list);
> > > > > > > > > +       if (job && dma_fence_is_signaled(&job->s_fence->f=
inished))
> > > > > > > > > +               drm_sched_free_job_queue(sched);
> > > > > > > > > +       spin_unlock(&sched->job_list_lock);
> > > > > > > > >      }
> > > > > > > > >      /**
> > > > > > > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct=
 drm_sched_job *s_job, int result)
> > > > > > > > >         dma_fence_get(&s_fence->finished);
> > > > > > > > >         drm_sched_fence_finished(s_fence, result);
> > > > > > > > >         dma_fence_put(&s_fence->finished);
> > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > > +       drm_sched_free_job_queue(sched);
> > > > > > > > >      }
> > > > > > > > >      /**
> > > > > > > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(str=
uct drm_gpu_scheduler *sched)
> > > > > > > > >      void drm_sched_wakeup_if_can_queue(struct drm_gpu_sc=
heduler *sched)
> > > > > > > > >      {
> > > > > > > > >         if (drm_sched_can_queue(sched))
> > > > > > > > > -               drm_sched_submit_queue(sched);
> > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > >      }
> > > > > > > > >      /**
> > > > > > > > >       * drm_sched_select_entity - Select next entity to p=
rocess
> > > > > > > > >       *
> > > > > > > > >       * @sched: scheduler instance
> > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > >       *
> > > > > > > > >       * Returns the entity to process or NULL if none are=
 found.
> > > > > > > > >       */
> > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched,=
 bool dequeue)
> > > > > > > > >      {
> > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > >         int i;
> > > > > > > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_g=
pu_scheduler *sched)
> > > > > > > > >         /* Kernel run queue has higher priority than norm=
al run queue*/
> > > > > > > > >         for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D D=
RM_SCHED_PRIORITY_MIN; i--) {
> > > > > > > > >                 entity =3D sched->sched_policy =3D=3D DRM=
_SCHED_POLICY_FIFO ?
> > > > > > > > > -                       drm_sched_rq_select_entity_fifo(&=
sched->sched_rq[i]) :
> > > > > > > > > -                       drm_sched_rq_select_entity_rr(&sc=
hed->sched_rq[i]);
> > > > > > > > > +                       drm_sched_rq_select_entity_fifo(&=
sched->sched_rq[i],
> > > > > > > > > +                                                       d=
equeue) :
> > > > > > > > > +                       drm_sched_rq_select_entity_rr(&sc=
hed->sched_rq[i],
> > > > > > > > > +                                                     deq=
ueue);
> > > > > > > > >                 if (entity)
> > > > > > > > >                         break;
> > > > > > > > >         }
> > > > > > > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gp=
u_scheduler **sched_list,
> > > > > > > > >      EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > > > > >      /**
> > > > > > > > > - * drm_sched_main - main scheduler thread
> > > > > > > > > + * drm_sched_free_job_work - worker to call free_job
> > > > > > > > >       *
> > > > > > > > > - * @param: scheduler instance
> > > > > > > > > + * @w: free job work
> > > > > > > > >       */
> > > > > > > > > -static void drm_sched_main(struct work_struct *w)
> > > > > > > > > +static void drm_sched_free_job_work(struct work_struct *=
w)
> > > > > > > > >      {
> > > > > > > > >         struct drm_gpu_scheduler *sched =3D
> > > > > > > > > -               container_of(w, struct drm_gpu_scheduler,=
 work_submit);
> > > > > > > > > -       struct drm_sched_entity *entity;
> > > > > > > > > +               container_of(w, struct drm_gpu_scheduler,=
 work_free_job);
> > > > > > > > >         struct drm_sched_job *cleanup_job;
> > > > > > > > > -       int r;
> > > > > > > > >         if (READ_ONCE(sched->pause_submit))
> > > > > > > > >                 return;
> > > > > > > > >         cleanup_job =3D drm_sched_get_cleanup_job(sched);
> > > > > > > > > -       entity =3D drm_sched_select_entity(sched);
> > > > > > > > > +       if (cleanup_job) {
> > > > > > > > > +               sched->ops->free_job(cleanup_job);
> > > > > > > > > +
> > > > > > > > > +               drm_sched_free_job_queue_if_ready(sched);
> > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > > +       }
> > > > > > > > > +}
> > > > > > > > > -       if (!entity && !cleanup_job)
> > > > > > > > > -               return; /* No more work */
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_run_job_work - worker to call run_job
> > > > > > > > > + *
> > > > > > > > > + * @w: run job work
> > > > > > > > > + */
> > > > > > > > > +static void drm_sched_run_job_work(struct work_struct *w=
)
> > > > > > > > > +{
> > > > > > > > > +       struct drm_gpu_scheduler *sched =3D
> > > > > > > > > +               container_of(w, struct drm_gpu_scheduler,=
 work_run_job);
> > > > > > > > > +       struct drm_sched_entity *entity;
> > > > > > > > > +       int r;
> > > > > > > > > -       if (cleanup_job)
> > > > > > > > > -               sched->ops->free_job(cleanup_job);
> > > > > > > > > +       if (READ_ONCE(sched->pause_submit))
> > > > > > > > > +               return;
> > > > > > > > > +       entity =3D drm_sched_select_entity(sched, true);
> > > > > > > > >         if (entity) {
> > > > > > > > >                 struct dma_fence *fence;
> > > > > > > > >                 struct drm_sched_fence *s_fence;
> > > > > > > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct w=
ork_struct *w)
> > > > > > > > >                 sched_job =3D drm_sched_entity_pop_job(en=
tity);
> > > > > > > > >                 if (!sched_job) {
> > > > > > > > >                         complete_all(&entity->entity_idle=
);
> > > > > > > > > -                       if (!cleanup_job)
> > > > > > > > > -                               return; /* No more work *=
/
> > > > > > > > > -                       goto again;
> > > > > > > > > +                       return; /* No more work */
> > > > > > > > >                 }
> > > > > > > > >                 s_fence =3D sched_job->s_fence;
> > > > > > > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct =
work_struct *w)
> > > > > > > > >                 }
> > > > > > > > >                 wake_up(&sched->job_scheduled);
> > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > >         }
> > > > > > > > > -
> > > > > > > > > -again:
> > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > >      }
> > > > > > > > >      /**
> > > > > > > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_s=
cheduler *sched,
> > > > > > > > >         spin_lock_init(&sched->job_list_lock);
> > > > > > > > >         atomic_set(&sched->hw_rq_count, 0);
> > > > > > > > >         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job=
_timedout);
> > > > > > > > > -       INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > > > > > > +       INIT_WORK(&sched->work_run_job, drm_sched_run_job=
_work);
> > > > > > > > > +       INIT_WORK(&sched->work_free_job, drm_sched_free_j=
ob_work);
> > > > > > > > >         atomic_set(&sched->_score, 0);
> > > > > > > > >         atomic64_set(&sched->job_id_count, 0);
> > > > > > > > >         sched->pause_submit =3D false;
> > > > > > > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_read=
y);
> > > > > > > > >      void drm_sched_submit_stop(struct drm_gpu_scheduler =
*sched)
> > > > > > > > >      {
> > > > > > > > >         WRITE_ONCE(sched->pause_submit, true);
> > > > > > > > > -       cancel_work_sync(&sched->work_submit);
> > > > > > > > > +       cancel_work_sync(&sched->work_run_job);
> > > > > > > > > +       cancel_work_sync(&sched->work_free_job);
> > > > > > > > >      }
> > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop=
);
> > > > > > > > >      void drm_sched_submit_start(struct drm_gpu_scheduler=
 *sched)
> > > > > > > > >      {
> > > > > > > > >         WRITE_ONCE(sched->pause_submit, false);
> > > > > > > > > -       queue_work(sched->submit_wq, &sched->work_submit)=
;
> > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_run_job=
);
> > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_free_jo=
b);
> > > > > > > > >      }
> > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_start);
> > > > > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gp=
u_scheduler.h
> > > > > > > > > index 04eec2d7635f..fbc083a92757 100644
> > > > > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > > > > > > >       *                 finished.
> > > > > > > > >       * @hw_rq_count: the number of jobs currently in the=
 hardware queue.
> > > > > > > > >       * @job_id_count: used to assign unique id to the ea=
ch job.
> > > > > > > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > > > > > > + * @submit_wq: workqueue used to queue @work_run_job and=
 @work_free_job
> > > > > > > > >       * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > > > > - * @work_submit: schedules jobs and cleans up entities
> > > > > > > > > + * @work_run_job: schedules jobs
> > > > > > > > > + * @work_free_job: cleans up jobs
> > > > > > > > >       * @work_tdr: schedules a delayed call to @drm_sched=
_job_timedout after the
> > > > > > > > >       *            timeout interval is over.
> > > > > > > > >       * @pending_list: the list of jobs which are current=
ly in the job queue.
> > > > > > > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > > > > > > >         atomic64_t                      job_id_count;
> > > > > > > > >         struct workqueue_struct         *submit_wq;
> > > > > > > > >         struct workqueue_struct         *timeout_wq;
> > > > > > > > > -       struct work_struct              work_submit;
> > > > > > > > > +       struct work_struct              work_run_job;
> > > > > > > > > +       struct work_struct              work_free_job;
> > > > > > > > >         struct delayed_work             work_tdr;
> > > > > > > > >         struct list_head                pending_list;
> > > > > > > > >         spinlock_t                      job_list_lock;
> >
