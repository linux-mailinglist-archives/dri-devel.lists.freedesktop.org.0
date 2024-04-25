Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77198B25DA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB7A11A5A3;
	Thu, 25 Apr 2024 16:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SoAs4DJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCCD11A5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:00:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso856682f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714060851; x=1714665651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kckeE+NEI4roa7Me46yLkkObGQIsPjSIT73YQTFPxCk=;
 b=SoAs4DJB/0EuXTWnLo2k19CaaqwjJDWqafgKF6XepVL7k1t1LOZrJWEgIkIgqV7lP1
 arFJK+RgoHV5fp7SLB+CdZkPcMRfIMIObLsujsZp1g6crwo1atJ5nIUSzWnl2EcjdFD7
 HJigBDKKJftsAfBbSfZAwjJiKKZasp5cT63Mn//9h1T+Q3BE2rp1LOhqqqqvEw7vrwEL
 3GR2j4AN5OXBeLZYYcJyp0cT7jxxYhO2Ysksg9HMmR7eLR12XqOcdAb9aVZaBC3mqI9w
 lUKkhLg5Gqk3E25+BpdEh4LsTSA6CISOxLRzRZ9Iq8lhRKX9rrscV8SESbnngFQrZAFU
 zeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714060851; x=1714665651;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kckeE+NEI4roa7Me46yLkkObGQIsPjSIT73YQTFPxCk=;
 b=YH507t9sEH6t5gqyQ6SyG5n0+ANlxZlSxWCLSTpj0lE6+Az1Wr16Y80Tplk+84oz44
 0PWY93NT7GGAqLksCf6Y6ndSoyM80wazh5ToQfBfETkClZkcp4auPgbXj3ICplWd10NU
 iJ5srQKhnax85b8Y4bfByk15OhmXgdwifgH8fedXtbasFwEG1G3naAAXylAO+4YNiwwy
 nNmBS8nbrL86J/Dxv8bOXw+P2DYEb7Zscs5SPEPVgG8+ttKJLLA5T0p3/tloZPhtbpDV
 WZQw9ZHgIn8Sa0A9/Hcx9o6QQ46+Re2+anrjvWrEWwmhd6z9+oSBm1bvOH+vb5Gmzxbb
 gIFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTSCnIRlfRYUOoOii6Xc05Dc3JOCH41Zrh6qHswgTEuW0eh6fssSLbx5zE21R0DW1tZhfofZSGSpDGLVdglDG5NSgWV/f0ffzBj8LHx6Si
X-Gm-Message-State: AOJu0Yx28oSWZ/4kODn9Vk4CN+lrW9xmPFwnKYB8eRtGX0s0pGokMqTQ
 9aRvVTlWD6Fk/3F586zKAjxcNTGuL/TN5dlQ7e67fuq5TlWpMGwL+5lulddYhiA=
X-Google-Smtp-Source: AGHT+IHrjKF3l4sThlKJ+RxAmHgEGNIe9JwcfNY91sPhFvLEeh9FjhlyUGA200aqY+kHV/MZSMGDfA==
X-Received: by 2002:a5d:5642:0:b0:34a:ed29:8d1d with SMTP id
 j2-20020a5d5642000000b0034aed298d1dmr4312102wrw.64.1714060850776; 
 Thu, 25 Apr 2024 09:00:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 v4-20020adfa1c4000000b0034c32e9e2fdsm624252wrv.13.2024.04.25.09.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 09:00:50 -0700 (PDT)
Message-ID: <85be9e9d-887f-4138-8980-80385ff523fc@linaro.org>
Date: Thu, 25 Apr 2024 18:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/3] drm/panel: ili9341: Respect deferred probe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <20240425142706.2440113-3-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20240425142706.2440113-3-andriy.shevchenko@linux.intel.com>
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

On 25/04/2024 16:26, Andy Shevchenko wrote:
> GPIO controller might not be available when driver is being probed.
> There are plenty of reasons why, one of which is deferred probe.
> 
> Since GPIOs are optional, return any error code we got to the upper
> layer, including deferred probe. With that in mind, use dev_err_probe()
> in order to avoid spamming the logs.
> 
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 7584ddb0e441..24c74c56e564 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -715,11 +715,11 @@ static int ili9341_probe(struct spi_device *spi)
>   
>   	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(reset))
> -		dev_err(dev, "Failed to get gpio 'reset'\n");
> +		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get gpio 'reset'\n");
>   
>   	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
>   	if (IS_ERR(dc))
> -		dev_err(dev, "Failed to get gpio 'dc'\n");
> +		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get gpio 'dc'\n");
>   
>   	if (!strcmp(id->name, "sf-tc240t-9370-t"))
>   		return ili9341_dpi_probe(spi, dc, reset);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
