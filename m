Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8468921B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5010210E702;
	Fri,  3 Feb 2023 08:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBB410E702
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 08:26:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6C01C581E82;
 Fri,  3 Feb 2023 03:26:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 03 Feb 2023 03:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1675412771; x=1675419971; bh=Hiq2WjR2Ol
 vvDxbH7MqY8IVkRM1I4s545FJQW/y5s1o=; b=ksWatFdyCqjO37U8x0MoerxK1i
 m+7ut/27xNbNGIoeijphIpa8MgQ0S499dwH84VvqtknIY4HOvlE1QjZyIB3BnBYd
 uRRqninIXV/uaNVYsVdi9ltCcEz67qaDhRW5x0r8qXerAk18SOaSQyvPLnYrYIgF
 4cPkR4hkEzoTMNybjtC9vQBw3TsSHFR7vRzfukhk5G5giQIoZ37FPAPPm3JeOxzF
 kHSJadsi1Nrys8u3btRCJuZWiB9mhT8tzE5OBn8jnFvuHDIIsQqvd6r6/5H+ULi7
 YwEYzaNGF7KCCTt3JEQdEmwt8tAkIf+pKSwlBkZzAE6QAaAnV5oWVOz4YKcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1675412771; x=1675419971; bh=Hiq2WjR2OlvvDxbH7MqY8IVkRM1I
 4s545FJQW/y5s1o=; b=OCurBW0KxT5Fzul8EWcy0oTdLuLrlSH1Mcibiiw3TNP1
 3jhXXo208QjVmJyRH2gcdt2cD6iAuySYI7PMNAIS77C4LBbNiPZXkNerXpbYiwkC
 rQ5nX3ctpJl+C6QEumw0wYOTy7No45t/asi2nsVfTgs0JeiO0gVsRohqFbSB08oK
 ZJyRs8IiQQaunbTrgVklDHv4Ybju45tYCJOm3PoczxKNm5V0G+QdnEd7LHNzBEzE
 rXpHUqu5KiPOox1RRWyxNU0S9aJd1khEbF6pbu2vVkqSLW7XQDSfgjEWrkEfsLN8
 PEr7AiRRVF1ZEbpbxHeA6bch8+A2uoOnmhjm/oXaDA==
X-ME-Sender: <xms:IsXcY9m56d6d_AwLcKi_TY675ZeanCwKoZ_e0gdhE2oG_Qsrpcz5tQ>
 <xme:IsXcY40zf7DhEuK7U44twA7eWxfUy9SbI8GybghqSrtjIQju3qzh7rDIbvmUKNKSg
 po-z0q86MgTvbqYeJI>
X-ME-Received: <xmr:IsXcYzr51TEOyh-TUjxk-Nv611nO16lxeEIewMBy_ivSAKqRl5Vnj8mL63tVVh2KPIWt61k7sbb70IHjt6XH2f8VcWIaPgCIvI0SbVLnMEEZLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefledguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IsXcY9mlYMiiFFqPFKaPZM809GtETvLovsjd75EtVSadM4jz05Q9-Q>
 <xmx:IsXcY71Xd3SPlnXsFi66dQpzW_YqR3P4obwaapjkJGXHD5lktgQAfA>
 <xmx:IsXcY8vFxhiX-D9G8e-sisu19taR4XMf_u2fTglsSP7XDLlmeBfgBA>
 <xmx:I8XcYy62z3QuriRqzMY6WgV-YlUtZRPbodhgjvvOeMdZawKFDgKDMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Feb 2023 03:26:09 -0500 (EST)
Date: Fri, 3 Feb 2023 09:26:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230203082607.xu6xv7c6eq2yq64c@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <20230130125828.qkqsq6ax5mojkdbq@houat>
 <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pfht2erx4nbed6u7"
Content-Disposition: inline
In-Reply-To: <CAMty3ZD82xZnRxuTq2RdEGAJcEgnaJhKX3CDWGNeSWSQD7xNxg@mail.gmail.com>
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


--pfht2erx4nbed6u7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 10:22:42PM +0530, Jagan Teki wrote:
> Hi Maxime,
>=20
> On Mon, Jan 30, 2023 at 6:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Jan 26, 2023 at 08:48:48PM +0530, Jagan Teki wrote:
> > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > >
> > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > next DSI device in the pipeline.
> > > > >
> > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > endpoint number, find the connected node and return either
> > > > > the associated struct drm_panel or drm_bridge device.
> > > >
> > > > I'm not sure that using a device managed helper is the right choice
> > > > here. The bridge will stay longer than the backing device so it will
> > > > create a use-after-free. You should probably use a DRM-managed acti=
on
> > > > here instead.
> > >
> > > Thanks for the comments. If I understand correctly we can use
> > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > the panel or bridge - am I correct?
> >
> > It's not that we can, it's that the devm_panel_bridge_add is unsafe:
> > when the module is removed the device will go away and all the devm
> > resources freed, but the DRM device sticks around until the last
> > application with a fd open closes that fd.
>=20
> Would you please check this, Here I'm trying to do
>=20
> 1. find a panel or bridge
> 2. if panel add it as a panel bridge
> 3. add DRM-managed action with the help of bridge->dev after step 2.

The logic is sound in your patch

> Didn't test the behavior, just wanted to check whether it can be a
> possibility to use bridge->dev as this dev is assigned with
> encoder->dev during the bridge attach the chain. Please check and let
> me know.
>=20
> struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
>                                               struct device_node *np,
>                                               u32 port, u32 endpoint)
> {
>         struct drm_bridge *bridge;
>         struct drm_panel *panel;
>         int ret;
>=20
>         ret =3D drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
>                                               &panel, &bridge);
>         if (ret)
>                 return ERR_PTR(ret);
>=20
>         if (panel)
>                 bridge =3D devm_drm_panel_bridge_add(dev, panel);
>=20
>         if (IS_ERR(bridge))
>                 return bridge;
>=20
>         ret =3D drmm_add_action_or_reset(bridge->dev,
> drmm_drm_panel_bridge_release,
>                                        bridge);
>         if (ret)
>                 return ERR_PTR(ret);
>=20
>         return bridge;
> }

It's the implementation that isn't. You cannot use a devm hook to
register a KMS structure, so it's not that you should add a
drmm_add_action call, it's that you shouldn't call
devm_drm_panel_bridge_add in the first place.

So either you use drm_panel_bridge_add and a custom drmm action, or you
add a drmm_panel_bridge_add function and use it.

Maxime

--pfht2erx4nbed6u7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9zFFgAKCRDj7w1vZxhR
xQE/AQCMlx3Vg1Fu2fddsqf/qHcBrT+gkRDdTzgrEOTJxQw5QgD/etl/1NZ5BdN7
8LhdTH8aUOEItDaD6THKM5u3luUBDwo=
=8DoN
-----END PGP SIGNATURE-----

--pfht2erx4nbed6u7--
