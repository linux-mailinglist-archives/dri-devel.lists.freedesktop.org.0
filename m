Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AF61ED25
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE7C10E1FC;
	Mon,  7 Nov 2022 08:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BC910E1FC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 08:43:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id DCF6C5809A3;
 Mon,  7 Nov 2022 03:43:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 03:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667810606; x=
 1667817806; bh=Aq/rXhvOvHCvrLASPVtA3GhXPBKkD/XGjmzw/rPkVIM=; b=X
 Mzr/NIXE6ygs347sr9HjDgFFmGK0kq2KoXS6EvljdsT42q4HsSnbBFrXk17Pe+gZ
 dWbVuf6oW1+RlsFCQbTn544CssUriWkdV+D7FXCbxrEp8AxET1HdURrEBKJzUYip
 gVp212D/tSe6iCpYb8VYliJ6Hev5v0qHDCpkBoJUaujjvJGMUAqW8xJ0KWDbIhx2
 f5norJaeRYMtACTiES69qUrDVZarBnstpffE60GXGDd6KlKdXhD/p6mDfle1Oi4F
 tw8iedF5sTGvIEhGaml/Nc6ebkrPtqOu9NjXpE5BUxEsl1U9zmVbTM0yWe9Za4Cz
 JF3Za+gLAV5z5vYvIwltw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667810606; x=
 1667817806; bh=Aq/rXhvOvHCvrLASPVtA3GhXPBKkD/XGjmzw/rPkVIM=; b=l
 wO0TYr73LbJV0++Mo0Um+3yOostKt5yo2CyyIGo8HFTSTPAi2RrbvF/eRSp9o2o2
 +aEVg2asFpEDgNzFCjzsmWw/I+winn7en/mnpBxWoy/G9LDRZ5zDpfIzUw5/ExAf
 Y7SEm+UrAAGqRUJtHB7t0Xc50b9C6WaAjlDM4qjFcrD2PcYNYOE9QOiOy4F7vJjr
 fmjXTSUWCZhrxcaSeBX3LtrMMbHa4zhhWUrzwuBioKbLUhXVRM289XoLHGsg3xp2
 6zbPAykMclfzZdWbQloPKRXZpM9u+s22KxEGCZhH8wEOlTH1HKC+Jt2c+4+482O8
 Z39ITGRaZngh6H60+S0aA==
X-ME-Sender: <xms:LMVoYx7dsZ21l2kErXuCb57W6V-JAsoe4W4HyM-WpbOoXImjvs3hCg>
 <xme:LMVoY-41AhVywvyeK4JfUUsEXi7yGSMTiVKjjqjrhVi3Vf1Yt9cKCBrkudXStPFiS
 80CbN6QU3FxaDKrquA>
X-ME-Received: <xmr:LMVoY4ciLQGBbg4CzXUFW73ZhYqObOA6ViBEUq4OeCeWLiBj7LCQ0Jxh9VVQb2zHcTSkhAgpDRwjT3Ql7rjQtJFL6DUYyC-FaDJ1OEZlc5vEZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LMVoY6JplDgIhemcdbpXp5Yl8GMlUJ2C4lCcCvxIoPX9Qw0Zvdc0mQ>
 <xmx:LMVoY1JKtIdwUipzss4LM7NNIWStHUol6IdWpo5CiSQ2mvmoUJi-bA>
 <xmx:LMVoYzztB-PRe8uYYyegx0uiiyjfwD6LHztfsDpgQpUsGlbjTfSTUA>
 <xmx:LsVoY5TW4OQFLtlRuiANOQeiVNxH9XWmg3_g5ax-jjleBakAR9plvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 03:43:23 -0500 (EST)
Date: Mon, 7 Nov 2022 09:43:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <20221107084322.gk4j75r52zo5k7xk@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y2U2+ePwRieYkNjv@sirena.org.uk>
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
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
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
 Richard Fitzgerald <rf@opensource.cirrus.com>,
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

Hi Mark,

On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:
> On Fri, Nov 04, 2022 at 04:51:23PM +0100, Maxime Ripard wrote:
>=20
> > Just filling determine_rate if it's missing with
> > __clk_mux_determine_rate will possibly pick different parents, and I'm
> > fairly certain that this have never been tested on most platforms, and
> > will be completely broken. And I don't really want to play a game of
> > whack-a-mole adding that flag everywhere it turns out it's broken.
>=20
> Well, hopefully everyone for whom it's an issue currently will be
> objecting to this version of the change anyway so we'll either know
> where to set the flag or we'll get the whack-a-mole with the series
> being merged?

I'm sorry, I'm not sure what you mean here. The only issue to fix at the
moment is that determine_rate and set_parent aren't coupled, and it led
to issues due to oversight.

I initially added a warning but Stephen wanted to fix all users in that
case and make that an error instead.

If I filled __clk_mux_determine_rate into clocks that weren't using it
before, I would change their behavior. With that flag set, on all users
I add __clk_mux_determine_rate to, the behavior is the same than what we
previously had, so the risk of regressions is minimal, and everything
should keep going like it was?

Maxime
