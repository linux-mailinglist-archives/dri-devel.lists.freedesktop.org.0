Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CB9E69ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737F710F03F;
	Fri,  6 Dec 2024 09:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YBMgtoTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9164F10F033
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:20:48 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffbfee94d7so15341241fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733476847; x=1734081647; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IRA3/L1MtueZJgMZJQTJG4nr5iZomdRWg1qoH/eWPx4=;
 b=YBMgtoTrDudxSNmGnh6hWVxHTHTHjvGe1xyFSTQmc4GQo6IYzi8ds6mooLIoUWYuD3
 OzjFKib7mqRlJt2RsKsuCtCHX70E4gBWnsQDtJkrtyI2LeMR/I5xOBvBDo54ImeNlflf
 oanNAYy3x1jnCKpXU5qqzKGUTvHuyG+EZHnbK3I/Szq8febt8iO6EwrOscychHlrdOmh
 lFtZ3svGbAfzUqhSjEUzm2npybG53R0rKqNIE2zlVMCjfq7oo9LX4+Vc04L8XSZWIaGE
 wVsHslWPakRnLvepr+BAJL3doH+fKRuova2BknSHC5JWtc6J8jYxRzbXZunl8fhQy6T2
 DiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733476847; x=1734081647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRA3/L1MtueZJgMZJQTJG4nr5iZomdRWg1qoH/eWPx4=;
 b=uO3AlkRmnhBGZH8q106eHkNnULUpfCFYktBlskDujChqDq0BS6lorGlAcY/u0GQZ47
 Vp+qRNste+SlR86tNC9Zs1exg2xnacATfIYxp4ewIvYMjvqkNkjnFlu//bGu4HCjm5KW
 34S2leM5PThawibDqPbMtr2aZiRL8ZAdsrQDdeLVXbf9eH6+jjhYOLttV/dklAJwDtG0
 PIHMPMYnAElih7Bo4XT6o0KlAruHR8hKUssy4Et88DLgb1Id+XFMZs8lfGOSX34/wf7W
 56Q9y9GDdg3yVyNejeYH8xY50lwRtc1U0a+UDvKWrMoIACrrf2DNezgwoUg9einD9zfQ
 vyJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ6N1hkRHtzOQeXhlCqAk6ogIivZ64kmtWQcZ5FC8wiDmZNcVkTALGQcOTiiQbfDFhUAP0OwUVeQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGHHdeIm4hL/1XZOiv1D2o645HK0rxdYJSJTKVhg4CbGDFGCSn
 p+fTSG5daK5Evdnlz7D2x70ZUcLSw35qZSK6iDava0GEVxaMfAvEcfIKreMDyVo=
X-Gm-Gg: ASbGncsSCk1Ass2tr5MhiKKxv/WxR2X31xPu+76zqezOgEbswt1g8EdA+XxiNd4Xofo
 Wax7GtypRHls/qAMM+LiQtgIhg7cOX9nvmhORcsRoYz+sNxWj8RKVqhWJJvV5FU8ayqxVjcBqHy
 F9n2bTD9oEEdnFNYjA/1PB3Mznfs/xJV0/qXQ7Xpv12YMYOOwKexYYeUllLrWqnxmoFCL7d3wuo
 K6FAsjJyW5wk3D0/yEgtqmljWhDy29nMpU0QXOTIP6rqq2KLJt5nHXXxyJOfuirL5wctWVQr5dp
 no+Ge/zLP4eega/unrJwbQV6wTDPVQ==
X-Google-Smtp-Source: AGHT+IECiQCAbYzEAjTKkWFCv1BZNgR1l7qD78Lgn6sV9wEMLOHQj41O396xk2oN3Wdy+DhHim++Vg==
X-Received: by 2002:a05:651c:1541:b0:300:264f:d002 with SMTP id
 38308e7fff4ca-3002fc68eb9mr6568881fa.27.1733476846623; 
 Fri, 06 Dec 2024 01:20:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020dbe28asm4556091fa.63.2024.12.06.01.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:20:45 -0800 (PST)
Date: Fri, 6 Dec 2024 11:20:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 40/45] drm/msm: add a stream to intf map for DP controller
Message-ID: <by3wnkql4mguqi3u4w6iuzmt747hictbdzit2wktd5zkordhum@53njkt7dzf7e>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-40-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-40-f8618d42a99a@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2024 at 08:32:11PM -0800, Abhinav Kumar wrote:
> Each DP controller capable of MST can support multiple streams
> and each of the streams maps to an interface block ID which can
> vary based on chipset. Add a stream to interface map for MST capable
> DP controllers.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_drv.h       |  7 ++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7f2eace17c126e3758c68bb0dee67662463a6e05..caac0cd3ec94e7be1389d8129fbd506998cf77da 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -116,6 +116,8 @@ struct msm_dp_display_private {
>  
>  	u32 active_stream_cnt;
>  
> +	const unsigned int *intf_map;
> +
>  	struct msm_dp_audio *audio;
>  };
>  
> @@ -123,11 +125,36 @@ struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
>  	bool wide_bus_supported;
> +	const unsigned int *intf_map;
> +};
> +
> +/* to be kept in sync with enum dpu_intf of dpu_hw_mdss.h */

This points out that it's not the best place to handle the mapping.
Please move the mapping to the DPU's hw_catalog instead.

> +enum dp_mst_intf {
> +	INTF_0 = 1,
> +	INTF_1,
> +	INTF_2,
> +	INTF_3,
> +	INTF_4,
> +	INTF_5,
> +	INTF_6,
> +	INTF_7,
> +	INTF_8,
> +	INTF_MAX
> +};
> +
> +static const unsigned int stream_intf_map_sa_8775p[][DP_STREAM_MAX] = {
> +	{INTF_0, INTF_3},
> +	{INTF_4, INTF_8},
> +	{}
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_0],
> +	},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .intf_map = stream_intf_map_sa_8775p[MSM_DP_CONTROLLER_1],
> +	},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> @@ -1489,6 +1516,9 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  
>  	dp->max_stream = DEFAULT_STREAM_COUNT;
> +
> +	dp->intf_map = desc->intf_map;
> +
>  	rc = msm_dp_init_sub_modules(dp);
>  	if (rc) {
>  		DRM_ERROR("init sub module failed\n");
> @@ -1646,6 +1676,18 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>  	return dp->wide_bus_supported;
>  }
>  
> +int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (dp->intf_map)
> +		return dp->intf_map[stream_id];
> +
> +	return 0;
> +}
> +
>  void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *root, bool is_edp)
>  {
>  	struct msm_dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 7ed0e25d6c2bc9e4e3d78895742226d22d103e4c..50719e188732acd3652e4a7063d1ba1e2963b48a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -378,6 +378,8 @@ int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encode
>  
>  int msm_dp_mst_register(struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -430,6 +432,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  	return false;
>  }
>  
> +int msm_dp_get_mst_intf_id(struct msm_dp *dp_display, int stream_id)
> +{
> +	return -EINVAL;
> +}
> +
>  #endif
>  
>  #ifdef CONFIG_DRM_MSM_MDP4
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
