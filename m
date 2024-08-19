Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995F956EFA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2857F10E2DA;
	Mon, 19 Aug 2024 15:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h/W9GtUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9410E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:39:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so34692745e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724081998; x=1724686798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3rechxrZ4ECg78B8N/AWjNVRR9kwlJo6/ZF0ZSeiXCI=;
 b=h/W9GtUdHY34i3F4OuFIYVZsSFbYkwo6XK0KHZqfG7UWpLnRFyAB2kReUGSa7C5ppj
 pGKAVPeVAOC7oEGerPXRMuuGFY2CLvMj+qyejKwm5c15bJISoIexGqwciQtchMeqNKc1
 hF/6GSBb7C1sR0obWTitYI7VJuYS6Lpi5GXgm5xtZ3HTsffIy/nCrSKn3tSd3M3eE420
 mdOcn2PmkTjh+0OtrFOaJHJQoQD85H/+St02T2atwvWFoURiqISiEKdFeK8xQZjT882y
 SjvOuXjMc1h7lbVeY9G1Nv2yTvFkyX9tqDawHMiU8AtTzU5VF1ku1ereh/YR0LaxBhDP
 v9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724081998; x=1724686798;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3rechxrZ4ECg78B8N/AWjNVRR9kwlJo6/ZF0ZSeiXCI=;
 b=BHKvGTPaivnYSyLXSkuZaYsYyZBngqzIG4cI+g0tfJlJegUPttQeh0y/ccsAWH62J5
 aoQxyqNYJtC/kWV1OzJHL+aDOeyuJ0a48WvJjnYx8pMjPSswR1SWZ6IRp8MhNO6lDBHg
 BH4dmYNyXZsusaiXS4u4SVSVI6yplhMB4xlBI7MqB9qNKaJlJSK9rQcQ/J88fzsCdbVx
 C4VYvjzMjdCcoHGDtI1fFoTOftRLBBGhZpYzq9fMkxjrymxdj9J7YAsF0I6VFiUPq8VT
 R0KjE0JcNaA8z37rVzVVP7/yhwAc+AI7xgMGvpZPAonPp/utqb+KY8JpzznC+A+PDcsG
 7MuQ==
X-Gm-Message-State: AOJu0Yyn6MDG3ZyymmbcmGFL9bsdwEvakO2j1unJXHsPRhWh1IZlRLos
 /D2pRp3vhaFxp6nPhWf3Pk6DrtRpqb6nKvXgQdYLLQV6o4t+kfUElghc99jbngU=
X-Google-Smtp-Source: AGHT+IFdNtB2gh2+pj56HbqxXEPIg4Q+OrcMm18X+wmX4ogzgdWrG21Q+a8ippK4LwI/fSVGof4x9Q==
X-Received: by 2002:a05:600c:1d05:b0:426:6e95:78d6 with SMTP id
 5b1f17b1804b1-429ed785cdemr71297355e9.4.1724081997568; 
 Mon, 19 Aug 2024 08:39:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded2931asm164664175e9.17.2024.08.19.08.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:39:57 -0700 (PDT)
Message-ID: <7369663f-b2e6-404f-8b1c-f4d6628f3e1c@linaro.org>
Date: Mon, 19 Aug 2024 17:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 31/86] drm/panel/ili9341: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-32-tzimmermann@suse.de>
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
In-Reply-To: <20240816125408.310253-32-tzimmermann@suse.de>
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

On 16/08/2024 14:22, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 775d5d5e828c..0ef9f7b59ccb 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -31,6 +31,7 @@
>   #include <video/mipi_display.h>
>   
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_dma.h>
>   #include <drm/drm_gem_atomic_helper.h>
> @@ -591,6 +592,7 @@ static struct drm_driver ili9341_dbi_driver = {
>   	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>   	.fops			= &ili9341_dbi_fops,
>   	DRM_GEM_DMA_DRIVER_OPS_VMAP,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>   	.debugfs_init		= mipi_dbi_debugfs_init,
>   	.name			= "ili9341",
>   	.desc			= "Ilitek ILI9341",
> @@ -651,7 +653,7 @@ static int ili9341_dbi_probe(struct spi_device *spi, struct gpio_desc *dc,
>   
>   	spi_set_drvdata(spi, drm);
>   
> -	drm_fbdev_dma_setup(drm, 0);
> +	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   }

So which one is right, this one or :
https://lore.kernel.org/all/20240813091258.1625646-1-andriy.shevchenko@linux.intel.com/
?

Neil
