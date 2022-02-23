Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE14C146D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C410F614;
	Wed, 23 Feb 2022 13:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391EF10F612
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 13:41:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73B8858044C;
 Wed, 23 Feb 2022 08:41:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 08:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=e8NmwAG6UivGYRFtg0hHFrdMBYky5dWC8kuRA0
 WJsso=; b=YD5dlt/SFvey4BAp1hBhNpY3fvtEX3m0grKMgKW/RhaFQnJMh44bwP
 t2xGuZCv5i14Ky1KI42iQZWgi+UszmcpVEc5Wlq2xoK5ILLQvlTVVvBb6BU+pMqA
 zJonCMXkdoO+mUithp8hB3rNA0/z9qnfGyYA2tznUI4RxFJrdf/FFsrGJXgTa7Wm
 si3o+UfNDS/HLrwy6jyyrXC3Rjj/vTUb8BxdVq8RpY//25wsAlDaxXtK1R+LHHia
 eny4vs12GFziZhIHrDheuMif6VelPvG168OxUdu6rCwZoMKCUErA75zpnVptC1bc
 q6BfvV3OTl/x9mLrPpAUibNX7KE8Md2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e8NmwAG6UivGYRFtg
 0hHFrdMBYky5dWC8kuRA0WJsso=; b=mP6DEOcf4VeV4R1583lgOIcoH0juQyiAg
 rGnrgzQCAVIPCqSnyc6Q6OfRgSNqffzr9+42SY4F+C1VgvKxUkam+E/cF77OMvO6
 +Y6reTrQts2mL2PBS11SwlRv5MXmMMAZYZaaNtCR3ydIGUrACV07QEt86c3P+6xy
 +tCxYr9I3mfCDmpXjGuq+R8lD9QSNFhLfUMBMHuXOI0Po3kl2rGlzuJ/dckPZHfR
 7+AWAjDWghDL9oi3OOee6xn0ve4wC4whHX05CTOiCrkoAagSazCgkqryDUtPv4CQ
 wirQkfXsD6M7glylx4T2XVHkBKaHF8vjNNP0las4H5tgK0naxqTbg==
X-ME-Sender: <xms:pDkWYrbymSK-6Uy9OODefSwGrz9uwGy32wqnCcVnLnHkAE50_2pttA>
 <xme:pDkWYqb3WeeNMo4PVHwEBE_BzBZlZNGilT_UyvyCclDctd5UHfJGiXrxDRJRBijW9
 Whpcr8qezoOmNhpPfQ>
X-ME-Received: <xmr:pDkWYt_tNY5XgKLBv5XhwskJ88UgqDUa2rlZx8I-f93gHZ9x1NV8ZcD73HOmXq-4kIORTrnZmyduvOoiWqxyEUxubHPrUdHZMebaNBY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pDkWYhoOJPE0iD0JfyHtkxMgmmeisXdVWi6BS5SWRHX6SpyStHOe7w>
 <xmx:pDkWYmohQdk9Oe4Jwf93B_6kJxwDeDFuc3Ib080cO856TQCgoWLf9A>
 <xmx:pDkWYnQSXz-NDUNf37iLKZrt2Frh2poKuCGUdsqFn5MhwYqeS7wONQ>
 <xmx:pjkWYqaNbblP8cmNN_Km6wN2QssgmX_yUSchzsv_3eDEY9--uc8q_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 08:41:56 -0500 (EST)
Date: Wed, 23 Feb 2022 14:41:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Max Krummenacher <max.oss.09@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220223134154.oo7xhf37bgtvm3ai@houat>
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p5r42g3rwoleu74b"
Content-Disposition: inline
In-Reply-To: <20220222084723.14310-1-max.krummenacher@toradex.com>
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
 Max Krummenacher <max.krummenacher@toradex.com>, Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p5r42g3rwoleu74b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
> Use the new property bus-format to set the enum bus_format and bpc.
> Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support=
")
>=20
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> Relates to the discussion: https://lore.kernel.org/all/20220201110717.358=
5-1-cniedermaier@dh-electronics.com/
>=20
> Max
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index c5f133667a2d..5c07260de71c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
>  	struct panel_desc *desc;
>  	unsigned int bus_flags;
>  	struct videomode vm;
> +	const char *format =3D "";
>  	int ret;
> =20
>  	np =3D dev->of_node;
> @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
>  	of_property_read_u32(np, "width-mm", &desc->size.width);
>  	of_property_read_u32(np, "height-mm", &desc->size.height);
> =20
> +	of_property_read_string(np, "bus-format", &format);
> +	if (!strcmp(format, "BGR888_1X24")) {
> +		desc->bpc =3D 8;
> +		desc->bus_format =3D MEDIA_BUS_FMT_BGR888_1X24;
> +	} else if (!strcmp(format, "GBR888_1X24")) {
> +		desc->bpc =3D 8;
> +		desc->bus_format =3D MEDIA_BUS_FMT_GBR888_1X24;
> +	} else if (!strcmp(format, "RBG888_1X24")) {
> +		desc->bpc =3D 8;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RBG888_1X24;
> +	} else if (!strcmp(format, "RGB444_1X12")) {
> +		desc->bpc =3D 6;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RGB444_1X12;
> +	} else if (!strcmp(format, "RGB565_1X16")) {
> +		desc->bpc =3D 6;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RGB565_1X16;
> +	} else if (!strcmp(format, "RGB666_1X18")) {
> +		desc->bpc =3D 6;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X18;
> +	} else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
> +		desc->bpc =3D 6;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +	} else if (!strcmp(format, "RGB888_1X24")) {
> +		desc->bpc =3D 8;
> +		desc->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	} else {
> +		dev_err(dev, "%pOF: missing or unknown bus-format property\n",
> +			np);
> +		return -EINVAL;
> +	}
> +

It doesn't seem right, really. We can't the bus format / bpc be inferred
=66rom the compatible? I'd expect two panels that don't have the same bus
format to not be claimed as compatible.

Maxime

--p5r42g3rwoleu74b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhY5ogAKCRDj7w1vZxhR
xaKjAP9r35RESlRiF7rfKqiTJVl3wTvAIk9qVnbgg8tFEdcmBwD/ek7HxWjxgyUq
ZOCPlrE47eND/Q51wIiHmf6Ce07QlQM=
=wsWm
-----END PGP SIGNATURE-----

--p5r42g3rwoleu74b--
