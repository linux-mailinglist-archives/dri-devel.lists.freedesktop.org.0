Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E9989BB5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD510E3B6;
	Mon, 30 Sep 2024 07:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dwEjANKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871E410E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:39:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37ccdc0d7f6so2034398f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727681983; x=1728286783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NSkssXW1a9XikcPafMklN3OuUZWaOAHDDn7iuHQT+Ag=;
 b=dwEjANKYNR+HNHaQt+QedtTshymhxofWHNIpHYI3Ke7CAgrXV6OeI/ZF6WQhked3RJ
 v5ZfzLFBp7bRnV1ehcFZqwoytkKwusTXc4jZ9KtbBO4Kry1camrzyEdfmMzqss3r/Aow
 Z3OwvNiRYCY9WlMX8x2PAALqxUV/JXKXUxA+zdV4CVTM7HABA+2lJwvSH7i47ZOE+0HG
 rj+kmN2Om1mu6XgZLXzPdRg9e+T4TUr5GG+DIJfHrsHppl3yz9rkKsfDCGi/G4QUMSV8
 AifVeFxyAPg5BAF4d42VBj6rHprqiyAlDBjJnx63wC5ma+wZCoESpIK4rvLCyQ6Z/mQ9
 07Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727681983; x=1728286783;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NSkssXW1a9XikcPafMklN3OuUZWaOAHDDn7iuHQT+Ag=;
 b=iv9vXma+6GsoUp5U4MhvIWRWdooZeYnEceil3axHE5ZIsbz8ybHmDi4FFVtsH1qF9O
 4Wp0wUriuJJPpvG+Jy/p70WVIgzGSRZwsPGJqhBNWIyFUgcvGP3wUSa+RwN87MOevP3b
 a78AFY8F5tXMu1wvUAotv0IVHQcK0J1fbC9bT6Jyvxsfb76xxwwOHOEdfjDeGgl6J131
 XSKT08PWXdHXZIx+YIe4t4IFFSyhIXi7pX1hDf234QW4f67j2Y8jgN1lz+i2nfM7LbpT
 it7j0pmD2SVRdAefS7yK36Yqa+dmKxZjUx6CWcnlzqB7dGtFCEN/3CVHPZi3T516K+1i
 XUHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHAkp/OA2YeJRVVn8OVkqUq8kqL56NGMC4iLUP7zEkZfqgorv9l2ctEtIFBWXsuc4vQI9vnNT3ODY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnB+yRQXtKwlTZSfuz5wtophM3hAq5eXqdwl6YpNYgK9vZsJIm
 +tO5Kgx5aOGmglONgJ23KsN8hkVdOgnRakzU59ySFW5UWmk2WA5pdFCSUfRcGog=
X-Google-Smtp-Source: AGHT+IHXjzSAmUZIrjLhTwR2jkVtzquLDnVpL+QtRPHfhdhgYXfXBsxMcmbBJURn7NDxTY//z4VXTQ==
X-Received: by 2002:adf:eecc:0:b0:371:79f2:3d5c with SMTP id
 ffacd0b85a97d-37cd5aa2d07mr5062985f8f.31.1727681982643; 
 Mon, 30 Sep 2024 00:39:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828?
 ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e6488sm8362904f8f.46.2024.09.30.00.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:39:42 -0700 (PDT)
Message-ID: <9848d911-764d-46ab-9348-90da86c0cc96@linaro.org>
Date: Mon, 30 Sep 2024 09:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: nv3052c: correct spi_device_id for RG35XX
 panel
To: Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
References: <20240929081940.823995-1-ryan@testtoast.com>
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
In-Reply-To: <20240929081940.823995-1-ryan@testtoast.com>
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

On 29/09/2024 10:19, Ryan Walklin wrote:
> The Anbernic RG35XX devices use an SPI LCD panel from an unknown OEM,
> with an NV3052C driver chip.
> 
> As discussed previously, the integrating vendor and device name are
> preferred instead of the OEM serial. A previous patch corrected the
> device tree binding and of_device_id in the NV3052C driver, however the
> spi_device_id also needs correction.
> 
> Correct the spi_device_id for the RG35XX panel.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Fixes: 76dce2a9 ("drm: panel: nv3052c: Correct WL-355608-A8 panel compatible")
> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index d3baccfe6286b..06e16a7c14a75 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -917,7 +917,7 @@ static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
>   static const struct spi_device_id nv3052c_ids[] = {
>   	{ "ltk035c5444t", },
>   	{ "fs035vg158", },
> -	{ "wl-355608-a8", },
> +	{ "rg35xx-plus-panel", },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, nv3052c_ids);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
