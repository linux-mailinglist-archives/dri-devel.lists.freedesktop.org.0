Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042758595E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A28710EB61;
	Sat, 30 Jul 2022 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4C710EB61
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 09:13:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bp15so12164338ejb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F8fhUxE3x4wOe3m4a14najZDDA734PpdZ0zvY9IBgdA=;
 b=ZG2IrV2r1EWLt75BM97iRoI2Fc0pagt70o4R2poxmBf1kaPFF05otKfuGf7gXtlNu+
 /dCPH7viH0STK8OcySYRw+QBBy73BSHjr+CT0al1b+vpb2imlIe74RmeRrf9pQqUJaH5
 TmBS8LD7rue5YdqAeAFvd+htM27uzgkRJKkN/kfIiTlXZVxmf1bjlsTP2BM0P0T1kNv7
 XoxF9QpD+8/TlHICB89Z2XN/1dNWdNao5r8EoIVdL+YOvRB+TDYnU99NpmticLyjn5B1
 8h1LYPxQE/lZczOWieZs/hZZCk2VgzErcnMC5xg6qLsBux25HfhSNtlgrJRdhFhQT/L2
 aydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8fhUxE3x4wOe3m4a14najZDDA734PpdZ0zvY9IBgdA=;
 b=KXImAFs3WXhHjFlVEkIdJOESAHtw7iF4HNJm7KKIVWRqyiUGBkdx9ZiJlv8QNybpxt
 BR8f+QTpXwPrcBc6/2tcBIVQX4sRm0kW114hLEZgi7CcnuG0hQA+JlY3/3ldfl+KI2sg
 jr5CFo6BxTTFMPUv/kt3YHORbu4Q4mwCD5eauB3lPB7/V2DZl/x8Td0bvMwK44s4W0KA
 OgSpAhAz3Ux4tl1vmhTSxUFv/7/be+Z83ViyuD+DbSKv6sBdjYT5ouwsAM1CL7P9VNx5
 +QR1jGUDdF76Vd/uUkWrvELo2ngUCMYq8H/nlsYfZy6jArTYF4QiafJhx4O/cMnAKwpc
 8yKg==
X-Gm-Message-State: AJIora/GB/oCjXYpVL1losfr906GX1bDmlS2k5SFC4NNIoxEOUUMGkSH
 A2D18tSqOrVgDC5MGUF/Rpg=
X-Google-Smtp-Source: AGRyM1vnGZx3SWdOvFK05YcUTuAQpbJMQBq6meu894/eIUroxXOHiUFMsPL5aHg++vyEFuUAzaEVrw==
X-Received: by 2002:a17:907:948e:b0:72d:3fd2:5da0 with SMTP id
 dm14-20020a170907948e00b0072d3fd25da0mr5613928ejc.225.1659172387794; 
 Sat, 30 Jul 2022 02:13:07 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net.
 [194.152.27.124]) by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b0072b616ade26sm1344215ejg.216.2022.07.30.02.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 02:13:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 25/35] drm/sun4i: tv: Remove unused mode_valid
Date: Sat, 30 Jul 2022 11:13:05 +0200
Message-ID: <5587265.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-25-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-25-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 29. julij 2022 ob 18:35:08 CEST je Maxime Ripard napisal(a):
> The mode_valid implementation is pretty much a nop, let's remove it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 94883abe0dfd..53152d77c392 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -497,16 +497,8 @@ static int sun4i_tv_comp_get_modes(struct drm_connector
> *connector) return i;
>  }
> 
> -static int sun4i_tv_comp_mode_valid(struct drm_connector *connector,
> -				    struct drm_display_mode 
*mode)
> -{
> -	/* TODO */
> -	return MODE_OK;
> -}
> -
>  static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_funcs = { .get_modes	=
> sun4i_tv_comp_get_modes,
> -	.mode_valid	= sun4i_tv_comp_mode_valid,
>  };
> 
>  static void




