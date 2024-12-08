Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB59E84AE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F386010E267;
	Sun,  8 Dec 2024 11:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="skqck/+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52F10E267
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:39:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401c52000dso227131e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733657963; x=1734262763; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W9morjBPw/QOjQQuL/hx7w1FC0q/DCLfzZD9bWcXHsg=;
 b=skqck/+c71r1u7goLg5cZhtF5UVIl3QQvPG9ryqIvOT2sFsRuxduS5JCxPdVQsialq
 EO80QiI7SwD1BuScfzrcAl/BaZ2n4yBFu/xrVOGvsiOGKW3ZinJRQP7n0RkGS9IQrvxv
 ndKukSPvZbjFS50OfRgNrwvHc2szbQQSCXV9wxC+az78wJSMG9VVNCn6ewkt4bHj8aNW
 TOoZSZVa56ZuwU5urYGZmSXRoS2Rm8ecL96te/duo1WqPn+Iq9aue4TlZ63g2MQGmSCi
 SQ+wg6RUiWz3gO4HUVwQDEDhAhmwsmD78YRMtP5z/WDasyA95yahnw/oNvILVpuJTqLz
 KNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733657963; x=1734262763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9morjBPw/QOjQQuL/hx7w1FC0q/DCLfzZD9bWcXHsg=;
 b=jMcVD13Dl0wp+AB6ZNTTkrxbonvRJ5MHy56+opu51jl7URZiNUQ7GIfqGPft7ATrqM
 VlmFPBgHqtoVXC13Fur4I9u5dHCDspCMjzWW+s4DqpSm41QBmbXQa7TOzowydJiAJuHN
 ByHfaRlBRv3kOT8YTjYRPSg00JNzwuivT3avGYYHXkNYCkayCtF109Z3FejaMYlF4nWL
 eYSTpwWLR1ZSVXB0eraXbQLs+mhfkIjU4HsuqMt9oQXNROHXxdc+i5qlcg7RTIEJRiFm
 ISFzGYyirVu0Dap4K9KUOmH29S5VsjCCbLRDKpFIgT9rFefxkvXix9lTOTtOFPQDxOFt
 F6Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwvl28kKqFP/It+v5KnDP4XOEK9xahTuL4qvjcZxRv4jqKa/9SbavKI/GVo9dtlwNNS2rtR6/l/Kk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK0vc17Rx6byrPlddCcNqnUKDzaOe7sEOTzqNNVblTT04KyW+J
 zXOQXph3LBrrO5DYPqVOioxCCrQOT5hRkFEDubjqrx/L0n96BYt4QR+laU1LwDM=
X-Gm-Gg: ASbGncswoi2dVrXeeDPKLlGOmgoH4MiDVyYOO24hJ8P+6Fw2RM1O6tvMIrGEUfdSSWe
 yXQOuQNx/Gsh24E68V8NtHVLDJwFUV4U+0dUxLAykvQltxySuYhfY2SzInO8eaB0kTbmgU8IRo7
 NWcAqXOY63x+mcPE0Qxecvyj5IQyKZwqAOYbRhnZYVTmzQibKYWN9wXlJ1r9Ya/uR5QNMY8iks8
 STGE0fZMyxAG2LNDdwQvkK1lewtka50NzTWJwKOeLZUCnZ2ah2T1xFWhkDlOuwGkV84TAHIHoZT
 8G7oFA518tGSU52LVsJhIn44AuH1LA==
X-Google-Smtp-Source: AGHT+IEmYeJ2ZQRN84qHuhel52Yb+lkGV4iCWlUilYcgQ5pTjCo0FNpG1AeVpIwExJma9YYEjfC7yQ==
X-Received: by 2002:a05:6512:3dac:b0:540:1d37:e6c with SMTP id
 2adb3069b0e04-5401d371124mr371746e87.30.1733657962669; 
 Sun, 08 Dec 2024 03:39:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e36421f61sm680978e87.137.2024.12.08.03.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:39:21 -0800 (PST)
Date: Sun, 8 Dec 2024 13:39:18 +0200
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
Subject: Re: [PATCH 15/45] drm/msm/dp: convert dp_display_set_mode() to use
 dp_panel argument
Message-ID: <zw4np7nvrd627wvrdveisnfuyep5vp7rmrxm4vnmpmqiz7enev@uarpgh753fyc>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-15-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-15-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:46PM -0800, Abhinav Kumar wrote:
> Convert dp_display_set_mode() to use the dp_panel passed to it
> as an argument rather than the cached one in dp_display_private.

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 ++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b506159191184a2a2c83d0735260ac040a33be98..5fa6c003cf6c51eae77573549a555a00dc33f476 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -798,16 +798,38 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  }
>  
>  static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> -			       struct msm_dp_display_mode *mode)
> +				   const struct drm_display_mode *adjusted_mode,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp_display_private *dp;
> +	struct msm_dp_display_mode msm_dp_mode;
>  
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> +
> +	if (msm_dp_display_check_video_test(msm_dp_display))
> +		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> +	else /* Default num_components per pixel = 3 */
> +		msm_dp_mode.bpp = msm_dp_panel->connector->display_info.bpc * 3;
> +
> +	if (!msm_dp_mode.bpp)
> +		msm_dp_mode.bpp = 24; /* Default bpp */
> +
> +	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
> +
> +	msm_dp_mode.v_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> +
> +	msm_dp_mode.h_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	msm_dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&msm_dp_display->connector->display_info, adjusted_mode) &&
> +		msm_dp_panel->vsc_sdp_supported;
> +
> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, &msm_dp_mode.drm_mode);
> +	msm_dp_panel->msm_dp_mode.bpp = msm_dp_mode.bpp;
> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 = msm_dp_mode.out_fmt_is_yuv_420;
> +	msm_dp_panel_init_panel_info(msm_dp_panel);
>  
> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> -	msm_dp_panel_init_panel_info(dp->panel);
>  	return 0;
>  }
>  
> @@ -1662,34 +1684,12 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
>  {
>  	struct msm_dp_display_private *msm_dp_display;
>  	struct msm_dp_panel *msm_dp_panel;
> -	struct msm_dp_display_mode msm_dp_mode;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	msm_dp_panel = msm_dp_display->panel;
>  
> -	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> -
> -	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> -	else /* Default num_components per pixel = 3 */
> -		msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> -
> -	if (!msm_dp_mode.bpp)
> -		msm_dp_mode.bpp = 24; /* Default bpp */
> -
> -	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
> -
> -	msm_dp_mode.v_active_low =
> -		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> -
> -	msm_dp_mode.h_active_low =
> -		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> -
> -	msm_dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> -		msm_dp_panel->vsc_sdp_supported;
>  
> -	msm_dp_display_set_mode(dp, &msm_dp_mode);
> +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>  
>  	/* populate wide_bus_support to different layers */
>  	msm_dp_display->ctrl->wide_bus_en =
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
