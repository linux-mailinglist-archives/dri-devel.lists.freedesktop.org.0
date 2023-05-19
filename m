Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88472709893
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35210E1BA;
	Fri, 19 May 2023 13:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8210E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:41:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39431e2b2cdso2393849b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684503704; x=1687095704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmeeSYJZ1XGrqcSWpqVD9Vn34UdUZod/JEa/iSUvy+A=;
 b=ZQ2YYWXfCa/okGE3WyeocOBJ0aJHydwuqmNWZMmiW4WIMXrNBHFR/ZZTeAJkZ6X7x+
 +eWGca2NE5drftsiu/yFJOxgZ4HA1xkuK6uau1K37VsqI2ajawrglWjqwj0UBlrf+M+D
 2qGcKrusom+seoeD0OP8uwwWVGZIg1k15WTO630nOIq0Xxz1Dpip6Eeqro/ic62YPt61
 ZvY9nYcIgZosB4dLmU3ZWgGCXdDJnLoHcAWpx2MBnITSsbkl+ErOHYsQCFrhHQMQIhsZ
 4uhC3xNpv+A18/hGO2nlvesHTWgWGKevRVcMjrkNtj3SsNaFxSWEqJtGI1UkXXmkHGy4
 +K1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684503704; x=1687095704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmeeSYJZ1XGrqcSWpqVD9Vn34UdUZod/JEa/iSUvy+A=;
 b=Riu+Fx9TgpquFnLsQsw/SMcq/hLf2gyHSBksdgoZ0c7AtRT2mOCsvDmA43cF3/bHFX
 Zj8fhCgSoZAwhVg0HYYY2pF4D2AKBnqogT4gushYs5n83KL+f/yHiJopDfUmi9Ij4kaN
 uX22KHbe9qEwvzvkT5XoRVVD3bkXcKz+fDM9UCwYsOky06y5XmtwtcdXQ7S9aNMOnnAS
 vB8kPis8TcG573DxcZVIa5CjgBYdycg0GCvdrnBSx7z5zdHUUUpKiWCyLX14WotWqVcj
 mS3Fho/Wv58uP2iSiG7TsqJMjTi9E0/0k55NSroV1zxhQjyvmHS/yb7z6I+fa/6tGQpR
 Givg==
X-Gm-Message-State: AC+VfDzHWhNQ4kXkzYGxdwyGLAXEDc6nM+H2tkCvZs20w4hEqUAPYOo8
 SlJFqFD/pxzg1bpavMMBsr0F/yddFiEuCJOrUqQ=
X-Google-Smtp-Source: ACHHUZ4wPVFUzWqWgfCjFPDIH1T+Hnmh8fOIIVZEVIo82dkHqAJMuBXl5NRHLp8iZyoHIgnWCOe4YdOIQ87g2Mf6ZTU=
X-Received: by 2002:a05:6808:117:b0:397:c26b:6abc with SMTP id
 b23-20020a056808011700b00397c26b6abcmr1143490oie.39.1684503704049; Fri, 19
 May 2023 06:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230517233550.377847-1-luben.tuikov@amd.com>
 <20230517233550.377847-2-luben.tuikov@amd.com>
 <34ee5d50-d8ac-0ce3-cf60-418ca6888294@amd.com>
In-Reply-To: <34ee5d50-d8ac-0ce3-cf60-418ca6888294@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 May 2023 09:41:32 -0400
Message-ID: <CADnq5_NM1J7ZTF3ab6f9dzXygjBMiQvG4jPJgPcAdSmOseq7rg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_can_queue()
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, May 18, 2023 at 9:03=E2=80=AFAM Luben Tuikov <luben.tuikov@amd.com>=
 wrote:
>
> On 2023-05-17 19:35, Luben Tuikov wrote:
> > Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the f=
ormer
> > is misleading, as it wakes up the GPU scheduler _only if_ more jobs can=
 be
> > queued to the underlying hardware.
> >
> > This distinction is important to make, since the wake conditional in th=
e GPU
> > scheduler thread wakes up when other conditions are also true, e.g. whe=
n there
> > are jobs to be cleaned. For instance, a user might want to wake up the
> > scheduler only because there are more jobs to clean, but whether we can=
 queue
> > more jobs is irrelevant.
> >
> > v2: Separate "canqueue" to "can_queue". (Alex D.)
> >
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Alex Deucher <Alexander.Deucher@amd.com>
> > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>
> ^ ping!
>
> Regards,
> Luben
>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
> >  drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
> >  include/drm/gpu_scheduler.h              | 2 +-
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index cfb433e9200586..68e807ae136ad8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
> >               container_of(cb, struct drm_sched_entity, cb);
> >
> >       drm_sched_entity_clear_dep(f, cb);
> > -     drm_sched_wakeup(entity->rq->sched);
> > +     drm_sched_wakeup_if_can_queue(entity->rq->sched);
> >  }
> >
> >  /**
> > @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job=
 *sched_job)
> >               if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> >                       drm_sched_rq_update_fifo(entity, submit_ts);
> >
> > -             drm_sched_wakeup(entity->rq->sched);
> > +             drm_sched_wakeup_if_can_queue(entity->rq->sched);
> >       }
> >  }
> >  EXPORT_SYMBOL(drm_sched_entity_push_job);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 8739322c30321b..b352227a605538 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_sc=
heduler *sched)
> >  }
> >
> >  /**
> > - * drm_sched_wakeup - Wake up the scheduler when it is ready
> > - *
> > + * drm_sched_wakeup_if_can_queue - Wake up the scheduler
> >   * @sched: scheduler instance
> >   *
> > + * Wake up the scheduler if we can queue jobs.
> >   */
> > -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> > +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >  {
> >       if (drm_sched_can_queue(sched))
> >               wake_up_interruptible(&sched->wake_up_worker);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 31d1f5166c79fe..e95b4837e5a373 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched=
_entity *entity,
> >                                     unsigned int num_sched_list);
> >
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> > -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> >  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_=
job *bad);
> >  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recove=
ry);
> >  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>
