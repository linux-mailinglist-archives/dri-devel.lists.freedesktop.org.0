Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788006C4727
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274510E8ED;
	Wed, 22 Mar 2023 10:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA6510E8E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:02:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 3B7282B06B3B;
 Wed, 22 Mar 2023 06:02:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Mar 2023 06:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1679479320; x=1679486520; bh=Gt
 a6DeZfb/Xau68OA4+XAVPoV3SlTyjlH7iq8FkVbq0=; b=NorTwVKQADW6KDf4kx
 gTnHWfLbpN0EHokeoC3DrOhiZ8CU+KJABXVU+NCa4piYXo6HpTy5HuzRNiFF7tvk
 kS1uF/ZP394MUuAXVna9Fpn5iDdg0QWtevomnrNhpIe8AFZeNrF8jhIQTLTrI4Ez
 F8Qq3dke4/3ZmogeOMWjTD3G0qEPqcWsVr1d4vEZWddG5PYi4J+p82qo/RJd1+Pc
 D0wApM8Ce7YBSMxA8ajCR6phnmYRwiQ+O0944pCsdBUvTlzEsCNbSTwkGxjs5mkS
 NFc+f7bGpNjIchGEdl3yn7/xBjiqmaS6rxVy3+SCY/EzwAAydjJ28Yv1QCgqUXW5
 bw3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679479320; x=1679486520; bh=Gta6DeZfb/Xau
 68OA4+XAVPoV3SlTyjlH7iq8FkVbq0=; b=hSHnolcwH3t3bdKswDish1u/kHXRm
 GBRI+wa61UtRx0Zfrdsmq8CnsjhuT0V4tk4WhsMm/dY76LIFlaULjvwZ2Is4sByR
 wnxq6k16NmOke2GgTmcYxC0a6B4M8NbJbdxhf7RYClD05krVRz4oMtNmPPFUz6R8
 X7AoD2/fmudieEE2qro35wOUjhLadWUNt4yny+XeRhuzuTRtnQEOj4VK4BUdxU/D
 zi0g/ITaWRhuRN9kFMW6pQhMC12Gxcd91h/lhV8gMs1zfdQ6CWUNBs/ZUdzW133y
 7r1y/0Q0UW2r7+wW+iKmkbtAUEOh+P4wH5qpItfTivzwuUxdDObXugLGA==
X-ME-Sender: <xms:FtIaZH_cP3JOYJvAj5oXSd2OXcDDKRtpMgnneLT8maCrLgFT1uQ4nw>
 <xme:FtIaZDsYVbTOawAhmoa1oHa1uoPNqdzfMuj7H8tTDpE_F1DWS5baFq1_V5RMtYsKY
 9ZpEjgEFQHUDWVr4rk>
X-ME-Received: <xmr:FtIaZFCrxLPEjFjrYQZiYYmsseQcWkD9OS0c3-ySi7agJ-uGVLqJDI9_JpnBVpkVO-euEIby8gsGmxPlhwdU9mKdE7Bvs1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegvddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FtIaZDc9Ss_19xgb6mhlQrLE2QXKvFoiIL34VGbsSSZIH4FlYiJYkQ>
 <xmx:FtIaZMM-k1IhWCLqsm0aMt16t2CzF1nOejsm53Durk41tY8K7upzcA>
 <xmx:FtIaZFmHv-kP0VetVBA3YfQuGBF9hqOu-s8l7lOOTdqLpGXLYmgqsQ>
 <xmx:GNIaZAV9AZ4qhuQDCpvviTReJqZxJZ2jgJo22F_udVCHmNFQ2Gz5SS1iyA8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 06:01:56 -0400 (EDT)
Date: Wed, 22 Mar 2023 11:01:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 00/65] clk: Make determine_rate mandatory for muxes
Message-ID: <20230322100153.gzyznaukbdngcvko@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <f804380a14c346fdbbf3286bcb40b3c2.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vv4zkvfgrnplpmur"
Content-Disposition: inline
In-Reply-To: <f804380a14c346fdbbf3286bcb40b3c2.sboyd@kernel.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vv4zkvfgrnplpmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Mar 21, 2023 at 04:55:03PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-11-04 06:17:17)
> > Hi,
> >=20
> > This is a follow-up to a previous series that was printing a warning
> > when a mux has a set_parent implementation but is missing
> > determine_rate().
> >=20
> > The rationale is that set_parent() is very likely to be useful when
> > changing the rate, but it's determine_rate() that takes the parenting
> > decision. If we're missing it, then the current parent is always going
> > to be used, and thus set_parent() will not be used. The only exception
> > being a direct call to clk_set_parent(), but those are fairly rare
> > compared to clk_set_rate().
> >=20
> > Stephen then asked to promote the warning to an error, and to fix up all
> > the muxes that are in that situation first. So here it is :)
> >=20
> > Let me know what you think,
>=20
> What's the plan here? Are you going to resend?

It wasn't clear to me whether or not this was something that you wanted,
and I got some pushback on the drivers so I kind of forgot about it.

If you do want it (and it looks like you do), I'll resend it.

Maxime

--vv4zkvfgrnplpmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZBrSEQAKCRDj7w1vZxhR
xbTqAQDfuo+7won5pWzakHyWfnltaYo2jqEYfAWn/jNs6cp2QwD9EUEVxPQOk0xp
CPNSu0go9roDa7ZOHrlkqTVTbZM0DQo=
=JaLV
-----END PGP SIGNATURE-----

--vv4zkvfgrnplpmur--
