Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2683CEB1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5A10E91B;
	Thu, 25 Jan 2024 21:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523C310E708
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:34:00 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51020e061b5so883048e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706218378; x=1706823178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gC43oeEn6Z/dF88bOw97Mdza7qqFP/bsP45fUlFMHxc=;
 b=v2jPSjguKCtVMMZE74rVJSsQc9JuPVLmdwBYAd3DvGksODfRU+bxEDfgSMlAShNPgi
 lOY5P1wkjDxvVGWRJ209d7SeZ9OWukSgiPHGDYJFh2VPAvJFaVBQ6hcY8OaNcJHAOPKh
 QjPiXoybGjOomKea/CXs7xGYhVA/+aHcQJG7sXtkCrfmHMAwBdzN57qMiTGpSiUvJWv5
 0c9U8KpSQvrHwNYarzn8bW15EzbqGHzOS/0aikJdyi08N6jebC9OozIKodyHsjpcnSHM
 58EATfCKDROCEfs0r4iK3XkphuZaofa2IpuA8AvZ4sweTcE/peW0hRxdOSTURvd66O7L
 iBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706218378; x=1706823178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gC43oeEn6Z/dF88bOw97Mdza7qqFP/bsP45fUlFMHxc=;
 b=XyPRJ36wHGCNPr2X3rXxgjaLMK2vMtQDuvDbGuUYn9x0Fni07bir+tlAiHc2xjxo0g
 P3AoHUuw0xsb2A5Qj0ZgvHI8zlRlKcqK+ppgT1kpx9V5kySxXhEw5ihxll4KVCFwEHFI
 51FeA5/b9IpY8FzoRen901TychXQvylqZLb03K/qcuV6dsgZnDOyrn6ehJUH3Ag/6r/L
 68ORXrv7ASja8a2OkrsWbSlv7s2LmycTFurHCmY/dWFBXkz5lweLmszsF13LYHmrsZE6
 mhmc3BVPJf4LX/b5zcLC9RCgYJVeSg18CByO64EQhHW18lwBqJSVFpKsJaKs6aja1VWc
 vOCw==
X-Gm-Message-State: AOJu0YwD8rhUq0x46lYN7w/0GqHXkgWM4e2eLOMt8jrUoJzF8izoZRZf
 R4TA6Efro9JzKG6jFU4n/iqExoQhoYTZLVHEkrGIaDCWRe2UTwUgqUBoEs/3Bu4=
X-Google-Smtp-Source: AGHT+IEzUaCrfBiRov5NqQhtatOele2FId5ABPYRFyVNlLIi7xYZNBZ1H4QCUh+xC4UXwx/Ct7PWxg==
X-Received: by 2002:ac2:4c02:0:b0:510:1a04:1e64 with SMTP id
 t2-20020ac24c02000000b005101a041e64mr229175lfq.25.1706218378350; 
 Thu, 25 Jan 2024 13:32:58 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056512350400b0050ecbfa6eeasm2962435lfs.305.2024.01.25.13.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:32:57 -0800 (PST)
Message-ID: <06f76827-bffb-4bc6-a0dd-bc272e4f6690@linaro.org>
Date: Thu, 25 Jan 2024 23:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/dp: move parity calculation to dp_catalog
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-10-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-10-quic_parellan@quicinc.com>
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
> Parity calculation is necessary for VSC SDP implementation, therefore
> move it to dp_catalog so it usable by both SDP programming and
> dp_audio.c
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 100 ++++------------------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  72 ++++++++++++++++++++
>   2 files changed, 86 insertions(+), 86 deletions(-)

There is nothing catalog-uish in the parity calculation. Just add 
dp_utils.c. Another options is to push it to the drm/display/

LGTM otherwise.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 4a2e479723a85..7aa785018155a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -16,13 +16,6 @@
>   #include "dp_panel.h"
>   #include "dp_display.h"
>   
> -#define HEADER_BYTE_2_BIT	 0
> -#define PARITY_BYTE_2_BIT	 8
> -#define HEADER_BYTE_1_BIT	16
> -#define PARITY_BYTE_1_BIT	24
> -#define HEADER_BYTE_3_BIT	16
> -#define PARITY_BYTE_3_BIT	24
> -
>   struct dp_audio_private {
>   	struct platform_device *audio_pdev;
>   	struct platform_device *pdev;
> @@ -36,71 +29,6 @@ struct dp_audio_private {
>   	struct dp_audio dp_audio;
>   };
>   
> -static u8 dp_audio_get_g0_value(u8 data)
> -{
> -	u8 c[4];
> -	u8 g[4];
> -	u8 ret_data = 0;
> -	u8 i;
> -
> -	for (i = 0; i < 4; i++)
> -		c[i] = (data >> i) & 0x01;
> -
> -	g[0] = c[3];
> -	g[1] = c[0] ^ c[3];
> -	g[2] = c[1];
> -	g[3] = c[2];
> -
> -	for (i = 0; i < 4; i++)
> -		ret_data = ((g[i] & 0x01) << i) | ret_data;
> -
> -	return ret_data;
> -}
> -
> -static u8 dp_audio_get_g1_value(u8 data)
> -{
> -	u8 c[4];
> -	u8 g[4];
> -	u8 ret_data = 0;
> -	u8 i;
> -
> -	for (i = 0; i < 4; i++)
> -		c[i] = (data >> i) & 0x01;
> -
> -	g[0] = c[0] ^ c[3];
> -	g[1] = c[0] ^ c[1] ^ c[3];
> -	g[2] = c[1] ^ c[2];
> -	g[3] = c[2] ^ c[3];
> -
> -	for (i = 0; i < 4; i++)
> -		ret_data = ((g[i] & 0x01) << i) | ret_data;
> -
> -	return ret_data;
> -}
> -
> -static u8 dp_audio_calculate_parity(u32 data)
> -{
> -	u8 x0 = 0;
> -	u8 x1 = 0;
> -	u8 ci = 0;
> -	u8 iData = 0;
> -	u8 i = 0;
> -	u8 parity_byte;
> -	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> -
> -	for (i = 0; i < num_byte; i++) {
> -		iData = (data >> i*4) & 0xF;
> -
> -		ci = iData ^ x1;
> -		x1 = x0 ^ dp_audio_get_g1_value(ci);
> -		x0 = dp_audio_get_g0_value(ci);
> -	}
> -
> -	parity_byte = x1 | (x0 << 4);
> -
> -	return parity_byte;
> -}
> -
>   static u32 dp_audio_get_header(struct dp_catalog *catalog,
>   		enum dp_catalog_audio_sdp_type sdp,
>   		enum dp_catalog_audio_header_type header)
> @@ -134,7 +62,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x02;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -147,7 +75,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   	value = dp_audio_get_header(catalog,
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
>   	new_value = value;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -162,7 +90,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = audio->channels - 1;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -184,7 +112,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x1;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -198,7 +126,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x17;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -212,7 +140,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -233,7 +161,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x84;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -247,7 +175,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x1b;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -261,7 +189,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -282,7 +210,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x05;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -296,7 +224,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x0F;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -310,7 +238,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
>   
>   	new_value = 0x0;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_3_BIT)
>   			| (parity_byte << PARITY_BYTE_3_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -331,7 +259,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
>   
>   	new_value = 0x06;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_1_BIT)
>   			| (parity_byte << PARITY_BYTE_1_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> @@ -345,7 +273,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>   			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>   
>   	new_value = 0x0F;
> -	parity_byte = dp_audio_calculate_parity(new_value);
> +	parity_byte = dp_catalog_calculate_parity(new_value);
>   	value |= ((new_value << HEADER_BYTE_2_BIT)
>   			| (parity_byte << PARITY_BYTE_2_BIT));
>   	drm_dbg_dp(audio->drm_dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6cb5e2a243de2..563903605b3a7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -45,6 +45,13 @@ enum dp_phy_aux_config_type {
>   	PHY_AUX_CFG_MAX,
>   };
>   
> +#define HEADER_BYTE_2_BIT	 0
> +#define PARITY_BYTE_2_BIT	 8
> +#define HEADER_BYTE_1_BIT	16
> +#define PARITY_BYTE_1_BIT	24
> +#define HEADER_BYTE_3_BIT	16
> +#define PARITY_BYTE_3_BIT	24
> +
>   enum dp_catalog_audio_sdp_type {
>   	DP_AUDIO_SDP_STREAM,
>   	DP_AUDIO_SDP_TIMESTAMP,
> @@ -73,6 +80,71 @@ struct dp_catalog {
>   	bool wide_bus_en;
>   };
>   
> +static inline u8 dp_catalog_get_g0_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[3];
> +	g[1] = c[0] ^ c[3];
> +	g[2] = c[1];
> +	g[3] = c[2];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_catalog_get_g1_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[0] ^ c[3];
> +	g[1] = c[0] ^ c[1] ^ c[3];
> +	g[2] = c[1] ^ c[2];
> +	g[3] = c[2] ^ c[3];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_catalog_calculate_parity(u32 data)
> +{
> +	u8 x0 = 0;
> +	u8 x1 = 0;
> +	u8 ci = 0;
> +	u8 iData = 0;
> +	u8 i = 0;
> +	u8 parity_byte;
> +	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> +
> +	for (i = 0; i < num_byte; i++) {
> +		iData = (data >> i * 4) & 0xF;
> +
> +		ci = iData ^ x1;
> +		x1 = x0 ^ dp_catalog_get_g1_value(ci);
> +		x0 = dp_catalog_get_g0_value(ci);
> +	}
> +
> +	parity_byte = x1 | (x0 << 4);
> +
> +	return parity_byte;
> +}
> +
>   /* Debug module */
>   void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
>   

-- 
With best wishes
Dmitry

