Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D2572DA42
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 08:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA2910E13E;
	Tue, 13 Jun 2023 06:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8730710E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 06:56:37 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686639393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZKzy3DZL34dV/4rckfaL/ei5lbuZ6J/RAunnyrhwJo=;
 b=PyrO7FefkCRxH+UvyRwY6ogpO62qVnrRPUonTwQQkhJewj150SrZ8dgHfieKiIbstGiXEI
 4ztaVnJks+ANaWFKhwbai5EetfKNTx3+6K01gVkqBB2fjo+sBlC4y6/qK+QGLKMbgUgjXA
 dexgrAywnM1+rEZR5SQQeV+qO3wQPiNkAP0X1x0DgcJiNUQbj55VIBcvGkfVVDd3wEUPUB
 qrqF7YfAYrs0pAfZ6+XPT8cl3W682nRRaQ+GH+cjQq95Oxxq4Tb8yIfmH2OkMZZKs6lvjW
 RUvJUz9bU4T6K43BtmPg+ild0j4/BxLjPqtU3wTeRhqUHhgNvgELJ4c7QT2T1A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D115820002;
 Tue, 13 Jun 2023 06:56:31 +0000 (UTC)
Date: Tue, 13 Jun 2023 08:56:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Message-ID: <20230613085630.4a48fa8b@xps-13>
In-Reply-To: <b4ae6e9c-b548-b1e3-42f9-e24aacaf2b38@wolfvision.net>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-2-miquel.raynal@bootlin.com>
 <b4ae6e9c-b548-b1e3-42f9-e24aacaf2b38@wolfvision.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

michael.riesch@wolfvision.net wrote on Tue, 13 Jun 2023 08:15:26 +0200:

> Hi Miquel,
>=20
> On 6/9/23 16:59, Miquel Raynal wrote:
> > The spi core warns us about using an of_device_id table without a =20
>=20
> s/spi/SPI ?

Actually both are accepted in the kernel, IIRC it depends whether you
refer to the name of the bus or the Linux subsystem. Same for picking
"a" vs "an" before "spi/SPI". An attempt to use a unique formatting was
actually canceled because both are used equivalently and I believe even
the spi maintainer and the spi-nor maintainer kind of disagreed on the
default :)

> > spi_device_id table aside for module utilities in orter to not rely on =
=20
>=20
> s/in orter to/in order to ?

Yes, sorry for this typo as well as the two others you rightly pointed
out in another patch. I'll fix them.

> > OF modaliases. Just add this table using the device name without the
> > vendor prefix (as it is usually done).
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c =20
> b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > index bbc4569cbcdc..c67b9adb157f 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -400,9 +400,16 @@ static const struct of_device_id =20
> st7789v_of_match[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, st7789v_of_match);
> >
> > +static const struct spi_device_id st7789v_ids[] =3D {
> > +	{ "st7789v", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, st7789v_ids);
> > +
> >  static struct spi_driver st7789v_driver =3D {
> >  	.probe =3D st7789v_probe,
> >  	.remove =3D st7789v_remove,
> > +	.id_table =3D st7789v_ids,
> >  	.driver =3D {
> >  		.name =3D "st7789v",
> >  		.of_match_table =3D st7789v_of_match, =20
>=20
> May I point to you Sebastian Reichel's series that features a partial
> overlap with your work? [0]

Woow. That driver has been untouched for years and now two
contributions at the same time. Sebastian, what is the current state of
your series? Shall I base my work on top of yours? Or is it still too
premature and we shall instead try to merge both and contribute a new
version of the series bringing support for the two panels?

> For instance, the patch at hand is comparable to [1].
>=20
> Cc: Sebastian to keep him in the loop.

Thanks a lot for pointing this out.

> Best regards,
> Michael
>=20
> [0]
> https://lore.kernel.org/dri-devel/20230422205012.2464933-1-sre@kernel.org/
> [1]
> https://lore.kernel.org/dri-devel/20230422205012.2464933-4-sre@kernel.org/


Thanks,
Miqu=C3=A8l
