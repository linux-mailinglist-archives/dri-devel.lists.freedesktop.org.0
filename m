Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F57FB406
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAAE10E446;
	Tue, 28 Nov 2023 08:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF87410E446
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:25:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50aab20e828so7344309e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 00:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701159899; x=1701764699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=O+YNpAXoY7RqHSKth6Tad17PREnvnHxofFJD9tpmWJw=;
 b=YtgzeG9rzbTS6YRqO7oFDsmxYXg1i+pQ6OuQkVCseNILnIBQi73s4Q6dfmawBSifwr
 rpufiC/R+JmkRVx1FVAfgvwp4nxzQtagTKwP0MOF4v0bLeAfAEnL2EiY6WafgvDt5G+A
 S+VTzhAdVsZR7FC32RQgWCmzBFYbTX6xImZFdm7bnYSoJCvAf7kBcoVbWECRXF1rU0ge
 Pp2fK73fyTFSHT0HYEUqI4Plw++Z5PTP6THYT3eYnzN1q5tDadZEyXCwxzZ+5xFMDedV
 TRkwEncNzui/dLh4SQOnoVFNKxzpkFwsmA6RxBWZfGnNT/jamf2+ER3WDGt4p7xjvyrE
 7HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701159899; x=1701764699;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O+YNpAXoY7RqHSKth6Tad17PREnvnHxofFJD9tpmWJw=;
 b=TKuj5qXsQRLBEJOKvaKnc1UtCPWWiFm9Fa1UJP484CHN2Od35az7vCqZfmJ19Fiv0B
 WlXtFv+4vQ9ARYZUYh4YwkZxTrClV/+hwhddOIjVfa6BZS6tTX1Z1e0fhreyxJ7oFcSO
 SsTLxJ28MlwaRTFYYzznZ1O3IOR9ekCr9kV409h+FOEZ1z7n+VbWJx6EYYwwpygvIO47
 CJGJ+EEx0eOkX3UouDd+DNFeZCQf3cQr/WZH5b1SzHWmxmP8UyjsOSMJ/p0iSN3YlpC0
 AiZru827OfU5CFO4BQNpoKFKI7/Phl95SOZrvI8fJtxTDpSPlvmq2dQ+l99xRYlbeoSg
 9Zbw==
X-Gm-Message-State: AOJu0YzuK5hhoRYDPmLtwM1hMdvyqsXQ4OsRuLh9wI8ubX3kgCGpp+L2
 Nui+LGlE+xr9chkuPiu7ChDMvw==
X-Google-Smtp-Source: AGHT+IGWGSTt3dq8UTk2cpUK7hzx6ClBhDFDv7AqYfQMFKdIqWRv/ImXRDqXQpLtgIQPEja2URI3vw==
X-Received: by 2002:ac2:58f8:0:b0:4fa:f96c:745f with SMTP id
 v24-20020ac258f8000000b004faf96c745fmr8254471lfo.38.1701159899088; 
 Tue, 28 Nov 2023 00:24:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00405959469afsm16730777wms.3.2023.11.28.00.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 00:24:58 -0800 (PST)
Message-ID: <6e235fe1-d2ab-4a57-9f31-f16c22de5093@linaro.org>
Date: Tue, 28 Nov 2023 09:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] Revert "drm/bridge: panel: Add a device link between
 drm device and panel device"
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
 <20231128-revert-panel-fix-v1-3-69bb05048dae@linaro.org>
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
In-Reply-To: <20231128-revert-panel-fix-v1-3-69bb05048dae@linaro.org>
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
> This reverts commit 199cf07ebd2b0d41185ac79b895547d45610b681.
> 
> This patch creates bugs on devices where the DRM device is
> the ancestor of the panel devices.
> 
> Attempts to fix this have failed because it leads to using
> device core functionality which is questionable.
> 
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpu/drm/bridge/panel.c | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index e48823a4f1ed..7f41525f7a6e 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,8 +4,6 @@
>    * Copyright (C) 2017 Broadcom
>    */
>   
> -#include <linux/device.h>
> -
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_connector.h>
> @@ -21,7 +19,6 @@ struct panel_bridge {
>   	struct drm_bridge bridge;
>   	struct drm_connector connector;
>   	struct drm_panel *panel;
> -	struct device_link *link;
>   	u32 connector_type;
>   };
>   
> @@ -63,24 +60,13 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   {
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   	struct drm_connector *connector = &panel_bridge->connector;
> -	struct drm_panel *panel = panel_bridge->panel;
> -	struct drm_device *drm_dev = bridge->dev;
>   	int ret;
>   
> -	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> -					     DL_FLAG_STATELESS);
> -	if (!panel_bridge->link) {
> -		DRM_ERROR("Failed to add device link between %s and %s\n",
> -			  dev_name(drm_dev->dev), dev_name(panel->dev));
> -		return -EINVAL;
> -	}
> -
>   	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>   		return 0;
>   
>   	if (!bridge->encoder) {
>   		DRM_ERROR("Missing encoder\n");
> -		device_link_del(panel_bridge->link);
>   		return -ENODEV;
>   	}
>   
> @@ -92,7 +78,6 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>   				 panel_bridge->connector_type);
>   	if (ret) {
>   		DRM_ERROR("Failed to initialize connector\n");
> -		device_link_del(panel_bridge->link);
>   		return ret;
>   	}
>   
> @@ -115,8 +100,6 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>   	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>   	struct drm_connector *connector = &panel_bridge->connector;
>   
> -	device_link_del(panel_bridge->link);
> -
>   	/*
>   	 * Cleanup the connector if we know it was initialized.
>   	 *
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
