Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F1A405A6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 06:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D728910E1BE;
	Sat, 22 Feb 2025 05:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YUiXwHL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3710E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 05:31:13 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5461a485a72so2827330e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740202272; x=1740807072; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=692t9KtSpJuDmEMvBMOA3yej/31QmD5LmR5dhTfFxao=;
 b=YUiXwHL26/meu22rgJFnNvCiYhixI7Oy7AMz3pti5ckrgBswfor648ut+5FRE+CaAb
 Q0O+k7RFarCZxbv0tzZXWw6FKb5ng3nNRn7aqjyDsyof2+pKEbVyqO3Hx8LJgXQieFQb
 yXBj5yvI8HuGA4d1ljZIlcB2YE1zyisCYwwSrfZu4C4tKsEk3xZDr0lSCn6romHMfwLB
 XicMJmwzCclYwNOX/yV26ChBq8eFwdlHgHunl4Q6wJRcEuAjRcqfZs+c7nFeDzcs+Drn
 agUsDJ7IlI4ZePRuIfK+9qIk1JaiqCblwubA8CUSYKl9gtxZS3dSINhUBYUfVaT+NsRB
 b8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740202272; x=1740807072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=692t9KtSpJuDmEMvBMOA3yej/31QmD5LmR5dhTfFxao=;
 b=AGazgHIjODXvVfqmMXArgPiVWq5y6DjkKEOSuunIfDxdM/JtXKE/4iwO9apKqwY9DS
 a6G3Yq1iLLKuhGNnLTQ53Eht/Kue9fTPPeglm9aUwIQYUDu/2XCdDFs3Jwx4SCZNeUgu
 mxqQKA/NRpAdRcnIuUdtPobL1kPVGq4BvGjj8mcbk1DR4keg5AYUCxlupSgVlzkT5Ceu
 fzAsxa6fBWgjoMvDZ1cvSw/90F5rZQqqQiyAXrEUZuN78Kt3lNJ011ya1V1S/jBOJNkk
 VhM1E97ce5Di2yvPjhx7l8JhwuBmiR1LZYVIg32OIlo/mVTGL+O365vh9jr6Ip4bLU4t
 9SZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIZAO+VtvrkS/SMoynDARiJQM+BRJY4WrpPBJXw1DG2UjjF//vlyWS+QwcDmhb4zImwr8kjqDnrno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp84oiyzdgMYDG1fLPScYYC3kObmCS3gc5WrnRAyw2oZDvlZnE
 g87owjW6mDT58jjjhdeQLBtILLQcEIspBMYGRS/w3TQGbne7axEaCF0KVwgr40Y=
X-Gm-Gg: ASbGncvN3qzPtGzZ3nUlcDqheERy+coeML5B7ofWHLPvU04arBA1FkpJV/5HseyNdzz
 joXyQRp6Rxl2U3dDGT5zVtVWuvEhK4b79STaFqlG+HxikZnvRe/+K0GzZ72hbNOgjGzdzYh5lV/
 xTS++3SA0DcNusHHkYovti7M1gHZHyqlAnEYz3jt07QihI9fAqm2g8bpqVlMyNcJGly+QCHy1Wd
 qTeDpG5PAN1TH/vOktUZ3PtczIiARyr/974x17nElpwiZbf/JPvJpas4vz4j3OUSybs8tXKX9SH
 268nvR8iUKxgrZCJb14rUVrcZOk7lDx3SYWdAoeQ9tJsZ3uYJ5zOlaiTZBMY0s4ecXvPHBi7x+k
 ARzQcrg==
X-Google-Smtp-Source: AGHT+IF61Bc0IB55BcHXaBW8QvUMpJcyRRONQV/+7MbYnEEcLtLOL6ljiaBWgmGKtrQT36MElp7few==
X-Received: by 2002:a05:6512:239b:b0:545:10cf:3462 with SMTP id
 2adb3069b0e04-54838f4e423mr2480960e87.41.1740202271699; 
 Fri, 21 Feb 2025 21:31:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452ca28f47sm2431142e87.38.2025.02.21.21.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 21:31:10 -0800 (PST)
Date: Sat, 22 Feb 2025 07:31:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <d77bfuqor2rsd5tg4abywkckiqwy7j5xr43p73to2ofwpirws3@4m4g7hkvji2a>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-4-shiyongbang@huawei.com>
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

On Sat, Feb 22, 2025 at 10:50:56AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add dp serdes cfg in link training process, and related adapting
> and modificating. Change some init values about training,
> because we want completely to negotiation process, so we start with
> the maximum rate and the electrical characteristic level is 0.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>   - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  6 ++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
>  6 files changed, 43 insertions(+), 11 deletions(-)
> 

Mostly LGTM.

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> index 812d0794543c..e0537cc9af41 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> @@ -4,12 +4,15 @@
>  #ifndef DP_SERDES_H
>  #define DP_SERDES_H
>  
> +#include "dp_comm.h"

No, please include it directly, where required. This simplifies possible
inter-header dependencies.

> +
>  #define HIBMC_DP_HOST_OFFSET		0x10000
>  #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
>  #define HIBMC_DP_LANE1_RATE_OFFSET	0xc
>  #define HIBMC_DP_LANE_STATUS_OFFSET	0x10
>  #define HIBMC_DP_PMA_LANE0_OFFSET	0x18
>  #define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
> +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
>  #define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
>  
>  /* dp serdes TX-Deempth Configuration */
> @@ -24,6 +27,9 @@
>  #define DP_SERDES_VOL2_PRE1		0x4500
>  #define DP_SERDES_VOL3_PRE0		0x600
>  #define DP_SERDES_BW_8_1		0x3
> +#define DP_SERDES_BW_5_4		0x2
> +#define DP_SERDES_BW_2_7		0x1
> +#define DP_SERDES_BW_1_62		0x0
>  
>  #define DP_SERDES_DONE			0x3
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index e6de6d5edf6b..67d39e258cac 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -28,9 +28,7 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>  
> -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
> -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
> +#include "dp/dp_serdes.h"
>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	}
>  
>  	/* if DP existed, init DP */
> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> +	if (ret) {

Why?

>  		ret = hibmc_dp_init(priv);
>  		if (ret)
>  			drm_err(dev, "failed to init dp: %d\n", ret);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
