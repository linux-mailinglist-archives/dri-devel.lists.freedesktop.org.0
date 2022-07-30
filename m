Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D8585961
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3125210F21F;
	Sat, 30 Jul 2022 09:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2411610F21F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 09:14:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sz17so12155627ejc.9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
 b=I463grYfVol0JRUlt+Ar+SpcJUB4ZO9pNGMk3/6nbERWzXNnIlibdYQ9cGLRUwcdn0
 7fPs1V3TsdNGHjKKB5BGN45EUyF7Wugi7wwhUJ/7OxSNvgtsEo1A8biJVgtzfbXFqgfK
 I2oOZ6oRwBoo7JEE1aAnCwt43GepXKPWGHhnUmmM6ZV+wrcdgIu5wwhgd1X934R+b+PS
 N+pb9eFkY8TnaObP8ZIpEJwsPFxFwSNi9+uy+Ucj9ofrw7BTQe8qYLQRsn56BEQmQhkc
 4Rl8DvXCRHTHsdydiNGH8CZ0PJtM3lIFi7IlIKiKUDGDHkYi4jP9KdDTDjAxBLxSVhck
 XRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
 b=TAEPVGagB9z0Qnbnicc6BVFNIJ+G4c4DXV7aTmU6CMbMLUGT8YkYUcho22w4LkaYMu
 5pj0iO10QSF2spN46/le/1CzQpTxSnaI+uL9WuWgnGBZlfeK3arHsn8EMYKL/oWyO5kf
 B87Pxj/N5hmZW3hJCIPmcCdxxIfE6JY82NPPI5yGHYS6ckQlgL1ytEKy+j/0E5gjb30h
 /roQPJwitMf2/loLcGoaVhN4ts+5yDdy90Q7FKS6RcI/MYzeQoEqMWzDfHXNn2yk3TeA
 MPa/qvt4WGQzrNV2MlFDI66g74w8PxPBCjfaYGKTh01+W+F8gbJanNWGRxNQ20AB3+ax
 gfZg==
X-Gm-Message-State: ACgBeo22oeKuEcUwYBAPShLi/eDNL2E7E6RFzeB3ySt/iFXv3GcaPl3r
 dHwihCyz8O2KGsoU6w88e0A=
X-Google-Smtp-Source: AA6agR4VYJrXZiOXIvhb8G1HuoD3AuMr4cbsju8RIBJv//kfsMPN/cLW/Y0CDv/M1HP7A2m0gTyCfw==
X-Received: by 2002:a17:907:75f7:b0:730:5b01:56b0 with SMTP id
 jz23-20020a17090775f700b007305b0156b0mr145624ejc.689.1659172485555; 
 Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net.
 [194.152.27.124]) by smtp.gmail.com with ESMTPSA id
 p3-20020a17090653c300b00730223dc5c0sm2204354ejo.206.2022.07.30.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
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
Subject: Re: [PATCH v1 29/35] drm/sun4i: tv: Remove useless destroy function
Date: Sat, 30 Jul 2022 11:14:43 +0200
Message-ID: <4754901.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
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

Dne petek, 29. julij 2022 ob 18:35:12 CEST je Maxime Ripard napisal(a):
> Our destroy implementation is just calling the generic helper, so let's
> just remove our function and directly use the helper.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 52bbba8f19dc..6d7e1d51569a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -491,15 +491,9 @@ static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_fu .get_modes	= sun4i_tv_comp_get_modes,
>  };
> 
> -static void
> -sun4i_tv_comp_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
>  	.fill_modes		= drm_helper_probe_single_connector_modes,
> -	.destroy		= sun4i_tv_comp_connector_destroy,
> +	.destroy		= drm_connector_cleanup,
>  	.reset			= 
drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state	= 
drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	= 
drm_atomic_helper_connector_destroy_state,




