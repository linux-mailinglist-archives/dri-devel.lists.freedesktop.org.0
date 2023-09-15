Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8597A1C48
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552A10E60C;
	Fri, 15 Sep 2023 10:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1365910E60C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:32:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31fc91d5ca6so1854043f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694773948; x=1695378748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=V0aca7PnmjAHHqfJ62cWuej3CDSoPPa06Inr7vVa8Ts=;
 b=HB3c1QMFjCA0RIE8drSx7nhWATl4ug5bHPseNcO14inlSowwPHUZj+kPahRhqVpMs8
 7pnDiBdhw2d9m1stqJN6MZvh+ZZFJGXS3sool62Zh//pUBTy5tvY554NVQLEkFRR7bc1
 ZtPM1pZGQc4/Nz+491gu8UUsRITjWERdvzZAm4MM0iY9HIjRqTVZbOE4aPFE2qkw41ZW
 BPfFFxKtCcR8yqlsn/JK0z8B9mo5y6wNcA5BL1wSln8MMLCtltQmLHwC474bcNYDhc51
 uFBZ9Da9qDV37/32a1IX+Q6mMQQDFUXkLAMRix8k/vUV993mKtwhgPg460dYDzxhCpoG
 jYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694773948; x=1695378748;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=V0aca7PnmjAHHqfJ62cWuej3CDSoPPa06Inr7vVa8Ts=;
 b=ekBiU/NvzaTl62rjXHBVLUp0a2Rg+wFCoS9gGQlqNiCZ9UxnEtuf+0SI4D2BlQ5i1J
 /cX/lA6cjI51LY+cfAXLvHDqv/IVU/uOc4XbJNdAgy8MvYql4h1SLhg5Q3iEtorPz9jf
 KOkUGvT1dGhGviUrvLp/2QqtLpVrRvpiOgmodIzN3KAfX2dONaJr9k18mgkheehS9C+G
 ktpuG6v7YmK2AdHI3MvibRhrMy07dJrtWmJTz0+nILx1/snreZHb+r2+bNqfkJjxdObh
 4WIwcuv/ZMUN5hTFadLB+mBNR6DnDgNP0iXbnP+kXMY1NuKuS9Mo+D5laA8+CV4LWTs8
 qYDQ==
X-Gm-Message-State: AOJu0YxP1BPa+8li5K9m1bN5486XBUq1BxqNaLKNwc0Tk/l7tHl9WDz9
 ioz3jHWz2k3SNpeUvqcbyAk+ZirjQj6DLeJ1Teqhemub
X-Google-Smtp-Source: AGHT+IFybQKfEBpNlItCVpee/8rq+0HFpuzq/V78nKm58xypS5dbiUu0yQcIrVjidKY6MOBSpi12bg==
X-Received: by 2002:a05:6000:1f89:b0:31f:f72c:df95 with SMTP id
 bw9-20020a0560001f8900b0031ff72cdf95mr754975wrb.21.1694773948559; 
 Fri, 15 Sep 2023 03:32:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:990a:74e6:266e:2294?
 ([2a01:e0a:982:cbb0:990a:74e6:266e:2294])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b003140f47224csm4046204wrr.15.2023.09.15.03.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 03:32:27 -0700 (PDT)
Message-ID: <4de57018-e7fd-488d-b564-a79176b79fc6@linaro.org>
Date: Fri, 15 Sep 2023 12:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: it66121: ->get_edid callback must not return
 err pointers
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230914131159.2472513-1-jani.nikula@intel.com>
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
In-Reply-To: <20230914131159.2472513-1-jani.nikula@intel.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 15:11, Jani Nikula wrote:
> The drm stack does not expect error valued pointers for EDID anywhere.
> 
> Fixes: e66856508746 ("drm: bridge: it66121: Set DDC preamble only once before reading EDID")
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: <stable@vger.kernel.org> # v6.3+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> UNTESTED
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 3c9b42c9d2ee..1cf3fb1f13dc 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -884,14 +884,14 @@ static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
>   	mutex_lock(&ctx->lock);
>   	ret = it66121_preamble_ddc(ctx);
>   	if (ret) {
> -		edid = ERR_PTR(ret);
> +		edid = NULL;
>   		goto out_unlock;
>   	}
>   
>   	ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
>   			   IT66121_DDC_HEADER_EDID);
>   	if (ret) {
> -		edid = ERR_PTR(ret);
> +		edid = NULL;
>   		goto out_unlock;
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
