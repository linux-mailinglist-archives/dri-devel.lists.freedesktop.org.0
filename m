Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74761F270
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B444C10E2F7;
	Mon,  7 Nov 2022 12:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306B10E2F7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:06:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2025C60FFB;
 Mon,  7 Nov 2022 12:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DD2C433D6;
 Mon,  7 Nov 2022 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667822783;
 bh=TjwC/oCNbbUzKPDP67kFN1hAvayD11aeO+3EJVwBAHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVU4PMxo1R8a3xp/WKHs1dq/6doMgdlOpIsmcirQbv3czoZbcxWJpPwnRrBpNnLaM
 RIaI2ploJwL3I8PSy07X4klDoFGje/zAjmQm0GMafEh6v9eSVzb3H6UHbMJeGYIK/0
 3HkQjVeGkkfj4w3q16A9Jpu8h/eTG5MQNUyBXtMwVQBVCZBvcrvN6PBx8wq4Un2SsG
 waxoneKGslH7u6FU8MFJJQeOVg92oqhsWrP6aKBcVt7eUdvfzyvh8bep0OHaNEym9f
 kwo9TcnG/5EsDXRnkiFTaef9nelMlw97dI2zZnD+Bud8Et09b4EPGmFQOKomMmC6mm
 cuDEys2QhiEog==
Date: Mon, 7 Nov 2022 12:06:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2j0r0wX1XtQBvqO@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk>
 <20221107084322.gk4j75r52zo5k7xk@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fjklijebr6IM77Hd"
Content-Disposition: inline
In-Reply-To: <20221107084322.gk4j75r52zo5k7xk@houat>
X-Cookie: Minimum charge for booths.
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
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fjklijebr6IM77Hd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 07, 2022 at 09:43:22AM +0100, Maxime Ripard wrote:
> On Fri, Nov 04, 2022 at 03:59:53PM +0000, Mark Brown wrote:

> > Well, hopefully everyone for whom it's an issue currently will be
> > objecting to this version of the change anyway so we'll either know
> > where to set the flag or we'll get the whack-a-mole with the series
> > being merged?

> I'm sorry, I'm not sure what you mean here. The only issue to fix at the
> moment is that determine_rate and set_parent aren't coupled, and it led
> to issues due to oversight.

> I initially added a warning but Stephen wanted to fix all users in that
> case and make that an error instead.

My suggestion is that instead of doing either of these things it'd be
quicker and less error prone to just fix the core to provide the default
implementation if nothing more specific is provided.  Any issues that
causes would already be present with your current series.

> If I filled __clk_mux_determine_rate into clocks that weren't using it
> before, I would change their behavior. With that flag set, on all users
> I add __clk_mux_determine_rate to, the behavior is the same than what we
> previously had, so the risk of regressions is minimal, and everything
> should keep going like it was?

The series does fill in __clk_mux_determine_rate for everything though -
if it was just assumed by default the only thing that'd be needed would
be adding the flag.

--fjklijebr6IM77Hd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNo9K4ACgkQJNaLcl1U
h9CrmQf/bbIS1m2oXUj6n0mwM7QBssq/2mPiYM5zHCkJ5nf48MDZPWSwMuq37myq
q8lR7tDeZBdU/MtjTTpvWo8j/TLyZRrhWhX5rItRjfhZdXtePpp0tci4nHKyvWuD
Lc6+WJkeyUQsy93Y0qyvKl9DZ8o4Dyqs/lM7kkCEy+9eJNaT7QFAFZYhdUN2FJAR
2YiQG2mvchxdE7SyVxMsOfXX/J6haXQKAcKej6M1HpuJukPGEKH2N9WqfKKNUuWY
rMJ0QnheSBUxkPHRzdDOMo2k+xDK6cOSg8RxRtKQ2djWWWXII5JWs6VyVHLeK6Cx
9KTsnJ+fIbHK0GK9Pq3vm90Uk4W3Ng==
=y36Q
-----END PGP SIGNATURE-----

--fjklijebr6IM77Hd--
