Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3284FD00
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 20:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A66910FB88;
	Fri,  9 Feb 2024 19:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FqRXyGE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B093E10FB7D;
 Fri,  9 Feb 2024 19:39:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-561606f21e9so18249a12.2; 
 Fri, 09 Feb 2024 11:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707507563; x=1708112363; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kAL/NpE4O0N28eJZjVn0anRvoGT/wAMj1jeLhmNnWis=;
 b=FqRXyGE6t1BSkmgeLT7F9eijgPreHsyJHHio9lLVeN4uGJCyAEdKEvt/ZFKAzUS9Pk
 3JmjWlkEf4OLviZH34Jk1s8qlVrAgTtIXA7Q/g+UAjrnM/gkmTu3Gej3aFWfa3sHFBU2
 e4IpP3423p77IvyNBcmNwaaH309AREC/NgSdezywdZdL1tjQzkJvkg8kPEDKL6eExZgR
 F+iJRBzsXFMKm7w9Jnqy9aSAy4RggGpxNvn7jwSg8klZgd+ZvIDxXL5Z6ypb5NHqljdr
 hlwrI/CN9aXHA44RIw20xuOZqX9W556fhBdDoBjFxewU6jNCKIocXyVlD6UaGymMNmxJ
 A9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707507563; x=1708112363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAL/NpE4O0N28eJZjVn0anRvoGT/wAMj1jeLhmNnWis=;
 b=IZzsxNcBJdpIeHEGHXosWBj+SoW00Oq3TVXwVdDA4KUOd6zi6ZYoqqlm5ugR1ndMOW
 j+yd91z5hBOYgkPqjhFUhSKXKnwXCpU+O5iNnnTyX1DWXOE3PqDo9IKm0ekaIHmABMMu
 rVjGwY2ygfMV+zW6kVJn8mMpV4iO2TWY8mMoMhWa7gRwY1xiyCjj4HVN5l0mOXU+QAeQ
 wKz2J6DaeesU0WKk9g3TJMczL1wdnX4d7LPBIJv18flEnLWUZZRk06hs/IMJi7p7gLsZ
 v5Sq4yv6Co3gY2XBaN+4I9RNZUhDygqIgD+cPyzxqrP5NujBtIPTl1RSTHHnAEI7uii/
 /WDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHpo649qEQqWH89Glr9wke81+pkMLs5XCqTUfhzOaKeFglNVPpvferuWQfdtR7ZwEjeN5zVZr9Oe5MkgwKa90y3FFFhmmPNTNy5pmbL8MT
X-Gm-Message-State: AOJu0YzfF9qCMBq1GCWAfVZDrjRrfxGil0u4bTHKfomx3iih+adnNYsI
 Gu2RToAiaJXy/tYy/UCXXQIjqE1akBJRwks/hth+Lvw6NXDDTduXFH4aQf1NRMUoBiHr/UBrzdu
 S7j1uGH265Wn4MbhYUaVJEXbylU9xBl64e2g=
X-Google-Smtp-Source: AGHT+IGwKNx5cO534Cy9V5UzAzNAR9J2g0bcAl0tlmX+Gfpl8IhLK4ddgKFKvnlwuMiUnngbCyp8VFUtleS7nBiwdcY=
X-Received: by 2002:a17:906:168d:b0:a39:e059:e632 with SMTP id
 s13-20020a170906168d00b00a39e059e632mr65651ejd.3.1707507563196; Fri, 09 Feb
 2024 11:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20240202000606.3526-1-dakr@redhat.com>
In-Reply-To: <20240202000606.3526-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Feb 2024 05:39:11 +1000
Message-ID: <CAPM=9tzKwbX6KFaa-DhKQJfPBbCyP80aEHY5b+MtkGkByx7YPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
To: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org, lyude@redhat.com, kherbst@redhat.com, 
 ttabi@nvidia.com, dri-devel@lists.freedesktop.org
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

On Fri, 2 Feb 2024 at 10:06, Danilo Krummrich <dakr@redhat.com> wrote:
>
> nouveau_abi16_ioctl_channel_alloc() and nouveau_cli_init() simply call
> their corresponding *_fini() counterpart. This can lead to
> nouveau_sched_fini() being called without struct nouveau_sched ever
> being initialized in the first place.
>
> Instead of embedding struct nouveau_sched into struct nouveau_cli and
> struct nouveau_chan_abi16, allocate struct nouveau_sched separately,
> such that we can check for the corresponding pointer to be NULL in the
> particular *_fini() functions.
>
> It makes sense to allocate struct nouveau_sched separately anyway, since
> in a subsequent commit we can also avoid to allocate a struct
> nouveau_sched in nouveau_abi16_ioctl_channel_alloc() at all, if the
> VM_BIND uAPI has been disabled due to the legacy uAPI being used.

Looks good,

for the series
Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
> Reported-by: Timur Tabi <ttabi@nvidia.com>
> Closes: https://lore.kernel.org/nouveau/20240131213917.1545604-1-ttabi@nvidia.com/
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 10 ++++---
>  drivers/gpu/drm/nouveau/nouveau_abi16.h |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  7 +++--
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 38 +++++++++++++++++++++++--
>  drivers/gpu/drm/nouveau/nouveau_sched.h |  6 ++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
>  8 files changed, 53 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index a04156ca8390..ca4b5ab3e59e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -128,12 +128,14 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
>         struct nouveau_abi16_ntfy *ntfy, *temp;
>
>         /* Cancel all jobs from the entity's queue. */
> -       drm_sched_entity_fini(&chan->sched.entity);
> +       if (chan->sched)
> +               drm_sched_entity_fini(&chan->sched->entity);
>
>         if (chan->chan)
>                 nouveau_channel_idle(chan->chan);
>
> -       nouveau_sched_fini(&chan->sched);
> +       if (chan->sched)
> +               nouveau_sched_destroy(&chan->sched);
>
>         /* cleanup notifier state */
>         list_for_each_entry_safe(ntfy, temp, &chan->notifiers, head) {
> @@ -337,8 +339,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>         if (ret)
>                 goto done;
>
> -       ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq,
> -                                chan->chan->dma.ib_max);
> +       ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
> +                                  chan->chan->dma.ib_max);
>         if (ret)
>                 goto done;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 1f5e243c0c75..11c8c4a80079 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -26,7 +26,7 @@ struct nouveau_abi16_chan {
>         struct nouveau_bo *ntfy;
>         struct nouveau_vma *ntfy_vma;
>         struct nvkm_mm  heap;
> -       struct nouveau_sched sched;
> +       struct nouveau_sched *sched;
>  };
>
>  struct nouveau_abi16 {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 6f6c31a9937b..a947e1d5f309 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -201,7 +201,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>         WARN_ON(!list_empty(&cli->worker));
>
>         usif_client_fini(cli);
> -       nouveau_sched_fini(&cli->sched);
> +       if (cli->sched)
> +               nouveau_sched_destroy(&cli->sched);
>         if (uvmm)
>                 nouveau_uvmm_fini(uvmm);
>         nouveau_vmm_fini(&cli->svm);
> @@ -311,7 +312,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>         cli->mem = &mems[ret];
>
>         /* Don't pass in the (shared) sched_wq in order to let
> -        * nouveau_sched_init() create a dedicated one for VM_BIND jobs.
> +        * nouveau_sched_create() create a dedicated one for VM_BIND jobs.
>          *
>          * This is required to ensure that for VM_BIND jobs free_job() work and
>          * run_job() work can always run concurrently and hence, free_job() work
> @@ -320,7 +321,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>          * locks which indirectly or directly are held for allocations
>          * elsewhere.
>          */
> -       ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
> +       ret = nouveau_sched_create(&cli->sched, drm, NULL, 1);
>         if (ret)
>                 goto done;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 8a6d94c8b163..e239c6bf4afa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -98,7 +98,7 @@ struct nouveau_cli {
>                 bool disabled;
>         } uvmm;
>
> -       struct nouveau_sched sched;
> +       struct nouveau_sched *sched;
>
>         const struct nvif_mclass *mem;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index bc5d71b79ab2..e65c0ef23bc7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -389,7 +389,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
>         if (ret)
>                 goto out;
>
> -       args.sched = &chan16->sched;
> +       args.sched = chan16->sched;
>         args.file_priv = file_priv;
>         args.chan = chan;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index dd98f6910f9c..32fa2e273965 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -398,7 +398,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
>         .free_job = nouveau_sched_free_job,
>  };
>
> -int
> +static int
>  nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>                    struct workqueue_struct *wq, u32 credit_limit)
>  {
> @@ -453,7 +453,30 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>         return ret;
>  }
>
> -void
> +int
> +nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> +                    struct workqueue_struct *wq, u32 credit_limit)
> +{
> +       struct nouveau_sched *sched;
> +       int ret;
> +
> +       sched = kzalloc(sizeof(*sched), GFP_KERNEL);
> +       if (!sched)
> +               return -ENOMEM;
> +
> +       ret = nouveau_sched_init(sched, drm, wq, credit_limit);
> +       if (ret) {
> +               kfree(sched);
> +               return ret;
> +       }
> +
> +       *psched = sched;
> +
> +       return 0;
> +}
> +
> +
> +static void
>  nouveau_sched_fini(struct nouveau_sched *sched)
>  {
>         struct drm_gpu_scheduler *drm_sched = &sched->base;
> @@ -471,3 +494,14 @@ nouveau_sched_fini(struct nouveau_sched *sched)
>         if (sched->wq)
>                 destroy_workqueue(sched->wq);
>  }
> +
> +void
> +nouveau_sched_destroy(struct nouveau_sched **psched)
> +{
> +       struct nouveau_sched *sched = *psched;
> +
> +       nouveau_sched_fini(sched);
> +       kfree(sched);
> +
> +       *psched = NULL;
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index a6528f5981e6..e1f01a23e6f6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -111,8 +111,8 @@ struct nouveau_sched {
>         } job;
>  };
>
> -int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
> -                      struct workqueue_struct *wq, u32 credit_limit);
> -void nouveau_sched_fini(struct nouveau_sched *sched);
> +int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> +                        struct workqueue_struct *wq, u32 credit_limit);
> +void nouveau_sched_destroy(struct nouveau_sched **psched);
>
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 4f223c972c6a..0a0a11dc9ec0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1740,7 +1740,7 @@ nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> -       args.sched = &cli->sched;
> +       args.sched = cli->sched;
>         args.file_priv = file_priv;
>
>         ret = nouveau_uvmm_vm_bind(&args);
>
> base-commit: 041261ac4c365e03b07427569d6735f8adfd21c8
> --
> 2.43.0
>
