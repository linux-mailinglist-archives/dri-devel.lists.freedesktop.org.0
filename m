Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E37F3B24
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 02:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D3210E0DC;
	Wed, 22 Nov 2023 01:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADD510E0DC;
 Wed, 22 Nov 2023 01:19:25 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a00cbb83c82so286630666b.2; 
 Tue, 21 Nov 2023 17:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700615963; x=1701220763; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vZGhQL4OBe/w6Y5dH1V9yZe8yI/e7FkVl7hC3fRwMhU=;
 b=R6+YohoruuXXCz7zgZP2wJMgwQm1QKV9mk6v6ssDoNw97dSuJdYpk8Ko/BnIgHEMw2
 mW5gWWz9W5EW4RGcg7FClWsItn/QXuZftHTZwuw9FqaF4NLzG30FddTV2eDsRXEIBvxb
 wSWWXepv+gdYBhxzMcRj3XCIHD0OMDfrWhmEtI8Z2nLcG12M/xvW6QnAq2ZwJw4RYLQ+
 3Scf9XPC+mwgaY6S1IogaIwQPdKLlpGESJ5W6Fu8xCsw0pEiBr5yt4TKfJb2P0Gway4M
 UhKPFHHNUcb7bNZYSMeCOilLf84baVI3dAitquatjrRoi8G1Trz7F0bCaZ+3lI3ex129
 qO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700615963; x=1701220763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZGhQL4OBe/w6Y5dH1V9yZe8yI/e7FkVl7hC3fRwMhU=;
 b=BLkiyi/22vMx5lwWHG+G0MrmmxOWLxjhQFlL3NDYai5TSva2qq4b6j/SbCxAOlUrHk
 9+JtWPtlcJACrf6DeaJw7TH0+EJJDvRgtxEwtwhVNbljyIM8zUqEy1MIWas9n643FtwH
 LIKwF0SWSYINzrh0mhV2yCbrOV3YlDb8KbsBRiTtV6jSS4pKxcks8dS6eq49tvTL0Y0D
 OZJ0tXaUprx36xc860pvLEBsiILfRAPrmh1BA1yBKor3Pi96ykHLSXd4aHOOzoiG1Rn+
 Ig6nm/g8V+2UqT9vb+D0r7vPOaM/1v2lpfd+QYSToauJVq6Ryr+VmnswweygS3K2PiwT
 o8Bg==
X-Gm-Message-State: AOJu0Yw4WhEPB3YwlT/jUAavSRy6U1N0DXeBEll/TpqtMW4iUtYAIw3A
 KbhFICpgMbRTDnapXetFykrzSA0RM1RQ3Suf1UQ=
X-Google-Smtp-Source: AGHT+IEgAQWOGk+SDijL13R5w4xsY8EMQK2JoQ1fTbGs4e02B5hyIfPSjFGGzLRi1hch7qTNpuuuR9MgasnRRFsER/g=
X-Received: by 2002:a17:906:1cf:b0:a02:99b5:d0dc with SMTP id
 15-20020a17090601cf00b00a0299b5d0dcmr505803ejj.10.1700615963182; Tue, 21 Nov
 2023 17:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20231114002728.3491-1-dakr@redhat.com>
 <20231114002728.3491-2-dakr@redhat.com>
In-Reply-To: <20231114002728.3491-2-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 22 Nov 2023 11:19:11 +1000
Message-ID: <CAPM=9twZwCyaSOsew_sXgmp4-5JqjZGTHiR+0xN94enwrgR9=Q@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next 2/2] drm/nouveau: enable dynamic job-flow
 control
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023 at 10:27, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Make use of the scheduler's credit limit and scheduler job's credit
> count to account for the actual size of a job, such that we fill up the
> ring efficiently.

For the two:

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c  | 4 +++-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 9 ++++-----
>  drivers/gpu/drm/nouveau/nouveau_sched.h | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 4 +++-
>  6 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index f8e59cfb1d34..207945700c94 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -316,7 +316,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>         if (ret)
>                 goto done;
>
> -       ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq);
> +       ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq,
> +                                chan->chan->dma.ib_max);
>         if (ret)
>                 goto done;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 7e5f19153829..6f6c31a9937b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -320,7 +320,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>          * locks which indirectly or directly are held for allocations
>          * elsewhere.
>          */
> -       ret = nouveau_sched_init(&cli->sched, drm, NULL);
> +       ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
>         if (ret)
>                 goto done;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index 388831c53551..63c344f4f78e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -258,10 +258,12 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
>                 }
>         }
>
> +       args.file_priv = __args->file_priv;
>         job->chan = __args->chan;
>
>         args.sched = __args->sched;
> -       args.file_priv = __args->file_priv;
> +       /* Plus one to account for the HW fence. */
> +       args.credits = job->push.count + 1;
>
>         args.in_sync.count = __args->in_sync.count;
>         args.in_sync.s = __args->in_sync.s;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index faabd662b165..6406d6659361 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -12,7 +12,6 @@
>  #include "nouveau_abi16.h"
>  #include "nouveau_sched.h"
>
> -#define NOUVEAU_SCHED_HW_SUBMISSIONS           1
>  #define NOUVEAU_SCHED_JOB_TIMEOUT_MS           10000
>
>  /* Starts at 0, since the DRM scheduler interprets those parameters as (initial)
> @@ -85,10 +84,10 @@ nouveau_job_init(struct nouveau_job *job,
>                         ret = -ENOMEM;
>                         goto err_free_objs;
>                 }
> -
>         }
>
> -       ret = drm_sched_job_init(&job->base, &sched->entity, 1, NULL);
> +       ret = drm_sched_job_init(&job->base, &sched->entity,
> +                                args->credits, NULL);
>         if (ret)
>                 goto err_free_chains;
>
> @@ -396,7 +395,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
>
>  int
>  nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
> -                  struct workqueue_struct *wq)
> +                  struct workqueue_struct *wq, u32 credit_limit)
>  {
>         struct drm_gpu_scheduler *drm_sched = &sched->base;
>         struct drm_sched_entity *entity = &sched->entity;
> @@ -414,7 +413,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>
>         ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
>                              NOUVEAU_SCHED_PRIORITY_COUNT,
> -                            NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> +                            credit_limit, 0, job_hang_limit,
>                              NULL, NULL, "nouveau_sched", drm->dev->dev);
>         if (ret)
>                 goto fail_wq;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index 026f33d9b70c..7ba8ffec135a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -27,6 +27,7 @@ enum nouveau_job_state {
>  struct nouveau_job_args {
>         struct drm_file *file_priv;
>         struct nouveau_sched *sched;
> +       u32 credits;
>
>         enum dma_resv_usage resv_usage;
>         bool sync;
> @@ -112,7 +113,7 @@ struct nouveau_sched {
>  };
>
>  int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
> -                      struct workqueue_struct *wq);
> +                      struct workqueue_struct *wq, u32 credit_limit);
>  void nouveau_sched_fini(struct nouveau_sched *sched);
>
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index c95186b34ea0..708cd5f43cb9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1606,9 +1606,11 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
>
>         init_completion(&job->complete);
>
> -       args.sched = __args->sched;
>         args.file_priv = __args->file_priv;
>
> +       args.sched = __args->sched;
> +       args.credits = 1;
> +
>         args.in_sync.count = __args->in_sync.count;
>         args.in_sync.s = __args->in_sync.s;
>
> --
> 2.41.0
>
