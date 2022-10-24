Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EBD60B0F3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C6410E33B;
	Mon, 24 Oct 2022 16:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1E810E233;
 Mon, 24 Oct 2022 16:12:49 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so1701477fac.7; 
 Mon, 24 Oct 2022 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xeOhGRDgXDrLUtCw3GwUFAr/RTS5Lk92rkS+JxJfeEU=;
 b=XH04cOzdUK34weaVsyiw9zis6Gwdq9x/PfNnh18loM4pQ3aQalm4yiTb6XOKtuG4o0
 nrpOJ10hr/kNN/lTRewGGXEcTal1AFpiZyCHrAbX7hqMHuRXLRdwZpzkKj1cpS1M78Kh
 drkd4DuX4nBK93DVdvmeZ6vQb1CA3jwgzeZCVK6W65nwQ7OP25by0KVSbENSySvmW8oN
 vZ4Kr+PxJXy2HkitETdo+ZrM8X8jWhtlYrOYCk6BIWnPBDfsQHmJE9qdiPiDLwNKhHrF
 f4G3fmOgqbfqbWJSNC/lWDsX1UVoRH9kvhsfEf/gGr++9VS1uyTqJPN4vDkVy9YBEuRv
 xLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xeOhGRDgXDrLUtCw3GwUFAr/RTS5Lk92rkS+JxJfeEU=;
 b=U+GBCQMQLW44HS+C0TJjBXXA6qakUCCQeKalGzoVSdHYQn7epGnJUU26ZAYrxhavtt
 uNXmTVGklpDpZIU5kX0XmQlGVwqLwNw6tEz5CxNgo2xCawjTY5E3pmReO8FRT26g82D9
 7EhXIZsYrvP6snisakccx/DBDQDwcF+mKzN3eG8afWaGsfVRVo/c+Rsgmdd5ztp1fTGE
 pLKo5sO39i2eSF6QeUWV/FCvPIWfM4j649fQ5J3ATqSpG7KSpOFmrg5SLcD4l/IZXyA7
 sPxehcK1a4QxceKcpmBwlNe0SCjiVS39pyKZMo81VCpY6I2GmRS4NbHi1aVXTq4YBzd+
 wQaA==
X-Gm-Message-State: ACrzQf3DmMrIPGteKZq987oEv5BqhgbHZhrlGpVpk51ba3T64SdMFvzi
 WlK7X5o24FpcTLcg3ukHcBwpMyRqCpgqKhFPpT4=
X-Google-Smtp-Source: AMsMyM6nc4UrsZBx/PUrApBdClGODasswY8rPtxXwnmYhYIUI9EVl9V2f9+K3miL6Y7IoZvRI++1cAbcxJwNm2iuoG4=
X-Received: by 2002:a05:6870:64a0:b0:13b:9044:d229 with SMTP id
 cz32-20020a05687064a000b0013b9044d229mr4651232oab.183.1666627968460; Mon, 24
 Oct 2022 09:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Oct 2022 09:12:57 -0700
Message-ID: <CAF6AEGviTTOKcTH5YAQJAgzY9kbDD8fX+FrY5R8igamN22T-bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: remove duplicated code from
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

On Mon, Oct 24, 2022 at 8:14 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The function a6xx_create_address_space() is mostly a copy of
> adreno_iommu_create_address_space() with added quirk setting. Reuse the
> original function to do the work, while introducing the wrapper to set
> the quirk.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
>  drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
>  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
>  5 files changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..7640f5b960d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct iommu_domain *iommu;
> -       struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
> -       u64 start, size;
>
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> +       aspace = adreno_iommu_create_address_space(gpu, pdev);
> +       if (IS_ERR_OR_NULL(aspace))
> +               return ERR_CAST(aspace);
>
>         /*
>          * This allows GPU to set the bus attributes required to use system
>          * cache on behalf of the iommu page table walker.
>          */
>         if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -               adreno_set_llc_attributes(iommu);
> -
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> -               return ERR_CAST(mmu);
> -       }
> -
> -       /*
> -        * Use the aperture start or SZ_16M, whichever is greater. This will
> -        * ensure that we align with the allocated pagetable range while still
> -        * allowing room in the lower 32 bits for GMEM and whatnot
> -        */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> -
> -       aspace = msm_gem_address_space_create(mmu, "gpu",
> -               start & GENMASK_ULL(48, 0), size);
> -
> -       if (IS_ERR(aspace) && !IS_ERR(mmu))
> -               mmu->funcs->destroy(mmu);
> +               adreno_set_llc_attributes(aspace->mmu);
>
>         return aspace;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..ed26b8dfc789 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu)
> +void adreno_set_llc_attributes(struct msm_mmu *mmu)
>  {
> -       iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
> +       msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
>  }

This won't actually work.. looking at the arm-smmu code, the quirks
need to be set before attaching the device.  But there is an even
simpler way, just pass the quirks bitmask to msm_iommu_new() and get
rid of adreno_set_llc_attributes(), and msm_iommu_set_pgtable_quirks()

BR,
-R

>
>  struct msm_gem_address_space *
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..723729e463e8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -338,7 +338,7 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev);
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu);
> +void adreno_set_llc_attributes(struct msm_mmu *mmu);
>
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 5577cea7c009..768ab71cc43e 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
>         return 0;
>  }
>
> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
> +{
> +       struct msm_iommu *iommu = to_msm_iommu(mmu);
> +
> +       return iommu_set_pgtable_quirks(iommu->domain, quirk);
> +}
> +
>  static const struct msm_mmu_funcs pagetable_funcs = {
>                 .map = msm_iommu_pagetable_map,
>                 .unmap = msm_iommu_pagetable_unmap,
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index de158e1bf765..d968d9f8e19c 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>                 int *asid);
> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
>
>  #endif /* __MSM_MMU_H__ */
> --
> 2.35.1
>
