Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42586977BEB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B262010ECD2;
	Fri, 13 Sep 2024 09:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VKoR3AhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31910ECD2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:09:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so5839135e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726218592; x=1726823392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HLdIqxoqb5KmhEW9QOZTVpHsg4gXaPJ+uFC0FI+XoTg=;
 b=VKoR3AhWyPCaTtR7VwgM8K4kc3FAkalSRJy7cL89NrCIi83pg5D2Lu65X6DR1l9uxZ
 ItJFx65WluWDbXltNogIt1p4QSguINTA5tW8qXhoe5Rjv8E9aZMcSCQ624lKWYoeWBBz
 HOrGs+/7dui2lid3LfhCInk7Usl5cbfQFUVSsjSil/2VWuPWKbd5jVgdLTtVBRol4XDx
 +HAPz7q2Fg6obPXyZsj5Zx+RYvx5S6H5AhlmcErQIsIakoukHF4mN0mKjRfVjNHHpV+F
 Ut+Rm8HxRzylOToIlqBkctloeOm5mppiD+tTJ6sK6XISb/kRDnOhx8SHiCdd4fvp0w6U
 GoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726218592; x=1726823392;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HLdIqxoqb5KmhEW9QOZTVpHsg4gXaPJ+uFC0FI+XoTg=;
 b=gQLYaUHdFb7aSjoF4oXm7TKSrVJqmRkc8JynU/i9JBcbnaxTOG1sUfNnDcR2hmrF51
 3XNPHI9iGfvL/6OuH9a2ju6U8cJrEndOqGMcr4Bc9jWZN7ECZfRrBAzsOEox6F+cfYoA
 k4X+n/TEdBN9BYAyrcP5Ww2N+rehPeBl1MwflF5UUlGhkimtQ5yUD/voWPrWVlyd/p3V
 TgZ9/sPUIirIuatKE5exnxqOQo/DfJFKus8bKGBW9zrorlb+otMP+rqpErjs117PTpl/
 Nth/YyHfBCVpv5NX40kwZ2avXErhvVNMQg3dUekfJDVPz69CLIZrsb5Tc8bZHTcOdDgN
 /mJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLM2vxqzUtthThNiZutXxSeF2Mr+ruhBKnc2b+0HcqgewptNjZAXSh8V+ljfqtxH5g201V7W+w13k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycZZ3ZcLzAjIOVvP+BkHMNQxPgNJMLN0wSjckI3/WnWrvS02y6
 zxzjfR80d47tYtxWw7/BW/k/x99N18lexoURFI0UBCexVUDJWF6WpsuV118lgi0=
X-Google-Smtp-Source: AGHT+IGMM6FHc1+2pXKvJHwC8ZMUtG/4vrXn88JK9L1ByLH/Gw4r9nZUG93Mmb+5ORn+tb2EgY4CGw==
X-Received: by 2002:a05:600c:3ba9:b0:42c:b949:328e with SMTP id
 5b1f17b1804b1-42d964f3455mr12537865e9.31.1726218592165; 
 Fri, 13 Sep 2024 02:09:52 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b054f97sm17501755e9.4.2024.09.13.02.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 02:09:51 -0700 (PDT)
Message-ID: <c79a615a-ed9b-4768-a1df-e64e2e2c2c48@linaro.org>
Date: Fri, 13 Sep 2024 11:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/1] drm/panel: sony-acx565akm: Use %*ph to print small
 buffer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20240911200125.2886384-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20240911200125.2886384-1-andriy.shevchenko@linux.intel.com>
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

On 11/09/2024 22:01, Andy Shevchenko wrote:
> Use %*ph format to print small buffer as hex string.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/panel-sony-acx565akm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index 217f03569494..d437f5c84f5f 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -562,8 +562,7 @@ static int acx565akm_detect(struct acx565akm_panel *lcd)
>   		lcd->enabled ? "enabled" : "disabled ", status);
>   
>   	acx565akm_read(lcd, MIPI_DCS_GET_DISPLAY_ID, lcd->display_id, 3);
> -	dev_dbg(&lcd->spi->dev, "MIPI display ID: %02x%02x%02x\n",
> -		lcd->display_id[0], lcd->display_id[1], lcd->display_id[2]);
> +	dev_dbg(&lcd->spi->dev, "MIPI display ID: %3phN\n", lcd->display_id);
>   
>   	switch (lcd->display_id[0]) {
>   	case 0x10:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
