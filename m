Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61170C138
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6687010E33E;
	Mon, 22 May 2023 14:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710CB10E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:37:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f606912ebaso8604245e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684766224; x=1687358224;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=T4XiPRv2kQi3rk35PUyh6W94xYsv2wRcI+Ot2AMoq5o=;
 b=YqhJoK4r7gnq7yVDz69pOJZOijkAtFdmeidSq9kpbgCXd7mArNBzdqqVpMoT/BrGzU
 TGp3yyKX0gmUaF4Jo475F3OWB9xV8o3zdEVNolYnagc3TaqvLZ3L8DAEKZkDcc+4TJIl
 Rne2VJkmdkU3SlIMFbMa8iYSkXznJAB8YhJLEyTvSSRA+AQArydxPqWeW/mVcBbZfXWr
 AXrmFFa+y2zXuPcfuITlxB4G8cuPEheMSo2mW6lawObIkHYaEdAEOOf5/bAtWtpg/6J0
 yaNy5rEaPq2cN98thzP40RpOw5mBe/LX/WdPEsJkkq4WsSrLDYnquDf2wpJ5mmvwgwbg
 5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684766224; x=1687358224;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4XiPRv2kQi3rk35PUyh6W94xYsv2wRcI+Ot2AMoq5o=;
 b=KgODhmnHF0KJobs2ylc5ylehlIuBn2zFzXIn0jyrQsS14+TEE8BkpxRq6CVOU5wCDn
 0A8e+PfT/egFVUdcrU0Cj9ulsT6ubE8g0ffAOOLVFKwkufkQ8f04Ir4Csp+0H0HtWnhC
 yCg4Y1ptmWlFRInM92chxFRR0E4gzY11CpTzPF4BxsXibA51VSvuHQktgZqhrxsCM0tg
 Zgbs+EMLWSXXb8kbN9pV4vAhwEH7bYYY/4sum3QO2+ljosXhuBm+6PNd3shA89aRP6xB
 gmhU1CN2qexcD/mDAWt5virOVQqLD/1H6AJHhg2xuFc/S8zdOBtmf+4Qp9daFgR75agV
 DlXQ==
X-Gm-Message-State: AC+VfDxXUyi8bhplsWHXV2hmCPmca2FDpEPg59EOfXTS/4jOXmuedZ3j
 q+mWXzpPsybKn+XASQheePnziw==
X-Google-Smtp-Source: ACHHUZ52TsBofu01lZU+TLi6fsQQCbq/5ggCABYyckjbcVa2edMUpsrKNFT2yDX98jXgrYjrINPNzA==
X-Received: by 2002:a1c:7918:0:b0:3f6:766:f76f with SMTP id
 l24-20020a1c7918000000b003f60766f76fmr1287721wme.36.1684766224512; 
 Mon, 22 May 2023 07:37:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a7bce83000000b003f4fb5532a1sm8561816wmj.43.2023.05.22.07.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:37:04 -0700 (PDT)
Message-ID: <b32f9e5b-7d98-dfc5-12f1-691fa0ee6ddc@linaro.org>
Date: Mon, 22 May 2023 16:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] drm/msm/dpu: drop now-unused mdss_irqs field from hw
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-6-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-6-dmitry.baryshkov@linaro.org>
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

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> Now as the list of the interrupts is constructed from the catalog
> data, drop the mdss_irqs field from catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 --------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  9 ---------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 11 -----------
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 13 -------------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 10 ----------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  6 ------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  5 -----
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  5 -----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  9 ---------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 14 --------------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  9 ---------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  9 ---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ---
>   14 files changed, 118 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 3c732a0360c7..ff7c3d522046 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -204,14 +204,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>   	.vbif_count = ARRAY_SIZE(msm8998_vbif),
>   	.vbif = msm8998_vbif,
>   	.perf = &msm8998_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..c4ccd742690a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -202,15 +202,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sdm845_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index b5f751354267..fb7069d470ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -231,17 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sm8150_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 8ed2b263c5ea..bd7422e597aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -237,19 +237,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sc8180x_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR) | \
> -		     BIT(MDP_INTF5_INTR) | \
> -		     BIT(MDP_AD4_0_INTR) | \
> -		     BIT(MDP_AD4_1_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index daebd2170041..75a5c1b5a74a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -239,16 +239,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>   	.wb_count = ARRAY_SIZE(sm8250_wb),
>   	.wb = sm8250_wb,
>   	.perf = &sm8250_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_INTR) | \
> -		     BIT(MDP_INTF2_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_INTR) | \
> -		     BIT(MDP_INTF4_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 0b05da2592c0..84be02ce9c9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -149,12 +149,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sc7180_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index ba9de008519b..71d6e036a7a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -122,11 +122,6 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sm6115_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 92ac348eea6b..d80b383d874d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -112,11 +112,6 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &qcm2290_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF1_INTR) | \
> -		     BIT(MDP_INTF1_TEAR_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 3c1b2c13398d..f9e5f252ae54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -222,15 +222,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sm8350_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 5d894cbb0a62..dede8cb2d784 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -162,13 +162,6 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sc7280_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF5_7xxx_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index c3f1ae000a21..79ab2d015a44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -224,20 +224,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sc8280xp_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR) | \
> -		     BIT(MDP_INTF4_7xxx_INTR) | \
> -		     BIT(MDP_INTF5_7xxx_INTR) | \
> -		     BIT(MDP_INTF6_7xxx_INTR) | \
> -		     BIT(MDP_INTF7_7xxx_INTR) | \
> -		     BIT(MDP_INTF8_7xxx_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 86c2e68ebd2c..b0bc88136e86 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -230,15 +230,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sm8450_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 85dc34458b88..afed62e44f90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -234,15 +234,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>   	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   	.vbif = sdm845_vbif,
>   	.perf = &sm8550_perf_data,
> -	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> -		     BIT(MDP_SSPP_TOP0_INTR2) | \
> -		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> -		     BIT(MDP_INTF0_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_INTR) | \
> -		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_INTR) | \
> -		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> -		     BIT(MDP_INTF3_7xxx_INTR),
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 72530ebb0ae6..6d8c2fa8558a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -777,7 +777,6 @@ struct dpu_perf_cfg {
>    * @dma_formats        Supported formats for dma pipe
>    * @cursor_formats     Supported formats for cursor pipe
>    * @vig_formats        Supported formats for vig pipe
> - * @mdss_irqs:         Bitmap with the irqs supported by the target
>    */
>   struct dpu_mdss_cfg {
>   	const struct dpu_caps *caps;
> @@ -825,8 +824,6 @@ struct dpu_mdss_cfg {
>   	const struct dpu_format_extended *dma_formats;
>   	const struct dpu_format_extended *cursor_formats;
>   	const struct dpu_format_extended *vig_formats;
> -
> -	unsigned long mdss_irqs;
>   };
>   
>   extern const struct dpu_mdss_cfg dpu_msm8998_cfg;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
