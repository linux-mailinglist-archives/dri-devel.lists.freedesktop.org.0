Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6E619C66
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 17:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767CA10E8C8;
	Fri,  4 Nov 2022 16:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F2610E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 16:00:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3396BB82ED8;
 Fri,  4 Nov 2022 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407C5C433C1;
 Fri,  4 Nov 2022 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667577610;
 bh=RnKpU/hTdTSmTNhPFE1pRi4HN2+uJR5IYJ3mHMOQJ94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cT/Z80DQRnPv/70/29SwYeenhOJLyjbBPUFlgfpd/AZinAJl0ffseRleU9nuJBUko
 sIKZREqhjpM5ixmbGPtno+npoo5AfZQueFrKX4MHj5HbO6032QcomMPEs11RxlCRCF
 +npEC1nMjw2yzXE3+8fu/b6DX5Zyh1ekZsGoJSUiBNkV8rAVlWCjALi+TPQALz5yLf
 8JmAJZSyXbUsqNPG3SJPuUdwaXQ/YK17sNKIv6mAuSRsBddzrpVxhgHxOUN/vVDF21
 VhZaoe2BNXMOANIoVRwbo95TtqPu/Q5GIO4aUt0cX2VGbao265lJ1lyL1fG/C3KEu+
 lOiIL5YO6XPRw==
Date: Fri, 4 Nov 2022 15:59:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
Message-ID: <Y2U2+ePwRieYkNjv@sirena.org.uk>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk>
 <20221104155123.qomguvthehnogkdd@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UFrR3s30/s3KKRzK"
Content-Disposition: inline
In-Reply-To: <20221104155123.qomguvthehnogkdd@houat>
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


--UFrR3s30/s3KKRzK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2022 at 04:51:23PM +0100, Maxime Ripard wrote:

> Just filling determine_rate if it's missing with
> __clk_mux_determine_rate will possibly pick different parents, and I'm
> fairly certain that this have never been tested on most platforms, and
> will be completely broken. And I don't really want to play a game of
> whack-a-mole adding that flag everywhere it turns out it's broken.

Well, hopefully everyone for whom it's an issue currently will be
objecting to this version of the change anyway so we'll either know
where to set the flag or we'll get the whack-a-mole with the series
being merged?

--UFrR3s30/s3KKRzK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNlNvgACgkQJNaLcl1U
h9CDMAf+IBF/7wHY1CiObYqxme229wA2t2WnnYY98dUUNS5r9zuNUi7juhvrvn+E
VFS2XsBkk6YvHvT2mQdVWxnTb3suMHPfHzr2euHUVwNVevnBNKDVYp8nlYmyRSUC
orLXibEBBMbA69rPzQyaFqZHj17zEyWQvHSrWk44MnQJH2f7JFEmcLPXgug1dpsP
mmWyfYnKKlRXMqDPkJ3ozY2AaABQkWdk64ke2unO7z9M7ySybhybPHBibISAn/WA
8mQ7NgbHPzpVnTCfrRwSEd05eCvJaEacBYFByW87lEEEtfxwwJsXSZCJpmc9ZVPm
WTCliiQC4/Pd0EJKpPQCXYinp/27fw==
=2DXe
-----END PGP SIGNATURE-----

--UFrR3s30/s3KKRzK--
