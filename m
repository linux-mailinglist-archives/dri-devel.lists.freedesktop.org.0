Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DBA680E29
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D1E10E23F;
	Mon, 30 Jan 2023 12:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746210E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:56:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 37C9A582269;
 Mon, 30 Jan 2023 07:56:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 30 Jan 2023 07:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675083412; x=
 1675090612; bh=qHYBYqPItFEfJ7P/fVhrn/EUsBFwwjGYixrdWPu1haw=; b=I
 ofWpm5+KolRBGZBlrubmed5zH3WXoj0SRjQRfkZQPHr3Eitv6rN6olSd049GPAjx
 diZY7Ppan4Zr36fQndfzWrX84ATmf06kTzcYx0ohRmJud1I4dRapcGDlygO81qLo
 uPKsFeYJyekBIPmT9CnL7OMq6/OV+u84DanBQgsqbEavsmLxmWOfMByEcUTHY/jq
 hwYqq2W79Jpg8DHoJ/ko0N1+QtKkeOzcMtBbSHFXodJVYgDw2y3Jl4+76kW2f3ID
 pnPnqT7FMBBOm1WVadpxBRTxC1W6tzKsUIerO0e9pBFTjKuB1NB7iE4f2PK3HDHE
 MGi9yvhTcR4piQeeygN2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675083412; x=
 1675090612; bh=qHYBYqPItFEfJ7P/fVhrn/EUsBFwwjGYixrdWPu1haw=; b=Q
 BgmBfVJnJFlFdLD8O4ERMPxf4/9EJUzx5V5tQbR8RIcCtYa53Hv8oR71tFzygwAJ
 hVfQWuNVMLTbJYLPfOwJ9qsO64E3EIvl+fGAKQzUKerE/2fKEZ8DBkuQw5G3Dc/Q
 pyV+rZ4U8WT0DgQo9oGfNUblzTsme+kGkj+mfbtGm4RfS3mwD0rl9eYyR9IZHVTo
 A0G4iDMAIf81WjRBiH0YwVXQG7Rk1aYLrM/l8MJTYtu59p8Ke+Dt1Epvpefqm4FM
 jtmwYvQw8FOFoHQkBLPgLj+feb/lbRNfj2u4yzQtPFkR5ywWw9SePoFLfcXHg1Vp
 bO4B66KGPqDBbm42hwNXA==
X-ME-Sender: <xms:k77XY_dkb8fAU1WBJlH1WAPAIbp2MlqLnmYC9blkQG92_EcWEYDlOQ>
 <xme:k77XY1MDzoxW5htEBN18_wAQYAkK0hAnpFU86Rmkc1OyCn4nJCFjOQBuVAu6VyoR7
 ZR76Id-bjLCvqGpEjE>
X-ME-Received: <xmr:k77XY4hUmAymahagO115Qt509pNzqMjuKPPMkOtUZ3e430XCcqY-G7dO_2k-mGUE46okSeBl5OT8JfgIhbrKEHCXHj_KkDWitmWHJh06hW-3tA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhephfduvdejlefhteetffdvgfeuhedvueeggfetheeihfektefftddtieff
 vddtueehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhoph
 drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k77XYw-aEVsUqcjpNwkw9I7Fiz5UP3Zxn9u4j0V9znMurnPhUNyv7Q>
 <xmx:k77XY7vW_9q5d7gac_1AEWj2946FWO-oZpKc_sqvt6WkjJUR6nSD0A>
 <xmx:k77XY_ELJbnMEA0rQW_dOMpUjMXXqJIlNhEXquzw1n43fa6YjCQhPg>
 <xmx:lL7XY7wrsYt2LITXQ3rUDIjZFQQ90LfgSzdtg5B6gUASOmi8gWdKEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 07:56:50 -0500 (EST)
Date: Mon, 30 Jan 2023 13:56:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230130125648.mlrtubymeooejvhg@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> Hi,
>=20
> On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> >
> > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > >
> > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > next DSI device in the pipeline.
> > > >
> > > > Helper lookup a given child DSI node or a DT node's port and
> > > > endpoint number, find the connected node and return either
> > > > the associated struct drm_panel or drm_bridge device.
> > >
> > > I'm not sure that using a device managed helper is the right choice
> > > here. The bridge will stay longer than the backing device so it will
> > > create a use-after-free. You should probably use a DRM-managed action
> > > here instead.
> >
> > Thanks for the comments. If I understand correctly we can use
> > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > the panel or bridge - am I correct?
>=20
> Look like it is not possible to use DRM-managed action helper here as
> devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> which we cannot find drm_device pointer (as drm_device pointer is
> mandatory for using DRM-managed action).
> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/br=
idge/samsung-dsim.c#L1545
>=20
> Please check and correct me if I mentioned any incorrect details.

You shouldn't call that function from attach anyway:
https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-=
with-mipi-dsi-bridges

Maxime
