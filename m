Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5D70C135
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F38F10E33A;
	Mon, 22 May 2023 14:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19F10E33A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:36:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30644c18072so3915538f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684766212; x=1687358212;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IL0ksLPfjYHRoJETDHiXplHnZjbV8W44eCBuPuXFkbc=;
 b=wH2AW5HDW3lAqAdDRnE2xRBSBDpQH6MZdKRRIyhxWxMrc6oJa0/LB1RdR9CpR+QNxK
 7PeLMxWuJOuEzctbejXSfs+iwjLtsSQnODLhhxEcfdQsXJwu6/ga6XzxlUhdHfvWA0VX
 y4N9X6eHrO9pXoImOpKpEdzBMWJsUSPxp2ghzD07mRXq4F20AWarXgw2AOhKx4puyLlz
 tLzFmVxNVsr4LT4/pqBO632wFeS2Cko5QUh1EoardpQkAzdfpf/dUQQDp43EXd+8enzI
 u7ZQ06tmmXT4FJSeiO+hvtH0NjjlREitLOxK0AK9OJoi3R5I1kjm4Y+0S/qNo6zqnH9G
 RNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684766212; x=1687358212;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IL0ksLPfjYHRoJETDHiXplHnZjbV8W44eCBuPuXFkbc=;
 b=FJDcebfKmFx/1sUJrLdoxo25TYFiGsH7zd5Q2LqHMSDJEhb/3kqL9VLNfAKr3B4riQ
 hcly74sLuJ9O27f82LqWDyCCs8FYXmF1ELh+tnhchkVBd4nemKhX2zMha7VTpg7HXsv9
 TI+YBlX3VSuMxNwE9HjslUqdrCMv9YxlB7+qtUKnGfE9U1gWklRmXad4ACk4aWwlIQLW
 fRaW0uOwRh+UKz5hKJf+KJpL6OzTz4ikIQdXSdmIi0wV2Cul+HWjk7vJ2SRxu/lRajBc
 JmhaClJ1kBfa71hE1rAkDYxptZ0YZ93nVYH4W3bDbANLtXkgUJJRecV3bcpx2b/Yqs+r
 YcgQ==
X-Gm-Message-State: AC+VfDy3vhnP2i9AVnx/UKB9M9m4d9yHs8M3tvixOXYFQ7nqoNokmXIi
 QBrbz3Rg0whXmmyN6SRSBxlNHw==
X-Google-Smtp-Source: ACHHUZ6bcWGjvul7Vp7kS8OrC3C0kf+Ud5NQ0k83LiW4UTcG1hIsUL0VeRhnCc9JyFIDCQUsEPs11A==
X-Received: by 2002:adf:f80d:0:b0:306:4613:e0f0 with SMTP id
 s13-20020adff80d000000b003064613e0f0mr6842716wrp.68.1684766212279; 
 Mon, 22 May 2023 07:36:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d45c4000000b003047d5b8817sm7920371wrs.80.2023.05.22.07.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:36:51 -0700 (PDT)
Message-ID: <80da4c26-ca3f-00c9-072c-087a1ff24c74@linaro.org>
Date: Mon, 22 May 2023 16:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/6] drm/msm/dpu: split interrupt address arrays
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-4-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-4-dmitry.baryshkov@linaro.org>
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

Hi,

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> There is no point in having a single enum (and a single array) for both
> DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
> enum and two IRQ address arrays.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
>   3 files changed, 74 insertions(+), 38 deletions(-)
> 
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

looks good, but I can't find where has_7xxx_intr is set in the patchset

Neil

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

