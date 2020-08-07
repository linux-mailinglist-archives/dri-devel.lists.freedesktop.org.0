Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0BC23F37F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 22:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5216E192;
	Fri,  7 Aug 2020 20:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977AA6E154;
 Fri,  7 Aug 2020 20:03:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so2726430wrh.3;
 Fri, 07 Aug 2020 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSLWRy9ysyT4eibP6iMlQrzS7AS0P8deCWCZeNvVCDw=;
 b=cKuC0uosBz+Tin+kAwwFiT57a/t33eF5zdr86svo0PRBao/R9rftfkIlicbGB/6CfQ
 S4nfOQXRm7QbcyeEjObL4IOJvkpgekEuY1wHQomjGZu9fhQfYqghrxYjTyfu+hh5rIWB
 s1XhiMeNyq9zTiHXWTbTKy/1YRjfnuTn7h3Z4fGWrvt3Q+0rFf9e5BSO2QL5hV2vbp5p
 +blXEG1jfKgMoEI17LfReVX/qA8nv53xZ+ZkXxnvmeIRyGFemZ/gSUhc/xihJma7Kbfg
 SrkH3q01dBRUJ7xQrEaXjgbNWMoGkX61z2jDW5CvPhNAY2axJmS/ZiA5aoh4XYO4h2EJ
 j+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSLWRy9ysyT4eibP6iMlQrzS7AS0P8deCWCZeNvVCDw=;
 b=rUhS+XfdjXJDvsQYMi4Nu38fKwVnN7gdvYrCKzx88ANylWdnWXBmPszzuyOS9Z0BO1
 wgZBhWokiy6EGsI6SVwUs9djrCLUTVQI24LO8TFFzgDjxJ9/X22ssjuogJIfLZO1evgu
 zVGlHAP2ILqPNvQ+qYg+ttu7ZYz1Bme7SXvrDvBGx7vzJEMlbfppRxI/a8s20HBgGwIH
 420GY/cFa+ibYAiYKyP44OAvkRspsd6RrosSyRzg8YOHKFkNsMoAN+Tn8voktj2bMd+1
 IThhvINmttwOOfDNnItCPSKqGLpPeQ5MMUWxXch7oYhL9blmCW7ji+uqpL3vpwoLPv3W
 fr5g==
X-Gm-Message-State: AOAM533pfDw2zIPZwZmAPOzxn8agU78lwKEin9ibbeqQMCRHYW4+5YQ/
 lLiyRjxC6o/X+ukAYU44f1ek1mSXq2NlT1Hn9FE=
X-Google-Smtp-Source: ABdhPJxMIcDcXDI1jEIi/2CWQ0HC/RAkG26jBGU/hI2e7LmI9IXbWAVf1mVql7wNxwQh+Fcvv0OGDkHMT6/AryEFd7Q=
X-Received: by 2002:adf:ec04:: with SMTP id x4mr12769567wrn.28.1596830590085; 
 Fri, 07 Aug 2020 13:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200803193547.305660-1-jcrouse@codeaurora.org>
 <20200803193547.305660-11-jcrouse@codeaurora.org>
In-Reply-To: <20200803193547.305660-11-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Aug 2020 13:03:54 -0700
Message-ID: <CAF6AEGv53rt=33TjQ5mim3hhQvsQugv+u61r68=FTctdmoXw0w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v11 10/12] drm/msm: Add support for private
 address space instances
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 12:36 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add support for allocating private address space instances. Targets that
> support per-context pagetables should implement their own function to
> allocate private address spaces.
>
> The default will return a pointer to the global address space.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/msm_drv.c     | 13 +++++++------
>  drivers/gpu/drm/msm/msm_drv.h     |  5 +++++
>  drivers/gpu/drm/msm/msm_gem_vma.c |  9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.c     | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h     |  5 +++++
>  5 files changed, 43 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 108b663c3ef2..f072306f1260 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>         kref_init(&ctx->ref);
>         msm_submitqueue_init(dev, ctx);
>
> -       ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
> +       ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
>         file->driver_priv = ctx;
>
>         return 0;
> @@ -780,18 +780,19 @@ static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
>  }
>
>  static int msm_ioctl_gem_info_iova(struct drm_device *dev,
> -               struct drm_gem_object *obj, uint64_t *iova)
> +               struct drm_file *file, struct drm_gem_object *obj,
> +               uint64_t *iova)
>  {
> -       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_file_private *ctx = file->driver_priv;
>
> -       if (!priv->gpu)
> +       if (!ctx->aspace)
>                 return -EINVAL;
>
>         /*
>          * Don't pin the memory here - just get an address so that userspace can
>          * be productive
>          */
> -       return msm_gem_get_iova(obj, priv->gpu->aspace, iova);
> +       return msm_gem_get_iova(obj, ctx->aspace, iova);
>  }
>
>  static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
> @@ -830,7 +831,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 args->value = msm_gem_mmap_offset(obj);
>                 break;
>         case MSM_INFO_GET_IOVA:
> -               ret = msm_ioctl_gem_info_iova(dev, obj, &args->value);
> +               ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
>                 break;
>         case MSM_INFO_SET_NAME:
>                 /* length check should leave room for terminating null: */
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index f69c6d62584d..51a5c9083e13 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -249,6 +249,10 @@ int msm_gem_map_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma);
>
> +
> +struct msm_gem_address_space *
> +msm_gem_address_space_get(struct msm_gem_address_space *aspace);
> +
>  void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
>
>  struct msm_gem_address_space *
> @@ -434,6 +438,7 @@ static inline void msm_file_private_destroy(struct kref *kref)
>         struct msm_file_private *ctx = container_of(kref,
>                 struct msm_file_private, ref);
>
> +       msm_gem_address_space_put(ctx->aspace);
>         kfree(ctx);
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 5f6a11211b64..29cc1305cf37 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -27,6 +27,15 @@ void msm_gem_address_space_put(struct msm_gem_address_space *aspace)
>                 kref_put(&aspace->kref, msm_gem_address_space_destroy);
>  }
>
> +struct msm_gem_address_space *
> +msm_gem_address_space_get(struct msm_gem_address_space *aspace)
> +{
> +       if (!IS_ERR_OR_NULL(aspace))
> +               kref_get(&aspace->kref);
> +
> +       return aspace;
> +}
> +
>  /* Actually unmap memory for the vma */
>  void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
>                 struct msm_gem_vma *vma)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a1f3da6550e5..aabbd7908ee5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -823,6 +823,23 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>         return 0;
>  }
>
> +/* Return a new address space for a msm_drm_private instance */
> +struct msm_gem_address_space *
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu)
> +{
> +       if (!gpu)
> +               return NULL;
> +
> +       /*
> +        * If the target doesn't support private address spaces then return
> +        * the global one
> +        */
> +       if (!gpu->funcs->create_private_address_space)
> +               return msm_gem_address_space_get(gpu->aspace);
> +
> +       return gpu->funcs->create_private_address_space(gpu);

so if you flip the logic around here, you can get rid of the
msm_gem_address_space_get() in per-gen backend and consolidate the
error handling here, ie.

  struct msm_gem_address_space *aspace = NULL;

  if (gpu->funcs->create_private_address_space)
     aspace = gpu->funcs->create_private_address_space(...);

  if (IS_ERR_OR_NULL(aspace))
    aspace = msm_gem_address_space_get(...);

(and that also simplifies a bit the patch I have on top to show comm in debugfs)

BR,
-R

> +}
> +
>  int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>                 struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>                 const char *name, struct msm_gpu_config *config)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d496d488222c..d298657b4730 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -64,6 +64,8 @@ struct msm_gpu_funcs {
>         void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
>         struct msm_gem_address_space *(*create_address_space)
>                 (struct msm_gpu *gpu, struct platform_device *pdev);
> +       struct msm_gem_address_space *(*create_private_address_space)
> +               (struct msm_gpu *gpu);
>  };
>
>  struct msm_gpu {
> @@ -286,6 +288,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>                 struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>                 const char *name, struct msm_gpu_config *config);
>
> +struct msm_gem_address_space *
> +msm_gpu_create_private_address_space(struct msm_gpu *gpu);
> +
>  void msm_gpu_cleanup(struct msm_gpu *gpu);
>
>  struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
> --
> 2.25.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
