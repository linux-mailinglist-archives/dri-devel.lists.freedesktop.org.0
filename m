Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDFD3FE434
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DD789829;
	Wed,  1 Sep 2021 20:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DF189789;
 Wed,  1 Sep 2021 20:42:54 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso1344292ota.8; 
 Wed, 01 Sep 2021 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rkhuZvq+shymVUY9DQPrDCFVIHRPcwcVZZ5t4/rt9es=;
 b=HdagvxRZ/AQC5i+JCe+nYp4fxLw+i9EU0dEY4n941PHd+4iI9iWAvnn5EyvcxJdA6/
 qIqQrf6+KdFJ3rYYEE2+HFQqBb1PZ5ZBkwdVE/dyGsu4UGkljw+JV6z/iiJvLjuFvyU+
 xcmxNUx5gdrEQmr8I/63oJF7nRxbOI56gE6s3lDbQrcyWMzCPstLTFjQTq1h/8+oeYO9
 L1wjCjV8EemaSqLJ4xCKSzxNvmjQ+3bT8gKLJ6SQLxa8uJOOdk0eyw+JzE18rT77eXFq
 miuXrjKeN9y1jnM7oVaRsH3zwBPoJttDJkuZnmBPkd7Uz2EcDqeCDTUfpqvUBgs43Msp
 FmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rkhuZvq+shymVUY9DQPrDCFVIHRPcwcVZZ5t4/rt9es=;
 b=Kah3zKPzXQFRZxvs9U4newl8v+pr9X5J0Eegob0I3eVS+4YO3Ouw22sHFjKT6D6Trj
 WGV8Bn4Z1o4q6337UNY122OUj4aXzX4JAgyxMXxSXRqZLcD/IgvX+7wW2gNJ3gLx/CBb
 0DyollkoiU07qy84xIUZLgfotPVg0SDUu33b0LRY0Ut5oY6DSiiDpK8I/SRRS1iioH7C
 cG2BnmQ0XiSc3oaS1+ASL6We+BrqM0cFMoSHYG1fW0NzB9H4UfR92vL4eOLfYxLQFyvX
 jPbuY5lbma+Ohr2gmDfg9DYMjHTPWcRpdnP+eMhRo0r9ayuHnJZGaJ0tsVU/8/HqlCNT
 R+Kw==
X-Gm-Message-State: AOAM530xT1RljHnaiClo6y8hDSRSU4u26eygAUFekyGexZshq6ZVbpfN
 +KcyZJUWCFiBvXCAPisKOcVJAGNeoEKIEHIhFAQ=
X-Google-Smtp-Source: ABdhPJze4fN3NU901yfediHZr4cn+IK62RLdAGfviX3//HKPT6YxtyQbLLRX2OwuCXKyJYXoCK7yCWvrxwNnOd4qkQY=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr1118528otf.311.1630528974072; 
 Wed, 01 Sep 2021 13:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
 <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
In-Reply-To: <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Sep 2021 16:42:43 -0400
Message-ID: <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Wed, Sep 1, 2021 at 2:50 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 01.09.21 um 02:46 schrieb Monk Liu:
> > issue:
> > in cleanup_job the cancle_delayed_work will cancel a TO timer
> > even the its corresponding job is still running.
> >
> > fix:
> > do not cancel the timer in cleanup_job, instead do the cancelling
> > only when the heading job is signaled, and if there is a "next" job
> > we start_timeout again.
> >
> > v2:
> > further cleanup the logic, and do the TDR timer cancelling if the signa=
led job
> > is the last one in its scheduler.
> >
> > v3:
> > change the issue description
> > remove the cancel_delayed_work in the begining of the cleanup_job
> > recover the implement of drm_sched_job_begin.
> >
> > v4:
> > remove the kthread_should_park() checking in cleanup_job routine,
> > we should cleanup the signaled job asap
> >
> > TODO:
> > 1)introduce pause/resume scheduler in job_timeout to serial the handlin=
g
> > of scheduler and job_timeout.
> > 2)drop the bad job's del and insert in scheduler due to above serializa=
tion
> > (no race issue anymore with the serialization)
> >
> > tested-by: jingwen <jingwen.chen@@amd.com>
> > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>

Are you planning to push this to drm-misc?

Alex


> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++++----------------=
-
> >   1 file changed, 9 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index a2a9536..3e0bbc7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler=
 *sched)
> >   {
> >       struct drm_sched_job *job, *next;
> >
> > -     /*
> > -      * Don't destroy jobs while the timeout worker is running  OR thr=
ead
> > -      * is being parked and hence assumed to not touch pending_list
> > -      */
> > -     if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
> > -         !cancel_delayed_work(&sched->work_tdr)) ||
> > -         kthread_should_park())
> > -             return NULL;
> > -
> >       spin_lock(&sched->job_list_lock);
> >
> >       job =3D list_first_entry_or_null(&sched->pending_list,
> > @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedule=
r *sched)
> >       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> >               /* remove job from pending_list */
> >               list_del_init(&job->list);
> > +
> > +             /* cancel this job's TO timer */
> > +             cancel_delayed_work(&sched->work_tdr);
> >               /* make the scheduled timestamp more accurate */
> >               next =3D list_first_entry_or_null(&sched->pending_list,
> >                                               typeof(*next), list);
> > -             if (next)
> > +
> > +             if (next) {
> >                       next->s_fence->scheduled.timestamp =3D
> >                               job->s_fence->finished.timestamp;
> > -
> > +                     /* start TO timer for next job */
> > +                     drm_sched_start_timeout(sched);
> > +             }
> >       } else {
> >               job =3D NULL;
> > -             /* queue timeout for next job */
> > -             drm_sched_start_timeout(sched);
> >       }
> >
> >       spin_unlock(&sched->job_list_lock);
> > @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
> >                                         (entity =3D drm_sched_select_en=
tity(sched))) ||
> >                                        kthread_should_stop());
> >
> > -             if (cleanup_job) {
> > +             if (cleanup_job)
> >                       sched->ops->free_job(cleanup_job);
> > -                     /* queue timeout for next job */
> > -                     drm_sched_start_timeout(sched);
> > -             }
> >
> >               if (!entity)
> >                       continue;
>
