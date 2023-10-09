Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2E7BD603
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660410E23C;
	Mon,  9 Oct 2023 09:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D210E236
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:01:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-406618d0992so41564895e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696842079; x=1697446879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NnHdev5Dl0xszBBVAEXQl7o6fZ+TJmP4Fh5HOR6W4as=;
 b=F+OrLIKZ9Tb0kXSJoRMJsRlwsZDXF+uIK7/eO0g3vTCEN2hXCZsiac0xsUN/ekKXLD
 rxZ7ny5iRZdxoP0gUaidhTB19xCv7wsewo4QayspoFfo26AaD6apoVSESbFkIHgUPIJe
 IjCbOjbJqFcaEqoh1oiD7zeVvvCtkWbR+bogq3fhJEsjN12n/RxLjWfZD/FeGxeIzjZr
 Y4ml73YaD0gi9W9UAP1GPyyI5lXuQdUeWMGWW77O4YxXxnS9ThOj1uZYhuX/kzk3J2J4
 FLiULvVo2wSBtt9sU/P082sq5xl+z+5j/yWK/pkNG5KGX7MCAcOzYIwBfacVMO18EG6d
 n/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842079; x=1697446879;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NnHdev5Dl0xszBBVAEXQl7o6fZ+TJmP4Fh5HOR6W4as=;
 b=NTn8tDeX3RnNkY22RyH35yWkMOSDysQBv7vlEMUD7d2UtiCtl6Ca5ZeP/oFkyctG/U
 Ww6xjzJP+U11SW7I8BJcNkO9Beq8xl0wObUZ7ksNuwe9V9ZCmz/B5O2zFY2s85RTpl1D
 KWy6oHO2rkt5dpUlcQsFIg1RdhOER26jzD8DJFDNVXoyRBprJWHhFK1eCmSgIQKlCDf6
 uSPGJlBF0buBMkZIcKMF6Z6xXTFKLDhi84Imy6pgKKtJusjO1JYA/tsA+M3wlZNIC0Us
 2iowQVZxbuELp9XfctYcwr/36yZ2AJPyNIUoFTmXN2OXDNPhwkROPEY/UT3pNgM65ODL
 bZBw==
X-Gm-Message-State: AOJu0YxgzXNDNZHZ5Oqvm2wlLKJ6tthX6bVCuzJlU9NOj2HeTYtYJ/RT
 yzXHRVekNVbJVmTw6Igl7BDTfw==
X-Google-Smtp-Source: AGHT+IGJQuHB+ETKoDAPgxIyuo+jzxe4+fmu4LqfCi12OtyMGY8kQPq6BGYTO090X4ORC15egiVOpw==
X-Received: by 2002:a05:600c:358f:b0:407:4944:76d1 with SMTP id
 p15-20020a05600c358f00b00407494476d1mr2710686wmq.17.1696842079462; 
 Mon, 09 Oct 2023 02:01:19 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a5d6190000000b003217cbab88bsm8934765wru.16.2023.10.09.02.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 02:01:19 -0700 (PDT)
Message-ID: <8137a960-bb6d-4520-88d8-03ee701a0138@linaro.org>
Date: Mon, 9 Oct 2023 11:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 timings
Content-Language: en-US, fr
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231008223256.279196-1-marex@denx.de>
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
In-Reply-To: <20231008223256.279196-1-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 09/10/2023 00:32, Marek Vasut wrote:
> The Innolux G101ICE-L01 datasheet [1] page 17 table
> 6.1 INPUT SIGNAL TIMING SPECIFICATIONS
> indicates that maximum vertical blanking time is 40 lines.
> Currently the driver uses 29 lines.
> 
> Fix it, and since this panel is a DE panel, adjust the timings
> to make them less hostile to controllers which cannot do 1 px
> HSA/VSA, distribute the delays evenly between all three parts.
> 
> [1] https://www.data-modul.com/sites/default/files/products/G101ICE-L01-C2-specification-12042389.pdf
> 
> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 7ce51ad616296..44c11c418cd56 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2295,13 +2295,13 @@ static const struct panel_desc innolux_g070y2_t02 = {
>   static const struct display_timing innolux_g101ice_l01_timing = {
>   	.pixelclock = { 60400000, 71100000, 74700000 },
>   	.hactive = { 1280, 1280, 1280 },
> -	.hfront_porch = { 41, 80, 100 },
> -	.hback_porch = { 40, 79, 99 },
> -	.hsync_len = { 1, 1, 1 },
> +	.hfront_porch = { 30, 60, 70 },
> +	.hback_porch = { 30, 60, 70 },
> +	.hsync_len = { 22, 40, 60 },
>   	.vactive = { 800, 800, 800 },
> -	.vfront_porch = { 5, 11, 14 },
> -	.vback_porch = { 4, 11, 14 },
> -	.vsync_len = { 1, 1, 1 },
> +	.vfront_porch = { 3, 8, 14 },
> +	.vback_porch = { 3, 8, 14 },
> +	.vsync_len = { 4, 7, 12 },
>   	.flags = DISPLAY_FLAGS_DE_HIGH,
>   };
>   

Looks ok, I'll wait for a few days before applying if someone wants to test it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
