Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36B87E91D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 13:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0809110E8AD;
	Mon, 18 Mar 2024 12:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C4aMbNoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82810EB7B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:09:02 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d49f7e5c2cso21182141fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710763741; x=1711368541; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xAybBLkWgFxKDG7sYQQx+lNSx140fHQbpq7UeP5HG4I=;
 b=C4aMbNoQHQTb6RKrBKCKdb+zCfdzjA5+FbekTtVYD9E4+adRnRIeWd3qsOmdXAn3rQ
 nvtmkTFAPip4Det4SGLNz5kEaSiII0Q9Krw2mUzV1IOx4VXRDo8MUixzxVpjbFG82e9s
 70gUQ41qEflsc3E/Y7gB6G7zvitMQcM2EzLmJswhTHVvC/kChBAvWDf66KtzWW2Ayr8B
 xVwprEuZyoqp902mY+Y3la6jXY6vnaIkTAviUe9evrsm4vJwOjpsmgqtb512Z649kolG
 Zo+xLX52xZ5r21ZTJmsrz5CqbPaX6d7vI9QgmqAtlkJoWhMmlUcS2s+CqhuY9lcJcGyg
 C7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710763741; x=1711368541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAybBLkWgFxKDG7sYQQx+lNSx140fHQbpq7UeP5HG4I=;
 b=TvZHSQMgz+8wKdh402TXfjwaDHEAn/A5XezQlGe/UPuUkIq+WJJsH3OsZDQ7n0Prie
 CV8VSXIs7o7Ljm+wE4Vo4JffaVszehruv3KQKZW3A9YjoGpOjMAWjC8RjayDK7f8Odhj
 ReCYguY6ul1PyiypNsR/bWYFAFNOCAPauqHVbzX49cturIW2pITWLe66HjTBKFhD0Nmb
 Law41Jv14VaUU9njT6IslXOb2qM7LEuNhEAJn1nLJMuO1nv5ysQMrsiCDxUguG0Sy0gg
 3gTH2fHooKifrKnJJkSPOQ4h6hMKEYsCzL1wcDE5FOLN4023XluhFJVOFdzW/jqpno5C
 j5rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6K61kuCniuXM6G67IHec8eUKJt++6TB/+WsJk+YhMMMp5eiIwFnn6WL5j2VUSFu1oY2k6Q/Uyz+gSiFF0z3P/uQFO7j7rUjN0lMLmbw8v
X-Gm-Message-State: AOJu0YyuLM9aCl4OeYzkZz1l6ebuv8wS7A5OCBs87h3vZs2PXDb2awMJ
 RrTFq1m11Z2/b0N2BVdM6J047p0SWEwytUCx6ECpdd3HNzH618+4CuvFQZtHarT0ZusTKsPyac3
 3GVU=
X-Google-Smtp-Source: AGHT+IH0Qo1V/USqCdqcNMm459DG/tRzeARTYW0jeYurKwM5uusC9A3CrTByB/OVG1fAn26K2fG9eA==
X-Received: by 2002:a2e:9cc2:0:b0:2d4:8d75:7a69 with SMTP id
 g2-20020a2e9cc2000000b002d48d757a69mr4921690ljj.45.1710763740965; 
 Mon, 18 Mar 2024 05:09:00 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k3-20020adff5c3000000b0033e7eba040dsm9779310wrp.97.2024.03.18.05.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 05:09:00 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:08:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Flavio Suligoi <f.suligoi@asem.it>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 6/6] backlight: Remove fb_blank from struct
 backlight_properties
Message-ID: <20240318120858.GE16260@aspen.lan>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-7-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:05PM +0100, Thomas Zimmermann wrote:
> Remove the field fb_blank from struct backlight_properties and remove
> all code that still sets or reads it. Backlight blank status is now
> tracked exclusively in struct backlight_properties.state.
>
> The core backlight code keeps the fb_blank and state fields in sync,
> but doesn't do anything else with fb_blank. Several drivers initialize
> fb_blank to FB_BLANK_UNBLANK to enable the backlight. This is already
> the default for the state field. So we can delete the fb_blank code
> from core and drivers and rely on the state field.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Flavio Suligoi <f.suligoi@asem.it>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
