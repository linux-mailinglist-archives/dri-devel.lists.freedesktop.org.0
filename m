Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4C6F4C55
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD5C10E04E;
	Tue,  2 May 2023 21:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6701A10E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 21:42:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8c51ba511so42988601fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683063729; x=1685655729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JTtiE3JTFO0cOKr86RoPcbIJbXhk5xldLmdUe24G2v8=;
 b=B2CHfRALrKnpEAUaX9F4pvRc6hDgmVz5h3Vl+H+TDwvzU8exwLZc8aHWoHuRyVdwyQ
 Ik/uZ1pl4SGeil/uzcySMPHnOcQjmVdGhRXJsiwesMV4DTE1nsL5r2NtIxNnaEuRHAvN
 4VvbAhlCo6QjGvdvBsSvFifKTgYeH5o4w2rHVLzfGv55CUG7PAW+oAB1QNvWyV41DAAR
 LHdhVV8LWfsjV4k1rYXHo1w5eOHU66JjdCAkLFakq9fI5eTnMv2wuvJ7SdUUqTuD/3A+
 Vx/k332iDZLEHDgP9VbxXnV0Xa4UYy0RT4kUIlR5A+f74dJxtFF4apgJwb0Vy1iT4vZC
 KyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683063729; x=1685655729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTtiE3JTFO0cOKr86RoPcbIJbXhk5xldLmdUe24G2v8=;
 b=eDoi0vCc6Ex+Wj/jx//6d+67CTiUqcvaRqX7Ur2pyKV8m269LV0wugv2XkbFX4AXFu
 9krnXPPSWO71ivQcdjyjAJLd4UvvacGacjh8UMr2FH6Jt5jePnOdgMy8TRFj7Ag3A3Hi
 +ihREpf9drhoGl6GpNvlvLsxTanGTohDa2noMQpWKgj6WPqsIdc0b0/22KxzVlE5Rmnx
 y9Z8UjbZ0R0D8vY8zTvTO1V+OiTUbXeBnYIjoyKlDYmyO/l2Ff6VOHqu4NmvELbs1WOv
 +2vnBEK0dyjaelZr1rDzqzqc/ICPHGZvfasJPW5fBDkXmm/xGAc+34iqiZNyhB27YVNs
 rbLQ==
X-Gm-Message-State: AC+VfDyzYf13juyRN+aOmlQkpKFfWW1vmYUtu720lusK16BXQxSU4yYq
 vQZntr8axxiJCZqon9d9/ztS6w==
X-Google-Smtp-Source: ACHHUZ7cZofo4A2Nrg1r9YYlX8ECTEOw+Ai1PWajayQnPHNsggyGS2+1bH4T7vgKY/SKRWoj1hf8Zw==
X-Received: by 2002:a19:ee0c:0:b0:4e8:5576:98f4 with SMTP id
 g12-20020a19ee0c000000b004e8557698f4mr421236lfb.45.1683063729146; 
 Tue, 02 May 2023 14:42:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002a8bb20e534sm5316902ljc.108.2023.05.02.14.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:42:08 -0700 (PDT)
Message-ID: <1d390e6f-4ec3-bef3-4ad6-b86e5b07c709@linaro.org>
Date: Wed, 3 May 2023 00:42:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 7/7] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-8-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-8-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 00:03, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
> feature flag information.  Each display compression engine (DCE) contains
> dual hard slice DSC encoders so both share same base address but with
> its own different sub block address.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor question below.

> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 +++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 +++++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 +++++++++++
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 +++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 27 ++++++++++++++++++++--
>   6 files changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 4f6a965..f98c2a5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>   };
>   
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8350_dsc[] = {
> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> +};
> +
>   static const struct dpu_intf_cfg sm8350_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -205,6 +217,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>   	.dspp = sm8350_dspp,
>   	.pingpong_count = ARRAY_SIZE(sm8350_pp),
>   	.pingpong = sm8350_pp,
> +	.dsc = sm8350_dsc,
> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
>   	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
>   	.merge_3d = sm8350_merge_3d,
>   	.intf_count = ARRAY_SIZE(sm8350_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 6b2c7ea..3fd0498a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>   };
>   
> +/* NOTE: sc7280 only has one dsc hard slice encoder */
> +static const struct dpu_dsc_cfg sc7280_dsc[] = {
> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +};
> +
>   static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -142,6 +147,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>   	.mixer = sc7280_lm,
>   	.pingpong_count = ARRAY_SIZE(sc7280_pp),
>   	.pingpong = sc7280_pp,
> +	.dsc_count = ARRAY_SIZE(sc7280_dsc),
> +	.dsc = sc7280_dsc,
>   	.intf_count = ARRAY_SIZE(sc7280_intf),
>   	.intf = sc7280_intf,
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 706d0f1..ce583eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>   };
>   
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> +	DSC_BLK_1_2("dce_2", DSC_4, 0x82000, 0x100, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_2", DSC_5, 0x82000, 0x100, 0, dsc_sblk_1),

Just checking: all other platforms have non-422 encoders first, then the 
422-enabled ones. Is there any reason why this platform has them in the 
opposite order?

> +};
> +
>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>   static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> @@ -196,6 +210,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>   	.dspp = sc8280xp_dspp,
>   	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>   	.pingpong = sc8280xp_pp,
> +	.dsc = sc8280xp_dsc,
> +	.dsc_count = ARRAY_SIZE(sc8280xp_dsc),
>   	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
>   	.merge_3d = sc8280xp_merge_3d,
>   	.intf_count = ARRAY_SIZE(sc8280xp_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 4ecb3df..3950e7b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>   };
>   
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8450_dsc[] = {
> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> +};
> +
>   static const struct dpu_intf_cfg sm8450_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -213,6 +225,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>   	.dspp = sm8450_dspp,
>   	.pingpong_count = ARRAY_SIZE(sm8450_pp),
>   	.pingpong = sm8450_pp,
> +	.dsc = sm8450_dsc,
> +	.dsc_count = ARRAY_SIZE(sm8450_dsc),
>   	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
>   	.merge_3d = sm8450_merge_3d,
>   	.intf_count = ARRAY_SIZE(sm8450_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index d0ab351..1b3f542 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>   };
>   
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> +};
> +
>   static const struct dpu_intf_cfg sm8550_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	/* TODO TE sub-blocks for intf1 & intf2 */
> @@ -218,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>   	.dspp = sm8550_dspp,
>   	.pingpong_count = ARRAY_SIZE(sm8550_pp),
>   	.pingpong = sm8550_pp,
> +	.dsc = sm8550_dsc,
> +	.dsc_count = ARRAY_SIZE(sm8550_dsc),
>   	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>   	.merge_3d = sm8550_merge_3d,
>   	.intf_count = ARRAY_SIZE(sm8550_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6ea1e9d..83c0cd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -536,11 +536,34 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   /*************************************************************
>    * DSC sub blocks config
>    *************************************************************/
> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> +	.enc = {.base = 0x100, .len = 0x100},
> +	.ctl = {.base = 0xF00, .len = 0x10},
> +};
> +
> +static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> +	.enc = {.base = 0x200, .len = 0x100},
> +	.ctl = {.base = 0xF80, .len = 0x10},
> +};
> +
>   #define DSC_BLK(_name, _id, _base, _features) \
>   	{\
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0x140, \
> -	.features = _features, \
> +	.features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
> +	}
> +
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = _len, \
> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> +	.sblk = &_sblk, \
>   	}
>   
>   /*************************************************************

-- 
With best wishes
Dmitry

