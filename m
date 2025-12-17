Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7BCC82B5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6079D10ECEA;
	Wed, 17 Dec 2025 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tLykfCc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787B410ECEA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:25:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3717C4E41C61;
 Wed, 17 Dec 2025 14:25:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0F86072F;
 Wed, 17 Dec 2025 14:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43D28102F0AD5; Wed, 17 Dec 2025 15:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pkkntko0/l/7BPDpuF0pf6izzdbRjFWASUNfjk/Qw38=;
 b=tLykfCc8D14QMzo5lHXkB55+u0S5BekWKurrrTQ12TaKTXYK8xZuAYGpbBVu7BKd7zpYHW
 tXQLY+2YvW43cq//zGcStslA6/n71lkD7YpA0n95OD0wogCaI3biW9gRcx7pLcIrrHoELh
 9LFFGYw2ChnQ5bLoWJ7Wloc1qjihJ8Z9d1Giyn5ZbuaPI3y2C4JeA+6xqMxXeQQq9tumtY
 HM5AMvd0UY0nevNYM4RQKMqUen6y5okHEsX33EBuk341kiXn1Glb2cErAZE4wvcSTNztFY
 7Jtp3iBrD5XcHc6nFWZVZPvKLpJa93SnHfuoHAxry4c3uNuRmowK9ASxCFAvCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:21 +0100
Message-Id: <DF0K7B1PN30B.272AQ4V3PA162@bootlin.com>
Subject: Re: [PATCH v2 11/20] drm/tilcdc: Rename external_encoder and
 external_connector to encoder and connector
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
 <20251211-feature_tilcdc-v2-11-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-11-f48bac3cd33e@bootlin.com>
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
> Remove the "external_" prefix from encoder and connector members in the
> tilcdc driver. These are internal driver structures and the "external"
> naming is misleading. The simpler names better reflect that these are
> the primary encoder and connector managed by this driver.
>
> Also rename tilcdc_attach_external_device() to tilcdc_encoder_create()
> for consistency and to better describe the function's purpose.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

[...]

> @@ -65,13 +65,13 @@ int tilcdc_attach_external_device(struct drm_device *=
ddev)
>  	else if (ret)
>  		return ret;
>
> -	priv->external_encoder =3D devm_kzalloc(ddev->dev,
> -					      sizeof(*priv->external_encoder),
> -					      GFP_KERNEL);
> -	if (!priv->external_encoder)
> +	priv->encoder =3D devm_kzalloc(ddev->dev,
> +				     sizeof(*priv->encoder),
> +				     GFP_KERNEL);

It would be nice to rewrap this and other lines that would now probably fit
in 100 chars. But not that important, so with or without that:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
