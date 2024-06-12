Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC54E905BA1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 21:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5227E10E903;
	Wed, 12 Jun 2024 19:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cPj1sBiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B3510E076
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:05:07 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52c4b92c09bso394200e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718219106; x=1718823906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mVn0gUr8jwuVMGQACKErKUFq31rOO6g1SOd15vC3Cks=;
 b=cPj1sBiPZgfa8FGAa5Pf97VTFR+7Ethupzxl98PaBA01um5QK4zK9OPER4Nqv/Ddzc
 77E/VFA2ext+iGNwim3uXplEEMPCIZkwL1f/niUsrYctkETRvsebhtMUFYwQ4heYI/bO
 NnZ2zBefegMRcbA6ucPIY/PICP5ntm4FnX4vUd0gVJRT1/4DJTLn7ZqdWWU/xNuHoOl+
 U6KnSCpK2aZJxn0xnVsJCeRJ+jGUpYgqeYwf6dukai/ILRpbpUdhJbyWg9HIMn1u4DPg
 fkGqk4dFux4SFXWyP2gJwOr7zwbFX01IjcKQAEWQwAogjbspruucusuNQ1bJ9l7O3IM9
 9Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718219106; x=1718823906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVn0gUr8jwuVMGQACKErKUFq31rOO6g1SOd15vC3Cks=;
 b=PRz7ak+F7hGQ6irKhm2RBgGdJGXJ/7ogy94dqAAmbCqsJmnuwGdRG3yzKJiWKP/ETJ
 8tARTnxBrrlIU/KNCmskjOEKRWyH9YIw6bKF2G0/+TYdgnqYbsy9X6pBHvwI+42758XP
 CyXrKKjMYv84qdhWIu5ZA+NPkGA0YdjcKzPLoxcAqu5z8p072u2DPaUVnvwS2vvIdm5h
 wZ+x9jU891gIy1pNiSs5W34XBRzfzpm29FujmmI/yyorfdbuZBnfV0tjf0En4n25Ad1y
 SMTn9i4H5EnvPKKUK5qa0fVlfcArs+QsUMvzuDZwmSdCv3sYNLTBO7u758L4llUoPqD5
 VzGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1eMoBMwEkS9aLnA4i7UInUL3dWz5yvKB0kn6tR1uTfJwPUJXFI/DpMKSJQnKpjNiEjdPQ1SIunlBKHc3aH62yT0UEJpm9yelsaUalbz8I
X-Gm-Message-State: AOJu0Yz4rHhIofAomIE9IhZDMZxPQ6+zxVAlmmr/CIjEWufkS2rBQnyT
 lnHEh4D45fszaMb43rOk3a1BeoF83XGB3Gbhx1nuik9Nf6Fwa/0qUqvuBzcXE7A=
X-Google-Smtp-Source: AGHT+IGykt0YUd4KoCQDPLnbKvOevsXXuj+TXY3BeFiPg46EyDmTIi4o32Gf4o4QJDGIBDrqpGJfXA==
X-Received: by 2002:a05:6512:799:b0:52b:befb:24ad with SMTP id
 2adb3069b0e04-52c9a3c7449mr2080284e87.20.1718219105792; 
 Wed, 12 Jun 2024 12:05:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb423dd68sm2601311e87.210.2024.06.12.12.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 12:05:05 -0700 (PDT)
Date: Wed, 12 Jun 2024 22:05:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
 swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Add SM7150 support
Message-ID: <qinrviffefuy77tmk5itgiyapgpnfpzupggb6bgvlxk6kybxjn@h4wmocovtdch>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-5-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612184336.11794-5-danila@jiaxyga.com>
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

On Wed, Jun 12, 2024 at 09:43:36PM +0300, Danila Tikhonov wrote:
> Add definitions for the display hardware used on the Qualcomm SM7150
> platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_5_2_sm7150.h    | 349 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 352 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> 

[...]

> +static const struct dpu_sspp_cfg sm7150_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1f0,
> +		.features = VIG_SDM845_MASK,
> +		.sblk = &dpu_vig_sblk_qseed3_1_4,

dpu_vig_sblk_qseed3_2_4 (and further on).

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name = "sspp_1", .id = SSPP_VIG1,
> +		.base = 0x6000, .len = 0x1f0,
> +		.features = VIG_SDM845_MASK,
> +		.sblk = &dpu_vig_sblk_qseed3_1_4,
> +		.xin_id = 4,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG1,
> +	}, {
> +		.name = "sspp_2", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x1f0,
> +		.features = DMA_SDM845_MASK,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA0,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x1f0,
> +		.features = DMA_SDM845_MASK,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA1,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x1f0,
> +		.features = DMA_CURSOR_SDM845_MASK,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +		.clk_ctrl = DPU_CLK_CTRL_DMA2,
> +	},
> +};
> +
> +static const struct dpu_lm_cfg sm7150_lm[] = {
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
> +	}, {
> +		.name = "lm_3", .id = LM_3,
> +		.base = 0x47000, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = LM_2,
> +		.pingpong = PINGPONG_3,
> +	}, {
> +		.name = "lm_4", .id = LM_4,
> +		.base = 0x0, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = 0,
> +		.pingpong = PINGPONG_4,
> +	}, {
> +		.name = "lm_5", .id = LM_5,
> +		.base = 0x0, .len = 0x320,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sdm845_lm_sblk,
> +		.lm_pair = 0,
> +		.pingpong = PINGPONG_5,
> +	},

Please drop LM_4 and LM_5, I don't think they are really a part of the
hardware (especially with base = 0).

> +};
> +

-- 
With best wishes
Dmitry
