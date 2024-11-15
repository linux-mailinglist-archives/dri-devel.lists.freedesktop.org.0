Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851529CDA41
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CBE10E3B0;
	Fri, 15 Nov 2024 08:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xKB4YRgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4303010E3B0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:11:02 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso1704872e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 00:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731658260; x=1732263060; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kwh7u5xnnm/NWxOJAx++yyoRAoW1uEF+MIYvUvWu0a0=;
 b=xKB4YRgcsb0GZQ1JEKo3v/og1WuHy6lJOmk3YzfU8HpnPnjh9i+Ji1vyjJCEgpaXxA
 pCvBmfzQngBV7Nkpq/gUKEDfjBw4GaLJGqPTt4ereyR6X7RXeS0+w0NSnvqJkW6/vbn5
 57GhnnfbCVDpduNOHCYD+ZGdf0Ma/xUWn3BXO0QAHeOwlWIVAIgmwIkbRvjJPfZ1msvO
 fUR9mHTCZfsH/33Cffo3AQHcgp7Osn9lTI3vZucUMIjdXdBDsOPPF/QVKkiiS3lHEPX2
 5pmi3UQe0wPJUdISUHga8NdpBX0PIvEkgBGc92qxUpVyD5kS6K2t7oyfKXSU6I37Ptic
 9GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731658260; x=1732263060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kwh7u5xnnm/NWxOJAx++yyoRAoW1uEF+MIYvUvWu0a0=;
 b=hYztEJ5lpulkeEwNvQDjDbhjJgLz1q7me6/++7zOJM93+Q72eG8plH2jfZ0Kg5SOgP
 CmUjpg6AX7/Ar0hoYXOWrV6TyLD0uzBCdeGrqpYG/kssCbuFpD3dzV0b7RM2PfrRJW/T
 QYKRrS0Vyi0IuD6pDh8kDaxXt/DhOnSkSIq0nzrJAP75+vWK4QKv9umu+irNTnMSLvJS
 P25Gfg2Q0fnMkrDbw7q39J01MvVM7w5FaSiz1uXML/1hiXkQQKJ/+OqIWETIzSfefq8I
 5EOepq4JpbcpU1hLPcsK4qDPbVGffTWA271g0/2oCnhYfei6tfzrR2Ny4pbHIppxAMgR
 1wVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbMUO7+U1xqByXlW11znN8C48S8AuVLBx0P9tSX2BKVl4hfoiK9qnPesmaRvqg9WNSdLabeS36Qgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6N9aQj54gMr34YMcrVxNCZtq2QNZOGYM8XTgm5TeQpYZg/Bzv
 TmNLOXlWfKlpJP0knPAT3o0Ssf37zBKPC+TumP5u2xm8Lcvq+DZCTADtRnvS488=
X-Google-Smtp-Source: AGHT+IHxTCDUm2pw5A5a5bUpPHRsLv6nmhaSD0bEck6bFFxWDkqDt7K6yt+BTsbtTKUO/0vNYYpGoQ==
X-Received: by 2002:a05:6512:3d23:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-53dab2a6feamr638144e87.29.1731658260231; 
 Fri, 15 Nov 2024 00:11:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da653e1a9sm477797e87.185.2024.11.15.00.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 00:10:58 -0800 (PST)
Date: Fri, 15 Nov 2024 10:10:56 +0200
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
Subject: Re: [PATCH] drm/bridge: adv7533: Reset DSI receiver logic
Message-ID: <hukcjydehdbkk4xn3c62au4az4tlfjlkmxhq5db5xwabvxhyba@nf5tzddcbikv>
References: <20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com>
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

On Wed, Nov 13, 2024 at 08:40:15AM +0100, Stefan Ekenberg wrote:
> Reset DSI receiver logic during power on. The need for this change was
> discovered when investigating issue with ADV7535. The symptom of the
> problem was that ADV7535 continuously outputs a black image. This
> happened for about 10% of the times that ADV7535 was powered on. The
> rest of the times the image was as expected.
> 
> The solution in this patch (placement of reset and sleep time of 200ms)
> is implemented as outlined by the Analog Devices support team.

Is this reset sequence specific only to adv7535? Is it applicable to
adv7533? adv7511?

> 
> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..93085c2b872ed98f4ee394236dc66c568c0e5ccf 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -67,6 +67,15 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
>  {
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  
> +	/*
> +	 * Reset DSI receiver block logic to avoid ADV7535 startup problem.
> +	 * Without this reset it sometimes continuously fails to receive
> +	 * incoming DSI packets and outputs black image.
> +	 */
> +	regmap_write(adv->regmap_cec, 0x26, 0x18);
> +	msleep(200);
> +	regmap_write(adv->regmap_cec, 0x26, 0x38);
> +
>  	if (adv->use_timing_gen)
>  		adv7511_dsi_config_timing_gen(adv);
>  
> 
> ---
> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> change-id: 20241108-adv7533-dsi-reset-488c6fbb5e42
> 
> Best regards,
> -- 
> Stefan Ekenberg <stefan.ekenberg@axis.com>
> 

-- 
With best wishes
Dmitry
