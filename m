Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142D8A8F97
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F6310F90A;
	Wed, 17 Apr 2024 23:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kbI01Ux1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC510F90A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:43:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-518b9527c60so264981e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397387; x=1714002187; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nqgl0cJ22faq0OLfGdwsUXUHBSiO8IFgnMRlpAUtFnY=;
 b=kbI01Ux1Ja/FizuMA77cwqm+OpxFUztGwXcDQ28W46g98ATa0068DkYHhnL1ktTyFF
 DIg9lrrd/4lDnSY+zqXjTSPg6jYf50m8l6BdU85GT87uPHyG1Z96XXx/jrTFrRXdbxGR
 cnzRcFDtlUvuxfoFC1WFXb6qXxq7lec8FtFXbQrUoSA9fMOpzzBsFXLf1ycipj1d+TBI
 JIpDr4L+3w9yM0hl3t3zt3SkxW9mAW4CGBi0Yop1qvM6CbZNSOApVjA7YnAog9CCTUIr
 xkrz0SVWIiAtO5sfyKjHF/IfveYacJuP1vP01dxGgZ9+xBIsCx7Lk7f73gVCroTQVHoj
 4LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397387; x=1714002187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nqgl0cJ22faq0OLfGdwsUXUHBSiO8IFgnMRlpAUtFnY=;
 b=M4IyhU9yWZOn2XPnWkrWVD8enpL0U44ywZ0PM+xVe73Tgxn8ZTCgYBIxFvpvH3DfBl
 eV5c8gEG10oRqcNg/mC5VeAhiEYMLpzXUWhkzLFm2iLeOrbkwpF7KcR7exXCg57JlEmO
 pEJxaUW0zTF79/HPXlD8KsEYgIOUQeH4Nu+yvjhEtzGoIGx3y9WLvSs7+7FtgHYQUyWa
 qVnmAP4n6hM3Zki+nI+ik9u81HHL6TJ8KkE4H9ySyV7M79mi2qRaoDVdof/7ZpbDEbFR
 wkw5pSQ2is1cYeUO+f7eW82xs67TCkZ1gEFX85T2EggxjoIHCXjt2/8l7FwwhXVZ08G/
 XHzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCabgPBrstz1LIKmFSof+o0836DjDOU6I2c+V5zpkKXyELJWtuM9nREdU5VTY1P1lRBTqjzGSCmWByLEUYsGNLi7uI08aN6wyYWh3eFvp3
X-Gm-Message-State: AOJu0YxIAtvpkh+dABwtHMWx5aUt+hzPpwNiaHInO1hFP/dsRMQY7z4U
 CZMG9yiAM8Kqv0r1bO1WeiPEtxirs91yyc8wVXaeM7m2Bq/ZAS1lFUKqVHPmiNk=
X-Google-Smtp-Source: AGHT+IF9i4Z68hDQSut7wIF9JggheG5n5zLw3Jk7ObfMTXNDdwdfqQA4zyvf70wg2xXSQWrGdof4LQ==
X-Received: by 2002:ac2:4859:0:b0:516:c8e5:db35 with SMTP id
 25-20020ac24859000000b00516c8e5db35mr522976lfy.18.1713397386612; 
 Wed, 17 Apr 2024 16:43:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 w1-20020ac254a1000000b00516d264366fsm35066lfk.245.2024.04.17.16.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:43:06 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <hi7vzqm5ebypzs6m6bw64ghgfwsdzuaxy65jpah37iw5ww7fku@n3c5sucic27i>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-3-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:55PM +0200, Konrad Dybcio wrote:
> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> abstracted through SMEM, instead of being directly available in a fuse.
> 
> Add support for SMEM-based speed binning, which includes getting
> "feature code" and "product code" from said source and parsing them
> to form something that lets us match OPPs against.
> 
> Due to the product code being ignored in the context of Adreno on
> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 +++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 41 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 12 ++++++---
>  4 files changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d10323f15d40..60708c23ae4c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2890,13 +2890,15 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
>  	return UINT_MAX;
>  }
>  
> -static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
> +static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
> +				 struct device *dev,
> +				 const struct adreno_info *info)
>  {
>  	u32 supp_hw;
>  	u32 speedbin;
>  	int ret;
>  
> -	ret = adreno_read_speedbin(dev, &speedbin);
> +	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
>  	/*
>  	 * -ENOENT means that the platform doesn't support speedbin which is
>  	 * fine
> @@ -3056,7 +3058,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>  
> -	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
> +	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
>  	if (ret) {
>  		a6xx_llc_slices_destroy(a6xx_gpu);
>  		kfree(a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b..901ef767e491 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -6,6 +6,8 @@
>   * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/socinfo.h>
> +

Stray leftover?

>  #include "adreno_gpu.h"
>  
>  bool hang_debug = false;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 074fb498706f..58fd70140685 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -21,6 +21,9 @@
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>  
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
> +
>  static u64 address_space_size = 0;
>  MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
>  module_param(address_space_size, ullong, 0600);
> @@ -1057,9 +1060,39 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>  			   adreno_ocmem->hdl);
>  }
>  
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin)
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +			 struct device *dev, u32 *fuse)
>  {
> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
> +	u32 fcode;
> +	int ret;
> +
> +	/*
> +	 * Try reading the speedbin via a nvmem cell first
> +	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
> +	 * "nvmem fuse is irrelevant", simply assume it's fine.
> +	 */
> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
> +	if (!ret)
> +		return 0;
> +	else if (ret != -ENOENT)
> +		return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
> +
> +#ifdef CONFIG_QCOM_SMEM

Please extract to a separate function and put the function under ifdef
(providing a stub otherwise). Having #ifndefs inside funciton body is
frowned upon.

> +	/*
> +	 * Only check the feature code - the product code only matters for
> +	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
> +	 * matching is concerned.
> +	 *
> +	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
> +	 */
> +	ret = qcom_smem_get_feature_code(&fcode);
> +	if (!ret)
> +		*fuse = ADRENO_SKU_ID(fcode);
> +	else if (ret != -EOPNOTSUPP)
> +		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
> +#endif
> +
> +	return 0;
>  }
>  
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> @@ -1098,9 +1131,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			devm_pm_opp_set_clkname(dev, "core");
>  	}
>  
> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>  		speedbin = 0xffff;
> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> +	adreno_gpu->speedbin = speedbin;
>  
>  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>  			ADRENO_CHIPID_ARGS(config->chip_id));
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..8f2b70eaf6ad 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -81,7 +81,12 @@ extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_h
>  extern const struct adreno_reglist a660_hwcg[], a690_hwcg[], a702_hwcg[], a730_hwcg[], a740_hwcg[];
>  
>  struct adreno_speedbin {
> -	uint16_t fuse;
> +	/* <= 16-bit for NVMEM fuses, 32b for SOCID values */
> +	uint32_t fuse;
> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> +#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
> +#define ADRENO_SKU_ID(fcode)	(SOCINFO_PC_UNKNOWN << 16 | fcode)

If we got rid of PCode matching, is there a need to actually use
SOCINFO_PC_UNKNOWN here? Or just 0 would be fine?

> +
>  	uint16_t speedbin;
>  };
>  
> @@ -136,7 +141,7 @@ struct adreno_gpu {
>  	struct msm_gpu base;
>  	const struct adreno_info *info;
>  	uint32_t chip_id;
> -	uint16_t speedbin;
> +	uint32_t speedbin;
>  	const struct adreno_gpu_funcs *funcs;
>  
>  	/* interesting register offsets to dump: */
> @@ -519,7 +524,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>  			 struct adreno_smmu_fault_info *info, const char *block,
>  			 u32 scratch[4]);
>  
> -int adreno_read_speedbin(struct device *dev, u32 *speedbin);
> +int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
> +			 struct device *dev, u32 *speedbin);
>  
>  /*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
