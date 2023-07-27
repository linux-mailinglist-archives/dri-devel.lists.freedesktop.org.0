Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9A765EEF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E7010E620;
	Thu, 27 Jul 2023 22:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265BF10E620
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:08:11 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d18566dc0c1so1375155276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690495690; x=1691100490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+2IjmivRCtMcrXslDZzF29Xyje6HiUV9PZE6DYj4MOo=;
 b=Ddqs+tEIFAQmWVgSpA2HO3JhjyPBrXmx7P1l3G5yhqPIMAPS+HCploEk4tcywGOlRy
 wuki/er+3CGUVIVAbx7jGuHAVnTgZVOb+wwaXTnJ1L3x4CuyEpm6Kbo8fDjQTWFLQ+mc
 rGaEje8CHlpREzXqqRifE0190bCEslzyBKrgMW5J027DvFvgic2nQ7cIykmu743yqAvx
 ASJIWm0LW/TYOhoOUZ2HwDRVNtPWO6GZCbAhAHOwiu4adzptkFfFAasw4tHotjyZw+Hy
 O/qe8FBnbgGWWd184VtsPxnsXq1lRJHjK+ZifNRBbDjUJ+hkght6QTPmEDcdAmLBLoYL
 Og2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495690; x=1691100490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2IjmivRCtMcrXslDZzF29Xyje6HiUV9PZE6DYj4MOo=;
 b=VbiyhY/4nZbkF3gTvJv6Va+DSeISdYyga70AplCXEtOjGZPMZ5UhwyMZxYhQ5EM81m
 UDfj3FCrC3HE4C5i2teX0YArJQMTN1h5ptJTHbgvLFUthEPfBLbsVFtpjBO5+SsrCzJC
 N2+WrQUwwIZOuazUdruXF37hQ7f8PTUEtCwxk6ilKZmuxKNvIXr/j22L8GoRc3TGUsjM
 PjTBtOcvLLK1ObNa7YsVbUcAajqnd925C834G1FlyX0PvmAdOE2Jt768pxEWlVDUq0cp
 8Nt1CBOqrNipHyZ9Mt2gPyOItgvQo0OX+1j6VZC+9ARk6+qSjR7GvAJF1UBpUI+QJ2Rk
 tkXA==
X-Gm-Message-State: ABy/qLavmhIfkxTwhtJgtSVozNDjSsjOH2z0FyVc9Nk/y3Rlgy9Jqv07
 +8DGFLCHfFBO5VEUdw3lCmyvjhnXECkZcO1yjDkXqKghqKa97abrPWc=
X-Google-Smtp-Source: APBJJlHBIIMAJ/ccI1kOpZr6XWoU3xgPN3WOGa37WESD3rOsm3Xd5njhAWAX6+cWBM02TW1GnKNEVDRVqpaJGYQFGpg=
X-Received: by 2002:a25:d1d3:0:b0:ce7:ee46:debd with SMTP id
 i202-20020a25d1d3000000b00ce7ee46debdmr629930ybg.16.1690495690152; Thu, 27
 Jul 2023 15:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-3-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 01:07:59 +0300
Message-ID: <CAA8EJprScB_Nv_Qwt6t8WZW4a8-qNphUPqTuVX4YRXowaWdoiQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] drm/msm/adreno: Remove redundant gmem size param
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:22, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Even in the ocmem case, the allocated ocmem buffer size should match the
> requested size.
>
> v2: Move stray hunk to previous patch, make OCMEM size mismatch an error
>     condition.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 -
>  5 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..50ee03bc94b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -205,7 +205,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>                 A2XX_MH_INTERRUPT_MASK_MMU_PAGE_FAULT);
>
>         for (i = 3; i <= 5; i++)
> -               if ((SZ_16K << i) == adreno_gpu->gmem)
> +               if ((SZ_16K << i) == adreno_gpu->info->gmem)
>                         break;
>         gpu_write(gpu, REG_A2XX_RB_EDRAM_INFO, i);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a99310b68793..f0803e94ebe5 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -749,7 +749,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_HI, 0x00000000);
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_LO,
> -               0x00100000 + adreno_gpu->gmem - 1);
> +               0x00100000 + adreno_gpu->info->gmem - 1);
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
>
>         if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b3ada1e7b598..edbade75020f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1270,7 +1270,7 @@ static int hw_init(struct msm_gpu *gpu)
>                 gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
>
>                 gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX,
> -                       0x00100000 + adreno_gpu->gmem - 1);
> +                       0x00100000 + adreno_gpu->info->gmem - 1);
>         }
>
>         gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index e3cd9ff6ff1d..ef98d51d237f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -320,7 +320,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>                 *value = adreno_gpu->info->revn;
>                 return 0;
>         case MSM_PARAM_GMEM_SIZE:
> -               *value = adreno_gpu->gmem;
> +               *value = adreno_gpu->info->gmem;
>                 return 0;
>         case MSM_PARAM_GMEM_BASE:
>                 *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
> @@ -1041,14 +1041,16 @@ int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
>                 return PTR_ERR(ocmem);
>         }
>
> -       ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
> +       ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->info->gmem);
>         if (IS_ERR(ocmem_hdl))
>                 return PTR_ERR(ocmem_hdl);
>
>         adreno_ocmem->ocmem = ocmem;
>         adreno_ocmem->base = ocmem_hdl->addr;
>         adreno_ocmem->hdl = ocmem_hdl;
> -       adreno_gpu->gmem = ocmem_hdl->len;
> +
> +       if (WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem))
> +               return -ENOMEM;
>
>         return 0;
>  }
> @@ -1097,7 +1099,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         adreno_gpu->funcs = funcs;
>         adreno_gpu->info = adreno_info(config->rev);
> -       adreno_gpu->gmem = adreno_gpu->info->gmem;
>         adreno_gpu->revn = adreno_gpu->info->revn;
>         adreno_gpu->rev = *rev;
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6830c3776c2d..aaf09c642dc6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -77,7 +77,6 @@ struct adreno_gpu {
>         struct msm_gpu base;
>         struct adreno_rev rev;
>         const struct adreno_info *info;
> -       uint32_t gmem;  /* actual gmem size */
>         uint32_t revn;  /* numeric revision name */
>         uint16_t speedbin;
>         const struct adreno_gpu_funcs *funcs;
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
