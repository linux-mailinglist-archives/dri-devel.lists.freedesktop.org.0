Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2761F69D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1043D10E390;
	Mon,  7 Nov 2022 14:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733F610E390
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:52:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 10FC32B05D99;
 Mon,  7 Nov 2022 09:52:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667832726; x=1667839926; bh=pH9EnTs5L3
 AE9yRrf/TOfLTE3vMWtMQ5hIBy7+jkfxo=; b=F7wDDyPbg4B6cj4BQiM8vMTPkt
 tkEJFLYEYVOXIksN+jqz4ftMcxZZXnzOddYWfqs9q6bd1iOFwyhB5pE4Fvz/05uZ
 RF10RSC0RzcIedJ1G2E1LSQq4Zg42bEfK0TSyO7m7id0Yy1xeUuD5zWJX3us817V
 rjIfPInA1Vwm/QlX4DnPJzUv40Z0ii9fRJxzgHqkydlEG9GHtOtzfSoBBYVuklOY
 znHltzYI/nV8aA3pqWRO9oD9yS5dvx0Tnbouc9wI5DeGckOnRznPX94uGeI63tXw
 4a6YpykXCScaYQzL11169W/UCCuCj+CqGjGcj2LOgIC8IwvROeIK920PT8Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667832726; x=1667839926; bh=pH9EnTs5L3AE9yRrf/TOfLTE3vMW
 tMQ5hIBy7+jkfxo=; b=tm2CjukNyGky7m61cEbNeNPEwlXow6RPoGg2KjXghbKg
 ra/lLyp2zKjbGDhKlZm+A1NYUYItu9u5SMkA9pJHis1as3Cuaw086EXYoGiWAwEc
 kwmgNzmeS59QVCIvcfLkrQ+Ebrrzyvxm0bLZzUJt64WJNOdWIwV+A1Lm0sxt1PlG
 pqQrTshYGPUOlH25VHE+1Lo/JkFnLumTSx7pnL0tNbn51t3OP92FWPXw0EfQztVG
 wtJ4RnEpesPcGbqI0l7+PnoJguGMz6X3T6Oc+iWlaBg8/BNZZbD/jeW+bRR9Y7Mm
 aeVy4dRLsyWLoksEM3gODq0m5OD2atrQxRTwoulo5w==
X-ME-Sender: <xms:lBtpY-40Eo4JzBjQaFjHtoUz7QeBdEwcwbk96GIlHmmJELkNOdiNuw>
 <xme:lBtpY355rFDdDU_5_Zhsu6BuYYJ8FsknqxkvYPdHiPLl5stDZ4ymxPAwZCGrhq1q0
 rYmNowEFVM52RrtcrQ>
X-ME-Received: <xmr:lBtpY9dGH4qlk66IJxrnFOeAg7gL0Dzov_oSAqI9d3jUn16Bj4wfUEZhAxYh6xwVb1pD_70A4Fj78DNZ9hmuXeqDZ6FtyKnnZ6v_m9fVoJ9KEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lBtpY7K_De75Z1Qb3KnMLSjsRajiL-H-Ua3gdzprEa6elskIEslNHg>
 <xmx:lBtpYyJPcAZLuZCZ9YrgeNVP2SDE0zyvQMv9GMV_qnwg12P9XLOYhg>
 <xmx:lBtpY8zZKJW8BWrb3kvSxaP7pHRcbh-yGdZ8oBvUaVqZHP2VBvAXdw>
 <xmx:lhtpY2R7H97-NMegP3mWI1QxFbMYDvDajfqDlJ0guaZiDLR4Zxs1FRw326M>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:52:03 -0500 (EST)
Date: Mon, 7 Nov 2022 15:52:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 54/65] clk: da8xx: clk48: Switch to determine_rate
Message-ID: <20221107145202.2mne5p2sa4l2dm6g@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-54-f6736dec138e@cerno.tech>
 <6296d944-e03d-6f2b-48b1-3dad78e3c89d@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kwjqag62r4ghubsj"
Content-Disposition: inline
In-Reply-To: <6296d944-e03d-6f2b-48b1-3dad78e3c89d@lechnology.com>
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


--kwjqag62r4ghubsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Nov 04, 2022 at 11:49:34AM -0500, David Lechner wrote:
> On 11/4/22 8:18 AM, Maxime Ripard wrote:
> > The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
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
> I think this one should be the same as the clk:davinci changes and
> not allow re-parenting. Since this is a USB 48MHz PHY clock, a rate
> change will never be requested.

I'm not sure, it doesn't seem to be the same clock, it's not doing the
same thing (this one will always force the same rate, the others let the
rate change), and we're not doing the same refactoring (this one had a
round_rate implementation, the other one doesn't)

Maxime

--kwjqag62r4ghubsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2kbkgAKCRDj7w1vZxhR
xdnyAPoDUCObUrCr2C1a0eiJzKGIcW+Cl1z7L7QadhXWYBxPJAD+K5Cnal04FAYQ
nw7UCY5eZErrD6YvLzwUrAeczrFXVQw=
=GExv
-----END PGP SIGNATURE-----

--kwjqag62r4ghubsj--
