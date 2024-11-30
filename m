Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43D9DEFB5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9304010E5C5;
	Sat, 30 Nov 2024 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hjERwQIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5FB10E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:54:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ffc380b1d0so26050391fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732960455; x=1733565255; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9Lc9DfCXaFvHVBMdEeSwVvJlevNEtc41NoCu48KM7Oc=;
 b=hjERwQItGZC2/FDyjGw+K4xazT9U1u5lNSoxlgrPYyHze0C1rMY+QKojL0/AlLW/a9
 rEnb6Bl6i60skAUHREmgR68erauIixJTb4+2j2IHM9Cr+VwdB/BLyikTcUMSwZgwR+66
 LQY5mX9Q7OEXxs02TXhP/iDpK4YbGJY/f0AY6My9j36rlFih+EgZovAlRtUJ9ONzRyiS
 UM0ynjWpcoD26Pt6IkvbLgkQUia1EqTczl5ZnGjBrXAoTp/5VQXCZaRxYaDj32qWOXFt
 8ULvVMMCjZndWsabHEYCBglZZVykZagEvbD8GY0ydvmAOe2t0rpkjPMdpW5JW2IvcX5O
 h8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732960455; x=1733565255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Lc9DfCXaFvHVBMdEeSwVvJlevNEtc41NoCu48KM7Oc=;
 b=jmjWva5Y4TTVbaH032XPXKXX4UwCwPNpvIY4pb0vI5rwWFvO4CKEV4rngAfgYtLMzB
 SU+5cPfEzR6jmQgwiYNL8Zcl4rLesDg56PT679h17p6mFR4hwFdMfhhAu9IH5QQaq76S
 cxbHRO56N+SQjXcd41XVdc1KGsvTTU/5ewFDJ1gTNHfQbVHFoS0vUaR8213TazSSPObu
 97deu3RKyJQTEm8iDNh/KNrewXBaA2+f6bqpY50fMzoFhS+tEUrZ3yxyn8dwfKaVD7fN
 civ2rJzYUxTsXzjgqM+0pxmvkvhhFZZgsaoyUmoShb4F5Q+ruXigtVPB+lomxjvuHvMj
 4LSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU10GLgntXs4BSmW1ZwdRxx8OptzGkp1IkUOIya0BsfQhjPvZsWw/9JPVweK0YcRnDE//dmvRK+Noo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPVIxe+nqpFPXp5w+MF+/AiVUR0JtY4aKmYGM2IwDZmCnjoGFu
 DFNIoW0604qIrknH+j/HysYo/I8FYwiC5lIb3i5U8GJw0XDF6M2QgM+O9NL10ks=
X-Gm-Gg: ASbGnct0CE/CB6F4wobF71MC8cxtT3pXeVJPDHqJtrYr/uRmnK6rIkSiNktZiILV84/
 jtvaEPQnCt6rnfboHdDrxf07tOkbLRgGH4HTk2/IYzmL6ig58EMQnEIatBnKjkxlopMnR0l2Q7+
 Xgg9d2AGp2LZDQBKjfG8Xa0FaFfK5L3F9ZUxH5bZlWOz7Z9CaaTdCYl8OZrkfifYGWcbXFp4mn9
 xg8vp0O+WElqZPor6wXes4KGsODv27satVEiZr9P41Q6e+hqeu9EtZ8pUXYuMfyVOnrpB2d+Cs0
 SFyTP43nPHYlL0xCzmTJOlG8W4YsCQ==
X-Google-Smtp-Source: AGHT+IFkfMrwigSf+zgzstB/hgJoOKRZVbjeqFCsdGsPsNseLBJrUIenMSlGkjvt/K+9OUdn2YEiGQ==
X-Received: by 2002:a05:651c:2220:b0:2ff:d728:bbc1 with SMTP id
 38308e7fff4ca-2ffde1f3281mr37422461fa.5.1732960455087; 
 Sat, 30 Nov 2024 01:54:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbb8f59sm6538471fa.17.2024.11.30.01.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:54:13 -0800 (PST)
Date: Sat, 30 Nov 2024 11:54:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Bauer, Markus" <Markus.Bauer2@avnet.eu>
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "airlied@gmail.com" <airlied@gmail.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] sn65dsi83.c: fix dual-channel LVDS output also divide
 porches
Message-ID: <4iow25webuwskjbx6gfft45x3jhxvg3diulfpjzonesgjmszhz@dk54ylmq7tnd>
References: <BE0P281MB0211EB59ADE02F4DB8F9D0CDC22F2@BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BE0P281MB0211EB59ADE02F4DB8F9D0CDC22F2@BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 26, 2024 at 09:42:45AM +0000, Bauer, Markus wrote:
> sn65dsi83.c: fix dual-channel LVDS output also divide porches

Please use drm/bridge: ti-sn65dsi83: as subject prefix. Drop the first
line of the commit message.

> 
> When generating dual-channel LVDS to a single display, the
> horizontal part has to be divided in halves for each channel.
> This was done correctly for hactive, but not for the porches.

I don't see this being handled for hactive. Could you please point out
the code?

> 
> Of course this does only apply to sn65dsi84, which is also covered
> by this driver.
> 
> Cc: stable@vger.kernel.org

Also:

Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")

> Signed-off-by: Markus Bauer <markus.bauer2@avnet.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index ad73f69d768d..d71f752e79ec 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -399,7 +399,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  	unsigned int pval;
>  	__le16 le16val;
>  	u16 val;
> -	int ret;
> +	int ret, hfront, hback;
>  
>  	ret = regulator_enable(ctx->vcc);
>  	if (ret) {
> @@ -521,12 +521,22 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>  	le16val = cpu_to_le16(mode->vsync_end - mode->vsync_start);
>  	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
>  			  &le16val, 2);
> +
> +	hback = mode->htotal - mode->hsync_end;
> +	if (ctx->lvds_dual_link)
> +		hback /= 2;
> +
>  	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> -		     mode->htotal - mode->hsync_end);
> +		     hback);
>  	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
>  		     mode->vtotal - mode->vsync_end);
> +
> +	hfront = mode->hsync_start - mode->hdisplay;
> +	if (ctx->lvds_dual_link)
> +		hfront /= 2;
> +
>  	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> -		     mode->hsync_start - mode->hdisplay);
> +		     hfront);
>  	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
>  		     mode->vsync_start - mode->vdisplay);
>  	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
> -- 
> 2.34.1
> 
> 
> --
> Markus Bauer
> 
> Avnet Embedded is becoming TRIA:
> www.tria-technologies.com
> 
> 
> 
> We continuously commit to comply with the applicable data protection laws and ensure fair and transparent processing of your personal data. 
> Please read our privacy statement including an information notice and data protection policy for detailed information on our website.

-- 
With best wishes
Dmitry
