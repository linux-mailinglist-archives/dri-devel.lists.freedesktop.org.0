Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DA83CE7C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3C610E8BB;
	Thu, 25 Jan 2024 21:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E410E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:24:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50f11e3ba3aso10832664e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217817; x=1706822617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
 b=u0UbFlzKcZKZhyumx9bkvQFwqoRKHOVbu8/1jDojNxFBfwkJ5qDP9OfOxDewLweRve
 5kUe/VoNHzz60uhpEVfr08hA9muNQNRv1O1ZmaZqOBWwbJmeWOjW1RcCt8BG//daGSVT
 hJwJuQM3jlVm5sgYzc1p5o4yOITOCT3dleYS449at3pJP9qma9dpZDfMa6mRvTvifn6T
 4eHNbvdT/DcrHr43HkYStHkZE6hF3MoVrXLjkXyQrpiCvZCBSJz5zAD09zLw7PZab93i
 V4b9gKC3mTt1dg/yIKNLaJPxcvgt+vjFXPEj0EhPgNJ0gYjXobpS7H78JYUK9b0+o6Zu
 CXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217817; x=1706822617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
 b=K20eqUc9TiWAGzVfBTSQMGcKUEHbYnwuXK3SG7xf6Aj/5r+EjiBVjWy8l1DKlCQI03
 xZPHSE1iG6AyPFrbblkXYQVD2xICavUFE3tDD9J6Nhyr6z8PMInJJfHR7EsnTBI5SkqB
 2fcUkY7FEDZ4lab76Er3NoprnRfVX25OB67sfalQK7B5EFQObDmCW25ErnKdftKujesL
 Eb+F3hpyWotQqi0cJqqPConpvBBR+pOg1CVDL7ftFCJF/WLPYsCTWT3dxWUImqL+meBL
 sV7/lNbEuaD22oXxOlI0zrXJVDrYPKzFMf8MJjFy9dyunTPl1b7nfoI7ar/V/9c+SdXc
 Dbzg==
X-Gm-Message-State: AOJu0YyIh4/L5T7n6WwyGedoWP0VGOWullGsYpRtIg22QmwWj0H57K7h
 EHzYUlM1x1mM6yVAODncPAkzE1mq1xIqoraa9IbC8AbDCTXZHHRfr+6gM88mTok=
X-Google-Smtp-Source: AGHT+IG5FAYG5wdjdwQXIRiGG2+Js2nBfyyOCgeA+kg/BErh0akK2PU+mxWO9A2x4+tVNk08XmNyAQ==
X-Received: by 2002:ac2:5383:0:b0:510:c31:f6f2 with SMTP id
 g3-20020ac25383000000b005100c31f6f2mr458862lfh.25.1706217817142; 
 Thu, 25 Jan 2024 13:23:37 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05651234d300b005101f0166b6sm199472lfr.14.2024.01.25.13.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:23:36 -0800 (PST)
Message-ID: <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
Date: Thu, 25 Jan 2024 23:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-6-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.

This API ideally should go to drm/display/drm_dp_helper.c

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   3 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ddac55f45a722..f6b3b6ca242f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>   
>   	dp_display->dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> +		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> +		dp_panel_vsc_sdp_supported(dp_display->panel);
>   
>   	/* populate wide_bus_support to different layers */
>   	dp_display->ctrl->wide_bus_en =
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 127f6af995cd1..af7820b6d35ec 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -17,6 +17,9 @@ struct dp_panel_private {
>   	struct dp_link *link;
>   	struct dp_catalog *catalog;
>   	bool panel_on;
> +	bool vsc_supported;
> +	u8 major;
> +	u8 minor;
>   };
>   
>   static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   {
>   	int rc;
> +	ssize_t rlen;
>   	struct dp_panel_private *panel;
>   	struct dp_link_info *link_info;
> -	u8 *dpcd, major, minor;
> +	u8 *dpcd, rx_feature;
>   
>   	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   	dpcd = dp_panel->dpcd;
> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (rc)
>   		return rc;
>   
> +	rlen = drm_dp_dpcd_read(panel->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
> +	if (rlen != 1) {
> +		panel->vsc_supported = false;
> +		pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +	} else {
> +		panel->vsc_supported = !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> +		pr_debug("vsc=%d\n", panel->vsc_supported);
> +	}
> +
>   	link_info = &dp_panel->link_info;
>   	link_info->revision = dpcd[DP_DPCD_REV];
> -	major = (link_info->revision >> 4) & 0x0f;
> -	minor = link_info->revision & 0x0f;
> +	panel->major = (link_info->revision >> 4) & 0x0f;
> +	panel->minor = link_info->revision & 0x0f;
>   
>   	link_info->rate = drm_dp_max_link_rate(dpcd);
>   	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (link_info->rate > dp_panel->max_dp_link_rate)
>   		link_info->rate = dp_panel->max_dp_link_rate;
>   
> -	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> +	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major, panel->minor);
>   	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>   	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
>   
> @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>   	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>   }
>   
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +
> +	if (!dp_panel) {
> +		pr_err("invalid input\n");
> +		return false;
> +	}
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
> +}
> +
>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   {
>   	struct dp_catalog *catalog;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 6ec68be9f2366..590eca5ce304b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
>   
>   /**
>    * is_link_rate_valid() - validates the link rate

-- 
With best wishes
Dmitry

