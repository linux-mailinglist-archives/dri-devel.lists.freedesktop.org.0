Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B54AA6507
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D6E10E0AD;
	Thu,  1 May 2025 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h/GkVdL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2BB10E0AD;
 Thu,  1 May 2025 21:01:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2J9j029208;
 Thu, 1 May 2025 21:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n7QWNu952IhpFu4vnsdaRP469Zn20c6EgJECLb+C5TM=; b=h/GkVdL3sz/dNwOW
 Wo7XTnTizfeX7qTeZawn9Eo4pYaffQe8ZL7VltYPbyBVC1mnrhb/KFHmoumNCymp
 NZLiENwJO34gkccfuy/RgHaXTCmTDQ/dJqwOHEsEHovPsPnN+Daz6vV9SLZs51Y2
 dcGicPCYVKV+qkl0eWBcGUyygJgKwpf9mIG47V0zVDsz7Ocnixg3nokTvKD6oBG1
 WfTf4xQRnwzZ8CbpVtnJFwxysUX4jOekLs/jz1hapq6LSC9O3nb5TlvEzENDX7fH
 9BkwHnee3IwEAJZcoREBcMzLa2sDymRDEbddbgNyeYM0Kdf1psqelp9tuIzGo8i9
 wP+vqQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2eftk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 21:01:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541L116N020284
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 21:01:01 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 14:01:01 -0700
Message-ID: <b2b0b37a-e2b8-45dd-88a6-f4f54369f0c1@quicinc.com>
Date: Thu, 1 May 2025 14:01:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] drm/msm/dpu: add catalog entry for SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Bjorn
 Andersson" <andersson@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-8-442c905cb3a4@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250418-sar2130p-display-v5-8-442c905cb3a4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nIC8pPNmeoEHnFOmVPGuItjmVf6BU2lB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE1OSBTYWx0ZWRfX0yiXmgqkvV2K
 Rzddzg5O2hetPD2EX3SNoTI7OxTccaPv8CU/zoUR1g2uxmaNnRdf6NrXZ+QZ/KwX3aC/ufM6wMk
 l9aj8j8uA/NsWkqAM+yQAZMXcczmDp+pqdMXKcyz02WvNnKI2Hfms9cK2BE4JbSn5pczNQOhWJb
 X+wUEopf9x/MiIIgXF9VFsN7m4rWrBHW7nZr1XUVWqHTK7FwVA40/y2gKglIiu5GJBxA2l/J516
 Ciqgi9j7MWq8s7GraMgkVsXBC4BKBVwbrphswzLK4eiUnX1bW546kYJ7dW88kskr/I3Zgkt8PKz
 At7xKIPySs6HpimumwI8WoZxN5rJ8j7WfSBQy/3S5yRPpVtFTc0Bxayv1DAkWs4tb3U3RyT5FVH
 8mk/3m7lHnyy5e7T3FuBUOzNc3MYVQgfPw5l4M0OxDao8vYcyzwwrr6RJ3253s/tH8q8pXA3
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6813e10f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=usGIuRzjxdkP44uZQh4A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nIC8pPNmeoEHnFOmVPGuItjmVf6BU2lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010159
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



On 4/18/2025 12:50 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add DPU driver support for the Qualcomm SAR2130P platform. It is mostly
> the same as SM8550, minor differences in the CDP configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 437 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..22dd16c6e210e9520ecb7a851bee402032fa1ee2
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -0,0 +1,434 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_9_1_SAR2130P_H
> +#define _DPU_9_1_SAR2130P_H
> +
> +static const struct dpu_caps sar2130p_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 5120,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_mdp_cfg sar2130p_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
> +static const struct dpu_ctl_cfg sar2130p_ctl[] = {
> +	{
> +		.name = "ctl_0", .id = CTL_0,
> +		.base = 0x15000, .len = 0x290,
> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	}, {
> +		.name = "ctl_1", .id = CTL_1,
> +		.base = 0x16000, .len = 0x290,
> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	}, {
> +		.name = "ctl_2", .id = CTL_2,
> +		.base = 0x17000, .len = 0x290,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	}, {
> +		.name = "ctl_3", .id = CTL_3,
> +		.base = 0x18000, .len = 0x290,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	}, {
> +		.name = "ctl_4", .id = CTL_4,
> +		.base = 0x19000, .len = 0x290,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	}, {
> +		.name = "ctl_5", .id = CTL_5,
> +		.base = 0x1a000, .len = 0x290,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sar2130p_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_2,
> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_1", .id = SSPP_VIG1,
> +		.base = 0x6000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_2,
> +		.xin_id = 4,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_2", .id = SSPP_VIG2,
> +		.base = 0x8000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_2,
> +		.xin_id = 8,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_3", .id = SSPP_VIG3,
> +		.base = 0xa000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_2,
> +		.xin_id = 12,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_8", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_11", .id = SSPP_DMA3,
> +		.base = 0x2a000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 13,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_12", .id = SSPP_DMA4,
> +		.base = 0x2c000, .len = 0x344,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 14,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_13", .id = SSPP_DMA5,
> +		.base = 0x2e000, .len = 0x344,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 15,
> +		.type = SSPP_TYPE_DMA,
> +	},
> +};
> +
> +static const struct dpu_lm_cfg sar2130p_lm[] = {
> +	{
> +		.name = "lm_0", .id = LM_0,
> +		.base = 0x44000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_1,
> +		.pingpong = PINGPONG_0,
> +		.dspp = DSPP_0,
> +	}, {
> +		.name = "lm_1", .id = LM_1,
> +		.base = 0x45000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_0,
> +		.pingpong = PINGPONG_1,
> +		.dspp = DSPP_1,
> +	}, {
> +		.name = "lm_2", .id = LM_2,
> +		.base = 0x46000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_3,
> +		.pingpong = PINGPONG_2,
> +		.dspp = DSPP_2,
> +	}, {
> +		.name = "lm_3", .id = LM_3,
> +		.base = 0x47000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_2,
> +		.pingpong = PINGPONG_3,
> +		.dspp = DSPP_3,
> +	}, {
> +		.name = "lm_4", .id = LM_4,
> +		.base = 0x48000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_5,
> +		.pingpong = PINGPONG_4,
> +	}, {
> +		.name = "lm_5", .id = LM_5,
> +		.base = 0x49000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_4,
> +		.pingpong = PINGPONG_5,
> +	},
> +};
> +
> +static const struct dpu_dspp_cfg sar2130p_dspp[] = {
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sdm845_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sdm845_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sdm845_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sdm845_dspp_sblk,
> +	},
> +};
> +static const struct dpu_pingpong_cfg sar2130p_pp[] = {
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +	}, {
> +		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
> +		.base = 0x66000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +	}, {
> +		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
> +		.base = 0x66400, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +	},
> +};
> +
> +static const struct dpu_merge_3d_cfg sar2130p_merge_3d[] = {
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x8,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x8,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x8,
> +	}, {
> +		.name = "merge_3d_3", .id = MERGE_3D_3,
> +		.base = 0x66700, .len = 0x8,
> +	},
> +};
> +
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sar2130p_dsc[] = {
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x4,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x4,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x4,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x4,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_1,
> +	},
> +};
> +
> +static const struct dpu_wb_cfg sar2130p_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats_rgb_yuv,
> +		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
> +static const struct dpu_intf_cfg sar2130p_intf[] = {
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x300,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x280,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	},
> +};
> +
> +static const struct dpu_perf_cfg sar2130p_perf_data = {
> +	.max_bw_low = 13600000,
> +	.max_bw_high = 18200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 35,
> +	/* FIXME: lut tables */
> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
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
> +		{.rd_enable = 0, .wr_enable = 0},
> +		{.rd_enable = 0, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_version sar2130p_mdss_ver = {
> +	.core_major_ver = 9,
> +	.core_minor_ver = 1,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sar2130p_cfg = {
> +	.mdss_ver = &sar2130p_mdss_ver,
> +	.caps = &sar2130p_dpu_caps,
> +	.mdp = &sar2130p_mdp,
> +	.cdm = &dpu_cdm_5_x,
> +	.ctl_count = ARRAY_SIZE(sar2130p_ctl),
> +	.ctl = sar2130p_ctl,
> +	.sspp_count = ARRAY_SIZE(sar2130p_sspp),
> +	.sspp = sar2130p_sspp,
> +	.mixer_count = ARRAY_SIZE(sar2130p_lm),
> +	.mixer = sar2130p_lm,
> +	.dspp_count = ARRAY_SIZE(sar2130p_dspp),
> +	.dspp = sar2130p_dspp,
> +	.pingpong_count = ARRAY_SIZE(sar2130p_pp),
> +	.pingpong = sar2130p_pp,
> +	.dsc_count = ARRAY_SIZE(sar2130p_dsc),
> +	.dsc = sar2130p_dsc,
> +	.merge_3d_count = ARRAY_SIZE(sar2130p_merge_3d),
> +	.merge_3d = sar2130p_merge_3d,
> +	.wb_count = ARRAY_SIZE(sar2130p_wb),
> +	.wb = sar2130p_wb,
> +	.intf_count = ARRAY_SIZE(sar2130p_intf),
> +	.intf = sar2130p_intf,
> +	.vbif_count = ARRAY_SIZE(sm8550_vbif),
> +	.vbif = sm8550_vbif,
> +	.perf = &sar2130p_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 64265ca4656a04d8c5a1d9582d7124c7eb897099..ce8d88e1d8b8bc6dea893f13a0449315ac8d2841 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -759,7 +759,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   #include "catalog/dpu_8_4_sa8775p.h"
>   
>   #include "catalog/dpu_9_0_sm8550.h"
> -
> +#include "catalog/dpu_9_1_sar2130p.h"
>   #include "catalog/dpu_9_2_x1e80100.h"
>   
>   #include "catalog/dpu_10_0_sm8650.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..e9b627e02c8996c8fb611e8e333a35e7ce9b8373 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -841,6 +841,7 @@ extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
>   extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
>   extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
>   extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
> +extern const struct dpu_mdss_cfg dpu_sar2130p_cfg;
>   extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
>   extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
>   extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 3305ad0623ca41882db0172e65a9beb7ebe00b6c..1fd82b6747e9058ce11dc2620729921492d5ebdd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1512,6 +1512,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
>   	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
>   	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
> +	{ .compatible = "qcom,sar2130p-dpu", .data = &dpu_sar2130p_cfg, },
>   	{ .compatible = "qcom,sdm630-mdp5", .data = &dpu_sdm630_cfg, },
>   	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
>   	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
> 

