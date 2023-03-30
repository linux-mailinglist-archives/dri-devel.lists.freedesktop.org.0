Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C96D0395
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 13:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163110E255;
	Thu, 30 Mar 2023 11:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521CE10E253
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:41:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g17so24133279lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680176504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ifjn7UByY8YbTvWM3qrNNUtz5hDuaMkojjEigSKJiTM=;
 b=bBby1N+gY4XomTdGFjMiNZqEG2d2A5lBV93O0SujE4HISHwEhEmROriZFP7FvL1Ruc
 NAqTNm0pdnXKPM2q9fjXrDNBlfG6ZxH2hr2r1rNhmsnWsz4/DlWs18kKmWHtQS8quQoV
 hH942SM24xDb6IfxYAJiqK2yrknxuXTPDX+PRyc3fDAsNV2UOoVs39t7GZCKVqQpuLNm
 Lu5u52U/ISnFkZQkaTDq9oU+qbOgFOjyvf9W9wIK4JIVWTnuCjUBtO9EEXGmLCbhXj4r
 OtEB7OMuJJb/xVX4TUi+q0RUP3ahR64TjaYCPkWn5iSsGY0tlGLYDsaCHctwltvCruQ3
 SfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680176504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ifjn7UByY8YbTvWM3qrNNUtz5hDuaMkojjEigSKJiTM=;
 b=sYthrA60WhjMmH8LQ6vAVfWgXulTuHLSCc1t2JHIcKhqAn4eHDSDNi9EVhIgC489+c
 Xln41QNycuvA7OMM/Lx+o705YW//LazAxPd6CYu84PwY4xOLbdSo1WM0LdtJsWaGYOIO
 jtpXLf3M/hMcLYA4qpH6VPwp+Sy4jorJgo78QzBA6J8pMmKxImO/qpfQ1dEBGK44kUIc
 IcPrwQ5ZK1IFp3v6HkLM0FaLuNUEXe/wxNwJ88dS4LiAHEC//4UDucV68SzIZmsQ7Eln
 Dy8RSNi3d7dhcxiDC7tGMoSGVuVLaU9m8JamaxBduLqH8g6GTjrTUJkY7aJZ66qZ+piK
 Pwgw==
X-Gm-Message-State: AAQBX9ffylRd8Ga66OvRD6DgML7BbD2g9SrDBTRKgFrdWWUo1Z+OZslM
 2LAk/LgTKMP0Yq3VnDujZvS6xA==
X-Google-Smtp-Source: AKy350ZHtUxW2VbCJXr2ZJd6Xsqw/v/6F9JSN9tzxBMuSkQi/f81yEA7XzH5cx8lPDxQehNfbI61mQ==
X-Received: by 2002:ac2:5e88:0:b0:4eb:c4e:bd87 with SMTP id
 b8-20020ac25e88000000b004eb0c4ebd87mr5251178lfq.58.1680176504314; 
 Thu, 30 Mar 2023 04:41:44 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a19c50a000000b004e84a8c3d86sm5888060lfe.42.2023.03.30.04.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:41:44 -0700 (PDT)
Message-ID: <1055ed97-4623-62ef-d7bf-f70b1bb14e27@linaro.org>
Date: Thu, 30 Mar 2023 13:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,21/50] drm/msm/dpu: split SC7280 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-22-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-22-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 149 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 145 +----------------
>  2 files changed, 151 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> new file mode 100644
> index 000000000000..8977878890f1
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_7_2_SC7280_H
> +#define _DPU_7_2_SC7280_H
> +
> +static const struct dpu_caps sc7280_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2400,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_30,
> +	.highest_bank_bit = 0x1,
> +	.ubwc_swizzle = 0x6,
> +};
> +
> +static const struct dpu_mdp_cfg sc7280_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x2014,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sc7280_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sc7280_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
> +		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +};
> +
> +static const struct dpu_lm_cfg sc7280_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
> +};
> +
> +static const struct dpu_pingpong_cfg sc7280_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> +};
> +
> +static const struct dpu_intf_cfg sc7280_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +};
> +
> +static const struct dpu_perf_cfg sc7280_perf_data = {
> +	.max_bw_low = 4700000,
> +	.max_bw_high = 8800000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
> +	.caps = &sc7280_dpu_caps,
> +	.ubwc = &sc7280_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> +	.mdp = sc7280_mdp,
> +	.ctl_count = ARRAY_SIZE(sc7280_ctl),
> +	.ctl = sc7280_ctl,
> +	.sspp_count = ARRAY_SIZE(sc7280_sspp),
> +	.sspp = sc7280_sspp,
> +	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> +	.dspp = sc7180_dspp,
> +	.mixer_count = ARRAY_SIZE(sc7280_lm),
> +	.mixer = sc7280_lm,
> +	.pingpong_count = ARRAY_SIZE(sc7280_pp),
> +	.pingpong = sc7280_pp,
> +	.intf_count = ARRAY_SIZE(sc7280_intf),
> +	.intf = sc7280_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sc7280_perf_data,
> +	.mdss_irqs = IRQ_SC7280_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 637bc85d8a2c..d5f6b3e48770 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -416,17 +416,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
>  
> -static const struct dpu_caps sc7280_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0x7,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.max_linewidth = 2400,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>  static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_10,
>  	.highest_bank_bit = 0x2,
> @@ -473,12 +462,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
>  	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>  };
>  
> -static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_30,
> -	.highest_bank_bit = 0x1,
> -	.ubwc_swizzle = 0x6,
> -};
> -
>  static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -639,21 +622,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sc7280_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x2014,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -		.reg_off = 0x2AC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -		.reg_off = 0x2C4, .bit_off = 8},
> -	},
> -};
> -
>  static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -834,33 +802,6 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  	},
>  };
>  
> -static const struct dpu_ctl_cfg sc7280_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x15000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -};
> -
>  static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> @@ -1082,17 +1023,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>  
> -static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
> -		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -};
> -
>  static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
>  static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
> @@ -1226,15 +1156,6 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>  		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
> -static const struct dpu_lm_cfg sc7280_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
> -};
> -
>  /* QCM2290 */
>  
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
> @@ -1419,13 +1340,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
>  			-1),
>  };
>  
> -static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> -};
> -
>  static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1520,12 +1434,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>  	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>  
> -static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> -};
> -
>  static const struct dpu_intf_cfg sm8350_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1989,34 +1897,6 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sc7280_perf_data = {
> -	.max_bw_low = 4700000,
> -	.max_bw_high = 8800000,
> -	.min_core_ib = 2500000,
> -	.min_llcc_ib = 0,
> -	.min_dram_ib = 1600000,
> -	.min_prefill_lines = 24,
> -	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> -	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> -		.entries = sc7180_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> -		.entries = sc7180_qos_macrotile
> -		},
> -		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> -		.entries = sc7180_qos_nrt
> -		},
> -	},
> -	.cdp_cfg = {
> -		{.rd_enable = 1, .wr_enable = 1},
> -		{.rd_enable = 1, .wr_enable = 0}
> -	},
> -	.clk_inefficiency_factor = 105,
> -	.bw_inefficiency_factor = 120,
> -};
> -
>  static const struct dpu_perf_cfg sm8350_perf_data = {
>  	.max_bw_low = 11800000,
>  	.max_bw_high = 15500000,
> @@ -2283,29 +2163,6 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
>  	.mdss_irqs = IRQ_SM8350_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
> -	.caps = &sc7280_dpu_caps,
> -	.ubwc = &sc7280_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> -	.mdp = sc7280_mdp,
> -	.ctl_count = ARRAY_SIZE(sc7280_ctl),
> -	.ctl = sc7280_ctl,
> -	.sspp_count = ARRAY_SIZE(sc7280_sspp),
> -	.sspp = sc7280_sspp,
> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> -	.dspp = sc7180_dspp,
> -	.mixer_count = ARRAY_SIZE(sc7280_lm),
> -	.mixer = sc7280_lm,
> -	.pingpong_count = ARRAY_SIZE(sc7280_pp),
> -	.pingpong = sc7280_pp,
> -	.intf_count = ARRAY_SIZE(sc7280_intf),
> -	.intf = sc7280_intf,
> -	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> -	.vbif = sdm845_vbif,
> -	.perf = &sc7280_perf_data,
> -	.mdss_irqs = IRQ_SC7280_MASK,
> -};
> -
>  static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.caps = &qcm2290_dpu_caps,
>  	.ubwc = &qcm2290_ubwc_cfg,
> @@ -2329,6 +2186,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC7180_MASK,
>  };
>  
> +#include "catalog/dpu_7_2_sc7280.h"
> +
>  #include "catalog/dpu_8_0_sc8280xp.h"
>  #include "catalog/dpu_8_1_sm8450.h"
>  
