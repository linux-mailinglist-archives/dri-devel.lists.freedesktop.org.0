Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466176E85AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DAD10E218;
	Wed, 19 Apr 2023 23:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E00610E218
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 23:10:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2a7b02615f1so1459881fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681945839; x=1684537839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5/4RlqynUa1Z62zKLyr32FT7wSxlfL7E1oKYhXqB18=;
 b=z6UTASBI3XG6c8hgmPhFxL7UrU5qdQncs91W4ot3/DwuyOsE60irwLx7DFPuurY8Pz
 mGychEDPZE66kkC7fhxGdA3N7OdEeXu7d8W4oEhr91Ob6XAtqKzzqrhHjrpv4vhQnZ6x
 mSjdJIuGDbbdILfGyQjRfp/wH2ReRrwiey9YUoIfA+CmkpO4exrDINB1gYuQX+QP6XBI
 IGmZ1R/+KF82P/0QFISnuGOcXmDCPUorC4EvHUZlIEseVgjkVY9RFwFN7Vt7rYHkM4Ts
 JeJKVsTpaNN3mjwg23mILoEfqsRz6vABiAQpUlFJzUKvG2LGx2LiJLYFeCxbqKgb2L1Z
 ZahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945839; x=1684537839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5/4RlqynUa1Z62zKLyr32FT7wSxlfL7E1oKYhXqB18=;
 b=cUHINOnW3yQTPDx+6f2P5y0Fywu1fa9EplSWk+g9txs4TEXZdi2YirEFHgeuzMaI65
 PN7yMhPW1jSIx+K0YZDyAaBA2rIv1Gk7v6dDXvWhwktjb1wFYoFWv9tHIR2b6IBj294z
 d294VVCR2ETGdeVLYaVMk/ITFZcSgeNc+C/wtjONH28sywm5auhBztfi0+55q3DI29LX
 bmHLvAhh79JbnJ01q8cOroBKqrDOAumIhBseehGk0FnkmDnCgImPQCzMJ8dNd2kFSOhq
 gVqqECwffW4fhKEL7rBR4h9jyvV7PBC6ZyvAOgnYTZ7X+e7iFIUrk0zUV0pc2Bz7VqMU
 cDOQ==
X-Gm-Message-State: AAQBX9fp21slyRqfEBKyW3wuzOIXLN/6TlrPmrGjhRPV63gVqALXv0G+
 xjycDzOSFJz1guAKRZanwx5nNg==
X-Google-Smtp-Source: AKy350YdilaCy/+Npt5xMRdB4kslGT3oNX2faDpHiDTzvXhre5ofWmirq/4Jxhe4IAy3P4OG9cChHg==
X-Received: by 2002:a05:6512:4cd:b0:4ed:c1ef:738 with SMTP id
 w13-20020a05651204cd00b004edc1ef0738mr3277772lfq.54.1681945839465; 
 Wed, 19 Apr 2023 16:10:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05651238c300b004ec5229092dsm38976lft.34.2023.04.19.16.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:10:39 -0700 (PDT)
Message-ID: <405ff057-e4da-3f2f-b860-ce2eeacaab94@linaro.org>
Date: Thu, 20 Apr 2023 02:10:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/11] drm/msm/dpu: add sspp cursor blocks to msm8998 hw
 catalog
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-7-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-7-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> Now that cursor sspp blocks can be used for cursor planes, enable them
> on msm8998. The dma sspp blocks that were assigned to cursor planes can
> now be used for overlay planes instead.

While the change is correct, there is more about it. Composers, using 
universal planes, will see this plane too. They have no obligations to 
use it only for the cursor. At the minimum could you please extend the 
plane_atomic_check to check for the plane dimensions for the CURSOR pipes?

For this change:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 34 ++++++++++++++++++++++
>   2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index b07e8a9941f79..7de393b0f91d7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -90,10 +90,14 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_MSM8998_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_MSM8998_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +	SSPP_BLK("sspp_12", SSPP_CURSOR0, 0x34000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +		msm8998_cursor_sblk_0, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_13", SSPP_CURSOR1, 0x36000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +		msm8998_cursor_sblk_1, 10, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR1),
>   };
>   
>   static const struct dpu_lm_cfg msm8998_lm[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 8d5d782a43398..f34fa704936bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -242,6 +242,22 @@ static const uint32_t wb2_formats[] = {
>   	DRM_FORMAT_XBGR4444,
>   };
>   
> +static const uint32_t cursor_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGBA5551,
> +	DRM_FORMAT_BGRA5551,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_RGBA4444,
> +	DRM_FORMAT_BGRA4444,
> +};
> +
>   /*************************************************************
>    * SSPP sub blocks config
>    *************************************************************/
> @@ -300,6 +316,19 @@ static const uint32_t wb2_formats[] = {
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
>   	}
>   
> +#define _CURSOR_SBLK(num) \
> +	{ \
> +	.maxdwnscale = SSPP_UNITY_SCALE, \
> +	.maxupscale = SSPP_UNITY_SCALE, \
> +	.smart_dma_priority = 0, \
> +	.src_blk = {.name = STRCAT("sspp_src_", num), \
> +		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
> +	.format_list = cursor_formats, \
> +	.num_formats = ARRAY_SIZE(cursor_formats), \
> +	.virt_format_list = cursor_formats, \
> +	.virt_num_formats = ARRAY_SIZE(cursor_formats), \
> +	}
> +
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
>   				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> @@ -309,6 +338,11 @@ static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
>   				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3);
>   
> +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_0 =
> +				_CURSOR_SBLK("12");
> +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_1 =
> +				_CURSOR_SBLK("13");
> +
>   static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>   	.rot_maxheight = 1088,
>   	.rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
> 

-- 
With best wishes
Dmitry

