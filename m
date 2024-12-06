Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2D9E6991
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19010E19C;
	Fri,  6 Dec 2024 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XnkAqmAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D5210E197
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:01:54 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so1851174e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733475713; x=1734080513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ewjfA2zB7MJtvrBmdqkSKX8dAgp3ONrC04bFiltR3uU=;
 b=XnkAqmASrjihmzUUTW/RwhZz8KCnpjT3zia+vCj7z7tlU0XiV6GiLZATdSzEmind4B
 UMQxLKeIlmGGt+k5Sz0Vi7HALKTkc94TRfSt0BxGZXqBiO2YYQ8z/3f8yNsegE7Uoeq8
 CkAKnX+8iuvPsZOFp8/SqCqwKPwqJmBiW7oZPVVM5oDo5UgqDLjEloQ4KiZ02dVk17Tk
 QS50QRpplpXzWI60r0Dc/fa5R6uQYhGTjckmy9IyiVEGPvSevA54Y5nvX299UQDUsaPO
 Q0Na6ugqCaYbpriyjjo0eQDRMfSYzcTAlSZvXZD79lad5nlY4EkP7pGPNuMv67uoveq7
 1ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733475713; x=1734080513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewjfA2zB7MJtvrBmdqkSKX8dAgp3ONrC04bFiltR3uU=;
 b=WavLe6FslmHDmtNQg3Sm+cs5jELB8roPR1UWL5SpBng2SwiQgD4a5HM4mZBxAC4Ox4
 W9pP+E9SJiKcoEMU0XqOzQZbgny5x/iyv1N0QCd0Uh7YcQakke2iI6aZxymPstPYlErj
 MP5W6c4SqQhLQMrFix04QViVq8aOdgIDj8W/+UpELYVPf0mUtlv/wBQMTXElJlG+pVfK
 stECq1g9t82TPdsjk38a5p4F3+N61qVK5e2T6f0BJVN6LQ6fc99hXKsq187ePW41K7DJ
 LhiY5nzltBo6c0c+dPAnTDB+L783ksMmN5G6s2gaTZQa08Eqen6wwtZk8upCQiI9VgHK
 cT+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+FGtXsi+rfZ49a+BwBo7Gu1YIg9Z5nJ6hUJ9nWlxTVQvB4VKAvsK5dJlRWAuhNQ+153YSfwEqzTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwvJ8LFt7T0mz+Qf0NFuYcM7ZhyREfoc2f1r4M7tE6/K7Dh/aN
 GoGpOT/+wq5YgRKam/ra5B9afzZJzuKjecHgCTDQKzleRw+w1vPTrjde9cnBNCQ=
X-Gm-Gg: ASbGnctel3iE9hxTPkDyI2B314nPhzCLc/CuSa+dsDttqZ2V7vkOMC1ZY4lE3+noLrx
 FR326Og1nlDcu73Y5w3jTL5WHBNqqfVLLIRT+dcPCH4efLjpytttDJvBngglj/PX1llcCGck5DN
 pS30kONRMazwc/z81fnBItRTx1w9V/nf1+YifGudqntg9wb0jOP4oRawwKQXFJX5mUI/XnCpfe2
 OJQ2dxU4mU5tVj+T8xwRAU0g3XIeigoLNtwkbcbK1cBRloNSHK4HE3JgaHAeAMXvMPKQjeDnVHt
 Qp4JXL9qkAOf+AIjzymbGXnnHtW/8A==
X-Google-Smtp-Source: AGHT+IHewBkomdVnD/xM5P6dyFTA0maIFSMrnI7aNDtbE1FGcJmiheT1aRvkMYU1aVoO3cS20XGa/A==
X-Received: by 2002:a05:6512:1055:b0:53e:2628:3c24 with SMTP id
 2adb3069b0e04-53e2c2effd3mr603786e87.47.1733475712650; 
 Fri, 06 Dec 2024 01:01:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2cd847c2sm124389e87.161.2024.12.06.01.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:01:51 -0800 (PST)
Date: Fri, 6 Dec 2024 11:01:48 +0200
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
Subject: Re: [PATCH 06/45] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
Message-ID: <rjhv2modyvb2py4z6ve7i3xqu6ezrz7op7r6ygldbhydbvrtha@32bkl37jwol3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-6-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-6-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:37PM -0800, Abhinav Kumar wrote:
> dp_display caches the current display mode and then passes it onto
> the panel to be used for programming the panel params. Remove this
> two level passing and directly populated the panel's dp_display_mode
> instead.

Remove both and use the one from crtc_state?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 46 ++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 052db80c6a365f53c2c0a37d3b69ea2b627aea1f..4bd85ae754429333aa423c985368344cd03c7752 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -90,7 +90,6 @@ struct msm_dp_display_private {
>  	struct msm_dp_panel   *panel;
>  	struct msm_dp_ctrl    *ctrl;
>  
> -	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp msm_dp_display;
>  
>  	/* wait for audio signaling */
> @@ -1436,10 +1435,13 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
>  bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
> +	dp_panel = dp->panel;
> +
> +	if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		return false;
>  
>  	return dp->wide_bus_supported;
> @@ -1501,10 +1503,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
> -		DRM_ERROR("invalid params\n");
> -		return;
> -	}
>  
>  	if (dp->is_edp)
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> @@ -1516,13 +1514,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> -	if (rc) {
> -		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}
> -
>  	state =  msm_dp_display->hpd_state;
>  
>  	if (state == ST_CONNECTED && !dp->power_on) {
> @@ -1599,37 +1590,40 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>  	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
>  	struct msm_dp_display_private *msm_dp_display;
>  	struct msm_dp_panel *msm_dp_panel;
> +	struct msm_dp_display_mode msm_dp_mode;

No need to allocate it on stack just to copy it later on. Please write
the data directly to a proper location from the beginning.

>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	msm_dp_panel = msm_dp_display->panel;
>  
> -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> +	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
>  
>  	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> +		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
>  	else /* Default num_components per pixel = 3 */
> -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> +		msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
>  
> -	if (!msm_dp_display->msm_dp_mode.bpp)
> -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
> +	if (!msm_dp_mode.bpp)
> +		msm_dp_mode.bpp = 24; /* Default bpp */

The msm_dp_mode.bpp gets rewritten by msm_dp_panel_init_panel_info()
after being set here. Is this code part redundant?

>  
> -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
> +	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
>  
> -	msm_dp_display->msm_dp_mode.v_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> +	msm_dp_mode.v_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
>  
> -	msm_dp_display->msm_dp_mode.h_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +	msm_dp_mode.h_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>  
> -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
> +	msm_dp_mode.out_fmt_is_yuv_420 =
>  		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
>  		msm_dp_panel->vsc_sdp_supported;
>  
> +	msm_dp_display_set_mode(dp, &msm_dp_mode);
> +
>  	/* populate wide_bus_support to different layers */
>  	msm_dp_display->ctrl->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
>  	msm_dp_display->catalog->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
>  }
>  
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
