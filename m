Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDF7BE767
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F0510E28F;
	Mon,  9 Oct 2023 17:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1255710E290
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:10:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so59584691fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696871408; x=1697476208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lYoCwAiR4inAijqUaMCL87UoY8rv8b+1tyeGpKKu09k=;
 b=f8dC/9SOjM0dHH2BdLD8C2dylZm6EIxrHHjFT7eaFsxJqfXDEyZWIFM13Oweg8UH9j
 zsEnEcbo9PWDBs54d6YavKHRcEI8p9ZFadIvwyI8z3gE6Rm4rfuHSuZ5vyXCEEC6qpXC
 AsdmbKAl8Pqnc/P37wlyZ3NSaezV+s8n1oZBUbNuy7xCH+HFxDEKkyZLppPvJVRE2fXu
 1S9kCcF4TH9XJE03kvVsTnQbYG2fMYR7WU23XwuhJTSzysjbWU04KspNaPlyPg791JCU
 N191rOAtz8z1i+ggeWKj3YtGqOm5rhj8qj+xq0BmGm8ZkXu47Tj0URpN9gCLj0jGvGgH
 0dFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871408; x=1697476208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYoCwAiR4inAijqUaMCL87UoY8rv8b+1tyeGpKKu09k=;
 b=oGH+Ab8gj9d0JfHvYQFefd/tSHbfRQ8jFMphAiacrQ5LfzFtbIkQ/lu574zzsrRhJ1
 Vwzmt1Ras8+0SDn93zSIPEcLnby8FpTjgoBIAH/LuOLn9uvfGxbc9QTDhl/5qZcVT7pz
 2qPwab8/axFLxRe7u2Ep2lQfvKd2Qb/OYr/FgPVMuXZUquqpH4GqzRQUFgdSwWQt0Acp
 eha2OoOrCQIuyT5tuCzLPs0HQ/5BBdObyBvDFoVsmDBpBphBBb3vg9sqIUzBABaZown2
 Mr2V5z8SjtIkWuLQWhD3HWlW8Lu21pP4CDq39XU3Ap8Kt/mrQ8OUTysIILHiCdOqOmKU
 EYPQ==
X-Gm-Message-State: AOJu0YxXYuMPtfJ4WyN6ap+JvTz4BBgPcGYQ+70+oUFxPkk8S4mOyVoe
 2sGW4CJwlfxFWqjA3Whp98YLZw==
X-Google-Smtp-Source: AGHT+IGjIv5lRo3XdQegUZ6LOT8XiXCUx78FtqE80vN6nQNNSwkxg99L9GQkF4GuQxN8sfVQJ+uvtw==
X-Received: by 2002:a2e:b2d1:0:b0:2bf:f599:be63 with SMTP id
 17-20020a2eb2d1000000b002bff599be63mr13449013ljz.41.1696871408005; 
 Mon, 09 Oct 2023 10:10:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a05651c011300b002bff365c7bfsm2098383ljb.35.2023.10.09.10.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 10:10:07 -0700 (PDT)
Message-ID: <7eecc9af-3d4f-43ba-8262-e58858bbe417@linaro.org>
Date: Mon, 9 Oct 2023 20:10:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] drm/msm: dpu1: sm8550: move split clock controls
 to sspp entries
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-5-806c0dee4e43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-5-806c0dee4e43@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 19:36, Neil Armstrong wrote:
> The SM8550 has the SSPP clk_ctrl in the SSPP registers, move them
> out of the MDP top.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 35 ++++++++++------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 7bed819dfc39..527ec020fba4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -24,16 +24,6 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
>   	.base = 0, .len = 0x494,
>   	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
> -		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x6330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x8330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_VIG3] = { .reg_off = 0xa330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x24330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x26330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x28330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2a330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA4] = { .reg_off = 0x2c330, .bit_off = 0 },
> -		[DPU_CLK_CTRL_DMA5] = { .reg_off = 0x2e330, .bit_off = 0 },
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },

Hmm, interesting. I even double-checked this. SSPP and WB have their own 
clock registers now. But the REG_DMA uses the main area (0x2bc).

>   	},
>   };
> @@ -73,6 +63,11 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_clk_ctrl_reg sm8550_sspp_clk_ctrl = {
> +	.reg_off = 0x330,
> +	.bit_off = 0
> +};

I don't think we even need this outside of dpu_hw_sspp. You can use 
core_major_rev to check whether the driver should use global clocks or 
per-SSPP / per-WB clocks register instead.

> +
>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	{
>   		.name = "sspp_0", .id = SSPP_VIG0,
> @@ -81,7 +76,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_vig_sblk_0,
>   		.xin_id = 0,
>   		.type = SSPP_TYPE_VIG,
> -		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_1", .id = SSPP_VIG1,
>   		.base = 0x6000, .len = 0x344,
> @@ -89,7 +84,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_vig_sblk_1,
>   		.xin_id = 4,
>   		.type = SSPP_TYPE_VIG,
> -		.clk_ctrl = DPU_CLK_CTRL_VIG1,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_2", .id = SSPP_VIG2,
>   		.base = 0x8000, .len = 0x344,
> @@ -97,7 +92,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_vig_sblk_2,
>   		.xin_id = 8,
>   		.type = SSPP_TYPE_VIG,
> -		.clk_ctrl = DPU_CLK_CTRL_VIG2,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_3", .id = SSPP_VIG3,
>   		.base = 0xa000, .len = 0x344,
> @@ -105,7 +100,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_vig_sblk_3,
>   		.xin_id = 12,
>   		.type = SSPP_TYPE_VIG,
> -		.clk_ctrl = DPU_CLK_CTRL_VIG3,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_8", .id = SSPP_DMA0,
>   		.base = 0x24000, .len = 0x344,
> @@ -113,7 +108,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sdm845_dma_sblk_0,
>   		.xin_id = 1,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA0,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_9", .id = SSPP_DMA1,
>   		.base = 0x26000, .len = 0x344,
> @@ -121,7 +116,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sdm845_dma_sblk_1,
>   		.xin_id = 5,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA1,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_10", .id = SSPP_DMA2,
>   		.base = 0x28000, .len = 0x344,
> @@ -129,7 +124,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sdm845_dma_sblk_2,
>   		.xin_id = 9,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA2,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_11", .id = SSPP_DMA3,
>   		.base = 0x2a000, .len = 0x344,
> @@ -137,7 +132,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sdm845_dma_sblk_3,
>   		.xin_id = 13,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA3,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_12", .id = SSPP_DMA4,
>   		.base = 0x2c000, .len = 0x344,
> @@ -145,7 +140,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_dma_sblk_4,
>   		.xin_id = 14,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA4,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	}, {
>   		.name = "sspp_13", .id = SSPP_DMA5,
>   		.base = 0x2e000, .len = 0x344,
> @@ -153,7 +148,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   		.sblk = &sm8550_dma_sblk_5,
>   		.xin_id = 15,
>   		.type = SSPP_TYPE_DMA,
> -		.clk_ctrl = DPU_CLK_CTRL_DMA5,
> +		.clk_ctrl_reg = &sm8550_sspp_clk_ctrl,
>   	},
>   };
>   
> 

-- 
With best wishes
Dmitry

