Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1949B89B2A5
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 17:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F2D10E13F;
	Sun,  7 Apr 2024 15:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uuqkIEnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9C10E13F
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 15:11:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so509652766b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712502708; x=1713107508; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1L6tj3Ykhqe3bT0DzwbvYek6Lx7l4bP1RVMn9TnkTIM=;
 b=uuqkIEnXTtWc3b8JC8xpLl1oT3pfpmRI9m+8Qc5tEsHhIYLzJu/A16kL5aRDjWwU+k
 9gDVB+bNiZL8g5ZLWwy5EgsOmy8KiGyILlJ2YKx81ANxgqbTHGj+Qk+5tx4+DNKf+sbu
 wk7nkc5Hi/NEoxptVVPie//wakrayM2DUmdl6VlPj3HazTx4KFQMMqhpf0Sx9pB/0fdP
 YRDPoxCmSjXZw9iyp/z1KyyAmU6TdV/d7gUM/gKWBke93DVQrWpjt8px+ewCd13usCVL
 9dkYwTlLI0j0jQRdtOpY2Qe6Po5C8+XZBGi98q87ggsTFAH+wE/j3mQhOT/elFZV4q4+
 x4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712502708; x=1713107508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1L6tj3Ykhqe3bT0DzwbvYek6Lx7l4bP1RVMn9TnkTIM=;
 b=XDUOmdI1eCZ/bK8cWI4nd7tbcpHUKrHPGOxNarb2tMh8TtVeKOpVOP4LnD0KcnSJrj
 EiYsAEr71BMOigojBfBbHKQpTwSA6B86fbQoVHL9JwY4FepzAKonJ70nlIjOQm9Hu21U
 BJfMEh8X7DYpht5nC95dNC29ysFctCoRDar/m9sv7j1FqTAd0IdQBPFF1//y8AlqIQMU
 oY/5Q2RApEtAUXzcY+Uk4zA70V+e3nYVP7GAgokwE/PbfmxpmmhjulHoYLUo8DUqBvu2
 iTWN1FbcuMJCBTc0GupXM8Vp1OrLfwE5HoHaPuppHsQP7j6z7HAZqjSWEVdVPa3dq86w
 ze4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ3eHHPk/PQyws1b7m0HIjdE4xyZRNbaNmZhAdD6iaThmPcgn6aYaMxyP8Y3n92AmkNjTDXMUup6BdNzgV5EersFLBvf3OKBCIGrYbgMc3
X-Gm-Message-State: AOJu0YyzMRFSIBILeWRBHMLnyueMF36IKcBQNrhDiqbndTRc4K+5Iiyp
 CFV0tFFBxyGl4m6u/LLO/VC8rhz01D9MnancwM3CkJI/zaREEgE+Z0EPJiPFwgY=
X-Google-Smtp-Source: AGHT+IHElRvRYkTsvef4HJyWIpPMDFwQYWdafxiP3Xm2EkrU6lPRRRXxKLZTeoMyg+mwIL/wZIUWOQ==
X-Received: by 2002:a17:907:3daa:b0:a51:d4fa:cf92 with SMTP id
 he42-20020a1709073daa00b00a51d4facf92mr306861ejc.14.1712502707981; 
 Sun, 07 Apr 2024 08:11:47 -0700 (PDT)
Received: from linaro.org ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 dr2-20020a170907720200b00a4ea1fbb323sm3239743ejc.98.2024.04.07.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 08:11:47 -0700 (PDT)
Date: Sun, 7 Apr 2024 18:11:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: Remove now unused connector_type from desc
Message-ID: <ZhK3sijUdGBSCMVz@linaro.org>
References: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
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

On 24-04-05 20:14:11, Bjorn Andersson wrote:
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
> 
> Remaining duplicate entries are squashed.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
> Changes in v2:
> - Squashed now duplicate entries
> - Link to v1: https://lore.kernel.org/r/20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++------------------------
>  1 file changed, 17 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 521cba76d2a0..12c01625c551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -119,55 +119,41 @@ struct dp_display_private {
>  struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
> -	unsigned int connector_type;
>  	bool wide_bus_supported;
>  };
>  
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc8180x_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1 },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2 },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sc8280xp_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -	{}
> -};
> -
> -static const struct msm_dp_desc sc8280xp_edp_descs[] = {
> -	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -	{}
> -};
> -
> -static const struct msm_dp_desc sm8350_dp_descs[] = {
> -	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
>  };
>  
>  static const struct msm_dp_desc sm8650_dp_descs[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0 },
>  	{}
>  };
>  
> @@ -186,9 +172,9 @@ static const struct of_device_id dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
>  	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
> -	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
> +	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
>  	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
> -	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
> +	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
>  	{}
> 
> ---
> base-commit: a874b50929e2596deeeeaf21d09f1561a7c59537
> change-id: 20240328-dp-connector-type-cleanup-af6501e374b3
> 
> Best regards,
> -- 
> Bjorn Andersson <quic_bjorande@quicinc.com>
> 
