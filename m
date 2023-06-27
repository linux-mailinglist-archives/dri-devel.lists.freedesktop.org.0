Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D773F757
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FA410E2B0;
	Tue, 27 Jun 2023 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D3710E2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:34:20 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C41FD2005C;
 Tue, 27 Jun 2023 10:34:18 +0200 (CEST)
Date: Tue, 27 Jun 2023 10:34:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 11/19] drm/msm/dpu: inline DSPP_BLK macros
Message-ID: <4vq65sptcqw2qtgameuljcupq2ykrv6su7hvnmlme4d4lzfzw4@zn4bilb67bx3>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-12-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-20 00:25:11, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Validated that this incurs no changes by checksumming a stripped
dpu_hw_catalog.o.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 15 +++++++---
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +++--
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 29 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 29 ++++++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  8 -----
>  16 files changed, 215 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index fd0081469a82..6b254753774c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -174,10 +174,17 @@ static const struct dpu_dsc_cfg msm8998_dsc[] = {
>  };
>  
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &msm8998_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &msm8998_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &msm8998_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &msm8998_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 7ba99060d13d..8661ef2f45e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -152,14 +152,27 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sdm845_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sdm845_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 13d86229219e..ab933b5a4806 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -161,14 +161,27 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm8150_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 76b59b27d1ee..68c9034bb552 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -160,14 +160,27 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sc8180x_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sc8180x_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 5d9718f20429..1383697f24dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -161,14 +161,27 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm8250_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm8250_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index cd76e17a8501..9fd4b1c37bc1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -97,8 +97,12 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sc7180_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sc7180_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index dfba4efe5f39..1c69b28cc3a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -67,8 +67,12 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm6115_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm6115_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 602197844580..9874b30fd1e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -105,8 +105,12 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm6350_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		&sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static struct dpu_pingpong_cfg sm6350_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 8d766236b459..128dc13d4e21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -64,8 +64,12 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg qcm2290_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg qcm2290_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 9864f649113c..7d64336a607a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -68,8 +68,12 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm6375_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		&sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm6375_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 16b46c045706..6c57b3478db8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -159,14 +159,27 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm8350_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm8350_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 2901c96f3587..a46134205df2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -105,8 +105,12 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sc7280_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 9c4ec2d5ab14..e61116d4366c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -155,14 +155,27 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 39534de5472c..3a4e8a9010f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -161,14 +161,27 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm8450_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  
>  static const struct dpu_pingpong_cfg sm8450_pp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 8ddf398d7f54..423d0d26de48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -178,14 +178,27 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
>  };
>  
>  static const struct dpu_dspp_cfg sm8550_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8150_dspp_sblk,
> +	},
>  };
>  static const struct dpu_pingpong_cfg sm8550_pp[] = {
>  	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 9661dc7a4570..cc459c2700b2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -441,14 +441,6 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
>  		.len = 0x90, .version = 0x40000},
>  };
>  
> -#define DSPP_BLK(_name, _id, _base, _mask, _sblk) \
> -		{\
> -		.name = _name, .id = _id, \
> -		.base = _base, .len = 0x1800, \
> -		.features = _mask, \
> -		.sblk = _sblk \
> -		}
> -
>  /*************************************************************
>   * PINGPONG sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
