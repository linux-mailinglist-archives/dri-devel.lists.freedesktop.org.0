Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C37B4BB1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 08:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4064F10E134;
	Mon,  2 Oct 2023 06:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625210E134
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 06:52:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so130773685e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Oct 2023 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696229547; x=1696834347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LnEXoybYZCbjlzX7GnyyOxEnGYbND0k1bA0inBSyCi0=;
 b=moarlGkR9NhWvml/i+1yw9uGurTzEFjZn7fmqXDrz1UnfOL7n5GAdknPBfoSjCYoEb
 W1YE5BK4FQ+u8A2BXCR+A6iV3X/9/crhhuzvjGQ9Yb4pJvsn5tN29HMlSEx+6vOqjQ1P
 xSBtVoRjWE9+Mp/trPuM8qy9GRWNDGC993ODEVpNOzs9smCS+VVmr39egyYjMoKjlbbw
 3oT8SmrKmzpFd5PgmnEjNjQI5ym50pKAj8maWlbGnMFloo5rSkZJ+3qhlhFzzP5WcPSD
 76IqJN61BaxhwMRNAHKmoIE+qC/mlB40gImyeI6qPQJ4M98JUOSI0zw33g7/oPwQ2MUy
 aMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696229547; x=1696834347;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LnEXoybYZCbjlzX7GnyyOxEnGYbND0k1bA0inBSyCi0=;
 b=k1hR6uOT4zZzu6MCyJbl1eI872GcaIo7d8cmxeVSA6CAEJ1f8XpIfGG/PWIeBVzQIq
 m52T796vQkDqVHiC/npC3cWOLTFIIdnvNj2i4pr//UXRzauiCxXo6HWQ2VD3j0gukGs/
 U08Lfxwx9ACuKdmPeeyxHNEMkCZhSfe8fn8G27HjNjCNHZvvAgD2PssMeJ7WJhZcy972
 X34zOqlcGArxb2DxViXagXdBZVP92+D5VLCsNttk5tJi0EMLaYg8eC51O6vmFC0Bx3uq
 SL5KhQSX7OTNsqfjFQpzr2sJozHuQLhGrpQyoRsqQidf2mBvUFKZapoe7FGtaN1yFbzv
 EOFg==
X-Gm-Message-State: AOJu0YxlYaiHSC+0tcBdDuC1EUPO15YgwwAfF77BkD1bsiAkcv/N1YbG
 XE0vDPm3GOcNmDrVw5yvJHUKVA==
X-Google-Smtp-Source: AGHT+IF73l4FOJP/Vu1SOVBsHPf9hJjRDs8yblJoxiqcG15Ejt82VvMh9CJFFs8ZyPmLYNn0CKNbgA==
X-Received: by 2002:a05:600c:220d:b0:405:3455:567e with SMTP id
 z13-20020a05600c220d00b004053455567emr8761562wml.5.1696229546870; 
 Sun, 01 Oct 2023 23:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b653:7e47:ffdd:9340?
 ([2a01:e0a:982:cbb0:b653:7e47:ffdd:9340])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1cf314000000b00401b242e2e6sm6504319wmq.47.2023.10.01.23.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 23:52:26 -0700 (PDT)
Message-ID: <cd95f9d9-b5de-4d6e-b2ee-1af6dee2c00a@linaro.org>
Date: Mon, 2 Oct 2023 08:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: ili9322: Remove redundant volatle_reg()
 operation
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20231001-drm-sn65dsi83-maple-v1-0-5519799a55e5@kernel.org>
 <20231001-drm-sn65dsi83-maple-v1-1-5519799a55e5@kernel.org>
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
In-Reply-To: <20231001-drm-sn65dsi83-maple-v1-1-5519799a55e5@kernel.org>
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

On 01/10/2023 12:24, Mark Brown wrote:
> The ili9322 driver has a volatile_reg() operation in it's regmap which
> always returns false. This is redundant since it is the default in the
> regmap core, remove the operation for a trivial code size and performance
> improvement.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 61c872f0f7ca..15b81e5228b5 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -325,11 +325,6 @@ static struct regmap_bus ili9322_regmap_bus = {
>   	.val_format_endian_default = REGMAP_ENDIAN_BIG,
>   };
>   
> -static bool ili9322_volatile_reg(struct device *dev, unsigned int reg)
> -{
> -	return false;
> -}
> -
>   static bool ili9322_writeable_reg(struct device *dev, unsigned int reg)
>   {
>   	/* Just register 0 is read-only */
> @@ -343,7 +338,6 @@ static const struct regmap_config ili9322_regmap_config = {
>   	.val_bits = 8,
>   	.max_register = 0x44,
>   	.cache_type = REGCACHE_RBTREE,
> -	.volatile_reg = ili9322_volatile_reg,
>   	.writeable_reg = ili9322_writeable_reg,
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
