Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2086EE42D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 16:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ACD10E0A7;
	Tue, 25 Apr 2023 14:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF1510E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 14:46:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 07934582407;
 Tue, 25 Apr 2023 10:46:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Apr 2023 10:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1682434013; x=1682441213; bh=en
 1RVV51OfqfCNU3FiRu/BosXNaMgZdQKojjPV9z+Rc=; b=fQzHTOZ6paF2GmxznV
 Yv4EqX4UawQN8UDH75BiX1XxbOrFyU34s885PjMpGmyFMhfA2Gsr+GJx6hMQ05IV
 0gJ+lU3HbK6G0vkyPFGb5q6b03Ka/Q4k6BOLyanUIeemgQyB0Ih17ta8J99y/cug
 hpRzOQ0KZRKhiCAUBGW5XcWVmf6BFlMx5FwlMlfY5UXqPWl0BcywSTzuBly2UEjc
 h7AU70R3O5OqjWix8REwSV3sblDjCOI2srd7fKlv5IWutajBwGjvCxdr76mhCs9N
 qkjPjTojtlO9cHj0dmUJuooH30DNVLAGbFufLHaBIbG9LKaU3ZUUmQji0imf2S/V
 N9aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682434013; x=1682441213; bh=en1RVV51OfqfC
 NU3FiRu/BosXNaMgZdQKojjPV9z+Rc=; b=I4t0FWm0dd6OFi2aSkWgpBABu+oaf
 WqgmyEJsiXORvFRmbJmFTqpY0AGTB7ZiQOFWetUU/JNxbjy4awAyYQ4JFunU6fQf
 Rz+Oo/78vsrhL7Xkd8XgDdzZc58Sn+bc2bhSNb9apFI6z32c4uxp7Jb7/JF84hLo
 50q5CCLpg7WyRTIQ/jjJak+lY0QtglRaq5zbBVpM7F0ejZDuJ3Jty6mNptPCS4lH
 IAavcbAaVhI2BTifppMGXs2pXMyXaUtNaP1H9y8Nfjphg2Obw5TFmGQit0AgN9sQ
 e6tJfBVMAZW+5CiaANrEmAqkn2M7v02jYqf1Ma7CXd24tcB0Zncp/Xktw==
X-ME-Sender: <xms:2udHZFwZ_QIiF6SL-QlmC_Lewd6M6MaNvyZn1MfROHTcLFhUquQfCw>
 <xme:2udHZFSQUhtCOxwN2fiIy3C_t4pC3IVp_h6i1PqECr5h6skrj7BGyl2fDN84P5jZV
 ibCEta40AdQ2KE4Rb8>
X-ME-Received: <xmr:2udHZPVDo6xGsCdHJlh86bbHJAp8xNFq-UiRmarNnxxDS1F3L26uiLFS8bOwjYUZsR7ELMSYtIqVyZm7eHacuuXL5xIZwXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
 gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2udHZHh5UZHEMBw8jN195wMlo8i_gan7Xb4fMuWhW1OoxPCppna0Zg>
 <xmx:2udHZHBMtlk6pfPmyMwPAprlvh-iE56gRWWUWOQmEoL8Gji1fZrb8g>
 <xmx:2udHZALIcRP02Uga96xJwRNOAbOCCE-tsfoPqljmdqRavM_KDfchpg>
 <xmx:3edHZBNJxelcn1gOxFFPqvUDnAdocnUy8ZCixw6-Tz1yPY9Rt8skdg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 10:46:48 -0400 (EDT)
Date: Tue, 25 Apr 2023 16:46:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 00/65] clk: Make determine_rate mandatory for muxes
Message-ID: <3nwpjtfa46zorfpuvvugximqe5qmovff76dqphoxbndr6mczcc@ndau7cegfxb2>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <636b8f855b6009ba068010e00c20e7f5.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="75sfg4dfrxr3i5xc"
Content-Disposition: inline
In-Reply-To: <636b8f855b6009ba068010e00c20e7f5.sboyd@kernel.org>
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
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
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
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Beguin <liambeguin@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--75sfg4dfrxr3i5xc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 02:44:51PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2023-04-04 03:10:50)
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
>=20
> Thanks for resending.
>=20
> I was thinking that we apply this patch first and then set
> determine_rate clk_ops without setting the clk flag. The function name
> is up for debate.

Ack, I'll send a new version following your proposal

Maxime

--75sfg4dfrxr3i5xc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZEfn1wAKCRDj7w1vZxhR
xaSaAP96/77zpjIZ1yxHOKTWolPnSBrvZZStILbYFUHTfnf4ZQEAy9TnDb76xLC+
cV82CRmIHcP1MQoDgnjetPo+R14sLwk=
=xg1X
-----END PGP SIGNATURE-----

--75sfg4dfrxr3i5xc--
