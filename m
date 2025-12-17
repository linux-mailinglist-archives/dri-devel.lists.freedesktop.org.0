Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D208CC82C1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B204C10ECF5;
	Wed, 17 Dec 2025 14:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YLwG9uu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461F410ED0B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:25:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FC654E41C61;
 Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 030396072F;
 Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92D3D102F0AD6; Wed, 17 Dec 2025 15:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zHGq9IXZnBW7eRUrSpb4u2mpy3tMbvnCqqPzrqz3jkY=;
 b=YLwG9uu4miJcCiS4PauUoFGBmSt4Mu4Of8VQF1/watYpRV/stxgihcWzmBzdtEOqrKg9Ly
 8/oPQA2xCa+x6ofTLP1MFsLEq3Jmq7BU1EQZk/cxjnvqqEYw/JbAN2KBL8cb0USXNPnYCY
 PdFUm+IY3U+L5PZpe2g7/lv4rwmcCF8rWEgIbDglIdKzooK5tEC1D6FSwxw7ybGKQRRB8d
 SE6cn645lDh2cDY7Q0mGW18ZQfeqQkEckS5q30CEGHA996HMzSN1copF7e1hBLEPYStFCY
 1S+mdIgzNdfjxEdTd8RzpiwkgH/uoNYmdLVcz96dyNvfZDEvQB4EkzwI2nhQQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:40 +0100
Message-Id: <DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
Subject: Re: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously supported a sub-module system where
> external display drivers (panels, encoders) could register themselves
> through tilcdc_module_init() and be automatically initialized through
> a module list. This infrastructure became unused after the component
> framework support and panel driver was removed.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

[...]

> @@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driver=
 =3D {
>  		.of_match_table =3D tilcdc_of_match,
>  	},
>  };
> -
> -static int __init tilcdc_drm_init(void)
> -{
> -	if (drm_firmware_drivers_only())
> -		return -ENODEV;
> -
> -	DBG("init");
> -	return platform_driver_register(&tilcdc_platform_driver);
> -}
> -
> -static void __exit tilcdc_drm_fini(void)
> -{
> -	DBG("fini");
> -	platform_driver_unregister(&tilcdc_platform_driver);
> -}
> -
> -module_init(tilcdc_drm_init);
> -module_exit(tilcdc_drm_fini);
> +module_platform_driver(tilcdc_platform_driver);

Is this hunk related to the removal of the module list? Looks like it
should be a separate patch.

With that hunk removed (or kept if I'm wrong and it should stay):
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
