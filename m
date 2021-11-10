Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B844C8A5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3012F6E0C5;
	Wed, 10 Nov 2021 19:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D18C6E05F;
 Wed, 10 Nov 2021 19:10:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2717058wmb.5; 
 Wed, 10 Nov 2021 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yLs5chTYGj0in0rN4ZentgVDMtbmnaGGpUafWh3bMsQ=;
 b=SvV1TyrHMRJHtcTmBaNe4PZ4qg835KSR/RnFFkvBSG70tL0+yLEstCx9YUnumuvIC0
 gldfDpTrGLxKCUCS7U0uq2RstEFUg2WKYz9wiefJmSCLKgKprPoEOJaguJkDxpbFYnAQ
 6jptVtjqJiIdHVFyEprFCaSrQ7lkCotlWMv3e55BcVeUCKD7hjf0AfSjhIv7KDBgIRMY
 g3Oady0ruE4eZPkiUJ8hEm6ruKobgKQFYnzbLAeKVEzEnYtJKZM/oJeSytarEkG8b6i3
 cRRcmIG0bbuR2AePssGSTsfz0wwb3r6bSzKpIUkqugBmKkj4P0ZM5A3r28uHaTPEv+Os
 Zfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yLs5chTYGj0in0rN4ZentgVDMtbmnaGGpUafWh3bMsQ=;
 b=LSHYpPyNGRhmhcNM+vN3TlNv30lh/vr1JGt4v3YR6cNCa7yCmMQidqo4kXx9Xd6MUW
 0TXYYTxAKqXMosL1y38YTi6wuDs/H6VPABIvpyha7/RSSQhYMOaQir2aL6KFSMMHeWzF
 d4yvCDhmp9oba4Dbv0IZ5ijXeRgpNGsijQLJvI1fGW0LIT/ooYzUijmAlMfrtmgP3/e8
 13lqodg0YchOEDybXdCsCUxentaXY4cheBmzIPnBHH9pOfNs/wbFaj18MQ9ORIOIr+Io
 KiZ7dvivp3dEzgoGel2YE3EI7kbM0Egby8GKoCPcEYTv7Itf8caCocTL2jD+V80d+scB
 azHA==
X-Gm-Message-State: AOAM531fk2abPWEF7s0/0s7O5yACo+fjl5iKFcqzr0VLMKwJPPv8zzrA
 Y7YkjAHz+vQ6KO+aVx/FJqS2ZuN6zO8mkGOIAyo=
X-Google-Smtp-Source: ABdhPJxG3xo3BCopHN4pqvIx1rb+qYxwQpIs5HU2Tqpwu05sAbky8//kmauZvY/PtrOknWb+Ith+o3nMBI0U5U/zcIs=
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr1621657wmq.168.1636571428736; 
 Wed, 10 Nov 2021 11:10:28 -0800 (PST)
MIME-Version: 1.0
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
 <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
 <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
 <CAF6AEGvGQP-6eNevDyS9sXg+6qOKMrG7h5rwhKO=v8L5mQOiUA@mail.gmail.com>
 <YYuVyRlAATYO4ptP@phenom.ffwll.local>
In-Reply-To: <YYuVyRlAATYO4ptP@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Nov 2021 11:15:26 -0800
Message-ID: <CAF6AEGvm9qPwxz24oZFfAdj046sbGJS3OCacoR5DW4xqESEy9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>, "Chen, Jingwen" <Jingwen.Chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 1:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Nov 09, 2021 at 08:17:01AM -0800, Rob Clark wrote:
> > On Tue, Nov 9, 2021 at 1:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Nov 08, 2021 at 03:39:17PM -0800, Rob Clark wrote:
> > > > I stumbled across this thread when I ran into the same issue, while
> > > > working out how to move drm/msm to use scheduler's retire +
> > > > timeout/recovery (and get rid of our own mirror list of in-flight
> > > > jobs).  We already have hw error detection enabled, and it can sign=
al
> > > > quite fast, so assuming the first job on the list is the guilty job
> > > > just won't work.
> > > >
> > > > But I was considering a slightly different approach to fixing this,
> > > > instead just handling it all in drm_sched_main() and getting rid of
> > > > the complicated kthread parking gymnastics.  Ie. something along th=
e
> > > > lines of:
> > >
> > > So handling timeouts in the main sched thread wont work as soon as yo=
u
> > > have multiple engines and reset that impacts across engines:
> > >
> > > - Nothing is simplified since you still need to stop the other schedu=
ler
> > >   threads.
> > >
> > > - You get deadlocks if 2 schedulers time out at the same time, and bo=
th
> > >   want to stop the other one.
> > >
> > > Hence workqueue. Now the rule for the wq is that you can only have on=
e per
> > > reset domain, so
> > > - single engine you just take the one drm/sched provides
> > > - if reset affects all your engines in the chip, then you allocate on=
 in
> > >   the drm_device and pass that to all
> > > - if you have a complex of gpus all interconnected (e.g. xgmi hive fo=
r
> > >   amd), then it's one wq for the entire hive
> > >
> > > _All_ reset related things must be run on that workqueue or things br=
eaks,
> > > which means if you get hw fault that also needs to be run there. I gu=
ess
> > > we should either patch drm/sched to check you call that function from=
 the
> > > right workqueue, or just handle it internally.
> >
> > Hmm, ok.. I guess it would be useful to better document the reasoning
> > for the current design, that would have steered me more towards the
> > approach taken in this patch.
>
> Maybe this was because you worked on an old kernel? Boris did update the
> kerneldoc as part of making gpu reset work for panfrost, which has this
> multi-engine reset problem. If that's not yet clear then we need to
> improve the docs further.

I saw that, and understood the ordered wq.. but missed the implication
regarding having to park other scheduler kthreads

BR,
-R

> AMD's problem is even worse, because their reset domain is the entire xgm=
i
> hive, so multiple pci devices.
>
> Also there might more issues in drm/sched ofc, e.g. I've looked a bit at
> ordering/barriers and I'm pretty sure a lot are still missing. Or at leas=
t
> we should have comments in the code explaining why it all works.
> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > ---------------------
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 67382621b429..4d6ce775c316 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
> > > > drm_gpu_scheduler *sched)
> > > >         return false;
> > > >  }
> > > >
> > > > +static bool handle_timeout(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +       struct drm_sched_job *bad;
> > > > +
> > > > +       if (!sched->has_timeout)
> > > > +               return false;
> > > > +
> > > > +       sched->has_timeout =3D false;
> > > > +
> > > > +       spin_lock(&sched->job_list_lock);
> > > > +       bad =3D list_first_entry_or_null(&sched->pending_list,
> > > > +                                      struct drm_sched_job, list);
> > > > +
> > > > +       if (!bad) {
> > > > +               spin_unlock(&sched->job_list_lock);
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       spin_unlock(&sched->job_list_lock);
> > > > +
> > > > +       if (sched->timeout_wq =3D=3D system_wq) {
> > > > +               /*
> > > > +                * If driver has no specific requirements about ser=
ializing
> > > > +                * reset wrt. other engines, just call timedout_job=
() directly
> > > > +                */
> > > > +               sched->ops->timedout_job(job);
> > > > +       } else {
> > > > +               /*
> > > > +                * Otherwise queue it on timeout_wq and wait for it=
 to complete
> > > > +                */
> > > > +               ... more typing needed here ...
> > > > +       }
> > > > +
> > > > +       if (sched->free_guilty) {
> > > > +               sched->ops->free_job(job);
> > > > +               sched->free_guilty =3D false;
> > > > +       }
> > > > +}
> > > > +
> > > >  /**
> > > >   * drm_sched_main - main scheduler thread
> > > >   *
> > > > @@ -787,6 +826,7 @@ static int drm_sched_main(void *param)
> > > >
> > > >                 wait_event_interruptible(sched->wake_up_worker,
> > > >                                          (cleanup_job =3D
> > > > drm_sched_get_cleanup_job(sched)) ||
> > > > +                                        handle_timeout(sched) ||
> > > >                                          (!drm_sched_blocked(sched)=
 &&
> > > >                                           (entity =3D
> > > > drm_sched_select_entity(sched))) ||
> > > >                                          kthread_should_stop());
> > > > ---------------------
> > > >
> > > > drm_sched_fault() and the sw timeout handler would just set
> > > > sched->has_timeout and kick sched->wake_up_worker.
> > > >
> > > > And since we handle the timeout case after
> > > > drm_sched_get_cleanup_job(), we know that all of the successfully
> > > > completed jobs have already been popped off the list, and won't be
> > > > unfairly maligned.
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
> > > > >
> > > > > [AMD Official Use Only]
> > > > >
> > > > > Okay, I will reprepare this patch
> > > > >
> > > > > Thanks
> > > > >
> > > > > ------------------------------------------
> > > > > Monk Liu | Cloud-GPU Core team
> > > > > ------------------------------------------
> > > > >
> > > > > -----Original Message-----
> > > > > From: Daniel Vetter <daniel@ffwll.ch>
> > > > > Sent: Tuesday, August 31, 2021 9:02 PM
> > > > > To: Liu, Monk <Monk.Liu@amd.com>
> > > > > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.or=
g; Chen, Jingwen <Jingwen.Chen@amd.com>
> > > > > Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and sch=
eduler
> > > > >
> > > > > On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> > > > > > Can we please have some actual commit message here, with detail=
ed
> > > > > > explanation of the race/bug/whatever, how you fix it and why th=
is is
> > > > > > the best option?
> > > > > >
> > > > > > On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > > > > > > tested-by: jingwen chen <jingwen.chen@amd.com>
> > > > > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > > > > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/scheduler/sched_main.c | 24
> > > > > > > ++++--------------------
> > > > > > >  1 file changed, 4 insertions(+), 20 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index ecf8140..894fdb24 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(stru=
ct work_struct *work)
> > > > > > >     sched =3D container_of(work, struct drm_gpu_scheduler,
> > > > > > > work_tdr.work);
> > > > > > >
> > > > > > >     /* Protects against concurrent deletion in
> > > > > > > drm_sched_get_cleanup_job */
> > > > > > > +   if (!__kthread_should_park(sched->thread))
> > > > > >
> > > > > > This is a __ function, i.e. considered internal, and it's lockl=
ess
> > > > > > atomic, i.e. unordered. And you're not explaining why this work=
s.
> > > > > >
> > > > > > Iow it's probably buggy, and an just unconditionally parking th=
e
> > > > > > kthread is probably the right thing to do. If it's not the righ=
t thing
> > > > > > to do, there's a bug here for sure.
> > > > >
> > > > > Also why don't we reuse the function drivers already have to stop=
 a scheduler thread? We seem to have two kthread_park now, that's probably =
one too much.
> > > > > -Daniel
> > > > >
> > > > > > > +           kthread_park(sched->thread);
> > > > > > > +
> > > > > > >     spin_lock(&sched->job_list_lock);
> > > > > > >     job =3D list_first_entry_or_null(&sched->pending_list,
> > > > > > >                                    struct drm_sched_job, list=
);
> > > > > > >
> > > > > > >     if (job) {
> > > > > > > -           /*
> > > > > > > -            * Remove the bad job so it cannot be freed by co=
ncurrent
> > > > > > > -            * drm_sched_cleanup_jobs. It will be reinserted =
back after sched->thread
> > > > > > > -            * is parked at which point it's safe.
> > > > > > > -            */
> > > > > > > -           list_del_init(&job->list);
> > > > > > >             spin_unlock(&sched->job_list_lock);
> > > > > > >
> > > > > > > +           /* vendor's timeout_job should call drm_sched_sta=
rt() */
> > > > > > >             status =3D job->sched->ops->timedout_job(job);
> > > > > > >
> > > > > > >             /*
> > > > > > > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_sched=
uler *sched, struct drm_sched_job *bad)
> > > > > > >     kthread_park(sched->thread);
> > > > > > >
> > > > > > >     /*
> > > > > > > -    * Reinsert back the bad job here - now it's safe as
> > > > > > > -    * drm_sched_get_cleanup_job cannot race against us and r=
elease the
> > > > > > > -    * bad job at this point - we parked (waited for) any in =
progress
> > > > > > > -    * (earlier) cleanups and drm_sched_get_cleanup_job will =
not be called
> > > > > > > -    * now until the scheduler thread is unparked.
> > > > > > > -    */
> > > > > > > -   if (bad && bad->sched =3D=3D sched)
> > > > > > > -           /*
> > > > > > > -            * Add at the head of the queue to reflect it was=
 the earliest
> > > > > > > -            * job extracted.
> > > > > > > -            */
> > > > > > > -           list_add(&bad->list, &sched->pending_list);
> > > > > > > -
> > > > > > > -   /*
> > > > > > >      * Iterate the job list from later to  earlier one and ei=
ther deactive
> > > > > > >      * their HW callbacks or remove them from pending list if=
 they already
> > > > > > >      * signaled.
> > > > > > > --
> > > > > > > 2.7.4
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2=
F%2Fblog.
> > > > > > ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea=
18f4fbf76
> > > > > > b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
6601170
> > > > > > 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiL
> > > > > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0a=
WL5%2BJLg
> > > > > > KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=3D0
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%=
2Fblog.ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4f=
bf76b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63766011705=
1194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJLgKeKbGaMMG=
qeGI9KE0P0LXlN4%3D&amp;reserved=3D0
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
