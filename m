Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF077943E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39F810E6B4;
	Fri, 11 Aug 2023 16:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D8D10E6B7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:21:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso3373482e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691770906; x=1692375706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZLDri0jvZJfj7mGD0JyPOhugI1LYfhwOtVS/jje4bxA=;
 b=K9rMRoupby6QdTPnm22QVt5NzSt/YP/r9okFLwJvRrhVXZiqVNOZ1dq8TnOucVQjBW
 lAZcluiy5zc+y1mRQXUXdv/ndVf8KB7Mdr2PGu3vpxQA1XwTTlI1bfPwLRcfsHUHXMK0
 kUUg0PODHCklG9X/zmHpTtiwGUG0zOwfdHujTA0BSZlkxmo5n2ngFpMLQTJ9kcRcA7sc
 8lT3N55G/tdwV7smH6BUcXFXaGqGQRY7MrhTv3dq36NgMTjNWEUAmFRuJ3/TjPpSomnr
 2zlykM+XnorW9sQvww2yWd9mTPC5DJJjPGcUkbf4Q/t5roooiXHnj+pJ4Ju+u8pF6L9W
 s4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770906; x=1692375706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLDri0jvZJfj7mGD0JyPOhugI1LYfhwOtVS/jje4bxA=;
 b=l6E3tTaz7JEjlVdJFMT0uw3igDTRaN0SnXZnOwoFRpGIIax7et4gh7AdhXTjZhNfvJ
 rr6G36jEomLecTjrXM/25mob9SlpxLndQy/oJ2NzD1M47hzPRSxbisGFOv599uVJy009
 OOc8MDEKeG9i/AN70SpQ5OwIX9hmIJbhFhbuF1oSo7cep1i1kkf9Nq5E4yL2GSmuU4g9
 tcv9YwPh04JXLzwo5hL7DSzpXuG5/62INK2UOjQMh1FybeCVrzPNReuSFKQRx6k498KD
 1KY9+HZGSWwJ9K7IhmHPpy43IiYjMxzRVd6zsJcAmjJE9gCYRNUy+GOmfhnqTJafosWE
 6jeQ==
X-Gm-Message-State: AOJu0YyD9qNAS7uI8P5WSxYS27QtGeZwo2u2Ks2Ey8xHZRANqOqx0OGw
 YkrTAn3VwhAqCvAqokgjX54=
X-Google-Smtp-Source: AGHT+IGuQWDDOMFGid/bM+iY6jyj/AI00a6xZWHcx+lJToKGyKs2rPO2yFJtbfVUKprVCx1jF1zukg==
X-Received: by 2002:a05:6512:39d3:b0:4fe:5860:7abe with SMTP id
 k19-20020a05651239d300b004fe58607abemr2218937lfu.7.1691770905786; 
 Fri, 11 Aug 2023 09:21:45 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 q17-20020ac246f1000000b004fe5608e412sm780128lfo.170.2023.08.11.09.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:21:45 -0700 (PDT)
Message-ID: <cd5d39a2-4f4c-419a-8137-d2719135e205@gmail.com>
Date: Fri, 11 Aug 2023 19:23:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/bridge: tc358768: Fix bit updates
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-2-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-2-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/2023 13:44, Tomi Valkeinen wrote:
> The driver has a few places where it does:
> 
> if (thing_is_enabled_in_config)
> 	update_thing_bit_in_hw()
> 
> This means that if the thing is _not_ enabled, the bit never gets
> cleared. This affects the h/vsyncs and continuous DSI clock bits.

I guess the idea was to keep the reset value unless it needs to be flipped.

> 
> Fix the driver to always update the bit.
> 
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index bc97a837955b..b668f77673c3 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -794,8 +794,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  		val |= BIT(i + 1);
>  	tc358768_write(priv, TC358768_HSTXVREGEN, val);
>  
> -	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> -		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
> +	tc358768_write(priv, TC358768_TXOPTIONCNTRL,
> +		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
>  
>  	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
>  	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
> @@ -861,11 +861,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	tc358768_write(priv, TC358768_DSI_HACT, hact);
>  
>  	/* VSYNC polarity */
> -	if (!(mode->flags & DRM_MODE_FLAG_NVSYNC))
> -		tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5), BIT(5));
> +	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5),
> +			     (mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIT(5) : 0);

Was this the reverse before and should be:
(mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : BIT(5)

> +
>  	/* HSYNC polarity */
> -	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> -		tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0), BIT(0));
> +	tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0),
> +			     (mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIT(0) : 0);
>  
>  	/* Start DSI Tx */
>  	tc358768_write(priv, TC358768_DSI_START, 0x1);
> 

-- 
Péter
