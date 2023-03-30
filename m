Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC46D0466
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E69710E2CE;
	Thu, 30 Mar 2023 12:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA55410E2C2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:10:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k37so24275644lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8UghwaSwhMPyHe7hsYrUem6pNOd2o2pUK7rc4+LK/dU=;
 b=YGVjbQREOio7HjYDsbidWGJTKeRSMpj1biDIvYMAbKxjFMxkMIxRj2C7BEd9ikO8gO
 5+r3trQzJ3Z4kIER37vljfQvPQMJIAzGP1do02hXmMik5kQE1wD8WMn/TkY7ZJX2cTa1
 8BPXyhlU7NR3Vq/nA3Eas6QfYXi+CVNEay0irNUItJ5ubTDPzurxsnQ0I2GL4FzRmqHu
 UAxCMHMN3+d1GvC7/c5fq3LzrQbOTUlwc8UhuVm4BvX4yzl0hLfp6lFIoxCLbMwmq2jl
 v5lLs/P5/FtGK1H07RRn9KINlpnp+6Xfz3eClJTbfe9FksvNTztL6M9o+V/13XdIOS9t
 AIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8UghwaSwhMPyHe7hsYrUem6pNOd2o2pUK7rc4+LK/dU=;
 b=fsoLYmWfExzNugRDjYzDAxkUuLwy6rjheWLCiTX9/2Ue8JRlw6cNSTG6A2UxFDxJ59
 AlU/roc4NBmXSVn+Sgcv5/paUEFr0vVrkJ6Wt+busJDoZN5Z9q7L+HTE2Uq0QSUhl9bU
 mCLyaK6VZINJNQh915AULqNtoJwuQrMeakGLCg7DUuZ7K2MlAbaaNGKoP0m9NU5Lq5Vl
 YZAwvf6QRTjbO1O0yA51foVQ5dYetdMGQ8hUaHNfFe8MneG8+LNTMHg5NgGMyIr0WWOO
 /UwqJto2KVenSSlZJ0DjTnliXF+kS7cZHXxL/xpfPIJJJZX/XGaiOOrBUSPI+WGQcDaW
 xryQ==
X-Gm-Message-State: AAQBX9cHmUPsHQagO6Q/Y7OkwAhhsXvHQ4tYjTjzM1jf0GcaHCl5eVRa
 dVdwJfCSDpijYw28c1j9+Qonew==
X-Google-Smtp-Source: AKy350YKhaixTmEgd/5xLdnzqpPM2w5RyTMPej3jB2yD2hFMIfgfz6U8i97rmZeklb0wi51WDPmbqg==
X-Received: by 2002:a19:f007:0:b0:4e6:9b01:b92b with SMTP id
 p7-20020a19f007000000b004e69b01b92bmr7103141lfc.67.1680178241787; 
 Thu, 30 Mar 2023 05:10:41 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 r28-20020ac25a5c000000b004eb018fac57sm2896827lfn.191.2023.03.30.05.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:10:41 -0700 (PDT)
Message-ID: <de9f05db-78a0-0f26-f7ba-022c03afeeff@linaro.org>
Date: Thu, 30 Mar 2023 14:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,28/50] drm/msm/dpu: split SM8150 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-29-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-29-dmitry.baryshkov@linaro.org>
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 194 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 187 +----------------
>  2 files changed, 195 insertions(+), 186 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> new file mode 100644
> index 000000000000..08b9648eed37
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -0,0 +1,194 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_0_SM8150_H
> +#define _DPU_5_0_SM8150_H
> +
> +static const struct dpu_caps sm8150_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 4096,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
> +static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_30,
> +	.highest_bank_bit = 0x2,
> +};
> +
> +static const struct dpu_ctl_cfg sm8150_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a00, .len = 0x1e0,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_lm_cfg sm8150_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +};
> +
> +static const struct dpu_dspp_cfg sm8150_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg sm8150_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +			-1),
> +};
> +
> +static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> +};
> +
> +static const struct dpu_dsc_cfg sm8150_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +};
> +
> +static const struct dpu_intf_cfg sm8150_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
> +static const struct dpu_perf_cfg sm8150_perf_data = {
> +	.max_bw_low = 12800000,
> +	.max_bw_high = 12800000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
> +		.entries = sm8150_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> +	.caps = &sm8150_dpu_caps,
> +	.ubwc = &sm8150_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> +	.mdp = sdm845_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> +	.sspp = sdm845_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.dsc_count = ARRAY_SIZE(sm8150_dsc),
> +	.dsc = sm8150_dsc,
> +	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> +	.pingpong = sm8150_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> +	.merge_3d = sm8150_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8150_intf),
> +	.intf = sm8150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8150_regdma,
> +	.perf = &sm8150_perf_data,
> +	.mdss_irqs = IRQ_SDM845_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 13796d40c1d7..db262c251c51 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -328,21 +328,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> -static const struct dpu_caps sm8150_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 4096,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> -	.max_vdeci_exp = MAX_VERT_DECIMATION,
> -};
> -
>  static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_10,
>  	.highest_bank_bit = 0x2,
> @@ -353,11 +338,6 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
>  	.highest_bank_bit = 0x2,
>  };
>  
> -static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_30,
> -	.highest_bank_bit = 0x2,
> -};
> -
>  static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -479,45 +459,6 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	},
>  };
>  
> -static const struct dpu_ctl_cfg sm8150_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x1000, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x1200, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x1400, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x1600, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x1800, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -	{
> -	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a00, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> -	},
> -};
> -
>  /*************************************************************
>   * SSPP sub blocks config
>   *************************************************************/
> @@ -795,23 +736,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -/* SM8150 */
> -
> -static const struct dpu_lm_cfg sm8150_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> -};
> -
>  /* QCM2290 */
>  
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
> @@ -857,17 +781,6 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  		 &msm8998_dspp_sblk),
>  };
>  
> -static const struct dpu_dspp_cfg sm8150_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -};
> -
>  /*************************************************************
>   * PINGPONG sub blocks config
>   *************************************************************/
> @@ -934,27 +847,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
>  
> -static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> -};
> -
>  /*************************************************************
>   * MERGE_3D sub blocks config
>   *************************************************************/
> @@ -966,12 +858,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>  	.sblk = NULL \
>  	}
>  
> -static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> -	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
> -	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
> -	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
> -};
> -
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> @@ -989,13 +875,6 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
>  };
>  
> -static const struct dpu_dsc_cfg sm8150_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> -};
> -
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> @@ -1025,13 +904,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
> -static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -};
> -
>  /*************************************************************
>   * Writeback blocks config
>   *************************************************************/
> @@ -1326,35 +1198,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sm8150_perf_data = {
> -	.max_bw_low = 12800000,
> -	.max_bw_high = 12800000,
> -	.min_core_ib = 2400000,
> -	.min_llcc_ib = 800000,
> -	.min_dram_ib = 800000,
> -	.min_prefill_lines = 24,
> -	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> -	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
> -		.entries = sm8150_qos_linear
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> -		.entries = sc7180_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> -		.entries = sc7180_qos_nrt
> -		},
> -		/* TODO: macrotile-qseed is different from macrotile */
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  /*************************************************************
>   * Hardware catalog
>   *************************************************************/
> @@ -1408,35 +1251,7 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
>  	.mdss_irqs = IRQ_SDM845_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> -	.caps = &sm8150_dpu_caps,
> -	.ubwc = &sm8150_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -	.mdp = sdm845_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -	.sspp = sdm845_sspp,
> -	.mixer_count = ARRAY_SIZE(sm8150_lm),
> -	.mixer = sm8150_lm,
> -	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> -	.dspp = sm8150_dspp,
> -	.dsc_count = ARRAY_SIZE(sm8150_dsc),
> -	.dsc = sm8150_dsc,
> -	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> -	.pingpong = sm8150_pp,
> -	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> -	.merge_3d = sm8150_merge_3d,
> -	.intf_count = ARRAY_SIZE(sm8150_intf),
> -	.intf = sm8150_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8150_regdma,
> -	.perf = &sm8150_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> -};
> -
> +#include "catalog/dpu_5_0_sm8150.h"
>  #include "catalog/dpu_5_1_sc8180x.h"
>  
>  #include "catalog/dpu_6_0_sm8250.h"
