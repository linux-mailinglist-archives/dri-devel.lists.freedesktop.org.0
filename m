Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EDC25891B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ADF6E5BF;
	Tue,  1 Sep 2020 07:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748E89B99
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:58:31 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id h9so2034460ooo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KPPzOd4S5Oo6nrlND6IQthNcXuqMvh5LHpQP3YI6R7E=;
 b=ewhD6ICQ1SgoLstQajN77CTLdULS5zqw29h2elkj+FHI9pa8i71+BVMpzhUK55smit
 3jBeMp15emblXj28HqSsOsSgGW/dxzOMuwE7RPMBpKTjhkkdBrxnRQyC93Bhne39doZA
 eJ2j+2x8Wqy6LhKXTLO2qn/WBg6JlOeq/DRZJ/MfsR6NzpIEGcrXoKgfUzjvf+SHr4+M
 plydV6o9K36XCe68xzcV1cS6mSQdBWqR2/U4OrfBELAOCgRIdLkjnCWkdStBrov03UMm
 Pt3TpFnNv+w4h+ANHqAy/KhOTUvsymm4StXmKv2fEj2XiEJcayiyMzfvji6NcEwpz/6D
 fOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPPzOd4S5Oo6nrlND6IQthNcXuqMvh5LHpQP3YI6R7E=;
 b=jgtQerJnRrGvm3G0OOHdxC2tVuAf39l8xxsMVTvFGRoI6V4UkzD1JpiRVhHkfKS6I7
 5IJXMpheGG7iW7WuhM8hB5ymsKurVkEX8gEhvcxz8ulr71U27c+caaEkCAADtlKQpeyj
 Z46ZDoUeli6iwAmah+y1N8+SViUL/ZcREuwb6RGT0nBcTqQWVOWRAkkv/hOwUBW6jPWA
 /ugUkgHa/R47rSN3zu8yStg5byL9DRlEbFSP8PUGm8US07ymKmJtMHbYkiDH0ky26S6q
 ns44/zVJ8lXAaNQMkFV7DL3VgaokVQqKaP+mC+SVPiQQ0f+W1/yU/2ZfxPUx7CeqO2KQ
 LAUQ==
X-Gm-Message-State: AOAM532tinMWHKTr9K8ELGknN1ZGYMrwzn1pdh1yGOaykTu7JiiAcEvC
 drEflqLWFpQOdu7BzjSX8eanxw==
X-Google-Smtp-Source: ABdhPJxrPBozUfI+nlt0nkFZ4l7dT06KTI3ftv7H/ltBoqgGY1jMGlNRVE8cvXIGCulF5qGLIxFSxw==
X-Received: by 2002:a4a:9622:: with SMTP id q31mr3138001ooi.78.1598936311137; 
 Mon, 31 Aug 2020 21:58:31 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id 126sm31576oof.28.2020.08.31.21.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 21:58:30 -0700 (PDT)
Date: Mon, 31 Aug 2020 23:58:27 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 07/19] drm/msm: set adreno_smmu as gpu's drvdata
Message-ID: <20200901045827.GP3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-8-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> This will be populated by adreno-smmu, to provide a way for coordinating
> enabling/disabling TTBR0 translation.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
>  drivers/gpu/drm/msm/msm_gpu.c              | 2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              | 6 +++++-
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 26664e1b30c0..58e03b20e1c7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -417,8 +417,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(gpu);
>  	}
>  
> -	dev_set_drvdata(dev, gpu);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 6aa9e04e52e7..806eb0957280 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		gpu->gpu_cx = NULL;
>  
>  	gpu->pdev = pdev;
> -	platform_set_drvdata(pdev, gpu);
> +	platform_set_drvdata(pdev, &gpu->adreno_smmu);
>  
>  	msm_devfreq_init(gpu);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 8bda7beaed4b..f91b141add75 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -7,6 +7,7 @@
>  #ifndef __MSM_GPU_H__
>  #define __MSM_GPU_H__
>  
> +#include <linux/adreno-smmu-priv.h>
>  #include <linux/clk.h>
>  #include <linux/interconnect.h>
>  #include <linux/pm_opp.h>
> @@ -73,6 +74,8 @@ struct msm_gpu {
>  	struct platform_device *pdev;
>  	const struct msm_gpu_funcs *funcs;
>  
> +	struct adreno_smmu_priv adreno_smmu;
> +
>  	/* performance counters (hw & sw): */
>  	spinlock_t perf_lock;
>  	bool perfcntr_active;
> @@ -143,7 +146,8 @@ struct msm_gpu {
>  
>  static inline struct msm_gpu *dev_to_gpu(struct device *dev)
>  {
> -	return dev_get_drvdata(dev);
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
> +	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
>  }
>  
>  /* It turns out that all targets use the same ringbuffer size */
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
