Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090866C361
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554B10E45E;
	Mon, 16 Jan 2023 15:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907FE10E458
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 15:12:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bk16so27754942wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ckwjdIos3/d0mmSAXMiwnydgh7S9s8+5aaRpozbu8v4=;
 b=abXwcrGb1XGyXG2nIPoYBx+gujHYX2iwcnBtc41Unt9f1Rl6PkW7Ho78YiZnDOwfob
 7eU6RTtVc2+UArRouiaO8LdKQOZW/1KPgBbo7Y281wcCMmfSfT6eLDEGCWox7xG9xBWu
 dtEkjhtxaxCNWZ3NV4S9qEzvrLhZXOS9lkF3OYztSb6OmYjVpPue8Z6bi6NZVNclerlt
 bxKEaipyFnRReuceFOMUCV5njbbIacoDBH+OWY2MGpRiaoxOhwOxhphJaLmZW3GBdM+N
 pXE2rC3gURlgGro5YIgLtq3spOfR0/jmjl/8+7B1xsc648/1tq8ilME09lXaickuHNyo
 XM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckwjdIos3/d0mmSAXMiwnydgh7S9s8+5aaRpozbu8v4=;
 b=rEkW7RBj+D2jAVySSa37k40yar6GcX02A9L1yRqubReL8GA7uIb3Sbuz3DnQpoj5nZ
 QLrOjYTHeZDf443dwNrrnthRRbDAzLh3ikEmP56sSZrVryMyTvhnwKFV+hWHrKaSOjTp
 afnYl+ayjTzCpBOvDra9Q9Uf9MI+kYODMVrcRCO8pbTN4OssT3+44wSCUjKKJAA9WGlP
 KsdBHpOf+Gr5PA8FYXPu7r6/u5q28HqZNZw9cLMZvf8ZDl1anJUrgdJr6iM6vc+X0WBT
 oY1TM1hJRiEreEq0K1+j9V3h12tszr3ufoviNTgLanfdSlJU3w05WZn1DTGHhRy7oIWg
 VQFA==
X-Gm-Message-State: AFqh2krrkDNFoCNb3j4fpFiuBZj74a0c/LzTd4p09OEV5vhWH2Lc60kE
 DiDQcLly0Aj3I0NlnxbTM5cvhA==
X-Google-Smtp-Source: AMrXdXswS+2w/OvbAJmyIgpYo+ZRbwjDnfNDR6xpRG13o1+tBDmT81nIbfduGLP8VMLGxfKnMRxI9g==
X-Received: by 2002:adf:e9c9:0:b0:2bd:f782:d26d with SMTP id
 l9-20020adfe9c9000000b002bdf782d26dmr5658264wrn.30.1673881938968; 
 Mon, 16 Jan 2023 07:12:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0?
 ([2a01:e0a:982:cbb0:ba0d:2f3a:c61d:3e0])
 by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b002a01e64f7a1sm3121701wrb.88.2023.01.16.07.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:12:18 -0800 (PST)
Message-ID: <eb00d3b5-bd7d-16cd-fef6-231674abe2b5@linaro.org>
Date: Mon, 16 Jan 2023 16:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA
 SSPP clocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/01/2023 13:41, Dmitry Baryshkov wrote:
> DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
> SSPP blocks used for the cursor planes. This has lead to the confusion
> at least for the MSM8998 platform. In preparation to supporting the
> cursor SSPP blocks, use proper enum values to index DMA SSPP clock
> controls.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>   2 files changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ad0c55464154..b0f6e071fe4b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -522,9 +522,9 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -539,9 +539,9 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>   		.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>   		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   		.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -564,9 +564,9 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -602,9 +602,9 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2BC, .bit_off = 20},
> @@ -631,9 +631,9 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
>   			.reg_off = 0x2ac, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2b4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2bc, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2c4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2bc, .bit_off = 20},
> @@ -658,9 +658,9 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   			.reg_off = 0x2AC, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   			.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   			.reg_off = 0x2BC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2C4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2BC, .bit_off = 20},
> @@ -676,9 +676,9 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   		.reg_off = 0x2AC, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>   		.reg_off = 0x2AC, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>   		.reg_off = 0x2B4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
>   		.reg_off = 0x2C4, .bit_off = 8},
>   	},
>   };
> @@ -696,8 +696,8 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
>   	},
>   };
> @@ -724,9 +724,9 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
>   			.reg_off = 0x28330, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
>   			.reg_off = 0x2a330, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA4] = {
>   			.reg_off = 0x2c330, .bit_off = 0},
> -	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +	.clk_ctrls[DPU_CLK_CTRL_DMA5] = {
>   			.reg_off = 0x2e330, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>   			.reg_off = 0x2bc, .bit_off = 20},
> @@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
> @@ -1216,9 +1216,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
> @@ -1254,9 +1254,9 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> @@ -1282,9 +1282,9 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> @@ -1316,9 +1316,9 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
> -		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
>   	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> -		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
> @@ -1327,9 +1327,9 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
>   static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> @@ -1355,9 +1355,9 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 56d98b4dd2ac..9c96920e1849 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -513,6 +513,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_DMA1,
>   	DPU_CLK_CTRL_DMA2,
>   	DPU_CLK_CTRL_DMA3,
> +	DPU_CLK_CTRL_DMA4,
> +	DPU_CLK_CTRL_DMA5,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
