Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09741956F93
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658BD10E2F1;
	Mon, 19 Aug 2024 16:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BUEWB60a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4652C10E301
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:01:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-429c4a4c6a8so36798825e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083294; x=1724688094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3inI0ECOW5fOemX4PH/fT5PDp4zYtzMO9ksOGbeSD10=;
 b=BUEWB60aK6Z1BmQJ3PBi7vHF7S7HGWXjAuB8Yaiyt1ghkDxf59xcRw6KzQpkUUa3xJ
 K9hoTu9Dw5ZqH+R/4PzI4jTMyhOE9qjlbQFpQlhorkx/1rzpNZ7WcnVTt5QR7VuDEXq7
 7eg9228cvLoBMxwKcWpPRtK2iY+V7lIobognJCAEt2SGcR1vnrSQS78yhINKpgR5JUNH
 WP4YgLwu7aFZ4LCW+aL70HAsGnG6qY+xphAHa/zZxaEghcNbnU9pEn0vf2D4n3zHJwfK
 SH0xwonr8FZR8SRG27sgfMZZT0Uk3sGSL677sdGmfpFO0hEmz08yfXqEIPxL2Vk0jJG5
 peTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083294; x=1724688094;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3inI0ECOW5fOemX4PH/fT5PDp4zYtzMO9ksOGbeSD10=;
 b=J3nZ2gypdq+laeACIRxc0Fx7/orUnpvorySNZwEuzeoof8TjrBEYCGJV5YQky7aYkS
 PD4MnTNkCb0iECsVBwZXA7Q5upSjNwIGikEaEw7W9odsd5JK+62/3jw4xQnTINaokH8p
 iyRdDVnOkMi2eUHREJPi5w0TrfQtpTCcEViIlgCR8A2SVSp+fqcQJ6hknaq7QnOImL9C
 Za8vkNpk4Y05jGvPnBWz0ACfyiu2EbnQoUasn7Tvw/cNMpeFaye0ulnDIKt+XmAGd6R2
 35xGqruMh9smVuvHTG7atRRc1mV1mxQYOiFA30I5GfUn/tNvXvoSkJEmB3tonM9K3s0L
 hGDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW6WULA8jwE0ArmLEshhiCwdmK0AY6dkpCky2Hc/obpT4hWrd2GBabKePZsRDzAuKVxupPoK6/6Ku5q9ftfIcBUH48jsoxtxH++uwbI1Rn
X-Gm-Message-State: AOJu0Yz6n6Yp2VD2odtR0mzGHfUJ43xZd/QbEX8UvS6A6/Uq9SstO59O
 MPhdSUpwVIJaW4qkSDtlQU1h6anNvvgvt2MVfLd50uzealtClBPZ2QRO+l1tdfGIj8/DzTW+dxZ
 /
X-Google-Smtp-Source: AGHT+IHqi+ynv7PNIGrSXPrynHUL4/QS/orobgoM3PsUljd0gTqOfknAgwMfnnGvbolV5NilUOhbng==
X-Received: by 2002:a05:600c:4746:b0:426:6a5e:73c5 with SMTP id
 5b1f17b1804b1-429ed7f9852mr65754795e9.37.1724083294044; 
 Mon, 19 Aug 2024 09:01:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed784726sm114095855e9.35.2024.08.19.09.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:01:32 -0700 (PDT)
Message-ID: <5c72008c-65b9-4013-bbed-f5462e27b9ac@linaro.org>
Date: Mon, 19 Aug 2024 18:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-3-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-3-jbrunet@baylibre.com>
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> Poking the HHI syscon is a way to setup clocks behind CCF's back.
> Also, 2 drm code paths, the encoder and the hdmi-phy, are racing to do the
> same setup of the HDMI system clock.
> 
> This clock is used is used by the HDMI phy and should not be set by the
> encoder, so drop those HHI pokes from vclk.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a942dc6a6dc..bf5cc5d92346 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -813,14 +813,6 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
>   {
>   	unsigned int m = 0, frac = 0;
>   
> -	/* Set HDMI-TX sys clock */
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_SEL_MASK, 0);
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_DIV_MASK, 0);
> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
> -			   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
> -
>   	/* Set HDMI PLL rate */
>   	if (!od1 && !od2 && !od3) {
>   		meson_hdmi_pll_generic_set(priv, pll_base_freq);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
