Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FF693294
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 17:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BC010E332;
	Sat, 11 Feb 2023 16:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7704110E16E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 16:47:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so22767204ejc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kJNvZAxBs/qVUrZbAS9C7BpNUHNqloIgGKrg/9F91U=;
 b=yrzAR0La949P9XaEOs5H6lerTqNYYf+05w1bduLnn9OqIgSW7k5apvVuFdhpCnSm0Q
 w7dGiaq09Olbqey/LbGlqMAbZhEtW//cPig1DSSDprkZg0RqL7+Orzvgi0SIFDD0o/mW
 s+X4oPbpek0aYr9aIJfxsyGfMi3Gghjpun2vjMo0K6prj/AhmbLZcucvEBQPAUegwwA7
 b8bSByTi/D1tmuw8w/m6Soae9K3FiXaEwcUfxsGPNh1hGU8CLB2KDp+9AyFsa4UiL/4O
 2yu2QTmAeDu2+aaQwe2hlBS3fuxBjpAPROKJx7xn10eePFolc+uY9pJmZttABIKEpsf4
 cSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kJNvZAxBs/qVUrZbAS9C7BpNUHNqloIgGKrg/9F91U=;
 b=vOx7huKwBJ9Hsd5LEs6KclzHCe2Ud0N9brZwM+jttMhCV3nCSnKi+Keak3JxqInbLT
 bTrMzxIr+JnqemvmPdkCKxZsK6iCb/M2KTLlenwRgwHJwpa0+ehjl6kdLzrgRaOViEEq
 LOoIgA9MJ4sMOzGRGtqZP4/5qXbFM4LLKR9K3x1ty6G/zHqQCM97Z/8OZYqF0j3eDGRW
 LF4k8UH14p6RjsuQv/kax6K/cxY2Pt8IZ5C+BDndEKeMyCoKIZf1BPI/T1pbEv4uKx5i
 oGT6quFy2XXF8JnqY1YKfz6Tksu8rslMOpxCgOSe/cia6GHXwzSDbdpxUt5BarBlDakR
 hgkw==
X-Gm-Message-State: AO0yUKUQwnLDus8F6cbEWv8JeXSq3jBdnLOQFt7/Z6NpMn+q0WQVrwMs
 FC5fEuhS5kQNiUQG0PitYk69MQ==
X-Google-Smtp-Source: AK7set99slTHN8Ys2Ho/Zkl3mIoJOgXwtng3qTFdpiAMFgEoKSKkZxELB2zxMVI6MnzF6KZglSretw==
X-Received: by 2002:a17:907:7e98:b0:872:6bd0:d2b with SMTP id
 qb24-20020a1709077e9800b008726bd00d2bmr26044722ejc.45.1676134048911; 
 Sat, 11 Feb 2023 08:47:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm4028609ejc.208.2023.02.11.08.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 08:47:28 -0800 (PST)
Message-ID: <8b6f0398-9a5a-d4e4-cd78-b06aaef46b68@linaro.org>
Date: Sat, 11 Feb 2023 18:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/10] drm/msm/dpu: Add SM6375 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-8-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211122656.1479141-8-konrad.dybcio@linaro.org>
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
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2023 14:26, Konrad Dybcio wrote:
> Add basic SM6375 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 120 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                |   1 +
>   4 files changed, 123 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ba0bc795e5ff..327aa21f01fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -383,6 +383,24 @@ static const struct dpu_caps sm6350_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm6375_dpu_caps = {
> +	.max_mixer_width = 2048,

It looks like we got this wrong for sm6115, I

> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,

QSEED4

v3lite with the version >= 3.0 is v4. We should rework this to be more 
sensible and easy to support.

> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	/*
> +	 * There is *NO* 3DMERGE hw, but we *need* to set this property to true,
> +	 * because SM6375 includes newer hardware that requires a different reset
> +	 * sequence and it is executed based on this confusingly named variable..
> +	 */
> +	.has_3d_merge = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sm8150_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -592,6 +610,19 @@ static const struct dpu_mdp_cfg sm6350_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm6375_mdp[] = {

sm6116_mdp ?

> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x1,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +		.reg_off = 0x2ac, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +		.reg_off = 0x2ac, .bit_off = 8},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -1577,6 +1608,19 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
>   		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>   };
>   
> +static const struct dpu_lm_sub_blks sm6375_lm_sblk = {

qcm2290_lm_sblk after we fix the width there.

> +	.maxwidth = 2048,
> +	.maxblendstages = 4, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		0x20, 0x38, 0x50, 0x68
> +	},
> +};
> +
> +static const struct dpu_lm_cfg sm6375_lm[] = {

qcm2290_lm

> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> +		&sm6375_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
>   /* SM8150 */
>   
>   static const struct dpu_lm_cfg sm8150_lm[] = {
> @@ -1984,6 +2028,11 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
>   	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>   };
>   
> +static const struct dpu_intf_cfg sm6375_intf[] = {

ack, size difference from sm6115/qcm2290

> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
>   static const struct dpu_intf_cfg sm8150_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -2171,6 +2220,26 @@ static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
>   	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
>   };
>   
> +static const struct dpu_vbif_cfg sm6375_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_RT,
> +	.base = 0, .len = 0x2008,

Ugh

> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x40,
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
>   static const struct dpu_reg_dma_cfg sdm845_regdma = {
>   	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
>   };
> @@ -2460,6 +2529,34 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg sm6375_perf_data = {
> +	.max_bw_low = 5200000,
> +	.max_bw_high = 6200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
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
> @@ -2804,6 +2901,28 @@ static const struct dpu_mdss_cfg sm6350_dpu_cfg = {
>   	.mdss_irqs = IRQ_SC7180_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sm6375_dpu_cfg = {
> +	.caps = &sm6350_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm6375_mdp),
> +	.mdp = sm6375_mdp,
> +	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +	.ctl = qcm2290_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6115_sspp),
> +	.sspp = sm6115_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6375_lm),
> +	.mixer = sm6375_lm,
> +	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +	.dspp = qcm2290_dspp,
> +	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +	.pingpong = qcm2290_pp,
> +	.intf_count = ARRAY_SIZE(sm6375_intf),
> +	.intf = sm6375_intf,
> +	.vbif_count = ARRAY_SIZE(sm6375_vbif),
> +	.vbif = sm6375_vbif,
> +	.perf = &sm6375_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>   	.caps = &sm8150_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> @@ -3049,6 +3168,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_640, .dpu_cfg = &sm6350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_690, .dpu_cfg = &sm6375_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cbf21613e121..a22b5965acfe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -47,6 +47,7 @@
>   #define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>   #define DPU_HW_VER_640	DPU_HW_VER(6, 4, 0) /* sm6350 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> +#define DPU_HW_VER_690	DPU_HW_VER(6, 9, 0) /* sm6375 */
>   #define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   #define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ebfbbd2d105e..fd561974a6b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1307,6 +1307,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-dpu", },
>   	{ .compatible = "qcom,sm6115-dpu", },
>   	{ .compatible = "qcom,sm6350-dpu", },
> +	{ .compatible = "qcom,sm6375-dpu", },
>   	{ .compatible = "qcom,sm8150-dpu", },
>   	{ .compatible = "qcom,sm8250-dpu", },
>   	{ .compatible = "qcom,sm8350-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 841016f3983a..fedc1a1fc289 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c

Please split to the separate patch

> @@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-mdss" },
>   	{ .compatible = "qcom,sm6115-mdss" },
>   	{ .compatible = "qcom,sm6350-mdss" },
> +	{ .compatible = "qcom,sm6375-mdss" },

Missing UBWC setup.

>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
>   	{ .compatible = "qcom,sm8350-mdss" },

-- 
With best wishes
Dmitry

