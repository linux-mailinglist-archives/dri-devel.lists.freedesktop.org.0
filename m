Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D3CC74F5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 12:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89D410E1B9;
	Wed, 17 Dec 2025 11:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qse9XG/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70C10E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 11:21:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A9562C1A596;
 Wed, 17 Dec 2025 11:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 239646072F;
 Wed, 17 Dec 2025 11:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 844CC119529B3; Wed, 17 Dec 2025 12:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765970466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7rXJhv3+Qdp91MsCE8T/W/8GNjfbg1aKb91evT/R+gM=;
 b=qse9XG/9paLUuioJurweKejSg4mX4HikxkqxBeBa9ofGATh93137vpqHOYGYrCujih6tgU
 OxloSCrNU5QzvnBXefcA8mQXLr99qFipZ8cQUYE8iBwwdnSgLdmzcr1dVf7vvFX0ySrsQp
 eu5ERTNU3RED3iHjBz+pT0yi9+Zf6GjLcARYYnMwakEJSw4arShcw1FtC+EG7e4ubrAHWL
 CZA6uQhwaCH+OCWzu66mey9mLqD+IgJ7twR94o0eW+1/YgJyOj82sagjDnbdjfMdeiQhHD
 ex4Dkn432559Iq5uACTuel1E872z3EUTIxB67j0qUW3lrVUs81ORkyGB7oGs1A==
Date: Wed, 17 Dec 2025 12:20:54 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: display: tilcdc: Convert to DT
 schema
Message-ID: <20251217122054.4682c6dd@kmaincent-XPS-13-7390>
In-Reply-To: <20251216-capable-eccentric-nightingale-b09037@quoll>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-1-f48bac3cd33e@bootlin.com>
 <20251216-capable-eccentric-nightingale-b09037@quoll>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 16 Dec 2025 07:01:49 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Dec 11, 2025 at 05:38:45PM +0100, Kory Maincent (TI.com) wrote:
> > diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.ya=
ml
> > b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml new file
> > mode 100644 index 0000000000000..34ac1fd04d5c6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml =20
>=20
> Filename based on compatible, so for example ti,am33xx-tilcdc.yaml or
> worse case ti,tilcdc.yaml (see writing bindings and writing schema docs)

Oh indeed forgot that rule. Sorry.
=20
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tilcdc/tilcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LCD Controller, found on AM335x, DA850, AM18x and OMAP-L138
> > +
> > +maintainers:
> > +  - Kory Maincent <kory.maincent@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,am33xx-tilcdc
> > +      - ti,da850-tilcdc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> > +  ti,hwmods:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Name of the hwmod associated to the LCDC
> > +
> > +  max-bandwidth: =20
>=20
> constraints? Is '1' valid? Is INT_MAX valid as well?

These maximums values are kind of software only check. See:
https://elixir.bootlin.com/linux/v6.18.1/source/drivers/gpu/drm/tilcdc/tilc=
dc_crtc.c#L846
but there are no mainline devicetree using it. We have to keep them because
they were present in the text binding.

I think we can still add a maximum constraint matching the tilcdc maximum
resolution value.

...

> Drop unused label. Generic node name, e.g. "display-controller" or
> "lcd-controller".

Ok, thank you for the review!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
