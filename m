Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A1735087
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AEB10E1CE;
	Mon, 19 Jun 2023 09:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733D310E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:40:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 050845C024A;
 Mon, 19 Jun 2023 05:40:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Jun 2023 05:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1687167600; x=1687254000; bh=aN
 45kGmqBIxAG12dnd6Q0Yr1ClH4O5r4wrOtgu7daTU=; b=oKh6ILcZftQblC0rVa
 i23g9WfTUykmIq9jtJN7uhhy9dcKE0CDtHx2Zp+1/wZTldFscBRECJKdLTTYeoUR
 9LquVL9/s20kw8ZGQ5Xo1Cwt6+Q/6M1XNisrA9Y9g3SDyNQ9HMH4pwxWSSM0C1uJ
 Bkd9QzQWGNjBeHPPk63wuOnH5ASsQDzMCZUO87xw3FTh6vWC0lbv/3ALdk7xBMgP
 +cYSS6+UcEWzODVFeIbmNMHC/f2tVsbPhje1oYLE6g7yTh8dQ870dnBrdD75Tel+
 Xj6B53q/Ndo+H9o8UZhLZnco73eJz1oTK0/hUgvGd3x/wt4BwanSD5s0NFzco5iU
 qgjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687167600; x=1687254000; bh=aN45kGmqBIxAG
 12dnd6Q0Yr1ClH4O5r4wrOtgu7daTU=; b=Iq+FtKOQ4QBQcE4C4cbyxuJ+BUMf8
 5KjZJ7wp8gy3iHiMRySTS8nD0qhzr4DXmEpIsl5uXGQlWUtSXPXUN9gyGOK6wfm5
 +iusTLDel0VuWoMz7mjKpQHQYueBsEU2pczhsQh7J0PYYbiH2IXzvR7E3ZBCoayP
 KLhBwBkRJTpdQtbEdDOJpGVGC/D92E3Y8AdHJMz/YDYjwEDL5U9GvkH9CcLRCEBi
 U4LKet+VqZlKTYQr21fQZBZeZ6l7n3WmDBKopVOXJXZIp7oDoyZx9ZL67clBrJ2k
 rV8VOheirbSprElYaFC58WqNQ8I304pflF47MOEGSqukYwwFdUVLulsDQ==
X-ME-Sender: <xms:byKQZA3OpFMyOO94C4ulv809_UPGulLhm2TeQa8TKfzfsFIpS3AzYw>
 <xme:byKQZLGFPTA6YbBewoRmtsvI4DwryasR0-VuwBjgJSWkNIwQbR8TI8BYr7rscPFnD
 86q9Q65-3-qKn60JNU>
X-ME-Received: <xmr:byKQZI5K24QtjMmdOg7076rE6xXKPh5kHQN9XDVwWtEG_G4YpUH4g2AL7mdmMzcXCEtkcVysHsCBCegx9s6xWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefvddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:byKQZJ2-JbpdfRapMvttNNIlTlTp3wh-VYiw2xvN2mcwAK7c2xnpWw>
 <xmx:byKQZDH7UkbTaadNEQTP6tgIj0yMyy7vBC4DAlJ2LzKKkQrvBQ_DBw>
 <xmx:byKQZC-WFQ_wZGxx0F0ZPTWNjmUC3Pu-muDubGC2UzcNvFtBIzsGCQ>
 <xmx:cCKQZL-7okOv3Y9Ekt4HAblodYSz3_lqQMI0Bi7AbaIiJty3T6pI4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jun 2023 05:39:59 -0400 (EDT)
Date: Mon, 19 Jun 2023 11:39:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: st7789v: bound the number
 of Rx data lines
Message-ID: <wgi4wtewth3xwtl5updyg5et3roiqp4h5kz6oyevd4uxjveboq@gff42fefym7m>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-3-miquel.raynal@bootlin.com>
 <tcxifa7ol3fukfsdw7hh3kl25dhpviu6lasdc6xasz4dvhjedx@mo2vae6smtok>
 <20230618193732.04fc1909@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fkpq67rzflalivu3"
Content-Disposition: inline
In-Reply-To: <20230618193732.04fc1909@xps-13>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fkpq67rzflalivu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 07:37:32PM +0200, Miquel Raynal wrote:
> Hello Maxime,
>=20
> maxime@cerno.tech wrote on Sun, 18 Jun 2023 16:37:58 +0200:
>=20
> > Hi,
> >=20
> > On Fri, Jun 16, 2023 at 06:32:51PM +0200, Miquel Raynal wrote:
> > > The ST7789V LCD controller supports regular SPI wiring, as well as no=
 Rx
> > > data line at all. The operating system needs to know whether it can r=
ead
> > > registers from the device or not. Let's detail this specific design
> > > possibility by bounding the spi-rx-bus-width property.
> > >=20
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix=
,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st=
7789v.yaml
> > > index 0ccf0487fd8e..a25df7e1df88 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789=
v.yaml
> > > @@ -29,6 +29,10 @@ properties:
> > >    spi-cpha: true
> > >    spi-cpol: true
> > > =20
> > > +  spi-rx-bus-width:
> > > +    minimum: 0
> > > +    maximum: 1
> > > + =20
> >=20
> > It's not clear to me what the default would be?
>=20
> This binding references spi-peripheral-props.yaml which sets the
> default to 1, I believe it is sane to keep it that way?

I'm not sure.

The driver didn't need RX before, and we didn't have any property that
was expressing whether we had MISO in the device tree.

That means we had both devices with and without MISO expressed in the
same way, the driver handling both (by ignoring MISO entirely).

With this patch, you now introduce a property that specifies whether
MISO is connected or not, and defaults to MISO being there. And a later
patch will use MISO if it's available.

This means that, while it's working fine for devices that had MISO
connected, devices that didn't are assumed to have it, and the driver
makes use of it.

Maxime

--fkpq67rzflalivu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJAibAAKCRDj7w1vZxhR
xY+rAP0QdETO/flzliKqO/TiFMIIFDduM+m8VCu0QyIQSFtLGAD/fxF97CLVuhkI
8iXzvUDlUJM1FVNCNrbz689yGknAfwk=
=gCP9
-----END PGP SIGNATURE-----

--fkpq67rzflalivu3--
