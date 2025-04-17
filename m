Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEBA921F3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F7E10E2B4;
	Thu, 17 Apr 2025 15:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zdQqvYEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C02810E2B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:49:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so7017285e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904940; x=1745509740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lxs3pbRmeZljAVv85dIFV0auKcBCxEW2zKAGoLO6chg=;
 b=zdQqvYEd/1fiABzwWyKnQZkSnxEDK4cCWtRaZLKdNMpw1i+1gFJ8UK+rQe6v2MUO8d
 qMdus7hyJ58hXw1r0ekHqqfg6pR5EwIz0+MeQlXiqGy53dTBOJvcWL0seovgeSRztb5S
 wI2hFQuK/zcxA7PklnzrY3WWP/m72L2akTLfsePnXV8y1bWijsCoUwrfpja85VTz6ay9
 OXJWoS/qcDZCiaD0ViJGjCRrX38h+jLNGcjvqcAPWcSgBZGB+1sQDrhxfJztRE+ZR2eJ
 Uoq6g0h38ILjjk871IKfP5MAtYfgd3moxoo2Aclbg6aefirPOAYbRWtIrN+nrT7v8naU
 tlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904940; x=1745509740;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lxs3pbRmeZljAVv85dIFV0auKcBCxEW2zKAGoLO6chg=;
 b=E93O9nc988zD6R6QEESQhqhYczk4v80mf95AOHsr0anwyMMP27BQWbnG5jKeYskIDd
 PaeJBCDlLNo3zvznNb8Hgsi5Eoed6j1k6f9+QKRPk2ip0dZoYfHYvBGf/IF6N/QSXXMW
 FL88+fBG/53vBuEOgB1thGfGK+bTekPAnuZ7/lfTZRMzxhwitb+1BhqA5Qh/4AJYYo1t
 wapyrvyVyV7YZYZ3Kb7PyludbHme4U63t2BF5Q5VXRK3Jlww2vlBe8HRijxDfH19XeHK
 p+I5xacOvEQhkXnDpgK6x0nzRcpBS8nb/VAiWnIVeRjh2aRwKWmfJOXvR2lr8F56Iw+x
 Whuw==
X-Gm-Message-State: AOJu0YwWOsOIG0/wVGPHMBfqN/7blYicrLSMofUELA0PeJdXew1gRhbm
 gal1eDmPbp+TKPHVC3zKvEzASi/pVXFS6KG0KxTAhrgz4F9kdlkYTSgUhN78Ma0=
X-Gm-Gg: ASbGncuk1ie8XiAW6NGDLwEsUbDUBjfR+Sygvq58fon/eTOLVjbiiaKZMbB5I4DsPZN
 tiHRlffrnH0SK7ouYs/fpuJAXJr0e3kRREjrYlc51Ok5UHC1gBBAjt9DLr9Yx6b40Mc/NGQdP8f
 M813oqmjmUKmkeuVPxGGyuFXps0T7GVDvwMvLiFP9WEIznvuEJqsT7KAQLQAiwJ5JB3Bs2LuaUu
 fwMyx+UZDK9qEKeSy79Wn8TtvZwhGq+MCbf5Z8DDXbq9ZGxevmF61ojcczZyTZ7THqu0HVmW/ym
 foBn/RdltlE8a06Zgll51dSH9AL2yF+AIBvpVWQ8kBe+g4LIDF6cxIGnwzNYKLbSunaibf041wF
 WhGDJrMZWTMxdUZA=
X-Google-Smtp-Source: AGHT+IFoDPTK4Q0eWnPXUkfNUbOrNzlhA0H+lOPBGXmkTH9+PzSVedd+3ibhuJVjuyt6k3UdF8swoA==
X-Received: by 2002:a7b:ca4d:0:b0:43b:c592:7e16 with SMTP id
 5b1f17b1804b1-440696f77a1mr4071195e9.3.1744904939943; 
 Thu, 17 Apr 2025 08:48:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96e912sm20949934f8f.31.2025.04.17.08.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:48:59 -0700 (PDT)
Message-ID: <693a5c6a-88b3-4f52-b918-ef78ff174c1f@linaro.org>
Date: Thu, 17 Apr 2025 17:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/7] drm/bridge: analogix_dp: ignore return values of
 drm_panel_* calls
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
 <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
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
> Follow the example of other drivers and ignore return values of the
> drm_panel_prepare() / unprepare() / enable() / disable() calls. There is
> no possible error recovery, so the driver just logs a message.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 39 ++++------------------
>   1 file changed, 6 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f60068011008482f7b7b2edfcab5fb1b3e9e130f..c7dffdae31877ae194fc6b0a5bf21be203f7dcc4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -838,10 +838,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	int ret;
>   
>   	/* Keep the panel disabled while we configure video */
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel))
> -			DRM_ERROR("failed to disable the panel\n");
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	ret = analogix_dp_train_link(dp);
>   	if (ret) {
> @@ -863,13 +860,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	}
>   
>   	/* Safe to enable the panel now */
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_enable(dp->plat_data->panel);
> -		if (ret) {
> -			DRM_ERROR("failed to enable the panel\n");
> -			return ret;
> -		}
> -	}
> +	drm_panel_enable(dp->plat_data->panel);
>   
>   	/* Check whether panel supports fast training */
>   	ret = analogix_dp_fast_link_train_detection(dp);
> @@ -1136,7 +1127,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	struct analogix_dp_device *dp = bridge->driver_private;
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
> -	int ret;
>   
>   	crtc = analogix_dp_get_new_crtc(dp, old_state);
>   	if (!crtc)
> @@ -1147,11 +1137,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_prepare(dp->plat_data->panel);
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1231,17 +1217,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   {
>   	struct analogix_dp_device *dp = bridge->driver_private;
> -	int ret;
>   
>   	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel)) {
> -			DRM_ERROR("failed to disable the panel\n");
> -			return;
> -		}
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	disable_irq(dp->irq);
>   
> @@ -1249,11 +1229,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> @@ -1678,10 +1654,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>   	analogix_dp_bridge_disable(dp->bridge);
>   	dp->connector.funcs->destroy(&dp->connector);
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_unprepare(dp->plat_data->panel))
> -			DRM_ERROR("failed to turnoff the panel\n");
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	drm_dp_aux_unregister(&dp->aux);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
