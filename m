Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEA6A9A27
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAE10E688;
	Fri,  3 Mar 2023 15:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6B10E67D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 15:02:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 55C025C016C;
 Fri,  3 Mar 2023 10:02:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 03 Mar 2023 10:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1677855758; x=1677942158; bh=9y
 lX5UXlyEJ6YkH4fBnLfYnJwUQf1lSf0593M1gUNNw=; b=nbN1lEu1jDCrvrRtOP
 5Q9zwqzH0wADCbm7cmBizSTwNUjIs5qSwDxjC40n4PPryIBvvckBEHX/dxn/7Qs8
 Kr7r9jYd9FTFgcwvrwlO99BkFAui3ZZxoFPrXXLvLplvnaZ8OfYSFsUE34qPV4WI
 Ctjh+UcfNCeW5iFNwpvgxQsPgIdAMKyuQWRQJZgQP8NioETV9Pe2KmJoJzzECcpI
 f8ycLxK3qcKK11vuhNcLimuPVajFLXEO81Y3uYpO4VO3DuWni5d//yUZM8euz7nf
 nVruS2GY6R1FkJI3Ml/XbZLPzpn0O2Wr6T/q7eFIggmxEDS0+0tGA1V8Ynkzc2AE
 k9Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677855758; x=1677942158; bh=9ylX5UXlyEJ6Y
 kH4fBnLfYnJwUQf1lSf0593M1gUNNw=; b=dLB72Zzi00vW8o0663CkYPUtjawkp
 SldyACAI6M5QWKbgXwNP7vEV7/cUAUjJHi7Vrr6KRQfJtqMF6FFWes4eSXY4IPGj
 zHe+RZa+d/aMr9CpUa7Wrdkidsa4102EdbiVHGGQFEdUDrwNYeDDNvIZ9HQTFw8w
 kYNlUGeI2wN6MYu78KKNpdFnEqDL39OXvevseRpdl70T7EZIRY2zJan6Xaeuqu67
 LnPd7uL8jXvj07wLlQ6zrRnnN5JSgq1PVNHNdcGCzTqORcQF+Vsd1HXNdH14MiYv
 XdGirKpIpmi3o6+Qv/QKrepEYVUI0BCShX1Fw7wMIf0YlnSSapwMm3xvw==
X-ME-Sender: <xms:DQwCZBZbKIpkTZ9Oph6pOWthaePxTrclOlj0aD1Avfp5YHLvOr2mVA>
 <xme:DQwCZIaoQmlRLtXB0maOMP-TQcWpnOzx9MYyV9x1PX8a1L2Qef8irA3pqIS3T6j9A
 QVyPJMgf4OWr4QCUTs>
X-ME-Received: <xmr:DQwCZD99sjv2mB1jKbASYdvvUsyttOlk1oJI-XHnLrJaqRog1-jTR5D0Q4Bi-GZgpurrCNn4j8AOOuV__XrrO82WJkzBWb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelledgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DQwCZPpZfSQp0JxMdGaB2wvvQ9mhjsooBXSP3njDsY_FSmzeTPUdnQ>
 <xmx:DQwCZMqv8SKmJNu27Qp0yhZ1cf7IZxO7otbEubmiri77dHXL6C96Sg>
 <xmx:DQwCZFTx9b-zDIuvK95N5Pk6MMsHiMKZDSawZyUuxXwfXe_wbViBHg>
 <xmx:DgwCZHUgWdF4eAmYSdr8RQwkktZ43KEKa4K12mjNEQRXigOPQWsy3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Mar 2023 10:02:36 -0500 (EST)
Date: Fri, 3 Mar 2023 16:02:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v15 08/16] drm: exynos: dsi: Add input_bus_flags
Message-ID: <20230303150235.qol4nuoqt77nxmzf@houat>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-9-jagan@amarulasolutions.com>
 <20230303150019.bqxhaqtwwr5xiep4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sskvigagtttvb4bb"
Content-Disposition: inline
In-Reply-To: <20230303150019.bqxhaqtwwr5xiep4@houat>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sskvigagtttvb4bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 04:00:19PM +0100, Maxime Ripard wrote:
> On Fri, Mar 03, 2023 at 08:21:30PM +0530, Jagan Teki wrote:
> > LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
> > the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
> > active low (DE_LOW). This makes the valid data transfer on each
> > horizontal line.
> >=20
> > So, add additional bus flags DE_LOW setting via input_bus_flags
> > for i.MX8M Mini/Nano platforms.
> >=20
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Suggested-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v15, v13:
> > - none
> > Changes for v12:
> > - collect RB from Marek
> > Changes for v11:
> > - collect RB from Frieder
> > Changes for v10, v9:
> > - none
> > Changes for v8:
> > - add DE_LOW for i.MX8M Mini/Nano platforms.
> > Changes for v7, v6:
> > - none
> > Changes for v5:
> > - rebased based on updated bridge changes
> > Changes for v4 - v1:
> > - none
> >=20
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/=
exynos/exynos_drm_dsi.c
> > index 796480e4a18b..5d971b607e1a 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1736,6 +1736,10 @@ static const struct component_ops exynos_dsi_com=
ponent_ops =3D {
> >  	.unbind	=3D exynos_dsi_unbind,
> >  };
> > =20
> > +static const struct drm_bridge_timings dsim_bridge_timings_de_low =3D {
> > +	.input_bus_flags =3D DRM_BUS_FLAG_DE_LOW,
> > +};
> > +
> >  static int exynos_dsi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -1822,6 +1826,10 @@ static int exynos_dsi_probe(struct platform_devi=
ce *pdev)
> >  	dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
> >  	dsi->bridge.pre_enable_prev_first =3D true;
> > =20
> > +	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
> > +	if (dsi->plat_data->hw_type =3D=3D DSIM_TYPE_IMX8MM)
>=20
> That commit isn't bisectable, you add that enum variant in the last
> patch so this won't compile.

Scratch that, it's defined in the previous patch, sorry

Maxime

--sskvigagtttvb4bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZAIMCwAKCRDj7w1vZxhR
xZzIAQCd1oDdXVSebyvNY7DnspeAtzLN1G1dQqMtaMpqy+WwQQD/W6k5ib1l/Ld/
DqCDTNQ/1puNAcglDetAATSe6ZJpzQo=
=mRrV
-----END PGP SIGNATURE-----

--sskvigagtttvb4bb--
