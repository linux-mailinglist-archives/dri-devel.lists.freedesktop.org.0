Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8466D05EF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62A210EE0D;
	Thu, 30 Mar 2023 13:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D99010E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:08:56 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c9so14012593lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680181734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C8j24A2/3sOqQc/Ns0LZOgQuqPO89v76cYWjmW5XyVU=;
 b=TS94PzLWd3huyR2eFJ2A8R0ctJNjZJlBu3oMZC7+4q/bT6WqgUgDlQTW1lL0u6PyMr
 fAqsgfBPiVt4MlLnd9Q7MH4NtbdXav+Ibox9c5pnMARgS+2JRXwplBU8oMdoNdRwUVem
 Mrag6c4N/BCoj1VA7eovIIUG7xEkNLdCkMZjZ1/WT226YNDN3rkGR0wKFNPBWuhG6QI4
 ee+z1dC3FeytaK8lIbEVAo6rRJ3mW2nGs8TcRk6ZZkVG8jknO8F8V4g925CJTyujLYP0
 uMlsY5Dxr5d4Puenopavw5GyaH3qPEMrxZQPDBTtJY8z2Djhziz/MjHjnXUeERA0p4qM
 4eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C8j24A2/3sOqQc/Ns0LZOgQuqPO89v76cYWjmW5XyVU=;
 b=l57JancEJJ0hxp14JVF7pgCKdiEUB5ByNiA8wGaaK3MothyXluGoPcXY3fttDpgDJ4
 8wDp36Cm09LoO5FFfE2sLl5kdKY2VX3s3eo6JR6ufHPBrUC+rlVbQmkOGVP9KiBrltXh
 FFbbpo336BgpYWVdGSXxEJ0kzyx02BLSYC2IfOauKjHLesLJAsjfhDK9dbwn5Woe8i7Q
 u0FT4chLWLPUa9FGnPG2IehVCkZH0qKpJPVV8x5jnuvWrgvL+Vnw4gwtJzFJ3siE43/H
 Stq/RnNE2Uwd2zfjvpl+Uy1j7Dw5dfRPkGuk6wKSEeLpLPdB6URJRgGUCQQyRwNy03QV
 fbxA==
X-Gm-Message-State: AAQBX9cp69C7zAnYVTpbaIcealeOsVIkN3f7hz8Hl2m8aJJrLDu9Ct3W
 bechhyROGBCT2Fs90/IX2QqPqA==
X-Google-Smtp-Source: AKy350ZCBTx6qAiYq92Z8UEAb6rP2iyhYRwzWz2zoG4GdmYOaut/CUAdzHIT2lAMG1ML2SkXyi3gnA==
X-Received: by 2002:a19:ee11:0:b0:4e8:77a:f894 with SMTP id
 g17-20020a19ee11000000b004e8077af894mr6595431lfb.25.1680181734148; 
 Thu, 30 Mar 2023 06:08:54 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056512219000b004d85895d7e0sm4056462lft.147.2023.03.30.06.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:08:53 -0700 (PDT)
Message-ID: <85299bfa-8c20-a377-8904-afc4f3a41be6@linaro.org>
Date: Thu, 30 Mar 2023 15:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,45/50] drm/msm/dpu: inline IRQ_n_MASK defines
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-46-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-46-dmitry.baryshkov@linaro.org>
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
> IRQ masks are rarely shared between different DPU revisions. Inline them
> to the dpu_mdss_cfg intances and drop them from the dpu_hw_catalog.c
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Everything looks good!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  9 ++-
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 10 ++-
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 10 ++-
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 12 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  9 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +-
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  6 +-
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  6 +-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 +-
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +-
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 +++-
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 +-
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  8 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 73 -------------------
>  14 files changed, 99 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 36a4f11f44b7..1eb3b5a9d485 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -198,7 +198,14 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
>  	.vbif = msm8998_vbif,
>  	.reg_dma_count = 0,
>  	.perf = &msm8998_perf_data,
> -	.mdss_irqs = IRQ_SM8250_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF3_INTR) | \
> +		     BIT(MDP_INTF4_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 739a301afcb4..cc6431e42932 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -197,7 +197,15 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sdm845_regdma,
>  	.perf = &sdm845_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF3_INTR) | \
> +		     BIT(MDP_AD4_0_INTR) | \
> +		     BIT(MDP_AD4_1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 33303040fbd0..a2c8b7c51890 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -83,7 +83,15 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8150_regdma,
>  	.perf = &sm8150_perf_data,
> -	.mdss_irqs = IRQ_SDM845_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF3_INTR) | \
> +		     BIT(MDP_AD4_0_INTR) | \
> +		     BIT(MDP_AD4_1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 48185e3dc873..26211f4fad99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -75,7 +75,17 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8150_regdma,
>  	.perf = &sc8180x_perf_data,
> -	.mdss_irqs = IRQ_SC8180X_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF3_INTR) | \
> +		     BIT(MDP_INTF4_INTR) | \
> +		     BIT(MDP_INTF5_INTR) | \
> +		     BIT(MDP_AD4_0_INTR) | \
> +		     BIT(MDP_AD4_1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 4e667c7e98e9..b3d3b6fb4412 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -231,7 +231,14 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8250_regdma,
>  	.perf = &sm8250_perf_data,
> -	.mdss_irqs = IRQ_SM8250_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF2_INTR) | \
> +		     BIT(MDP_INTF3_INTR) | \
> +		     BIT(MDP_INTF4_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 7f998ffa195f..2c991cb6ed7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -142,7 +142,11 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sdm845_regdma,
>  	.perf = &sc7180_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 7e4cfb0d6901..1ba646cb96a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -82,7 +82,11 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm6115_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 440240860635..2d9b54ff6510 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -72,7 +72,11 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &qcm2290_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index b27f6c528a1f..3080f34d2e5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -214,7 +214,13 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8350_regdma,
>  	.perf = &sm8350_perf_data,
> -	.mdss_irqs = IRQ_SM8350_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3117bb358117..37b1f410e2c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -148,7 +148,12 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sc7280_perf_data,
> -	.mdss_irqs = IRQ_SC7280_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF5_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 81cbc99334a6..a023f4b1b92a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -100,7 +100,18 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sc8280xp_regdma,
>  	.perf = &sc8280xp_perf_data,
> -	.mdss_irqs = IRQ_SC8280XP_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF3_7xxx_INTR) | \
> +		     BIT(MDP_INTF4_7xxx_INTR) | \
> +		     BIT(MDP_INTF5_7xxx_INTR) | \
> +		     BIT(MDP_INTF6_7xxx_INTR) | \
> +		     BIT(MDP_INTF7_7xxx_INTR) | \
> +		     BIT(MDP_INTF8_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index a453c31c4bc7..2b6d48073bce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -111,7 +111,13 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8450_regdma,
>  	.perf = &sm8450_perf_data,
> -	.mdss_irqs = IRQ_SM8450_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 1d74ea789b4d..c54b77f3c940 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -197,7 +197,13 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sm8450_regdma,
>  	.perf = &sm8450_perf_data,
> -	.mdss_irqs = IRQ_SM8450_MASK,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_7xxx_INTR) | \
> +		     BIT(MDP_INTF1_7xxx_INTR) | \
> +		     BIT(MDP_INTF2_7xxx_INTR) | \
> +		     BIT(MDP_INTF3_7xxx_INTR),
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3b015f3be31a..0b73e34d50a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -83,79 +83,6 @@
>  
>  #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>  
> -#define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_INTR) | \
> -			 BIT(MDP_INTF1_INTR) | \
> -			 BIT(MDP_INTF2_INTR) | \
> -			 BIT(MDP_INTF3_INTR) | \
> -			 BIT(MDP_AD4_0_INTR) | \
> -			 BIT(MDP_AD4_1_INTR))
> -
> -#define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_INTR) | \
> -			 BIT(MDP_INTF1_INTR))
> -
> -#define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_7xxx_INTR) | \
> -			 BIT(MDP_INTF1_7xxx_INTR) | \
> -			 BIT(MDP_INTF5_7xxx_INTR))
> -
> -#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_INTR) | \
> -			 BIT(MDP_INTF1_INTR) | \
> -			 BIT(MDP_INTF2_INTR) | \
> -			 BIT(MDP_INTF3_INTR) | \
> -			 BIT(MDP_INTF4_INTR))
> -
> -#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_7xxx_INTR) | \
> -			 BIT(MDP_INTF1_7xxx_INTR) | \
> -			 BIT(MDP_INTF2_7xxx_INTR) | \
> -			 BIT(MDP_INTF3_7xxx_INTR))
> -
> -#define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			  BIT(MDP_SSPP_TOP0_INTR2) | \
> -			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			  BIT(MDP_INTF0_INTR) | \
> -			  BIT(MDP_INTF1_INTR) | \
> -			  BIT(MDP_INTF2_INTR) | \
> -			  BIT(MDP_INTF3_INTR) | \
> -			  BIT(MDP_INTF4_INTR) | \
> -			  BIT(MDP_INTF5_INTR) | \
> -			  BIT(MDP_AD4_0_INTR) | \
> -			  BIT(MDP_AD4_1_INTR))
> -
> -#define IRQ_SC8280XP_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			   BIT(MDP_SSPP_TOP0_INTR2) | \
> -			   BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			   BIT(MDP_INTF0_7xxx_INTR) | \
> -			   BIT(MDP_INTF1_7xxx_INTR) | \
> -			   BIT(MDP_INTF2_7xxx_INTR) | \
> -			   BIT(MDP_INTF3_7xxx_INTR) | \
> -			   BIT(MDP_INTF4_7xxx_INTR) | \
> -			   BIT(MDP_INTF5_7xxx_INTR) | \
> -			   BIT(MDP_INTF6_7xxx_INTR) | \
> -			   BIT(MDP_INTF7_7xxx_INTR) | \
> -			   BIT(MDP_INTF8_7xxx_INTR))
> -
> -#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> -			 BIT(MDP_SSPP_TOP0_INTR2) | \
> -			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -			 BIT(MDP_INTF0_7xxx_INTR) | \
> -			 BIT(MDP_INTF1_7xxx_INTR) | \
> -			 BIT(MDP_INTF2_7xxx_INTR) | \
> -			 BIT(MDP_INTF3_7xxx_INTR))
> -
>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>  			 BIT(DPU_WB_UBWC) | \
>  			 BIT(DPU_WB_YUV_CONFIG) | \
