Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CC7B4C12
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F352910E178;
	Mon,  2 Oct 2023 07:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFC910E17A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:02:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-405497850dbso141977655e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230138; x=1696834938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SYAYLeRsicXOvNtqDn4yoYXYQH3c4bNCWoCyNw3DKTA=;
 b=Mo0jscVSijOaockBUcin8+J5ThAG2SIsIfHdjdZ08uCGvBdXuaPVRAZTiWIDmRsEb1
 RAZdUJz2WcP1GsZKnljhuOJX5PyTST5OBpZNihhZRGbOgfq7qCT0kvQ/5ehGad8L169v
 ttMNwP2oAipPA1lo8+Ox7dVfl3qVkb4qqd9pzK8D6lIvTSiOZBxXKBQrNbx+nW4W1767
 xZrjFdwb4paBCf1cIxDeKG150LK9UvnQQA8VNkQYKydLA0Lkyij4cN111WzAfTRgllHy
 MP04AHoxt7qezwz0TNFcbbrHMkhQUcs8T19hpBE8+AVbnLcmxhroOQOUN8kgHCbSXfld
 +vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230138; x=1696834938;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SYAYLeRsicXOvNtqDn4yoYXYQH3c4bNCWoCyNw3DKTA=;
 b=pcQCO+ADQAJ2BiU15V0GZrQSdqUYcWaoq5B+/jbXMofY+vqBnj/OZ79ViSCOAKvg0i
 66U8/ARN5jr7fX6qnooF2IJRtzQAMS0jQuzFK0UqSrrkJfSUmDEAOEYg8r/h+bqBYqcT
 1kfKf5VzKnMlUxdXIYxZ7/MTM21h3ks/e25pgKj+Uv+lXwCjrO6/HBWBfjD3NPo8pja2
 EoEVQ9Kb1gg0yd9UC/UzEwobPSphWuQLXayc018y4cX++rz3OEK6/obQdPfmxvhflSRQ
 gOcMWqO/Ku6W4Zjo0v26F58Quc67/hwbkaUa6jKIKI8fN6g1d2CjyRRfjoHWSQiVC21Z
 qzZw==
X-Gm-Message-State: AOJu0YzhM9D3FKmL5p3aZ1zeSxv89ZuylS/vE4HtYz+AG0quI1cNfURb
 U+ztS93FHs7H7xtwZGiJKmdW7g==
X-Google-Smtp-Source: AGHT+IE7/EHTOdS3sRPZBazh4feS/C+P3Qyg1GuvhflNTD/ZQ6BRNqKT/WCErQ8CYxERKC9HEtsFJw==
X-Received: by 2002:a5d:4cc3:0:b0:317:ef76:b773 with SMTP id
 c3-20020a5d4cc3000000b00317ef76b773mr8829556wrt.45.1696230137015; 
 Mon, 02 Oct 2023 00:02:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b653:7e47:ffdd:9340?
 ([2a01:e0a:982:cbb0:b653:7e47:ffdd:9340])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5403000000b00325c7295450sm6832544wrv.3.2023.10.02.00.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 00:02:16 -0700 (PDT)
Message-ID: <0431777c-a0bc-4d50-9657-ae4e9e4aec18@linaro.org>
Date: Mon, 2 Oct 2023 09:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: tc358767: Convert to use maple tree register
 cache
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231001-drm-tc358767-maple-v1-1-f759fcc4bd98@kernel.org>
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
In-Reply-To: <20231001-drm-tc358767-maple-v1-1-f759fcc4bd98@kernel.org>
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

On 01/10/2023 01:43, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index b45bffab7c81..ef2e373606ba 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2005,7 +2005,7 @@ static const struct regmap_config tc_regmap_config = {
>   	.val_bits = 32,
>   	.reg_stride = 4,
>   	.max_register = PLL_DBG,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   	.readable_reg = tc_readable_reg,
>   	.volatile_table = &tc_volatile_table,
>   	.writeable_reg = tc_writeable_reg,
> 
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230929-drm-tc358767-maple-db143f667958
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
