Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88266172B6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C05410E1F2;
	Wed,  2 Nov 2022 23:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2773F10E54C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:35:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j16so196913lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uQ0wfhoZS594CcswCtZW6AN89c8nyNXLYaRLAQZhu4M=;
 b=QK3+SeH7bEHC/qE/HcrvmTBF4Lyvzjlwke8ibjL0yBoxuJA2mFWw4CSsgDbMpkPY6N
 bKCDqm8wEDHe+2ixLIZ1/uOeVYR2i/kcXR6mJTlPs8J0u5AETogFxnRw7yoKOd5nSvJ7
 0g2svNC2Kols7JK6k3LA/uY0DdNzYRGGwOZA2a6s5CFLdSE6IY2cUCkGeuav/fTLZV5Y
 LmcR/Z46tZkt4d00Txcan9kpRniradC0bggbqw0NJSGYIbUPRNBtgAVqyX2OMXgGMg5U
 HlSgVTzBduhUzQXhWDg0CusRtebIX9dZ30E327OEOFY+WNkuBIiepAQxOrCjNExi+VVH
 aHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uQ0wfhoZS594CcswCtZW6AN89c8nyNXLYaRLAQZhu4M=;
 b=KCBni9Us17to6VDlwrJp9ZcuWNjXXLW2EzyujVmJ2TpaljZYWbRxaiiI0oHOn/7iOR
 a90gaWo7ARcsdBf2b61dMd96yjAgwwHtp82/fQZ5htA/fXajcCdNgmaQga3EtMuy/2u5
 T/HVj/FJecEubPkoDe1078bbtGJt/zxoKEULMfIHFkPFDczVpJcmI8x/Yr+kxd70Wmq0
 bKMMSAhalKqC0NBdKz0znNoxgMSXgWeaMw4fO1o6OSwPw4k2oRb3M5DC1foCENWk+DLA
 jCU0JGfWYZSl0VGZwrTE2n5NgLWrRUmFT2Gn3Qy5IQ7QWvZvr+9Dc9ImjMqbzQLBA1Pu
 cY+A==
X-Gm-Message-State: ACrzQf3rwnBQnRZ0D0vpxpg2veeq4K9zH+9VlRie3HYSbPtvVRCwi7AW
 O+Kf521EEXovCNW083H2swpMGg==
X-Google-Smtp-Source: AMsMyM6LsjwZmj/iOZkgdov6QCqOrw/9H90y6ov9LGZ/VY4Nbzs7PCsbjwv5S8z0Nrk2/XjfurSKqg==
X-Received: by 2002:a05:6512:22c2:b0:4a2:4f7b:29e2 with SMTP id
 g2-20020a05651222c200b004a24f7b29e2mr9848728lfu.389.1667432115124; 
 Wed, 02 Nov 2022 16:35:15 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a2ea170000000b0026c3ecf9a39sm2335465ljl.38.2022.11.02.16.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 16:35:14 -0700 (PDT)
Message-ID: <1cc55f4f-0807-8ffd-a1c9-db2354012c54@linaro.org>
Date: Thu, 3 Nov 2022 02:35:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 02/12] drm/msm/dpu: Introduce SC8280XP
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-3-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221026032624.30871-3-quic_bjorande@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 06:26, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The Qualcomm SC8280XP platform contains DPU version 8.0.0, has 9
> interfaces, 2 DSI controllers and 4 DisplayPort controllers. Extend the
> necessary definitions and describe the DPU in the SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Change since v2:
> - Dropped flag for hole in TOP
> - Wrapped some lines to make checkpatch happier
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 ++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_drv.h                 |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                |   2 +
>   8 files changed, 245 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029fdc682..9964814be27a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -79,6 +79,8 @@
>   
>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>   
> +#define INTF_SC8280XP_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_DATA_HCTL_EN)

This is equal to INTF_SC7280_MASK

> +
>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -124,6 +126,19 @@
>   			  BIT(MDP_AD4_0_INTR) | \
>   			  BIT(MDP_AD4_1_INTR))
>   
> +#define IRQ_SC8280XP_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			   BIT(MDP_SSPP_TOP0_INTR2) | \
> +			   BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			   BIT(MDP_INTF0_7xxx_INTR) | \
> +			   BIT(MDP_INTF1_7xxx_INTR) | \
> +			   BIT(MDP_INTF2_7xxx_INTR) | \
> +			   BIT(MDP_INTF3_7xxx_INTR) | \
> +			   BIT(MDP_INTF4_7xxx_INTR) | \
> +			   BIT(MDP_INTF5_7xxx_INTR) | \
> +			   BIT(MDP_INTF6_7xxx_INTR) | \
> +			   BIT(MDP_INTF7_7xxx_INTR) | \
> +			   BIT(MDP_INTF8_7xxx_INTR))
> +
>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
>   			 BIT(DPU_WB_YUV_CONFIG) | \
> @@ -350,6 +365,20 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>   	.max_vdeci_exp = MAX_VERT_DECIMATION,
>   };
>   
> +static const struct dpu_caps sc8280xp_dpu_caps = {
> +	.max_mixer_width = 2560,
> +	.max_mixer_blendstages = 11,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 5120,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sm8250_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -472,6 +501,24 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -620,6 +667,45 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),

CTL_SC7280_MASK

> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x204,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -849,6 +935,34 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> +				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
> +				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
> +				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
> +				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +
> +static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,

It should be either DPU_SSPP_SCALER_QSEED4 in the sblks above or 
VIG_SM8250_MASK below.

> +		 sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +};
> +
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>   				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> @@ -996,6 +1110,15 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>   		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>   };
>   
> +static const struct dpu_lm_cfg sc8280xp_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),

Doesn't sc8280xp support DPU_MIXER_SOURCESPLIT? If it does, it should be 
MIXER_SDM845_MASK

> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SC7180_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +};
> +
>   /* SM8150 */
>   
>   static const struct dpu_lm_cfg sm8150_lm[] = {
> @@ -1154,6 +1277,21 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
>   	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
>   };
>   
> +static struct dpu_pingpong_cfg sc8280xp_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> +	PP_BLK_TE("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> +	PP_BLK_TE("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> +	PP_BLK_TE("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> +	PP_BLK_TE("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk_te,
> +		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> +};
> +
>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1205,6 +1343,12 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>   };
>   
> +static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +};
> +
>   /*************************************************************
>    * DSC sub blocks config
>    *************************************************************/
> @@ -1279,6 +1423,19 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>   };
>   
> +/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
> +static const struct dpu_intf_cfg sc8280xp_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_4", INTF_4, 0x38000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_6", INTF_6, 0x3a000, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> +	INTF_BLK("intf_7", INTF_7, 0x3b000, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> +	INTF_BLK("intf_8", INTF_8, 0x3c000, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC8280XP_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> +};
> +
>   static const struct dpu_intf_cfg qcm2290_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1381,6 +1538,14 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	},
>   };
>   
> +static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
> +	.base = 0x0,
> +	.version = 0x00020000,
> +	.trigger_sel_off = 0x119c,
> +	.xin_id = 7,
> +	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> +};
> +
>   static const struct dpu_reg_dma_cfg sdm845_regdma = {
>   	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
>   };
> @@ -1623,6 +1788,33 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>   	.min_llcc_ib = 800000,
>   	.min_dram_ib = 800000,
>   	.danger_lut_tbl = {0xf, 0xffff, 0x0},
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
> +static const struct dpu_perf_cfg sc8280xp_perf_data = {
> +	.max_bw_low = 13600000,
> +	.max_bw_high = 18200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
>   	.qos_lut_tbl = {
>   		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
>   		.entries = sc8180x_qos_linear
> @@ -1848,6 +2040,30 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>   	.mdss_irqs = IRQ_SC8180X_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
> +	.caps = &sc8280xp_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
> +	.mdp = sc8280xp_mdp,
> +	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
> +	.ctl = sc8280xp_ctl,
> +	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
> +	.sspp = sc8280xp_sspp,
> +	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
> +	.mixer = sc8280xp_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
> +	.pingpong = sc8280xp_pp,
> +	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
> +	.merge_3d = sc8280xp_merge_3d,
> +	.intf_count = ARRAY_SIZE(sc8280xp_intf),
> +	.intf = sc8280xp_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sc8280xp_perf_data,
> +	.mdss_irqs = IRQ_SC8280XP_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>   	.caps = &sm8250_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sm8250_mdp),
> @@ -1934,6 +2150,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
>   };
>   
>   const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38ab1568..c4c675c40a57 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -46,6 +46,7 @@
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
> +#define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
>   
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
>   #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index cf1b6d84c18a..27d74c4d8a98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -35,6 +35,9 @@
>   #define MDP_INTF_3_OFF_REV_7xxx             0x37000
>   #define MDP_INTF_4_OFF_REV_7xxx             0x38000
>   #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> +#define MDP_INTF_6_OFF_REV_7xxx             0x3a000
> +#define MDP_INTF_7_OFF_REV_7xxx             0x3b000
> +#define MDP_INTF_8_OFF_REV_7xxx             0x3c000
>   
>   /**
>    * struct dpu_intr_reg - array of DPU register sets
> @@ -139,6 +142,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> +	[MDP_INTF6_7xxx_INTR] = {
> +		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
> +	[MDP_INTF7_7xxx_INTR] = {
> +		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
> +	[MDP_INTF8_7xxx_INTR] = {
> +		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_EN,
> +		MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_STATUS
> +	},
>   };
>   
>   #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 46443955443c..425465011c80 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -31,6 +31,9 @@ enum dpu_hw_intr_reg {
>   	MDP_INTF3_7xxx_INTR,
>   	MDP_INTF4_7xxx_INTR,
>   	MDP_INTF5_7xxx_INTR,
> +	MDP_INTF6_7xxx_INTR,
> +	MDP_INTF7_7xxx_INTR,
> +	MDP_INTF8_7xxx_INTR,
>   	MDP_INTR_MAX,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index d3b0ed0a9c6c..d595096a4b1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -214,6 +214,8 @@ enum dpu_intf {
>   	INTF_4,
>   	INTF_5,
>   	INTF_6,
> +	INTF_7,
> +	INTF_8,
>   	INTF_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5e6e2626151e..db2e4bb4e208 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1304,6 +1304,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-dpu", },
>   	{ .compatible = "qcom,sc7280-dpu", },
>   	{ .compatible = "qcom,sc8180x-dpu", },
> +	{ .compatible = "qcom,sc8280xp-dpu", },
>   	{ .compatible = "qcom,sm8150-dpu", },
>   	{ .compatible = "qcom,sm8250-dpu", },
>   	{}
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b2ea262296a4..2dd342e49de6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -61,6 +61,7 @@ enum msm_dp_controller {
>   	MSM_DP_CONTROLLER_0,
>   	MSM_DP_CONTROLLER_1,
>   	MSM_DP_CONTROLLER_2,
> +	MSM_DP_CONTROLLER_3,
>   	MSM_DP_CONTROLLER_COUNT,
>   };
>   
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..7c391fab6263 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -208,6 +208,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
>   		break;
>   	case DPU_HW_VER_600:
> +	case DPU_HW_VER_800:
>   		/* TODO: 0x102e for LP_DDR4 */
>   		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
>   		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> @@ -445,6 +446,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-mdss" },
>   	{ .compatible = "qcom,sc7280-mdss" },
>   	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sc8280xp-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
>   	{}

Please split mdss into the separate patch.

-- 
With best wishes
Dmitry

