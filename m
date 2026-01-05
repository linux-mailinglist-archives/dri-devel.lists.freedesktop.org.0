Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C29CF4F4B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1D010E456;
	Mon,  5 Jan 2026 17:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Lgt1/wWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB010E447
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:18:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 909B01A2667;
 Mon,  5 Jan 2026 17:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5787760726;
 Mon,  5 Jan 2026 17:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 859B4103C85AF; Mon,  5 Jan 2026 18:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767633524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jIBkZttH8UcrhXyn62V/vifYHtr3RdH6TLU19ogc48M=;
 b=Lgt1/wWNFRp8ZDmb4YxYLjkiBRcb7CtoVKmTRMZ07W0U/br6Dh3BJWJMTCYTx3gk9yo5me
 xVBBu3t77YwByxcwFqBpDuk8U4O7hBLh/oP5g71HenWMA4xI7vHRcUm5Z9ZtzOcZVuysNt
 bRHiWBmjoR+i2zexcxaE9zdDtikD61FniAZQJYOp+9QYJkIAd0Z43TNx4bhO2i1havaIzR
 Fppa2taeXE/HzEaPkj85nvh8yN6jO297zAoQ9AVoqAQe1qUyBFvrA5fYX7/bN/TBFseok9
 7iNat9VoBDAXYM3IVTcoqyJz9uKtvjg1NeNZfFNiiqU2vUTkn2Sya1FAGxzOBg==
Date: Mon, 5 Jan 2026 18:18:38 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
 <kory.maincent@bootlin.com>), "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260105181838.1f307964@kmaincent-XPS-13-7390>
In-Reply-To: <20260105172220.2d2edd28@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
 <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
 <20260105172220.2d2edd28@bootlin.com>
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

On Mon, 5 Jan 2026 17:22:20 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Luca, Kory,
>=20
> On Wed, 17 Dec 2025 15:23:26 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
> <kory.maincent@bootlin.com>) wrote:
>=20
> > Hi,
> >=20
> > Cc: Herv=C3=A9, can you review the DT overlay aspects? =20
>=20
> Yes sure.
>=20
> Here is my global review.
>=20
> Depending on the discussion on things I have spotted, I will go deeper in
> patch details.
>=20
> ...
>=20
> > > +
> > > +static void __init
> > > +tilcdc_panel_update_prop(struct device_node *node, char *name,
> > > +			 void *val, int length)
> > > +{
> > > +	struct property *prop;
> > > +
> > > +	prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > > +	if (!prop)
> > > +		return;
> > > +
> > > +	prop->name =3D kstrdup(name, GFP_KERNEL);
> > > +	prop->length =3D length;
> > > +	prop->value =3D kmemdup(val, length, GFP_KERNEL);
> > > +	of_update_property(node, prop); =20
>=20
> I would use OF changesets to perform the modification.
>=20
> OF changesets are kind of atomic. You first prepare all modifications in a
> changeset and then you apply the changeset.
> If something goes wrong, the changeset is removed.
>=20
> Also, if something goes wrong during the changeset preparation, you can a=
bort
> without any modification on the live device-tree.

Ok, I will take a look at changeset to use it to copy all the properties to=
 new
the panel-dpi node.

...

> > > +
> > > +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id,
> > > NULL);
> > > +	if (ret)
> > > +		goto out; =20
>=20
> As soon as the overlay is applied, the driver handling the panel-dti node
> can be probed.
>
> Modifying some properties after applying the overlay could be not seen by=
 the
> driver.

I disagree here. This driver is loaded at subsys_initcall (initcall 4) while
the panel is loaded at device_initcall (initcall 6) so the panel driver won=
't
probe in-between.

...

> > > +subsys_initcall(tilcdc_panel_legacy_init); =20
>=20
> IMHO, the call to tilcdc_panel_legacy_init() will be too late.
>=20
> subsys initcalls are called after arch initcalls.
>=20
> During arch initcalls, of_platform_populate_init() is called
> https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L=
599
>=20
> The root node is populated and handled by the platform bus.
>=20
> Later at subsys initcall, the tilcdc_panel_legacy_init() function is call=
ed.
> This function starts by applying the overlay and so a new node (panel-dpi)
> is added at the root node.
>=20
> This trigger an OF_RECONFIG_CHANGE_ADD event handled by the platform bus.
> https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L=
731
>=20
> If the "panel-dpi" compatible driver is available, its probe() is called =
but
> the panel-dpi DT node is not fully correct. Indeed, tilcdc_panel_copy_pro=
ps()
> has not be called yet.

As said before, I don't think this will happen due to the initcall differen=
ce
value.

> Also, the legacy compatible string is removed after the
> of_platform_populate_init() call. The legacy driver could have been alrea=
dy
> probed.

Same here.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
