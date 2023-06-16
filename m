Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E0733CB3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 01:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBF910E13B;
	Fri, 16 Jun 2023 23:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D8910E6A7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 23:03:04 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 48A00214E1;
 Sat, 17 Jun 2023 01:03:02 +0200 (CEST)
Date: Sat, 17 Jun 2023 01:03:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 18/19] drm/msm/dpu: drop empty features mask
 MERGE_3D_SM8150_MASK
Message-ID: <zril7btbv4ewrm7xgatmxx5oez6hatc7qkoladghlupvn4twr2@7akyctamgxkm>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-19-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-19-dmitry.baryshkov@linaro.org>
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

On 2023-06-16 13:03:16, Dmitry Baryshkov wrote:
> The MERGE_3D_SM8150_MASK features mask is zero. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
>  8 files changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index c8c702e4f045..94d97d7f6ff3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -273,15 +273,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x83000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x83100, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x83200, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 11bf4cec0f95..acf14227e68e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -272,15 +272,12 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x83000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x83100, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x83200, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index bf35b5bf0cd1..0936b719b9c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -273,15 +273,12 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x83000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x83100, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x83200, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index d5191a663ae1..59a96a4b250c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -271,15 +271,12 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x4e000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x4f000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x50000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 9f94cc6369dd..7110caae7251 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -275,15 +275,12 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x4e000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x4f000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x50000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 517629c4a168..dcafab3e4b1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -291,19 +291,15 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x4e000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x4f000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x50000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_3", .id = MERGE_3D_3,
>  		.base = 0x65f00, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index ed1d1d4092e8..7b96f827c2b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -305,19 +305,15 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  	{
>  		.name = "merge_3d_0", .id = MERGE_3D_0,
>  		.base = 0x4e000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_1", .id = MERGE_3D_1,
>  		.base = 0x4f000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_2", .id = MERGE_3D_2,
>  		.base = 0x50000, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	}, {
>  		.name = "merge_3d_3", .id = MERGE_3D_3,
>  		.base = 0x66700, .len = 0x8,
> -		.features = MERGE_3D_SM8150_MASK,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6acd34e61aca..4a18fc66a412 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -93,8 +93,6 @@
>  #define CTL_SM8550_MASK \
>  	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>  
> -#define MERGE_3D_SM8150_MASK (0)
> -
>  #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>  
>  #define INTF_SDM845_MASK (0)
> -- 
> 2.39.2
> 
