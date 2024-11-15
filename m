Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C89CDA54
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 09:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB52810E3B2;
	Fri, 15 Nov 2024 08:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KsbNM5nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2861410E3B2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:17:03 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso25915691fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 00:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731658621; x=1732263421; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t2YkCRNrovYnwQATz/pIkkwhc17h8ivPooAcqDnALro=;
 b=KsbNM5nlk2F1tnordyevVYhI9LeUHz4b8VJSq6riXrYiHXrFERC0qfIwkIFmvlechH
 +xwYFFrRUQ6pyQaDTE4TGI9V5VjVBGLifzJe0cvm2CQ91yTqkOJTT1PjiZrFX9jhsuHx
 z/l5xX6nBxrGjTaLN5CxUs7nVXIwVpgvgAa5iLq05JjRPg0Zt5+MRA+/SNQtc5Cmb6PL
 /6URYdnymHC8hGdelVkTVnCl1Ug7XCDKiw5heJRWQN7imkjeoJPcQOPeVB9QBbRXZQDv
 b4l/0Toh7ULGq9nUlqvEjv9gtj/o9E7WOM+cuOxeoKxozzt1t4PcsklZcgfXsuTYUgR1
 VHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731658621; x=1732263421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2YkCRNrovYnwQATz/pIkkwhc17h8ivPooAcqDnALro=;
 b=nNZ/z3zF4j/thjmjuvbz13swMYf6C6BpMxDkHyvX3xrSGXxz+DqiDeQ3KYQ9ZAGf1z
 ROC8hXxHAhJSpxFiM8Lz9bLgMByXTR2CcxPxMgNP8jVWP2m6SorlJ84N9jse0hHywhFG
 /CdoV7eDN/doDVG30EE3U9Q8CegVDEEO7Dx+iOBvL6Q1jTXINIwy8ViI4gJv6jMINFr4
 +o5hqkIR1jEJ7Mb/5b+6FCRccWJChlx9BeO5kRGc5I+E4dqCrWOAvI2wGnWd7p/rzI16
 Y88I0KQYdSMcKhgcPsKAvlwT5KsbKLVT05nh7DjhxCT1C99SbxXDu6rI1xs9eZ7onH0l
 rOzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVK9E+6wNpKGtHINOr84fd6Hov5NYd6cbUeRa5Gj7ssysmQc+NtaxuoVkXfvH8LAMkikT6n2lPTFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLoIxn3IsE+//mz+MjQhPrF3AoyCVk68vghYT+sCVukjmmm25g
 JwdNphvvXNjsHeca5WCixljW0VIZEbA452s0cGXky4m4KKBk9R3d58h5UqlZQMg=
X-Google-Smtp-Source: AGHT+IEN4mguJ0cOGoaOOQuvKuUUyE9wQYRsThtI0TzLCrOKABBDK14uGJ4xT+Uc6LzV4XrKG3hWMQ==
X-Received: by 2002:a2e:bd0d:0:b0:2fb:3df8:6a8c with SMTP id
 38308e7fff4ca-2ff606710c8mr17810691fa.23.1731658620830; 
 Fri, 15 Nov 2024 00:17:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff598a7c86sm4718441fa.123.2024.11.15.00.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 00:16:59 -0800 (PST)
Date: Fri, 15 Nov 2024 10:16:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Ekenberg <stefan.ekenberg@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
Message-ID: <nramdgi4pziet3ypwdi32zolnhdzualv4rpov372s4mfsakdhs@7qjro2oaef7i>
References: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com>
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

On Wed, Nov 13, 2024 at 08:38:11AM +0100, Stefan Ekenberg wrote:
> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
> while updating Audio InfoFrame information and then set to 0 when done.
> Otherwise partially updated Audio InfoFrames could be sent out. Two
> cases where this rule were not followed are fixed:
>  - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
>    before/after setting ADV7511_REG_AUDIO_INFOFRAME.
>  - In audio_startup() use the correct register for clearing
>    AUDIO_UPDATE bit.
> 
> The problem with corrupted audio infoframes were discovered by letting
> a HDMI logic analyser check the output of ADV7535.
> 
> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>

Missing Fixes tag,

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..8f786592143b6c81e5a434768b51508d5e5f3c73 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -153,7 +153,16 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>  			   ADV7511_AUDIO_CFG3_LEN_MASK, len);
>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
>  			   ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
> -	regmap_write(adv7511->regmap, 0x73, 0x1);
> +
> +	/* send current Audio infoframe values while updating */
> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
> +			   BIT(5), BIT(5));
> +
> +	regmap_write(adv7511->regmap, ADV7511_REG_AUDIO_INFOFRAME(0), 0x1);
> +
> +	/* use Audio infoframe updated info */
> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
> +			   BIT(5), 0);
>  
>  	return 0;
>  }
> @@ -184,8 +193,9 @@ static int audio_startup(struct device *dev, void *data)
>  	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(0),
>  				BIT(7) | BIT(6), BIT(7));
>  	/* use Audio infoframe updated info */
> -	regmap_update_bits(adv7511->regmap, ADV7511_REG_GC(1),
> +	regmap_update_bits(adv7511->regmap, ADV7511_REG_INFOFRAME_UPDATE,
>  				BIT(5), 0);

Should the REG_GC(1) still be written?

> +
>  	/* enable SPDIF receiver */
>  	if (adv7511->audio_source == ADV7511_AUDIO_SOURCE_SPDIF)
>  		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
> 
> ---
> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> change-id: 20241108-adv7511-audio-info-frame-54614dd4bf57
> 
> Best regards,
> -- 
> Stefan Ekenberg <stefan.ekenberg@axis.com>
> 

-- 
With best wishes
Dmitry
