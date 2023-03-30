Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775536D0640
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA810EE12;
	Thu, 30 Mar 2023 13:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E3410EDF9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:15:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q14so19547020ljm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yu71wLl9BjEf3F/PSecyKlTH9Pot4V/Fk/w0w2XsVug=;
 b=qQwY+bD3VbjEOdRh15hy8opft73FtYeVvdpgi9qQrFt5FR4AqYSCmxE3HzngaTImX1
 4gt8MjbpTFhDk5ZuePptz+pF6UzgRmDnjonGgcDGBgV51gF6L9IxSQzkwgLg1JAbfS0r
 BPxI49Q3Ndxs8Kh1xS9s8uagd9PR1K0xSmf8DVSwOXBOAf/qhNEYrZ5AHtAMZBr4sN5d
 7GboD9qaihW7H9w8tEnjnKcrN/cFgn2hJcHG/l6bXA4nRtyHi4bJCr2QCamLmY2u5Mqm
 pl02QAYH4wboGcctI+5YCUpqrtG2TBd2PosQHhI4TZs470K7LxlWlvLixTMUHmEAD8iA
 UICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yu71wLl9BjEf3F/PSecyKlTH9Pot4V/Fk/w0w2XsVug=;
 b=w9ndX52uZL3NpChtSMDSYbt7mBTcXi6sYnl/YvqoACbxUhX7I+bRcDHSdiqH04xvC5
 G3yW7c7fUwGjBLmFFpQra4+6B96dxcg6gagvJBmo67rhsgP9hejCFbov5UNznONdUhLs
 gwY66nKUL6NWhKlDZRK5RHeP/VGV3QUdKnb/fxZ2JFZ3sC/+n1XIc2gq8sSwA1bb9BNj
 nAyqiHU+u9t0vbuZ7GQ0YdCgeiHSQK9p24ueBH0U1e9sDb0QsgOnPlWgUNFi1y8FT69E
 jJrnd7tUQSvvmOXj84RDWGqnl9YMeOXZHLM28PAhdrmvtYRthy3HM6QHf8WZC/j3kuHt
 6cpA==
X-Gm-Message-State: AAQBX9enZJJ95OGMsaZJASoGeKiiJtreQWkSp8uCnxHO7zW4xvXfUt5a
 /MRSrLiHfYEuBOqbRQk5Xy4WUw==
X-Google-Smtp-Source: AKy350bvhtsBJy39OKCEPQDGvmLYb/q/dZOx1JsCIQRAtvn8yUakgDtlMz4xrZmpfk8ss5s+U02K+A==
X-Received: by 2002:a05:651c:203:b0:298:b065:c29b with SMTP id
 y3-20020a05651c020300b00298b065c29bmr7535497ljn.38.1680182157669; 
 Thu, 30 Mar 2023 06:15:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a2e8082000000b0029d45b15338sm4542405ljg.42.2023.03.30.06.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:15:57 -0700 (PDT)
Message-ID: <045895cf-7866-1c0c-51c3-34ea3a7f0cab@linaro.org>
Date: Thu, 30 Mar 2023 15:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2, 47/50] drm/msm/dpu: rename CTL_foo_MASK to contain major DPU
 version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-48-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-48-dmitry.baryshkov@linaro.org>
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
> To ease review and reuse rename CTL feature masks to contain base DPU
> version since which this mask is used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 10 +++++-----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 10 +++++-----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 12 ++++++++----
>  11 files changed, 56 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 5e8200d929e4..d42c380275bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -49,31 +49,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x94,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
Again, I'd vote for DPU_3

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x94,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0x94,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x94,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x94,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index daef5e48e7ee..281556416322 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -47,31 +47,31 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0xe4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0xe4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0xe4,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0xe4,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0xe4,
> -	.features = 0,
> +	.features = CTL_DPU_0_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> index 294702531ce2..7c051c142e06 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> @@ -42,37 +42,37 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a00, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index fd5df2bdec0e..cffbb6bcc535 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a00, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 66762a0706de..78f8b2506675 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -40,19 +40,19 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> index 2849c017ddf2..4f42105d3755 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
> @@ -21,7 +21,7 @@ static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x1dc,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.features = CTL_DPU_5_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 60ad844cfa25..6826758fa202 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x1e8,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x1e8,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x17000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x18000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x19000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 387f2b6c5b56..c5981ea3ec7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -39,25 +39,25 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x17000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x18000, .len = 0x1e8,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> index 80a7b0670467..5c87e919ea22 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> @@ -41,37 +41,37 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x17000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x18000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x19000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = CTL_DPU_7_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 53db0049eecc..334946c8d4e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x290,
> -	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x290,
> -	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x17000, .len = 0x290,
> -	.features = CTL_SM8550_MASK,
> +	.features = CTL_DPU_9_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x18000, .len = 0x290,
> -	.features = CTL_SM8550_MASK,
> +	.features = CTL_DPU_9_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x19000, .len = 0x290,
> -	.features = CTL_SM8550_MASK,
> +	.features = CTL_DPU_9_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a000, .len = 0x290,
> -	.features = CTL_SM8550_MASK,
> +	.features = CTL_DPU_9_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6b78554df30c..3c604f7b88aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -65,11 +65,15 @@
>  #define PINGPONG_SDM845_SPLIT_MASK \
>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>  
> -#define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +#define CTL_DPU_0_MASK  (0)
>  
> -#define CTL_SM8550_MASK \
> -	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | BIT(DPU_CTL_ACTIVE_CFG))
> +
> +#define CTL_DPU_7_MASK \
> +	(CTL_DPU_5_MASK | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +
> +#define CTL_DPU_9_MASK \
> +	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>  
>  #define MERGE_3D_SM8150_MASK (0)
>  
