Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51079E699B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978F410E1A2;
	Fri,  6 Dec 2024 09:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZjyhB8MZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65210E3E4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:04:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffc7a2c5d5so18667331fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733475865; x=1734080665; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FjVkxHwUjEAa1RaEtDXkw/EKiMlwCh7iH/bYk1Ga0pk=;
 b=ZjyhB8MZMz5kMOsH/4tZ2RKKxqluSefjgskIufnFrojB2ot1yxmecMoQQrvhnkgNmF
 9Q5aJ92Q0yG9XGRZ/5IrY6FhCddyZAOaUyogDLsisX21t63bKK4sEWErweqVTSFuCjv2
 9gHErUq6CDtamcSmXT3Wm5SC3dmi6PmYNuM1vSu9mGMLjiDwnBMRj3P9XoQ+mUMcHS83
 rOVS80yJW3NQ1IP1nrShqh/4tROD8dn6LM66veTeU3OkN5V97kRgSZJ0wXK96ZcHxXag
 CPN9CMgNPK79OAHFzSoMikZf8BVRCtZyu9g2JuWSCCjVqg6XXPUFitzKrjk6fBYc/58E
 k0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733475865; x=1734080665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjVkxHwUjEAa1RaEtDXkw/EKiMlwCh7iH/bYk1Ga0pk=;
 b=ju/hdzP/YC0gmqC2axSYDIjP681Spf1gg6qRm9TbXHd8hypSL89jze6vdUlDbrxPT0
 XWPx2UNXxNkf0baUhHxHmoOyMN1g4C9hl82in/t2gbwXwtwRxNhoj5j40nxVjZHeLleb
 CfR0H1VTuZ8wkb762JZkNGb9d4Z7FucGY8VeJumYacL8IaOZVf5pC05ZrT3jVqIaiwN7
 5w14XkmfZtfIGMCReOYEX4YSJsU+IH69ChdBHGP5STJutfnlPCeeO/rW5U4Jkb5nQQWG
 4Rv/7KPyeU1k9Jlfqdof7EXfT9ON4VPrBbWXYFsFBDVdoXtgXfjxQOU011Ybe/3w1QdK
 fegQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA8zDrJ8i4b+d0ewkIqs0esk7r7ToPGFbUPirffEp3axChdM8D30Wd2Y1YltRJyEW642HQLn+SdBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgxkd8lkusF1kQwSSnDp6S2mqxXg4muSzaRdLMicWBtPZvU1Ol
 xTLOH7HpWDHtZarX+wKDQKJeqSj1kImFcgIjA5Xo3dQo7o/GWgipcXizbbagSc0=
X-Gm-Gg: ASbGnctxChAyk/AF6HEaRINOIzmsOdM8q5h7cGhMbndi25DZOmPqBcYwJOCC0aLRglQ
 F7hL7CRuukeWh1Kv4BEkKQ2Q651TMoYMOadzz4ZFPmZfI+xrvJ+HKTvQhjyI6MzDLxiZwga5re1
 YO/qUUkcv/7S1kK9Bvt5ujdYUjI49vzbVZ29NlCylpTsnCkY23gIHfJrL2k4z/sbaVGjubiy49B
 UrSRPaUqQkG2nawbjcVDv6eJ1lW6T9fmPYWQ5W890B57zmkcXnAMl5LWm8Ek4KqtTxOBX1q7CBS
 s7oiUANOQTV28UxIB8RxG/J02M6nqA==
X-Google-Smtp-Source: AGHT+IGXyxNWi8Scc+bs9xsf6VZehfKR6HidvDDqyrMEVLHjN7FsUBIUHCnU9Ws1+ft1ylBOrezfsw==
X-Received: by 2002:a05:651c:12c2:b0:2fb:58b1:3731 with SMTP id
 38308e7fff4ca-3002f79750amr7361731fa.6.1733475864969; 
 Fri, 06 Dec 2024 01:04:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3002bf8fe50sm2129581fa.44.2024.12.06.01.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:04:23 -0800 (PST)
Date: Fri, 6 Dec 2024 11:04:21 +0200
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
Subject: Re: [PATCH 07/45] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <hq7554l6xoe3qowddgb2kncohz4gnaw3m3c7no6u5gzokotf37@4npzahvdlduq>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-7-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-7-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:38PM -0800, Abhinav Kumar wrote:
> dp_display_enable() currently re-trains the link if needed
> and then enables the pixel clock, programs the controller to
> start sending the pixel stream. Break up these two parts into
> separate APIs to distinguish these two parts better.

This does more than just breaking dp_display_enable(). It moves parts of
the code sequence to the .prepare() callback, etc. Please review this
again.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 ++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 97 ++++++++++++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  4 files changed, 112 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 9c463ae2f8fae916661fef1c7e225f55c1026478..763bd58c24d29d49caafb76eab32b493e1618e7b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1941,40 +1941,61 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>  	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>  {
>  	int ret = 0;
> -	bool mainlink_ready = false;
>  	struct msm_dp_ctrl_private *ctrl;
> -	unsigned long pixel_rate;
> -	unsigned long pixel_rate_orig;
>  
>  	if (!msm_dp_ctrl)
>  		return -EINVAL;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> -
> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> -		pixel_rate >>= 1;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> -		ctrl->link->link_params.rate,
> -		ctrl->link->link_params.num_lanes, pixel_rate);
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
> +		   ctrl->link->link_params.rate,
> +		   ctrl->link->link_params.num_lanes);
>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
>  		if (ret) {
>  			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
> -			goto end;
> +			return ret;
>  		}
>  	}
>  
> +	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
> +		msm_dp_ctrl_link_retrain(ctrl);
> +
> +	/* stop txing train pattern to end link training */
> +	msm_dp_ctrl_clear_training_pattern(ctrl);
> +
> +	return ret;
> +}
> +
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	int ret = 0;
> +	bool mainlink_ready = false;
> +	struct msm_dp_ctrl_private *ctrl;
> +	unsigned long pixel_rate;
> +	unsigned long pixel_rate_orig;
> +
> +	if (!msm_dp_ctrl)
> +		return -EINVAL;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +
> +	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +		pixel_rate >>= 1;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> +
>  	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> @@ -1992,12 +2013,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>  		ctrl->stream_clks_on = true;
>  	}
>  
> -	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
> -		msm_dp_ctrl_link_retrain(ctrl);
> -
> -	/* stop txing train pattern to end link training */
> -	msm_dp_ctrl_clear_training_pattern(ctrl);
> -
>  	/*
>  	 * Set up transfer unit values and set controller state to send
>  	 * video.
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..42745c912adbad7221c78f5cecefa730bfda1e75 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -18,7 +18,8 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4bd85ae754429333aa423c985368344cd03c7752..434380b442ec84c12c240dab6538ccdf31963cea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -811,7 +811,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> +{
> +	int rc = 0;
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	bool force_link_train = false;
> +
> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> +	if (msm_dp_display->prepared) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return 0;
> +	}
> +
> +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
> +	if (rc) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		return rc;
> +	}
> +
> +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
> +		msm_dp_display_host_phy_init(dp);
> +		force_link_train = true;
> +	}
> +
> +	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
> +	if (!rc)
> +		msm_dp_display->prepared = true;
> +
> +	return rc;
> +}
> +
> +static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  {
>  	int rc = 0;
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> @@ -822,7 +852,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -852,13 +882,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
>  	return 0;
>  }
>  
> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
> -	if (!msm_dp_display->power_on)
> -		return 0;
> -
>  	/* wait only if audio was enabled */
>  	if (msm_dp_display->audio_enabled) {
>  		/* signal the disconnect event */
> @@ -869,6 +896,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	}
>  
>  	msm_dp_display->audio_enabled = false;
> +}
> +
> +static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +{
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +
> +	if (!msm_dp_display->power_on)
> +		return 0;
>  
>  	if (dp->link->sink_count == 0) {
>  		/*
> @@ -1498,9 +1533,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
>  	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
>  	int rc = 0;
> +
>  	struct msm_dp_display_private *msm_dp_display;
> -	u32 state;
> -	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> @@ -1508,25 +1542,23 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
> -	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> -		DRM_ERROR("failed to pm_runtime_resume\n");
> +
> +	rc = msm_dp_display_prepare(msm_dp_display);
> +	if (rc) {
> +		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
>  		mutex_unlock(&msm_dp_display->event_mutex);
>  		return;
>  	}
>  
> -	state =  msm_dp_display->hpd_state;
> -
> -	if (state == ST_CONNECTED && !dp->power_on) {
> -		msm_dp_display_host_phy_init(msm_dp_display);
> -		force_link_train = true;
> -	}
> -
> -	msm_dp_display_enable(msm_dp_display, force_link_train);
> -
> -	rc = msm_dp_display_post_enable(dp);
> -	if (rc) {
> -		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -		msm_dp_display_disable(msm_dp_display);
> +	if (dp->prepared) {
> +		rc = msm_dp_display_enable(msm_dp_display);
> +		if (rc)
> +			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> +		rc = msm_dp_display_post_enable(dp);
> +		if (rc) {
> +			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> +			msm_dp_display_disable(msm_dp_display);
> +		}
>  	}
>  
>  	/* completed connection */
> @@ -1548,6 +1580,20 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  }
>  
> +static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> +{
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +
> +	if (!msm_dp_display->prepared) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return;
> +	}
> +
> +	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> +
> +	msm_dp_display->prepared = false;
> +}
> +
>  void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  				   struct drm_bridge_state *old_bridge_state)
>  {
> @@ -1568,6 +1614,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
>  			   dp->connector_type, state);
>  
> +	msm_dp_display_audio_notify_disable(msm_dp_display);
> +
>  	msm_dp_display_disable(msm_dp_display);
>  
>  	state =  msm_dp_display->hpd_state;
> @@ -1576,9 +1624,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  		msm_dp_display->hpd_state = ST_DISCONNECTED;
>  	}
>  
> +	msm_dp_display_unprepare(msm_dp_display);
> +
>  	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>  
> -	pm_runtime_put_sync(&dp->pdev->dev);
>  	mutex_unlock(&msm_dp_display->event_mutex);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index ecbc2d92f546a346ee53adcf1b060933e4f54317..0165a80863e65b6eea6d2d8d1c5c08cd51fed101 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -21,6 +21,7 @@ struct msm_dp {
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool prepared;
>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
