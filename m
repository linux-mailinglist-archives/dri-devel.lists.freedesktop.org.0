Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E869326F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 17:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6CD10E339;
	Sat, 11 Feb 2023 16:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB1610E339
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 16:32:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dr8so22596810ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 08:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C+s/UiHsGRrmY0NGPswR/5voqBQjI1vX9reHtO/KtXI=;
 b=eKoY2zip9q5/ehp2grBWnLF28uBu18DKNuUdc9PCsGSYHSIyZ9akAJIipilJVTjJu0
 tdx9n0b9KUPyMehhQRBi+4qHWqOzLQDBxhggaMEslq1pyvqVXb7kM26oq5hlkkB2Ra66
 oxhTdGsIW+ZoSjxuEooPH67OAPJUf4U4YecL4BNBueyEtPWHjyEQ3bOEQuE/rYHiK+p9
 BXnMYpxkTODR+fNqhpHfty9hcG7xltJjL06SAcx5/dRJ8BmtiaT/NWe0nNw/1wd47lqN
 zbeUUwnSzr/RVCiVV4Cylrbdu3r+HAu8NfVOEI4Ji/pQmL7X/HzUlYdPdw4LY6/1pu/1
 kZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C+s/UiHsGRrmY0NGPswR/5voqBQjI1vX9reHtO/KtXI=;
 b=M2zzm/oAXJKd//XLPcPvWqSL0S0dRAF00rCXnvkBWxyyM5tEYWiJAEq8wkLr1u6KGM
 EXOTPT5Q3802FV7APaIuDCirKkpfKfao/bUo3mz/MhHYSEUvV1FPdKy3ynJczgsvqeC7
 WsMPV+sF/KNkrxUJEEXdnpDB7PnmJgK95OsEWyjckfmKa0lDyzfBYEe6Idl7KjQNAThq
 ScDOgIHZrY5savmoEek+LXh7O4LvsaQ80ecxb/fIO37VvLmk9TA2IWTINGwmF1Tu1JlD
 8fSxegE0UVg75thzWLiD5clIuvEkCPEjfb1mHOCYatYalcpCz26aEWuxKO30WScaSEXv
 aC8g==
X-Gm-Message-State: AO0yUKXSlC5XSpd3jHdPB/dhlZizL/AOPJlRjDi2t4fJswVU4idhLnQh
 bZ5IorUErlA41+iojPsMpzWmSw==
X-Google-Smtp-Source: AK7set+bvuiSIRzVh5eQC2WQbfVPSdoaxJ/ZvFzJMUQgeUo3fDv8g9pQWs6PVykD2JzvpQ0lnh1M1A==
X-Received: by 2002:a17:906:8477:b0:88d:ba89:1844 with SMTP id
 hx23-20020a170906847700b0088dba891844mr12847559ejc.21.1676133172423; 
 Sat, 11 Feb 2023 08:32:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bl4-20020a170906c24400b00880dbd4b6d4sm4031795ejb.136.2023.02.11.08.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 08:32:51 -0800 (PST)
Message-ID: <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
Date: Sat, 11 Feb 2023 18:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211122656.1479141-7-konrad.dybcio@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Liu Shixin <liushixin2@huawei.com>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2023 14:26, Konrad Dybcio wrote:
> Add SM6350 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 187 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                |   2 +
>   4 files changed, 193 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d9ef1e133c1e..ba0bc795e5ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -364,6 +364,25 @@ static const struct dpu_caps sm6115_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm6350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,

QSEED4

> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	/*
> +	 * There is *NO* 3DMERGE hw, but we *need* to set this property to true,
> +	 * because SM6350 includes newer hardware that requires a different reset
> +	 * sequence and it is executed based on this confusingly named variable..
> +	 */

Which reset sequence is that? Is it something that was not posted yet?

> +	.has_3d_merge = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sm8150_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -554,6 +573,25 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x1,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +		.reg_off = 0x2ac, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +		.reg_off = 0x2ac, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {

DPU_CLK_CTRL_DMA1

> +		.reg_off = 0x2b4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {

DPU_CLK_CTRL_DMA2

> +		.reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +		.reg_off = 0x2bc, .bit_off = 20},
> +	},

Please fit them into a single line

> +};
> +
>   static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -888,6 +926,33 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg sm6350_ctl[] = {

We need to fix sc7180_ctl[].len, then we can use it here instead.

> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -1244,6 +1309,20 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   };
>   
> +static const struct dpu_sspp_sub_blks sm6350_vig_sblk_0 =
> +				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED3LITE);

QSEED4

> +
> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SM8250_MASK,
> +		sm6350_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),

DPU_CLK_CTRL_DMA1

> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),

DPU_CLK_CTRL_DMA2

> +};
> +
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>   				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> @@ -1491,6 +1570,13 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>   	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>   };
>   
> +static const struct dpu_lm_cfg sm6350_lm[] = {

I think we can use sc7180_lm here

> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> +};
> +
>   /* SM8150 */
>   
>   static const struct dpu_lm_cfg sm8150_lm[] = {
> @@ -1572,6 +1658,11 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>   		 &sc7180_dspp_sblk),
>   };
>   
> +static const struct dpu_dspp_cfg sm6350_dspp[] = {

sc7180_dspp

> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
>   static const struct dpu_dspp_cfg sm8150_dspp[] = {
>   	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>   		 &sm8150_dspp_sblk),
> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>   		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>   };
>   
> +static struct dpu_pingpong_cfg sm6350_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,

No TE support?

> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +};
> +
>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1879,6 +1979,11 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>   };
>   
> +static const struct dpu_intf_cfg sm6350_intf[] = {

Interesting. Size is 0x2b8 for sc7180 (if I'm not mistaken), but 0x2c0 
for sm6350. Do you know by chance what's the difference?

> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
>   static const struct dpu_intf_cfg sm8150_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -2039,6 +2144,25 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	},
>   };
>   
> +static const struct dpu_vbif_cfg sm6350_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x1044,

So, the only difference from sdm845_vbif is the len? Can we ignore it?

> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> +		.priority_lvl = sdm845_nrt_pri_lvl,
> +		},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};
> +
>   static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
>   	.base = 0x0,
>   	.version = 0x00020000,
> @@ -2128,6 +2252,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>   	{.fl = 0, .lut = 0x0011222222335777},
>   };
>   

Two LUT entries with the same fill level sound strange. Yes, I see the 
same in the vendor dts. Let me check how they are parsend and used.

> +static const struct dpu_qos_lut_entry sm6350_qos_linear[] = {
> +	{.fl = 0, .lut = 0x0011223344556677 },
> +	{.fl = 0, .lut = 0x0011223445566777 },
> +};
> +
>   static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>   	{.fl = 0, .lut = 0x0011222222223357 },
>   };
> @@ -2153,6 +2282,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>   	{.fl = 0, .lut = 0x0011223344556677},
>   };
>   
> +static const struct dpu_qos_lut_entry sm6350_qos_macrotile[] = {
> +	{.fl = 0, .lut = 0x0011223344556677 },
> +	{.fl = 0, .lut = 0x0011223445566777 },
> +};
> +
>   static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
>   	{.fl = 10, .lut = 0x0000000344556677},
>   };
> @@ -2298,6 +2432,34 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg sm6350_perf_data = {
> +	.max_bw_low = 4200000,
> +	.max_bw_high = 5100000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 35,
> +	/* TODO: confirm danger_lut_tbl */
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear),
> +		.entries = sm6350_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sm6350_qos_macrotile),
> +		.entries = sm6350_qos_macrotile
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
>   static const struct dpu_perf_cfg sm8150_perf_data = {
>   	.max_bw_low = 12800000,
>   	.max_bw_high = 12800000,
> @@ -2618,6 +2780,30 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>   	.mdss_irqs = IRQ_SC7180_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sm6350_dpu_cfg = {
> +	.caps = &sm6350_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm6350_mdp),
> +	.mdp = sm6350_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6350_ctl),
> +	.ctl = sm6350_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6350_sspp),
> +	.sspp = sm6350_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6350_lm),
> +	.mixer = sm6350_lm,
> +	.dspp_count = ARRAY_SIZE(sm6350_dspp),
> +	.dspp = sm6350_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6350_pp),
> +	.pingpong = sm6350_pp,
> +	.intf_count = ARRAY_SIZE(sm6350_intf),
> +	.intf = sm6350_intf,
> +	.vbif_count = ARRAY_SIZE(sm6350_vbif),
> +	.vbif = sm6350_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm6350_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>   	.caps = &sm8150_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> @@ -2861,6 +3047,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_640, .dpu_cfg = &sm6350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c7a2e6237d2b..cbf21613e121 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -45,6 +45,7 @@
>   #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>   #define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
> +#define DPU_HW_VER_640	DPU_HW_VER(6, 4, 0) /* sm6350 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>   #define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
> @@ -352,6 +353,8 @@ enum dpu_qos_lut_usage {
>   	DPU_QOS_LUT_USAGE_LINEAR,
>   	DPU_QOS_LUT_USAGE_MACROTILE,
>   	DPU_QOS_LUT_USAGE_NRT,
> +	DPU_QOS_LUT_USAGE_CWB,
> +	DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>   	DPU_QOS_LUT_USAGE_MAX,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a683bd9b5a04..ebfbbd2d105e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1306,6 +1306,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-dpu", },
>   	{ .compatible = "qcom,sc8280xp-dpu", },
>   	{ .compatible = "qcom,sm6115-dpu", },
> +	{ .compatible = "qcom,sm6350-dpu", },
>   	{ .compatible = "qcom,sm8150-dpu", },
>   	{ .compatible = "qcom,sm8250-dpu", },
>   	{ .compatible = "qcom,sm8350-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c

Please split mdss to a separate patch.

> index 02646e4bb4cd..841016f3983a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -279,6 +279,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>   		break;
>   	case DPU_HW_VER_620:
> +	case DPU_HW_VER_640:
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> @@ -529,6 +530,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sc8280xp-mdss" },
>   	{ .compatible = "qcom,sm6115-mdss" },
> +	{ .compatible = "qcom,sm6350-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
>   	{ .compatible = "qcom,sm8350-mdss" },

-- 
With best wishes
Dmitry

