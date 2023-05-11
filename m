Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97F6FEF0F
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 11:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253A10E20B;
	Thu, 11 May 2023 09:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A23E10E20B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 09:45:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1DB1658046F;
 Thu, 11 May 2023 05:45:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 11 May 2023 05:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1683798358; x=1683805558; bh=+n
 y1Afea5R0LOsb4Ol/qv4DwWMag5LYnjc/55L4/zj0=; b=a0a1Rny1fJ4G40ROVP
 p6PM59GR8lWf+QDz80KYNEFeugiu06rC7qXIkbxBgIPj+fnHgADOQ64y/5uCwHCp
 ND9TQdCBKeHcr01DP6q2O1PoMPgeXBLAh0RjsUVJlH+ligR1m5ygaiHk1JYfr5/b
 6A5rA9smFHn3zR+T7W1pjsKYaXutCZ8DcO5zlGPSNYCmACecxhzMW6Io20Sek8ia
 5Hzy2ES3fW2PM/dVnjCcvBUBaB9XXPBFRdGU8oaYDIXugWL2u/m5RD1IGjAZgeDL
 Ys6++ImgdON8U42Ak5RKwWzJ4l0j2C1g9pCsxZFAjQ4DGx6IcJuqHXLDNYHSyCh+
 e5nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683798358; x=1683805558; bh=+ny1Afea5R0LO
 sb4Ol/qv4DwWMag5LYnjc/55L4/zj0=; b=LFY23qSKl94UZOFuJkhpGEQyasRby
 gbLbyefMBRT4PHfaH6XkZ/rsSJL1fhXl5Re1rHJJnufX1e8Ff5yaTAa+0ed6d4uW
 95KjZizvZWx73mJmN9B6v1Mpzz+DiGGQTF0ThlwvQKQdmYJeHGroCpTvaBoNOBnR
 UFhpVmU7gsIXKI6OasqGZ7w6ABmjxxXCBndQbVZzgQYZZKfDFcW1tFpwP7AhA/+s
 a0Rl4SZ8A0+rEwO3Vh54J0hTXP8yZSv9SrOrHu5bF687MQB2r6sYOMdpdiA1kwBS
 KduLItK8Us0sRRMcA8oSZjbsBqo0MsVpsgbUdIlRPRygOcN7p0/FqdJxA==
X-ME-Sender: <xms:VLlcZGJVw0ZFHGVEz1kscSfJdJJXnN-TSM-V95Ff4Ctlc9pjeMDCMg>
 <xme:VLlcZOKCL5q-tMt6tcn0vAscmNATB7rYoM-EtfoSqE8SGtH_zNIhZ3jFqsl_K60In
 yFrILW2iTk3ZVOiDEg>
X-ME-Received: <xmr:VLlcZGseivHmMWqVb1OuVX_cXeveSNbIlR_VP_5mkZsAJgAWttluVtJrrjzLJIymBC740bbDgW8KvsJ-w-7GBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VLlcZLaBqggMF920o1RrZkXQR5WlFDgcp9oqhhV5oKPXDaeCOHXlbg>
 <xmx:VLlcZNaCLoXRnpwnUS4klYEv95-jdtjx1TnWjWgpXPJZ0nY-i1d61g>
 <xmx:VLlcZHCViDDrk4Pz_ZQ6l_qK2lbm3BNWgwwXCSplVHHAxYXZRmYXgA>
 <xmx:VrlcZIjbcbR6-ocUtg6G1yyfYRrVst63f1irq8-6dnFMlLckdA-lWg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 05:45:55 -0400 (EDT)
Date: Thu, 11 May 2023 11:45:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH v3 29/65] clk: socfpga: gate: Add a determine_rate hook
Message-ID: <x4xc7kjkphbejmjj35ohlk6u33vshysr4jii4fmu7ogbzrk6zg@2dry3apxjhad>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-29-9a1358472d52@cerno.tech>
 <679921ee-98d4-d6ef-5934-e009fd4b31fc@kernel.org>
 <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
 <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
 <tgtfisqxubin4cjj6q26fboirbcnjzcazt5y3m322lw5lskz6l@d3tgz4hdfnk2>
 <1b766164-b5e8-61ac-bf73-6d2c49c72409@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jwj5rc6xyemnxcyt"
Content-Disposition: inline
In-Reply-To: <1b766164-b5e8-61ac-bf73-6d2c49c72409@kernel.org>
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jwj5rc6xyemnxcyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Tue, May 09, 2023 at 12:37:39PM -0500, Dinh Nguyen wrote:
> Hi Maxime,
>=20
> On 5/4/23 12:04, Maxime Ripard wrote:
> > Hi Dinh,
> >=20
> > On Thu, Apr 27, 2023 at 02:09:48PM -0500, Dinh Nguyen wrote:
> > > Hi Maxime,
> > >=20
> > > On 4/25/23 09:48, Maxime Ripard wrote:
> > > > Hi Dinh,
> > > >=20
> > > > On Mon, Apr 24, 2023 at 01:32:28PM -0500, Dinh Nguyen wrote:
> > > > > On 4/4/23 05:11, Maxime Ripard wrote:
> > > > > > The SoCFGPA gate clock implements a mux with a set_parent hook,=
 but
> > > > > > doesn't provide a determine_rate implementation.
> > > > > >=20
> > > > > > This is a bit odd, since set_parent() is there to, as its name =
implies,
> > > > > > change the parent of a clock. However, the most likely candidat=
e to
> > > > > > trigger that parent change is a call to clk_set_rate(), with
> > > > > > determine_rate() figuring out which parent is the best suited f=
or a
> > > > > > given rate.
> > > > > >=20
> > > > > > The other trigger would be a call to clk_set_parent(), but it's=
 far less
> > > > > > used, and it doesn't look like there's any obvious user for tha=
t clock.
> > > > > >=20
> > > > > > So, the set_parent hook is effectively unused, possibly because=
 of an
> > > > > > oversight. However, it could also be an explicit decision by the
> > > > > > original author to avoid any reparenting but through an explici=
t call to
> > > > > > clk_set_parent().
> > > > > >=20
> > > > > > The latter case would be equivalent to setting the flag
> > > > > > CLK_SET_RATE_NO_REPARENT, together with setting our determine_r=
ate hook
> > > > > > to __clk_mux_determine_rate(). Indeed, if no determine_rate
> > > > > > implementation is provided, clk_round_rate() (through
> > > > > > clk_core_round_rate_nolock()) will call itself on the parent if
> > > > > > CLK_SET_RATE_PARENT is set, and will not change the clock rate
> > > > > > otherwise. __clk_mux_determine_rate() has the exact same behavi=
or when
> > > > > > CLK_SET_RATE_NO_REPARENT is set.
> > > > > >=20
> > > > > > And if it was an oversight, then we are at least explicit about=
 our
> > > > > > behavior now and it can be further refined down the line.
> > > > > >=20
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > ---
> > > > > >     drivers/clk/socfpga/clk-gate.c | 3 ++-
> > > > > >     1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfp=
ga/clk-gate.c
> > > > > > index 32ccda960f28..cbba8462a09e 100644
> > > > > > --- a/drivers/clk/socfpga/clk-gate.c
> > > > > > +++ b/drivers/clk/socfpga/clk-gate.c
> > > > > > @@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rat=
e(struct clk_hw *hwclk,
> > > > > >     static struct clk_ops gateclk_ops =3D {
> > > > > >     	.recalc_rate =3D socfpga_clk_recalc_rate,
> > > > > > +	.determine_rate =3D __clk_mux_determine_rate,
> > > > > >     	.get_parent =3D socfpga_clk_get_parent,
> > > > > >     	.set_parent =3D socfpga_clk_set_parent,
> > > > > >     };
> > > > > > @@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device=
_node *node)
> > > > > >     	init.name =3D clk_name;
> > > > > >     	init.ops =3D ops;
> > > > > > -	init.flags =3D 0;
> > > > > > +	init.flags =3D CLK_SET_RATE_NO_REPARENT;
> > > > > >     	init.num_parents =3D of_clk_parent_fill(node, parent_name,=
 SOCFPGA_MAX_PARENTS);
> > > > > >     	if (init.num_parents < 2) {
> > > > > >=20
> > > > >=20
> > > > > This patch broke SoCFPGA boot serial port. The characters are man=
gled.
> > > >=20
> > > > Do you have any other access to that board? If so, could you dump
> > > > clk_summary in debugfs with and without that patch?
> > > >=20
> > >=20
> > > That dump from the clk_summary are identical for both cases.
> >=20
> > Thanks for testing
> >=20
> > I'm a bit confused, there should be no difference in behaviour, and if
> > there was any difference I would expect the clock tree to be somewhat
> > different.
> >=20
> > Could you still paste the clk_summary (and dmesg) output? Which UART
> > driver is being used?
> >=20
> > Also, is there a way for me to test it somehow?
> >=20
>=20
> Apologies, but there is a diff with/without this patch:
>=20
> With patch:
> <           l4_sp_clk                   3        3        0   100000000
> 0     0  50000         ?
> ---
> Without patch:
> >           l4_sp_clk                   4        4        0   100000000
> 0     0  50000         ?
>=20
> The enable/prepare count is 4 instead of 3 in the case of a working UART.
> The debug uart is using the lp_sp_clk.

This is pretty weird, the enable count shouldn't change, really, we're
only changing something in the rate rounding path... Is it using the
snps,dw-apb-uart driver?

Nothing shows up in dmesg?

> The Cyclone5 devkits are pretty cheap if you want to get one.

Are you talking about the DE10-Nano? It seems out of stock everywhere in
Europe :/

Thanks!
Maxime

--jwj5rc6xyemnxcyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZFy5UQAKCRDj7w1vZxhR
xQIDAP4vmB3HyvWG6uvwLSOB1WMHUejwVKumXbB/B6a/fLmtBQEApiEQi3pLDYQt
OaahdgfV4a9cmtvor4QvkqvX+jEBuwE=
=ETpg
-----END PGP SIGNATURE-----

--jwj5rc6xyemnxcyt--
