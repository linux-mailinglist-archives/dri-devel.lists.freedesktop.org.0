Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DD9712E5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92110E33D;
	Mon,  9 Sep 2024 09:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BT7+YjRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6610E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:04:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374c3400367so3434760f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725872680; x=1726477480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/quyWb8vumcbT1XTiobNYayKAU49ZoNqv4TkV+Bl12Y=;
 b=BT7+YjRJrMlZ75Ulcre4FAjkQn3q8G8EIXXu3QW6hAU7nUy4L4Ll0/XK2TXXGt5wVm
 V4ffqwezFZaugDxIppSexSzDM/WHousoODhG1RH7kaSb2oklvfJY2nT/rZBNp/j2f61F
 8troEK43GDWlq/4XvkG/0pbC/S09o11cJ4AWf2xV+/f6zB7GQDuyLEOwMxbzPfr15CaP
 +chO1WL/AHXeNSs/708ioO+6HV8+Tu3eF5KFO4Q3zvVmnIWL/XIscsexwHrU3TBVWy+r
 2qFFgHAlvbHER47s15r8FhAF0ela8YCotwDwyAlfGifFyGmexqTQIuYXzzyyhdE3n1OG
 nChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725872680; x=1726477480;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/quyWb8vumcbT1XTiobNYayKAU49ZoNqv4TkV+Bl12Y=;
 b=UZkQoRv/rTKci9ViA3fOX3UQPtnca9wW37UlL+/7NjTcdc1hbRwHbN55O4zz9Befi0
 rKJq9V5JFyedMrsg5FF2g8oO7cf3R47sREs43jHKVCVElrc33xsU8s2HT7ixgEH/SaO8
 xBYqfNk9BW/4HgXFoOQfs97XlrE/OLEQu4SldoZ1D1hIdFNPOtlYtizloJ5BS1VxOjdC
 8dt7Hthe+X7teFwCAr2T8LUrB2i+WwQK0E74noR8+ooNoZJTX/Tr3NF/fwCKYmrVP6P/
 N3p3Ic0h1F051zH/D87xInUY5xG4+XtEb7llJ3Va81skwTmAsoj5HAoKZ/kMfNN+QF66
 Pe2g==
X-Gm-Message-State: AOJu0Yyld7+x1CPYy9XSvV8kqxDIY3bMREqLAn7PVNSBYxliodnUI3HB
 RRm0wwbOHP6Wi8uBTQeC1VBFx/bgzOfHshbs5INq0zbgWdDtGWytLaJdlgNv1q98zyHv+kIUs4b
 k
X-Google-Smtp-Source: AGHT+IHPyFzNJJ9CK/CbxvRhF0zXZqmiSax9i+YVPGOKwyfg6lpCSe5AQQrFB9PmBhsPgB8jUkq+yA==
X-Received: by 2002:a5d:5081:0:b0:374:c9f0:7533 with SMTP id
 ffacd0b85a97d-3789243fbb9mr5688124f8f.41.1725872679665; 
 Mon, 09 Sep 2024 02:04:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850?
 ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675c40sm5467200f8f.51.2024.09.09.02.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 02:04:39 -0700 (PDT)
Message-ID: <b4ac3e8e-1d0c-4a6e-97de-482a77a3a3aa@linaro.org>
Date: Mon, 9 Sep 2024 11:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
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
 <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
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
> static inline dw_hdmi_dwc_write_bits() function is not used at all:
> 
>    drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'dw_hdmi_dwc_write_bits' [-Werror,-Wunused-function]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5565f7777529..b75db829b1da 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -272,20 +272,6 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
>   	writeb(data, dw_hdmi->hdmitx + addr);
>   }
>   
> -/* Helper to change specific bits in controller registers */
> -static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
> -					  unsigned int addr,
> -					  unsigned int mask,
> -					  unsigned int val)
> -{
> -	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
> -
> -	data &= ~mask;
> -	data |= val;
> -
> -	dw_hdmi->data->dwc_write(dw_hdmi, addr, data);
> -}
> -
>   /* Bridge */
>   
>   /* Setup PHY bandwidth modes */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
