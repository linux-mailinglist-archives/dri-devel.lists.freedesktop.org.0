Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A763EA5B9A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411610E513;
	Tue, 11 Mar 2025 07:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rp1Y2/mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C110E129
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:22:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so17917495e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741677734; x=1742282534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=76PI8U0C3grhZ+WuGPDq/YmQnaoHPH4xWIdsOpqhIzo=;
 b=Rp1Y2/mrQEpSJ/Zv5qQYBv8OStqKs6ej6lMcFA8m6KYgNS0FinblxI3I8wudLWDXEN
 XpRrl/h2sTnoz2Fu1jpFz/movGi5WfTJgZA5lJJmXknPvglAtRFA3c6hOQGa9jQOLlAv
 aqV3RLHqdOhN5uhw/Qfp+TfavNxt7VvrgLx6eEBlg7ZMQxKua5EFQ5GE5NkruiZyg/Sl
 96gbhXtTW+cTMu5PdpeScxX4pYFyZDvmGm65+9qx26dGYThB0+qs/ywlnJEOXJMsQkDm
 FUTLFXzS3JmD3psM/popbZgyIakYNeRxOaEcyLajfk2Ns7myDSmzd2+tqnif09B1ngWd
 4UFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741677734; x=1742282534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76PI8U0C3grhZ+WuGPDq/YmQnaoHPH4xWIdsOpqhIzo=;
 b=gd+4I7OYXj+W1Vs1bDDXYTr9rJDzHrHVLIxkKMrPMnKMmJzjaE19zlV6tMHuv3tOOF
 0DvmK0NuXKSD3U46gHhJD11tiC4eyRKc509Ki0HuHrlhMg58mjNEXb7vJumQIBW/xrP9
 /nehCsjUVO8JL3DaUUcenMCgi80uUNZdScyZEijUkFs6bigOVo1SBuJsbicTf73EHWNC
 H/4xkdzC3+HWGBkWmPW2FCuXJxV9hov7abbWm37exiUtZrOc0ACIQiF6McpO5t9dKrgN
 6uNrBBOvUJ+1oIAd7truclAsZZKQ+7AMQT0Rl3R27eYXwMnxv3j7DJCMZ8e+auhKjrpy
 1KlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsR4fqITBSLiaJLrDEaknitjAGvu5qaq+PrAzjWMBXmJK4b+Oh7HeFdhjHAJIaPLO+4uK2FgQJ9fg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUSfO0QaVR81h72mqOKgOMWwnu8+3XaX2sEk1M8WrIULp8+lfn
 Aj0rkDOfFO0N1XS/zJ+17rzICfn+egVk7XR4H2gOwa6R7yREBdrlXP4qmBp0duU=
X-Gm-Gg: ASbGncvbck7zAEoYaPnQuPDdyFJTqSKNqS/3quwea1gGG6Np4zKijV+gTAK6LQ2OQsC
 r019vlzLI54SYEQ3wPnv4P05m5dgzou0pAQT31uy2uP+EnGjSPpDPXck6Vn9Q4Khh8MwN0qnULU
 ONyNxQ6ywOofQE2G+dsoAT+0JBiCZK7Zab931cY/1OOW4VK8JCuhckhH8jZZH+lSjOW0jQo1kuM
 vzgGumXxgh6sFbuTRI7KP4Jb0aM6TL/AJQpTUUaK3cDtNlgBqUveItMw2k6ikWu8BfR4hN3K/AY
 4RRZtoyjOXkRq+udI7bLawBrthXlK0F23KCpJf4cAg==
X-Google-Smtp-Source: AGHT+IHpxAncgrnL4ALrjetV1ziQLeJlcqXChyQIooItqRdevyNiOEaTJs5Dyo8WU/a2A84bNO/4SA==
X-Received: by 2002:a05:6000:1564:b0:38d:d666:5457 with SMTP id
 ffacd0b85a97d-39132da24cfmr13958644f8f.42.1741677734190; 
 Tue, 11 Mar 2025 00:22:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1d67sm17233831f8f.74.2025.03.11.00.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 00:22:13 -0700 (PDT)
Date: Tue, 11 Mar 2025 09:22:11 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v1 1/2] drm/msm/dp: Fix support of LTTPR handling
Message-ID: <Z8/ko76QAGPE46R/@linaro.org>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
 <20250310211039.29843-2-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310211039.29843-2-alex.vinarskis@gmail.com>
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

On 25-03-10 22:05:51, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines. Initialize LTTPR before
> msm_dp_panel_read_sink_caps, as
> a) Link params computation need to take into account LTTPR's caps
> b) It appears DPTX shall (re)read DPRX caps after LTTPR detection
> 
> Return lttpr_count to prepare for per-segment link training.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 30 +++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbc47d86ae9e..2edbc6adfde5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,6 +108,8 @@ struct msm_dp_display_private {
>  	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
>  	spinlock_t event_lock;
>  
> +	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
> +
>  	bool wide_bus_supported;
>  
>  	struct msm_dp_audio *audio;
> @@ -367,17 +369,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  	return 0;
>  }
>  
> -static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
>  {
> -	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> -	int rc;
> +	int rc, lttpr_count;
>  
> -	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
> -		return;
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->lttpr_common_caps))
> +		return 0;
>  
> -	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
> -	if (rc)
> -		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
> +	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
> +	if (rc) {
> +		DRM_ERROR("fialed to set LTTPRs transparency mode, rc=%d\n", rc);

Nitpick: failed

With that fixed, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> +		return 0;
> +	}
> +
> +	return lttpr_count;
>  }
>  
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> @@ -385,12 +391,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>  	if (rc)
>  		goto end;
>  
> -	msm_dp_display_lttpr_init(dp);
> +	msm_dp_display_lttpr_init(dp, dpcd);
> +
> +	rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
> +	if (rc)
> +		goto end;
>  
>  	msm_dp_link_process_request(dp->link);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 92415bf8aa16..f41b4cf7002e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -45,9 +45,12 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
>  	}
>  }
>  
> -static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
> +static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel,
> +				  const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE])
>  {
>  	int rc;
> +	int max_sink_lanes, max_source_lanes, max_lttpr_lanes;
> +	int max_sink_rate, max_source_rate, max_lttpr_rate;
>  	struct msm_dp_panel_private *panel;
>  	struct msm_dp_link_info *link_info;
>  	u8 *dpcd, major, minor;
> @@ -64,16 +67,24 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>  	major = (link_info->revision >> 4) & 0x0f;
>  	minor = link_info->revision & 0x0f;
>  
> -	link_info->rate = drm_dp_max_link_rate(dpcd);
> -	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> +	max_source_lanes = msm_dp_panel->max_dp_lanes;
> +	max_source_rate = msm_dp_panel->max_dp_link_rate;
>  
> -	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> -	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
> -		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
> +	max_sink_lanes = drm_dp_max_lane_count(dpcd);
> +	max_sink_rate = drm_dp_max_link_rate(dpcd);
> +
> +	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(lttpr_common_caps);
> +	max_lttpr_rate = drm_dp_lttpr_max_link_rate(lttpr_common_caps);
>  
> +	if (max_lttpr_lanes)
> +		max_sink_lanes = min(max_sink_lanes, max_lttpr_lanes);
> +	if (max_lttpr_rate)
> +		max_sink_rate = min(max_sink_rate, max_lttpr_rate);
> +
> +	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> +	link_info->num_lanes = min(max_sink_lanes, max_source_lanes);
>  	/* Limit link rate from link-frequencies of endpoint property of dtsi */
> -	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
> -		link_info->rate = msm_dp_panel->max_dp_link_rate;
> +	link_info->rate = min(max_sink_rate, max_source_rate);
>  
>  	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>  	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> @@ -109,6 +120,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  }
>  
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> +	const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
>  	struct drm_connector *connector)
>  {
>  	int rc, bw_code;
> @@ -125,7 +137,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
>  		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
>  
> -	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
> +	rc = msm_dp_panel_read_dpcd(msm_dp_panel, lttpr_common_caps);
>  	if (rc) {
>  		DRM_ERROR("read dpcd failed %d\n", rc);
>  		return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4906f4f09f24..d89e17a9add5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -7,6 +7,7 @@
>  #define _DP_PANEL_H_
>  
>  #include <drm/msm_drm.h>
> +#include <drm/display/drm_dp_helper.h>
>  
>  #include "dp_aux.h"
>  #include "dp_link.h"
> @@ -49,6 +50,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> +		const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
>  		struct drm_connector *connector);
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
>  			u32 mode_pclk_khz);
> -- 
> 2.45.2
> 
