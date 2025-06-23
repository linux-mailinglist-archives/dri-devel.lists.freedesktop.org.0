Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B0AE404D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C0410E39D;
	Mon, 23 Jun 2025 12:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ea4C2eHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B7010E39D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 12:31:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so39739255e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750681911; x=1751286711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5BsUESEJVffI4oZaO5RphZPRSePWRjkMtfmD/4yLa1A=;
 b=ea4C2eHxK6E/I+QNkCqLkreFzCWPfcNfEc/op+fVimQUCp2ghx2xAPscydzsqNp2OF
 1g6MgPkG2WR8J7WhxjXYq2Ybz71pFYPvx5a3WjWIpJl0rWye3KxnkUxnaSrnUPy9BD4b
 emOS+2aFQFm4fsoevSoSMcGPGGWZfoOJEZp/W02HpVs2PLcUFp73l7cWK/lNsh9TBMqL
 XoVsQ6gscCYq7cZLdoxa2rcukuL+jAGGzyMbY4+d+sD5jjrkaO4DtrMsldYz/rKHPxJr
 vIVVLMnffqXYZRqWZOqug+3ctkOLBYbKybuPnyrxyKUoQLTLbqMeh9amkA9yccbv1zWm
 1aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750681911; x=1751286711;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5BsUESEJVffI4oZaO5RphZPRSePWRjkMtfmD/4yLa1A=;
 b=bjZoV+rPgx1OioqA0H48Rs3lrRwFPS5XH9EsCbklTbAUFXoq5ZeOMpXra0P898uGzf
 d1bON859czO7FxwToCHyOx/RmobBMO59Gr4c9qUKU/8syyJ1SZw1q7Ci0rufOWUETBhw
 tm40DAXfPrpm5RWV4gVGA7kK2JGPzHPPBMryiIrFkKLhMrb9UaWH3TCLqLBGjd+iWriO
 dcsIkz8VlrCEvaKcUYAnb+h6PaB1SmV0pIS1sjLo1anF+tsxSEFFgavTMMq5AdIJL2SS
 eywKY8nB6P+9yOAjIWJkv1fgk4wDVfox8ZDHjACzgtI7Pw/FilMaMiaUryB5vk+iOdc/
 3QSA==
X-Gm-Message-State: AOJu0YxJtQUiALSkSDd1b5YgInbqgmqipsTkKJcnQBz/M7VrLm7Jj7yA
 c+YwNWpHT9NKcdWh9Hnf6A8NYDbMdopdLwBokcz/ebgtbeMnzJscmiPmjJrvcjRQx9U=
X-Gm-Gg: ASbGncunSpRndWvrbMdQTj21TogFJUJ1RLBfMOsgLH3zSPvHS/7NTWc6l7saxAqe8fN
 T1TCzLRSBbe1kV0Hraj2TteH4Rl1EHo/ctQrW/DoSryzGoLEZkM8gRmtQJRihRwQiu/64v7xeX/
 lvmmRikdioswkRCIePMoL6XRB5UL5XchdiprfoJn5AXKGjhuPPMHnNpLLU+KC84QKljy1OGwxqq
 J8JWUlTuLSeZ15OL51Uyjp8b2K3MPI2Ur6wgsVq4k2GH58tr/5tgaNvTAXgT72Sr5ADepuhtKne
 qIP4YwyZfIAupl5n/Bt8v7656M1N9Pqi6U4D2zR9UkVzoAU3RIKJ1QaKAZWX8HCit4cffKMBTmI
 VP7ffov5RyLUrhPVwI7cwVyoCw9/SPJXC5yaQDWI=
X-Google-Smtp-Source: AGHT+IHaPhLV7BB64wJ54i+PRTDFMAI1xBSKbX9CFXttTtVDg0OzsIpGIzpsgLpaaXop+qHd9i2Kdw==
X-Received: by 2002:a05:6000:2902:b0:3a4:d367:c591 with SMTP id
 ffacd0b85a97d-3a6d128a58fmr9608741f8f.10.1750681910714; 
 Mon, 23 Jun 2025 05:31:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d?
 ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d0f19e7dsm9599607f8f.38.2025.06.23.05.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 05:31:50 -0700 (PDT)
Message-ID: <6070afbd-39f8-4f60-9230-794889e7012e@linaro.org>
Date: Mon, 23 Jun 2025 14:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: panel: move prepare_prev_first handling to
 drm_panel_bridge_add_typed
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>
References: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
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
In-Reply-To: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2025 16:07, Dmitry Baryshkov wrote:
> The commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") and commit 0974687a19c3 ("drm/bridge: panel: Set
> pre_enable_prev_first from drmm_panel_bridge_add") added handling of
> panel's prepare_prev_first to devm_panel_bridge_add() and
> drmm_panel_bridge_add(). However if the driver calls
> drm_panel_bridge_add_typed() directly, then the flag won't be handled
> and thus the drm_bridge.pre_enable_prev_first will not be set.
> 
> Move prepare_prev_first handling to the drm_panel_bridge_add_typed() so
> that there is no way to miss the flag.
> 
> Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> Fixes: 0974687a19c3 ("drm/bridge: panel: Set pre_enable_prev_first from drmm_panel_bridge_add")
> Reported-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/CAPVz0n3YZass3Bns1m0XrFxtAC0DKbEPiW6vXimQx97G243sXw@mail.gmail.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/panel.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index c57036b06493a6922e2cae38bcd1733930ff0073..ed23de0478312a26a5d3434e63bd2fe4a6099bfc 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -302,6 +302,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>   	panel_bridge->bridge.of_node = panel->dev->of_node;
>   	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
>   	panel_bridge->bridge.type = connector_type;
> +	panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
>   
>   	drm_bridge_add(&panel_bridge->bridge);
>   
> @@ -416,8 +417,6 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>   		return bridge;
>   	}
>   
> -	bridge->pre_enable_prev_first = panel->prepare_prev_first;
> -
>   	*ptr = bridge;
>   	devres_add(dev, ptr);
>   
> @@ -459,8 +458,6 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	bridge->pre_enable_prev_first = panel->prepare_prev_first;
> -
>   	return bridge;
>   }
>   EXPORT_SYMBOL(drmm_panel_bridge_add);
> 
> ---
> base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
> change-id: 20250220-panel_prev_first-fc90c6c8aefa
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
