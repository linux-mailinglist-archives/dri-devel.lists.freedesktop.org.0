Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F24B53BE94
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 21:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338EF112BBC;
	Thu,  2 Jun 2022 19:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE870112AA5;
 Thu,  2 Jun 2022 19:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654197724; x=1685733724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+jSNvGTRr4q9BCUbtPJPdq6gs6yP0IGw6YPgO/8GEh4=;
 b=N5EJ0kOPrrB4sVxiaOFwMjYh1T5u4nXuu1aEfuhj+7p6IgIYb9L+3fuX
 cYrJ+pSOn49PZV839ZzQi/pDGszYYiogwr/vG0q0GtpYGrKswdKstHHDy
 YaZokqGNZUWZcrOJfJ9sCv1U4CDdyPl184ZQAJK7VKgRPwEVGu6qWRw8X U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 12:22:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 12:22:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 12:22:02 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 12:22:00 -0700
Message-ID: <a49bfbba-be6d-6bb7-8711-c25f08b66c0e@quicinc.com>
Date: Thu, 2 Jun 2022 12:21:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const
 pointer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Change dpu_mdss_cfg::dma_cfg to be a const pointer rather than embedding
> the dpu_reg_dma_cfg struct into the struct dpu_mdss_cfg.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 +-
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a7040ca5da72..5470b8b14b0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1780,7 +1780,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &sdm845_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
> @@ -1811,7 +1811,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &sc7180_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
> @@ -1844,7 +1844,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8150_regdma,
> +		.dma_cfg = &sm8150_regdma,
>   		.perf = &sm8150_perf_data,
>   		.mdss_irqs = IRQ_SDM845_MASK,
>   	};
> @@ -1875,7 +1875,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8150_regdma,
> +		.dma_cfg = &sm8150_regdma,
>   		.perf = &sc8180x_perf_data,
>   		.mdss_irqs = IRQ_SC8180X_MASK,
>   	};
> @@ -1910,7 +1910,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.wb_count = ARRAY_SIZE(sm8250_wb),
>   		.wb = sm8250_wb,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sm8250_regdma,
> +		.dma_cfg = &sm8250_regdma,
>   		.perf = &sm8250_perf_data,
>   		.mdss_irqs = IRQ_SM8250_MASK,
>   	};
> @@ -1965,7 +1965,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>   		.vbif = sdm845_vbif,
>   		.reg_dma_count = 1,
> -		.dma_cfg = sdm845_regdma,
> +		.dma_cfg = &sdm845_regdma,
>   		.perf = &qcm2290_perf_data,
>   		.mdss_irqs = IRQ_SC7180_MASK,
>   	};
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 64ed96b2fa3d..60b403ac9f0f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -859,7 +859,7 @@ struct dpu_mdss_cfg {
>   	const struct dpu_wb_cfg *wb;
>   
>   	u32 reg_dma_count;
> -	struct dpu_reg_dma_cfg dma_cfg;
> +	const struct dpu_reg_dma_cfg *dma_cfg;
>   
>   	u32 ad_count;
>   
