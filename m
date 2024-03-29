Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB5892118
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 17:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0104112797;
	Fri, 29 Mar 2024 16:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kXfZO3VA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB803112797
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:00:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-415482307b0so14019455e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711727992; x=1712332792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=GGsD0hCZS0RGyO3uN5UGL0orhZAJeWGJYHahHUXwehI=;
 b=kXfZO3VAcUmFi4JotpKd2blBy4bpnyT4pVxv72dtDVvhhY54os9Wg6lCe61i+NhpXo
 fyucs5n5V4X9mSL1VNV/BF57XppI/82wlCUrlsHG9kSFCa9bIwmrGOT1WP+Xbj/3t+dN
 C8YMFC5jdf4C1aQR56PV0X4SyHUSIaZTHQlYj05F/BNv0Rmjj6/RicxXsFhCCo5h9SzU
 ACa0vHCyHdmWvDp7WfLhq+8EUd4yJ+d69VIxPeM8tomD9PY13Ac0tYi5bCGb5EUF63dt
 t2HwDwi+zlFL8Y2x/t9akZ40hey+K1F0CNPoVcMgIrMpgIg/0sEMhLYmKbQkEibj4oW1
 6YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711727992; x=1712332792;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GGsD0hCZS0RGyO3uN5UGL0orhZAJeWGJYHahHUXwehI=;
 b=P+JhgB8B31ZVqmqYn59KRiJW4n0SOdQVF807SHqebAP3F/EhHa1Zb3zw1U/JWSZEkO
 I+UCcKlusCysUTiCJy/d8XR5CctzI19EQAixH6b1182sF+kCge2N1fmDUg9rAH9eWY8E
 hPbEuIzhHD63PS7ZjjaUhGtSM/YyM06b1wJa2LmCJvnYEb5RpMsUCY+MsKvxZjblRJIh
 WCFuOY/Z6i33fBzYDJc5dGgjsOuwNO2o5RQiJzUQQgNvCLit4+NOHQp1T/aFFG6BSHEW
 No6iOaB2Z0WuEPjAIdGYs3XPRCyqddDyRnfLOcv0yDUfrc1X2T+LYKR0Pk8O1CTlC7gI
 ms3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiVNEZ5B9nuPQfPU/4ay4cpoMMF/gv5vwQ88Nulp/Hne9+Guf57auEhtDyKXR3rjG+WKxGTGK7L1WFHGDF+3BpmOkyKhTbbskgvYLZBBNZ
X-Gm-Message-State: AOJu0YxRKRkuIaYov1k88tMIHZntqQGpnfJI7K6NHENbVBCS8t9qPI7F
 3I7bZE0Vw469EOUM3+tCgp/ZCBEuyxT7Kcvy9vXQxvl/dqPJTEfS70/baO4Iz8w=
X-Google-Smtp-Source: AGHT+IHe6XeEQuR3I0AFMivdopvZfiDF+TwSwHOYyhqm4U6929+iEoj0HbGpgG496qoYCKqwv8vuxQ==
X-Received: by 2002:a05:600c:3550:b0:414:227:fc66 with SMTP id
 i16-20020a05600c355000b004140227fc66mr2446342wmq.2.1711727992106; 
 Fri, 29 Mar 2024 08:59:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232?
 ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b004148b9272a7sm5919058wmo.0.2024.03.29.08.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 08:59:51 -0700 (PDT)
Message-ID: <bef2bda3-c2c1-46b3-b6ae-af09941e298f@linaro.org>
Date: Fri, 29 Mar 2024 16:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional rates
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240109230704.4120561-1-christianshewitt@gmail.com>
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
In-Reply-To: <20240109230704.4120561-1-christianshewitt@gmail.com>
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

On 10/01/2024 00:07, Christian Hewitt wrote:
> Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
> sync with the following error reported in the system log:
> 
> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
> 
> Modetest shows the following:
> 
> 3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
> drm calculated value -------------------------------------^
> 
> Change the fractional rate calculation to stop DIV_ROUND_CLOSEST rounding down which
> results in vclk freq failing to match correctly.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> I'm unable to give a better mathematical description of the fix as I can barely read
> code. The change was inspired by [0] which I chanced upon while looking at how other
> dw-hdmi drivers handle fractional rates.
> 
> [0] https://github.com/torvalds/linux/commit/4f510aa10468954b1da4e94689c38ac6ea8d3627
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a82119eb58e..2a942dc6a6dc 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
>   				 FREQ_1000_1001(params[i].pixel_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
>   				 i, params[i].phy_freq,
> -				 FREQ_1000_1001(params[i].phy_freq/10)*10);
> +				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
>   		/* Match strict frequency */
>   		if (phy_freq == params[i].phy_freq &&
>   		    vclk_freq == params[i].vclk_freq)
>   			return MODE_OK;
>   		/* Match 1000/1001 variant */
> -		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
> +		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
>   		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
>   			return MODE_OK;
>   	}
> @@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
>   		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
> +		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
>   		    (vclk_freq == params[freq].vclk_freq ||
>   		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
>   			if (vclk_freq != params[freq].vclk_freq)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
