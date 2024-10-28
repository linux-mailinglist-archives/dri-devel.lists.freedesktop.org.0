Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8709B2BC1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6DC10E0E8;
	Mon, 28 Oct 2024 09:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o6JSz1RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C610E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:45:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so4020932e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730108712; x=1730713512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ys+WfbBpaDwElNrVGMzyQY072qV7pclOLTHjge1orpw=;
 b=o6JSz1RA4COubezO4vtqR7cqEYG/DV3FC74VUN9FjiVx8i5j/+Ots3W752VPEL95vd
 l0yy5AT71A2IRR0gronWfYi1GD1bA7By8OV4+/YLzPO0Jj7YXPtNvOfb9kv7rr+dvEx+
 lGUEZ7+H6XJvhzhGaNL43BG+Lq1YhcjU1YCkaV//JhFGGYfaz4hvr/MSoyuqZYmXzlDm
 /5CFoW3FRqfFFACiyRMj5M1iJ28PmKpmqmrkVTBt7kHxaPcdM/Bk0wTOIoaM8oFIWaL2
 aXs4bXMYEFUspRpK9DOTEnDz9PUQWNt4HCP9qwlF0zrx0MnccXngbzT1Kwq+1UEIVVeX
 GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730108712; x=1730713512;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ys+WfbBpaDwElNrVGMzyQY072qV7pclOLTHjge1orpw=;
 b=QnGOhWtotMX+lBdxb9fOlh73yk2YMnEJArI8HhTYhg2RM+uhxXp4K73PkFGLNF/HEU
 O/qkbJtlwkLaDKVWOkwxIUifvgw6b+FvWlR84E+K6sldBDKQTTa18i76bgO6GE6UQX1n
 5gECOBaER+DwJkvQqL17TGyc00Qhqr9BYJq1+CdZ32OkzwtQ2yPEwHmz3sjEJ0NjfKDL
 rvM2QOHEo/gajv64SZYdPtYgbbUerIGm4+Kfhg+e8N3lw3kkUOVeCP7VUvtV0fFWfdTL
 DW4PInhQ0INcdkQYvzl2UCYsy8Lx+IoztX/xGrx7A8mGIOwhEE7Xi0LjZrob2W8SAV5A
 6jUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpufi6huOxov2RxK9SBkCOZSo8aa8oixtzLsfcRwVp8boWV3vWUnUlN5J2GwSg3WcIDjlt6dhXHGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvOSsG1D1dkAuk77iTcNQmP3prLs8fsUyrywP1iRgVbHm0jHxv
 XJIqhk7GytadGJ9O7Q7gy1kYFv8bHxP2ra94vfh/vWlBTOPtHh7KKZxt7rGI8Vw=
X-Google-Smtp-Source: AGHT+IHBoG5jYCoyrwL+yla9i42Cc6fhtVBU3twBLgWEJ/JsIcG1LuPBA4IPKuMdb/vG94WFPlUyTQ==
X-Received: by 2002:a05:6512:1107:b0:539:f7ba:c982 with SMTP id
 2adb3069b0e04-53b348ee5c3mr2717820e87.33.1730108712034; 
 Mon, 28 Oct 2024 02:45:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d?
 ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4317dde7b70sm177042835e9.1.2024.10.28.02.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 02:45:11 -0700 (PDT)
Message-ID: <ddde6c69-d1cd-42c9-9455-c0e59c6b3555@linaro.org>
Date: Mon, 28 Oct 2024 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: tc358767: Improve DPI output pixel clock
 accuracy
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241026041136.247671-1-marex@denx.de>
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
In-Reply-To: <20241026041136.247671-1-marex@denx.de>
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

On 26/10/2024 06:11, Marek Vasut wrote:
> The Pixel PLL is not very capable and may come up with wildly inaccurate
> clock. Since DPI panels are often tolerant to slightly higher pixel clock
> without being operated outside of specification, calculate two Pixel PLL
> settings for DPI output, one for desired output pixel clock and one for
> output pixel clock with 1% increase, and then pick the result which is
> closer to the desired pixel clock and use it as the Pixel PLL settings.
> 
> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> without this patch is 65 MHz which is out of the panel specification of
> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
> the specification and far more accurate.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 0d523322fdd8e..7e1a7322cec70 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1682,15 +1682,39 @@ static int tc_dpi_atomic_check(struct drm_bridge *bridge,
>   			       struct drm_connector_state *conn_state)
>   {
>   	struct tc_data *tc = bridge_to_tc(bridge);
> -	int adjusted_clock = 0;
> +	int adjusted_clock_0p = 0;
> +	int adjusted_clock_1p = 0;
> +	int adjusted_clock;
>   	int ret;
>   
> +	/*
> +	 * Calculate adjusted clock pixel and find out what the PLL can
> +	 * produce. The PLL is limited, so the clock might be inaccurate.
> +	 */
>   	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
>   			      crtc_state->mode.clock * 1000,
> -			      &adjusted_clock, NULL);
> +			      &adjusted_clock_0p, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Calculate adjusted pixel clock with 1% faster requested pixel
> +	 * clock and find out what the PLL can produce. This may in fact
> +	 * be closer to the expected pixel clock of the output.
> +	 */
> +	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> +			      crtc_state->mode.clock * 1010,
> +			      &adjusted_clock_1p, NULL);
>   	if (ret)
>   		return ret;
>   
> +	/* Pick the more accurate of the two calculated results. */
> +	if (crtc_state->mode.clock * 1010 - adjusted_clock_1p <
> +	    crtc_state->mode.clock * 1000 - adjusted_clock_0p)
> +		adjusted_clock = adjusted_clock_1p;
> +	else
> +		adjusted_clock = adjusted_clock_0p;
> +
>   	crtc_state->adjusted_mode.clock = adjusted_clock / 1000;
>   
>   	/* DSI->DPI interface clock limitation: upto 100 MHz */

It looks like you want to go around a not very well written tc_pxl_pll_calc()

Seems the functions would either need a rewrite or perhaps use CCF instead by
declaring all the pre-div/PLL/post-div.

Neil
