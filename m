Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4255619AC5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078A10E0E7;
	Fri,  4 Nov 2022 14:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B472E10E0E7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:59:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EA41F58026B;
 Fri,  4 Nov 2022 10:59:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 04 Nov 2022 10:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1667573990; x=1667581190; bh=Y5oKJivX8w
 kahYNQyZEHeLWH6EQTo4IwcdhL358fYx8=; b=pBVbAwq1wh0urQYxWnM1cZvXiw
 mvjZO+455nAE/nRxFcqzso7pQ/J60kCKGSeIBmskbHvQSi9PYRl1MN1qk4QMVnXO
 O26I129jq9+yAZIkexYRp4WvrKiZfr4PFjBlnR6Nh+XMiiV9w0CdYiHl0idAaJKW
 SHLPz7vGqcjauK0q4winqVKK9cMBHOK6DVXMDDGCJ2DBcg3NR9tuw2sjqesu0iC5
 VW00jbu4GMIQ4H6yTjfIOwq2YTOMuSvVxQo1rCKHMe/hwvsSdfgZHZjFLM37jHkc
 FwLM9N2SL9k0UfdS0EShXYbR+EyxaJVVEbjqGsA9/nE72YI5YDI0+va41kBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667573990; x=1667581190; bh=Y5oKJivX8wkahYNQyZEHeLWH6EQT
 o4IwcdhL358fYx8=; b=gZDDItvEezCWxgqad6gxjjfWfeOrA4CSVOD4X/tCyGR/
 1zWJ5PDZMcJtl46J8cw6TZD8A3kvRySi5xhe4K3TaTEG7WSLs3rDubeqtmw/UcfG
 soFvWcONBG4N1E/1fQXCWUlTeDAhL9uzsoy6Nj6u2sSjTeKMWRrHN7I4Tz6uHFnC
 LXurihQPC91YGB99/gpiYWXFAnt9Xiw5lRUWdw/CBiJ4rg+29C3oMLtgZuLpAtK1
 uqE7F8s0fbwdOdKsuxGDFdn2e17l+JnphDkcERDXrb/KIH6muNdhFpjnB3fJ2brt
 RDCd01W2037fcjJzBEnocY/kYTqF1PbP9lh/+Mn7Gg==
X-ME-Sender: <xms:5ShlY7FKvMdiI7MdYB8GPeH7sm8yEz0sE4pJ5CoQooBaFvUW75AoGg>
 <xme:5ShlY4XvaNfgFPuKsbvtHa4_U0X6FVBAMhSvKhV3R6UFiRvXhpKJFh0-s4nI01b-x
 jlyf7I2qKs61MkDHXI>
X-ME-Received: <xmr:5ShlY9LR2xrGFIdsac3sg_xCouZpM4-aJJqKitqCh2RhgZbrJcPoS4waQ2RtRJ_kVlR9pyfi3ryzGNEBMMMCVOAhnjEpXSEw8aIKBgu3XZZdZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepieehffffvefgiedthfeiieeutdfgffekhfehgfehgfeiuddutdfftdekffeh
 heevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:5ShlY5FulryG6piRTq1Doh0CuBDYwOCeoCXIadUTWLSZ4ObNKGT5XA>
 <xmx:5ShlYxUeU1vUGVeUlBlRWaIdtbyO6tDYisF3f47KqmHxCSKrHS6GNQ>
 <xmx:5ShlY0NJrQGz6nbT46fijtydHCKy1E91zFdvxhw1jNtNOKb1d8H9Ig>
 <xmx:5ihlY1egHKPdtgWfhXGl3pSh5GvaBqT4_jcol8t3pFd7EG_r7GifVw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 10:59:47 -0400 (EDT)
Date: Fri, 4 Nov 2022 15:59:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <20221104145946.orsyrhiqvypisl5j@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qzlwgqpxalgoto6y"
Content-Disposition: inline
In-Reply-To: <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qzlwgqpxalgoto6y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
> Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard <maxime@cerno.tech>=
 a
> =E9crit :
> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
> > doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
> >=20
> > The driver does implement round_rate() though, which means that we can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
>=20
> So it's partly on purpose, partly because I didn't know about
> .determine_rate.
>=20
> There's nothing odd about having a lonely .set_parent callback; in my case
> the clocks are parented from the device tree.
>=20
> Having the clocks driver trigger a parent change when requesting a rate
> change sounds very dangerous, IMHO. My MMC controller can be parented to =
the
> external 48 MHz oscillator, and if the card requests 50 MHz, it could swi=
tch
> to one of the PLLs. That works as long as the PLLs don't change rate, but=
 if
> one is configured as driving the CPU clock, it becomes messy.
> The thing is, the clocks driver has no way to know whether or not it is
> "safe" to use a designated parent.
>=20
> For that reason, in practice, I never actually want to have a clock
> re-parented - it's almost always a bad idea vs. sticking to the parent cl=
ock
> configured in the DTS.

Yeah, and this is totally fine. But we need to be explicit about it. The
determine_rate implementation I did in all the patches is an exact
equivalent to the round_rate one if there was one. We will never ask to
change the parent.

Given what you just said, I would suggest to set the
CLK_SET_RATE_NO_REPARENT flag as well.

>=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/ingenic/cgu.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> > index 1f7ba30f5a1b..0c9c8344ad11 100644
> > --- a/drivers/clk/ingenic/cgu.c
> > +++ b/drivers/clk/ingenic/cgu.c
> > @@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
> >  	return div;
> >  }
> >=20
> > -static long
> > -ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
> > -		       unsigned long *parent_rate)
> > +static int ingenic_clk_determine_rate(struct clk_hw *hw,
> > +				      struct clk_rate_request *req)
> >  {
> >  	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
> >  	const struct ingenic_cgu_clk_info *clk_info =3D
> > to_clk_info(ingenic_clk);
> >  	unsigned int div =3D 1;
> >=20
> >  	if (clk_info->type & CGU_CLK_DIV)
> > -		div =3D ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
> > +		div =3D ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
> > +					   req->rate);
>=20
> Sorry but I'm not sure that this works.
>=20
> You replace the "parent_rate" with the "best_parent_rate", and that means
> you only check the requested rate vs. the parent with the highest frequen=
cy,
> and not vs. the actual parent that will be used.

best_parent_rate is initialized to the current parent rate, not the
parent with the highest frequency:
https://elixir.bootlin.com/linux/v6.1-rc3/source/drivers/clk/clk.c#L1471

Maxime

--qzlwgqpxalgoto6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2Uo4gAKCRDj7w1vZxhR
xdiNAPwMWogS8hbvxJqI1oGt6bgt9c110SCyrRmWXmJGBnFUHAD/WYzk5xWPvpPl
ZxQGNyyIgpdw3paEkkzKgvc0ede/vwU=
=GVUt
-----END PGP SIGNATURE-----

--qzlwgqpxalgoto6y--
