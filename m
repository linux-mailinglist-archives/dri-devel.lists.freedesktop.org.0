Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F06CEEB2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8610EB7D;
	Wed, 29 Mar 2023 16:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A06410EB7D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:07:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 06D54581F9B;
 Wed, 29 Mar 2023 12:06:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Mar 2023 12:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680106016; x=1680113216; bh=th
 Rw2/tFs/SwCLKlW3NOEoR71LT+Ry2A2LqiLKA1wEU=; b=JVNDbc+MY5oREoD06S
 +DcekfmC36dI9aqn/twmH9eClRsgxHsK1vrEDVVakWUjoHs3a2SYcOGwtUQns7yH
 3y3QbNzVkl5yhmMvxH5qvJpmSsqOuqifzEQYVNnBl/wO5c7wtnBTo4Prvdd+X+d1
 +uMiToSbklmYULNWzGSyS5snupaadjApQ4xgMJWM8dLccZadhw/cNViYR3Xg4uql
 PGCM84fZX+BBzK5USZOcxqojgQkKQaYWr+CcJKlcdz08h3tDxSpxGJ7WUPJuwPgi
 7ZZzVRup4keNmbrg7XaSUR4oXX7Vo4yQ1ShpJZqbL54tlXFxcpOCaswr8q4Rsbkz
 ei0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680106016; x=1680113216; bh=thRw2/tFs/SwC
 LKlW3NOEoR71LT+Ry2A2LqiLKA1wEU=; b=LnhyOmWlCJTs8izABKUs7dBWaVgGR
 3BucKvjdG/ntkSg9I3lUoOINnmOzkKfd8UcpJPsjhs7/nOY2ToiOpP7lYF+KxmgQ
 UiolKHPGRiK/mW2UCjPnWZrHFuBAf5B4/HdLZTfn+z5JJbYQVOymSZE4SFKAaGwk
 rFNpPoGe3d08DBccsFO9LnpZ2Gj1X1KwNzItxnYNaDgdOm9WrWT6nMFa+9bySbW5
 o0LyYuVYWs90nfXlk5/fmSlG4tlmH6JWGh1Y4sB2DQbtIupaeZX48T8b7AZ/vqao
 0QdiydeLd3v7MIVGEuXq2xA+sCilgI5auVNuCqnUNutnHGbWFWN/8XlQQ==
X-ME-Sender: <xms:HmIkZE-SnqX_iaot91jNdSjhaQ7y4EfxDy1e3ya7Q5sVO64qjz8eTA>
 <xme:HmIkZMthwaZTmNTrhP6LVd8fgohlXalf5I3Wr818daH-K98u9r_3hWZg5cDrpyNS1
 DN5xxPcoe-bsRs80S8>
X-ME-Received: <xmr:HmIkZKBdt-YtEV7X1Gn-cmVky218D7P4_eBr58fvrQlNhuqFJGG93BRVpfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HmIkZEcJlE7QjjE-AxMmQ3DI20HGW5aGXfRI3nj7xDMXpmg-9JEcfQ>
 <xmx:HmIkZJOBFdEFojvMbY_VLQfwe3Gzy8KOuoCRP4ZeaHSDJi71UsHSJw>
 <xmx:HmIkZOnZ_MaajWAsTX3I2xO87-qnqHI3jUbS8tbQBzMVpO3vqTtgmw>
 <xmx:IGIkZGzelhBRWhYudMxTMkNFn9MxFe5Rbr61bTMcvQkZWbr5kn-GeA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 12:06:53 -0400 (EDT)
Date: Wed, 29 Mar 2023 18:06:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 12/12] drm: sun4: dsi: Convert to bridge driver
Message-ID: <20230329160652.7gel5qvckzwihjx4@penduick>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <20230329131929.1328612-3-jagan@amarulasolutions.com>
 <20230329145939.7zcex4x2pipivuj4@penduick>
 <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zrjrrfurl2tflvml"
Content-Disposition: inline
In-Reply-To: <CAMty3ZDWK0xVe7E+gER+TihHf1yv3YAWgZc1GCJQ2V5KD_mN-g@mail.gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zrjrrfurl2tflvml
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 09:08:17PM +0530, Jagan Teki wrote:
> On Wed, Mar 29, 2023 at 8:29=E2=80=AFPM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> >
> > Hi,
> >
> > The patch prefix should be drm/sun4i:
>=20
> I did follow my previous prefix, I will update this.
>=20
> >
> > On Wed, Mar 29, 2023 at 06:49:29PM +0530, Jagan Teki wrote:
> > > Convert the encoder to bridge driver in order to standardize on a
> > > single API by supporting all varients of downstream bridge devices.
> >
> > Which variant, and why do we need to convert to a bridge to support all=
 of them?
>=20
> Downstream bridge variants like DSI panel, DSI bridge and
> I2C-Configured DSI bridges. Bridge conversion would be required for
> the DSI host to access the more variety and complex downstream bridges
> in a standardized bridge chain way which is indeed complex for encoder
> driven DSI hosts.
>=20
> >
> > > The drm_encoder can't be removed as it's exposed to userspace, so it
> > > then becomes a dumb encoder, without any operation implemented.
> > >
> > > Tested on DSI Panel, DSI Bridge, I2C-Configured DSI Bridge.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > [...]
> >
> > > +static const struct component_ops sun6i_dsi_ops;
> > > +
> > >  static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> > >                           struct mipi_dsi_device *device)
> > >  {
> > >       struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > -     struct drm_panel *panel =3D of_drm_find_panel(device->dev.of_no=
de);
> >
> > That one looks unrelated. Why do you need that change?
>=20
> This was replaced with drmm_of_dsi_get_bridge for lookup of both panel
> and bridge. I think I will separate this into another patch.

So, it looks to me that you're doing two (unrelated) things in that patch:

  - You modify the existing driver to be a bridge

  - And you support downstream device being bridges.

Both are orthogonal, can (and should!) be done separately, and I'm
pretty sure you don't actually need to do the former at all.

Maxime

--zrjrrfurl2tflvml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCRiHAAKCRDj7w1vZxhR
xd68AQC05r3DsJGaU7H1oonM8OgOgjnGl+gioqXGq3ALav5aSgEAuFfH8EvCnOv7
n0z5dUr5W+RUNtouMyIew97EwKd5ZAk=
=u1E2
-----END PGP SIGNATURE-----

--zrjrrfurl2tflvml--
