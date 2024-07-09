Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194592B32B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE2010E4C4;
	Tue,  9 Jul 2024 09:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q8tidO8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9310E4BD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:06:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso34764795e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720515971; x=1721120771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ogVyAEL2M7qNO4z7J1sOc6hAQrvMRSpw0p21RysLKwM=;
 b=q8tidO8fomIdqZbhBO2wPwqCAQf6UH7ES2H/PBj1HO7lUyNmCjofFnmsdTxXMf0yGL
 FGmscbXIJMfT+G1qfikF4obX0kzo0XcGRe5UDb+oP5wRvIMxOd8G3Ysr1/6vOQhSmTdb
 cErHsezu/OKGDBxB2Q35Dz3dddQdWAzjtvzpfAkhMPlPi0SmoxZ4AchlZDkhLnbcxeuW
 UvNWDUG0i+iQ0Oi5r9yDM/uzbv8onR5IRzOrzH9wpRfdjiyGMDt6FbLyceXjOs3GSQcm
 s3Uy7mOizMZU4p0ZIdotbY0Y4up1V3KdhFgSQdIGiNtdIc0hem771w+3Q5V8eWDnB/oM
 si9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720515971; x=1721120771;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ogVyAEL2M7qNO4z7J1sOc6hAQrvMRSpw0p21RysLKwM=;
 b=lTxFD7alfhWXHIcmir9vpVKL1/QHF0NvZ1oFLnmxR0K5YbB9eXCwaRs/pwWRV6z7CO
 75FihGIL4uCdS2NCG7U8eSw9UC0zpeoCQy4sIvA0WGbxAdSsliTjm3b9BeiyrPkLR0ul
 vg87mA9MDFH8NtHHTJLOipT7OhuigYQiMZ5NSuTqPot6W086CHFPVCSFnfC9ir+BdHlB
 K/tXl7IjBNg5BxROjXpj3EPB7xG0re3xzdYaoPYat8TWnZxXPa42lgkUO+qGu48KsvTz
 Z+Mjo1nSJgzX3ZSXtMbY/1+5+8zMQt15vf6I/2HVjG6yfnkVHijhhu++bB+7D8FhOaUe
 QQUA==
X-Gm-Message-State: AOJu0Ywphdt+mTmFD5ddzhA+scYC0nKmifJCDIeUQVHt7vG7e4CwUTgr
 0DOHceZxOTWXO8u+JSleZcKM3MM2ORWAaZ1IHxH8PUnjRljWw5u368++u9cK/I4=
X-Google-Smtp-Source: AGHT+IELZi7jgatav2Id3lIgfAyc3Rzsc/KAgDHVke/qVTBlLbN2DDJ60OTJQsnSr7D68SFLsEWQlg==
X-Received: by 2002:a05:600c:2e04:b0:426:59ad:bbb3 with SMTP id
 5b1f17b1804b1-426708f1f54mr11303105e9.32.1720515970731; 
 Tue, 09 Jul 2024 02:06:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe?
 ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa079asm1926309f8f.68.2024.07.09.02.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:06:10 -0700 (PDT)
Message-ID: <15016b7c-f333-4a38-8780-79bbc9ed1b0f@linaro.org>
Date: Tue, 9 Jul 2024 11:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix canvas release in bind function
To: Yao Zi <ziyao@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Jourdan <mjourdan@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240703155826.10385-2-ziyao@disroot.org>
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
In-Reply-To: <20240703155826.10385-2-ziyao@disroot.org>
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

On 03/07/2024 17:58, Yao Zi wrote:
> Allocated canvases may not be released on the error exit path of
> meson_drv_bind_master(), leading to resource leaking. Rewrite exit path
> to release canvases on error.
> 
> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 37 +++++++++++++++----------------
>   1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 17a5cca007e2..4bd0baa2a4f5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -250,29 +250,20 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (ret)
>   		goto free_drm;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_0);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_osd1;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_1);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_vd1_0;
>   	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_vd1_2);
> -	if (ret) {
> -		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> -		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
> -		goto free_drm;
> -	}
> +	if (ret)
> +		goto free_canvas_vd1_1;
>   
>   	priv->vsync_irq = platform_get_irq(pdev, 0);
>   
>   	ret = drm_vblank_init(drm, 1);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   
>   	/* Assign limits per soc revision/package */
>   	for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
> @@ -288,11 +279,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	 */
>   	ret = drm_aperture_remove_framebuffers(&meson_driver);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   
>   	ret = drmm_mode_config_init(drm);
>   	if (ret)
> -		goto free_drm;
> +		goto free_canvas_vd1_2;
>   	drm->mode_config.max_width = 3840;
>   	drm->mode_config.max_height = 2160;
>   	drm->mode_config.funcs = &meson_mode_config_funcs;
> @@ -307,7 +298,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (priv->afbcd.ops) {
>   		ret = priv->afbcd.ops->init(priv);
>   		if (ret)
> -			goto free_drm;
> +			goto free_canvas_vd1_2;
>   	}
>   
>   	/* Encoder Initialization */
> @@ -371,6 +362,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   exit_afbcd:
>   	if (priv->afbcd.ops)
>   		priv->afbcd.ops->exit(priv);
> +free_canvas_vd1_2:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
> +free_canvas_vd1_1:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_1);
> +free_canvas_vd1_0:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> +free_canvas_osd1:
> +	meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
>   free_drm:
>   	drm_dev_put(drm);
>   

This would deserve a devm_meson_canvas_alloc(), but as-is:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

