Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F96D800F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EA510E0AE;
	Wed,  5 Apr 2023 14:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CFC10E0AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:51:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 297162B066F9;
 Wed,  5 Apr 2023 10:51:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 05 Apr 2023 10:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680706262; x=1680713462; bh=12
 Dan7+hixlpFENmGLL4GqaHPQrKwrlwcpNYaShrlRU=; b=hkUfRXi9ZUU/v0L/+I
 gVrH+uthhloeGbMuMyLFaLPGdmHx+ZfnEv71Adty8UoYbiAE/xjl8u5KqVjg9iph
 dDL+1SNtFZ1DIoSql0P9/+KZLkrmQQF9uAj4XJ3/r3yzAoVDyU+3UZyu1+aTEPER
 OWkJxOHbEINNDSPozQUVQlhGFT/1jQ99cutqUong+yuWAY6hka25mlIqIA3GjQ0M
 xDl9zwU8ch2EEnAt9r2dDdVWFEMDWJMeeAG6cjRIoFxOKPLQyawDWpS1LKq7S1Sc
 MGSHJpnZvjWdEWmQvJiSBEknGcWQYWFHfj+4DYMwd9wCkAvA7EmYRRWbg1P2K/Fd
 qCiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680706262; x=1680713462; bh=12Dan7+hixlpF
 ENmGLL4GqaHPQrKwrlwcpNYaShrlRU=; b=lOTStozRcIhNQiVpqSWvy6hRgVXT/
 Z8/ftiEBKyaVp1oyePcUHHGpoOaAaw1wd36ZBldHKB440gbnuuWDgL4aZxY4t+D2
 JoJRCNbY0NF2d9BzWQZ6I8nmk8bEGEJ52MOxbUnQvnpqprCtvLgw9V0VvdXk8yjW
 C/YVrE2H0tJEXEaoqCnm6pQNlv7lYnQwjCa/Zg4z9cPIiCtx72SsV2zfomP957up
 I+sHEZnv3M0+ChpZ9XsHO6Dx8kCKXakzvR1oF5fyxjofwoD6OTcV2p4PzM7eDPWe
 UjJ4Qg64vq3vbaPOW4sz1a3L5/0xOG6j9Rn4k8PPs7pnugtw7Htymzhvg==
X-ME-Sender: <xms:1IotZPUuMsHKcRIV1tn8qjLzvF2oPV7C1u5MRVolQHZ2CdI44Gsrcg>
 <xme:1IotZHk4YGCS6J8sDxTrZTGDxzKZcR2TlvRV3xQhuYyw2YgyyrkEFWI9FNsau1Oxz
 7biG3a4ROm7r4_f2cw>
X-ME-Received: <xmr:1IotZLYZoXCiLfJAril3onbQaZKPqh_r1AoINPLHEvj2IgoW0Z7RkujzYMTIWt_jWufho636g6-ftQYTaczYPPB_G36PK4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
 ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1IotZKXiXH4XvSiK_3aa4fqs5l2lv1GpNF5NGvI7WsaC9GLK8gzAGA>
 <xmx:1IotZJmCjINoZE4kymmtgWXz9xLJzq_D049KW1UQySfT5mjHyygKrg>
 <xmx:1IotZHetG9QWgJCeQdyxnOMLtU3uerimAkHUHXaEXwRWPSNKWtET1A>
 <xmx:1ootZOSLB3yQ5ftmsB4dyjGTTS9hWpXHNN90QPLp89JeVXerMhgMeNFYNDs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 10:50:59 -0400 (EDT)
Date: Wed, 5 Apr 2023 16:50:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
References: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
 <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i7uz65y3usvns4hs"
Content-Disposition: inline
In-Reply-To: <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
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
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, alsa-devel@alsa-project.org,
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


--i7uz65y3usvns4hs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 02:57:26PM +0200, Paul Cercueil wrote:
> Le lundi 27 mars 2023 =E0 21:24 +0200, Maxime Ripard a =E9crit=A0:
> > On Fri, Mar 24, 2023 at 08:58:48PM +0000, Aidan MacDonald wrote:
> > > > > My suggestion: add a per-clock bitmap to keep track of which
> > > > > parents
> > > > > are allowed. Any operation that would select a parent clock not
> > > > > on the
> > > > > whitelist should fail. Automatic reparenting should only select
> > > > > from
> > > > > clocks on the whitelist. And we need new DT bindings for
> > > > > controlling
> > > > > the whitelist, for example:
> > > > >=20
> > > > > =A0=A0=A0 clock-parents-0 =3D <&clk1>, <&pll_c>;
> > > > > =A0=A0=A0 clock-parents-1 =3D <&clk2>, <&pll_a>, <&pll_b>;
> > > > >=20
> > > > > This means that clk1 can only have pll_c as a parent, while
> > > > > clk2 can
> > > > > have pll_a or pll_b as parents. By default every clock will be
> > > > > able
> > > > > to use any parent, so a list is only needed if the machine
> > > > > needs a
> > > > > more restrictive policy.
> > > > >=20
> > > > > assigned-clock-parents should disable automatic reparenting,
> > > > > but allow
> > > > > explicit clk_set_parent(). This will allow clock drivers to
> > > > > start doing
> > > > > reparenting without breaking old DTs.
> > > >=20
> > > > I'm generally not a fan of putting all these policies in the
> > > > device
> > > > tree. Do you have an example where it wouldn't be possible to do
> > > > exactly
> > > > this from the driver itself?
> > >=20
> > > I'm confused. What's implicit in the example is clk1 and clk2 might
> > > have *other* possible choices of parent clock and the device tree
> > > is
> > > limiting what the OS is allowed to choose.
> > >=20
> > > Why would you put such arbitrary limitations into the driver?
> >=20
> > Why would we put such arbitrary limitations in the firmware? As this
> > entire thread can attest, people are already using the device tree to
> > work around the limitations of the Linux driver, or reduce the
> > features of Linux because they can rely on the device tree. Either
> > way, it's linked to the state of the Linux driver, and any other OS
> > or
> > Linux version could very well implement something more dynamic.
>=20
> Probably because if we have to choose between setting policy in the
> kernel or in the firmware, it is arguably better to set it in the
> firmware.

I have a very different view on this I guess. Firmware is (most of the
time) hard to update, and the policy depend on the state of support of a
given OS so it's likely to evolve. The kernel is the best place to me to
put that kind of policy. Why do you think differently?

> Especially when talking about clocks, as the firmware is already the
> one programming the boot clocks.

I'm not sure what your point is there. I don't think I ever saw a
firmware getting the clocks right for every possible scenario on a given
platform. And if it was indeed the case, then we wouldn't even a kernel
driver.

Maxime

--i7uz65y3usvns4hs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2KyAAKCRDj7w1vZxhR
xbx0AQDo/091Al9F55xVR4k44hMshHS0Db7q/bHfCkOFHJG+RwEAxo0zFijQl/Op
i9WCXbYvyuKQciwCDCJE5/F+69faAgw=
=nWIA
-----END PGP SIGNATURE-----

--i7uz65y3usvns4hs--
