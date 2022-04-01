Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3984EFC68
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 23:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A708910E126;
	Fri,  1 Apr 2022 21:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB22D10E126
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 21:53:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z12so7225446lfu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 14:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x01cAIDGousyRu6tlfezdf2t079ZTIRLXUGsVoSfkJo=;
 b=d2q7woyxknMDTIaL2bt2Ai4y3+9/ZR2adMJ9OOuNW+VjzGt9IHNEV0uFLnBnnww/l2
 mLKeR87mGP3GGZVBVFaOrCOt3JoRyyuFvBXpluPjlEPQ67xs0/0dWdFkNwVddMLGvNm8
 utvyOAklmFT0q5crYDTOzc4Vb3O9uZVJeEIAuMJo+4oHW8UkZ0HyBIM0hDZKTZnhG/zo
 +bJGmzqNI7O+k5CVq758TfSKxR4PGygGRwVbu3gFLpJXq/2Y1RxAlNVrFsmitlGC9OpN
 uYfPcwwVrMK6SvPkFTaelkKdLlmDa4cVmps5FeKaxfm6POhMlmE3tNf1mx7fGMfHW/66
 cTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x01cAIDGousyRu6tlfezdf2t079ZTIRLXUGsVoSfkJo=;
 b=FCcOuQF22df6iG6GOt3pW9GUTbUXj+slN0tutxMhEtnmbaru61fDs+Q37szAE5ZleZ
 AqF99nWKZMUrqpqQ0xbY2s7oqPrSF9LSLbX6cTHSUVigEfJ5NTYrpIk3FR+rUdZxnt/U
 N5miP8K4zkhxVaXm8FrqMFLaiMbvrrRR0Y1gBFdWVJ2ZZkA49QFlq1i/C70TZe5iSUBG
 Ca9z3TL3OA7UvKXcbc8DOZ3oiTAGzc1AGZiMSSwAMoyIvHyYWPKj4e4CX+xDr5HHk3IF
 fKNwLrFtcdBQFBCLqL1COEOT8L+omyqGjlorSxho+eF3PaMw6ACmFtF37oG+njxLtK95
 Nv4w==
X-Gm-Message-State: AOAM532aCWJpakdGgc2rXln+iHP4pmUKQ/wl56G4GDs40J7/tma7CMA1
 vusSM/8KM2YLFmQKRRuZuw6oUg==
X-Google-Smtp-Source: ABdhPJz58QkmoU6+lRw6DoGsAl8hvPS+/MDYzMG8gPV7lgd08ry3Gdh2TqfRlD2zZU+O63YVLdD9jw==
X-Received: by 2002:a19:dc0f:0:b0:439:702c:d83b with SMTP id
 t15-20020a19dc0f000000b00439702cd83bmr14931618lfg.192.1648850020553; 
 Fri, 01 Apr 2022 14:53:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a194f02000000b0044a2b77cd8dsm352608lfb.105.2022.04.01.14.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 14:53:39 -0700 (PDT)
Message-ID: <4e127226-3f07-adfd-3a34-30e7b53635f8@linaro.org>
Date: Sat, 2 Apr 2022 00:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 21:35, Kuogee Hsieh wrote:
> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
> 
> Changes in v4:
> -- replace (strucr drm_dev *)NULL with drm_dev
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   |  50 ++++++++++------
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  35 ++++++-----
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 114 ++++++++++++++++++++----------------
>   drivers/gpu/drm/msm/dp/dp_display.c |  68 ++++++++++++---------
>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>   drivers/gpu/drm/msm/dp/dp_link.c    | 103 +++++++++++++++++++-------------
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++------
>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 -
>   drivers/gpu/drm/msm/dp/dp_power.c   |  25 +++++---
>   9 files changed, 265 insertions(+), 183 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index d7e4a39..82a12c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -26,6 +26,7 @@
>   struct dp_audio_private {
>   	struct platform_device *audio_pdev;
>   	struct platform_device *pdev;
> +	struct drm_device *drm_dev;
>   	struct dp_catalog *catalog;
>   	struct dp_panel *panel;
>   
> @@ -136,7 +137,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
> -	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> @@ -148,7 +150,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
> -	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   
>   	dp_audio_set_header(catalog, value,
> @@ -162,7 +165,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
> -	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>   		value, parity_byte);
>   
>   	dp_audio_set_header(catalog, value,
> @@ -183,8 +187,9 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
> -	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -		value, parity_byte);
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>   
> @@ -196,7 +201,8 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
> -	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> @@ -209,7 +215,8 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
> -	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> @@ -229,7 +236,8 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
> -	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> @@ -242,7 +250,8 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
> -	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> @@ -255,7 +264,8 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
> -	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>   			new_value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> @@ -275,7 +285,8 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
> -	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> @@ -288,7 +299,8 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
> -	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> @@ -301,7 +313,8 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
> -	DRM_DEBUG_DP("Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> @@ -321,7 +334,8 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
> -	DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> @@ -334,7 +348,8 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   	parity_byte = dp_audio_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
> -	DRM_DEBUG_DP("Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> +	drm_dbg_dp(audio->drm_dev,
> +			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>   			value, parity_byte);
>   	dp_audio_set_header(catalog, value,
>   		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> @@ -370,7 +385,7 @@ static void dp_audio_setup_acr(struct dp_audio_private *audio)
>   		select = 3;
>   		break;
>   	default:
> -		DRM_DEBUG_DP("Unknown link rate\n");
> +		drm_dbg_dp(audio->drm_dev, "Unknown link rate\n");
>   		select = 0;
>   		break;
>   	}
> @@ -395,7 +410,8 @@ static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
>   		safe_to_exit_level = 5;
>   		break;
>   	default:
> -		DRM_DEBUG_DP("setting the default safe_to_exit_level = %u\n",
> +		drm_dbg_dp(audio->drm_dev,
> +				"setting the default safe_to_exit_level = %u\n",
>   				safe_to_exit_level);
>   		safe_to_exit_level = 14;
>   		break;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 64f0b26..cbf7cf6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -47,6 +47,7 @@
>   
>   struct dp_catalog_private {
>   	struct device *dev;
> +	struct drm_device *drm_dev;
>   	struct dp_io *io;
>   	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
>   	struct dp_catalog dp_catalog;
> @@ -322,7 +323,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 cfg)
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
>   
> -	DRM_DEBUG_DP("DP_CONFIGURATION_CTRL=0x%x\n", cfg);
> +	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
>   
>   	dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
>   }
> @@ -350,7 +351,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
>   
> -	DRM_DEBUG_DP("enable=%d\n", enable);
> +	drm_dbg_dp(catalog->drm_dev, "enable=%d\n", enable);
>   	if (enable) {
>   		/*
>   		 * To make sure link reg writes happens before other operation,
> @@ -395,7 +396,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   	/* Configure clock to synchronous mode */
>   	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>   
> -	DRM_DEBUG_DP("misc settings = 0x%x\n", misc_val);
> +	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
>   	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>   }
>   
> @@ -450,7 +451,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   	if (link_rate_hbr3 == rate)
>   		nvid *= 3;
>   
> -	DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> +	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>   	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
>   	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
>   	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> @@ -465,7 +466,7 @@ int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
>   
>   	bit = BIT(state_bit - 1);
> -	DRM_DEBUG_DP("hw: bit=%d train=%d\n", bit, state_bit);
> +	drm_dbg_dp(catalog->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
>   	dp_catalog_ctrl_state_ctrl(dp_catalog, bit);
>   
>   	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
> @@ -557,7 +558,8 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>   
>   	config = (en ? config | intr_mask : config & ~intr_mask);
>   
> -	DRM_DEBUG_DP("intr_mask=%#x config=%#x\n", intr_mask, config);
> +	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
> +					intr_mask, config);
>   	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
>   				config & DP_DP_HPD_INT_MASK);
>   }
> @@ -588,7 +590,7 @@ u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
>   	u32 status;
>   
>   	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> -	DRM_DEBUG_DP("aux status: %#x\n", status);
> +	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
>   	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
>   	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
>   
> @@ -664,7 +666,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>   	/* Make sure to clear the current pattern before starting a new one */
>   	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
>   
> -	DRM_DEBUG_DP("pattern: %#x\n", pattern);
> +	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
>   	switch (pattern) {
>   	case DP_PHY_TEST_PATTERN_D10_2:
>   		dp_write_link(catalog, REG_DP_STATE_CTRL,
> @@ -725,7 +727,8 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>   				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
>   		break;
>   	default:
> -		DRM_DEBUG_DP("No valid test pattern requested: %#x\n", pattern);
> +		drm_dbg_dp(catalog->drm_dev,
> +				"No valid test pattern requested: %#x\n", pattern);
>   		break;
>   	}
>   }
> @@ -820,7 +823,7 @@ void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				DP_BIST_ENABLE_DPBIST_EN);
>   	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
>   				DP_TIMING_ENGINE_EN_EN);
> -	DRM_DEBUG_DP("%s: enabled tpg\n", __func__);
> +	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
>   }
>   
>   void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
> @@ -909,7 +912,8 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
>   	select = dp_catalog->audio_data;
>   	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
>   
> -	DRM_DEBUG_DP("select: %#x, acr_ctrl: %#x\n", select, acr_ctrl);
> +	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
> +					select, acr_ctrl);
>   
>   	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
>   }
> @@ -934,7 +938,7 @@ void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
>   	else
>   		audio_ctrl &= ~BIT(0);
>   
> -	DRM_DEBUG_DP("dp_audio_cfg = 0x%x\n", audio_ctrl);
> +	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
>   
>   	dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
>   	/* make sure audio engine is disabled */
> @@ -965,7 +969,7 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
>   	/* AUDIO_INFOFRAME_SDP_EN  */
>   	sdp_cfg |= BIT(20);
>   
> -	DRM_DEBUG_DP("sdp_cfg = 0x%x\n", sdp_cfg);
> +	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
>   
>   	dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
>   
> @@ -975,7 +979,7 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *dp_catalog)
>   	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
>   	sdp_cfg2 &= ~BIT(1);
>   
> -	DRM_DEBUG_DP("sdp_cfg2 = 0x%x\n", sdp_cfg2);
> +	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
>   
>   	dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
>   }
> @@ -1037,7 +1041,8 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
>   	mainlink_levels &= 0xFE0;
>   	mainlink_levels |= safe_to_exit_level;
>   
> -	DRM_DEBUG_DP("mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
> +	drm_dbg_dp(catalog->drm_dev,
> +			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
>   			 mainlink_levels, safe_to_exit_level);
>   
>   	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dcd0126..e52d770 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -69,6 +69,7 @@ struct dp_vc_tu_mapping_table {
>   
>   struct dp_ctrl_private {
>   	struct dp_ctrl dp_ctrl;
> +	struct drm_device *drm_dev;
>   	struct device *dev;
>   	struct drm_dp_aux *aux;
>   	struct dp_panel *panel;
> @@ -113,7 +114,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
>   			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>   		pr_warn("PUSH_IDLE pattern timedout\n");
>   
> -	DRM_DEBUG_DP("mainlink off done\n");
> +	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>   }
>   
>   static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
> @@ -602,8 +603,9 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	}
>   }
>   
> -static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
> -				   struct dp_vc_tu_mapping_table *tu_table)
> +static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
> +				struct dp_tu_calc_input *in,
> +				struct dp_vc_tu_mapping_table *tu_table)
>   {
>   	struct tu_algo_data *tu;
>   	int compare_result_1, compare_result_2;
> @@ -686,8 +688,8 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
>   
>   	if (tu->dsc_en && compare_result_1 && compare_result_2) {
>   		HBLANK_MARGIN += 4;
> -		DRM_DEBUG_DP("Info: increase HBLANK_MARGIN to %d\n",
> -				HBLANK_MARGIN);
> +		drm_dbg_dp(ctrl->drm_dev,
> +			"increase HBLANK_MARGIN to %d\n", HBLANK_MARGIN);
>   	}
>   
>   tu_size_calc:
> @@ -721,8 +723,10 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
>   		tu->n_tus += 1;
>   
>   	tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
> -	DRM_DEBUG_DP("Info: n_sym = %d, num_of_tus = %d\n",
> -		tu->valid_boundary_link, tu->n_tus);
> +
> +	drm_dbg_dp(ctrl->drm_dev,
> +			"n_sym = %d, num_of_tus = %d\n",
> +			tu->valid_boundary_link, tu->n_tus);
>   
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
>   	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
> @@ -915,19 +919,20 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
>   	tu_table->lower_boundary_count      = tu->lower_boundary_count;
>   	tu_table->tu_size_minus1            = tu->tu_size_minus1;
>   
> -	DRM_DEBUG_DP("TU: valid_boundary_link: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: valid_boundary_link: %d\n",
>   				tu_table->valid_boundary_link);
> -	DRM_DEBUG_DP("TU: delay_start_link: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: delay_start_link: %d\n",
>   				tu_table->delay_start_link);
> -	DRM_DEBUG_DP("TU: boundary_moderation_en: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: boundary_moderation_en: %d\n",
>   			tu_table->boundary_moderation_en);
> -	DRM_DEBUG_DP("TU: valid_lower_boundary_link: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: valid_lower_boundary_link: %d\n",
>   			tu_table->valid_lower_boundary_link);
> -	DRM_DEBUG_DP("TU: upper_boundary_count: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: upper_boundary_count: %d\n",
>   			tu_table->upper_boundary_count);
> -	DRM_DEBUG_DP("TU: lower_boundary_count: %d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "TU: lower_boundary_count: %d\n",
>   			tu_table->lower_boundary_count);
> -	DRM_DEBUG_DP("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
> +	drm_dbg_dp(ctrl->drm_dev, "TU: tu_size_minus1: %d\n",
> +			tu_table->tu_size_minus1);
>   
>   	kfree(tu);
>   }
> @@ -953,7 +958,7 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
>   	in.num_of_dsc_slices = 0;
>   	in.compress_ratio = 100;
>   
> -	_dp_ctrl_calc_tu(&in, tu_table);
> +	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
>   }
>   
>   static void dp_ctrl_setup_tr_unit(struct dp_ctrl_private *ctrl)
> @@ -1004,8 +1009,9 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   	u32 voltage_swing_level = link->phy_params.v_level;
>   	u32 pre_emphasis_level = link->phy_params.p_level;
>   
> -	DRM_DEBUG_DP("voltage level: %d emphasis level: %d\n", voltage_swing_level,
> -			pre_emphasis_level);
> +	drm_dbg_dp(ctrl->drm_dev,
> +		"voltage level: %d emphasis level: %d\n",
> +			voltage_swing_level, pre_emphasis_level);
>   	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
>   		voltage_swing_level, pre_emphasis_level);
>   
> @@ -1013,13 +1019,15 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   		return ret;
>   
>   	if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
> -		DRM_DEBUG_DP("max. voltage swing level reached %d\n",
> +		drm_dbg_dp(ctrl->drm_dev,
> +				"max. voltage swing level reached %d\n",
>   				voltage_swing_level);
>   		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
>   	}
>   
>   	if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
> -		DRM_DEBUG_DP("max. pre-emphasis level reached %d\n",
> +		drm_dbg_dp(ctrl->drm_dev,
> +				"max. pre-emphasis level reached %d\n",
>   				pre_emphasis_level);
>   		max_level_reached  |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>   	}
> @@ -1031,8 +1039,8 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
>   		buf[lane] = voltage_swing_level | pre_emphasis_level
>   				| max_level_reached;
>   
> -	DRM_DEBUG_DP("sink: p|v=0x%x\n", voltage_swing_level
> -					| pre_emphasis_level);
> +	drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
> +			voltage_swing_level | pre_emphasis_level);
>   	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
>   					buf, lane_cnt);
>   	if (ret == lane_cnt)
> @@ -1047,7 +1055,7 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
>   	u8 buf;
>   	int ret = 0;
>   
> -	DRM_DEBUG_DP("sink: pattern=%x\n", pattern);
> +	drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
>   
>   	buf = pattern;
>   
> @@ -1118,8 +1126,6 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>   			old_v_level = ctrl->link->phy_params.v_level;
>   		}
>   
> -		DRM_DEBUG_DP("clock recovery not done, adjusting vx px\n");
> -
>   		dp_link_adjust_levels(ctrl->link, link_status);
>   		ret = dp_ctrl_update_vx_px(ctrl);
>   		if (ret)
> @@ -1150,8 +1156,10 @@ static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
>   		break;
>   	}
>   
> -	if (!ret)
> -		DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
> +	if (!ret) {
> +		drm_dbg_dp(ctrl->drm_dev, "new rate=0x%x\n",
> +				ctrl->link->link_params.rate);
> +	}
>   
>   	return ret;
>   }
> @@ -1270,7 +1278,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   	}
>   
>   	/* print success info as this is a result of user initiated action */
> -	DRM_DEBUG_DP("link training #1 successful\n");
> +	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
>   
>   	ret = dp_ctrl_link_train_2(ctrl, training_step);
>   	if (ret) {
> @@ -1279,7 +1287,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   	}
>   
>   	/* print success info as this is a result of user initiated action */
> -	DRM_DEBUG_DP("link training #2 successful\n");
> +	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
>   
>   end:
>   	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> @@ -1319,7 +1327,8 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>   		cfg++;
>   	}
>   
> -	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> +	drm_dbg_dp(ctrl->drm_dev, "setting rate=%lu on clk=%s\n",
> +						rate, name);
>   
>   	if (num)
>   		cfg->rate = rate;
> @@ -1349,7 +1358,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>   	if (ret)
>   		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
>   
> -	DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
>   		ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
>   
>   	return ret;
> @@ -1366,7 +1375,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>   	if (ret)
>   		DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);
>   
> -	DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
>   			ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
>   
>   	return ret;
> @@ -1396,7 +1405,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>   	phy_init(phy);
> -	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +
> +	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
>   }
>   
> @@ -1412,7 +1422,7 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>   
>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>   	phy_exit(phy);
> -	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
>   }
>   
> @@ -1488,7 +1498,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>   	phy_exit(phy);
>   	phy_init(phy);
>   
> -	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
>   	return 0;
>   }
> @@ -1523,7 +1533,8 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   	int ret = 0;
>   
>   	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> -		DRM_DEBUG_DP("no test pattern selected by sink\n");
> +		drm_dbg_dp(ctrl->drm_dev,
> +			"no test pattern selected by sink\n");
>   		return ret;
>   	}
>   
> @@ -1553,7 +1564,7 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   	u32 pattern_sent = 0x0;
>   	u32 pattern_requested = ctrl->link->phy_params.phy_test_pattern_sel;
>   
> -	DRM_DEBUG_DP("request: 0x%x\n", pattern_requested);
> +	drm_dbg_dp(ctrl->drm_dev, "request: 0x%x\n", pattern_requested);
>   
>   	if (dp_catalog_ctrl_update_vx_px(ctrl->catalog,
>   			ctrl->link->phy_params.v_level,
> @@ -1594,8 +1605,8 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>   		success = false;
>   	}
>   
> -	DRM_DEBUG_DP("%s: test->0x%x\n", success ? "success" : "failed",
> -						pattern_requested);
> +	drm_dbg_dp(ctrl->drm_dev, "%s: test->0x%x\n",
> +		success ? "success" : "failed", pattern_requested);
>   	return success;
>   }
>   
> @@ -1613,7 +1624,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>   	sink_request = ctrl->link->sink_request;
>   
>   	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> -		DRM_DEBUG_DP("PHY_TEST_PATTERN request\n");
> +		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
>   		if (dp_ctrl_process_phy_test_request(ctrl)) {
>   			DRM_ERROR("process phy_test_req failed\n");
>   			return;
> @@ -1685,7 +1696,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
>   
>   	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> -		DRM_DEBUG_DP("using phy test link parameters\n");
> +		drm_dbg_dp(ctrl->drm_dev,
> +				"using phy test link parameters\n");
>   		if (!ctrl->panel->dp_mode.drm_mode.clock)
>   			ctrl->dp_ctrl.pixel_rate = phy_cts_pixel_clk_khz;
>   	} else {
> @@ -1695,9 +1707,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   	}
>   
> -	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
> -		ctrl->link->link_params.rate,
> -		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
> +		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
> +		ctrl->dp_ctrl.pixel_rate);
>   
>   	ctrl->link->phy_params.p_level = 0;
>   	ctrl->link->phy_params.v_level = 0;
> @@ -1810,7 +1822,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   
>   	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
>   		ctrl->link->link_params.rate,
>   		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
>   
> @@ -1860,7 +1872,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   		return ret;
>   
>   	mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
> -	DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> +	drm_dbg_dp(ctrl->drm_dev,
> +		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>   
>   end:
>   	return ret;
> @@ -1896,16 +1909,13 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   		return ret;
>   	}
>   
> -	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> -		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> -
>   	phy_power_off(phy);
>   
>   	/* aux channel down, reinit phy */
>   	phy_exit(phy);
>   	phy_init(phy);
>   
> -	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
>   	return ret;
>   }
> @@ -1938,7 +1948,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   	}
>   
>   	phy_power_off(phy);
> -	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
> +	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
>   			phy, phy->init_count, phy->power_count);
>   
>   	return ret;
> @@ -1957,12 +1967,12 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>   	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
>   
>   	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
> -		DRM_DEBUG_DP("dp_video_ready\n");
> +		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
>   		complete(&ctrl->video_comp);
>   	}
>   
>   	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
> -		DRM_DEBUG_DP("idle_patterns_sent\n");
> +		drm_dbg_dp(ctrl->drm_dev, "idle_patterns_sent\n");
>   		complete(&ctrl->idle_comp);
>   	}
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01371dd..f89f3ed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -87,6 +87,7 @@ struct dp_display_private {
>   	bool hpd_irq_on;
>   	bool audio_supported;
>   
> +	struct drm_device *drm_dev;
>   	struct platform_device *pdev;
>   	struct dentry *root;
>   
> @@ -249,6 +250,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   
>   	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
>   
> +	dp->drm_dev = drm;
>   	dp->aux->drm_dev = drm;
>   	rc = dp_aux_register(dp->aux);
>   	if (rc) {
> @@ -294,7 +296,8 @@ static bool dp_display_is_ds_bridge(struct dp_panel *panel)
>   
>   static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>   {
> -	DRM_DEBUG_DP("present=%#x sink_count=%d\n", dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
> +	drm_dbg_dp(dp->drm_dev, "present=%#x sink_count=%d\n",
> +			dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT],
>   		dp->link->sink_count);
>   	return dp_display_is_ds_bridge(dp->panel) &&
>   		(dp->link->sink_count == 0);
> @@ -317,7 +320,8 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   {
>   	if ((hpd && dp->dp_display.is_connected) ||
>   			(!hpd && !dp->dp_display.is_connected)) {
> -		DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
> +		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> +				(hpd ? "on" : "off"));
>   		return 0;
>   	}
>   
> @@ -327,7 +331,8 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   
>   	dp->dp_display.is_connected = hpd;
>   
> -	DRM_DEBUG_DP("hpd=%d\n", hpd);
> +	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
> +			dp->dp_display.connector_type, hpd);
>   	dp_display_send_hpd_event(&dp->dp_display);
>   
>   	return 0;
> @@ -375,7 +380,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>   
>   static void dp_display_host_phy_init(struct dp_display_private *dp)
>   {
> -	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> @@ -387,7 +392,7 @@ static void dp_display_host_phy_init(struct dp_display_private *dp)
>   
>   static void dp_display_host_phy_exit(struct dp_display_private *dp)
>   {
> -	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> @@ -399,7 +404,7 @@ static void dp_display_host_phy_exit(struct dp_display_private *dp)
>   
>   static void dp_display_host_init(struct dp_display_private *dp)
>   {
> -	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> @@ -411,7 +416,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
>   
>   static void dp_display_host_deinit(struct dp_display_private *dp)
>   {
> -	DRM_DEBUG_DP("type=%d core_init=%d phy_init=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> @@ -452,7 +457,7 @@ static int dp_display_handle_port_ststus_changed(struct dp_display_private *dp)
>   	int rc = 0;
>   
>   	if (dp_display_is_sink_count_zero(dp)) {
> -		DRM_DEBUG_DP("sink count is zero, nothing to do\n");
> +		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>   		if (dp->hpd_state != ST_DISCONNECTED) {
>   			dp->hpd_state = ST_DISCONNECT_PENDING;
>   			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> @@ -473,10 +478,11 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
>   {
>   	u32 sink_request = dp->link->sink_request;
>   
> -	DRM_DEBUG_DP("%d\n", sink_request);
> +	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
>   	if (dp->hpd_state == ST_DISCONNECTED) {
>   		if (sink_request & DP_LINK_STATUS_UPDATED) {
> -			DRM_DEBUG_DP("Disconnected sink_request: %d\n", sink_request);
> +			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
> +							sink_request);
>   			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
>   			return -EINVAL;
>   		}
> @@ -500,7 +506,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>   	rc = dp_link_process_request(dp->link);
>   	if (!rc) {
>   		sink_request = dp->link->sink_request;
> -		DRM_DEBUG_DP("hpd_state=%d sink_request=%d\n", dp->hpd_state, sink_request);
> +		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
> +					dp->hpd_state, sink_request);
>   		if (sink_request & DS_PORT_STATUS_CHANGED)
>   			rc = dp_display_handle_port_ststus_changed(dp);
>   		else
> @@ -523,7 +530,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   	mutex_lock(&dp->event_mutex);
>   
>   	state =  dp->hpd_state;
> -	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
>   	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> @@ -557,7 +564,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>   	dp_catalog_hpd_config_intr(dp->catalog,
>   		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
>   
> -	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   	mutex_unlock(&dp->event_mutex);
>   
> @@ -577,7 +584,7 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>   	state = dp->hpd_state;
>   	if (state == ST_CONNECT_PENDING) {
>   		dp->hpd_state = ST_CONNECTED;
> -		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +		drm_dbg_dp(dp->drm_dev, "type=%d\n", dp->dp_display.connector_type);
>   	}
>   
>   	mutex_unlock(&dp->event_mutex);
> @@ -611,7 +618,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   
>   	state = dp->hpd_state;
>   
> -	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
>   	/* disable irq_hpd/replug interrupts */
> @@ -662,7 +669,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   	/* enable HDP plug interrupt to prepare for next plugin */
>   	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
>   
> -	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
>   	/* uevent will complete disconnection part */
> @@ -679,7 +686,7 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>   	state =  dp->hpd_state;
>   	if (state == ST_DISCONNECT_PENDING) {
>   		dp->hpd_state = ST_DISCONNECTED;
> -		DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +		drm_dbg_dp(dp->drm_dev, "type=%d\n", dp->dp_display.connector_type);
>   	}
>   
>   	mutex_unlock(&dp->event_mutex);
> @@ -695,7 +702,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   
>   	/* irq_hpd can happen at either connected or disconnected state */
>   	state =  dp->hpd_state;
> -	DRM_DEBUG_DP("Before, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
>   	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> @@ -719,7 +726,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   
>   	dp_display_usbpd_attention_cb(&dp->pdev->dev);
>   
> -	DRM_DEBUG_DP("After, type=%d hpd_state=%d\n",
> +	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>   			dp->dp_display.connector_type, state);
>   
>   	mutex_unlock(&dp->event_mutex);
> @@ -860,9 +867,9 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   	int rc = 0;
>   	struct msm_dp *dp_display = &dp->dp_display;
>   
> -	DRM_DEBUG_DP("sink_count=%d\n", dp->link->sink_count);
> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>   	if (dp_display->power_on) {
> -		DRM_DEBUG_DP("Link already setup, return\n");
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>   		return 0;
>   	}
>   
> @@ -927,7 +934,7 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>   
>   	dp_display->power_on = false;
>   
> -	DRM_DEBUG_DP("sink count: %d\n", dp->link->sink_count);
> +	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>   	return 0;
>   }
>   
> @@ -1171,7 +1178,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>   	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
>   
>   	if (hpd_isr_status & 0x0F) {
> -		DRM_DEBUG_DP("type=%d isr=0x%x\n",
> +		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
>   			dp->dp_display.connector_type, hpd_isr_status);
>   		/* hpd related interrupts */
>   		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
> @@ -1325,7 +1332,8 @@ static int dp_pm_resume(struct device *dev)
>   
>   	mutex_lock(&dp->event_mutex);
>   
> -	DRM_DEBUG_DP("Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> +	drm_dbg_dp(dp->drm_dev,
> +		"Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> @@ -1366,8 +1374,8 @@ static int dp_pm_resume(struct device *dev)
>   		dp_display_handle_plugged_change(dp_display, false);
>   	}
>   
> -	DRM_DEBUG_DP("After, type=%d sink_count=%d is_connected=%d \
> -			core_inited=%d phy_inited=%d power_on=%d\n",
> +	drm_dbg_dp(dp->drm_dev,
> +		"After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
>   		dp->dp_display.connector_type, dp->link->sink_count,
>   		dp->dp_display.is_connected, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
> @@ -1387,7 +1395,8 @@ static int dp_pm_suspend(struct device *dev)
>   
>   	mutex_lock(&dp->event_mutex);
>   
> -	DRM_DEBUG_DP("Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> +	drm_dbg_dp(dp->drm_dev,
> +		"Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> @@ -1402,7 +1411,8 @@ static int dp_pm_suspend(struct device *dev)
>   
>   	dp->hpd_state = ST_SUSPENDED;
>   
> -	DRM_DEBUG_DP("After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> +	drm_dbg_dp(dp->drm_dev,
> +		"After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> @@ -1590,6 +1600,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>   	/* completed connection */
>   	dp_display->hpd_state = ST_CONNECTED;
>   
> +	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>   	mutex_unlock(&dp_display->event_mutex);
>   
>   	return rc;
> @@ -1633,6 +1644,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>   		dp_display->hpd_state = ST_DISPLAY_OFF;
>   	}
>   
> +	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>   	mutex_unlock(&dp_display->event_mutex);
>   	return rc;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d..0b4df62 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -39,7 +39,7 @@ static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
>   
>   	dp = to_dp_connector(conn)->dp_display;
>   
> -	DRM_DEBUG_DP("is_connected = %s\n",
> +	drm_dbg_dp(conn->dev, "is_connected = %s\n",
>   		(dp->is_connected) ? "true" : "false");
>   
>   	return (dp->is_connected) ? connector_status_connected :
> @@ -95,7 +95,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   			drm_mode_probed_add(connector, m);
>   		}
>   	} else {
> -		DRM_DEBUG_DP("No sink connected\n");
> +		drm_dbg_dp(connector->dev, "No sink connected\n");
>   	}
>   	kfree(dp_mode);
>   	return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index d4d31e5..36f0af0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -36,6 +36,7 @@ struct dp_link_request {
>   struct dp_link_private {
>   	u32 prev_sink_count;
>   	struct device *dev;
> +	struct drm_device *drm_dev;
>   	struct drm_dp_aux *aux;
>   	struct dp_link dp_link;
>   
> @@ -128,14 +129,14 @@ static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
>   		goto exit;
>   
>   	req->test_audio_period_ch_1 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_1 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_1 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH2);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_2 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_2 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_2 = 0x%x\n", ret);
>   
>   	/* TEST_AUDIO_PERIOD_CH_3 (Byte 0x275) */
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH3);
> @@ -143,42 +144,42 @@ static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
>   		goto exit;
>   
>   	req->test_audio_period_ch_3 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_3 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_3 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH4);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_4 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_4 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_4 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH5);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_5 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_5 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_5 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH6);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_6 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_6 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_6 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH7);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_7 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_7 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_7 = 0x%x\n", ret);
>   
>   	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH8);
>   	if (ret == -EINVAL)
>   		goto exit;
>   
>   	req->test_audio_period_ch_8 = ret;
> -	DRM_DEBUG_DP("test_audio_period_ch_8 = 0x%x\n", ret);
> +	drm_dbg_dp(link->drm_dev, "test_audio_period_ch_8 = 0x%x\n", ret);
>   exit:
>   	return ret;
>   }
> @@ -205,7 +206,7 @@ static int dp_link_parse_audio_pattern_type(struct dp_link_private *link)
>   	}
>   
>   	link->dp_link.test_audio.test_audio_pattern_type = data;
> -	DRM_DEBUG_DP("audio pattern type = 0x%x\n", data);
> +	drm_dbg_dp(link->drm_dev, "audio pattern type = 0x%x\n", data);
>   exit:
>   	return ret;
>   }
> @@ -246,8 +247,9 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
>   
>   	link->dp_link.test_audio.test_audio_sampling_rate = sampling_rate;
>   	link->dp_link.test_audio.test_audio_channel_count = channel_count;
> -	DRM_DEBUG_DP("sampling_rate = 0x%x, channel_count = 0x%x\n",
> -					sampling_rate, channel_count);
> +	drm_dbg_dp(link->drm_dev,
> +			"sampling_rate = 0x%x, channel_count = 0x%x\n",
> +			sampling_rate, channel_count);
>   exit:
>   	return ret;
>   }
> @@ -486,7 +488,8 @@ static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
>   		return ret;
>   	}
>   
> -	DRM_DEBUG_DP("link video pattern = 0x%x\n"
> +	drm_dbg_dp(link->drm_dev,
> +		"link video pattern = 0x%x\n"
>   		"link dynamic range = 0x%x\n"
>   		"link bit depth = 0x%x\n"
>   		"TEST_H_TOTAL = %d, TEST_V_TOTAL = %d\n"
> @@ -543,7 +546,8 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
>   	}
>   
>   	link->request.test_link_rate = bp;
> -	DRM_DEBUG_DP("link rate = 0x%x\n", link->request.test_link_rate);
> +	drm_dbg_dp(link->drm_dev, "link rate = 0x%x\n",
> +				link->request.test_link_rate);
>   
>   	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_LANE_COUNT, &bp);
>   	if (rlen < 0) {
> @@ -558,7 +562,8 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
>   	}
>   
>   	link->request.test_lane_count = bp;
> -	DRM_DEBUG_DP("lane count = 0x%x\n", link->request.test_lane_count);
> +	drm_dbg_dp(link->drm_dev, "lane count = 0x%x\n",
> +				link->request.test_lane_count);
>   	return 0;
>   }
>   
> @@ -583,7 +588,7 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
>   
>   	link->dp_link.phy_params.phy_test_pattern_sel = data & 0x07;
>   
> -	DRM_DEBUG_DP("phy_test_pattern_sel = 0x%x\n", data);
> +	drm_dbg_dp(link->drm_dev, "phy_test_pattern_sel = 0x%x\n", data);
>   
>   	switch (data) {
>   	case DP_PHY_TEST_PATTERN_SEL_MASK:
> @@ -639,10 +644,10 @@ static int dp_link_parse_request(struct dp_link_private *link)
>   		return rlen;
>   	}
>   
> -	DRM_DEBUG_DP("device service irq vector = 0x%x\n", data);
> +	drm_dbg_dp(link->drm_dev, "device service irq vector = 0x%x\n", data);
>   
>   	if (!(data & DP_AUTOMATED_TEST_REQUEST)) {
> -		DRM_DEBUG_DP("no test requested\n");
> +		drm_dbg_dp(link->drm_dev, "no test requested\n");
>   		return 0;
>   	}
>   
> @@ -657,11 +662,11 @@ static int dp_link_parse_request(struct dp_link_private *link)
>   	}
>   
>   	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
> -		DRM_DEBUG_DP("link 0x%x not supported\n", data);
> +		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
>   		goto end;
>   	}
>   
> -	DRM_DEBUG_DP("Test:(0x%x) requested\n", data);
> +	drm_dbg_dp(link->drm_dev, "Test:(0x%x) requested\n", data);
>   	link->request.test_requested = data;
>   	if (link->request.test_requested == DP_TEST_LINK_PHY_TEST_PATTERN) {
>   		ret = dp_link_parse_phy_test_params(link);
> @@ -732,8 +737,8 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
>   	link->dp_link.sink_count =
>   		DP_GET_SINK_COUNT(link->dp_link.sink_count);
>   
> -	DRM_DEBUG_DP("sink_count = 0x%x, cp_ready = 0x%x\n",
> -		link->dp_link.sink_count, cp_ready);
> +	drm_dbg_dp(link->drm_dev, "sink_count = 0x%x, cp_ready = 0x%x\n",
> +				link->dp_link.sink_count, cp_ready);
>   	return 0;
>   }
>   
> @@ -774,7 +779,8 @@ static int dp_link_process_link_training_request(struct dp_link_private *link)
>   	if (link->request.test_requested != DP_TEST_LINK_TRAINING)
>   		return -EINVAL;
>   
> -	DRM_DEBUG_DP("Test:0x%x link rate = 0x%x, lane count = 0x%x\n",
> +	drm_dbg_dp(link->drm_dev,
> +			"Test:0x%x link rate = 0x%x, lane count = 0x%x\n",
>   			DP_TEST_LINK_TRAINING,
>   			link->request.test_link_rate,
>   			link->request.test_lane_count);
> @@ -852,13 +858,13 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
>   
>   static void dp_link_parse_vx_px(struct dp_link_private *link)
>   {
> -	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
> +	drm_dbg_dp(link->drm_dev, "vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
>   		drm_dp_get_adjust_request_voltage(link->link_status, 0),
>   		drm_dp_get_adjust_request_voltage(link->link_status, 1),
>   		drm_dp_get_adjust_request_voltage(link->link_status, 2),
>   		drm_dp_get_adjust_request_voltage(link->link_status, 3));
>   
> -	DRM_DEBUG_DP("px: 0=%d, 1=%d, 2=%d, 3=%d\n",
> +	drm_dbg_dp(link->drm_dev, "px: 0=%d, 1=%d, 2=%d, 3=%d\n",
>   		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 0),
>   		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 1),
>   		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 2),
> @@ -868,7 +874,8 @@ static void dp_link_parse_vx_px(struct dp_link_private *link)
>   	 * Update the voltage and pre-emphasis levels as per DPCD request
>   	 * vector.
>   	 */
> -	DRM_DEBUG_DP("Current: v_level = 0x%x, p_level = 0x%x\n",
> +	drm_dbg_dp(link->drm_dev,
> +			 "Current: v_level = 0x%x, p_level = 0x%x\n",
>   			link->dp_link.phy_params.v_level,
>   			link->dp_link.phy_params.p_level);
>   	link->dp_link.phy_params.v_level =
> @@ -878,7 +885,8 @@ static void dp_link_parse_vx_px(struct dp_link_private *link)
>   
>   	link->dp_link.phy_params.p_level >>= DP_TRAIN_PRE_EMPHASIS_SHIFT;
>   
> -	DRM_DEBUG_DP("Requested: v_level = 0x%x, p_level = 0x%x\n",
> +	drm_dbg_dp(link->drm_dev,
> +			"Requested: v_level = 0x%x, p_level = 0x%x\n",
>   			link->dp_link.phy_params.v_level,
>   			link->dp_link.phy_params.p_level);
>   }
> @@ -895,7 +903,7 @@ static int dp_link_process_phy_test_pattern_request(
>   		struct dp_link_private *link)
>   {
>   	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) {
> -		DRM_DEBUG_DP("no phy test\n");
> +		drm_dbg_dp(link->drm_dev, "no phy test\n");
>   		return -EINVAL;
>   	}
>   
> @@ -907,11 +915,13 @@ static int dp_link_process_phy_test_pattern_request(
>   		return -EINVAL;
>   	}
>   
> -	DRM_DEBUG_DP("Current: rate = 0x%x, lane count = 0x%x\n",
> +	drm_dbg_dp(link->drm_dev,
> +			"Current: rate = 0x%x, lane count = 0x%x\n",
>   			link->dp_link.link_params.rate,
>   			link->dp_link.link_params.num_lanes);
>   
> -	DRM_DEBUG_DP("Requested: rate = 0x%x, lane count = 0x%x\n",
> +	drm_dbg_dp(link->drm_dev,
> +			"Requested: rate = 0x%x, lane count = 0x%x\n",
>   			link->request.test_link_rate,
>   			link->request.test_lane_count);
>   
> @@ -942,17 +952,18 @@ static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
>    */
>   static int dp_link_process_link_status_update(struct dp_link_private *link)
>   {
> -       bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes);
> +	bool channel_eq_done = drm_dp_channel_eq_ok(link->link_status,
> +			link->dp_link.link_params.num_lanes);
>   
> -       bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
> -                       link->dp_link.link_params.num_lanes);
> +	bool clock_recovery_done = drm_dp_clock_recovery_ok(link->link_status,
> +			link->dp_link.link_params.num_lanes);
>   
> -       DRM_DEBUG_DP("channel_eq_done = %d, clock_recovery_done = %d\n",
> +	drm_dbg_dp(link->drm_dev,
> +		       "channel_eq_done = %d, clock_recovery_done = %d\n",
>                           channel_eq_done, clock_recovery_done);
>   
> -       if (channel_eq_done && clock_recovery_done)
> -               return -EINVAL;
> +	if (channel_eq_done && clock_recovery_done)
> +		return -EINVAL;
>   
>   
>          return 0;
> @@ -1058,7 +1069,8 @@ int dp_link_process_request(struct dp_link *dp_link)
>   		}
>   	}
>   
> -	DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
> +	drm_dbg_dp(link->drm_dev, "sink request=%#x",
> +				dp_link->sink_request);
>   	return ret;
>   }
>   
> @@ -1090,18 +1102,22 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
>   {
>   	int i;
>   	int v_max = 0, p_max = 0;
> +	struct dp_link_private *link;
>   
>   	if (!dp_link) {
>   		DRM_ERROR("invalid input\n");
>   		return -EINVAL;
>   	}
>   
> +	link = container_of(dp_link, struct dp_link_private, dp_link);
> +
>   	/* use the max level across lanes */
>   	for (i = 0; i < dp_link->link_params.num_lanes; i++) {
>   		u8 data_v = drm_dp_get_adjust_request_voltage(link_status, i);
>   		u8 data_p = drm_dp_get_adjust_request_pre_emphasis(link_status,
>   									 i);
> -		DRM_DEBUG_DP("lane=%d req_vol_swing=%d req_pre_emphasis=%d\n",
> +		drm_dbg_dp(link->drm_dev,
> +				"lane=%d req_vol_swing=%d req_pre_emphasis=%d\n",
>   				i, data_v, data_p);
>   		if (v_max < data_v)
>   			v_max = data_v;
> @@ -1117,14 +1133,16 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
>   	 * the allowable range.
>   	 */
>   	if (dp_link->phy_params.v_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
> -		DRM_DEBUG_DP("Requested vSwingLevel=%d, change to %d\n",
> +		drm_dbg_dp(link->drm_dev,
> +			"Requested vSwingLevel=%d, change to %d\n",
>   			dp_link->phy_params.v_level,
>   			DP_TRAIN_VOLTAGE_SWING_MAX);
>   		dp_link->phy_params.v_level = DP_TRAIN_VOLTAGE_SWING_MAX;
>   	}
>   
>   	if (dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_MAX) {
> -		DRM_DEBUG_DP("Requested preEmphasisLevel=%d, change to %d\n",
> +		drm_dbg_dp(link->drm_dev,
> +			"Requested preEmphasisLevel=%d, change to %d\n",
>   			dp_link->phy_params.p_level,
>   			DP_TRAIN_PRE_EMPHASIS_MAX);
>   		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_MAX;
> @@ -1133,13 +1151,14 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
>   	if ((dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_LVL_1)
>   		&& (dp_link->phy_params.v_level ==
>   			DP_TRAIN_VOLTAGE_SWING_LVL_2)) {
> -		DRM_DEBUG_DP("Requested preEmphasisLevel=%d, change to %d\n",
> +		drm_dbg_dp(link->drm_dev,
> +			"Requested preEmphasisLevel=%d, change to %d\n",
>   			dp_link->phy_params.p_level,
>   			DP_TRAIN_PRE_EMPHASIS_LVL_1);
>   		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_LVL_1;
>   	}
>   
> -	DRM_DEBUG_DP("adjusted: v_level=%d, p_level=%d\n",
> +	drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
>   		dp_link->phy_params.v_level, dp_link->phy_params.p_level);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..074c8fc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,7 @@
>   
>   struct dp_panel_private {
>   	struct device *dev;
> +	struct drm_device *drm_dev;
>   	struct dp_panel dp_panel;
>   	struct drm_dp_aux *aux;
>   	struct dp_link *link;
> @@ -50,7 +51,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   
>   	/* check for EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT */
>   	if (temp & BIT(7)) {
> -		DRM_DEBUG_DP("using EXTENDED_RECEIVER_CAPABILITY_FIELD\n");
> +		drm_dbg_dp(panel->drm_dev,
> +				"using EXTENDED_RECEIVER_CAPABILITY_FIELD\n");
>   		offset = DPRX_EXTENDED_DPCD_FIELD;
>   	}
>   
> @@ -80,9 +82,9 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
>   		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
>   
> -	DRM_DEBUG_DP("version: %d.%d\n", major, minor);
> -	DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
> -	DRM_DEBUG_DP("lane_count=%d\n", link_info->num_lanes);
> +	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> +	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> +	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
>   
>   	if (drm_dp_enhanced_frame_cap(dpcd))
>   		link_info->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
> @@ -215,7 +217,8 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	}
>   
>   	if (panel->aux_cfg_update_done) {
> -		DRM_DEBUG_DP("read DPCD with updated AUX config\n");
> +		drm_dbg_dp(panel->drm_dev,
> +				"read DPCD with updated AUX config\n");
>   		rc = dp_panel_read_dpcd(dp_panel);
>   		bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
>   		if (rc || !is_link_rate_valid(bw_code) ||
> @@ -329,7 +332,8 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>   	catalog = panel->catalog;
>   
>   	if (!panel->panel_on) {
> -		DRM_DEBUG_DP("DP panel not enabled, handle TPG on next on\n");
> +		drm_dbg_dp(panel->drm_dev,
> +				"DP panel not enabled, handle TPG on next on\n");
>   		return;
>   	}
>   
> @@ -338,7 +342,7 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>   		return;
>   	}
>   
> -	DRM_DEBUG_DP("%s: calling catalog tpg_enable\n", __func__);
> +	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
>   	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>   }
>   
> @@ -364,12 +368,12 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>   	catalog = panel->catalog;
>   	drm_mode = &panel->dp_panel.dp_mode.drm_mode;
>   
> -	DRM_DEBUG_DP("width=%d hporch= %d %d %d\n",
> +	drm_dbg_dp(panel->drm_dev, "width=%d hporch= %d %d %d\n",
>   		drm_mode->hdisplay, drm_mode->htotal - drm_mode->hsync_end,
>   		drm_mode->hsync_start - drm_mode->hdisplay,
>   		drm_mode->hsync_end - drm_mode->hsync_start);
>   
> -	DRM_DEBUG_DP("height=%d vporch= %d %d %d\n",
> +	drm_dbg_dp(panel->drm_dev, "height=%d vporch= %d %d %d\n",
>   		drm_mode->vdisplay, drm_mode->vtotal - drm_mode->vsync_end,
>   		drm_mode->vsync_start - drm_mode->vdisplay,
>   		drm_mode->vsync_end - drm_mode->vsync_start);
> @@ -413,30 +417,37 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>   int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>   {
>   	struct drm_display_mode *drm_mode;
> +	struct dp_panel_private *panel;
>   
>   	drm_mode = &dp_panel->dp_mode.drm_mode;
>   
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
>   	/*
>   	 * print resolution info as this is a result
>   	 * of user initiated action of cable connection
>   	 */
> -	DRM_DEBUG_DP("SET NEW RESOLUTION:\n");
> -	DRM_DEBUG_DP("%dx%d@%dfps\n", drm_mode->hdisplay,
> -		drm_mode->vdisplay, drm_mode_vrefresh(drm_mode));
> -	DRM_DEBUG_DP("h_porches(back|front|width) = (%d|%d|%d)\n",
> +	drm_dbg_dp(panel->drm_dev, "SET NEW RESOLUTION:\n");
> +	drm_dbg_dp(panel->drm_dev, "%dx%d@%dfps\n",
> +		drm_mode->hdisplay, drm_mode->vdisplay, drm_mode_vrefresh(drm_mode));
> +	drm_dbg_dp(panel->drm_dev,
> +			"h_porches(back|front|width) = (%d|%d|%d)\n",
>   			drm_mode->htotal - drm_mode->hsync_end,
>   			drm_mode->hsync_start - drm_mode->hdisplay,
>   			drm_mode->hsync_end - drm_mode->hsync_start);
> -	DRM_DEBUG_DP("v_porches(back|front|width) = (%d|%d|%d)\n",
> +	drm_dbg_dp(panel->drm_dev,
> +			"v_porches(back|front|width) = (%d|%d|%d)\n",
>   			drm_mode->vtotal - drm_mode->vsync_end,
>   			drm_mode->vsync_start - drm_mode->vdisplay,
>   			drm_mode->vsync_end - drm_mode->vsync_start);
> -	DRM_DEBUG_DP("pixel clock (KHz)=(%d)\n", drm_mode->clock);
> -	DRM_DEBUG_DP("bpp = %d\n", dp_panel->dp_mode.bpp);
> +	drm_dbg_dp(panel->drm_dev, "pixel clock (KHz)=(%d)\n",
> +				drm_mode->clock);
> +	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>   
>   	dp_panel->dp_mode.bpp = max_t(u32, 18,
> -					min_t(u32, dp_panel->dp_mode.bpp, 30));
> -	DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
> +				min_t(u32, dp_panel->dp_mode.bpp, 30));
> +	drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
> +				dp_panel->dp_mode.bpp);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23..410f5f1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -260,8 +260,6 @@ static int dp_parser_clock(struct dp_parser *parser)
>   		}
>   	}
>   
> -	DRM_DEBUG_DP("clock parsing successful\n");
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index b48b45e..d9e0117 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -16,6 +16,7 @@ struct dp_power_private {
>   	struct dp_parser *parser;
>   	struct platform_device *pdev;
>   	struct device *dev;
> +	struct drm_device *drm_dev;
>   	struct clk *link_clk_src;
>   	struct clk *pixel_provider;
>   	struct clk *link_provider;
> @@ -208,7 +209,12 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
>   
>   int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
>   {
> -	DRM_DEBUG_DP("core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> +	struct dp_power_private *power;
> +
> +	power = container_of(dp_power, struct dp_power_private, dp_power);
> +
> +	drm_dbg_dp(power->drm_dev,
> +		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
>   		dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
>   
>   	if (pm_type == DP_CORE_PM)
> @@ -240,22 +246,26 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>   
>   	if (enable) {
>   		if (pm_type == DP_CORE_PM && dp_power->core_clks_on) {
> -			DRM_DEBUG_DP("core clks already enabled\n");
> +			drm_dbg_dp(power->drm_dev,
> +					"core clks already enabled\n");
>   			return 0;
>   		}
>   
>   		if (pm_type == DP_CTRL_PM && dp_power->link_clks_on) {
> -			DRM_DEBUG_DP("links clks already enabled\n");
> +			drm_dbg_dp(power->drm_dev,
> +					"links clks already enabled\n");
>   			return 0;
>   		}
>   
>   		if (pm_type == DP_STREAM_PM && dp_power->stream_clks_on) {
> -			DRM_DEBUG_DP("pixel clks already enabled\n");
> +			drm_dbg_dp(power->drm_dev,
> +					"pixel clks already enabled\n");
>   			return 0;
>   		}
>   
>   		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
> -			DRM_DEBUG_DP("Enable core clks before link clks\n");
> +			drm_dbg_dp(power->drm_dev,
> +					"Enable core clks before link clks\n");
>   
>   			rc = dp_power_clk_set_rate(power, DP_CORE_PM, enable);
>   			if (rc) {
> @@ -282,10 +292,11 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>   	else
>   		dp_power->link_clks_on = enable;
>   
> -	DRM_DEBUG_DP("%s clocks for %s\n",
> +	drm_dbg_dp(power->drm_dev, "%s clocks for %s\n",
>   			enable ? "enable" : "disable",
>   			dp_parser_pm_name(pm_type));
> -	DRM_DEBUG_DP("strem_clks:%s link_clks:%s core_clks:%s\n",
> +	drm_dbg_dp(power->drm_dev,
> +		"strem_clks:%s link_clks:%s core_clks:%s\n",
>   		dp_power->stream_clks_on ? "on" : "off",
>   		dp_power->link_clks_on ? "on" : "off",
>   		dp_power->core_clks_on ? "on" : "off");


-- 
With best wishes
Dmitry
