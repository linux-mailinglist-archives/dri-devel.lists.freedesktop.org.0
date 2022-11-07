Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48461F272
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9B510E2FA;
	Mon,  7 Nov 2022 12:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571B410E2F7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:06:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 1008B2B066C1;
 Mon,  7 Nov 2022 07:06:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 07:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667822776; x=1667829976; bh=B05aDEGhPx
 Oz9qxjqo1oM6WpXvxfjmgCQJwzLTnqx7o=; b=c4zx5wLHNyF7xm2AkdGG3OUdCb
 RO+l5I2vtO9DaajfBbNfka/dBUIMlboYQcCfJquVMcsj2o9/zEXEI+l2hSRokeuQ
 aqNSYIxr3Y0epBEAgaNnOXQEU50pT5NaDa4fjXvmfNBKbpt4a25wAzOIuLNEMx/j
 a0NvDSHSwrN80f0eXo5zTMav2ja+eJjpbZgEWPnOAm5hx3UlDuHHMYVNOnwUKcFK
 JhVZU1uK1lCqT7Xt4pPHgtY46Pm/9MWSSmC1SBPYRRzq2x1wtOtWfJwfe6msiD2s
 4ftE1AIcyhD+AKlWVDWP4DZo5gxXIpFxRJOhKEGEM1+6Kwb5JLctiyuKQ9Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667822776; x=1667829976; bh=B05aDEGhPxOz9qxjqo1oM6WpXvxf
 jmgCQJwzLTnqx7o=; b=uf/zn+bV9iXr/LMxeg8+E1bMrkdm7AISotuw6SbdRTQ/
 bmzu2ZkuuQ5Jzt9xaNZorZoCwetVElpGMEulW+HJm7DFbhBqjRt+oBvI0saqW6ha
 tgMnQ7xcD7FkrucW5A6s2F1c65udztNZ8ZiWPc7xzXIrky/pP6cidenYwLXJ/N/a
 tM/RVYNM/OYKZDXwL9GL4OfR1g5xTlYcDOpTl2Vwv69y82DJ0f0qvqbgBPSIigA4
 pqPSSpx1zgZLtTapbWIl0Ddl7gEq0y+oCYBzSYLsR+EeoYvAAknIs3WM8s/Nx/5b
 jpyc8SaYuZkTPLAbmrS6XMc+jTmbPIH0iOmo3sv8bg==
X-ME-Sender: <xms:tvRoY3PFGlEb7RJaNxEM6Ugu14yWdBktiA3qTs6-BrcOTKxv9PtG0w>
 <xme:tvRoYx-AxZ1WQ5KPyQzG4GSF9nOnWeHRYhvJyXfy3N24GhiD2xu75K_OjpfjagZWV
 y90fJJ-e5lUpDTgDzY>
X-ME-Received: <xmr:tvRoY2S_J5RFPZf-4wkcmwOCc_x7XeD76M1-byAnNeAtf22t62skzxbyLnsciOlkPyG3wB15U761HZLZq9yhVcKMElIgfcsK48JM6SyhT4FcOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tvRoY7vB8zdfJRUWlKeCfXorc4DFpIxrb30X2e71xu4KD0Npw-oSFw>
 <xmx:tvRoY_dCf9FHlSc7kwHzI7umAVLs1tZN4BwIBGyAX4-0zxT4lWdE_w>
 <xmx:tvRoY30J9PfIrSDM30MzXkeEfxvgGhpJ0dFzuHYby7zDzSEEdQesmg>
 <xmx:uPRoYzkpBG9adcnPxB-xonp3ewdKFqQr6dIQjDA-sX9kYmvTYh0sZ_NCjqM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 07:06:13 -0500 (EST)
Date: Mon, 7 Nov 2022 13:06:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 21/65] clk: davinci: da8xx-cfgchip: Add a
 determine_rate hook
Message-ID: <20221107120611.vutsgpgpcorsgzwp@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-21-f6736dec138e@cerno.tech>
 <187e61cd-7d02-2453-acf1-30180559d42f@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nc45elwfwbnglqoe"
Content-Disposition: inline
In-Reply-To: <187e61cd-7d02-2453-acf1-30180559d42f@lechnology.com>
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
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nc45elwfwbnglqoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Nov 04, 2022 at 11:45:17AM -0500, David Lechner wrote:
> On 11/4/22 8:17 AM, Maxime Ripard wrote:
> > The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
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
>=20
>=20
> The parent is defined in the device tree and is not expected to change
> at runtime, so if I am understanding the patch correctly, setting the
> CLK_SET_RATE_NO_REPARENT flag seems correct.

Is that an acked-by/reviewed-by?

Thanks!
Maxime

--nc45elwfwbnglqoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2j0swAKCRDj7w1vZxhR
xQMwAQCrPeeZ2S11jlGiajn8sRupqFc/kS+IENFSoo8u57CVDQEA8P8p1AEYl25u
k96e3hU7z8K+yJbTwZo5iph4D4IHFww=
=Sagk
-----END PGP SIGNATURE-----

--nc45elwfwbnglqoe--
