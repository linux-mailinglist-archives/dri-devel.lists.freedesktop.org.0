Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA06D0575
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C410E079;
	Thu, 30 Mar 2023 12:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682A10E079
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:56:29 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c9so13961498lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680180987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=My/kh8FAc+a/DtylS38p61qx9mFqngZhP3tiK/qTFWw=;
 b=beqh7tUdppB4g3HSjFxBnHO/i7fdhaEcrjEvFrGIS5qbTJQuKqEWVrFUyelLAcQ/q2
 3JI8NT2W3jthBGfs1s79FoqOUcvI2xklr+LZ8fisVxd5H4zhLOwiX0GNtQWoKg5dennw
 I2Qmxr9RhV6VrR1GHA7DdNQCUQDh30kyVVedWPJFqsWyo67EPZ/GetNI3HRx7HQ0T7gf
 0LKucfedZYi79xmOLxG2UliCEp3VF8awS+1ztEEoISQRgWiGSFLxm/5vc8UPRdNphjdV
 +IuGPjfwKacghgXikDscyxIpg1o2ObN+ml+vLLW8c1/wXCyPZdj3aFNHoWYpCDvEDefT
 Whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=My/kh8FAc+a/DtylS38p61qx9mFqngZhP3tiK/qTFWw=;
 b=3t7nA95Yyi/5hGRBgGwEXIY/8phb1r94S5agYKIeDhARZ9FtIuU2JeChDZRA/lH3Vi
 VjFjDzOqWlBVmAwjmVaDp8aS+VxLK9PKq0f3cw7XCQuK+Tsy7hbYj2m++ytLH0MKNUaB
 4KGya+p/3JGPu+9b/QBUzhAloL8SzaMuRcB72qH3WSS5dVPV/Zo/JnZbVkMTBksupXct
 qwxvAxMQ1M4CaYUjFY3/6yTkB1NXodwTiyBrLwMUABx73HcE4rsS1CQQ45TJEooUyzdv
 OdJc5RfrTpLX47Md7f1Rfuw9e+u6WlGr+TMsBdIrT923P7C7TqWWkvAYSAnyI6fGrBN9
 GGNA==
X-Gm-Message-State: AAQBX9eNHCc47laP/u/fOc1H2KZc3i0AfY4LBNuQIe9dG1cT5GF0qzJ0
 /mOPXFSi2Gg3Hc7OrhzXRRoyDA==
X-Google-Smtp-Source: AKy350b7MvOypy8cXjHgg3vOy2Jr7ul14Hp2+ncLfFjLlGz/XpV4R0+9FvK09/8V8jFkJznx4Pu82g==
X-Received: by 2002:ac2:5ded:0:b0:4dd:af74:fe1a with SMTP id
 z13-20020ac25ded000000b004ddaf74fe1amr7121033lfq.48.1680180987335; 
 Thu, 30 Mar 2023 05:56:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 q30-20020ac2515e000000b004cf6c56fdb5sm5853772lfd.232.2023.03.30.05.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:56:27 -0700 (PDT)
Message-ID: <e9630379-20cd-f513-3b88-92b00f452539@linaro.org>
Date: Thu, 30 Mar 2023 14:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,42/50] drm/msm/dpu: deduplicate sm6115 with qcm2290
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-43-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-43-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Remove duplicate between sm6115 and qcm2290, which belong to the same
> DPU major revision.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 36 ++++------
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 66 ++++---------------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h | 51 ++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
>  4 files changed, 80 insertions(+), 75 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index aadb65329ec3..7e4cfb0d6901 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -7,6 +7,8 @@
>  #ifndef _DPU_6_3_SM6115_H
>  #define _DPU_6_3_SM6115_H
>  
> +#include "dpu_6_lm1.h"
> +
>  static const struct dpu_caps sm6115_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>  	.max_mixer_blendstages = 0x4,
> @@ -24,16 +26,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
>  	.ubwc_swizzle = 0x7,
>  };
>  
> -static const struct dpu_mdp_cfg sm6115_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = 0,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	},
> -};
> -
>  static const struct dpu_sspp_cfg sm6115_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>  		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -73,20 +65,20 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>  static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>  	.caps = &sm6115_dpu_caps,
>  	.ubwc = &sm6115_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sm6115_mdp),
> -	.mdp = sm6115_mdp,
> -	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> -	.ctl = qcm2290_ctl,
> +	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
> +	.mdp = dpu_6_lm1_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
> +	.ctl = dpu_6_lm1_ctl,
>  	.sspp_count = ARRAY_SIZE(sm6115_sspp),
>  	.sspp = sm6115_sspp,
> -	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> -	.mixer = qcm2290_lm,
> -	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> -	.dspp = qcm2290_dspp,
> -	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> -	.pingpong = qcm2290_pp,
> -	.intf_count = ARRAY_SIZE(qcm2290_intf),
> -	.intf = qcm2290_intf,
> +	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
> +	.mixer = dpu_6_lm1_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
> +	.dspp = dpu_6_lm1_dspp,
> +	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
> +	.pingpong = dpu_6_lm1_pp,
> +	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
> +	.intf = dpu_6_lm1_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm6115_perf_data,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 48e7d4c641cd..440240860635 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -7,6 +7,8 @@
>  #ifndef _DPU_6_5_QCM2290_H
>  #define _DPU_6_5_QCM2290_H
>  
> +#include "dpu_6_lm1.h"
> +
>  static const struct dpu_caps qcm2290_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>  	.max_mixer_blendstages = 0x4,
> @@ -21,25 +23,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
>  	.highest_bank_bit = 0x2,
>  };
>  
> -static const struct dpu_mdp_cfg qcm2290_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = 0,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	},
> -};
> -
> -static const struct dpu_ctl_cfg qcm2290_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -};
> -
>  static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
>  		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -47,27 +30,6 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>  		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>  
> -static const struct dpu_lm_cfg qcm2290_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> -		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> -};
> -
> -static const struct dpu_dspp_cfg qcm2290_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -};
> -
> -static const struct dpu_pingpong_cfg qcm2290_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -};
> -
> -static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -};
> -
>  static const struct dpu_perf_cfg qcm2290_perf_data = {
>  	.max_bw_low = 2700000,
>  	.max_bw_high = 2700000,
> @@ -93,20 +55,20 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>  static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.caps = &qcm2290_dpu_caps,
>  	.ubwc = &qcm2290_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> -	.mdp = qcm2290_mdp,
> -	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> -	.ctl = qcm2290_ctl,
> +	.mdp_count = ARRAY_SIZE(dpu_6_lm1_mdp),
> +	.mdp = dpu_6_lm1_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_6_lm1_ctl),
> +	.ctl = dpu_6_lm1_ctl,
>  	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
>  	.sspp = qcm2290_sspp,
> -	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> -	.mixer = qcm2290_lm,
> -	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> -	.dspp = qcm2290_dspp,
> -	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> -	.pingpong = qcm2290_pp,
> -	.intf_count = ARRAY_SIZE(qcm2290_intf),
> -	.intf = qcm2290_intf,
> +	.mixer_count = ARRAY_SIZE(dpu_6_lm1_lm),
> +	.mixer = dpu_6_lm1_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_6_lm1_dspp),
> +	.dspp = dpu_6_lm1_dspp,
> +	.pingpong_count = ARRAY_SIZE(dpu_6_lm1_pp),
> +	.pingpong = dpu_6_lm1_pp,
> +	.intf_count = ARRAY_SIZE(dpu_6_lm1_intf),
> +	.intf = dpu_6_lm1_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &qcm2290_perf_data,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> new file mode 100644
> index 000000000000..40e1183b9377
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_LM1_H
> +#define _DPU_6_LM1_H
> +
> +static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
> +static const struct dpu_lm_cfg dpu_6_lm1_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
> +static const struct dpu_dspp_cfg dpu_6_lm1_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg dpu_6_lm1_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +};
> +
> +static const struct dpu_intf_cfg dpu_6_lm1_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5091cec30bfc..3b015f3be31a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -845,8 +845,8 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  
>  #include "catalog/dpu_6_0_sm8250.h"
>  #include "catalog/dpu_6_2_sc7180.h"
> -#include "catalog/dpu_6_5_qcm2290.h"
>  #include "catalog/dpu_6_3_sm6115.h"
> +#include "catalog/dpu_6_5_qcm2290.h"
>  
>  #include "catalog/dpu_7_0_sm8350.h"
>  #include "catalog/dpu_7_2_sc7280.h"
