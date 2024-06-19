Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C381390E51D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 10:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582C289135;
	Wed, 19 Jun 2024 08:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rVe14oCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA3610E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:01:57 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso73970881fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718784115; x=1719388915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6Yqn8K/zypaGyXawqc24D9TIlfhyiSRlL91zpW8lwkw=;
 b=rVe14oCGMEOM0Xmt1vZtsvzS6fMbUB/3aLFJDGP7qLYSNix+M2czNWn0R5UUh+sA5Q
 UDntGKAyHfFNG8qSSriE6B4btLe8KADWTo3jLLHfpOFqhwcF5DASqbxqnir2MPezXieF
 HD87aafNG6JaoJLC0thX6lgIx/o/Kdzz9z2TCQKY8QYBjyq2VlVHjuwArM0MBSRsCRz4
 U8MAWX0LPC17xm1T6O9WJCxceCSic4FVbO9vlfgBzmmCBkcE0LUmfqkA6+LvojTxgtJM
 Fiy8iFXM0g6rv4IeCo6AcWx0dwLTYVyl9p7a2YIE1iSRHGvVTUQr1z71mfZB4j2p+0jj
 1KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718784115; x=1719388915;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6Yqn8K/zypaGyXawqc24D9TIlfhyiSRlL91zpW8lwkw=;
 b=onrV0x1c7Sx+IHx9lT7UILFJHnU/usANNlDcVmaKzVCfn7fjv0r+LDjIgZDIhjkCUp
 GBUv3xfZrw6NVPY6Q+v6Wlq22g52WitqbxaUSPO4B82F+U5VAMjayppsV5mtb9Y1c/Mb
 4TJ+q4/KBSodYWoPnNqQjED2rJQQfF5TfFPHyqsVHC3d2LANrcI0iwwDSEsTeZY/DN3V
 9DB9Lgv5Urn1Dy85Ybh5TnFBOg8MVoTsdxtlIkxPFzdHYLAX+vLU61v2Yg/4xcXLmvC1
 4d5DnIiIZz1pGDFZb4l50LzZ9mNGQes9kFY96FAQFrZ1Xh5ukpkVPWbJbEgH5cdlFMcU
 uwHA==
X-Gm-Message-State: AOJu0YyWLiHaXo9tovJwaqdgfh4eiwdSAsZF9g985goJZVoDYEla53Uy
 Wclkahevlc1uDaKHvymh8/4gEGBgz5+qFpBnz8n5tSw22qOBO1HSlA7AWsmI528=
X-Google-Smtp-Source: AGHT+IFFNNNi5UfQezqyqK8CcyEjQ0wpXDaAt6x6NYnXtJ8xso0UXGOm3DxXOtSQWPDE2o48J3QQGQ==
X-Received: by 2002:a2e:7806:0:b0:2ec:3f79:dcd1 with SMTP id
 38308e7fff4ca-2ec3f79e403mr7037341fa.36.1718784115216; 
 Wed, 19 Jun 2024 01:01:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa?
 ([2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-363d99f75besm420588f8f.61.2024.06.19.01.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 01:01:54 -0700 (PDT)
Message-ID: <23a709f5-5435-475b-b63f-18dab9be6555@linaro.org>
Date: Wed, 19 Jun 2024 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: simple-bridge: use devm_drm_bridge_add in
 probe
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
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
In-Reply-To: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
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

On 18/06/2024 18:19, Marc Gonzalez wrote:
> simple_bridge_probe() calls drm_bridge_add()
> Thus, drm_bridge_remove() must be called in the remove() callback.
> 
> If we call devm_drm_bridge_add() instead, then drm_bridge_remove()
> will be called automatically at device release, and the remove()
> callback is no longer required.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> This patch was proposed in an abandoned patch series,
> but it makes sense by itself. Submit now.
> https://lore.kernel.org/r/20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr
> ---
>   drivers/gpu/drm/bridge/simple-bridge.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 5813a2c4fc5ee..dbe58f5707f08 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -175,7 +175,6 @@ static int simple_bridge_probe(struct platform_device *pdev)
>   	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
>   	if (!sbridge)
>   		return -ENOMEM;
> -	platform_set_drvdata(pdev, sbridge);
>   
>   	sbridge->info = of_device_get_match_data(&pdev->dev);
>   
> @@ -213,16 +212,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
>   	sbridge->bridge.of_node = pdev->dev.of_node;
>   	sbridge->bridge.timings = sbridge->info->timings;
>   
> -	drm_bridge_add(&sbridge->bridge);
> -
> -	return 0;
> -}
> -
> -static void simple_bridge_remove(struct platform_device *pdev)
> -{
> -	struct simple_bridge *sbridge = platform_get_drvdata(pdev);
> -
> -	drm_bridge_remove(&sbridge->bridge);
> +	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
>   }
>   
>   /*
> @@ -299,7 +289,6 @@ MODULE_DEVICE_TABLE(of, simple_bridge_match);
>   
>   static struct platform_driver simple_bridge_driver = {
>   	.probe	= simple_bridge_probe,
> -	.remove_new = simple_bridge_remove,
>   	.driver		= {
>   		.name		= "simple-bridge",
>   		.of_match_table	= simple_bridge_match,
> 
> ---
> base-commit: 17b591a4a192a8a11faad30520b8f6a9137ac514
> change-id: 20240618-devm-simple-bridge-9e163fece192
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
