Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32983CEA8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07DA10E1A8;
	Thu, 25 Jan 2024 21:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7809810E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:30:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5100fd7f71dso236915e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706218191; x=1706822991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lk9rlFBsXVkQA8btAj6OVvojdjZuuLJwebzFzpRha/c=;
 b=Vj2HvZd7BuEBtv1LEMsqTqsWi+OzhYHatEu0dUd0PxdaOUlj6Q7Q6oqGilV63XYVPt
 HrlHcAUSaJP9cpO5H1EN3uyk9vepqjeaM4DSgT5Vt8GTr+wvNk4/soZiVD8kfUWWOPDr
 KdNYPEY8vpgKKwEYV8XLnVzSKXEmlBgQUztXxgmMyWDLgxcvkox+vjYgYdDD/CSv7JAz
 tLFIxs4M0rRywpf2GG/O26ZhcWWcN+UQ8667TfKdMLr5voTJLtbRpJwQxWR2mTRT1jUs
 lZKAlHRo7NZjAHZBMa8EHYsaBDnJf46jpTmu1+yn+9ZlANf6pkf0MxieazNznVmxqXYq
 t2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706218191; x=1706822991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lk9rlFBsXVkQA8btAj6OVvojdjZuuLJwebzFzpRha/c=;
 b=TwUglMjkT8JyIemzxBpbXivBVMwQCe9P+4+rbGSeeBl4jOHpCNXpazP6YeBldZ8Fhd
 /ItW87pB8P4O6XH4FgEqw0T4DFcRvRbKh0ET/k6HyUrybSB6hYzk21wtDOxZvUXa3MRD
 L8WX81VIGG0vus7t9BM8G+D0hkrMo4O/VAV3xq70b5WCwt4ntj5bA0aGshfIaHXI9oln
 oxN8PJFv8JqUDmuhNalI7rFa2YnwYoki8En+CU3d7vTrSdKbch7Sam5Jb3+UWYgo3s7R
 R0PjVoDFidWEbGHsfN02J5Ql8PYXY2hqRo/DgEs3m3ZMV08b+a7Kcca2heYGNxYPaYRA
 H5uA==
X-Gm-Message-State: AOJu0YwZMmCN7j/C9o0gwekuIK9uIy4Cgredt+ji8SPhxiFsod3eTCV4
 8C5dlj0ahA5J8UkXS8RftD4HWqT1ZYT+EJ3iwHpAQfD3m6cUxGfXVIP2kokoyu4=
X-Google-Smtp-Source: AGHT+IEYuOP0FfJHektk6Ge/erp3gH2Gecc+r0Bkz4NRWvQkr3RbDmai1scG5LACq6AR8Iz9HlioXg==
X-Received: by 2002:a05:6512:2089:b0:50f:1c06:f9ba with SMTP id
 t9-20020a056512208900b0050f1c06f9bamr213218lfr.64.1706218190583; 
 Thu, 25 Jan 2024 13:29:50 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020ac24556000000b00510210f7befsm153522lfm.49.2024.01.25.13.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:29:50 -0800 (PST)
Message-ID: <c666a271-e12c-41ad-af38-42d0c5b513b1@linaro.org>
Date: Thu, 25 Jan 2024 23:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/dp: change YUV420 related programming for DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-9-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-9-quic_parellan@quicinc.com>
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
> Change all relevant DP controller related programming for YUV420 cases.
> Namely, change the pixel clock math to consider YUV420, program the
> configuration control to indicate YUV420, as well as modify the MVID
> programming to consider YUV420.

Too many items for a single commit.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++++-
>   drivers/gpu/drm/msm/msm_kms.h       |  3 +++
>   5 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5142aeb705a44..5d84c089e520a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -442,7 +442,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   					u32 rate, u32 stream_rate_khz,
> -					bool fixed_nvid)
> +					bool fixed_nvid, bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
>   	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> @@ -485,6 +485,9 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   		nvid = temp;
>   	}
>   
> +	if (is_ycbcr_420)
> +		mvid /= 2;
> +
>   	if (link_rate_hbr2 == rate)
>   		nvid *= 2;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 38786e855b51a..6cb5e2a243de2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -96,7 +96,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
> -				u32 stream_rate_khz, bool fixed_nvid);
> +				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
>   u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 77a8d9366ed7b..209cf2a35642f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -128,6 +128,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>   
> +	if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> +

This definitely is not related to clock rate calculations.

>   	/* Scrambler reset enable */
>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>   		config |= DP_CONFIGURATION_CTRL_ASSR;
> @@ -957,7 +960,7 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
>   	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
>   	in.nlanes = ctrl->link->link_params.num_lanes;
>   	in.bpp = ctrl->panel->dp_mode.bpp;
> -	in.pixel_enc = 444;
> +	in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
>   	in.dsc_en = 0;
>   	in.async_en = 0;
>   	in.fec_en = 0;
> @@ -1763,6 +1766,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   		ctrl->link->link_params.rate = rate;
>   		ctrl->link->link_params.num_lanes =
>   			ctrl->panel->link_info.num_lanes;
> +		if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
> +			pixel_rate >>= 1;
>   	}
>   
>   	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> @@ -1878,7 +1883,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	if (dp_ctrl->wide_bus_en)
> +	if (dp_ctrl->wide_bus_en || ctrl->panel->dp_mode.out_fmt_is_yuv_420)
>   		pixel_rate >>= 1;
>   
>   	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> @@ -1917,7 +1922,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	dp_catalog_ctrl_config_msa(ctrl->catalog,
>   		ctrl->link->link_params.rate,
> -		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
> +		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
> +		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
>   
>   	dp_ctrl_setup_tr_unit(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f6b3b6ca242f8..6d764f5b08727 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -916,9 +916,10 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   	const u32 num_components = 3, default_bpp = 24;
>   	struct dp_display_private *dp_display;
>   	struct dp_link_info *link_info;
> -	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>   	struct msm_dp *dp;
>   	int mode_pclk_khz = mode->clock;
> +	int rate_ratio = RGB_24BPP_TMDS_CHAR_RATE_RATIO;
> +	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>   
>   	dp = to_dp_bridge(bridge)->dp_display;
>   
> @@ -933,6 +934,11 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   	link_info = &dp_display->panel->link_info;
>   
> +	if (drm_mode_is_420_only(&dp->connector->display_info, mode))
> +		rate_ratio = YUV420_24BPP_TMDS_CHAR_RATE_RATIO;
> +
> +	mode_pclk_khz /= rate_ratio;

I think it will be more obvious and simple to write:

if (drm_mode_is_420...)
     mode_pclk_khz /= 2;


> +
>   	mode_bpp = dp->connector->display_info.bpc * num_components;
>   	if (!mode_bpp)
>   		mode_bpp = default_bpp;
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 44aa435d68ce2..66e8151951807 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -15,6 +15,9 @@
>   
>   #define MAX_PLANE	4
>   
> +#define RGB_24BPP_TMDS_CHAR_RATE_RATIO		1
> +#define YUV420_24BPP_TMDS_CHAR_RATE_RATIO	2
> +
>   /* As there are different display controller blocks depending on the
>    * snapdragon version, the kms support is split out and the appropriate
>    * implementation is loaded at runtime.  The kms module is responsible

-- 
With best wishes
Dmitry

