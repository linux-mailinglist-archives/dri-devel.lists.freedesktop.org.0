Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA57BD67F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7282110E24A;
	Mon,  9 Oct 2023 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6A10E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:13:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so2443979f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696842788; x=1697447588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=riy2ohNnJTI8tyOBkVxN9+KyXQ2yc80mwJGtwl0WMgc=;
 b=fxHdREqzzRGsG3ucvnPk7RpZWXF95hN86oEZLw+dJ9vBPi93LoRGHu26nry1Wax6m5
 TE+pQRcI/xUuxC29t11NLWXmIz4BMGNukbblC88JpJ9eZC3egs7lZwKg8J9QP1wLvCGx
 X9JrwvtoWRaKW+MWyS8wjQhrZeRxjG0KXsvyi3khxwpJVeIkkIi/rxgKPNC+okFu1tDX
 cw2YBOm4ubQN9PkAzuH4kNfO80AcfQObVo3sjzzyZWdqyRUxQcuVn6ZhkkAxEFlbV/dx
 Qpp32V63tMs8sUP04CC+W4YCfSsibeFWL2D2LddKg4ShUmmKF8jucdvqZmh3U5/v6hga
 R5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842788; x=1697447588;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=riy2ohNnJTI8tyOBkVxN9+KyXQ2yc80mwJGtwl0WMgc=;
 b=hS35OhK+6iw1MjbUGuhNzs04Y0lAPj7E6eRSePpE9RhlqnY4QxqSukr0NZ1h9SB9IQ
 CB07R9wCTDg99AHdgRrWPJjg9vjEDLTsxt2hAy1rL8DfbKmFXApmobusBTi7E19ua1wr
 2DdafrUdcl+EPCVwlL/j06zU77EMOR1OChSkg9oSygc2PisUc0dTpp0LSTN61rGJS3DG
 SOk2JLMwr5nSSatTG03pG8fJXz6W0hAgVknUenHdYhM3D/kC7MysI5MwGKY0Gt8ftDS4
 jy9Xi5yRh7J6LmRoWSrp8DaWQRhymdw2QzdnN1oNxg9UPxeUBMWUcC3pkMsiA4/MGOVm
 mNjA==
X-Gm-Message-State: AOJu0YxZIEphIdOjl7q1HCxYc2Fxd4+E0Dx6gBSjNAy1qWfrO42oSLXY
 Iy95ujP4PhaSVjgdfw6oFZcaCw==
X-Google-Smtp-Source: AGHT+IGUWNNjEgJ0FR3882pEmsZ7c1/CLbNVn8Kj5cKMrT9umktbrGd+rVu/jugoM9qaPAym4jSJug==
X-Received: by 2002:adf:fdd0:0:b0:324:8353:716f with SMTP id
 i16-20020adffdd0000000b003248353716fmr12227404wrs.20.1696842788387; 
 Mon, 09 Oct 2023 02:13:08 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adffd12000000b0031980783d78sm9021939wrr.54.2023.10.09.02.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 02:13:08 -0700 (PDT)
Message-ID: <e6384e25-dae3-4488-b1ca-e0c07a601741@linaro.org>
Date: Mon, 9 Oct 2023 11:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel/panel-tpo-tpg110: fix a possible null
 pointer dereference
Content-Language: en-US, fr
To: Ma Ke <make_ruc2021@163.com>, linus.walleij@linaro.org, sam@ravnborg.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20231009090446.4043798-1-make_ruc2021@163.com>
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
In-Reply-To: <20231009090446.4043798-1-make_ruc2021@163.com>
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

On 09/10/2023 11:04, Ma Ke wrote:
> In tpg110_get_modes(), the return value of drm_mode_duplicate() is
> assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>   drivers/gpu/drm/panel/panel-tpo-tpg110.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> index 845304435e23..f6a212e542cb 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> @@ -379,6 +379,8 @@ static int tpg110_get_modes(struct drm_panel *panel,
>   	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
>   
>   	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
> +	if (!mode)
> +		return -ENOMEM;
>   	drm_mode_set_name(mode);
>   	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
