Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6151C619BF6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AAD10E89E;
	Fri,  4 Nov 2022 15:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F0210E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 15:45:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37BAB6226F;
 Fri,  4 Nov 2022 15:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8DEC433D6;
 Fri,  4 Nov 2022 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667576710;
 bh=E7bcdLSHvaAKIPE4ct56X1unFntQqaD0pUdA4q8WBPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iW2uzuyJnRpdzdYsOnj4Dp2jfgwg/wmolQBPj30EcOuf2VsVt3t2KGn1L2da6vygL
 dgk5H4xlPxNq7WJE0fBxhwwvtqV21rDvvnmzLfxGQBPtJoKomuEvU1KudXZgKZ8wWW
 ZyxZO03YbaXh9LiyJ5Q4bfCvW1rwPZBk+tFh4ZHJfT60Uz3U5Lx1kVzYWIMttyDcmD
 1TCxAOUJvc5dGmcoXZCI6AMCi4ilnI9/qlyIWWcoQ7fbhky8dXIQBZ3lKFJwFgma47
 E5YyYFEuly9dIIRudPC0lqTN3GuIIXhBvPqf35m07Cag87dJ8kurm8ACuWPQ12Y02s
 DtcPhURUzZJKg==
Date: Fri, 4 Nov 2022 15:44:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2UzdYyjgahJsbHg@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fVhQhryKijuhlxQZ"
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
X-Cookie: Quack!
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


--fVhQhryKijuhlxQZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2022 at 02:18:00PM +0100, Maxime Ripard wrote:

> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.

> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.

Given that the current approach involves patching every single user to
set a default implementation it feels like it might be more
straightforward to just have the clock API use that implementation if
none is defined - as you say there's already a flag to indicate the
unusual case where there's a solid reason to prevent reparenting.  It
feels like the resulting API is more straightforward.

--fVhQhryKijuhlxQZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNlM3UACgkQJNaLcl1U
h9C5/gf/ZAWh5zvkI1qjXrZhZu2SWgV5WGeNOTbNz15+lAF9tH5C8ilg87uyeZMu
FqNtaI2yJVBQ3uV+LbG0gypsDTeJ+LtfC+/saRJdP8mYUIu8fO9g6xzs31D73Vd0
9DOeN92+hX3GUcy6kFSTwgF5zVmvHnwOewIOly65XCHvibSgBRyAgV1AyNmH9uiy
zgVO88CdCE4NwAuMynXAR8mi+U4b0vDuk6EQ5UZjLJWWNRjxvFFJrcMCHISRJGsT
yqZJd8iCFTk91ovn3IKGno5MZ5tA8qWSJ52cBxs9VRKqQhQuWQl4UD4qwWdgwN6Y
liuJLyjGo/OfBHnsuDkzhj30nFiIUA==
=scaI
-----END PGP SIGNATURE-----

--fVhQhryKijuhlxQZ--
