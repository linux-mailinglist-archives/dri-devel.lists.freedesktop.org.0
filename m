Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC2678ADE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F07810E5AF;
	Mon, 23 Jan 2023 22:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D83910E5AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:41:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so34438590ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DAh9Xbtfief/OlsV2KWJ+0B0immMWxg2cM0rmo6xr3k=;
 b=FpQwvjke2tSxx5LeBEvsXh/qQZcv/u1RWBrEK/3eIZ527rYbLYhdGwKr60hzndq6/h
 Id2B2QqjsH+dfDMzS8mJklAUX4uyRYM7+JuHVKF0DZb8465awtktQEF8Js4atAVd9eAH
 zBC1joHkb9qY2OSIIxzlWZ1MfKBeSsS+QHaAus6TEJHYkpZ6rbuokauLvi4Gsc/GXobK
 3r2MSV8M3skKLfc1f9BPvyVhYm0+CXoxG+RhOfNqWFtQF48gHJn4iK5WVBfJD/OFw15U
 Zf/CGiH+7T8BtpeqkhD++C2D918xXPog77jRFK8fOObBTS6Cjk6VxCTE9wGASr8gPeRY
 xKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DAh9Xbtfief/OlsV2KWJ+0B0immMWxg2cM0rmo6xr3k=;
 b=JkVXBHzQXld5zU1SMAQTrRHzJ+3MgEE10FAUlPScVOPnr+e8OnOUDYfZ62rCh3wHm+
 cDqmfOQiXtyRVS+0/k8NrHRrpAf8GI89h9QIv2Z0CEphVp2gQqiPiFQTrctmpjwxCCRX
 tD1f2e/Y/nO4TF1TdpEhH5hcLN/2EOF4z5851cN+lhdA7GTm6kHx02Cb5JGDG9LCHoXc
 t9ikmWDx7VXUv5hpk9ba3mI3P4BgbzZDHzlEnPdTzoLUIwnaApacefRsP54v77c4p4J1
 VE90XBkyDIIo7wC5Rq6Nayj68KWQAFfnLU8lz5ILJtLKS9XDb5ctQU3zizokh/GVW6gT
 G38Q==
X-Gm-Message-State: AFqh2kocEvpGi+7No8ruRO+cBRJvVhDq2bSwEEaYS2MsinMQVXL4kCzt
 BFk2uToNz1NkF6HpKQdhh1BDFQ==
X-Google-Smtp-Source: AMrXdXtYujRNRFxkwoP4/7o+r7V0nLuSUdhqgyinxvkCDPLKrXc+//LDE+zu3X4bCAq+zVoy7H+Ttg==
X-Received: by 2002:a17:906:591a:b0:82c:3642:79b5 with SMTP id
 h26-20020a170906591a00b0082c364279b5mr27251073ejq.58.1674513682042; 
 Mon, 23 Jan 2023 14:41:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 by23-20020a170906a2d700b0086c4fbb8507sm21797ejb.225.2023.01.23.14.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:41:21 -0800 (PST)
Message-ID: <a1fc24d6-824f-6a00-29c8-c8f3fd6c6c2e@linaro.org>
Date: Tue, 24 Jan 2023 00:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 04/14] drm/msm/dp: correct configure Colorimetry
 Indicator Field at MISC0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-5-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At current
> implementation, Colorimetry Indicator Field of MISC0 is not configured
> correctly. This patch add support of RGB formats Colorimetry.

Any Fixes tag? Not to mention that fixes should come first.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c  |  5 +++--
>   drivers/gpu/drm/msm/dp/dp_link.c  | 29 +++++++++++++++++++------
>   drivers/gpu/drm/msm/dp/dp_panel.c | 45 +++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
>   4 files changed, 71 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 959a78c..d0d1848 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
> @@ -169,7 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   
>   	tb = dp_link_get_test_bits_depth(ctrl->link,
>   		ctrl->panel->dp_mode.bpp);
> -	cc = dp_link_get_colorimetry_config(ctrl->link);
> +	cc = dp_panel_get_misc_colorimetry_val(ctrl->panel);
>   	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
>   	dp_panel_timing_cfg(ctrl->panel);
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index f1f1d64..e957948 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
> @@ -12,6 +13,12 @@
>   
>   #define DP_TEST_REQUEST_MASK		0x7F
>   
> +enum dynamic_range {
> +	DP_DYNAMIC_RANGE_RGB_VESA = 0x00,
> +	DP_DYNAMIC_RANGE_RGB_CEA = 0x01,
> +	DP_DYNAMIC_RANGE_UNKNOWN = 0xFFFFFFFF,

No need to assign values here, unless they serve some purpose. Do they?

> +};
> +
>   enum audio_sample_rate {
>   	AUDIO_SAMPLE_RATE_32_KHZ	= 0x00,
>   	AUDIO_SAMPLE_RATE_44_1_KHZ	= 0x01,
> @@ -1079,6 +1086,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>   int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>   {
>   	u32 cc;
> +	enum dynamic_range dr;
>   	struct dp_link_private *link;
>   
>   	if (!dp_link) {
> @@ -1088,14 +1096,21 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>   
>   	link = container_of(dp_link, struct dp_link_private, dp_link);
>   
> -	/*
> -	 * Unless a video pattern CTS test is ongoing, use RGB_VESA
> -	 * Only RGB_VESA and RGB_CEA supported for now
> -	 */
> +	/* unless a video pattern CTS test is ongoing, use CEA_VESA */
>   	if (dp_link_is_video_pattern_requested(link))
> -		cc = link->dp_link.test_video.test_dyn_range;
> +		dr = link->dp_link.test_video.test_dyn_range;
>   	else
> -		cc = DP_TEST_DYNAMIC_RANGE_VESA;
> +		dr = DP_DYNAMIC_RANGE_RGB_VESA;
> +
> +	/* Only RGB_VESA nd RGB_CEA supported for now */
> +	switch (dr) {
> +	case DP_DYNAMIC_RANGE_RGB_CEA:
> +		cc = BIT(2);
> +		break;
> +	case DP_DYNAMIC_RANGE_RGB_VESA:
> +	default:
> +		cc = 0;
> +	}
>   
>   	return cc;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 36dad05..55bb6b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -567,6 +567,51 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>   	return 0;
>   }
>   
> +/**

This marks the start of kerneldoc. But the rest of the comment isn't a 
kerneldoc.

> + * Mapper function which outputs colorimetry to be used for a
> + * given colorspace value when misc field of MSA is used to
> + * change the colorimetry. Currently only RGB formats have been
> + * added. This API will be extended to YUV once its supported on DP.

its != it's

> + */
> +u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel)
> +{
> +	u8 colorimetry;
> +	u32 colorspace;
> +	u32 cc;
> +	struct dp_panel_private *panel;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	cc = dp_link_get_colorimetry_config(panel->link);
> +	/*
> +	 * If there is a non-zero value then compliance test-case
> +	 * is going on, otherwise we can honor the colorspace setting
> +	 */
> +	if (cc)
> +		return cc;
> +
> +	colorspace = dp_panel->connector->state->colorspace;
> +	switch (colorspace) {
> +	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> +	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> +		colorimetry = 0x7;
> +		break;
> +	case DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
> +		colorimetry = 0x3;
> +		break;
> +	case DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
> +		colorimetry = 0xb;
> +		break;
> +	case DRM_MODE_COLORIMETRY_OPRGB:
> +		colorimetry = 0xc;
> +		break;
> +	default:
> +		colorimetry = 0;
> +	}
> +
> +	return colorimetry;
> +}
> +
>   struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>   {
>   	struct dp_panel_private *panel;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index fb30b92..1153e88 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -85,6 +85,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> +u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel);
>   
>   /**
>    * is_link_rate_valid() - validates the link rate

-- 
With best wishes
Dmitry

