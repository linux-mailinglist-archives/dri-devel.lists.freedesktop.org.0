Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D229EAAE711
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676F610E862;
	Wed,  7 May 2025 16:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hRRZu3kZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B864110E861;
 Wed,  7 May 2025 16:45:38 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d8fc9dbce4so4801375ab.0; 
 Wed, 07 May 2025 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746636338; x=1747241138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+uO55QV874bslR3uKUc/NUMOOzrZeuSZoOLRkFfEjw=;
 b=hRRZu3kZC0sBpdU8bbQB3QFABNc8WjVI+9TnNkmQF/xodoVHhasfXybx0aY8zmMR7o
 ZZYnGvePBYnBDbJ6j3F/rCiA/KrAxyrbl90Jhw5DrOv8bOTrWRttNoHvMRlmAScDEnjY
 u11qe3quy4pOrWtGOVNMKQUHWWfZakqbfhnB1m0RQmrim5XhvfkBlmUbybD+r/cgnpsb
 abufjmc472X5NCr9uD+bSRWQhYbvoaScWo1DtDXqjqpubC6DNzb4RoWLA3rKwC25/RsQ
 xFY3v+/NiWOmnE84aKmJJ08TzP+aPalz8V+zU5qOwEo8uoptwuetLevLqc+WY0X+WdYJ
 0YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746636338; x=1747241138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+uO55QV874bslR3uKUc/NUMOOzrZeuSZoOLRkFfEjw=;
 b=pWnbjZY3NjBpy5Vziz9YPoznSuVJpWoK+97zHYZmanLLCTW28nVKujgGsRH8Nvj00Y
 qpveS4TiMWAxtCmDqOVqysFJbRQdiwuazxWk5Hg439LAKicJ7DF0M0SsOEgRuoCqvxkL
 9VMjGDeCO7t2UHjco6tl90xX/zzoiDPCTLThwXX3SoNOQXfLGJAc+OoTpkJ4IIrX2Mnl
 HoBRHpGdfNSW4Ddcw3zAgYEEPPgDuPpy7gBmGC/sF5mSWR0j/fFlfyZZ/jS76rbSFxwN
 Ifs+6IluFBox41xET9PEiSYkFij9NGftVDkgNe9CP+YFuWZskoGvITKE4w3UIVpsiZmv
 JsZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIHkb3AYWXevAIUKNxKs/szEHzLaLKuVSrJbGjwdHJVN4etO9hNbI1SfvGxrU0l3wiW11MNGC3xbp9@lists.freedesktop.org,
 AJvYcCXivcaUK/njTdWdNybzD8R+nUDFzlZTflsGjHvTCyG4Z+OsdgGMCGOxk5gRyWkMGRpxRRR4EU3/7LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5mKOWeUChN06/4Esuzt+Bly4Qu7qI1FrXoQHcUBl72LwN7HOh
 PhtAoNMnEXsAXARlIsFQWKIzDUXELl6E0IGVo1DbAx+3U6Wl3A66iHSJ4sfiHfUEzgNaiKtVMJu
 0bKBIDShnmxF9TVaHH3L3BV7g5kM=
X-Gm-Gg: ASbGnctVDPVgaoqTIlXMCRnX72DhOskg12T+denUa4HDaVZI9TKPxE8DaGnbOktIzh7
 yN4tyHPvCNdUoCQqmb/h03HkfFlHKiPjDGJuxaoZqY3+n4s1eh5XsKdibmOTFP8ijDSwx1fPCYQ
 WbSubXjP1/yHi+YlIJ5UDkQeyDS26DVqfwEKSv4W3a+bZzkhSRWMzR
X-Google-Smtp-Source: AGHT+IHMONMTkdL17JbNOCIwwAkTgENdTz7jXac/+uJmQ7u+QT14KRhy5H9/vK+tcZazXGNCHt6C0by6dxl50paeqTQ=
X-Received: by 2002:a05:6e02:1886:b0:3d4:2ea4:6b87 with SMTP id
 e9e14a558f8ab-3da785741a7mr3010355ab.11.1746636337808; Wed, 07 May 2025
 09:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 May 2025 09:45:26 -0700
X-Gm-Features: ATxdqUEHEy94pinpmM5MZoNzyERVa2Isx1jikPa1Yb2BSeMeT2DpW3cD954DUJg
Message-ID: <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
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
> Some of the platforms don't have onboard GPU or don't provide support
> for the GPU in the drm/msm driver. Make it possible to disable the GPU
> part of the driver and build the KMS-only part.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig           |  20 +++--
>  drivers/gpu/drm/msm/Makefile          |  14 ++--
>  drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------=
------
>  drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
>  drivers/gpu/drm/msm/msm_drv.h         |   3 +
>  drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
>  drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
>  7 files changed, 191 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8c=
a9da44c68250620 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -15,29 +15,37 @@ config DRM_MSM
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> -       select DRM_EXEC
> -       select DRM_SCHED
>         select SHMEM
>         select TMPFS
>         select QCOM_SCM
>         select WANT_DEV_COREDUMP
>         select SND_SOC_HDMI_CODEC if SND_SOC
> -       select SYNC_FILE

fwiw, atomic depends on SYNC_FILE... otoh it is selected at the
toplevel by CONFIG_DRM

BR,
-R

>         select PM_OPP
> -       select NVMEM
>         select PM_GENERIC_DOMAINS
>         select TRACE_GPU_MEM
>         help
>           DRM/KMS driver for MSM/snapdragon.
>
> +config DRM_MSM_ADRENO
> +       bool "Qualcomm Adreno GPU support"
> +       default y
> +       depends on DRM_MSM
> +       select DRM_EXEC
> +       select DRM_SCHED
> +       select NVMEM
> +       select SYNC_FILE
> +       help
> +         Enable support for the GPU present on most of Qualcomm Snapdrag=
on
> +         SoCs. If you are unsure, say Y.
> +
>  config DRM_MSM_GPU_STATE
>         bool
> -       depends on DRM_MSM && (DEBUG_FS || DEV_COREDUMP)
> +       depends on DRM_MSM_ADRENO && (DEBUG_FS || DEV_COREDUMP)
>         default y
>
>  config DRM_MSM_GPU_SUDO
>         bool "Enable SUDO flag on submits"
> -       depends on DRM_MSM && EXPERT
> +       depends on DRM_MSM_ADRENO && EXPERT
>         default n
>         help
>           Enable userspace that has CAP_SYS_RAWIO to submit GPU commands
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 7c4508f0e5c84914633f8f2d5ddd04bd10e4d189..6a24f78d7fc51cc1c9cd706d7=
46cabd5f567d282 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -109,21 +109,23 @@ msm-display-$(CONFIG_DRM_MSM_KMS) +=3D \
>  msm-y +=3D \
>         msm_debugfs.o \
>         msm_drv.o \
> -       msm_fence.o \
>         msm_gem.o \
>         msm_gem_prime.o \
>         msm_gem_shrinker.o \
> -       msm_gem_submit.o \
>         msm_gem_vma.o \
> -       msm_gpu.o \
> -       msm_gpu_devfreq.o \
>         msm_io_utils.o \
>         msm_iommu.o \
> +       msm_gpu_tracepoints.o \
> +
> +msm-$(CONFIG_DRM_MSM_ADRENO) +=3D \
> +       msm_fence.o \
> +       msm_gem_submit.o \
> +       msm_gpu.o \
> +       msm_gpu_devfreq.o \
>         msm_perf.o \
>         msm_rd.o \
>         msm_ringbuffer.o \
>         msm_submitqueue.o \
> -       msm_gpu_tracepoints.o \
>
>  msm-$(CONFIG_DRM_MSM_KMS) +=3D \
>         msm_atomic.o \
> @@ -159,7 +161,7 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/p=
hy/dsi_phy_14nm.o
>  msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/phy/dsi_phy_10nm.o
>  msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) +=3D dsi/phy/dsi_phy_7nm.o
>
> -msm-y +=3D $(adreno-y)
> +msm-$(CONFIG_DRM_MSM_ADRENO) +=3D $(adreno-y)
>  msm-$(CONFIG_DRM_MSM_KMS) +=3D $(msm-display-y)
>
>  obj-$(CONFIG_DRM_MSM)  +=3D msm.o
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_=
debugfs.c
> index 6e60a74b13d72c47e45cb9dc65ed67b977e900fa..fa9a94a86d060e28d4ee93fda=
1f22924fd5af606 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -20,6 +20,7 @@
>  #include "msm_debugfs.h"
>  #include "disp/msm_disp_snapshot.h"
>
> +#ifdef CONFIG_DRM_MSM_ADRENO
>  /*
>   * GPU Snapshot:
>   */
> @@ -117,6 +118,76 @@ static const struct file_operations msm_gpu_fops =3D=
 {
>         .release =3D msm_gpu_release,
>  };
>
> +static void msm_debugfs_gpu_init(struct drm_minor *minor)
> +{
> +       struct drm_device *dev =3D minor->dev;
> +       struct msm_drm_private *priv =3D dev->dev_private;
> +       struct dentry *gpu_devfreq;
> +
> +       debugfs_create_file("gpu", 0400, minor->debugfs_root,
> +                           dev, &msm_gpu_fops);
> +
> +       debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_ro=
ot,
> +                          &priv->hangcheck_period);
> +
> +       debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
> +                           &priv->disable_err_irq);
> +
> +       gpu_devfreq =3D debugfs_create_dir("devfreq", minor->debugfs_root=
);
> +
> +       debugfs_create_bool("idle_clamp", 0600, gpu_devfreq,
> +                           &priv->gpu_clamp_to_idle);
> +
> +       debugfs_create_u32("upthreshold", 0600, gpu_devfreq,
> +                          &priv->gpu_devfreq_config.upthreshold);
> +
> +       debugfs_create_u32("downdifferential", 0600, gpu_devfreq,
> +                          &priv->gpu_devfreq_config.downdifferential);
> +}
> +
> +static int late_init_minor(struct drm_minor *minor)
> +{
> +       struct drm_device *dev =3D minor->dev;
> +       struct msm_drm_private *priv =3D dev->dev_private;
> +       int ret;
> +
> +       if (!minor)
> +               return 0;
> +
> +       if (!priv->gpu_pdev)
> +               return 0;
> +
> +       ret =3D msm_rd_debugfs_init(minor);
> +       if (ret) {
> +               DRM_DEV_ERROR(minor->dev->dev, "could not install rd debu=
gfs\n");
> +               return ret;
> +       }
> +
> +       ret =3D msm_perf_debugfs_init(minor);
> +       if (ret) {
> +               DRM_DEV_ERROR(minor->dev->dev, "could not install perf de=
bugfs\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +int msm_debugfs_late_init(struct drm_device *dev)
> +{
> +       int ret;
> +
> +       ret =3D late_init_minor(dev->primary);
> +       if (ret)
> +               return ret;
> +       ret =3D late_init_minor(dev->render);
> +       return ret;
> +}
> +#else /* ! CONFIG_DRM_MSM_ADRENO */
> +static void msm_debugfs_gpu_init(struct drm_minor *minor)
> +{
> +}
> +#endif /* CONFIG_DRM_MSM_ADRENO */
> +
>  #ifdef CONFIG_DRM_MSM_KMS
>  static int msm_fb_show(struct seq_file *m, void *arg)
>  {
> @@ -294,70 +365,6 @@ static struct drm_info_list msm_debugfs_list[] =3D {
>                 { "mm", msm_mm_show },
>  };
>
> -static int late_init_minor(struct drm_minor *minor)
> -{
> -       struct drm_device *dev =3D minor->dev;
> -       struct msm_drm_private *priv =3D dev->dev_private;
> -       int ret;
> -
> -       if (!minor)
> -               return 0;
> -
> -       if (!priv->gpu_pdev)
> -               return 0;
> -
> -       ret =3D msm_rd_debugfs_init(minor);
> -       if (ret) {
> -               DRM_DEV_ERROR(minor->dev->dev, "could not install rd debu=
gfs\n");
> -               return ret;
> -       }
> -
> -       ret =3D msm_perf_debugfs_init(minor);
> -       if (ret) {
> -               DRM_DEV_ERROR(minor->dev->dev, "could not install perf de=
bugfs\n");
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
> -int msm_debugfs_late_init(struct drm_device *dev)
> -{
> -       int ret;
> -       ret =3D late_init_minor(dev->primary);
> -       if (ret)
> -               return ret;
> -       ret =3D late_init_minor(dev->render);
> -       return ret;
> -}
> -
> -static void msm_debugfs_gpu_init(struct drm_minor *minor)
> -{
> -       struct drm_device *dev =3D minor->dev;
> -       struct msm_drm_private *priv =3D dev->dev_private;
> -       struct dentry *gpu_devfreq;
> -
> -       debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
> -               dev, &msm_gpu_fops);
> -
> -       debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_ro=
ot,
> -               &priv->hangcheck_period);
> -
> -       debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
> -               &priv->disable_err_irq);
> -
> -       gpu_devfreq =3D debugfs_create_dir("devfreq", minor->debugfs_root=
);
> -
> -       debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
> -                           &priv->gpu_clamp_to_idle);
> -
> -       debugfs_create_u32("upthreshold",0600, gpu_devfreq,
> -                          &priv->gpu_devfreq_config.upthreshold);
> -
> -       debugfs_create_u32("downdifferential",0600, gpu_devfreq,
> -                          &priv->gpu_devfreq_config.downdifferential);
> -}
> -
>  void msm_debugfs_init(struct drm_minor *minor)
>  {
>         struct drm_device *dev =3D minor->dev;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index eec7501eb05b6c31ffd9dc5a7ba430e3284ea5ed..f12549ebfc83fe35de12b48c3=
0a3da3f7035dc96 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -59,7 +59,11 @@ static bool modeset =3D true;
>  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (default=
), 0=3Ddisable)");
>  module_param(modeset, bool, 0600);
>
> +#ifndef CONFIG_DRM_MSM_ADRENO
> +static bool separate_gpu_drm =3D true;
> +#else
>  static bool separate_gpu_drm;
> +#endif
>  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU =
(0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM devi=
ces)");
>  module_param(separate_gpu_drm, bool, 0400);
>
> @@ -320,6 +324,22 @@ static void load_gpu(struct drm_device *dev)
>         mutex_unlock(&init_lock);
>  }
>
> +void __msm_file_private_destroy(struct kref *kref)
> +{
> +       struct msm_file_private *ctx =3D container_of(kref,
> +               struct msm_file_private, ref);
> +
> +       msm_submitqueue_fini(ctx);
> +       msm_gem_address_space_put(ctx->aspace);
> +
> +#ifdef CONFIG_DRM_MSM_ADRENO
> +       kfree(ctx->comm);
> +       kfree(ctx->cmdline);
> +#endif
> +
> +       kfree(ctx);
> +}
> +
>  static int context_init(struct drm_device *dev, struct drm_file *file)
>  {
>         static atomic_t ident =3D ATOMIC_INIT(0);
> @@ -330,9 +350,6 @@ static int context_init(struct drm_device *dev, struc=
t drm_file *file)
>         if (!ctx)
>                 return -ENOMEM;
>
> -       INIT_LIST_HEAD(&ctx->submitqueues);
> -       rwlock_init(&ctx->queuelock);
> -
>         kref_init(&ctx->ref);
>         msm_submitqueue_init(dev, ctx);
>
> @@ -717,6 +734,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev,=
 void *data,
>         return ret;
>  }
>
> +#ifdef CONFIG_DRM_MSM_ADRENO
>  static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_=
id,
>                       ktime_t timeout, uint32_t flags)
>  {
> @@ -787,6 +805,7 @@ static int msm_ioctl_wait_fence(struct drm_device *de=
v, void *data,
>
>         return ret;
>  }
> +#endif
>
>  static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
>                 struct drm_file *file)
> @@ -820,6 +839,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *d=
ev, void *data,
>  }
>
>
> +#ifdef CONFIG_DRM_MSM_ADRENO
>  static int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data,
>                 struct drm_file *file)
>  {
> @@ -845,6 +865,7 @@ static int msm_ioctl_submitqueue_close(struct drm_dev=
ice *dev, void *data,
>
>         return msm_submitqueue_remove(file->driver_priv, id);
>  }
> +#endif
>
>  static const struct drm_ioctl_desc msm_ioctls[] =3D {
>         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_R=
ENDER_ALLOW),
> @@ -853,12 +874,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D=
 {
>         DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_R=
ENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_R=
ENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_R=
ENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_R=
ENDER_ALLOW),
> +#ifdef CONFIG_DRM_MSM_ADRENO
>         DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_R=
ENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_R=
ENDER_ALLOW),
> -       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_R=
ENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_ne=
w,   DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_cl=
ose, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_qu=
ery, DRM_RENDER_ALLOW),
> +#endif
>  };
>
>  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file=
)
> @@ -866,10 +889,8 @@ static void msm_show_fdinfo(struct drm_printer *p, s=
truct drm_file *file)
>         struct drm_device *dev =3D file->minor->dev;
>         struct msm_drm_private *priv =3D dev->dev_private;
>
> -       if (!priv->gpu)
> -               return;
> -
> -       msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
> +       if (priv->gpu)
> +               msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
>
>         drm_show_memory_stats(p, file);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index 1ff799f0c78133e73c6857e3692c2dca2c5e60fa..ba4012ea2f6845061380ae2da=
a8eb3a0999f2e9e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -424,6 +424,9 @@ static inline void msm_mdss_unregister(void) {}
>
>  #ifdef CONFIG_DEBUG_FS
>  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_fil=
e *m);
> +#endif
> +
> +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_ADRENO)
>  int msm_debugfs_late_init(struct drm_device *dev);
>  int msm_rd_debugfs_init(struct drm_minor *minor);
>  void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index e25009150579c08f7b98d4461a75757d1093734a..6db6ef6b02db2450be68cc27e=
65be9aced6da7ce 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -358,12 +358,13 @@ struct msm_gpu_perfcntr {
>   * @seqno:        unique per process seqno
>   */
>  struct msm_file_private {
> -       rwlock_t queuelock;
> -       struct list_head submitqueues;
> -       int queueid;
>         struct msm_gem_address_space *aspace;
>         struct kref ref;
>         int seqno;
> +#ifdef CONFIG_DRM_MSM_ADRENO
> +       rwlock_t queuelock;
> +       struct list_head submitqueues;
> +       int queueid;
>
>         /**
>          * sysprof:
> @@ -425,6 +426,7 @@ struct msm_file_private {
>          * level.
>          */
>         struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_M=
AX_RINGS];
> +#endif
>
>         /**
>          * ctx_mem:
> @@ -559,6 +561,7 @@ struct msm_gpu_state {
>         struct msm_gpu_state_bo *bos;
>  };
>
> +#ifdef CONFIG_DRM_MSM_ADRENO
>  static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
>  {
>         writel(data, gpu->mmio + (reg << 2));
> @@ -612,6 +615,7 @@ void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct =
msm_file_private *ctx,
>                          struct drm_printer *p);
>
>  int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private=
 *ctx);
> +void msm_submitqueue_fini(struct msm_file_private *ctx);
>  struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private =
*ctx,
>                 u32 id);
>  int msm_submitqueue_create(struct drm_device *drm,
> @@ -624,8 +628,42 @@ void msm_submitqueue_close(struct msm_file_private *=
ctx);
>
>  void msm_submitqueue_destroy(struct kref *kref);
>
> +static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue=
)
> +{
> +       if (queue)
> +               kref_put(&queue->ref, msm_submitqueue_destroy);
> +}
> +
>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>                                  struct msm_gpu *gpu, int sysprof);
> +#else
> +static inline void msm_gpu_show_fdinfo(struct msm_gpu *gpu,
> +                                      struct msm_file_private *ctx,
> +                                      struct drm_printer *p)
> +{
> +}
> +
> +static inline int msm_submitqueue_init(struct drm_device *drm, struct ms=
m_file_private *ctx)
> +{
> +       return -ENXIO;
> +}
> +
> +static inline void msm_submitqueue_fini(struct msm_file_private *ctx)
> +{
> +}
> +
> +static inline void msm_submitqueue_close(struct msm_file_private *ctx)
> +{
> +}
> +
> +static inline int msm_file_private_set_sysprof(struct msm_file_private *=
ctx,
> +                                              struct msm_gpu *gpu,
> +                                              int sysprof)
> +{
> +       return 0;
> +}
> +#endif
> +
>  void __msm_file_private_destroy(struct kref *kref);
>
>  static inline void msm_file_private_put(struct msm_file_private *ctx)
> @@ -640,6 +678,7 @@ static inline struct msm_file_private *msm_file_priva=
te_get(
>         return ctx;
>  }
>
> +#ifdef CONFIG_DRM_MSM_ADRENO
>  void msm_devfreq_init(struct msm_gpu *gpu);
>  void msm_devfreq_cleanup(struct msm_gpu *gpu);
>  void msm_devfreq_resume(struct msm_gpu *gpu);
> @@ -671,12 +710,6 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *d=
ev);
>  void __init adreno_register(void);
>  void __exit adreno_unregister(void);
>
> -static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue=
)
> -{
> -       if (queue)
> -               kref_put(&queue->ref, msm_submitqueue_destroy);
> -}
> -
>  static inline struct msm_gpu_state *msm_gpu_crashstate_get(struct msm_gp=
u *gpu)
>  {
>         struct msm_gpu_state *state =3D NULL;
> @@ -712,5 +745,25 @@ static inline void msm_gpu_crashstate_put(struct msm=
_gpu *gpu)
>  #define check_apriv(gpu, flags) \
>         (((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
>
> +#else /* ! CONFIG_DRM_MSM_ADRENO */
> +static inline struct msm_gem_address_space *
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_st=
ruct *task)
> +{
> +       return NULL;
> +}
> +
> +static inline struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
> +{
> +       return NULL;
> +}
> +
> +static inline void __init adreno_register(void)
> +{
> +}
> +
> +static inline void __exit adreno_unregister(void)
> +{
> +}
> +#endif /* ! CONFIG_DRM_MSM_ADRENO */
>
>  #endif /* __MSM_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/=
msm_submitqueue.c
> index 7fed1de63b5d9e20df88db8d9ca6ea45ec1a2846..dfb6f42a963ee3d314f11716d=
8649f3bf82a3eb6 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -46,10 +46,8 @@ int msm_file_private_set_sysprof(struct msm_file_priva=
te *ctx,
>         return 0;
>  }
>
> -void __msm_file_private_destroy(struct kref *kref)
> +void msm_submitqueue_fini(struct msm_file_private *ctx)
>  {
> -       struct msm_file_private *ctx =3D container_of(kref,
> -               struct msm_file_private, ref);
>         int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(ctx->entities); i++) {
> @@ -59,11 +57,6 @@ void __msm_file_private_destroy(struct kref *kref)
>                 drm_sched_entity_destroy(ctx->entities[i]);
>                 kfree(ctx->entities[i]);
>         }
> -
> -       msm_gem_address_space_put(ctx->aspace);
> -       kfree(ctx->comm);
> -       kfree(ctx->cmdline);
> -       kfree(ctx);
>  }
>
>  void msm_submitqueue_destroy(struct kref *kref)
> @@ -226,6 +219,9 @@ int msm_submitqueue_init(struct drm_device *drm, stru=
ct msm_file_private *ctx)
>         struct msm_drm_private *priv =3D drm->dev_private;
>         int default_prio, max_priority;
>
> +       INIT_LIST_HEAD(&ctx->submitqueues);
> +       rwlock_init(&ctx->queuelock);
> +
>         if (!priv->gpu)
>                 return -ENODEV;
>
>
> --
> 2.39.5
>
