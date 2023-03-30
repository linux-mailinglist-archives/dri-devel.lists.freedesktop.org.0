Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA46D044F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D45010E2AF;
	Thu, 30 Mar 2023 12:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEB910E2AF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:06:34 +0000 (UTC)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl [83.9.3.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1E32E3F7E8;
 Thu, 30 Mar 2023 14:06:32 +0200 (CEST)
Message-ID: <37ef5b73-3905-8cc8-346c-8e237aa14f9e@somainline.org>
Date: Thu, 30 Mar 2023 14:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,26/50] drm/msm/dpu: split SM8250 catalog entry to the
 separate file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-27-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20230211231259.1308718-27-dmitry.baryshkov@linaro.org>
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
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 131 +++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 132 +-----------------
>  2 files changed, 132 insertions(+), 131 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> new file mode 100644
> index 000000000000..677e3202141a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_6_0_SM8250_H
> +#define _DPU_6_0_SM8250_H
> +
> +static const struct dpu_caps sm8250_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
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
> +};
> +
> +static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.ubwc_swizzle = 0x6,
> +};
> +
> +static const struct dpu_mdp_cfg sm8250_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm8250_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
> +static const struct dpu_wb_cfg sm8250_wb[] = {
> +	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> +			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
> +};
> +
> +static const struct dpu_perf_cfg sm8250_perf_data = {
> +	.max_bw_low = 13700000,
> +	.max_bw_high = 16600000,
> +	.min_core_ib = 4800000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 35,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> +		.entries = sc7180_qos_linear
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
> +static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
> +	.caps = &sm8250_dpu_caps,
> +	.ubwc = &sm8250_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm8250_mdp),
> +	.mdp = sm8250_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> +	.ctl = sm8150_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> +	.sspp = sm8250_sspp,
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
> +	.wb_count = ARRAY_SIZE(sm8250_wb),
> +	.wb = sm8250_wb,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm8250_perf_data,
> +	.mdss_irqs = IRQ_SM8250_MASK,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 81d2a94b382f..b2d994de297c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -358,19 +358,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
>  };
>  
> -static const struct dpu_caps sm8250_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 4096,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> -
>  static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_10,
>  	.highest_bank_bit = 0x2,
> @@ -391,12 +378,6 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
>  	.highest_bank_bit = 0x3,
>  };
>  
> -static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
> -	.ubwc_version = DPU_HW_UBWC_VER_40,
> -	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> -	.ubwc_swizzle = 0x6,
> -};
> -
>  static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -473,34 +454,6 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>  	},
>  };
>  
> -static const struct dpu_mdp_cfg sm8250_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = 0,
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -			.reg_off = 0x2AC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -			.reg_off = 0x2B4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -			.reg_off = 0x2BC, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -			.reg_off = 0x2C4, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -			.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> -			.reg_off = 0x2C4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> -			.reg_off = 0x2BC, .bit_off = 20},
> -	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
> -			.reg_off = 0x3B8, .bit_off = 24},
> -	},
> -};
> -
>  /*************************************************************
>   * CTL sub blocks config
>   *************************************************************/
> @@ -764,25 +717,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>  				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>  
> -static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
>  static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
>  static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
> @@ -1170,11 +1104,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
>  	}
>  
> -static const struct dpu_wb_cfg sm8250_wb[] = {
> -	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
> -};
> -
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> @@ -1507,35 +1436,6 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> -static const struct dpu_perf_cfg sm8250_perf_data = {
> -	.max_bw_low = 13700000,
> -	.max_bw_high = 16600000,
> -	.min_core_ib = 4800000,
> -	.min_llcc_ib = 0,
> -	.min_dram_ib = 800000,
> -	.min_prefill_lines = 35,
> -	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> -	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
> -	.qos_lut_tbl = {
> -		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> -		.entries = sc7180_qos_linear
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
> @@ -1643,37 +1543,7 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC8180X_MASK,
>  };
>  
> -static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
> -	.caps = &sm8250_dpu_caps,
> -	.ubwc = &sm8250_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sm8250_mdp),
> -	.mdp = sm8250_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8150_ctl),
> -	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> -	.sspp = sm8250_sspp,
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
> -	.wb_count = ARRAY_SIZE(sm8250_wb),
> -	.wb = sm8250_wb,
> -	.reg_dma_count = 1,
> -	.dma_cfg = &sm8250_regdma,
> -	.perf = &sm8250_perf_data,
> -	.mdss_irqs = IRQ_SM8250_MASK,
> -};
> -
> +#include "catalog/dpu_6_0_sm8250.h"
>  #include "catalog/dpu_6_2_sc7180.h"
>  #include "catalog/dpu_6_5_qcm2290.h"
>  #include "catalog/dpu_6_3_sm6115.h"
