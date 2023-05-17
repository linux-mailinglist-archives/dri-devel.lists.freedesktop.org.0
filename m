Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C8707347
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 22:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660C610E47C;
	Wed, 17 May 2023 20:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ECB10E476
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 20:43:26 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-19a16355c51so794660fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684356205; x=1686948205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e460CfnRibvkS9TPCkhGPOYssy2ImMl61qzx+NIKB/Q=;
 b=kfxtgznyujqZIjSagNay3rq6Wr2rRmDyq5iZ16a8cmWAnsMf1AFrbroYXAjHIEZX/P
 BCq6jITgi5FSnLwT2PBuBlwOtkdFgZCbdbjTedHeKss4loqFDGoVVtf76eO0+t1Is1eo
 MYLNgB3Y8cPtiVTtxhZKRMtkwtaI3mReeB54Gdmsbzh4mrN8TvDVrbrbqxdjVBPT4r/a
 12TzinE0IX3T6J8swoZdFxjnwaqYHODwTgd0qvS5PMT22kFTp/zgxjRKk1C2X94MC/OG
 VWsQleMfD8DRPCrB28Wnxi/00ub9ouBKoeVcAJUW+/cSGhWFfD5YQcSmDzCPMgRjo+4z
 GCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684356205; x=1686948205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e460CfnRibvkS9TPCkhGPOYssy2ImMl61qzx+NIKB/Q=;
 b=Ju5sW9VXbN58qokps2sb8CoEfA6O1pY+7McLD10BiSnqEgin6F1rgz2rMVA4JDcxVQ
 e8GLd35llhM2hOKAxplUhv1+nBxyK++S1+E+/bIlVyi2asgSLiiii4pLJJLGXmrX0Kon
 zgDqkfB8VJFMwaY+xkpB6KR1OUPdAi5GnJ0NhtbP242i50h8i/4+OnIolfFerT0/5AaF
 3b8YaSV/ZpWaVeT5VsgvmmPon5xm17Y7p8zkKoM0xRcDmWsqE+Zc/5s54ZXHqNJ9mi2+
 qKEuA8hAZEt+ImQhM1A/dsK8O3Ca8A/eGVf2lENafa+KIB0ku7zSvc3fQ4jjlvBCaeFN
 QtrQ==
X-Gm-Message-State: AC+VfDykAt0FtfZThOykhOzK7nqHVWq1u3a96X82CniMmOtKhroukcED
 EvX8Jj0tP4LZUJeSRMQHbtaAKtcE3S+EzUq/UEwNG7TSGAU=
X-Google-Smtp-Source: ACHHUZ6qGPV7wLRtldbe/+COBkHNz61LzAHcmoPrnwjYBLdFbRkN4QMqXuLwLQsFNXsVk7L+ADkY0fHtmsWIs7iZphk=
X-Received: by 2002:a05:6870:d8a6:b0:196:275:59ba with SMTP id
 dv38-20020a056870d8a600b00196027559bamr89190oab.7.1684356205139; Wed, 17 May
 2023 13:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230517190356.349044-1-luben.tuikov@amd.com>
 <20230517190356.349044-2-luben.tuikov@amd.com>
In-Reply-To: <20230517190356.349044-2-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 May 2023 16:43:14 -0400
Message-ID: <CADnq5_MHqGG1wrneuKCOcrv=yqswBp6_TxTCdZbBa7MZi5SqBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_canqueue()
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

On Wed, May 17, 2023 at 3:04=E2=80=AFPM Luben Tuikov <luben.tuikov@amd.com>=
 wrote:
>
> Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the for=
mer

I think drm_sched_wakeup_if_can_queue() looks cleaner.

Alex

> is misleading, as it wakes up the GPU scheduler _only if_ more jobs can b=
e
> queued to the underlying hardware.
>
> This distinction is important to make, since the wake conditional in the =
GPU
> scheduler thread wakes up when other conditions are also true, e.g. when =
there
> are jobs to be cleaned. For instance, a user might want to wake up the
> scheduler only because there are more jobs to clean, but whether we can q=
ueue
> more jobs is irrelevant.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>  drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
>  include/drm/gpu_scheduler.h              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index cfb433e9200586..371b44fb4bacf4 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence =
*f,
>                 container_of(cb, struct drm_sched_entity, cb);
>
>         drm_sched_entity_clear_dep(f, cb);
> -       drm_sched_wakeup(entity->rq->sched);
> +       drm_sched_wakeup_if_canqueue(entity->rq->sched);
>  }
>
>  /**
> @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *=
sched_job)
>                 if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>                         drm_sched_rq_update_fifo(entity, submit_ts);
>
> -               drm_sched_wakeup(entity->rq->sched);
> +               drm_sched_wakeup_if_canqueue(entity->rq->sched);
>         }
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 8739322c30321b..f437dbe62112cc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_sche=
duler *sched)
>  }
>
>  /**
> - * drm_sched_wakeup - Wake up the scheduler when it is ready
> - *
> + * drm_sched_wakeup_if_canqueue - Wake up the scheduler
>   * @sched: scheduler instance
>   *
> + * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched)
>  {
>         if (drm_sched_can_queue(sched))
>                 wake_up_interruptible(&sched->wake_up_worker);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 31d1f5166c79fe..a05dd01e264842 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_e=
ntity *entity,
>                                     unsigned int num_sched_list);
>
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_jo=
b *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery=
);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> --
> 2.40.1
>
