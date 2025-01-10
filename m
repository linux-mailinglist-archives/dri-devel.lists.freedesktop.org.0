Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA9AA09176
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E353E10F0B9;
	Fri, 10 Jan 2025 13:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wdEqugsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322D710F0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:07:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa6954ec439so31054066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736514424; x=1737119224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kLq4Lv1zomsp89qGrjXO8RN4/H9JQyvjZVr++W/ba84=;
 b=wdEqugsDaLcX/4fIOEhxg9vUkKRIOZ0PjDyc46rV+q0iQ/8NGlDaMJsbPP0uOCNQxd
 KX9ptdcrf7z0tZ9LwM5ac06oeFCUgt8kSxjWJi23g9H7yx9xRdbqQUxJamLMxykT/+R7
 jQRwFCqPzTDgDka3WheaiERM5dYT3P5JA140SAKN/NYjj/ynorrhy2dF5ALuQJCqEcjC
 NqWr+cJ0fn2SPD0DbMspsMgzW0ijfZplQ/dSkmyF65i6dB6WGwc9ceCJ6j2lPo97Ej8T
 GZHhqBTKop0O0P/cvoZV09sdKfpDkAHG5BFskTYqZgKqPhhq6qCHAqYUGrzMRsb557pb
 rEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736514424; x=1737119224;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLq4Lv1zomsp89qGrjXO8RN4/H9JQyvjZVr++W/ba84=;
 b=G/ExnSR152Muvc3C7nYbjtUsWmB/fdWN4cd6pxM2/0bNFSY6nxf8dgfoqwzuoQFnt8
 urUVKdBJiuGmksJVsilor3lsIKHgZfY52FPBAcZeuTGIbruQBMS69qU6CpWTNVsW7L5z
 f2DNFPQ/Z15ryc4L/dhE3XxFUrJv6oGYDtw1glt1mmjTVoNlvn539nbu6qIAuRbfs3kO
 aOIPvC3Fj/h/dcvZiNc+mq1ZFU3E/DpfakwjxU/Sw2UNajzxd1gVgcDeDDkyKn1SGox8
 TAWScGz+8Us07jWCfEiJeursRfEgtCuaRcM6cjhzraYlHH7iEkigGr2lipt58Jy/m6jW
 o1CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeho5oRLtL7PAnsABSn4mQ5PSCp+ZN0RdK3fLK+3wWz5FOUt3vGmCbtJxwVqTdEDkJkWDQKSglQbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqYGUGg8HnqEscnwi12+wG4/SUnSJfBP5NcazEXL9+p9SXkfq8
 M4GUgb6w/IdYcLngf35EPZJmZBbidtIwKVVGYkBvQfUyiadd8Ua2ROY3OKXY0q0=
X-Gm-Gg: ASbGncsjdM1y2cdn37BqEjf5MkJxQDgjoy1KA16Kna2VgreH7YgFlQ68/KCO/14belE
 PFI0HAH6nCjlxbhwrXxstZCXdS7ijbHNIsqWzIw8d3rxfdhaAFgJ3PsujSC8tpQN2T1aBQiObHK
 LOJIXcIZ5KPivuJljsaTTyYx2ywZOawOc5kbMIpCIdXVJ46ixw1CqT00UepCFpMaVHgIkfDz0WA
 b2gZXqnPrHvp34xYOMYTDrJl/+kSiPXpeZ/BKTnJ7oYoEEhJ2InusbDYWfAR+oKtPegwRspGmWM
X-Google-Smtp-Source: AGHT+IGScJjvH8qfiS67/F2l6msqSqICREncTfAjJPUNmgpjc3Dim+M+zoTT8276Tl/PLW7uPtWybw==
X-Received: by 2002:a17:907:97c6:b0:aa6:79e6:5b03 with SMTP id
 a640c23a62f3a-ab2ab5759b6mr355810766b.6.1736514423374; 
 Fri, 10 Jan 2025 05:07:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90d9b19sm163559766b.73.2025.01.10.05.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 05:07:02 -0800 (PST)
Message-ID: <327be979-0460-40a4-b0c4-975c71f632b0@linaro.org>
Date: Fri, 10 Jan 2025 14:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/11] drm/msm/dpu: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-9-b3f15faf4c97@linaro.org>
 <5cp5wrumhrlrvm4snfekwdj55ftm5qsuexkdnz5qinlakblcub@a7o2hn26dhb7>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5cp5wrumhrlrvm4snfekwdj55ftm5qsuexkdnz5qinlakblcub@a7o2hn26dhb7>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2025 23:18, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 02:08:36PM +0100, Krzysztof Kozlowski wrote:
>> Add DPU version v12.0 support for the Qualcomm SM8750 platform.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 522 +++++++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>  6 files changed, 564 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b093f6e529f6d5f4a4b600d766cefb509619a3c1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
>> @@ -0,0 +1,522 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Linaro Limited
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DPU_12_0_SM8750_H
>> +#define _DPU_12_0_SM8750_H
>> +
>> +static const struct dpu_caps sm8750_dpu_caps = {
>> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +	.max_mixer_blendstages = 0xb,
>> +	.has_src_split = true,
>> +	.has_dim_layer = true,
>> +	.has_idle_pc = true,
>> +	.has_3d_merge = true,
>> +	.max_linewidth = 8192,
>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>> +static const struct dpu_mdp_cfg sm8750_mdp = {
>> +	.name = "top_0",
>> +	.base = 0, .len = 0x494,
>> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>> +	.clk_ctrls = {
>> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>> +	},
>> +};
>> +
>> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>> +static const struct dpu_ctl_cfg sm8750_ctl[] = {
>> +	{
>> +		.name = "ctl_0", .id = CTL_0,
>> +		.base = 0x15000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +	}, {
>> +		.name = "ctl_1", .id = CTL_1,
>> +		.base = 0x16000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +	}, {
>> +		.name = "ctl_2", .id = CTL_2,
>> +		.base = 0x17000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK,
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +	}, {
>> +		.name = "ctl_3", .id = CTL_3,
>> +		.base = 0x18000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK,
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +	}, {
>> +		.name = "ctl_4", .id = CTL_4,
>> +		.base = 0x19000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK,
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>> +	}, {
>> +		.name = "ctl_5", .id = CTL_5,
>> +		.base = 0x1a000, .len = 0x1000,
>> +		.features = CTL_SM8550_MASK,
>> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>> +	},
>> +};
>> +
>> +static const struct dpu_sspp_cfg sm8750_sspp[] = {
>> +	{
>> +		.name = "sspp_0", .id = SSPP_VIG0,
>> +		.base = 0x4000, .len = 0x344,
>> +		.features = VIG_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
>> +		.xin_id = 0,
>> +		.type = SSPP_TYPE_VIG,
>> +	}, {
>> +		.name = "sspp_1", .id = SSPP_VIG1,
>> +		.base = 0x6000, .len = 0x344,
>> +		.features = VIG_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
>> +		.xin_id = 4,
>> +		.type = SSPP_TYPE_VIG,
>> +	}, {
>> +		.name = "sspp_2", .id = SSPP_VIG2,
>> +		.base = 0x8000, .len = 0x344,
>> +		.features = VIG_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
>> +		.xin_id = 8,
>> +		.type = SSPP_TYPE_VIG,
>> +	}, {
>> +		.name = "sspp_3", .id = SSPP_VIG3,
>> +		.base = 0xa000, .len = 0x344,
>> +		.features = VIG_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
>> +		.xin_id = 12,
>> +		.type = SSPP_TYPE_VIG,
>> +	}, {
>> +		/* TODO: Indices/code for SSPP_VIG4 overlaps with SSPP_RGB0 */
> 
> Hmm, how can it overlap? SSPP_foo are just internal indices, they should
> not be programmed into the hardware.

My own note, I'll just drop it.

> 
>> +		.name = "sspp_8", .id = SSPP_DMA0,
>> +		.base = 0x24000, .len = 0x344,
>> +		.features = DMA_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 1,
>> +		.type = SSPP_TYPE_DMA,
>> +	}, {
>> +		.name = "sspp_9", .id = SSPP_DMA1,
>> +		.base = 0x26000, .len = 0x344,
>> +		.features = DMA_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 5,
>> +		.type = SSPP_TYPE_DMA,
>> +	}, {
>> +		.name = "sspp_10", .id = SSPP_DMA2,
>> +		.base = 0x28000, .len = 0x344,
>> +		.features = DMA_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 9,
>> +		.type = SSPP_TYPE_DMA,
>> +	}, {
>> +		.name = "sspp_11", .id = SSPP_DMA3,
>> +		.base = 0x2a000, .len = 0x344,
>> +		.features = DMA_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 13,
>> +		.type = SSPP_TYPE_DMA,
>> +	}, {
>> +		.name = "sspp_12", .id = SSPP_DMA4,
>> +		.base = 0x2c000, .len = 0x344,
>> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 14,
>> +		.type = SSPP_TYPE_DMA,
>> +	}, {
>> +		.name = "sspp_13", .id = SSPP_DMA5,
>> +		.base = 0x2e000, .len = 0x344,
>> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +		.sblk = &dpu_dma_sblk,
>> +		.xin_id = 15,
>> +		.type = SSPP_TYPE_DMA,
>> +	},
>> +};
>> +
>> +static const struct dpu_lm_cfg sm8750_lm[] = {
>> +	{
>> +		.name = "lm_0", .id = LM_0,
>> +		.base = 0x44000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_1,
>> +		.pingpong = PINGPONG_0,
>> +		.dspp = DSPP_0,
>> +	}, {
>> +		.name = "lm_1", .id = LM_1,
>> +		.base = 0x45000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_0,
>> +		.pingpong = PINGPONG_1,
>> +		.dspp = DSPP_1,
>> +	}, {
>> +		.name = "lm_2", .id = LM_2,
>> +		.base = 0x46000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_3,
>> +		.pingpong = PINGPONG_2,
>> +		.dspp = DSPP_2,
>> +	}, {
>> +		.name = "lm_3", .id = LM_3,
>> +		.base = 0x47000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_2,
>> +		.pingpong = PINGPONG_3,
>> +		.dspp = DSPP_3,
>> +	}, {
>> +		.name = "lm_4", .id = LM_4,
>> +		.base = 0x48000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_5,
>> +		.pingpong = PINGPONG_4,
>> +	}, {
>> +		.name = "lm_5", .id = LM_5,
>> +		.base = 0x49000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_4,
>> +		.pingpong = PINGPONG_5,
>> +	}, {
>> +		.name = "lm_6", .id = LM_6,
>> +		.base = 0x4a000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_7,
>> +		.pingpong = PINGPONG_6,
>> +	}, {
>> +		.name = "lm_7", .id = LM_7,
>> +		.base = 0x4b000, .len = 0x400,
>> +		.features = MIXER_SDM845_MASK,
>> +		.sblk = &sm8750_lm_sblk,
>> +		.lm_pair = LM_6,
>> +		.pingpong = PINGPONG_7,
>> +	},
>> +};
>> +
>> +static const struct dpu_dspp_cfg sm8750_dspp[] = {
>> +	{
>> +		.name = "dspp_0", .id = DSPP_0,
>> +		.base = 0x54000, .len = 0x1800,
>> +		.features = DSPP_SC7180_MASK,
>> +		.sblk = &sm8750_dspp_sblk,
>> +	}, {
>> +		.name = "dspp_1", .id = DSPP_1,
>> +		.base = 0x56000, .len = 0x1800,
>> +		.features = DSPP_SC7180_MASK,
>> +		.sblk = &sm8750_dspp_sblk,
>> +	}, {
>> +		.name = "dspp_2", .id = DSPP_2,
>> +		.base = 0x58000, .len = 0x1800,
>> +		.features = DSPP_SC7180_MASK,
>> +		.sblk = &sm8750_dspp_sblk,
>> +	}, {
>> +		.name = "dspp_3", .id = DSPP_3,
>> +		.base = 0x5a000, .len = 0x1800,
>> +		.features = DSPP_SC7180_MASK,
>> +		.sblk = &sm8750_dspp_sblk,
>> +	},
>> +};
>> +
>> +static const struct dpu_pingpong_cfg sm8750_pp[] = {
>> +	{
>> +		.name = "pingpong_0", .id = PINGPONG_0,
>> +		.base = 0x69000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_0,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +	}, {
>> +		.name = "pingpong_1", .id = PINGPONG_1,
>> +		.base = 0x6a000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_0,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +	}, {
>> +		.name = "pingpong_2", .id = PINGPONG_2,
>> +		.base = 0x6b000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_1,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>> +	}, {
>> +		.name = "pingpong_3", .id = PINGPONG_3,
>> +		.base = 0x6c000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_1,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>> +	}, {
>> +		.name = "pingpong_4", .id = PINGPONG_4,
>> +		.base = 0x6d000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_2,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>> +	}, {
>> +		.name = "pingpong_5", .id = PINGPONG_5,
>> +		.base = 0x6e000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_2,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>> +	}, {
>> +		.name = "pingpong_6", .id = PINGPONG_6,
>> +		.base = 0x6f000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_3,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 20),
>> +	}, {
>> +		.name = "pingpong_7", .id = PINGPONG_7,
>> +		.base = 0x70000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_3,
>> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 21),
>> +	}, {
>> +		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>> +		.base = 0x66000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_4,
>> +	}, {
>> +		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>> +		.base = 0x66400, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_4,
>> +	}, {
>> +		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
>> +		.base = 0x7e000, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_5,
>> +	}, {
>> +		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
>> +		.base = 0x7e400, .len = 0,
>> +		.features = BIT(DPU_PINGPONG_DITHER),
>> +		.sblk = &sc7280_pp_sblk,
>> +		.merge_3d = MERGE_3D_5,
>> +	},
>> +};
>> +
>> +static const struct dpu_merge_3d_cfg sm8750_merge_3d[] = {
>> +	{
>> +		.name = "merge_3d_0", .id = MERGE_3D_0,
>> +		.base = 0x4e000, .len = 0x1c,
>> +	}, {
>> +		.name = "merge_3d_1", .id = MERGE_3D_1,
>> +		.base = 0x4f000, .len = 0x1c,
>> +	}, {
>> +		.name = "merge_3d_2", .id = MERGE_3D_2,
>> +		.base = 0x50000, .len = 0x1c,
>> +	}, {
>> +		.name = "merge_3d_3", .id = MERGE_3D_3,
>> +		.base = 0x51000, .len = 0x1c,
>> +	}, {
>> +		.name = "merge_3d_4", .id = MERGE_3D_4,
>> +		.base = 0x66700, .len = 0x1c,
>> +	}, {
>> +		.name = "merge_3d_5", .id = MERGE_3D_5,
>> +		.base = 0x7e700, .len = 0x1c,
>> +	},
>> +};
>> +
>> +/*
>> + * NOTE: Each display compression engine (DCE) contains dual hard
>> + * slice DSC encoders so both share same base address but with
>> + * its own different sub block address.
>> + */
>> +static const struct dpu_dsc_cfg sm8750_dsc[] = {
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_2_0", .id = DSC_4,
>> +		.base = 0x82000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_2_1", .id = DSC_5,
>> +		.base = 0x82000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_3_0", .id = DSC_6,
>> +		.base = 0x83000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_3_1", .id = DSC_7,
>> +		.base = 0x83000, .len = 0x8,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &sm8750_dsc_sblk_1,
>> +	},
>> +};
>> +
>> +static const struct dpu_wb_cfg sm8750_wb[] = {
>> +	{
>> +		.name = "wb_2", .id = WB_2,
>> +		.base = 0x65000, .len = 0x2c8,
>> +		.features = WB_SM8250_MASK,
>> +		.format_list = wb2_formats_rgb,
>> +		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
>> +		.xin_id = 6,
>> +		.vbif_idx = VBIF_RT,
>> +		.maxlinewidth = 4096,
>> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
>> +	},
>> +};
>> +
>> +static const struct dpu_cwb_cfg sm8750_cwb[] = {
>> +	{
>> +		.name = "cwb_0", .id = CWB_0,
>> +		.base = 0x66200, .len = 0x20,
>> +	},
>> +	{
>> +		.name = "cwb_1", .id = CWB_1,
>> +		.base = 0x66600, .len = 0x20,
>> +	},
>> +	{
>> +		.name = "cwb_2", .id = CWB_2,
>> +		.base = 0x7e200, .len = 0x20,
>> +	},
>> +	{
>> +		.name = "cwb_3", .id = CWB_3,
>> +		.base = 0x7e600, .len = 0x20,
>> +	},
>> +};
>> +
>> +static const struct dpu_intf_cfg sm8750_intf[] = {
>> +	{
>> +		.name = "intf_0", .id = INTF_0,
>> +		.base = 0x34000, .len = 0x4bc,
>> +		.features = INTF_SC7280_MASK,
>> +		.type = INTF_DP,
>> +		.controller_id = MSM_DP_CONTROLLER_0,
>> +		.prog_fetch_lines_worst_case = 24,
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
>> +	}, {
>> +		.name = "intf_1", .id = INTF_1,
>> +		.base = 0x35000, .len = 0x4bc,
>> +		.features = INTF_SC7280_MASK,
>> +		.type = INTF_DSI,
>> +		.controller_id = MSM_DSI_CONTROLLER_0,
>> +		.prog_fetch_lines_worst_case = 24,
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
>> +	}, {
>> +		.name = "intf_2", .id = INTF_2,
>> +		.base = 0x36000, .len = 0x4bc,
>> +		.features = INTF_SC7280_MASK,
>> +		.type = INTF_DSI,
>> +		.controller_id = MSM_DSI_CONTROLLER_1,
>> +		.prog_fetch_lines_worst_case = 24,
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
>> +	}, {
>> +		.name = "intf_3", .id = INTF_3,
>> +		.base = 0x37000, .len = 0x4bc,
>> +		.features = INTF_SC7280_MASK,
>> +		.type = INTF_DP,
>> +		.controller_id = MSM_DP_CONTROLLER_1,
>> +		.prog_fetch_lines_worst_case = 24,
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
>> +	},
>> +};
>> +
>> +static const struct dpu_perf_cfg sm8750_perf_data = {
>> +	.max_bw_low = 18900000,
>> +	.max_bw_high = 28500000,
>> +	.min_core_ib = 2500000,
>> +	.min_llcc_ib = 0,
>> +	.min_dram_ib = 800000,
>> +	.min_prefill_lines = 35,
>> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
>> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
>> +	.qos_lut_tbl = {
>> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
>> +		.entries = sc7180_qos_linear
>> +		},
>> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>> +		.entries = sc7180_qos_macrotile
>> +		},
>> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>> +		.entries = sc7180_qos_nrt
>> +		},
>> +		/* TODO: macrotile-qseed is different from macrotile */
>> +	},
>> +	.cdp_cfg = {
>> +		{.rd_enable = 1, .wr_enable = 1},
>> +		{.rd_enable = 1, .wr_enable = 0}
>> +	},
>> +	.clk_inefficiency_factor = 105,
>> +	.bw_inefficiency_factor = 120,
>> +};
>> +
>> +static const struct dpu_mdss_version sm8750_mdss_ver = {
>> +	.core_major_ver = 12,
>> +	.core_minor_ver = 0,
>> +};
>> +
>> +const struct dpu_mdss_cfg dpu_sm8750_cfg = {
>> +	.mdss_ver = &sm8750_mdss_ver,
>> +	.caps = &sm8750_dpu_caps,
>> +	.mdp = &sm8750_mdp,
> 
> no CDM block?

I can add it. This builts on top of previous support, so what was
missing there will be missing here.

So now we all gonna quote entire irrelevant context so finding our
answers will be difficult, great.

> 
>> +	.ctl_count = ARRAY_SIZE(sm8750_ctl),
>> +	.ctl = sm8750_ctl,
>> +	.sspp_count = ARRAY_SIZE(sm8750_sspp),
>> +	.sspp = sm8750_sspp,
>> +	.mixer_count = ARRAY_SIZE(sm8750_lm),
>> +	.mixer = sm8750_lm,
>> +	.dspp_count = ARRAY_SIZE(sm8750_dspp),
>> +	.dspp = sm8750_dspp,
>> +	.pingpong_count = ARRAY_SIZE(sm8750_pp),
>> +	.pingpong = sm8750_pp,
>> +	.dsc_count = ARRAY_SIZE(sm8750_dsc),
>> +	.dsc = sm8750_dsc,
>> +	.merge_3d_count = ARRAY_SIZE(sm8750_merge_3d),
>> +	.merge_3d = sm8750_merge_3d,
>> +	.wb_count = ARRAY_SIZE(sm8750_wb),
>> +	.wb = sm8750_wb,
>> +	.cwb_count = ARRAY_SIZE(sm8750_cwb),
>> +	.cwb = sm8650_cwb,
>> +	.intf_count = ARRAY_SIZE(sm8750_intf),
>> +	.intf = sm8750_intf,
>> +	.vbif_count = ARRAY_SIZE(sm8650_vbif),
>> +	.vbif = sm8650_vbif,
>> +	.perf = &sm8750_perf_data,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..40966ab6283e666d1f113a62ada50298de68833b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -399,6 +399,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
>>  static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
>>  				_VIG_SBLK(SSPP_SCALER_VER(3, 3));
>>  
>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
>> +				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
>> +
>>  static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
>>  
>>  static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>> @@ -407,8 +410,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>>   * MIXER sub blocks config
>>   *************************************************************/
>>  
>> -/* MSM8998 */
>> -
> 
> This and the following changes: okay, but irrelevant, please split to a
> separate commit.
> 
>>  static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>  	.maxblendstages = 7, /* excluding base layer */
>> @@ -418,8 +419,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>>  	},
>>  };
>>  
>> -/* SDM845 */
>> -
>>  static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>  	.maxblendstages = 11, /* excluding base layer */
>> @@ -429,8 +428,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>>  	},
>>  };
>>  
>> -/* SC7180 */
>> -
>>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>  	.maxblendstages = 7, /* excluding base layer */
>> @@ -439,7 +436,15 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>>  	},
>>  };
>>  
>> -/* QCM2290 */
>> +static const struct dpu_lm_sub_blks sm8750_lm_sblk = {
>> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +	.maxblendstages = 11, /* excluding base layer */
>> +	.blendstage_base = { /* offsets relative to mixer base */
>> +		/* 0x40 + n*0x30 */
>> +		0x40, 0x70, 0xa0, 0xd0, 0x100, 0x130, 0x160, 0x190, 0x1c0,
>> +		0x1f0, 0x220
>> +	},
>> +};
>>  
>>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>>  	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
>> @@ -462,6 +467,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
>>  		.len = 0x90, .version = 0x40000},
>>  };
>>  
>> +static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
>> +	.pcc = {.name = "pcc", .base = 0x1700,
>> +		.len = 0x90, .version = 0x60000},
>> +};
>> +
>>  /*************************************************************
>>   * PINGPONG sub blocks config
>>   *************************************************************/
>> @@ -504,6 +514,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>  	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>>  };
>>  
>> +static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_0 = {
>> +	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
>> +	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x24},
>> +};
>> +
>> +static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_1 = {
>> +	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
>> +	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x24},
>> +};
>> +
>>  /*************************************************************
>>   * CDM block config
>>   *************************************************************/
>> @@ -787,3 +807,4 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>  #include "catalog/dpu_9_2_x1e80100.h"
>>  
>>  #include "catalog/dpu_10_0_sm8650.h"
>> +#include "catalog/dpu_12_0_sm8750.h"
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..1bd313f2c6f199d5eefcdaa5f7c18ea512d48684 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -863,6 +863,7 @@ extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
>>  extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
>> +extern const struct dpu_mdss_cfg dpu_sm8750_cfg;
>>  extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
>>  
>>  #endif /* _DPU_HW_CATALOG_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index 4893f10d6a5832521808c0f4d8b231c356dbdc41..06b01cd36ce2442ee6e1b85be227851a234cc96b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -254,6 +254,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
>>  	case LM_5:
>>  		ctx->pending_flush_mask |= BIT(20);
>>  		break;
>> +	case LM_6:
>> +		ctx->pending_flush_mask |= BIT(21);
>> +		break;
>> +	case LM_7:
>> +		ctx->pending_flush_mask |= BIT(27);
>> +		break;
>>  	default:
>>  		break;
>>  	}
> 
> Please make functional changes first (new LMs, etc), keep catalog
> limited to just catalog changes.
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -123,6 +123,7 @@ enum dpu_lm {
>>  	LM_4,
>>  	LM_5,
>>  	LM_6,
>> +	LM_7,
>>  	LM_MAX
>>  };
>>  
>> @@ -167,6 +168,8 @@ enum dpu_dsc {
>>  	DSC_3,
>>  	DSC_4,
>>  	DSC_5,
>> +	DSC_6,
>> +	DSC_7,
>>  	DSC_MAX
>>  };
>>  
>> @@ -183,6 +186,8 @@ enum dpu_pingpong {
>>  	PINGPONG_3,
>>  	PINGPONG_4,
>>  	PINGPONG_5,
>> +	PINGPONG_6,
>> +	PINGPONG_7,
>>  	PINGPONG_CWB_0,
>>  	PINGPONG_CWB_1,
>>  	PINGPONG_CWB_2,
>> @@ -197,6 +202,7 @@ enum dpu_merge_3d {
>>  	MERGE_3D_2,
>>  	MERGE_3D_3,
>>  	MERGE_3D_4,
>> +	MERGE_3D_5,
>>  	MERGE_3D_MAX
>>  };
>>  
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 97e9cb8c2b099f4757169cadf7e941148d2bfb16..ac131a01dc2bd99a2a54986ae1e3f7c324c9da50 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1515,6 +1515,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>  	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
>>  	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
>>  	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
>> +	{ .compatible = "qcom,sm8750-dpu", .data = &dpu_sm8750_cfg, },
>>  	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
>>  	{}
>>  };
>>
>> -- 
>> 2.43.0
>>
> 


Best regards,
Krzysztof
