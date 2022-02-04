Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803F4AA381
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 23:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940B710EF5B;
	Fri,  4 Feb 2022 22:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEED10EF5B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 22:48:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a28so15312625lfl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 14:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qEbzYKKy9zKxiuGw1/mbeJ61GRxAldzRpaBtGTXTaKQ=;
 b=v0UwMDzkG8jASIqmWfJxK3/SqAYtVk98svsgpbE8spI4mR2unP0UrYUwwvOCTQhA6M
 sJN7SfjswdKzCWmMt6EnMz2OfpMdFkCJRuSn7YD8U/p7S1eNtLwByMfIw5H2kDNdxviL
 R+ZX1QWF5zRE+J/H1O5WSa/UYtiZLmrC2IP9I33OMEqabc1Vl0l7iGcqFOiLfccjxtKj
 CJMcvsPo8UlUKN1DDfkhFWxGRrRI4sXQ7E/ylWsCSBE1njfRX13fBhpJFTg9HsH2vf1v
 IPWDaCH1tyC4r1E6kX74Uek4E1oogS0eJv3zpemWSaQvBYsXwASGBEwdIBnf5POpy2/r
 TsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qEbzYKKy9zKxiuGw1/mbeJ61GRxAldzRpaBtGTXTaKQ=;
 b=HvR2jn+QNwF9eON9vD36myVAF4NrF7Rm5ITsJh5cD65SyIIHPBCjccoIf1jcvbhofK
 VxFaZTI3BRH9/hV5K0A1Y6rf3E5kPKnLLzYStXC2jrP2VqKSUl3clY2SRPTP6azMzMlh
 WqGzJrt2bA7OT8bsqwh5RJLq+un+cHw2soE+8i4Eu18GCoBP+drLE2mF8x3gLZox2TD8
 VLoXAgzvCHRbWaQpHSNAx2/ErBHBjvQ7BI10P3UMMDQXGKFdLng4lGlxCFcKUjkL/glt
 JE+a2shZAsYmkC6GIABjG+On08MydaNkobD0qrpm9W5WlYAaGt6r6lI+bga2HZxYkQGM
 R5Bg==
X-Gm-Message-State: AOAM532hhOO8oXG7NemNeM3EyYcqOnJQd51/ROkELqNMbadegyu3nrtZ
 Ok6yy5GiZt34ZGbXHsmcoSmmQPjdIjxD9Q==
X-Google-Smtp-Source: ABdhPJzHVj0o3SmVjHIL+Wcqwzy7KcQ0RngVWMiacuX5fG8dsuJwbmcmMZ/xETDiwVai6k1tcaQu6Q==
X-Received: by 2002:a19:7512:: with SMTP id y18mr855470lfe.368.1644014893933; 
 Fri, 04 Feb 2022 14:48:13 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g27sm377987lfe.299.2022.02.04.14.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:48:13 -0800 (PST)
Message-ID: <3380ef9f-bc8c-219c-2f6a-0987c8e876ca@linaro.org>
Date: Sat, 5 Feb 2022 01:48:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/12] drm/msm/dpu: add writeback blocks to the sm8250 DPU
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-2-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Add writeback blocks to the sm8250 DPU hardware catalog. Other
> chipsets support writeback too but add it to sm8250 to prototype
> the feature so that it can be easily extended to other chipsets.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 73 +++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 66 ++++++++++++++++++++++-
>   2 files changed, 137 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index aa75991..fdd878d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -90,6 +91,15 @@
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> +#define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
> +			 BIT(DPU_WB_UBWC) | \
> +			 BIT(DPU_WB_YUV_CONFIG) | \
> +			 BIT(DPU_WB_PIPE_ALPHA) | \
> +			 BIT(DPU_WB_XY_ROI_OFFSET) | \
> +			 BIT(DPU_WB_QOS) | \
> +			 BIT(DPU_WB_QOS_8LVL) | \
> +			 BIT(DPU_WB_CDP) | \
> +			 BIT(DPU_WB_INPUT_CTRL))
>   
>   #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>   #define DEFAULT_DPU_LINE_WIDTH		2048
> @@ -177,6 +187,40 @@ static const uint32_t plane_formats_yuv[] = {
>   	DRM_FORMAT_YVU420,
>   };
>   
> +static const uint32_t wb2_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_RGBA5551,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGBX5551,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_RGBA4444,
> +	DRM_FORMAT_RGBX4444,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_BGRA5551,
> +	DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_BGRX5551,
> +	DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_BGRA4444,
> +	DRM_FORMAT_BGRX4444,
> +	DRM_FORMAT_XBGR4444,
> +};
> +
>   /*************************************************************
>    * DPU sub blocks config
>    *************************************************************/
> @@ -317,6 +361,8 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2BC, .bit_off = 20},
> +	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
> +			.reg_off = 0x3B8, .bit_off = 24},
>   	},
>   };
>   
> @@ -862,6 +908,29 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   };
>   
>   /*************************************************************
> + * Writeback blocks config
> + *************************************************************/
> +#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
> +		__xin_id, vbif_id, _reg, _wb_done_bit) \
> +	{ \
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x2c8, \
> +	.features = _features, \
> +	.format_list = wb2_formats, \
> +	.num_formats = ARRAY_SIZE(wb2_formats), \
> +	.clk_ctrl = _clk_ctrl, \
> +	.xin_id = __xin_id, \
> +	.vbif_idx = vbif_id, \
> +	.maxlinewidth = DEFAULT_DPU_LINE_WIDTH, \
> +	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
> +	}
> +
> +static const struct dpu_wb_cfg sm8250_wb[] = {
> +	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> +			VBIF_RT, MDP_SSPP_TOP0_INTR, 4),
> +};
> +
> +/*************************************************************
>    * VBIF sub blocks config
>    *************************************************************/
>   /* VBIF QOS remap */
> @@ -1225,6 +1294,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.intf = sm8150_intf,
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
> +		.wb_count = ARRAY_SIZE(sm8250_wb),
> +		.wb = sm8250_wb,
>   		.reg_dma_count = 1,
>   		.dma_cfg = sm8250_regdma,
>   		.perf = sm8250_perf_data,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 31af04a..a3ca695 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,5 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_CATALOG_H
> @@ -209,6 +211,42 @@ enum {
>   };
>   
>   /**
> +  * WB sub-blocks and features
> +  * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
> +  * @DPU_WB_BLOCK_MODE       Writeback module supports block mode read
> +  * @DPU_WB_CHROMA_DOWN,     Writeback chroma down block,
> +  * @DPU_WB_DOWNSCALE,       Writeback integer downscaler,
> +  * @DPU_WB_DITHER,          Dither block
> +  * @DPU_WB_TRAFFIC_SHAPER,  Writeback traffic shaper bloc
> +  * @DPU_WB_UBWC,            Writeback Universal bandwidth compression
> +  * @DPU_WB_YUV_CONFIG       Writeback supports output of YUV colorspace
> +  * @DPU_WB_PIPE_ALPHA       Writeback supports pipe alpha
> +  * @DPU_WB_XY_ROI_OFFSET    Writeback supports x/y-offset of out ROI in
> +  *                          the destination image
> +  * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
> +  * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
> +  * @DPU_WB_CDP              Writeback supports client driven prefetch
> +  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
> +  *                          data arrives.
> +  * @DPU_WB_CROP             CWB supports cropping
> +  * @DPU_WB_MAX              maximum value
> +  */
> +enum {
> +	DPU_WB_LINE_MODE = 0x1,
> +	DPU_WB_BLOCK_MODE,
> +	DPU_WB_UBWC,
> +	DPU_WB_YUV_CONFIG,
> +	DPU_WB_PIPE_ALPHA,
> +	DPU_WB_XY_ROI_OFFSET,
> +	DPU_WB_QOS,
> +	DPU_WB_QOS_8LVL,
> +	DPU_WB_CDP,
> +	DPU_WB_INPUT_CTRL,
> +	DPU_WB_CROP,
> +	DPU_WB_MAX
> +};
> +
> +/**
>    * VBIF sub-blocks and features
>    * @DPU_VBIF_QOS_OTLIM        VBIF supports OT Limit
>    * @DPU_VBIF_QOS_REMAP        VBIF supports QoS priority remap
> @@ -439,6 +477,7 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
>   	DPU_CLK_CTRL_REG_DMA,
> +	DPU_CLK_CTRL_WB2,
>   	DPU_CLK_CTRL_MAX,
>   };
>   
> @@ -577,6 +616,28 @@ struct dpu_intf_cfg  {
>   };
>   
>   /**
> + * struct dpu_wb_cfg - information of writeback blocks
> + * @DPU_HW_BLK_INFO:    refer to the description above for DPU_HW_BLK_INFO
> + * @vbif_idx:           vbif client index
> + * @maxlinewidth:       max line width supported by writeback block
> + * @xin_id:             bus client identifier
> + * @intr_wb_done:       interrupt index for WB_DONE
> + * @format_list:	    list of formats supported by this writeback block
> + * @num_formats:	    number of formats supported by this writeback block
> + * @clk_ctrl:	        clock control identifier
> + */
> +struct dpu_wb_cfg {
> +	DPU_HW_BLK_INFO;
> +	u8 vbif_idx;
> +	u32 maxlinewidth;
> +	u32 xin_id;
> +	s32 intr_wb_done;
> +	const u32 *format_list;
> +	u32 num_formats;
> +	enum dpu_clk_ctrl_type clk_ctrl;
> +};
> +
> +/**
>    * struct dpu_vbif_dynamic_ot_cfg - dynamic OT setting
>    * @pps                pixel per seconds
>    * @ot_limit           OT limit to use up to specified pixel per second
> @@ -758,6 +819,9 @@ struct dpu_mdss_cfg {
>   	u32 vbif_count;
>   	const struct dpu_vbif_cfg *vbif;
>   
> +	u32 wb_count;
> +	const struct dpu_wb_cfg *wb;
> +
>   	u32 reg_dma_count;
>   	struct dpu_reg_dma_cfg dma_cfg;
>   


-- 
With best wishes
Dmitry
