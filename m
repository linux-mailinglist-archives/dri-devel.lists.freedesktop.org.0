Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FD617173
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1668910E533;
	Wed,  2 Nov 2022 23:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D78810E095;
 Wed,  2 Nov 2022 23:10:44 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso87293otq.11; 
 Wed, 02 Nov 2022 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NOncMiS9A3RMWI4Y+kkqX5A0U4j9jibTTA2TcJiv65c=;
 b=K1J7h4kOsvTI0XZqdd9KdfNxd8yDQGj7WTjtRsp4NkeHxD432DZhu7n9O+4+sxOCEI
 RHjF2VR9BJZOi3qXg3L+3lA2PTVbmswiAoucH38ZJ7sErUCK6HEiDmqdUFegmfY0lBEn
 UVtnfap6H+pn+qFFZ9kBiwBosVT7WEaeWFowQH+2lAc23QMeVZA00DYiGt4SyZBWeFrF
 wf9DhP2C6d3YeIQ2UBU6sWRzfitBm3oQt5KSaSild8S4ee3jXSoVCiiUKHA7HSC64wlM
 tiuqZYGEEa2A8ifZT3XkzHSUUm6JFquBNhCW2yXbj+RM7mXTNfuCCtqCSZL8WgmfASVD
 XLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOncMiS9A3RMWI4Y+kkqX5A0U4j9jibTTA2TcJiv65c=;
 b=CpRv+pFrhKQsgq1GC075YCXFXKyz9q8ZomzxitRmizYg7M7gAbcl20g4DCgpJFNqGu
 eD5JPU6YIKW6xoNIGHoOolEJ90K/AM8oR2RJBsqIbdX0lKJhu9Z7k+NJbUIalY+fwv+5
 TDQNkB93NrT5vfsxt4y+QhgI3M6sl9d+5jm76hti9eYIv7U56unTsb+tICIZgTgYvGgl
 /XpMpI6OOe5cBpkCYjDJB64JDq+g1TI4azOqTKRkac5PmMcLab4owi9gimc+Acsmcx0y
 Fl0i/urcsBlr0xEWTsBCADq+l6HVBCMYhO5d1nXSuq0f2kaqTtjJIf8teH/mBVa7KxYa
 S9ng==
X-Gm-Message-State: ACrzQf1msS0nP/WeXzeli5BNoEccWZiBDaQjE+Q9/DBCKaD4xSlTafYr
 KW4hS5+CpKRFnazhg3x0alnXqL6XYq9GaUcQ2mo=
X-Google-Smtp-Source: AMsMyM7aAdGyrEVMAQJIv2QAvYrik0rpkB3tkTqmNr2RDY3d7+4gaTsHPcLASIg4LbCPwXB1FPdl/tE89CUOMGnbhao=
X-Received: by 2002:a9d:20ea:0:b0:66b:234a:290a with SMTP id
 x97-20020a9d20ea000000b0066b234a290amr13448405ota.328.1667430643060; Wed, 02
 Nov 2022 16:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
 <20221102175449.452283-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102175449.452283-3-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Nov 2022 16:10:59 -0700
Message-ID: <CAF6AEGtKcreHkT0=ccHbFY=-cLhoMCzXQe3HYKCf31QhgESS-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm: remove duplicated code from
 a6xx_create_address_space
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 10:54 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The function a6xx_create_address_space() is mostly a copy of
> adreno_iommu_create_address_space() with added quirk setting. Rework
> these two functions to be a thin wrappers around a common helper.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 28 +------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 +++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  7 ++++++-
>  6 files changed, 20 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 2c8b9899625b..948785ed07bb 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -500,7 +500,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>                 .gpu_state_get = a3xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = adreno_create_address_space,
>                 .get_rptr = a3xx_get_rptr,
>         },
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 7cb8d9849c07..2fb32d5552c4 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -635,7 +635,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>                 .gpu_state_get = a4xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = adreno_create_address_space,
>                 .get_rptr = a4xx_get_rptr,
>         },
>         .get_timestamp = a4xx_get_timestamp,
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 3dcec7acb384..3c537c0016fa 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1705,7 +1705,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .gpu_busy = a5xx_gpu_busy,
>                 .gpu_state_get = a5xx_gpu_state_get,
>                 .gpu_state_put = a5xx_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = adreno_create_address_space,
>                 .get_rptr = a5xx_get_rptr,
>         },
>         .get_timestamp = a5xx_get_timestamp,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index db4b3a48c708..e87196457b9a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1786,10 +1786,6 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct iommu_domain_geometry *geometry;
> -       struct msm_mmu *mmu;
> -       struct msm_gem_address_space *aspace;
> -       u64 start, size;
>         unsigned long quirks = 0;
>
>         /*
> @@ -1799,29 +1795,7 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>         if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
>                 quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>
> -       mmu = msm_iommu_new(&pdev->dev, quirks);
> -       if (IS_ERR_OR_NULL(mmu))
> -               return ERR_CAST(mmu);
> -
> -       geometry = msm_iommu_get_geometry(mmu);
> -       if (IS_ERR(geometry))
> -               return ERR_CAST(geometry);
> -
> -       /*
> -        * Use the aperture start or SZ_16M, whichever is greater. This will
> -        * ensure that we align with the allocated pagetable range while still
> -        * allowing room in the lower 32 bits for GMEM and whatnot
> -        */
> -       start = max_t(u64, SZ_16M, geometry->aperture_start);
> -       size = geometry->aperture_end - start + 1;
> -
> -       aspace = msm_gem_address_space_create(mmu, "gpu",
> -               start & GENMASK_ULL(48, 0), size);
> -
> -       if (IS_ERR(aspace) && !IS_ERR(mmu))
> -               mmu->funcs->destroy(mmu);
> -
> -       return aspace;
> +       return adreno_iommu_create_address_space(gpu, pdev, quirks);
>  }
>
>  static struct msm_gem_address_space *
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 12d0497f57e1..12a964dc3b8d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,16 +191,24 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> +struct msm_gem_address_space *
> +adreno_create_address_space(struct msm_gpu *gpu,
> +                           struct platform_device *pdev)
> +{
> +       return adreno_iommu_create_address_space(gpu, pdev, 0);
> +}
> +
>  struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
> -               struct platform_device *pdev)
> +                                 struct platform_device *pdev,
> +                                 unsigned long quirks)
>  {
>         struct iommu_domain_geometry *geometry;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
>         u64 start, size;
>
> -       mmu = msm_iommu_new(&pdev->dev, 0);
> +       mmu = msm_iommu_new(&pdev->dev, quirks);
>         if (IS_ERR_OR_NULL(mmu))
>                 return ERR_CAST(mmu);
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 707273339969..5d4b1c95033f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -335,8 +335,13 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>   * attached targets
>   */
>  struct msm_gem_address_space *
> +adreno_create_address_space(struct msm_gpu *gpu,
> +                           struct platform_device *pdev);
> +
> +struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
> -               struct platform_device *pdev);
> +                                 struct platform_device *pdev,
> +                                 unsigned long quirks);
>
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
> --
> 2.35.1
>
