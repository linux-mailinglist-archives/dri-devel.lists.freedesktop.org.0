Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B238987A2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B915D11B574;
	Thu,  4 Apr 2024 12:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZIvH52gb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6EB11B570;
 Thu,  4 Apr 2024 12:31:07 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso1065914a12.0; 
 Thu, 04 Apr 2024 05:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712233866; x=1712838666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5IwmRgdEPnj6cEnpM8t1VttTnz3a23m0KMK2QPuZLz0=;
 b=ZIvH52gb9ARMSkB//0ubLD0H3l1iLDRCQLb9U4efk4MuGM5OAxV10xNmJclIGmvM/m
 cuqBrRFtzTtB/vlkDMe79Jb6wUTwW1692eqmXYYzv5z2YkHbSHXZF5PgAzxWWmDouRay
 J/QwZehz28JPsv4cdvfKI6Xan5eCvbDZak3k4cLt/47dbB1WquY+TcnFpRA6J3J46mTr
 MXU18g8wsahcYnw6/K/+aiVp2cZ0+YXOj+XPki73xte+z7gJAv/Ihy3uEdWjf3QXZ+10
 PXvzgmhJ6vWI0d6PwjkREL6+ssoCqpcSEFBpjNr4DX7xvjvqGF9R/WnxHHz8Z96Lh73N
 YrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712233866; x=1712838666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IwmRgdEPnj6cEnpM8t1VttTnz3a23m0KMK2QPuZLz0=;
 b=XYIxM5McCqbehTTFiEFOisWcMyz/WSeo5poWhwbPAHefcy3BhYhqBO5CEdqKo5Cp+P
 Lhx56klhwR1Db94Ksv0zULUdMHP84iBvFLRHc6o5VszNtv3cyN1f3ezTRYPQVEM5i+V/
 K08mJTleIBcepQrGWqC5nyPSHXqejJ8bOFicJpAB0C48gg/WZqAMss+VvR/PYpSueYL/
 TqhEneGwRYiR2P4h4mUmRI6723hZSDlkr2HiaxGdE4N2RU3UpJJBCPCZ45keWb9zpePG
 JqjWit06ACYcIFiipop9VurhxNwC/mPY08ffJ1DSgiv7px9vExSaWc7IZeUnAMUSAkgw
 UsEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFEveFCB5uqqsU2Dn+kY6FJTA2F/km7nUiNq+jhWCqOSf6K8p2uMKMphIV8mCb46SMXJQWpcBhHP184ZfBSDvhPM3pX5sGLeNcrc/9t7mba7gP8wpzk+VbHOHhIvVAXXH9M99NDxUIthqpsg==
X-Gm-Message-State: AOJu0Yx1AG34IYf7BK6DSAKVIaYpA9J4P0sFW4O0yR4ofvQ8a9tbxQEq
 8JF+kMcmfdS+WikQ51jDyi3AgMmz1Grd5BI5PxMm4dl38YTdVvA99zIegEVdPuDsn2/j7OFdbjG
 6eC3rS3EQEHXM+tKYMrJLVZVO+Os=
X-Google-Smtp-Source: AGHT+IETa7eilRYg5Y9zUhLi3sU/C9hg7AHUP2APVSNJT8KU7TPwO4zk3TrN86ComgfhKrwthCS+ouSEaNvdFDlvaDI=
X-Received: by 2002:a50:8e5d:0:b0:56b:dd3c:7df8 with SMTP id
 29-20020a508e5d000000b0056bdd3c7df8mr1324314edx.19.1712233865834; Thu, 04 Apr
 2024 05:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240401212002.1191549-1-nunes.erico@gmail.com>
 <20240401212002.1191549-2-nunes.erico@gmail.com>
In-Reply-To: <20240401212002.1191549-2-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 4 Apr 2024 20:30:53 +0800
Message-ID: <CAKGbVbtbhJEyP_ovvD6ZGrh-PBdC-SfY=DaxCk32C44Un+XpRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/lima: add mask irq callback to gp and pp
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 christian.koenig@amd.com, megi@xff.cz, linux-kernel@vger.kernel.org
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

On Tue, Apr 2, 2024 at 5:20=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com> =
wrote:
>
> This is needed because we want to reset those devices in device-agnostic
> code such as lima_sched.
> In particular, masking irqs will be useful before a hard reset to
> prevent race conditions.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
>  drivers/gpu/drm/lima/lima_bcast.h |  3 +++
>  drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
>  drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
>  drivers/gpu/drm/lima/lima_sched.c |  2 ++
>  drivers/gpu/drm/lima/lima_sched.h |  1 +
>  6 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_bcast.c b/drivers/gpu/drm/lima/lim=
a_bcast.c
> index fbc43f243c54..6d000504e1a4 100644
> --- a/drivers/gpu/drm/lima/lima_bcast.c
> +++ b/drivers/gpu/drm/lima/lima_bcast.c
> @@ -43,6 +43,18 @@ void lima_bcast_suspend(struct lima_ip *ip)
>
>  }
>
> +int lima_bcast_mask_irq(struct lima_ip *ip)
> +{
> +       bcast_write(LIMA_BCAST_BROADCAST_MASK, 0);
> +       bcast_write(LIMA_BCAST_INTERRUPT_MASK, 0);
> +       return 0;
> +}
> +
> +int lima_bcast_reset(struct lima_ip *ip)
> +{
> +       return lima_bcast_hw_init(ip);
> +}
> +
>  int lima_bcast_init(struct lima_ip *ip)
>  {
>         int i;
> diff --git a/drivers/gpu/drm/lima/lima_bcast.h b/drivers/gpu/drm/lima/lim=
a_bcast.h
> index 465ee587bceb..cd08841e4787 100644
> --- a/drivers/gpu/drm/lima/lima_bcast.h
> +++ b/drivers/gpu/drm/lima/lima_bcast.h
> @@ -13,4 +13,7 @@ void lima_bcast_fini(struct lima_ip *ip);
>
>  void lima_bcast_enable(struct lima_device *dev, int num_pp);
>
> +int lima_bcast_mask_irq(struct lima_ip *ip);
> +int lima_bcast_reset(struct lima_ip *ip);
> +
>  #endif
> diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_g=
p.c
> index 6b354e2fb61d..e15295071533 100644
> --- a/drivers/gpu/drm/lima/lima_gp.c
> +++ b/drivers/gpu/drm/lima/lima_gp.c
> @@ -233,6 +233,13 @@ static void lima_gp_task_mmu_error(struct lima_sched=
_pipe *pipe)
>         lima_sched_pipe_task_done(pipe);
>  }
>
> +static void lima_gp_task_mask_irq(struct lima_sched_pipe *pipe)
> +{
> +       struct lima_ip *ip =3D pipe->processor[0];
> +
> +       gp_write(LIMA_GP_INT_MASK, 0);
> +}
> +
>  static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
>  {
>         struct lima_ip *ip =3D pipe->processor[0];
> @@ -365,6 +372,7 @@ int lima_gp_pipe_init(struct lima_device *dev)
>         pipe->task_error =3D lima_gp_task_error;
>         pipe->task_mmu_error =3D lima_gp_task_mmu_error;
>         pipe->task_recover =3D lima_gp_task_recover;
> +       pipe->task_mask_irq =3D lima_gp_task_mask_irq;
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_p=
p.c
> index d0d2db0ef1ce..a4a2ffe6527c 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -429,6 +429,9 @@ static void lima_pp_task_error(struct lima_sched_pipe=
 *pipe)
>
>                 lima_pp_hard_reset(ip);
>         }
> +
> +       if (pipe->bcast_processor)
> +               lima_bcast_reset(pipe->bcast_processor);
>  }
>
>  static void lima_pp_task_mmu_error(struct lima_sched_pipe *pipe)
> @@ -437,6 +440,20 @@ static void lima_pp_task_mmu_error(struct lima_sched=
_pipe *pipe)
>                 lima_sched_pipe_task_done(pipe);
>  }
>
> +static void lima_pp_task_mask_irq(struct lima_sched_pipe *pipe)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < pipe->num_processor; i++) {
> +               struct lima_ip *ip =3D pipe->processor[i];
> +
> +               pp_write(LIMA_PP_INT_MASK, 0);
> +       }
> +
> +       if (pipe->bcast_processor)
> +               lima_bcast_mask_irq(pipe->bcast_processor);
> +}
> +
>  static struct kmem_cache *lima_pp_task_slab;
>  static int lima_pp_task_slab_refcnt;
>
> @@ -468,6 +485,7 @@ int lima_pp_pipe_init(struct lima_device *dev)
>         pipe->task_fini =3D lima_pp_task_fini;
>         pipe->task_error =3D lima_pp_task_error;
>         pipe->task_mmu_error =3D lima_pp_task_mmu_error;
> +       pipe->task_mask_irq =3D lima_pp_task_mask_irq;
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 00b19adfc888..66841503a618 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -422,6 +422,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_jo=
b(struct drm_sched_job *job
>          */
>         for (i =3D 0; i < pipe->num_processor; i++)
>                 synchronize_irq(pipe->processor[i]->irq);
> +       if (pipe->bcast_processor)
> +               synchronize_irq(pipe->bcast_processor->irq);
Better split this into another patch as it does not match the commit commen=
t.

>
>         if (dma_fence_is_signaled(task->fence)) {
>                 DRM_WARN("%s unexpectedly high interrupt latency\n", lima=
_ip_name(ip));
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lim=
a_sched.h
> index 6bd4f3b70109..85b23ba901d5 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -80,6 +80,7 @@ struct lima_sched_pipe {
>         void (*task_error)(struct lima_sched_pipe *pipe);
>         void (*task_mmu_error)(struct lima_sched_pipe *pipe);
>         int (*task_recover)(struct lima_sched_pipe *pipe);
> +       void (*task_mask_irq)(struct lima_sched_pipe *pipe);
>
>         struct work_struct recover_work;
>  };
> --
> 2.44.0
>
