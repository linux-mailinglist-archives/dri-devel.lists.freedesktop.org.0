Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920817BBB35
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1AD10E514;
	Fri,  6 Oct 2023 15:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52B510E516
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:05:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-505748580ceso2838538e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696604756; x=1697209556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z/YM/EjNdslSL44Lb2inatDCEteQg+t3sdC+S45069w=;
 b=d5p/1lemcHi0z/BG5qukuK9qjSqBgNE9CMySGD+onm9jWkXmd8P4MrbCxm8YOfFSgp
 4jbTv+XoUyZac7Eg9jR5r3XKUEHnmZg3HiuUS+d065SKtirBEXLx1tNIQJGMBQuysuMA
 4tsbdwGkjMRf2FnEVPhaXxL+TuYwmWMC5ZqX9eNonc67MVgeUWRf6GtxMDTwl3L8oxTU
 Ni1bAGbkJ8p+M9St/c4YpXnmyR5rvfYzuMbpbA6H5iMP7ORXAe8nCgT2NJJrRUiz31DT
 kmHOBWqznQ2T36R2Vc210v0NqOZQtd8J/evdOGS0HL7+9pQn65XjkI90zEhZW8BszBCc
 Ofcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696604756; x=1697209556;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/YM/EjNdslSL44Lb2inatDCEteQg+t3sdC+S45069w=;
 b=NE+HEy3AHpWkRMDukB3UWMcbe338P085ELlOMo+8i/7Ma0ZiiXVeDIoxg/5xx2gUW4
 r/g+PyyqgmUbajuFxAacMhm9jND66PQadYdXTJjZLvj8Q0MOPoEByWMdkQ/JMSrTraoj
 cgqtEPe2T6DOxa4ctX+N+LIlddpc9XSNwdXUNZ4J6lJ5eteLG/VfrFI3GnjNTjZWsc/E
 k/5n+K/Q/ifcmI/s2Mmw/pKk9O/xgtRw4jB8+P4fIAoH8JfTnBB6nGw+TWjtETNWW4FA
 jxFHno13ifD4j33zbovVSDwnQMm6E8QUCXRzGVJhlk2WD+7x4kOaY7UxrXWFmVn1Xdja
 x8AQ==
X-Gm-Message-State: AOJu0YzTHJkCSQ69cbq1E7Eh5WQF9p4NVGDntTncgY1Fqoz0qbS2/LiO
 /MM+G7LQUNnzHUjsoVG/8V754Q==
X-Google-Smtp-Source: AGHT+IGCsvAMDn7onmNS2NzBO9aEF59iz+Q4fUYIdIWd/nkH9iaot3VnXscfCfjkSDuHGkqbEcTVWQ==
X-Received: by 2002:a19:9104:0:b0:503:1910:711b with SMTP id
 t4-20020a199104000000b005031910711bmr7188192lfd.56.1696604755711; 
 Fri, 06 Oct 2023 08:05:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a056512209800b005068dab881csm49998lfr.17.2023.10.06.08.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 08:05:55 -0700 (PDT)
Message-ID: <7a786472-3a54-467a-9183-3315e217024e@linaro.org>
Date: Fri, 6 Oct 2023 18:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Content-Language: en-GB
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin
 <liushixin2@huawei.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-14-mailingradian@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231003012119.857198-14-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/10/2023 04:21, Richard Acayan wrote:
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
> 
> Since revision 4.0 is SDM845, reuse some configuration from its catalog
> entry.
> 
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   6 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   4 files changed, 112 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> new file mode 100644
> index 000000000000..01a9aec1c956
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023, Richard Acayan. All rights reserved.
> + */
> +
> +#ifndef _DPU_4_1_SDM670_H
> +#define _DPU_4_1_SDM670_H
> +
> +static const struct dpu_mdp_cfg sdm670_mdp = {
> +	.name = "top_0",
> +	.base = 0x0, .len = 0x45c,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sdm670_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1c8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &sdm670_vig_sblk_0,

Could you please rebase you patch on top of 
https://patchwork.freedesktop.org/series/119804/

That patchset removes the need for per-SoC, per-SSPP sblk structures.

I'm mostly sure that sdm670 has scaler version 1.3 (the same as sdm845), 
but you can verify this by reading the register 0x0ae05a00.

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_1", .id = SSPP_VIG1,
> +		.base = 0x6000, .len = 0x1c8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &sdm670_vig_sblk_1,
> +		.xin_id = 4,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_8", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x1c8,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_0,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA0,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x1c8,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_1,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA1,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x1c8,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &sdm845_dma_sblk_2,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA2,
> +	},
> +};
> +
> +static const struct dpu_dsc_cfg sdm670_dsc[] = {
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x140,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x140,
> +	},
> +};
> +
> +static const struct dpu_mdss_version sdm670_mdss_ver = {
> +	.core_major_ver = 4,
> +	.core_minor_ver = 1,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sdm670_cfg = {
> +	.mdss_ver = &sdm670_mdss_ver,
> +	.caps = &sdm845_dpu_caps,
> +	.mdp = &sdm670_mdp,
> +	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> +	.ctl = sdm845_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm670_sspp),
> +	.sspp = sdm670_sspp,
> +	.mixer_count = ARRAY_SIZE(sdm845_lm),
> +	.mixer = sdm845_lm,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.dsc_count = ARRAY_SIZE(sdm670_dsc),
> +	.dsc = sdm670_dsc,
> +	.intf_count = ARRAY_SIZE(sdm845_intf),
> +	.intf = sdm845_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),

We were duplicating the data for different platforms, even if they 
looked similar, it was not obvious what is the actual level of 
similarity. Nevertheless, for the sdm670 / sdm845 pair I think this 
looks good. Especially since we do not expect other DPU 4.x platforms.

> +	.vbif = sdm845_vbif,
> +	.perf = &sdm845_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..63b274ae032a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -313,6 +313,11 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>   	.rot_format_list = rotation_v2_formats,
>   };
>   
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_0 =
> +				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_1 =
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
> +
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
>   				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> @@ -655,6 +660,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_3_0_msm8998.h"
>   
>   #include "catalog/dpu_4_0_sdm845.h"
> +#include "catalog/dpu_4_1_sdm670.h"
>   
>   #include "catalog/dpu_5_0_sm8150.h"
>   #include "catalog/dpu_5_1_sc8180x.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6c9634209e9f..dae5a1555e44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -831,6 +831,7 @@ struct dpu_mdss_cfg {
>   
>   extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
>   extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
> +extern const struct dpu_mdss_cfg dpu_sdm670_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
>   extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>   extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa6ba2cf4b84..0049fb1de1e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1362,6 +1362,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
>   	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
> +	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
>   	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
>   	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
>   	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },

-- 
With best wishes
Dmitry

