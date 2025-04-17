Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E1A921EF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9910EB5E;
	Thu, 17 Apr 2025 15:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="inoRrHav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DEC10EB5C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:48:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso641131f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904906; x=1745509706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LbDTz1govFuJqW1HLjiNGtY4aJqmXA2tH78xltv4vpA=;
 b=inoRrHavjE7EcqL6LkqhfubTXZJNT9sgjMS6BAsR2IXwhepIzIO5p80khRU8Othr0M
 HLWUang3pOXqgPG5ZUjNoTEMjSsxGg0xY7njKhiEmYcrcyZVO1uaIPQxYVwEB2/v5Nxk
 Dig5WEFndOX3EL/iMeQ3xtTDzv3dFj4hH55I3isHlOSA2tRx9z2r+QscpjabpV5nJnCJ
 GJ7yS3TqtaQB3FEysA2fdrCbXaZTzIr7JF+khkZwC2ES4sEjwRz1+vaCTg/b7iiBHC9O
 nnHqNQ8zgfJBH56LhapRXIiEARu7jnAhylBGUctBTnsm7S23swPqEyki3NIlTwKVMxs6
 1yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904906; x=1745509706;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LbDTz1govFuJqW1HLjiNGtY4aJqmXA2tH78xltv4vpA=;
 b=LnJWzH5n0xI2a32k+xM/FHB4GytzQu78AAYioY4LvK/jak6AQJu+Y3qxTWljNnAbR1
 TbLrkvQy/GraKnJBs9BE9O9lT+tmQGaPaVCDEU8swIlW1TmbCxkJI4ANYXSJj/IjceCJ
 QDAHcEvRKGV8c+N+Kc1/HWnjXP48i7F2k56dhndN/7TSzGDyezA7Xw3vUgAcVpyi2OLr
 kiC9uAeDbYNB3ukVki4NrWxhVhh73UH6D6i+6aMWDrkGII7bP1RoaQvsB3jcexIDD05P
 QeFo46rNwAPOAYd42j1kh0AM8k12QLMujpHunZCERkUsHsE0pN1koNEU7wKQfGE1sLnE
 dkHQ==
X-Gm-Message-State: AOJu0YxPXtO1/GcVaAowtVxdPxSEoLbgjkBAasgNZsQgykhcxgmpBG04
 I62ZxExs91wew6rydIcQYzwrrmBZR9lrOhGTn6P7L/F5aX3vz4g+x+S+BqBSpU4=
X-Gm-Gg: ASbGncuhztrKVeVC6uT1LIiQgvpTxwEHHWawfHaxze753crxReJLSf8nIxn9BAbsXti
 w8CpvxVkIt1zdaXQvfmryqjjtE5yYHVS1FCl/JYCU2JEeRh59BAt0+NJbUukpKVJMWQEEAC0iMv
 KO6PTrcOVnvYvYzaTQSKav1P/nDgxqZgFn1gmh9pzknmR183T4PD0Wd89UUJKRf/OuIyr7/uAmq
 lNshWejajA+IOG7E/9pY+FgHW0ucFr9WXGeehYoJKz7pV/vdWg8zdbvUB0Ev+5R2lVBmUyB+RA8
 rOmCzYkDrZ0jxEKIV94QxGWsqJ3am9TzCIVy2zo9ixPsGUgQc13n7nqr5wcy4zt6xMxtbdxwPvS
 6bICl2TwvLY+5DUk=
X-Google-Smtp-Source: AGHT+IESUQJ7NOxOmnwu3OdSTKOT8rUo3iZKc5XBtYlZsnAtS4EidAQdEv9hWGPKjw9Go7Hovic/9g==
X-Received: by 2002:a05:6000:2408:b0:38f:4f60:e669 with SMTP id
 ffacd0b85a97d-39ee5b33b16mr4947410f8f.29.1744904906292; 
 Thu, 17 Apr 2025 08:48:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae977513sm20404419f8f.42.2025.04.17.08.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:48:25 -0700 (PDT)
Message-ID: <96737f4e-4a7b-41dc-97d7-9d4be13d5ff6@linaro.org>
Date: Thu, 17 Apr 2025 17:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/7] drm/bridge: analogix_dp: inline
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() is now only calling a corresponding
> drm_panel function. Inline it to simplify the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++-----------------
>   1 file changed, 10 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978..f60068011008482f7b7b2edfcab5fb1b3e9e130f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -955,33 +955,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>   }
>   
> -/*
> - * This function is a bit of a catch-all for panel preparation, hopefully
> - * simplifying the logic of functions that need to prepare/unprepare the panel
> - * below.
> - *
> - * If @prepare is true, this function will prepare the panel. Conversely, if it
> - * is false, the panel will be unprepared.
> - *
> - * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare.
> - */
> -static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare)
> -{
> -	int ret = 0;
> -
> -	if (!dp->plat_data->panel)
> -		return 0;
> -
> -	if (prepare)
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -	else
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -
> -	return ret;
> -}
> -
>   static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
> @@ -1174,9 +1147,11 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_prepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> +	}
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1274,9 +1249,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_unprepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> +	}
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
