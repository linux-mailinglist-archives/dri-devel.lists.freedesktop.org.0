Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF20A921E5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997B610EB59;
	Thu, 17 Apr 2025 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dhaBSLkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCB110EB58
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:46:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39c14016868so963613f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904798; x=1745509598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=k9aaMCuzqkcLFnGt1mdv/nspPtYR2d3K7Y5FHZPd5iE=;
 b=dhaBSLkc8FIAx5VdkqEkYJZfmbJRDRzNWf0Z1jQgY1FuXtV0+3fT+Xtv5K6iytsbvf
 AoY39Eavv/NgxK2zflsKcVwe/pO3GVabdsyOy9CMgP/cAF1JEX6O9lsX42afTUMrBjZ0
 Dwz3AQVfyVXob8/BQFP1CpnT/0WGZ+4DvXEGx9xp8o5V6eseWtTxYbr9y0CEw1NqYn/9
 4GJenW3XZg/cqeyBYo/musRDjnvT17THCD++Pb9JMi/pTjIJm4WOuhuK6rY/U1IjSAA6
 7iGnCUzSUk6SI3LwdyvGR8rP0ysD9ksRsCVklVlJoXUljYO8QeQNwNTyNWPOePhxuBRD
 PUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904798; x=1745509598;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k9aaMCuzqkcLFnGt1mdv/nspPtYR2d3K7Y5FHZPd5iE=;
 b=nr6pUUiav6wge6cbIvF2vnpNRl4RQiZBVT6ksWliora27EcyyY2fazgk+t3G9FQjto
 Dg1vRpqREmeWELAyFZrH8N/gLesmxjjsrsJyuayCI41dyZmWlkD8OI5whaCaWaCSiGqk
 xaKPAgi1aWZc+PCzksvHbyDTPXgBPCld60NmhZYB+LcCrmCLvw1xHy/z6D5rl5kOA1vI
 W3NIYxcww34v/lum3iGnulRIS/WWhTorYMa2UCQGACURRC5UboTkycGPYQFbH8OmgGHQ
 oCiiBKk/V7XLL1ugg5a0zb1UszCIVPOXrEghRcnzYdqOHDMYihQPuPvKyUv3vhorv4BO
 1g2A==
X-Gm-Message-State: AOJu0YyPm4dsOMLXryDkzOfjOUDQW2rSpmQIA2ICCBBjksXX/7KSfn9t
 M0C4NEOGM3+1niSpD/B3IF/6Tb1ehOifBSMugaoAN04jM0n5m8WSc51sBdxalDsBJ0dZCVoVxwg
 e
X-Gm-Gg: ASbGnctDhFw6vF9QpQ3By94Mwn5oh+OMoe8iR+HymADMiT1M0FdDb9qoGo5RHp9ysd1
 DkK1Xry+LxBhl7aoLpAyVFyiuZE6T6GBfn/XBkB/U4WHTnUzqo6OptZaVzbD+vxaL85AlryqMHY
 hALQkq5Y51hluZIxddlYD5W37zCRYcOFoKaZF+qV46S6x/u5GQl6ZS2aso/Boipk4sbFFyBNCqh
 3ZBOTB/bLsfexuj5VW1os3E+01Lp/wJlHLVoeOuTNC6liYJzKsX55p42C4tTsA5ZhwPTmZ+HXxR
 pSvTe3n9b8et160UQSnY6iAgq4UUbUZqs7tpPqWOnPanJnDGQ29qmuxnz9RWrtScBwi1Uc5g8Fu
 SLiWdrUpBC90+UM8=
X-Google-Smtp-Source: AGHT+IGgXij9vrKLTY0luZtINa4N/TV4YimxUEXPo+0Kea36LPVR8W8Ln1lPTHq41iF4KCTK5tf2zw==
X-Received: by 2002:a5d:64ab:0:b0:38f:30a3:51fe with SMTP id
 ffacd0b85a97d-39ee5b9d97dmr5526601f8f.42.1744904797932; 
 Thu, 17 Apr 2025 08:46:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ee3f12dc9sm5426249f8f.8.2025.04.17.08.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:46:37 -0700 (PDT)
Message-ID: <729958d5-6daf-4056-95ae-c6b685e120f3@linaro.org>
Date: Thu, 17 Apr 2025 17:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/7] drm/bridge: analogix_dp: drop unused argument to
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
 <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
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
> After previous cleanup all calling sites pass true as is_modeset_prepare
> argument to analogix_dp_prepare_panel(). Drop dead code depending on
> that argument being false.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index ab1cfc340aa95bbf13fe021bd33227b565a5458d..82dc4b01806f9728dc882b0128171838e81f21b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -963,13 +963,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * If @prepare is true, this function will prepare the panel. Conversely, if it
>    * is false, the panel will be unprepared.
>    *
> - * If @is_modeset_prepare is true, the function will disregard the current state
> + * The function will disregard the current state
>    * of the panel and either prepare/unprepare the panel based on @prepare. Once
>    * it finishes, it will update dp->panel_is_modeset to reflect the current state
>    * of the panel.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare, bool is_modeset_prepare)
> +				     bool prepare)
>   {
>   	int ret = 0;
>   
> @@ -978,13 +978,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   
>   	mutex_lock(&dp->panel_lock);
>   
> -	/*
> -	 * Exit early if this is a temporary prepare/unprepare and we're already
> -	 * modeset (since we neither want to prepare twice or unprepare early).
> -	 */
> -	if (dp->panel_is_modeset && !is_modeset_prepare)
> -		goto out;
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
> @@ -993,8 +986,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (ret)
>   		goto out;
>   
> -	if (is_modeset_prepare)
> -		dp->panel_is_modeset = prepare;
> +	dp->panel_is_modeset = prepare;
>   
>   out:
>   	mutex_unlock(&dp->panel_lock);
> @@ -1072,7 +1064,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	enum drm_connector_status status = connector_status_disconnected;
> -	int ret;
>   
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
> @@ -1194,7 +1185,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, true);
> +	ret = analogix_dp_prepare_panel(dp, true);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   }
> @@ -1294,7 +1285,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false, true);
> +	ret = analogix_dp_prepare_panel(dp, false);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
