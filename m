Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8D71229E
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E37510E7CB;
	Fri, 26 May 2023 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F0110E7D3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:48:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so10733805e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685090914; x=1687682914;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rll7GWfG/sLOPy0cxeHu/HcyP+FoKo06l7zF9fa6a6E=;
 b=v/W4IfFFAosHRfTdGdNGVy6M5uS6lOikAzwMe2xu9QF8btOzgepIgGxgvi5NB1P3I0
 rPfnXA8+gpApnyQns7t5p7u7WESJJtH56PBrBgYusObI1QtyylfnyElDGKaXYOxwVmFA
 hDeKq8MMMfK91ln3+4z6p/nIAmtM3F5m40OunO/N0kgMY6M4057puGfUVFIv0hW0oDeb
 bIDRGNagjioQxgx+tqrlez1s5odS89UgQ/LtFo3SBLquKpsavb1pcKV/ByGZzCBHLGFw
 +hx7pHRg9bkCZRjCpw/JlKva4aXLob6oyLrzVQNpgQ/NH3rY+QMTDLLRdXqECQ/smSiA
 TM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685090914; x=1687682914;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rll7GWfG/sLOPy0cxeHu/HcyP+FoKo06l7zF9fa6a6E=;
 b=PKCL/iY1tTS8WVqwCJunH8g+n+BiRcVUrGlsEgKu2JNBsHboWvsQkr3fG90GRJHdXV
 dV3sXCqL5pZDDAVl+8CD5+qBLO9aJKgirICkO3chg0lQsXZN2ezyRrJJP6IWHNTTNizd
 DV/wpb8/c/zM00NxmLVrKQuqjqHbJ4ZCU3tMbGxHPc4xjHmdQEQor1qLwC+BS268kYM1
 hvCR0NFdL7iDcIkyGZMIoj2jaBcPMq9YQIq/bbfax+I5EfSykeEYJc4A2rL5xos4O4Wa
 86aleMrrkpQCTLR6QpOebXM+eRWm5nFYFDRJAKlB+z7TaF30Y5CX6gy8rr8F5lzOmxMY
 lbHA==
X-Gm-Message-State: AC+VfDzWUfg/9mmSxqTMUYnQJ8crpP6t9ylal3XRN0v4o2nJjrjex0cj
 WLzm42blkIZD9hXY99FhX/MNbQ==
X-Google-Smtp-Source: ACHHUZ5O6SzyE1EdhJ/kuSxcEqr0Z8pvzf756qORAchH8TPzfylPJC2ee/a1llhaNSgPhdAaO7KQlQ==
X-Received: by 2002:a05:600c:1c8b:b0:3f6:d41:76ed with SMTP id
 k11-20020a05600c1c8b00b003f60d4176edmr4365078wms.5.1685090914182; 
 Fri, 26 May 2023 01:48:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003f423dfc686sm4424349wmc.45.2023.05.26.01.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 01:48:33 -0700 (PDT)
Message-ID: <2e3b64a6-0ffe-f083-666a-f829a6faee6c@linaro.org>
Date: Fri, 26 May 2023 10:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/6] drm/msm/dpu: split interrupt address arrays
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-4-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522214527.190054-4-dmitry.baryshkov@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 23:45, Dmitry Baryshkov wrote:
> There is no point in having a single enum (and a single array) for both
> DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
> enum and two IRQ address arrays.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
>   8 files changed, 79 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 3c1b2c13398d..320cfa4be633 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
>   	.has_3d_merge = true,
> +	.has_7xxx_intr = true,
>   	.max_linewidth = 4096,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 5d894cbb0a62..9306c7a115e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
> +	.has_7xxx_intr = true,
>   	.max_linewidth = 2400,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index c3f1ae000a21..fc1e17c495f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
>   	.has_3d_merge = true,
> +	.has_7xxx_intr = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 86c2e68ebd2c..eb72411c16db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -14,6 +14,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   	.has_src_split = true,
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
> +	.has_7xxx_intr = true,
>   	.has_3d_merge = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 85dc34458b88..8209ca317bdc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
>   	.has_3d_merge = true,
> +	.has_7xxx_intr = true,
>   	.max_linewidth = 5120,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 677048cc3b7d..72530ebb0ae6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -351,6 +351,7 @@ struct dpu_rotation_cfg {
>    * @has_dim_layer      dim layer feature status
>    * @has_idle_pc        indicate if idle power collapse feature is supported
>    * @has_3d_merge       indicate if 3D merge is supported
> + * @has_7xxx_intr      indicate that INTF/IRQs use addressing for DPU 7.0 and greater
>    * @max_linewidth      max linewidth for sspp
>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> @@ -364,6 +365,7 @@ struct dpu_caps {
>   	bool has_dim_layer;
>   	bool has_idle_pc;
>   	bool has_3d_merge;
> +	bool has_7xxx_intr;
>   	/* SSPP limits */
>   	u32 max_linewidth;
>   	u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 0776b0f6df4f..a03d826bb9ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -51,11 +51,9 @@ struct dpu_intr_reg {
>   };
>   
>   /*
> - * struct dpu_intr_reg -  List of DPU interrupt registers
> - *
> - * When making changes be sure to sync with dpu_hw_intr_reg
> + * dpu_intr_set_legacy -  List of DPU interrupt registers for DPU <= 6.x
>    */
> -static const struct dpu_intr_reg dpu_intr_set[] = {
> +static const struct dpu_intr_reg dpu_intr_set_legacy[] = {
>   	[MDP_SSPP_TOP0_INTR] = {
>   		INTR_CLEAR,
>   		INTR_EN,
> @@ -121,57 +119,78 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_AD4_INTR_EN_OFF(1),
>   		MDP_AD4_INTR_STATUS_OFF(1),
>   	},
> -	[MDP_INTF0_7xxx_INTR] = {
> +};
> +
> +/*
> + * dpu_intr_set_7xxx -  List of DPU interrupt registers for DPU >= 7.0
> + */
> +static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
> +	[MDP_SSPP_TOP0_INTR] = {
> +		INTR_CLEAR,
> +		INTR_EN,
> +		INTR_STATUS
> +	},
> +	[MDP_SSPP_TOP0_INTR2] = {
> +		INTR2_CLEAR,
> +		INTR2_EN,
> +		INTR2_STATUS
> +	},
> +	[MDP_SSPP_TOP0_HIST_INTR] = {
> +		HIST_INTR_CLEAR,
> +		HIST_INTR_EN,
> +		HIST_INTR_STATUS
> +	},
> +	[MDP_INTF0_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(0),
>   		MDP_INTF_REV_7xxx_INTR_EN(0),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(0)
>   	},
> -	[MDP_INTF1_7xxx_INTR] = {
> +	[MDP_INTF1_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(1),
>   		MDP_INTF_REV_7xxx_INTR_EN(1),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(1)
>   	},
> -	[MDP_INTF1_7xxx_TEAR_INTR] = {
> +	[MDP_INTF1_TEAR_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
>   		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
>   		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
>   	},
> -	[MDP_INTF2_7xxx_INTR] = {
> +	[MDP_INTF2_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
>   		MDP_INTF_REV_7xxx_INTR_EN(2),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(2)
>   	},
> -	[MDP_INTF2_7xxx_TEAR_INTR] = {
> +	[MDP_INTF2_TEAR_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
>   		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
>   		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
>   	},
> -	[MDP_INTF3_7xxx_INTR] = {
> +	[MDP_INTF3_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
>   		MDP_INTF_REV_7xxx_INTR_EN(3),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(3)
>   	},
> -	[MDP_INTF4_7xxx_INTR] = {
> +	[MDP_INTF4_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(4),
>   		MDP_INTF_REV_7xxx_INTR_EN(4),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(4)
>   	},
> -	[MDP_INTF5_7xxx_INTR] = {
> +	[MDP_INTF5_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(5),
>   		MDP_INTF_REV_7xxx_INTR_EN(5),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(5)
>   	},
> -	[MDP_INTF6_7xxx_INTR] = {
> +	[MDP_INTF6_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(6),
>   		MDP_INTF_REV_7xxx_INTR_EN(6),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(6)
>   	},
> -	[MDP_INTF7_7xxx_INTR] = {
> +	[MDP_INTF7_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(7),
>   		MDP_INTF_REV_7xxx_INTR_EN(7),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(7)
>   	},
> -	[MDP_INTF8_7xxx_INTR] = {
> +	[MDP_INTF8_INTR] = {
>   		MDP_INTF_REV_7xxx_INTR_CLEAR(8),
>   		MDP_INTF_REV_7xxx_INTR_EN(8),
>   		MDP_INTF_REV_7xxx_INTR_STATUS(8)
> @@ -216,19 +235,19 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
>   		return IRQ_NONE;
>   
>   	spin_lock_irqsave(&intr->irq_lock, irq_flags);
> -	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
> +	for (reg_idx = 0; reg_idx < MDP_INTR_MAX; reg_idx++) {
>   		if (!test_bit(reg_idx, &intr->irq_mask))
>   			continue;
>   
>   		/* Read interrupt status */
> -		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
> +		irq_status = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].status_off);
>   
>   		/* Read enable mask */
> -		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
> +		enable_mask = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].en_off);
>   
>   		/* and clear the interrupt */
>   		if (irq_status)
> -			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +			DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
>   				     irq_status);
>   
>   		/* Finally update IRQ status based on enable mask */
> @@ -285,7 +304,11 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>   	assert_spin_locked(&intr->irq_lock);
>   
>   	reg_idx = DPU_IRQ_REG(irq_idx);
> -	reg = &dpu_intr_set[reg_idx];
> +	reg = &intr->intr_set[reg_idx];
> +
> +	/* Is this interrupt register supported on the platform */
> +	if (WARN_ON(!reg->en_off))
> +		return -EINVAL;
>   
>   	cache_irq_mask = intr->cache_irq_mask[reg_idx];
>   	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
> @@ -334,7 +357,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>   	assert_spin_locked(&intr->irq_lock);
>   
>   	reg_idx = DPU_IRQ_REG(irq_idx);
> -	reg = &dpu_intr_set[reg_idx];
> +	reg = &intr->intr_set[reg_idx];
>   
>   	cache_irq_mask = intr->cache_irq_mask[reg_idx];
>   	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
> @@ -368,10 +391,10 @@ static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
>   	if (!intr)
>   		return;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> +	for (i = 0; i < MDP_INTR_MAX; i++) {
>   		if (test_bit(i, &intr->irq_mask))
>   			DPU_REG_WRITE(&intr->hw,
> -					dpu_intr_set[i].clr_off, 0xffffffff);
> +					intr->intr_set[i].clr_off, 0xffffffff);
>   	}
>   
>   	/* ensure register writes go through */
> @@ -386,10 +409,10 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
>   	if (!intr)
>   		return;
>   
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> +	for (i = 0; i < MDP_INTR_MAX; i++) {
>   		if (test_bit(i, &intr->irq_mask))
>   			DPU_REG_WRITE(&intr->hw,
> -					dpu_intr_set[i].en_off, 0x00000000);
> +					intr->intr_set[i].en_off, 0x00000000);
>   	}
>   
>   	/* ensure register writes go through */
> @@ -421,10 +444,10 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   
>   	reg_idx = DPU_IRQ_REG(irq_idx);
>   	intr_status = DPU_REG_READ(&intr->hw,
> -			dpu_intr_set[reg_idx].status_off) &
> +			intr->intr_set[reg_idx].status_off) &
>   		DPU_IRQ_MASK(irq_idx);
>   	if (intr_status)
> -		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +		DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
>   				intr_status);
>   
>   	/* ensure register writes go through */
> @@ -448,6 +471,11 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>   	if (!intr)
>   		return ERR_PTR(-ENOMEM);
>   
> +	if (m->caps->has_7xxx_intr)
> +		intr->intr_set = dpu_intr_set_7xxx;
> +	else
> +		intr->intr_set = dpu_intr_set_legacy;
> +
>   	intr->hw.blk_addr = addr + m->mdp[0].base;
>   
>   	intr->total_irqs = nirq;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 1f2dabc54c22..f329d6d7f646 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -23,24 +23,29 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF3_INTR,
>   	MDP_INTF4_INTR,
>   	MDP_INTF5_INTR,
> +	MDP_INTF6_INTR,
> +	MDP_INTF7_INTR,
> +	MDP_INTF8_INTR,
>   	MDP_INTF1_TEAR_INTR,
>   	MDP_INTF2_TEAR_INTR,
>   	MDP_AD4_0_INTR,
>   	MDP_AD4_1_INTR,
> -	MDP_INTF0_7xxx_INTR,
> -	MDP_INTF1_7xxx_INTR,
> -	MDP_INTF1_7xxx_TEAR_INTR,
> -	MDP_INTF2_7xxx_INTR,
> -	MDP_INTF2_7xxx_TEAR_INTR,
> -	MDP_INTF3_7xxx_INTR,
> -	MDP_INTF4_7xxx_INTR,
> -	MDP_INTF5_7xxx_INTR,
> -	MDP_INTF6_7xxx_INTR,
> -	MDP_INTF7_7xxx_INTR,
> -	MDP_INTF8_7xxx_INTR,
>   	MDP_INTR_MAX,
>   };
>   
> +/* compatibility */
> +#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
> +#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> +#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
> +#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
> +#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
> +#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
> +#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
> +#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
> +#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
> +#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
> +#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
> +
>   #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>   
>   /**
> @@ -60,6 +65,7 @@ struct dpu_hw_intr {
>   	u32 total_irqs;
>   	spinlock_t irq_lock;
>   	unsigned long irq_mask;
> +	const struct dpu_intr_reg *intr_set;
>   
>   	struct {
>   		void (*cb)(void *arg, int irq_idx);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
