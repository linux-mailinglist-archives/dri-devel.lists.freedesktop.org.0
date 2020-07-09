Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E1A21A324
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E104A6EA93;
	Thu,  9 Jul 2020 15:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69236EA89;
 Thu,  9 Jul 2020 15:14:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id by13so2108497edb.11;
 Thu, 09 Jul 2020 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svTZUqZItL6wcjbTVTXwVReRDuRMeNVOVpDj5H4MV7Y=;
 b=ZFHxOi3lm0AtcfsrIam2+k4ngQ9/thvcljjmnt0n50sld27J7B8bPYQZwpBWkih2FG
 odPYLanjqAmp8O4OzU+3LE90JM3eAP0H+yVT6gP4/A5DrK7Jbi9EZhNMW5yaD0AZTzFA
 cxXGGzN62IbR0BFD8CzXZ8ad96AHZ6kaaQUJgJM1YDK/QY35Bqpd7LiIinsnoxwefUJW
 XcPd3C0nZ6xuYuxBd774GOZ56Ztk8al4LO60Wcy2OZ8JeuXYpvyo2BzPaNF/MbCwOHX2
 xtCfrbbtJiQCsnGYZFt9mfvWkAIAV+rHbJIRHUpIOg5IEfWCA+d13IrooGfI2Avp4MeF
 Z/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svTZUqZItL6wcjbTVTXwVReRDuRMeNVOVpDj5H4MV7Y=;
 b=lHBnZ0/bN3hSH1w7LNSYkqQEkY66tYQLVeFBPNARyECeiCmBdciuuPmHIekqcFGBLq
 VpwPxg7Wy0xrLKeHb1IlqsnOniOaHYXeUKz+0y9nEd0L/y8sbCZGxyNTH8H9XPWwKhNI
 ykM8w1qRaOZejwj3uK7N2YvQZwqhE9irEbNUIUH4rfGM8ZK57eO5j0peh8E4H8tVek4j
 LnS9pExuzrvmV86vpXy77vwumJNRQRqQLkT7+hQUnBjU7J0FA+RR0/V7NqVTbYJ66Qgs
 zLiWe9/L6NN2/zBlFKCbeeTZKAyocf5zpCo9wrXb6zLKMUNWGJuvmiThm8C9TEO8epEc
 HMtQ==
X-Gm-Message-State: AOAM532xD+Fw2BdSIb6H6aThdochUIU2qhlH4V93p2Uhi7m91C36pNrH
 NQzw/ZPWWHc7xwcOzeW3qQJyvgUVpC0uMYU4FYM=
X-Google-Smtp-Source: ABdhPJySmDpPfzbv4ZnX8rhIes/uKRUMK9JalUqgPpaeget9ts7gAq8xEXBKMenHWFBsDTvDFRh/UfbJcU80Ud0l9fc=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr75079361edi.120.1594307689397; 
 Thu, 09 Jul 2020 08:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200709143404.11876-1-jonathan@marek.ca>
In-Reply-To: <20200709143404.11876-1-jonathan@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Jul 2020 08:15:20 -0700
Message-ID: <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: handle for EPROBE_DEFER for of_icc_get
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 7:35 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Check for errors instead of silently not using icc if the msm driver
> probes before the interconnect driver.
>
> Allow ENODATA for ocmem path, as it is optional and this error
> is returned when "gfx-mem" path is provided but not "ocmem".
>
> Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
> been called on the list yet when going through the defer error path.
>
> Changes in v2:
> * Changed to not only check for EPROBE_DEFER
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
>  drivers/gpu/drm/msm/msm_gpu.c           |  2 --
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 89673c7ed473..0f5217202eb5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
>                  */
>                 gpu->icc_path = of_icc_get(dev, NULL);
>         }
> -       if (IS_ERR(gpu->icc_path))
> +       if (IS_ERR(gpu->icc_path)) {
> +               ret = PTR_ERR(gpu->icc_path);
>                 gpu->icc_path = NULL;
> +               return ret;
> +       }
>
>         gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> -       if (IS_ERR(gpu->ocmem_icc_path))
> +       if (IS_ERR(gpu->ocmem_icc_path)) {
> +               ret = PTR_ERR(gpu->ocmem_icc_path);
>                 gpu->ocmem_icc_path = NULL;
> +               /* allow -ENODATA, ocmem icc is optional */
> +               if (ret != -ENODATA)
> +                       return ret;
> +       }
>
>         return 0;
>  }
> @@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         struct adreno_platform_config *config = pdev->dev.platform_data;
>         struct msm_gpu_config adreno_gpu_config  = { 0 };
>         struct msm_gpu *gpu = &adreno_gpu->base;
> +       int ret;
>
>         adreno_gpu->funcs = funcs;
>         adreno_gpu->info = adreno_info(config->rev);
> @@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         adreno_gpu_config.nr_rings = nr_rings;
>
> -       adreno_get_pwrlevels(&pdev->dev, gpu);
> +       ret = adreno_get_pwrlevels(&pdev->dev, gpu);
> +       if (ret)
> +               return ret;
>
>         pm_runtime_set_autosuspend_delay(&pdev->dev,
>                 adreno_gpu->info->inactive_period);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a22d30622306..ccf9a0dd9706 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>
>         DBG("%s", gpu->name);
>
> -       WARN_ON(!list_empty(&gpu->active_list));
> -

hmm, not a huge fan of removing the WARN_ON().. can we just init the
list head earlier?

BR,
-R

>         for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
>                 msm_ringbuffer_destroy(gpu->rb[i]);
>                 gpu->rb[i] = NULL;
> --
> 2.26.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
