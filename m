Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFA6475CBA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902CD10E62E;
	Wed, 15 Dec 2021 16:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A55010E62E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:06:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 49C312B000FA;
 Wed, 15 Dec 2021 11:06:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 11:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WP37NbalGKJAL0/fH72V8DXVgIh
 gPELRYdKLvojT4Z4=; b=I1JKQ0Qp16O7m6Dl068qAPHTtTaJyxzgfdmhUEJrpzC
 fGYU4RePOKwe772Q/f3PmsyVoeQwUs/nWJcRQT3raFmU+qxg/7qI0ZU/Z+1jR5lK
 fliiRC02mn+06E7X+KPg9W/inxpoMF59NgcrFZT+f8VcvDerQqprowWdY/t2EXdF
 XdIYQHP5cirPnC+JGuUeyextTlnQ0L/dwhwdpWDUDxh/+TEpKBIu/cNfKyQl0Bjl
 fN8u0TDiYc5Q2QyQswJ7cnF0mHvOzwpsCn6gCNgwdQkjwDlChRpCf/Qm6/1P9EMV
 uu+flLvzEKRr/9RdC4rQ2+WOrgvovH0q90IIDRDDo6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WP37Nb
 alGKJAL0/fH72V8DXVgIhgPELRYdKLvojT4Z4=; b=CBgX3DNsBsFLHllQuYJ9wE
 5gWJBdGMQIWS7gSS+9pcb6K9CSbJzZkfUCciedTGW9uXTM5WVMa823GBcd5mrU1H
 3mP6LIYQAueQsBEGDs4iF8IIEbqBp63pB4nZ+dFomC2JJyLuyK/LbuHuYpe+Jhtr
 9liAbtOFu44vSnAFXCJh49bdIDJH4KhTgv2EPnWXq3sK6UjTK6syNO35sHUxfKpt
 JpkiziPlMeobP04xYRoB/y/0395r0YgHxcrcX5umFZFwIjNb8UjuEe00H3e/3WFc
 ijC71LdWR+4sk95pF9c6bje7at85VRbuPL0waFnr6PrLj0hhMrmASkRQKAxuUhow
 ==
X-ME-Sender: <xms:hhK6Yb9YkGQJtXyiG1GsceZsQcr49_FBvz3ilc2W2-0cOYJ02y5ufQ>
 <xme:hhK6YXt_OztEopYb1EYylOxatH0_T-094yOHiD7ul2_VbFXjxvvdthXOi3TYWGE3T
 APv7sSTPCrycQmlkIc>
X-ME-Received: <xmr:hhK6YZAhotNLrRDa1oaRA6rD8JKceGoHjDnCgqpXVxZ1Vz5CTbsr--LAhljQNLDKT6GaHQqcBjSK_WKXA7wHWwy4KM2dRN25zJ6PXbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hhK6YXcW09v2iehWXB1CBKSCOin-wlkF-IhG68puzVssD_d7ofvDAA>
 <xmx:hhK6YQM_B2Pu7Qznm5mzkNxudkUhp3eTojkWoHt4o_tyiyn68vSTog>
 <xmx:hhK6YZkiXd46lkfbQCzoNDZLNHNUebG2K4hs-UQO-9mDJ9ud2LKpyQ>
 <xmx:jhK6YcnDxEMUCeWhkR5AV7XVOguTJCrktgxelAumEenVhndfbwY0XjAOsvo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 11:06:29 -0500 (EST)
Date: Wed, 15 Dec 2021 17:06:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211215160628.ogfprazobtm5nylf@houat>
References: <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
 <20211125143034.tzikvlxxl6fdhsif@gilmour>
 <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
 <20211213165422.54n3oh72tjcb3a67@houat>
 <CABnWg9uyoK0TkRZRJXstmtB4u2-UUCi-x_frosKhhQerNmFT=A@mail.gmail.com>
 <20211215151508.hc7blhh7p3wrjili@houat>
 <CABnWg9s0GpTPWH=2HcD5j6F23=0rvkG9KrFpen-qKO4RpQoH1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ku4qditxo4q3mink"
Content-Disposition: inline
In-Reply-To: <CABnWg9s0GpTPWH=2HcD5j6F23=0rvkG9KrFpen-qKO4RpQoH1g@mail.gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ku4qditxo4q3mink
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:02:22AM -0600, Guillaume Ranquet wrote:
> Quoting Maxime Ripard (2021-12-15 16:15:08)
> > Hi,
> >
> > On Wed, Dec 15, 2021 at 09:03:01AM -0600, Guillaume Ranquet wrote:
> > > Quoting Maxime Ripard (2021-12-13 17:54:22)
> > > > On Thu, Dec 02, 2021 at 06:48:12AM -0800, Guillaume Ranquet wrote:
> > > > > Hi,
> > > > >
> > > > > Quoting Maxime Ripard (2021-11-25 15:30:34)
> > > > > > On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wro=
te:
> > > > > > > Hi,
> > > > > > > Thanks for all your input, really appreciated.
> > > > > > >
> > > > > > > Quoting Maxime Ripard (2021-11-16 15:51:12)
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet=
 wrote:
> > > > > > > > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > > > > > > > The driver creates a child device for the phy. The ch=
ild device will
> > > > > > > > > > > never exist without the parent being active. As they =
are sharing a
> > > > > > > > > > > register range, the parent passes a regmap pointer to=
 the child so that
> > > > > > > > > > > both can work with the same register range. The phy d=
river sets device
> > > > > > > > > > > data that is read by the parent to get the phy device=
 that can be used
> > > > > > > > > > > to control the phy properties.
> > > > > > > > > >
> > > > > > > > > > If the PHY is in the same register space than the DP co=
ntroller, why do
> > > > > > > > > > you need a separate PHY driver in the first place?
> > > > > > > > >
> > > > > > > > > This has been asked by Chun-Kuang Hu in a previous revisi=
on of the series:
> > > > > > > > >
> > > > > > > > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw=
2XSm=3DZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> > > > > > > >
> > > > > > > > It's a bit of a circular argument though :)
> > > > > > > >
> > > > > > > > It's a separate phy driver because it needs to go through a=
nother
> > > > > > > > maintainer's tree, but it needs to go through another maint=
ainer's tree
> > > > > > > > because it's a separate phy driver.
> > > > > > > >
> > > > > > > > It doesn't explain why it needs to be a separate phy driver=
? Why can't
> > > > > > > > the phy setup be done directly in the DP driver, if it's es=
sentially a
> > > > > > > > single device?
> > > > > > > >
> > > > > > > > That being said, usually what those kind of questions mean =
is that
> > > > > > > > you're missing a comment or something in the commit log to =
provide that
> > > > > > > > context in the first place, so it would be great to add tha=
t context
> > > > > > > > here.
> > > > > > > >
> > > > > > > > And it will avoid the situation we're now in where multiple=
 reviewers
> > > > > > > > ask the same questions over and over again :)
> > > > > > > >
> > > > > > > At first I didn't understand your reply, then I realized I ga=
ve you
> > > > > > > the wrong link...
> > > > > > > my bad! I'm struggling a bit with mail reviews, but I'll get =
there eventually.
> > > > > > >
> > > > > > > The driver and phy were a single driver until v2 of this patc=
h series
> > > > > > > and the phy setup
> > > > > > > was done directly in the driver (single driver, single C file=
).
> > > > > > > Here's the relevant link to the discussion between Chun-Kuang=
 and Markus
> > > > > > >
> > > > > > > https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2s=
z4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t
> > > > > > >
> > > > > > > I'll try to find a way to make it clearer for v7.
> > > > > >
> > > > > > OK, it makes sense then :)
> > > > > >
> > > > > > There's something weird though: the devices definitely look lik=
e they're
> > > > > > in a separate register range, yet you mention a regmap to handl=
e the
> > > > > > shared register range. That range doesn't seem described anywhe=
re in the
> > > > > > device tree though? What is it for?
> > > > >
> > > > > My understanding is that 0x1000 to 0x1fff controls the phy
> > > > > functionalities and 0x2000 to 0x4fff controls "non-phy"
> > > > > functionalities. And you are right, there's no description of tha=
t in
> > > > > the device tree whatsoever. The ranges are in the same actual dev=
ice
> > > > > and thus it has been decided to not have dt-bindings for the phy
> > > > > device.
> > > >
> > > > Sure, that last part makes sense, but then I'm not sure why you don=
't
> > > > have the full register range in the device node you have in the DT?
> > > >
> > > > > The phy driver is a child of the DP driver that we register using
> > > > > platform_device_register_data() and we pass along the same regmap=
 as
> > > > > the DP driver in its platform data.
> > > >
> > > > Especially if it's used by something, it should be described in the=
 DT
> > > > somewhere.
> > > >
> > > > Maxime
> > >
> > >
> > > So, to make things crystal clear to a newbie (like me).
> > > Would you describe it like this:
> > > compatible =3D "mediatek,mt8195-dp-tx";
> > > reg =3D <0 0x1c501000 0 0x0fff>,
> > >       <0 0x1c502000 0 0x2fff>;
> > >
> > > instead of the current description:
> > > compatible =3D "mediatek,mt8195-dp-tx";
> > > reg =3D <0 0x1c500000 0 0x8000>;
> > >
> > > I haven't checked what the rest of the 0x8000 range is used for thoug=
h...
> >
> > I'm confused, is that what you had before?
> >
> > I recall you had a DTSI somewhere where you have two devices, and the
> > dp-tx device not having the phy range?
> >
> > If the latter is what you have, and there's no overlapping ranges over
> > multiple nodes, then it's fine already.
> >
> > Maxime
>=20
> This is what I have today in the mt8195.dtsi I'm using for testing purpos=
e.
> Provided by mediatek on their vendor branch, not sure if it has been subm=
itted
> to the list yet:
>=20
>         edp_tx: edp_tx@1c500000 {
>             status =3D "disabled";
>             compatible =3D "mediatek,mt8195-dp-tx";
>             reg =3D <0 0x1c500000 0 0x8000>;
>             nvmem-cells =3D <&dp_calibration>;
>             nvmem-cell-names =3D "dp_calibration_data";
>             power-domains =3D <&spm MT8195_POWER_DOMAIN_EPD_TX>;
>             interrupts =3D <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
>         };
>=20
>         dp_tx: dp_tx@1c600000 {
>             compatible =3D "mediatek,mt8195-dp-tx";
>             reg =3D <0 0x1c600000 0 0x8000>;
>             nvmem-cells =3D <&dp_calibration>;
>             nvmem-cell-names =3D "dp_calibration_data";
>             power-domains =3D <&spm MT8195_POWER_DOMAIN_DP_TX>;
>             interrupts =3D <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
>             status =3D "disabled";
>         };
>=20
> With no device tree node for the dp-phy.
> The phy range is included in the reg range of the dp-tx device.

It's all good then, sorry for the noise

Maxime

--ku4qditxo4q3mink
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYboShAAKCRDj7w1vZxhR
xUYVAQCGjzUfWr2v3Z62sZDrWOasRwMjVwIuCKR48vIkup8T+AEAvm/G2Hc7KhWe
iKk+sVWc6DV2ixUroSxPb1PtnTOQPQ4=
=UG8J
-----END PGP SIGNATURE-----

--ku4qditxo4q3mink--
