Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1484C149F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDAB10F6C7;
	Wed, 23 Feb 2022 13:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668B210F6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 13:48:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id BFAB958044A;
 Wed, 23 Feb 2022 08:48:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Feb 2022 08:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=hhzQuAP5h32D6MnSEhxXlUwNzkXcHYulOY6y2A
 CCY7I=; b=QLUW+WD3aAhsLBvTdEYmSzbIQvEqecEIbqMxvNBVW/MyyZBDj9v7wC
 /SU9rHHCl3vOKi5HxuUrCPEVotH1zbrorZMqbO5CcIabGGE7hCUQ8k7xO2F0qJ0z
 bczO5GRAh9FVmGhIy7YyXSq/35aBwXJfF7H76OQkbip0tZsa3NvlBbKRzG9JMEFp
 M2zxG3cPo/5uO+NLfIx4JLeRnWWADwGlQfanXSUcsGk6MIs3rg3XbfwCbe85XwyL
 DtUJ85YqtYa95uIMydxla77u7SUR+1xanKSsdqu4GyuzpyfNlMiEv8aTQgIkmmOs
 y695s6Jdao3f39D6JXlOni12gj18d1qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hhzQuAP5h32D6MnSE
 hxXlUwNzkXcHYulOY6y2ACCY7I=; b=nVkHpKCnVcGpjtCTpoZxRnF4d2pBWn/2m
 4ISi4iG6ab493DhmbVVcwPNnaWGlQqoDqT3yxQL11AD4uCSz29e9A6Lt3aQkohBz
 aYlxIKWIuLtBWaYh15J/jkSSHoxA0uRYv6kziVDFnJGnUMpbZdNnbTjiGQcUwQzH
 BHhIyAitd5UdIRfwuphbea87DFb8i4W9RbF2v3pVUOFR2i3sbNb964psxbziDKdl
 kcw8B7NGCxh92+XxSoKVzYsulaMu1bMVRkV6DDb5/ysTO78i6jEzuRhiwzMY773C
 WiWudvLr3/uBraGPudL0OGEDU338DrkwJZ4Sd8UygUQYI0j5K0F0w==
X-ME-Sender: <xms:DzsWYhTLhC68tmFOsyZtUnGTdquI2YSGDaPEFIn-vtCZj-3scXD_ow>
 <xme:DzsWYqyLZPNImnzqaBuZs6oyt4eg2JTUAYDQCJEorFlj8QE0fHN8Y_GkHFzIZnCD3
 D7zX1dNxqATc5PO5GY>
X-ME-Received: <xmr:DzsWYm1YPNmUYOyXC1-eSD_-oLPNcMzLq1vo9w9Y6MWcFYy9pOZ9rrTIMKp9oOGXQoZMe5IHXVf53NRLWeba5wzP0DJ8bF3xl370k_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DzsWYpAAgwWSEFmErI917lQr7RDDt7zVewbXTuGcNqTMILIsrjyMxw>
 <xmx:DzsWYqhhTKxW2l3-D0hjB6H9SCkdmB7BHx_9VQ4E_4Rs-6FPL3a6gA>
 <xmx:DzsWYtogCTTKNlPoxKihceMHvffYnem9MzoU7l94r82WTnXqS7TU-Q>
 <xmx:EDsWYuyZoclyIkjwQ9Z6mxw2k9r58Iqv2kEawfZeflT1K_IjErZLfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 08:47:59 -0500 (EST)
Date: Wed, 23 Feb 2022 14:47:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220223134757.f5upi2iun27op5w5@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cdjboleowr56kila"
Content-Disposition: inline
In-Reply-To: <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cdjboleowr56kila
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 02:45:30PM +0100, Marek Vasut wrote:
> On 2/23/22 14:41, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
> > > Use the new property bus-format to set the enum bus_format and bpc.
> > > Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi sup=
port")
> > >=20
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >=20
> > > ---
> > >=20
> > >   drivers/gpu/drm/panel/panel-simple.c | 32 +++++++++++++++++++++++++=
+++
> > >   1 file changed, 32 insertions(+)
> > >=20
> > > Relates to the discussion: https://lore.kernel.org/all/20220201110717=
=2E3585-1-cniedermaier@dh-electronics.com/
> > >=20
> > > Max
> > >=20
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index c5f133667a2d..5c07260de71c 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
> > >   	struct panel_desc *desc;
> > >   	unsigned int bus_flags;
> > >   	struct videomode vm;
> > > +	const char *format =3D "";
> > >   	int ret;
> > >   	np =3D dev->of_node;
> > > @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
> > >   	of_property_read_u32(np, "width-mm", &desc->size.width);
> > >   	of_property_read_u32(np, "height-mm", &desc->size.height);
> > > +	of_property_read_string(np, "bus-format", &format);
> > > +	if (!strcmp(format, "BGR888_1X24")) {
> > > +		desc->bpc =3D 8;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_BGR888_1X24;
> > > +	} else if (!strcmp(format, "GBR888_1X24")) {
> > > +		desc->bpc =3D 8;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_GBR888_1X24;
> > > +	} else if (!strcmp(format, "RBG888_1X24")) {
> > > +		desc->bpc =3D 8;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RBG888_1X24;
> > > +	} else if (!strcmp(format, "RGB444_1X12")) {
> > > +		desc->bpc =3D 6;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB444_1X12;
> > > +	} else if (!strcmp(format, "RGB565_1X16")) {
> > > +		desc->bpc =3D 6;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> > > +	} else if (!strcmp(format, "RGB666_1X18")) {
> > > +		desc->bpc =3D 6;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> > > +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
> > > +		desc->bpc =3D 6;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> > > +	} else if (!strcmp(format, "RGB888_1X24")) {
> > > +		desc->bpc =3D 8;
> > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > > +	} else {
> > > +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
> > > +			np);
> > > +		return -EINVAL;
> > > +	}
> > > +
> >=20
> > It doesn't seem right, really. We can't the bus format / bpc be inferred
> > from the compatible? I'd expect two panels that don't have the same bus
> > format to not be claimed as compatible.
>=20
> Which compatible ?
>=20
> Note that this is for panel-dpi compatible, i.e. the panel which has timi=
ngs
> specified in DT (and needs bus format specified there too).

panel-dpi is supposed to have two compatibles, the panel-specific one
and panel-dpi. This would obviously be tied to the panel-specific one.

Maxime

--cdjboleowr56kila
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhY7DQAKCRDj7w1vZxhR
xR6DAQCeCEQFyi57XJY0ICed8QAOIFjmZZavX/pIn+FYJkisXAD/WvNcAjcvrah7
Z51HWYrhpXU0I4IvJDHJv17Hu2PlJwY=
=iSlM
-----END PGP SIGNATURE-----

--cdjboleowr56kila--
