Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81865CFE1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15E710E51A;
	Wed,  4 Jan 2023 09:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F3110E517
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:45:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id cf42so49622125lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dwK7KmsCtxSzE0Aa/jU5YH7OuDhIFXIXllhG0Cv+W8c=;
 b=U296PG3EHPyZ+bRqZpBXS40UO8rB2b2MDcMN/8PhFG9G5W9Q8dO2r/auwQ4Zbke3Tc
 lMlAhcSKPpas+Ve44UhcObOZMiq3vjGa+cZ5fC/ybWyVNs0erUVQPTeYouY5de0tZBKI
 hM0w+xhEhVWQkVqOBj9Tvg0TMfzZwGhs01JBe26hCqh4lrCD7ALBtfsFw3ej50RxCMYm
 e9YJ3lFaQ4bQVlJyhESEubYjK1me1MvXzGUq3G+JTueZhmAlAI55kTj5XqI2nz+ixYen
 laGsuFYO6KyE4qV6dxiQJS0bToiU2VNh6q6WjvHALswSpneThMbKJGdZGn2G+fkkNSuf
 58dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dwK7KmsCtxSzE0Aa/jU5YH7OuDhIFXIXllhG0Cv+W8c=;
 b=ulYnzSJWZ0cnazm/+cla1e84cTSsabhCyugdBXt9Ln0fGGgJjVVOMWDZrYn5R7Juq2
 yXOk+rAkqNjovXv7vHIth+8VyCTcbV+dHR75/A+WJQEa21YozOoJiD7/+CmY9fTFEI2D
 OgYWq026sKVi2/Cm7Rgzxs6m84SI1udT61KjKrDqqA6frPV+6SQkNzv9i0QkZfdVDndQ
 ihHXBsOM8zXgJzS0fDRlcjMq33tAVat1ex7C7jM6tEtETbNg7EDrkuEqN0YzXSBR+Ddb
 6C80WfbcOjK7SqYTNnHrUtQX7gYMn+KYXR7V6jxrYjr/f6/yn3G/ymRuVzH6Hqwdm6W7
 VdpQ==
X-Gm-Message-State: AFqh2koSsCayeVQFeTX3eN5mXfILFiHbo/85JoHPM1h8iGdsERmUKyY1
 G6K6OneeDoz6l7LpxA/KHr20fA==
X-Google-Smtp-Source: AMrXdXs0l2W2ThNFSAkpY3pdmtbMYW35dXfIkkHtyIDzecLdnWSjjziGTOaK1lFvf1HMa3Z71/FToQ==
X-Received: by 2002:a05:6512:22d3:b0:4b7:66:8231 with SMTP id
 g19-20020a05651222d300b004b700668231mr15353428lfu.58.1672825504070; 
 Wed, 04 Jan 2023 01:45:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056512210e00b004a2c447598fsm5083600lfr.159.2023.01.04.01.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:45:03 -0800 (PST)
Message-ID: <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org>
Date: Wed, 4 Jan 2023 11:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:08, Neil Armstrong wrote:
> Add definitions for the display hardware used on Qualcomm SM8550
> platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>   4 files changed, 201 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b4ca123d8e69..adf5e25269dc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -402,6 +402,20 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8550_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
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
>   static const struct dpu_caps sc7280_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x7,
> @@ -579,6 +593,37 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm8550_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0, .len = 0x494,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x4330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x6330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x8330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0xa330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x24330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x26330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> +			.reg_off = 0x28330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> +			.reg_off = 0x2a330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2c330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2e330, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +			.reg_off = 0x2bc, .bit_off = 20},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -776,6 +821,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg sm8550_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x290,?
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),

CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY) ?

> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x290,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x290,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),

CTL_SC7280_MASK?

> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x290,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x290,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x290,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -1032,6 +1116,40 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
> +static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> +				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> +				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
> +				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
> +				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
> +static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
> +
> +static const struct dpu_sspp_cfg sm8550_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
> +		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> +		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +};
> +
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
>   		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -1268,6 +1386,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	.len = 0x20, .version = 0x20000},
>   };
>   
> +#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0, \

len = 0 looks incorrect. Any particular reason why can't we use plain 
PP_BLK here?

> +	.features = BIT(DPU_PINGPONG_DITHER), \
> +	.merge_3d = _merge_3d, \
> +	.sblk = &_sblk, \
> +	.intr_done = _done, \
> +	.intr_rdptr = _rdptr, \
> +	}
>   #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>   	{\
>   	.name = _name, .id = _id, \
> @@ -1371,6 +1499,33 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
>   			-1),
>   };
>   
> +static const struct dpu_pingpong_cfg sm8550_pp[] = {
> +	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +			-1),
> +	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
> +			-1,
> +			-1),
> +	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
> +			-1,
> +			-1),
> +};
> +
>   /*************************************************************
>    * MERGE_3D sub blocks config
>    *************************************************************/
> @@ -1395,6 +1550,13 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>   };
>   
> +static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
> +};
> +
>   /*************************************************************
>    * DSC sub blocks config
>    *************************************************************/
> @@ -1481,6 +1643,14 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>   };
>   
> +static const struct dpu_intf_cfg sm8550_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	/* TODO TE sub-blocks for intf1 & intf2 */
> +	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
>   /*************************************************************
>    * Writeback blocks config
>    *************************************************************/
> @@ -2188,6 +2358,32 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
>   	.mdss_irqs = IRQ_SM8450_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
> +	.caps = &sm8550_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm8550_mdp),
> +	.mdp = sm8550_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8550_ctl),
> +	.ctl = sm8550_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8550_sspp),
> +	.sspp = sm8550_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8550_pp),
> +	.pingpong = sm8550_pp,
> +	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
> +	.merge_3d = sm8550_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8550_intf),
> +	.intf = sm8550_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8450_regdma,
> +	.perf = &sm8450_perf_data,
> +	.mdss_irqs = IRQ_SM8450_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>   	.caps = &sc7280_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> @@ -2248,6 +2444,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_900, .dpu_cfg = &sm8550_dpu_cfg},
>   };
>   
>   const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 29e7ea5840a2..7a8380f5c643 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -48,6 +48,7 @@
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
> +#define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
>   
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
>   #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 6d8e1bb3b3cc..dccad33532a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -120,6 +120,8 @@ enum dpu_sspp {
>   	SSPP_DMA1,
>   	SSPP_DMA2,
>   	SSPP_DMA3,
> +	SSPP_DMA4,
> +	SSPP_DMA5,
>   	SSPP_CURSOR0,
>   	SSPP_CURSOR1,
>   	SSPP_MAX
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0434cad511a4..18fefa116a56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1303,6 +1303,7 @@ static const struct of_device_id dpu_dt_match[] = {
>   	{ .compatible = "qcom,sm8150-dpu", },
>   	{ .compatible = "qcom,sm8250-dpu", },
>   	{ .compatible = "qcom,sm8450-dpu", },
> +	{ .compatible = "qcom,sm8550-dpu", },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, dpu_dt_match);
> 

-- 
With best wishes
Dmitry

