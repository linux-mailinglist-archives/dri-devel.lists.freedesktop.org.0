Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CE76D8200
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE410E0EA;
	Wed,  5 Apr 2023 15:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DEB10E0EA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D76FB623C3;
 Wed,  5 Apr 2023 15:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7C9C433EF;
 Wed,  5 Apr 2023 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680708886;
 bh=q6hazTR3zs7E7OVM3zxpzK5DagX6jtQENEamOL0SGKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlbEhXatZkXJ9X7FsGvPf2rH95VpY5tOnyIMJWR/0y9to3LuusuWOEW94RzKcDlKg
 HsFf5CsPOKukH8P5uoSP2Z0JlxMdLwy9OxF/8G86S5WBCQNQtEOwVMDqSea8cvrsDU
 564oj+TiTuatTLbxixAITrHG3+c5+iQ5kEWuaj8LLDEFmeZMfABdscXZNA/eAMWJAk
 0YkRM5fCov8t3qCX2aBvV3kmH3qO4N9tKQnMqdz4QY5qygfyDOUcQlTmMnAu3at4ih
 jXuoUGUjvrX+RS3OfX29rQcD6mKS146C1VyprHv8nlDm6+/mgIZ+D1r/IpS6sIO5UV
 4+HTzWQ25QIJA==
Date: Wed, 5 Apr 2023 16:34:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <fcc11e4d-eba6-4eff-b3e5-9488a4da84c3@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-43-9a1358472d52@cerno.tech>
 <01f32440-8dd2-4030-9006-a3123be55845@sirena.org.uk>
 <erm4iq3mygnrr4h2gd5cag3sfuovv47ibdqsbmxcfabngvnwy4@z63ksvj55zuu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rWy5+BLE6plJ+54H"
Content-Disposition: inline
In-Reply-To: <erm4iq3mygnrr4h2gd5cag3sfuovv47ibdqsbmxcfabngvnwy4@z63ksvj55zuu>
X-Cookie: 1 bulls, 3 cows.
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rWy5+BLE6plJ+54H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 05:17:21PM +0200, Maxime Ripard wrote:
> On Tue, Apr 04, 2023 at 04:26:18PM +0100, Mark Brown wrote:

> > To be honest it's surprising that we'd have to manually specify this, I
> > would expect to be able to reparent.  I suspect it'd be better to go the
> > other way here and allow reparenting.

> Yeah, I think I'd prefer to allow reparenting too, but as can be seen
> from the other reviewers in that thread, it seems like we have a very
> split community here, so that doesn't sound very realistic without some
> major pushback :)

For these ASoC drivers I think we should just do the reparenting,
they're very much at the leaf of the tree so the considerations that
make it a problem sometimes are unlikely to apply.

--rWy5+BLE6plJ+54H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtlQYACgkQJNaLcl1U
h9B5kwgAhgnq7R11Qu+B0UHvMPR+YuXSbduHynE7TqBLfStAOBSo1K13PASgQaa9
wrmguaiF0D05AzsDdSViUh7jt1zNtO3da+OYl8oXujrIbMZbGni9L/fGVLPLH9LH
S4EKLVYbDM7dTpVx0aDXvlVCYW21kOHRWWv/J6PmtESnjJOfnQGHe3Xs1h8ZgovN
olevNVv7bIIBbK+syW2trg9ueeQFhIP8zFvA7seKaKplyJQN6b6ZBpF5/0RIVobC
9KooGdA4p3nEKzSBi+TYDZL/NYxlB7m/Y8nMussyk40gnvHmlVGYXLA0nVd3MP6U
GEwYUUby6V7fvlt7mTxduZug5WAoPQ==
=MZpO
-----END PGP SIGNATURE-----

--rWy5+BLE6plJ+54H--
