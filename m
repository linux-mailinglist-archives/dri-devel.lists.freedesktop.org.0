Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786182BD55
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C7C10EACF;
	Fri, 12 Jan 2024 09:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617A310EACF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:35:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso14900075e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705052127; x=1705656927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xuKXhOStQyK9dpMS9adBtqgfDhayEXns7siZHVfVaYs=;
 b=NL823Gfo08gShT6zn4yHA8VNlJMLrB+rWPLgW3nP8IN4QJpbZf/lRBH0bxg4LQ/OYy
 Ka7Ubdzzkc2CIbLqQg1g98qbigXQX6+M+PyGtFDxcdPW4zVqT4olBpH8LCSdPwOJu+lW
 DbEVkTCfg9MM7uKSURSKrHY8Vt5sTu9fNke7Hkvr4if+V6W59RsdONBegWvK5k2tqemB
 1vJpeWMR7hjSCGKNar5Ini4R5IqeiSiQwUYtaBGky7jAT8DZFHiDlOrnoTC38L2zXuup
 YDT3MPpZZvPtK4mC3nxw4302C219x4xF3zyk4M6KEYkQCbUqQKDDmMyiiLN7Kgv5FED/
 VeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705052127; x=1705656927;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xuKXhOStQyK9dpMS9adBtqgfDhayEXns7siZHVfVaYs=;
 b=l4Rw4B+xEgdLy/f5g6Nq8AdFHopSHKOw2Qoq9v7rBTqGJedbOhxrKZXFVeY12ZLJ82
 8fglC3M1GTTHIgY5gxN2uWdtQvV5eFcyizY0ffWY5ZCoV9gb6pgMQPfth1BhLYA4cB30
 QpvyL3HfgV9QgnDC0o+dC91/8P1vu+0AtiFbYyOvtkJVNflw1yE8ej4lQ22snDATKT6C
 Et7SnWktMkr5U2uVclq4f3Dyr/p9jLAoVK5H/mG7VDyBA/pCZNgpqSqiTjzWDYp3Bxko
 Obnv9WGpG2Ed5MiD3/ZPfmdGZrGXEVP+wHId+J/tPzx8pLkFQf5cf0psDUtvfeLGZ36t
 ZFFA==
X-Gm-Message-State: AOJu0Yx2K178zWEAHjzNVjnVv4FwXriC7JO8E9YvA3ED+g3ZXLE0uR/c
 OoUqba27FJ/HqXU0mlnznNKjzy72Y3wclg==
X-Google-Smtp-Source: AGHT+IEIUsFljOBhgViMV2rZfaH+HuPIoVtMnRKkHQ6Ft6px8h1iNrwtieNSYeHUgEPD1rUxc/CMXQ==
X-Received: by 2002:a05:600c:3515:b0:40e:465a:8b54 with SMTP id
 h21-20020a05600c351500b0040e465a8b54mr575654wmq.4.1705052126776; 
 Fri, 12 Jan 2024 01:35:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:59d5:231:f1ee:77f?
 ([2a01:e0a:982:cbb0:59d5:231:f1ee:77f])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b0040e56830a35sm5050051wmo.18.2024.01.12.01.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 01:35:26 -0800 (PST)
Message-ID: <789bffea-cc4a-4752-8113-31101df951bf@linaro.org>
Date: Fri, 12 Jan 2024 10:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH linux-next] drm/panel: samsung: Simplify with
 dev_err_probe()
Content-Language: en-US, fr
To: chenguanxi11234@163.com
References: <061ed94a003362bb7d7e9d3e4d38358c5b91c8a3.1704186827.git.chen.haonan2@zte.com.cn>
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
In-Reply-To: <061ed94a003362bb7d7e9d3e4d38358c5b91c8a3.1704186827.git.chen.haonan2@zte.com.cn>
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
Cc: cgel.zte@gmail.com, linux-kernel@vger.kernel.org, mripard@kernel.org,
 Chen Haonan <chen.haonan2@zte.com.cn>, yang.guang5@zte.com.cn,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2024 15:17, chenguanxi11234@163.com wrote:
> From: Chen Haonan <chen.haonan2@zte.com.cn>
> 
> dev_err_probe() can check if the error code is -EPROBE_DEFER
> and can return the error code, replacing dev_err() with it
> simplifies the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 79f611963c61..f4103e762b53 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -194,10 +194,8 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>   	s6->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>   						GPIOD_OUT_HIGH);
>   	if (IS_ERR(s6->reset_gpio)) {
> -		ret = PTR_ERR(s6->reset_gpio);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to request GPIO (%d)\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(s6->reset_gpio),
> +							 "failed to request GPIO\n");
>   	}
>   
>   	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,

This patch fails to apply on current drm-misc-next, please refresh.

Neil
