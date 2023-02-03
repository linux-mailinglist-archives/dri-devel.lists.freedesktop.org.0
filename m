Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286A689774
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECD710E766;
	Fri,  3 Feb 2023 11:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088010E766
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:04:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A82CD581FF5;
 Fri,  3 Feb 2023 06:04:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 03 Feb 2023 06:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1675422280; x=1675429480; bh=uTL4Ifl644
 jqbKnPeRweyJW67IA/jeCNeHkWEGWU+gI=; b=NFMwoTVTDReJThUdAH70tCbh0s
 cFxhyAvTMgzJdsKOu1KHcNPlcEpAfgkTavOcHu9gz9SACjIpLFF7hnd9sAaFFrUX
 UEVs+92fg+jlXSWYCryO53GzmabNrQpU3c9Tv33eAD5x7SmDAJxudaAseUDaF1l/
 ht7Bcx3V7l2mAUdrlFDhlESO1fUDGwPSRlpS9Rcr4vaE/6zm6sIptxp7reezDXv+
 fuVSRwNa0Oos/zZERDZjweMSw8RD4ERPzCk5cb6pvrGULdAR0eMnkv+D09I3Z+i6
 X9RtQrY/JMCB1HOnzs4JQ1sqBk27UCYTZTjNqXw9yLJu+6WlagMKJT3CLm2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675422280; x=1675429480; bh=uTL4Ifl644jqbKnPeRweyJW67IA/
 jeCNeHkWEGWU+gI=; b=KssdRlvpILct2vU4Xv4TanGGrCfqK/nKztKI6jh6PnTM
 pXSmdrGFIEu3QyQ0pSTJAsWP1WOU+62qTowUrnKg5ddMX1vwFKGR1WZpWFgCujXB
 Wf4qN77lUIEDL8qSMmNvATPMq4kl9GavjSuTXM0r4asAS8TKInU61XNN9x3RxbSO
 RpgecPyWYizroJz0RsUVTa2D4GbCOO3HDJ0TVboKfYMdXt/FJl/bs6AszUvuHwzH
 g0807XPfpIux6Im2jCgah9OLKqFBlDxZIsTxZ7DHA3FyMteOMBaqigagnnCDmGan
 XLevTYxKwWssydkRLo7Y3SFTmxzqaU3kTf4NRV6LBA==
X-ME-Sender: <xms:SOrcY00JpjIxlHjsU91dTxUbrkz-YC44RJjKYePPFXMsh3WqrkYRKg>
 <xme:SOrcY_E__11Dv7BlN2nLBEKwrHuyoByyvkR9uXtaan-EmHNc5qmArUacjpaKloPVv
 aX772vrpJjpdJA9ypw>
X-ME-Received: <xmr:SOrcY84XrUDLX86BMEGpw81b8YOB5nt90UHl6J2CjVkzUigSneJhKBIBMoHrb8eeVniAVHOHtzHa5Q2-RJ3-EnC6NXqEJX0s5s3kCs6PtqFtzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegtddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SOrcY92i4efsQ4mRrWP5R1iAUGl2mGpRp1u1n2YXoQjlo54N-GCGkA>
 <xmx:SOrcY3GqZHn1vK6aOmX9n8WoitDyaRsBPz5p27Qsc21QjIU1tdkA3w>
 <xmx:SOrcY2-0EMDjdNFBTiX9yi2M8PHoPxQT6fwsqwf4kO7YHQx-YiQ1xw>
 <xmx:SOrcY0KaYMkpy53u4gHdF1XghPulNI-30K-1G2kBExsHc30RB0eBAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 06:04:39 -0500 (EST)
Date: Fri, 3 Feb 2023 12:04:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230203110437.otzl2azscbujigv6@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
 <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
 <20230203082607.xu6xv7c6eq2yq64c@houat>
 <CAMty3ZCYi7k=MdxZA-VMW6tfU1tqu7vrwUQyj25Oyssc0HTOKQ@mail.gmail.com>
 <20230203104938.qink5iuibxux2bjz@houat>
 <CAMty3ZB=v=0SZ5SX2y4bDMty8bdN260zs5ZCOy3Esr0+ZZsZ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ssrmviiatgu57p2f"
Content-Disposition: inline
In-Reply-To: <CAMty3ZB=v=0SZ5SX2y4bDMty8bdN260zs5ZCOy3Esr0+ZZsZ7A@mail.gmail.com>
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


--ssrmviiatgu57p2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 04:28:30PM +0530, Jagan Teki wrote:
> On Fri, Feb 3, 2023 at 4:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Feb 03, 2023 at 04:13:49PM +0530, Jagan Teki wrote:
> > > On Fri, Feb 3, 2023 at 1:56 PM Maxime Ripard <maxime@cerno.tech> wrot=
e:
> > > >
> > > > On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> > > > > Hi Maxime,
> > > > >
> > > > > On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > > > Add devm OF helper to return the next DSI bridge in the c=
hain.
> > > > > > > > >
> > > > > > > > > Unlike general bridge return helper devm_drm_of_get_bridg=
e, this
> > > > > > > > > helper uses the dsi specific panel_or_bridge helper to fi=
nd the
> > > > > > > > > next DSI device in the pipeline.
> > > > > > > > >
> > > > > > > > > Helper lookup a given child DSI node or a DT node's port =
and
> > > > > > > > > endpoint number, find the connected node and return either
> > > > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > > > >
> > > > > > > > I'm not sure that using a device managed helper is the righ=
t choice
> > > > > > > > here. The bridge will stay longer than the backing device s=
o it will
> > > > > > > > create a use-after-free. You should probably use a DRM-mana=
ged action
> > > > > > > > here instead.
> > > > > > >
> > > > > > > Thanks for the comments. If I understand correctly we can use
> > > > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once =
we found
> > > > > > > the panel or bridge - am I correct?
> > > > > >
> > > > > > It's not that we can, it's that the devm_panel_bridge_add is un=
safe:
> > > > > > when the module is removed the device will go away and all the =
devm
> > > > > > resources freed, but the DRM device sticks around until the last
> > > > > > application with a fd open closes that fd.
> > > > >
> > > > > Would you please check this, Here I'm trying to do
> > > > >
> > > > > 1. find a panel or bridge
> > > > > 2. if panel add it as a panel bridge
> > > > > 3. add DRM-managed action with the help of bridge->dev after step=
 2.
> > > >
> > > > The logic is sound in your patch
> > > >
> > > > > Didn't test the behavior, just wanted to check whether it can be a
> > > > > possibility to use bridge->dev as this dev is assigned with
> > > > > encoder->dev during the bridge attach the chain. Please check and=
 let
> > > > > me know.
> > > > >
> > > > > struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
> > > > >                                               struct device_node =
*np,
> > > > >                                               u32 port, u32 endpo=
int)
> > > > > {
> > > > >         struct drm_bridge *bridge;
> > > > >         struct drm_panel *panel;
> > > > >         int ret;
> > > > >
> > > > >         ret =3D drm_of_dsi_find_panel_or_bridge(np, port, endpoin=
t,
> > > > >                                               &panel, &bridge);
> > > > >         if (ret)
> > > > >                 return ERR_PTR(ret);
> > > > >
> > > > >         if (panel)
> > > > >                 bridge =3D devm_drm_panel_bridge_add(dev, panel);
> > > > >
> > > > >         if (IS_ERR(bridge))
> > > > >                 return bridge;
> > > > >
> > > > >         ret =3D drmm_add_action_or_reset(bridge->dev,
> > > > > drmm_drm_panel_bridge_release,
> > > > >                                        bridge);
> > > > >         if (ret)
> > > > >                 return ERR_PTR(ret);
> > > > >
> > > > >         return bridge;
> > > > > }
> > > >
> > > > It's the implementation that isn't. You cannot use a devm hook to
> > > > register a KMS structure, so it's not that you should add a
> > > > drmm_add_action call, it's that you shouldn't call
> > > > devm_drm_panel_bridge_add in the first place.
> > >
> > > I think it is because the remove action helper uses
> > > drm_panel_bridge_remove instead of devm hook.
> > > >
> > > > So either you use drm_panel_bridge_add and a custom drmm action, or=
 you
> > > > add a drmm_panel_bridge_add function and use it.
> > >
> > > It is not possible to use this helper as it is expecting drm_device
> >
> > It's definitely possible, just change the prototype of the function to
> > take a drm_device pointer, just like any other drmm_* function.
>=20
> But, in my case, I only get the drm_device pointer once I found the
> bridge pointer of panel_bridge but the actual bridge finding for
> panel_bridge is happening in the drmm_panel_bridge_add definition.
> Doesn't it redundant if I find the panel_bridge and pass drm_device
> and panel pointer for calling drmm_panel_bridge_add?

We've already discussed this, but you can't use
devm_drm_of_dsi_get_bridge() from the MIPI-DSI host attach function. So
fix that first, and then you'll have access to the DRM device in your
driver.

--ssrmviiatgu57p2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9zqRQAKCRDj7w1vZxhR
xSXtAQC3KuFkJLqpiObw33n/5mFe2yBGYS1Xu1JTGs8u65q31gD/Yj+unIjvJrFy
GaardZltUFfHi3pJ4AouJO2EwzxYFgY=
=Xcfe
-----END PGP SIGNATURE-----

--ssrmviiatgu57p2f--
