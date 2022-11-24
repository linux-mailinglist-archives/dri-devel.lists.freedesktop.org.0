Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C702636EE1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB04A10E669;
	Thu, 24 Nov 2022 00:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EF910E669
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:19:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id t10so334687ljj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZejUihPyJi5uFCGHrBzNO4EWo8XFZCAns+rd9g32pUM=;
 b=ag7A48mm2QjXFmhFfCW63ch9xxLA5CtmlMvYIqCf7cDxzYvIFHNrYjNBcOrsfGC3T1
 /HjI/iMGmjY015iCLS9w2qU5xfXgZCyEXSi9zScgFHspswOPJNWhDjtxMqhiTtchfs4D
 tv2IzoAtJ+a6yN7V/RVQCcxL/y9ss+5sat5/2Goezm7DKQ3ch/0NDBbjf/haI/SIMj5T
 +X7vSbboU7xSL7szg2oofm99+i2tTKM033NkblzF7MmXLDtS0Ux0RJtOJf2eDUZXFdmw
 uxhJh7VpoxK4sKhoRZHHpYe+fguSINDGwMEmrDOnMmK4tsrnAUkuz7IAcIGB9sWfDVnz
 leCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZejUihPyJi5uFCGHrBzNO4EWo8XFZCAns+rd9g32pUM=;
 b=MTod5dxkFCrnRDVrj6aMeqEQT2BgmTfidR1SlkGu/eiMn4TrASdr8kptIKdjZnKlLZ
 d6DnO9O5QKuMtj6yC5/3dRscP8NwDpmdplY4dVX358PkLmaKertB+2XkoQhsZYO5iAhw
 GsqQul4FTpQZavMZWLNutAgeityX56kP50GP/DFqkkKm0DMzyKHuzJwW3rLmQjxJfRMc
 w1rnx51BhRhOpGbgrrKRQMEGrUgTTaV9SBHDVbdLEKYmE+7PKCGyhQovZV0+qZmq61D1
 bUrGcQsDDGP1ahtXybgVgVIC6bCug3oapF48K45h9Bv1Jdm35fL/XWCclciUJzwC080G
 pbVQ==
X-Gm-Message-State: ANoB5pnm6+zzY6Y14K9hCosvv+QMjZ7utcbizNI3hWvrjxBk/pNTtLfG
 AbQ9PZHhIdx++uC5RGF4DiFPaZ0fBD5cd1ra
X-Google-Smtp-Source: AA0mqf5K//gFyF4qm5Al/mBOr1aB/eBQHMGuiDTzO6b6U30wsNJRexrsVmkzmS75Gg+iDuXCVjaTkw==
X-Received: by 2002:a2e:9d4:0:b0:279:7ff6:3162 with SMTP id
 203-20020a2e09d4000000b002797ff63162mr765357ljj.250.1669249147360; 
 Wed, 23 Nov 2022 16:19:07 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl.
 [95.49.32.48]) by smtp.gmail.com with ESMTPSA id
 a17-20020a2e9811000000b0026dc7b59d8esm2400057ljj.22.2022.11.23.16.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 16:19:06 -0800 (PST)
Message-ID: <0b9cd489-572c-e29c-0fc1-4cb960500b68@linaro.org>
Date: Thu, 24 Nov 2022 01:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] drm/msm/disp/dpu1: add support for display on
 SM6115
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221124001708.25720-1-a39.skl@gmail.com>
 <20221124001708.25720-3-a39.skl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221124001708.25720-3-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, phone-devel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jason Wang <wangborong@cdjrlc.com>, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.11.2022 01:16, Adam Skladowski wrote:
> Add required display hw catalog changes for SM6115.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 87 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 +
>  drivers/gpu/drm/msm/msm_mdss.c                |  5 ++
>  4 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3934d8976833..b4ca123d8e69 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -330,6 +330,18 @@ static const struct dpu_caps sc7180_dpu_caps = {
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
>  
> +static const struct dpu_caps sm6115_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>  static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> @@ -498,6 +510,19 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>  	},
>  };
>  
> +static const struct dpu_mdp_cfg sm6115_mdp[] = {
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
>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -941,6 +966,16 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>  
> +static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
> +				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
> +
> +static const struct dpu_sspp_cfg sm6115_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
> +		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> @@ -1757,6 +1792,35 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>  	.bw_inefficiency_factor = 120,
>  };
>  
> +static const struct dpu_perf_cfg sm6115_perf_data = {
> +	.max_bw_low = 3100000,
> +	.max_bw_high = 4000000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xff, 0xffff, 0x0},
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
>  static const struct dpu_perf_cfg sm8150_perf_data = {
>  	.max_bw_low = 12800000,
>  	.max_bw_high = 12800000,
> @@ -1998,6 +2062,28 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
>  	.mdss_irqs = IRQ_SC7180_MASK,
>  };
>  
> +static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
> +	.caps = &sm6115_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm6115_mdp),
> +	.mdp = sm6115_mdp,
> +	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +	.ctl = qcm2290_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6115_sspp),
> +	.sspp = sm6115_sspp,
> +	.mixer_count = ARRAY_SIZE(qcm2290_lm),
> +	.mixer = qcm2290_lm,
> +	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +	.dspp = qcm2290_dspp,
> +	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +	.pingpong = qcm2290_pp,
> +	.intf_count = ARRAY_SIZE(qcm2290_intf),
> +	.intf = qcm2290_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6115_perf_data,
> +	.mdss_irqs = IRQ_SC7180_MASK,
> +};
> +
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.caps = &sm8150_dpu_caps,
>  	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> @@ -2158,6 +2244,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>  	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index aa6c9ca99221..29e7ea5840a2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -44,6 +44,7 @@
>  #define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
>  #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>  #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> +#define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>  #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>  #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>  #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 69a86e87685c..38e63b19d930 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1299,6 +1299,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-dpu", },
>  	{ .compatible = "qcom,sc7280-dpu", },
>  	{ .compatible = "qcom,sc8180x-dpu", },
> +	{ .compatible = "qcom,sm6115-dpu", },
>  	{ .compatible = "qcom,sm8150-dpu", },
>  	{ .compatible = "qcom,sm8250-dpu", },
>  	{ .compatible = "qcom,sm8450-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 5602fbaf6e0e..144c8dd82be1 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -280,6 +280,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  		/* UBWC_2_0 */
>  		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>  		break;
> +	case DPU_HW_VER_630:
> +		/* UBWC_2_0 */
> +		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
> +		break;
>  	case DPU_HW_VER_720:
>  		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>  		break;
> @@ -513,6 +517,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7280-mdss" },
>  	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sm6115-mdss" },
>  	{ .compatible = "qcom,sm8150-mdss" },
>  	{ .compatible = "qcom,sm8250-mdss" },
>  	{ .compatible = "qcom,sm8450-mdss" },
