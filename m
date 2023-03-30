Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B160A6D0483
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9F10EDE4;
	Thu, 30 Mar 2023 12:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9610E7C2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:21:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c29so24283252lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mj+jQvqfsQg0GYU1HrWoFihjlq4T/WcOwAeTP0PI2+w=;
 b=XyqbhXLn98gw21TwQFJBlcpqSSsHkXa1B5UD8hl2YJV06COp+5J/xDsMvpTbSQTcEZ
 58tB8/qZfnweD4+t47AuU4S6jf0424LDy5HuPG4InABAsmTgtZySUvqBF5fb+4FMgtK3
 sqnBaIND5ATyIRnGvV5hKqDYBZ3ORJZTmehRBFYKWmJqWNZozOwmA/PD4tMo6dNLueAN
 HpePU5uDn3D3rgUy+3FlrZD8YzNGpu8kMH47IBGMddBCJB2kTz0oqXYsPi4MHVBNlfno
 x82NroDfPYBY2gzW8AKfUybB+/sYY3soX6cd9ca2tXoxyrug1M1MGRPYr6LfINnZ1bvy
 hqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj+jQvqfsQg0GYU1HrWoFihjlq4T/WcOwAeTP0PI2+w=;
 b=T+jM9ibKofofbAhgd96bbv7k5Md8ZNS0YhFeE6j5WgsUeJbMtQRPz3NpYwt+cjFToK
 xMe+9NEXhgf+78CxKVpLItm4bdilsXZaPw1EjRkoYG6VNzEl0jX4eAJ3Skw/c/5rNIkr
 TRWet42IjeSADmZrzuR9mohRab+qPTkOuWf4yg6/WPvuI0655Q45PulQrFwgNAbABFSr
 JGppHQm61rYl9fmbhNacQOkPDXG5ZcnCcwtr0A7GuM8Wy7DNeuaN1dwQORSCPACqjB7l
 mDVInaciIvu7piVH9jq/jV4fLb7OSqOMmNasNSP2k9iIupfv8phvvgLNtZ8X3SdBMT3D
 MxvA==
X-Gm-Message-State: AAQBX9fYsJahu3WZ2SXi3wzd6icNs/NnRhpP7EsOedUQyjQU8ukX6pkn
 EoxqB7hrHV/5Q9cFhxRzI3jGNQ==
X-Google-Smtp-Source: AKy350berVdJAV7LtIJu0UeRYQfoH146g4vZbdfJRlHx3rTqz53ct3F8mHtvuwzouQMUqNB7ZK424w==
X-Received: by 2002:ac2:495e:0:b0:4e9:bafc:88d3 with SMTP id
 o30-20020ac2495e000000b004e9bafc88d3mr6178297lfi.59.1680178880552; 
 Thu, 30 Mar 2023 05:21:20 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a056512015000b004eb07f5cde6sm2439190lfo.297.2023.03.30.05.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:21:20 -0700 (PDT)
Message-ID: <b99845e8-69a1-ba7b-1960-45998591ab20@linaro.org>
Date: Thu, 30 Mar 2023 14:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,31/50] drm/msm/dpu: duplicate sdm845 catalog entries
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-32-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-32-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Duplicate some of sdm845 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 19 +++++++-
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 43 +++++++++++++++++--
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
>  4 files changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index c963365a9945..36a4f11f44b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -112,6 +112,21 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>  		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
>  };
>  
> +static const struct dpu_pingpong_cfg msm8998_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +};
> +
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>  		 &msm8998_dspp_sblk),
> @@ -175,8 +190,8 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
>  	.mixer = msm8998_lm,
>  	.dspp_count = ARRAY_SIZE(msm8998_dspp),
>  	.dspp = msm8998_dspp,
> -	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> -	.pingpong = sdm845_pp,
> +	.pingpong_count = ARRAY_SIZE(msm8998_pp),
> +	.pingpong = msm8998_pp,
>  	.intf_count = ARRAY_SIZE(msm8998_intf),
>  	.intf = msm8998_intf,
>  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 08b9648eed37..f7c79474133a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -27,6 +27,22 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
>  	.highest_bank_bit = 0x2,
>  };
>  
> +static const struct dpu_mdp_cfg sm8150_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45c,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	},
> +};
> +
>  static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> @@ -66,6 +82,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	},
>  };
>  
> +static const struct dpu_sspp_cfg sm8150_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
> +		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
>  static const struct dpu_lm_cfg sm8150_lm[] = {
>  	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> @@ -165,12 +200,12 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.caps = &sm8150_dpu_caps,
>  	.ubwc = &sm8150_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -	.mdp = sdm845_mdp,
> +	.mdp_count = ARRAY_SIZE(sm8150_mdp),
> +	.mdp = sm8150_mdp,
>  	.ctl_count = ARRAY_SIZE(sm8150_ctl),
>  	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -	.sspp = sdm845_sspp,
> +	.sspp_count = ARRAY_SIZE(sm8150_sspp),
> +	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
>  	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 732ff876d311..c51e1bba1533 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -87,8 +87,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.mdp = sc8180x_mdp,
>  	.ctl_count = ARRAY_SIZE(sm8150_ctl),
>  	.ctl = sm8150_ctl,
> -	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> -	.sspp = sdm845_sspp,
> +	.sspp_count = ARRAY_SIZE(sm8150_sspp),
> +	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 82a1d18cbaa3..d84f8eb8f88a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -854,10 +854,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   * Hardware catalog
>   *************************************************************/
>  
> -#include "catalog/dpu_4_0_sdm845.h"
> -
>  #include "catalog/dpu_3_0_msm8998.h"
>  
> +#include "catalog/dpu_4_0_sdm845.h"
> +
>  #include "catalog/dpu_5_0_sm8150.h"
>  #include "catalog/dpu_5_1_sc8180x.h"
>  
