Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3807FB404
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FE310E44C;
	Tue, 28 Nov 2023 08:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347410E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:24:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bbd9cf923so220162e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701159869; x=1701764669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zjZBEQ9AyQtIh3obfbE4Kjaq3VrAc19BWN06fxuJK0Y=;
 b=X87AlN7/nQP238fClXSsMfQxQvVQie6yI0pdfB+1GKCFB4fBkrkHKIPm2K396PQVET
 w35D54sKU8CLYGRwHooh5OccTWFH9heN6YCGTvIYpRTTHqDuuvQ+nRPqxMKMmio6AbYf
 a53jb1Q28xgXx2o4Xf/AV6iMTzKjKogsQ+z0ki5W3GphLvZJpXLwc/CHq2hWK5YXw4+8
 P17lCFMwqp7qypLCSgKLfxlfA/Khzy68mcHq2DjpAdBlnY6rHVYzEHJJ3in7zsI3wWKa
 RMPAneajf1994kX3UY4QemVbB1Md8LlPRECbNsABuaRAKcyIztYObUIa69gE/kpsT2G7
 oe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701159869; x=1701764669;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zjZBEQ9AyQtIh3obfbE4Kjaq3VrAc19BWN06fxuJK0Y=;
 b=a/8hbrldWeIQWNsXxsMxBX6AASLkIRHo/9EHzQn7X8NhNP9pTbpZQ0m76Rajgec+wf
 JcQYuuNbonSh+M9yayxhswHo1ugIxWcc4KVqxEtvTSFp0J4MK4kWD65w13gPL6er1gdw
 FhziSYe1H2yMP/rnCUAAQnhUDRNiuI4tbHjTWIip4I6xW6OCUbWpSLC4qViw+5x4mveq
 fjauY48j50qs/8YJOSQbYmJALr4/rj1UR7M4aSdhCNDF1Cq/q59En8v9uW51tktv7Tb8
 n506KAMCcyeDu3Rz7Ohe72949QITFj4TFah2RDZ8F3D540ptpajeI0oKqYxl+I/plqEb
 GV6w==
X-Gm-Message-State: AOJu0YyYA6MgI4ucSZ3kY6T2UVWIYOLYV+gLVrlROfxQp1U3sR3sgm+7
 84OiL12RRpAWDwrshDtxiQo7AA==
X-Google-Smtp-Source: AGHT+IH8Z4mDZsxySIBMwyAcd7FKhE4ahDXn1VO+snYpIIrZ5VNift1glxxYRZIyrMA/ipnuRL0SOg==
X-Received: by 2002:a05:6512:1386:b0:507:a9b7:f071 with SMTP id
 fc6-20020a056512138600b00507a9b7f071mr13170044lfb.1.1701159869318; 
 Tue, 28 Nov 2023 00:24:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00405959469afsm16730777wms.3.2023.11.28.00.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 00:24:28 -0800 (PST)
Message-ID: <63412979-d7fa-4147-8c38-f576503a3173@linaro.org>
Date: Tue, 28 Nov 2023 09:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] Revert "drm/bridge: panel: Check device dependency
 before managing device link"
Content-Language: en-US, fr
To: Linus Walleij <linus.walleij@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231128-revert-panel-fix-v1-2-69bb05048dae@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231128-revert-panel-fix-v1-2-69bb05048dae@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2023 00:10, Linus Walleij wrote:
> This reverts commit 39d5b6a64ace77d0c11c398d272218df5f939abb.
> 
> This patch was causing build errors by using an unexported
> function from the device core, which Greg questions the
> saneness in exporting.
> 
> Link: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpu/drm/bridge/panel.c | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 5e8980023407..e48823a4f1ed 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -23,7 +23,6 @@ struct panel_bridge {
>   	struct drm_panel *panel;
>   	struct device_link *link;
>   	u32 connector_type;
> -	bool is_independent;
>   };
>   
>   static inline struct panel_bridge *
> @@ -68,17 +67,12 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   	struct drm_device *drm_dev = bridge->dev;
>   	int ret;
>   
> -	panel_bridge->is_independent = !device_is_dependent(drm_dev->dev,
> -							    panel->dev);
> -
> -	if (panel_bridge->is_independent) {
> -		panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> -						     DL_FLAG_STATELESS);
> -		if (!panel_bridge->link) {
> -			DRM_ERROR("Failed to add device link between %s and %s\n",
> -				  dev_name(drm_dev->dev), dev_name(panel->dev));
> -			return -EINVAL;
> -		}
> +	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> +					     DL_FLAG_STATELESS);
> +	if (!panel_bridge->link) {
> +		DRM_ERROR("Failed to add device link between %s and %s\n",
> +			  dev_name(drm_dev->dev), dev_name(panel->dev));
> +		return -EINVAL;
>   	}
>   
>   	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> @@ -86,8 +80,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   
>   	if (!bridge->encoder) {
>   		DRM_ERROR("Missing encoder\n");
> -		if (panel_bridge->is_independent)
> -			device_link_del(panel_bridge->link);
> +		device_link_del(panel_bridge->link);
>   		return -ENODEV;
>   	}
>   
> @@ -99,8 +92,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   				 panel_bridge->connector_type);
>   	if (ret) {
>   		DRM_ERROR("Failed to initialize connector\n");
> -		if (panel_bridge->is_independent)
> -			device_link_del(panel_bridge->link);
> +		device_link_del(panel_bridge->link);
>   		return ret;
>   	}
>   
> @@ -123,8 +115,7 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   	struct drm_connector *connector = &panel_bridge->connector;
>   
> -	if (panel_bridge->is_independent)
> -		device_link_del(panel_bridge->link);
> +	device_link_del(panel_bridge->link);
>   
>   	/*
>   	 * Cleanup the connector if we know it was initialized.
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
