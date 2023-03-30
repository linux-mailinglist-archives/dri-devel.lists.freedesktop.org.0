Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560B6D0688
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF39010EE36;
	Thu, 30 Mar 2023 13:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA17C10EE20
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:25:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id t14so19600835ljd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07LjWWg+0xzXlxPjHSTh1cXdzSHKa7s3K4tFGAosa8s=;
 b=NrqSsmzT+TUiyIH5/BWbppRPQgacJR0L7hk8Cymau0pFmINBmA2utFUyLW4ed7B4do
 kcr7nlEPPugnef1bgt9NJUnhY0b2v9Rr18mevhPhMP48GkZ3G+o/2R/bCl8FDUZQ+pNN
 AIBwRfx1fmE1SUCJGKYvOyyqVMHARRH6tL065OtaaJ6uKDKBya1RjmojFtooGBxaEDNU
 Kdj6c/t69ea1MoM2GrgH4ayO7RYc7ul81niJC7HIIt12LNTA/Ny/51IHn5WnZbLUweZY
 f7z81YETxo5zTAgUz7CQB99nYyZbvpdFUGm0J6RTLs87PjtowXYzPTQG9n22SBAraL9f
 z3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=07LjWWg+0xzXlxPjHSTh1cXdzSHKa7s3K4tFGAosa8s=;
 b=LX1J+4shc/ZqydRIe/STFTwnD2rZdJqdjdBA5/Uv75NF9sQOGppT+GHHYkQOCGdMlw
 122un4T4cAt12y4KEfXWanYtXBGMXSYDDTO6+w1yhhoZLa1d4N2Z2r9x6lfBnTfpTfdY
 hbuUKOjYxYYUJ4ldPij1yCb1EPvRvjcgKSUGEiIBTcC8PsVP2tgrE+3Zlw5a43ww4nZz
 PZ0oj+YHgyzSOAGzkW5yDq6UiKDVVIv2bQ55Rjw8wK/syANACdxD/ixbwT5CR1dXcDfU
 gyv5ohVtl/Fe4B1We+dKzlveylmq78ctAv0U/xRwqzTLO29N4idJo4sBMtXdUwptmYwM
 379w==
X-Gm-Message-State: AAQBX9dj2nEdsGaxH6Hb83sS3utrgCELYYgGsLO5ObImjHUCo8bIhFpf
 fheLc1BFQKuCkOu6uEdmSJT0tA==
X-Google-Smtp-Source: AKy350Y7KwThKSdGr9mTIoJiRfg5Dw2Vx7HdbSWB0Uw13WeeptWnPFRi8g5UFDjQFSOuvN9xd9tJSQ==
X-Received: by 2002:a2e:9005:0:b0:294:697a:d6af with SMTP id
 h5-20020a2e9005000000b00294697ad6afmr7087943ljg.39.1680182725866; 
 Thu, 30 Mar 2023 06:25:25 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a2e9b02000000b002a5f6de7b09sm1731516lji.0.2023.03.30.06.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:25:25 -0700 (PDT)
Message-ID: <5a190bc4-105e-284b-fad3-c6e8f55cc35f@linaro.org>
Date: Thu, 30 Mar 2023 15:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,49/50] drm/msm/dpu: rename MIXER_foo_MASK to contain major
 DPU version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-50-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-50-dmitry.baryshkov@linaro.org>
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
> To ease review and reuse rename MIXER feature masks to contain base DPU
> version since which this mask is used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  3 +++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  9 +++------
>  11 files changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 88b7949f803e..3ec1419dd985 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -98,17 +98,17 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg msm8998_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_3_MASK,
>  		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index c8c57250473a..7d6e5d608c04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -96,17 +96,17 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sdm845_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> -	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x0, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x0, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> index 2f849cbaaa0f..f66a460a3f49 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> @@ -97,17 +97,17 @@ static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg dpu_5_lm6_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 071814394b52..528d8bb4be52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -103,17 +103,17 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sm8250_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 4be65088de0e..e34789963936 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -69,9 +69,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sc7180_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> index 4f42105d3755..339f774299c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> @@ -7,6 +7,9 @@
>  #ifndef _DPU_6_LM1_H
>  #define _DPU_6_LM1_H
>  
> +#define MIXER_QCM2290_MASK \
> +	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> +
>  static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 31c12b0415ad..20339746db79 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -101,17 +101,17 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sm8350_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index a7040d9d83de..78d7c08f7a05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -74,11 +74,11 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sc7280_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
>  		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> index fb1fbba12a5b..15652b160b3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> @@ -96,12 +96,12 @@ static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
>  static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 1d38d1c3e12a..e28529ef1db7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -107,17 +107,17 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>  };
>  
>  static const struct dpu_lm_cfg sm8550_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
>  		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0a86428af393..b8143a3c35b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -49,14 +49,11 @@
>  #define DMA_DPU_4_CURSOR_MASK \
>  	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
>  
> -#define MIXER_MSM8998_MASK \
> +#define MIXER_DPU_3_MASK \
>  	(BIT(DPU_MIXER_SOURCESPLIT))
>  
> -#define MIXER_SDM845_MASK \
> -	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> -
> -#define MIXER_QCM2290_MASK \
> -	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> +#define MIXER_DPU_4_MASK \
> +	(MIXER_DPU_3_MASK | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>  
>  #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
>  
