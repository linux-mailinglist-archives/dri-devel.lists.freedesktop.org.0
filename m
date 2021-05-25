Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE638FF6B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 12:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0CD6E9E9;
	Tue, 25 May 2021 10:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154A6E9E9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:39:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A2FAC58045E;
 Tue, 25 May 2021 06:39:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 25 May 2021 06:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=dC2pfNg9xzptty9iHRqZOhE34hx
 sIvfkZZmQJ5qbdo8=; b=gulPhH2glyTAxiPmNePoRo5PD6cm0t8wqyy8azbyebe
 RL3Lu9S1JnwZWbb/DplEXuFqLWJJLz7qF7kNSXzGLX9kJXWrWAA7VV4W1W/u7mUb
 TtlJJnyZpSRtUp7UJQGyvLF+1kSi9tG4vSD+0wmrvQGvM46es/6u28SJcXV/fQch
 Ti+bhUitKcQawvpvCZayqLPCAiugbhMXqBbLRmGpb9dPXwnIV9oAa9agCrMv6efu
 2ODMnHB+F2CP+nWMEF5uU0tXl65gl71M93YYPSeY2TMw1vx8HzBEXBn+qeKlz5Cp
 Nuq8Mw1k4JzhfWzHPK8QoAQkDdX2CcsRRTkELNLGzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dC2pfN
 g9xzptty9iHRqZOhE34hxsIvfkZZmQJ5qbdo8=; b=ezThQNWhGGKQd4sxQXzCnO
 5FiwkqM18F70JN5TvNq1ea644HBneqtt0e20+Db6P1jHOxSNP3tXEAOiep3Qm2WM
 4hc1MD9wc1foX449xmAu0N/qkojh8P5l+HgAL6G2xyLvQ6Lette7xfaRFkWXHczo
 w82edD7VKlQyEZ7tZan2PP3zxLDsk9q1K87qJBv1X/90VhZ+4OCVzdm+bHp3kKSv
 q+x5n7P/2vKt0kx1CeS5sYLNM3zWufGaD+VZOYp/WfUMg2Kpq7i3pMlnUJyggHE2
 ofh83tyR0PIkNbNu71bhrqUJuo/ETwLaIwyD/xfdEpNl4CRNdGj+3Dkajk1sHE4Q
 ==
X-ME-Sender: <xms:7tOsYKtMAECAzG3eFpcsJ7sV5m9B-QJGk25DcHS-MBGPlssMWXGTyw>
 <xme:7tOsYPdinMTYjAFI1hRlN4DnPKuz3PTioP_L-cMqDRKt_Fp6B7LM5dzS7ZldPQtD4
 LaGhfKM7vHkRzmN7UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeekkefftdffhffhvedvudetgfdtleejveffvedvvdetgeeltdfggefhhedv
 ieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7tOsYFxllJyQj9ZVMXfLEymSQZ-uwm4qCSXHvjElL5oXwGTxQYooSQ>
 <xmx:7tOsYFM883veWfDcF1GoaJTFtpSWkFFM1XN0pv6SZqIpp5hr7PcB4Q>
 <xmx:7tOsYK8FiyGOVFp9mNbuqndX3wUNyZSLn8agIZaDiCi4p8pQ2wR9Pg>
 <xmx:9NOsYDTRqYmgEJlZ7wkj7-p0w7YS26Jhlt5wDJdW5QY5OQEG7pM2Fg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 06:39:42 -0400 (EDT)
Date: Tue, 25 May 2021 12:39:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210525103940.chay5r3ns4alowvc@gilmour>
References: <20210520142435.267873-1-maxime@cerno.tech>
 <YKsl2xGgTnIuQLaE@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cbuhksrj5dpuhbip"
Content-Disposition: inline
In-Reply-To: <YKsl2xGgTnIuQLaE@pendragon.ideasonboard.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Sean Paul <sean@poorly.run>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Steven Price <steven.price@arm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Joel Stanley <joel@jms.id.au>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Qiang Yu <yuq825@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cbuhksrj5dpuhbip
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Laurent,

On Mon, May 24, 2021 at 07:04:43AM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Thu, May 20, 2021 at 04:24:35PM +0200, Maxime Ripard wrote:
> > New KMS properties come with a bunch of requirements to avoid each
> > driver from running their own, inconsistent, set of properties,
> > eventually leading to issues like property conflicts, inconsistencies
> > between drivers and semantics, etc.
> >=20
> > Let's document what we expect.
> >=20
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Alison Wang <alison.wang@nxp.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Chen Feng <puck.chen@hisilicon.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: "Heiko St=FCbner" <heiko@sntech.de>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Roland Scheidegger <sroland@vmware.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Sandy Huang <hjc@rock-chips.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Tian Tao <tiantao6@hisilicon.com>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Tomi Valkeinen <tomba@kernel.org>
> > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > Cc: Zack Rusin <zackr@vmware.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> >=20
> > Changes from v2:
> >   - Typos and wording reported by Daniel and Alex
> > ---
> >  Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.=
rst
> > index 87e5023e3f55..c28b464dd397 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -463,6 +463,25 @@ KMS Properties
> >  This section of the documentation is primarily aimed at user-space dev=
elopers.
> >  For the driver APIs, see the other sections.
> > =20
> > +Requirements
> > +------------
> > +
> > +KMS drivers might need to add extra properties to support new features.
> > +Each new property introduced in a driver need to meet a few
>=20
> s/need/needs/
>=20
> > +requirements, in addition to the one mentioned above.:
>=20
> s/above./above/
>=20
> > +
> > +- It must be standardized, with some documentation to describe how the
> > +  property can be used.
> > +
> > +- It must provide a generic helper in the core code to register that
> > +  property on the object it attaches to.
> > +
> > +- Its content must be decoded by the core and provided in the object's
> > +  associated state structure. That includes anything drivers might wan=
t to
> > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for =
planes.
>=20
> Does this effectively mean that we completely forbid driver-specific
> properties ? While I agree that we should strive for standardization,
> there are two issues that worry me. The first one is simple, we may need
> to control features that would be very device-specific, and
> standardizing properties doesn't seem to make much sense in that case.

I'd say that we should make it clear in that case that it's
driver-specific.

> The second issue relates to properties that could be applicable to
> multiple devices, but for which we have a single driver. Designing a
> standard with a single data point usually leads to a bad design. I'm not
> sure how to handle this correctly though, as we certainly don't want
> this to be taken as an excuse to create driver-specific properties when
> generic properties would make sense.

The discussion that made us create that patch was about this property:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/sti/sti_hdmi.c#n170

It's all kind of bad:
  - It kind of conflicts with the generic Colorspace property
  - It's not really a colorspace (Not that "Colorspace" is either)
  - It could have been made generic from the start
  - We don't have any knowledge on who uses it and why, so it's
    difficult to rework

This was introduced before we had any kind of rule or documentation on
the UAPI though, so there's no-one to blame really but we don't really
want to have something like that happen again.

I agree that doing something generic from the beginning can be
difficult, but this is some userspace API that we will have to carry
around forever, so it's worth it I guess?

You have a point on the vendor properties though. Maybe we can require a
vendor prefix for those? It would reduce the risk of a conflict.

Maxime

--cbuhksrj5dpuhbip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKzT7AAKCRDj7w1vZxhR
xWqyAQDfGUzUur/WV9aq3jgm/Pn9ZeYfx0Q0C0sxQyxxdioIyAD/WeQaSvYm6JZL
OzV7PjY6R78au89d9bcpzEv2WzQHOgU=
=q2De
-----END PGP SIGNATURE-----

--cbuhksrj5dpuhbip--
