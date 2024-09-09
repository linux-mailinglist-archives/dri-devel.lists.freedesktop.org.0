Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0E9712E8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042EE10E33E;
	Mon,  9 Sep 2024 09:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="po+7xu2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D956D10E33E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:04:53 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so2482335f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725872692; x=1726477492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
 b=po+7xu2FrBcyrOX7lt8RXNHOK3Y718WqVM97th/idwxkTT1ZsLvTS5oYZ69iqcUbiY
 Ev9zsxkzJeGz3azyRcl6gGmnW4QY8+F4Kq88C3vEaOwoCk4jvM9K5w4LX3BVdeHYr6NU
 lmcO+LQzP/LqLfqWJ3hjlksV9f4IsqxF51RKhVzauHC2EXXNXJ5tTZldO31++lQY1K68
 ZBiVnTyOxs52Mhkb3IWAexoavC9FnFvs59npmKG4v/G326FnkcUfaKLVqVFYmx+XUXEA
 WKUdsZrLU/6+vGuaapfH+mABwA0m15+H2XCPxvpnRBTJHWMz7FhOvMtsi7iqcS/jv2mA
 QhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725872692; x=1726477492;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
 b=S1XabmPqSHnSM3EbGptN/1VDO+QD1qW0XUjcBrgEz2mqB1UtEyyp8hk3RD+0AFwCQi
 rMuxGzoY0XwhLz9kWx5fbRi2nrHB0jhv302Hj7gpp8Ow3CbDOm8n7Als+Qd9PS5fNPSM
 M0PwL3mSqsCgNUymamv99SwW4J44fe+lPF8BxySyes8gJZsG7dW1HmlACBv19v722M1u
 bJV9plwBwZymRJbafIBVQvCkJT+fyf3MjudZRFQAvpQD57t5zxJcUwEduVyYn7GzOL1j
 dwam6ZSVA3a4ipBlRlwg8onJDH2tf63JZWE8DqrLJxKotdp3qRJu88EUnJOylZutDrFC
 hP5A==
X-Gm-Message-State: AOJu0YxbrfeFhTl/fp/g5s+qKdsKo7zrW4jbfR8YGyvg/vyN+9764AkK
 i/GIaMNV8drokPGjfrqw9BDUNrU27aEVGTuljhoJ5gHTjwXU3bLtzoP/TUOPaHg=
X-Google-Smtp-Source: AGHT+IFVcYzwIVmzAqMmvKKM3ciORGaJKpx4XVnUJN5ODieQEuio3vvRs+LhSli5Ag9nEDPTPH5piw==
X-Received: by 2002:adf:cf09:0:b0:374:c651:4abf with SMTP id
 ffacd0b85a97d-3788969feb9mr6129034f8f.52.1725872691962; 
 Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850?
 ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de3d4sm5457312f8f.108.2024.09.09.02.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Message-ID: <81392013-5dda-424f-b185-c350b163c82d@linaro.org>
Date: Mon, 9 Sep 2024 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] drm/meson: constify regmap_config
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
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

On 08/09/2024 16:21, Krzysztof Kozlowski wrote:
> Mark local static 'struct regmap_config' as const for safer and more
> obvious code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..6c8677d1f562 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
>   	return false;
>   }
>   
> -static struct regmap_config meson_regmap_config = {
> +static const struct regmap_config meson_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
