Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71776D8191
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB47E10E0A9;
	Wed,  5 Apr 2023 15:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2110E0A9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:19:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 95FF22B06725;
 Wed,  5 Apr 2023 11:19:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 05 Apr 2023 11:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680707950; x=1680715150; bh=N4
 c3eeJxURi8JXim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=gKmMuTGX4nhOP5LI8Y
 E+p/fl+lzjYAUVjkZAxOcgMyfnvceh+EPXSaK4hHdklMDKUo+7X8uDlGKLDM7YrF
 sGg+TkumCGduStemV3hSEOod80SRIuqnVBjPCz57RbgXyt/JCsea9kGlEGHD9ZHH
 4uYBmeLVKiWZRuqWeUmq4vUsloGrTNXrcZHyz42mXBY+jnF6RqsUJfP3g+hbx4CH
 JR626fKDz3Kx91OKG6zoAb0lhAY8BRj2kyH+aSBqRWk3fBm+tmycjA9BvxMtFwK2
 /uN/4REMsnOfiA8YkWEUr9NvX5awfUPDqecs/KGItASKIgB/OjRZa6JP4GBtcIV6
 ixhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680707950; x=1680715150; bh=N4c3eeJxURi8J
 Xim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=us63aUQDG8MBsBWKxVkd677OWUlyf
 GvyT2ZsDR/MSDXYyBEFPCLr1u77TLVEliJJkxnFOHOryhOssawtom9Fx/GCxXE4Z
 g9WMcBZDBFFA0M55NPj/afG79rH+QSlgwKxHdEscFKqJAGzLCKXM08O4CAyNZ2oY
 92l1EUMRUsxYBOKTBCNAueUm0hLDh9wXQ1aH2hSa0Pyqo+ic5Vn/E1K8RUuJ+Akx
 niaY+kBJb8HA94y9MapEeW9khd6W27wz6/o4LBZwUwC1yikHIaKv9+Y3YHHV23Ax
 Pbttvpu2mHJMkMEb/nmxw4VL5SFuEUD85xEXcsCOFmUo4Ir1bozXJcnQw==
X-ME-Sender: <xms:bZEtZNE5d3frgjNyqfY4l4F96Ieu8m-0_ET2EQHW54skrpLdDPxMkg>
 <xme:bZEtZCWAV86vqtY8x0YAOfOyxP_Bjovfu1KEbcIJIGQZNkI_NskC3Z69zIE7bSKWK
 uPorUWm3E5jHLYZiX0>
X-ME-Received: <xmr:bZEtZPIl36enYyRYWtnwtZFjoGIm56RgFEgNNgHuHH1AdVooqXLB1xvAQ3eU8FqyhyfYmeQzT8INbzvXCyXiYFQA7dPIxNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
 ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bZEtZDEAFhIsFMFa_rlEYJjQtmNAX1yXFgltj8Nc2M4E7IronNQkYQ>
 <xmx:bZEtZDXf-V7X3wB2ItBeZXqRwyUd7foTYp81_5ZftvCbRnJ1NVcG-A>
 <xmx:bZEtZONDsCr9vCSxxuST4o6jdEcH6VhtDEUAn3vwkAzrVLVhcbzMRw>
 <xmx:bpEtZHehzz9o1Op1NisRQXvvRBZ08CdWKapQjpWmxXPTk9Z4sCWpZcg2CZ8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:19:07 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:19:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <o6odr3i3ypj6p6vxuiwgymll3bew544mwzcgs6hjzum5uix43j@galqy4lxjdvx>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
 <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7run534ck55yr3bz"
Content-Disposition: inline
In-Reply-To: <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
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
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7run534ck55yr3bz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Apr 05, 2023 at 03:04:05PM +0200, Paul Cercueil wrote:
> Le mardi 04 avril 2023 =E0 12:11 +0200, Maxime Ripard a =E9crit=A0:
> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
> > doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name
> > implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far
> > less
> > used, and it doesn't look like there's any obvious user for that
> > clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call
> > to
> > clk_set_parent().
>=20
> As I said in the v2 (IIRC), clk_set_parent() is used when re-parenting
> from the device tree.

Yep, it's indeed an oversight in the commit log.

> > The driver does implement round_rate() though, which means that we
> > can
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
> So just to be sure, this patch won't make clk_set_rate() automatically
> switch parents, right?
>=20
> Allowing automatic re-parenting sounds like a huge can of worms...

The behaviour is strictly equivalent before that patch and after: the
driver will not reparent on a rate change. It just makes it explicit.

Maxime

--7run534ck55yr3bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2RagAKCRDj7w1vZxhR
xXf2AP4nVXXgdZbFLKpfLcLqHQU/yEaza+nOToxguQnpy3rPiAD/VqJ8EWDR1dkZ
KO3BzBJio00Kuw94FyundvDtvxXOygg=
=yU4q
-----END PGP SIGNATURE-----

--7run534ck55yr3bz--
