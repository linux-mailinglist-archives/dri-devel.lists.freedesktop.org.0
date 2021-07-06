Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97AF3BC81F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69572898AA;
	Tue,  6 Jul 2021 08:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23920898AA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:52:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 19983580670;
 Tue,  6 Jul 2021 04:52:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 04:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=xb1ShrMpK8ostpGwMFZCsoZYETx
 HiphoxAX6Pb3wC5k=; b=ZCV9iuaTvRyGFKWCMmtOelU+0kN6oMjQWnrxYPOn9i4
 RnwWxv9mEXtN+0RJu18PNOBzJgVvzoBeWNwM9jMNRCjLRr8INbHTSt6opquohGIl
 5oBW/Hn42adUViFWQij+8AIFNLcs7HTMJjjxlymaKh0Bsv9OCL0z6djxAte4inHe
 +t99cn/L/XCmrl62a9umObf6+07FqOhaChCDgcBR9MNQGBwUo5DYMIOF8ogjlbyJ
 8Wtyq2kEK5HcEw0u8/EFTrNeq2c1NPcrIxsR29QJU9h8wX0f1KXzX9x6CiSE2JNz
 4h1G1VOFatfKkI5bc5WsxFflYQJUn7nOJf4uARLoxOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xb1Shr
 MpK8ostpGwMFZCsoZYETxHiphoxAX6Pb3wC5k=; b=gUTumXogpffvEC9hNM2J6U
 BrjncaXbkURl4CGhFCpJpCodRU5Vd8hUraRWgIA/Uy3Y3VqsIL8swZjRHMFbHN+l
 Jp2k0AyhghnEA7ipboW5OJ3I0Cuo6BkUZ+2pOe535Rii5MSA9ab8U4j3ptT2Oe+f
 /TLgYXEiwbGGaPkRwboljNoaJXFBFNM9383aB/g9l+5QUsecwe87EHjGqo/WWPwS
 PVRow+Y2N8HcKw7OqH4V356Uts9Ky6ueym8qyVz3daR/59mSRDN1msUC+C1M/MUw
 nk3FUK/oMMRhRwlnd1EpuqOjtkNSAMoPOafrYbKe4cJoofrW00FPF1eUqCLC4Igg
 ==
X-ME-Sender: <xms:tBnkYBomkBuLOg4ypCiohcBXCiR_Y2SE4siRkZWvlyy3wyD-ZsIS_g>
 <xme:tBnkYDqxiTL8b9cOOfv1vpERv8pBUmQyt3OveP7GS1zi7LKuKZ8P-67aloVqcH6Bm
 AaR25CDLGIxz_T6c0g>
X-ME-Received: <xmr:tBnkYOPpst5nNafKnVjCa8wp4kEf3E8nvHi1nHDs4mXU8uwELi2SEdDofDR515_Ly-SARQcMNXr2YRqYfiqgfhnlKHbL3bK9PZnD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tBnkYM7zdkz8uMexSI4n-jf-VxjW_meQHicZ3bfHVhuvsp9ESzO6YA>
 <xmx:tBnkYA6n3A8UT5HPNAj8cAVDCtzmBQp37Qsp5Y01QYkroRWRhJbFLQ>
 <xmx:tBnkYEhR2KRRptb8iUcYhR9pNndzh00gJcl5TuPDInjbphdCKXd9zQ>
 <xmx:vBnkYLegO4CmrCiqvYRm4sMf3NJLo2OMhXiUso2RgyIS--Oc1a8Y4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 04:52:03 -0400 (EDT)
Date: Tue, 6 Jul 2021 10:52:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210706085202.6o4fapfmq7osj5wf@gilmour>
References: <20210616143842.632829-1-maxime@cerno.tech>
 <20210617112036.7373fdab@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwvg6s6irn2y2r5k"
Content-Disposition: inline
In-Reply-To: <20210617112036.7373fdab@eldfell>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rwvg6s6irn2y2r5k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Thu, Jun 17, 2021 at 11:20:36AM +0300, Pekka Paalanen wrote:
> On Wed, 16 Jun 2021 16:38:42 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
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
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
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
> > Cc: Simon Ser <contact@emersion.fr>
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
> > Changes from v3:
> >   - Roll back to the v2
> >   - Add Simon and Pekka in Cc
> >=20
> > Changes from v2:
> >   - Take into account the feedback from Laurent and Lidiu to no longer
> >     force generic properties, but prefix vendor-specific properties with
> >     the vendor name
> >=20
> > Changes from v1:
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
> > +requirements, in addition to the one mentioned above.:
> > +
> > +- It must be standardized, with some documentation to describe how the
> > +  property can be used.
>=20
> Hi,
>=20
> I might replace "some" with "full" documentation. Also not only how it
> can be used but also what it does.
>=20
> FYI, some common things that tend to be forgotten IME:
> - Spell out exactly the name string for the property in the
>   documentation so that it is unambiguous what string userspace should
>   look for.
> - The same for string names of enum values.
> - Explicitly document what each enum value means, do not trust that the
>   value name describes it well enough.
> - Explain how the property interacts with other, existing properties.
>=20
> Not sure if these should be written down here or anywhere though.
> Interaction with other properties is kind of important.
>=20
> > +
> > +- It must provide a generic helper in the core code to register that
> > +  property on the object it attaches to.
> > +
> > +- Its content must be decoded by the core and provided in the object's
> > +  associated state structure. That includes anything drivers might wan=
t to
> > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for =
planes.
> > +
> > +- An IGT test must be submitted where reasonable.
>=20
> Would it be too much to replace "where reasonable" with "if it is at
> all possible to write a test."?
>=20
> > +
>=20
> How about adding the following somewhere?
>=20
> - The initial state of the property (set during driver initialization)
>   must match how the driver+hardware behaved before introducing this
>   property. It may be some fixed value or it may be inherited from e.g.
>   the firmware that booted the system. How the initial state is
>   determined must also be documented, that is, where does it come from.
>=20
> The initial state must not be called "default", because I want to
> reserve the term default for something else if possible: the phrase
> "reset everything to defaults", which is a whole another discussion.

I've taken into account your previous comments, thanks

> How about also saying that fbcon/fbdev must set this property when
> taking over? That sounds to be like a common omission leading to funky
> KMS state in fbcon. The value fbdev sets it to only needs to make
> sense to fbdev, and it does not need to be ~~the initial value~~ nor the
> default value. Or are we hoping to kill fbcon in favor of a userspace
> kmscon soon? ;-)
>=20
> Ooh, maybe the KMS property documentation should also say what value
> fbdev will set the property to. That's kind of UABI, because userspace
> probably implicitly relies on it in many cases. ...which means fbdev
> should set the property to its initial value, otherwise userspace will
> break.

I'm not sure about this one: fbdev and fbcon are still optional features
of the kernel and can be disabled at the user discretion. Having any
part of the user-space rely on the fbdev behavior seems a bit broken,
especially when we have a mechanism to retrieve the state when the
application starts.

Maxime

--rwvg6s6irn2y2r5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOQZsQAKCRDj7w1vZxhR
xcAOAQDgiPmqHT2po3pKn0nOdvI8OHOSf965Rdk+pXb4g0/FYAD/QiqJF39WtEjQ
HH/6r47VwthjKZxzENH4ZoYQwPDddQo=
=GIQI
-----END PGP SIGNATURE-----

--rwvg6s6irn2y2r5k--
