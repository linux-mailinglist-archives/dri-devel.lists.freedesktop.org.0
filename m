Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71808AAE707
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0710E063;
	Wed,  7 May 2025 16:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTF/3vx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCC10E063;
 Wed,  7 May 2025 16:43:25 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3da74959554so2972395ab.2; 
 Wed, 07 May 2025 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746636204; x=1747241004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAqGiu2LUseqRIDDRrmCl771ZRfnWxX3nt+ElhtFaT0=;
 b=KTF/3vx8HO2bL+F6Cw6smMmwbOGQ8PCbuEZuAjGu18FhIsXtO8WhenLnGN7JlY7ESe
 Fg7nihZOm/fFAknU5bIIU97Lj2HNJLE4TJwW24a8TSMQ3vz/aCqMv27sszBeygsNymCH
 lua+XJq3DURO7AMlnHrFixTjs2cq9l1z9JvfrnfFETsUGmWu8BlDp7fDoUN7n4E/sp1l
 hkWXV9mHTjRCAYTkqGomdWZNUM5E6JzFvWn69YKLaKmG+z/K/5m6tNJl0IyTGtus3T4T
 /LWIvdteo7pcPUAAkuUmveuV6FgKWsebhwzLRwEugD2rHZQcx40+DUEQU5RdcMFzuRIQ
 EE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746636204; x=1747241004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAqGiu2LUseqRIDDRrmCl771ZRfnWxX3nt+ElhtFaT0=;
 b=axipEsrNYzLafo6ySojt+MwkQ8EIFdo0iZN29O9Rqm7mRpj7I7N/y83K9YibzuZ5Do
 X9uSHjG38yyoFYoxSF7LCp+QUMxyCHMunWMnlVUMsdNDGKVspF7h/iQmtMkvMJzNIK4k
 MnqByUm/QCw/ReNyJRgfmJoNDzQJ546XaTrVh+WQyQzbz0/nJETxr0e1cdfNBN/+wERk
 JmfkOW+eo0HyzI4RzpcIp85N69g5KO8iy3Lq4+gbOHUZSj6jeym/T0b3oJ878gj0jvcD
 UCvagZcLOooQx3+3mwzcOe/0LMfqfjm47Vgiy18nuamZivgRg6IhoUQKJIB0J+NTPYxq
 XE1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/wjuz3Rv3L/tN6FVn867VZNIcnghAEMWeZCR7CyzzMnwKpXUA2gLoc9oLPaR6TxCQIyS3gtfu3W/a@lists.freedesktop.org,
 AJvYcCXnYw6ERAZ1k75UNZ9zcw1f1FrfSHKZVlDLr2vnJeHdmIRYlnCuXcHDXU90qgENUGeSSXCjfT3JKcw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGsLRKJQOnurTaytJ61+r4GScQinSn71RiOC0EGc8ldWZkzZCo
 +CckkzxPjecJND1OHaoaTogU0J97cVW5KTEeK5fXQrbizWWnmWwQdaaOMsOYpdcE7VHVBws2pk0
 UEEI2zY1SuJcWWe4TqIm66k9Wflw=
X-Gm-Gg: ASbGncur9ePeRjROPYqi0aJeSV4Wnl2FIqmmutS82u98AECqUwyJEOk3fFz+zGFwd0y
 /ywHyUU+OIHdEJkBcEf9bPc8085KE2SJEkZ/81g5Oss3P77rJHWKNvHTtn+CzXKYHghjQx0Z/Jy
 jHQ/qmIuxYDvKyhZVfwTL5g9XY7MD2Plu3RFZ0twFcRRu3uhmQhDbx
X-Google-Smtp-Source: AGHT+IG+VzgbCuwSpeEeu88K4dm4csb7shCW7OmtTncZJ7dCEfYism1vlRMw/YoaxQZ8HA81jNsKnJZ8r2bbrQrhc5M=
X-Received: by 2002:a05:6e02:1aae:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da738f0d85mr38356795ab.11.1746636204548; Wed, 07 May 2025
 09:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 May 2025 09:43:10 -0700
X-Gm-Features: ATxdqUEuMUPuOU2GnLpXWpKVqP1SfNDpJCTDk56Nr0a5tjEcmFOuiLqPR3zdRGk
Message-ID: <CAF6AEGtsnfxHYZyEsC+BSW0aWd1V4ZvM0c_wyTx20Vaeku4o6A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] drm/msm: enable separate binding of GPU and
 display devices
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

On Sat, May 3, 2025 at 12:17=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> There are cases when we want to have separate DRM devices for GPU and
> display pipelines.
> One example is development, when it is beneficial to be able to bind the
> GPU driver separately, without the display pipeline (and without the
> hacks adding "amd,imageon" to the compatible string).
> Another example is some of Qualcomm platforms, which have two MDSS
> units, but only one GPU. With current approach it is next to impossible
> to support this usecase properly, while separate binding allows users to
> have three DRM devices: two for MDSS units and a single headless GPU.
>
> Add kernel param msm.separate_gpu_drm, which if set to true forces
> creation of separate display and GPU DRM devices. Mesa supports this
> setup by using the kmsro wrapper.
>
> The param is disabled by default, in order to be able to test userspace
> for the compatibility issues. Simple clients are able to handle this
> setup automatically.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
>  drivers/gpu/drm/msm/msm_drv.c              | 49 ++++++++++++++++++++++++=
+++---
>  drivers/gpu/drm/msm/msm_drv.h              |  2 ++
>  3 files changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 325cb710ea08ac8e5c3d9c80c8d8e18e1946e994..2322a3301a5226c4e2590344e=
4744934addeea33 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -243,7 +243,8 @@ static const struct component_ops a3xx_ops =3D {
>
>  static int adreno_probe(struct platform_device *pdev)
>  {
> -       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
> +       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
> +           msm_gpu_no_components())
>                 return msm_gpu_probe(pdev, &a3xx_ops);
>
>         return component_add(&pdev->dev, &a3xx_ops);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 804b594ba1e7df9d9aec53a9be1451f1167fc77a..eec7501eb05b6c31ffd9dc5a7=
ba430e3284ea5ed 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -59,9 +59,18 @@ static bool modeset =3D true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (default=
), 0=3Ddisable)");
>  module_param(modeset, bool, 0600);
>
> +static bool separate_gpu_drm;
> +MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU =
(0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM devi=
ces)");
> +module_param(separate_gpu_drm, bool, 0400);
> +
>  DECLARE_FAULT_ATTR(fail_gem_alloc);
>  DECLARE_FAULT_ATTR(fail_gem_iova);
>
> +bool msm_gpu_no_components(void)
> +{
> +       return separate_gpu_drm;
> +}
> +
>  static int msm_drm_uninit(struct device *dev, const struct component_ops=
 *gpu_ops)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -898,6 +907,32 @@ static const struct drm_driver msm_driver =3D {
>         .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
>  };
>
> +static const struct drm_driver msm_kms_driver =3D {
> +       .driver_features    =3D DRIVER_GEM |
> +                               DRIVER_ATOMIC |
> +                               DRIVER_MODESET |
> +                               DRIVER_SYNCOBJ_TIMELINE |
> +                               DRIVER_SYNCOBJ,

I think, drop DRIVER_SYNCOBJ + DRIVER_SYNCOBJ_TIMELINE, since kms only
uses fence fd's.  (Syncobj support is only in the SUBMIT and upcoming
VM_BIND ioctls..  I don't think there is a use-case for being able to
create syncobjs for KMS only drivers, and it doesn't look like any of
the other kms-only drivers support this.)

Alternatively, we could use drm_device::driver_features to mask
certain drm_driver::driver_features at runtime.. that would be a way
to avoid having separate drm_driver tables.

BR,
-R

> +       .open               =3D msm_open,
> +       .postclose          =3D msm_postclose,
> +       .dumb_create        =3D msm_gem_dumb_create,
> +       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
> +       .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
> +#ifdef CONFIG_DEBUG_FS
> +       .debugfs_init       =3D msm_debugfs_init,
> +#endif
> +       MSM_FBDEV_DRIVER_OPS,
> +       .show_fdinfo        =3D msm_show_fdinfo,
> +       .ioctls             =3D msm_ioctls,
> +       .num_ioctls         =3D ARRAY_SIZE(msm_ioctls),
> +       .fops               =3D &fops,
> +       .name               =3D "msm-kms",
> +       .desc               =3D "MSM Snapdragon DRM",
> +       .major              =3D MSM_VERSION_MAJOR,
> +       .minor              =3D MSM_VERSION_MINOR,
> +       .patchlevel         =3D MSM_VERSION_PATCHLEVEL,
> +};
> +
>  static const struct drm_driver msm_gpu_driver =3D {
>         .driver_features    =3D DRIVER_GEM |
>                                 DRIVER_RENDER |
> @@ -1044,7 +1079,11 @@ static int add_gpu_components(struct device *dev,
>
>  static int msm_drm_bind(struct device *dev)
>  {
> -       return msm_drm_init(dev, &msm_driver, NULL);
> +       return msm_drm_init(dev,
> +                           msm_gpu_no_components() ?
> +                                   &msm_kms_driver :
> +                                   &msm_driver,
> +                           NULL);
>  }
>
>  static void msm_drm_unbind(struct device *dev)
> @@ -1080,9 +1119,11 @@ int msm_drv_probe(struct device *master_dev,
>                         return ret;
>         }
>
> -       ret =3D add_gpu_components(master_dev, &match);
> -       if (ret)
> -               return ret;
> +       if (!msm_gpu_no_components()) {
> +               ret =3D add_gpu_components(master_dev, &match);
> +               if (ret)
> +                       return ret;
> +       }
>
>         /* on all devices that I am aware of, iommu's which can map
>          * any address the cpu can see are used:
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552..1ff799f0c78133e73c6857e36=
92c2dca2c5e60fa 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -543,4 +543,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
>
>  bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>
> +bool msm_gpu_no_components(void);
> +
>  #endif /* __MSM_DRV_H__ */
>
> --
> 2.39.5
>
