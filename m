Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B8783D1E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBDA10E1C9;
	Tue, 22 Aug 2023 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32FF10E100
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 22:22:14 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a06f5f556so2093184a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692656533; x=1693261333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8zs5R1yv/FPCc0JPFhm89lCNeRIwrocWVxU6CC7ui0=;
 b=aX1O8VRczlfYN55hMC9NizKEq6XP2KZ1MedjYMOwsNNaZqHHO7zteuJstI18Qzmo8B
 /09YKlXzzxqdgJXfK64tCudVfaMtNf9JpBWv4zc7mGQtpfIMX0TpiPA+X7uAH0NUHMXT
 klFLHCFC7/eXhO4iSd248tHO0yUKqHT9FcLiKw66QLF03G4p3/WblRGEiNNJWABI68q3
 E8/ZQVNPB1JQG3y/S6tifNqYXVLESMjmjzKJ/f1KvqzVhUTq3cbONtINqVw2Edbxu7s8
 YMqgOFIiasfpAxhc6ETL4H3GvMuRNY9ciXmuCvyW/nbSFJ5ViL2RYWMfO2yy91Szrlxy
 9QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692656533; x=1693261333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8zs5R1yv/FPCc0JPFhm89lCNeRIwrocWVxU6CC7ui0=;
 b=bebkntaq8y1Nq24rzSoU8ubJ1bTTLGa9yFlILi9VwRLBrv+m6Bhd/5otlFCiE8yd7O
 F6iVibe9vYTG7eJL2D009A0Z/LXekwhkGA3ZZaYxTzfA8aFE+lZ7diLeQ5eLxhKAzGPZ
 5ZOjX9GOjW7/ODMRpHvnMKbY/O/hn6wStPrwzFki4moUeELGW13gEa8CLeVR6uJV7nbw
 warGgfSA5Bftkqpzu4it5BuOEV01ySvAinHGdv5A0PFknnGI/mOY8QFX8oj98ymLMVch
 DQDNskFIfESKdbzNe/o3Dii334yFdmaR9WSbsGLhG0GWsT5OhIpy8y2kGg8kRxLl5i0H
 6t+w==
X-Gm-Message-State: AOJu0YzhUdmTEsGPab6l92Cbb0/GktzVZOPUD82bLQstSBNs0D0oXnVJ
 7+CNsDU8BvtlXh3bBGlL2ow=
X-Google-Smtp-Source: AGHT+IF5NxI8c2iIaQO4DJRWJO32K+wmKFB3dnLH0kyVDdKeGGFX6PVfm2bhqonftzV7Wx2jeCnVjg==
X-Received: by 2002:a05:6402:1206:b0:51e:5251:8f45 with SMTP id
 c6-20020a056402120600b0051e52518f45mr6838098edw.4.1692656532949; 
 Mon, 21 Aug 2023 15:22:12 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:ab60:7575:6541:6820?
 ([2a02:908:8b3:1840:ab60:7575:6541:6820])
 by smtp.gmail.com with ESMTPSA id
 u9-20020aa7d0c9000000b00523a43f9b1dsm6528035edo.22.2023.08.21.15.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 15:22:12 -0700 (PDT)
Message-ID: <e151e29e-7dc7-e237-aeed-4005911d9583@gmail.com>
Date: Tue, 22 Aug 2023 00:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/12] drm/bridge: tc358768: Fix bit updates
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
 <20230816-tc358768-v2-3-242b9d5f703a@ideasonboard.com>
From: Maxim Schwalm <maxim.schwalm@gmail.com>
In-Reply-To: <20230816-tc358768-v2-3-242b9d5f703a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
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

Hi Tomi,

On 16.08.23 13:25, Tomi Valkeinen wrote:
> The driver has a few places where it does:
> 
> if (thing_is_enabled_in_config)
> 	update_thing_bit_in_hw()
> 
> This means that if the thing is _not_ enabled, the bit never gets
> cleared. This affects the h/vsyncs and continuous DSI clock bits.
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

shouldn't the last patch of this series be moved before this one?
Currently, this patch will still lead to a temporary regression until
patch #12 is applied.

Best regards,
Maxim


