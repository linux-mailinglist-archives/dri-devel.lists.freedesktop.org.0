Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F57A887E3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD9D10E217;
	Mon, 14 Apr 2025 15:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKomuFcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BC810E217;
 Mon, 14 Apr 2025 15:58:57 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3d6d162e516so36670795ab.1; 
 Mon, 14 Apr 2025 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744646336; x=1745251136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6P8ayfjreTaAdbrwfIK/U4coYDih17t3SKgQH6xJW0=;
 b=WKomuFcY0pqGwV4AbldPe87DL4D1Bkp2Zd07Tf6H3i90IwXSmlmYd2CQNUE9pxsT28
 zmqM2Z2mHTMpkA3sN/7gZ9cMVRvVmxAMYQmpNJDoU1JdL9wazyZ+Ww7ix0oVhWEDhTVb
 rbWaqsEp5JvmtiC1Ju0JmnrMBG2v0zoblFW8mzSR2K/8hQvvewYw3oLNhiCsQNbwLZhr
 /fH/+Sz+ZgqES/gnldQy5MMA4tcPgDPNEW2NqbtkMhgCfzN6fyM7Vabv+S8hda45TXuP
 cQehEcwj4giSOBOo3px3UWtwbv2sg/6a/4iIVhiWeendADkGPaBarc7CVaFeBnBQpmg7
 rfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744646336; x=1745251136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6P8ayfjreTaAdbrwfIK/U4coYDih17t3SKgQH6xJW0=;
 b=Z0zicRFnNlYtRmVBBs1fELuwWk6fecmsFaENOwmcIeBOnf0NxfF4bIrH4VIVaqdEa9
 E5L7u9GwmuWko47pOA2OAfJvajUUa+VbmaZKBu0TeGEo2v9BhIpQcNu9R2hYkMkMDUJs
 PCSLfrKqLm8xR5GoZ81H9u4nUnAjUyX078pslYRaSYwyFWJQ1LpPRMBmRVbcQMNZubJD
 NlHk9NtXG10nyu2NhXqndIz2BkQ2EKxtdEaOu8nX4N/S/Wvkkhrh37uxf6rBGB/fCJkP
 7h+pbbAf4bB7eCl8tsrZBQnZfALyB1YMkEKpH9GYyc3iA0hswWrloANDvv0Sb4DeZr3r
 H6bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkQNWQMoOVeZ3WkYGVF+YDKblxq1MWrNU2/3gU7ILAAkqInf8snomz7WFf/AZcb6IKNh+YGVMWMpM=@lists.freedesktop.org,
 AJvYcCXkxBBopMPQw6t9zldrhKxA30FA2cop+EKZNFu9yhxsqBGCMeBDtxVd0467FrmLTyPbdInxmZtvYLlM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/PIrRP8dblL6l8Orv4mmLYjhKCOWXojC9Jobjd1UcKMmhbyMv
 mZ0njnc+cIk1Co2EekxEKmKAGZley/2hMgMwlG6957v0WgEvD1RJ7PPRFwnGAQRRK1t9p4ForbW
 TOkUcez5Uwl2ecvzlEbcFCvvIsgM=
X-Gm-Gg: ASbGncvh7BSM1BzBakZ3q2A6/hcwKNFilosBDZc/PqGdmy3JCjFztp+95KyX43di0+N
 At7eCZbOU9RKihyMT/ISY69p4EDfETV/x39WdW4EfGHhfI9Jql46d53mV6mgJGf4NWTOfPN+pn3
 I+ucES/9+shfFARELAORbAWScQaxb3VhJoc/PW5Px0m72dd5KA4TCf
X-Google-Smtp-Source: AGHT+IGTJOrEPEiVQW2cxlaQzIiNbiSJmAaMsZZjfT3INWUuQzyEmCLMu7tBGSiCluIYiS0KpLJkhLx4jPL1HbwRKKM=
X-Received: by 2002:a05:6e02:1f86:b0:3d3:f6ee:cc4c with SMTP id
 e9e14a558f8ab-3d7ec0e1287mr131512955ab.0.1744646336149; Mon, 14 Apr 2025
 08:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Apr 2025 08:58:44 -0700
X-Gm-Features: ATxdqUE_40sjegeHYa17G5HPUwszlpBReEliqxXQxbBNutISCiHgfrvT9EcVIts
Message-ID: <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, Apr 13, 2025 at 9:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The global workqueue is only used for vblanks inside KMS code. Move
> allocation / flushing / deallcation of it to msm_kms.c

Maybe we should also just move the wq into struct msm_kms?

BR,
-R

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>  drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>  2 files changed, 17 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d0=
7a6d82ae21c965e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>                         drm_atomic_helper_shutdown(ddev);
>         }
>
> -       /* We must cancel and cleanup any pending vblank enable/disable
> -        * work before msm_irq_uninstall() to avoid work re-enabling an
> -        * irq after uninstall has disabled it.
> -        */
> -
> -       flush_workqueue(priv->wq);
> -
>         msm_gem_shrinker_cleanup(ddev);
>
>         msm_perf_debugfs_cleanup(priv);
> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>         ddev->dev_private =3D NULL;
>         drm_dev_put(ddev);
>
> -       destroy_workqueue(priv->wq);
> -
>         return 0;
>  }
>
> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const st=
ruct drm_driver *drv)
>         ddev->dev_private =3D priv;
>         priv->dev =3D ddev;
>
> -       priv->wq =3D alloc_ordered_workqueue("msm", 0);
> -       if (!priv->wq) {
> -               ret =3D -ENOMEM;
> -               goto err_put_dev;
> -       }
> -
>         INIT_LIST_HEAD(&priv->objects);
>         mutex_init(&priv->obj_lock);
>
> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const s=
truct drm_driver *drv)
>         if (priv->kms_init) {
>                 ret =3D drmm_mode_config_init(ddev);
>                 if (ret)
> -                       goto err_destroy_wq;
> +                       goto err_put_dev;
>         }
>
>         ret =3D msm_init_vram(ddev);
>         if (ret)
> -               goto err_destroy_wq;
> +               goto err_put_dev;
>
>         dma_set_max_seg_size(dev, UINT_MAX);
>
> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const str=
uct drm_driver *drv)
>
>  err_deinit_vram:
>         msm_deinit_vram(ddev);
> -err_destroy_wq:
> -       destroy_workqueue(priv->wq);
>  err_put_dev:
>         drm_dev_put(ddev);
>
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.=
c
> index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfa=
e04639ceb770353 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>
>         BUG_ON(!kms);
>
> +       /* We must cancel and cleanup any pending vblank enable/disable
> +        * work before msm_irq_uninstall() to avoid work re-enabling an
> +        * irq after uninstall has disabled it.
> +        */
> +
> +       flush_workqueue(priv->wq);
> +
>         /* clean up event worker threads */
>         for (i =3D 0; i < priv->num_crtcs; i++) {
>                 if (priv->event_thread[i].worker)
> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>
>         if (kms && kms->funcs)
>                 kms->funcs->destroy(kms);
> +
> +       destroy_workqueue(priv->wq);
>  }
>
>  int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const stru=
ct drm_driver *drv)
>         if (ret)
>                 return ret;
>
> +       priv->wq =3D alloc_ordered_workqueue("msm", 0);
> +       if (!priv->wq)
> +               return -ENOMEM;
> +
>         ret =3D priv->kms_init(ddev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "failed to load kms\n");
> -               return ret;
> +               goto err_msm_uninit;
>         }
>
>         /* Enable normalization of plane zpos */
> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct=
 drm_driver *drv)
>         return 0;
>
>  err_msm_uninit:
> +       destroy_workqueue(priv->wq);
>         return ret;
>  }
>
>
> --
> 2.39.5
>
