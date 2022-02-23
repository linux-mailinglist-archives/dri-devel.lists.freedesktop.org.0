Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00E4C1584
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823B10E9AF;
	Wed, 23 Feb 2022 14:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747CB10E9AF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:37:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 45D9A58019B;
 Wed, 23 Feb 2022 09:37:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 23 Feb 2022 09:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=U1ztKaGkOzZJFAZ8G4o9Wx8yE8iWLSUjP9RjAb
 wql68=; b=sjFTMA9zm3lHctp0NjjQmmQB9RkDqqFIPIkZK3ZN9+Tt822gVCDVEq
 Avd/9ZObUfkyYeFjMTfugiGfiwuqC20CER7y54zzLLu4U4UxqM+TmRbWgx4rCjh5
 CMzR7oOj+GBD4DPXovkAmya+GAU3CzDvWmDK5jwG7rlFNKn6r97tFGMIkrJHNRFI
 ehnyuoTOIpklwuGAQqOsPlqiXTjnpbScPOjtrx4q0VLRdkbnghHjynqBMHbLG6cw
 eBq5bdpXSbyY1dFi5NfenPMCOF6lip+Kzow6jm0BQuT1QsyWqh8xmZOlc/N1T8ZR
 uf6qL7DvhiykzwBr1/GjuZdIRburDJ1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=U1ztKaGkOzZJFAZ8G
 4o9Wx8yE8iWLSUjP9RjAbwql68=; b=FREHTqGOFi/nJplcCGWuhl4burgmXu1+T
 y7gdr1L4Yacgd/QCTVo/Wr5kXTaKO0CMM0QLhOrTWDhMwFJlZYu2++29EzC9NGjT
 fFJeO8zOGM7ohBUCP4/IFK6pNvYRnT8SWKS2T9q8llwlskaiR7NmDgEAImfPmN3o
 f7ZhNHAWp/ybZbILFTYbHgJYSLUSxYdz0hBbuWHyc4vFLnMWTepjT/jyxXgp05lU
 xIsUj0qCT51/QT28s/LP8KhcrOC6z5VLzHLinF+YTCYn22VAizeOVHxdWuNXCjgq
 aCwDGoMd0oOSgDN1/A82Mv2YdetcJr4wKvNHM6YBj2A7WGVB1heag==
X-ME-Sender: <xms:kkYWYkxUjx7AZgsSeRAOljCv75INX66liN5-MMANQsGo6oqroLOfzA>
 <xme:kkYWYoRIya7hTkE3voorXqZyEHBqxFSClFVkHf7AShrPAiiPHnLBB-h9r7MxVDDJG
 Q06tBubJNN66VsBmsQ>
X-ME-Received: <xmr:kkYWYmXQ6ovNie1WQqJABoiNJvr1HEFeSgMMy4s1KIxae72Em2OwYtrXNP_UwoVAYDgBl1_OLkirEQ7b62impz1NIZYgTDXJNqc48D8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kkYWYijlNIJwnU7YdBFdP3bZCTRHhmttmEkuWaC2ZTNpdxWiKVyJSA>
 <xmx:kkYWYmBGiyNnjep3KjMv9zoQ40F-UBSBwRqij_8EprtswJAb8HaHZg>
 <xmx:kkYWYjLT7eSzD2e_0wuTAciaW3uRMADHWYz3ndq5rtiW5rF4VgHF0g>
 <xmx:k0YWYsS_nwDOeL5Sn_xth8npfY6IVelu80T9fLaXZITo8h5e9Bsh_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 09:37:05 -0500 (EST)
Date: Wed, 23 Feb 2022 15:37:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220223143703.xi7vpamjg4ytmvqs@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <20220223134757.f5upi2iun27op5w5@houat>
 <d9ac0b96-3327-d250-dcdd-f49fc56b922c@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6wpya4l5ynxm4fnp"
Content-Disposition: inline
In-Reply-To: <d9ac0b96-3327-d250-dcdd-f49fc56b922c@denx.de>
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


--6wpya4l5ynxm4fnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:09:08PM +0100, Marek Vasut wrote:
> On 2/23/22 14:47, Maxime Ripard wrote:
> > On Wed, Feb 23, 2022 at 02:45:30PM +0100, Marek Vasut wrote:
> > > On 2/23/22 14:41, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
> > > > > Use the new property bus-format to set the enum bus_format and bp=
c.
> > > > > Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi=
 support")
> > > > >=20
> > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > >=20
> > > > > ---
> > > > >=20
> > > > >    drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 32 insertions(+)
> > > > >=20
> > > > > Relates to the discussion: https://lore.kernel.org/all/2022020111=
0717.3585-1-cniedermaier@dh-electronics.com/
> > > > >=20
> > > > > Max
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/d=
rm/panel/panel-simple.c
> > > > > index c5f133667a2d..5c07260de71c 100644
> > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
> > > > >    	struct panel_desc *desc;
> > > > >    	unsigned int bus_flags;
> > > > >    	struct videomode vm;
> > > > > +	const char *format =3D "";
> > > > >    	int ret;
> > > > >    	np =3D dev->of_node;
> > > > > @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *de=
v,
> > > > >    	of_property_read_u32(np, "width-mm", &desc->size.width);
> > > > >    	of_property_read_u32(np, "height-mm", &desc->size.height);
> > > > > +	of_property_read_string(np, "bus-format", &format);
> > > > > +	if (!strcmp(format, "BGR888_1X24")) {
> > > > > +		desc->bpc =3D 8;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_BGR888_1X24;
> > > > > +	} else if (!strcmp(format, "GBR888_1X24")) {
> > > > > +		desc->bpc =3D 8;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_GBR888_1X24;
> > > > > +	} else if (!strcmp(format, "RBG888_1X24")) {
> > > > > +		desc->bpc =3D 8;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RBG888_1X24;
> > > > > +	} else if (!strcmp(format, "RGB444_1X12")) {
> > > > > +		desc->bpc =3D 6;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB444_1X12;
> > > > > +	} else if (!strcmp(format, "RGB565_1X16")) {
> > > > > +		desc->bpc =3D 6;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> > > > > +	} else if (!strcmp(format, "RGB666_1X18")) {
> > > > > +		desc->bpc =3D 6;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> > > > > +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
> > > > > +		desc->bpc =3D 6;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> > > > > +	} else if (!strcmp(format, "RGB888_1X24")) {
> > > > > +		desc->bpc =3D 8;
> > > > > +		desc->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > > > > +	} else {
> > > > > +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
> > > > > +			np);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > >=20
> > > > It doesn't seem right, really. We can't the bus format / bpc be inf=
erred
> > > > from the compatible? I'd expect two panels that don't have the same=
 bus
> > > > format to not be claimed as compatible.
> > >=20
> > > Which compatible ?
> > >=20
> > > Note that this is for panel-dpi compatible, i.e. the panel which has =
timings
> > > specified in DT (and needs bus format specified there too).
> >=20
> > panel-dpi is supposed to have two compatibles, the panel-specific one
> > and panel-dpi. This would obviously be tied to the panel-specific one.
>=20
> This whole discussion is about the one which only has 'panel-dpi' compati=
ble
> and describes the panel in DT completely. The specific compatible is not
> present in DT when this patch is needed.

=46rom the panel-dpi DT binding:

properties:
  compatible:
    description:
      Shall contain a panel specific compatible and "panel-dpi"
      in that order.
    items:
      - {}
      - const: panel-dpi

The panel-specific compatible is mandatory, whether you like it or not.

Maxime

--6wpya4l5ynxm4fnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhZGjwAKCRDj7w1vZxhR
xdHLAQDQssPhht+kae52yacGtxmpSWshiwtBIdGc1/noGZc+SQD/eWWwRTC5dz7V
KyMzwoV7YYbuLhqyeqUP8muHgP0cVAQ=
=78y1
-----END PGP SIGNATURE-----

--6wpya4l5ynxm4fnp--
