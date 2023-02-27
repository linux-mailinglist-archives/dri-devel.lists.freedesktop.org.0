Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C26A47A3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796BC10E192;
	Mon, 27 Feb 2023 17:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC1C10E192
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:14:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 093A65C00D1;
 Mon, 27 Feb 2023 12:14:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 27 Feb 2023 12:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677518072; x=1677604472; bh=x5ROIrk4nV
 knCsj7dkM/MudcRnsZxhLL3dBK6pxJRW4=; b=LVS+lhJ3wBVUVmvKzLsMSJ27cd
 VuICTbG8ZWplHwBs6Zbs8IxPaO0i8C9Zewcey1omTxzAbnISWBkjg3Ce4zTVzjOe
 JGv6NjKiy4peNltqFQ2AF476pIBiQ0PUWU8u+Ina8gGAnav5BdNdWAek/5unry4i
 N3lxnx9YRG+jbRWhbXuUVmrR7CUPI5hKm0DbBIBWfy+g2Tg5UX9BdmxWqYF3TQje
 SdPkjaTXD3PS+ENpWz/CebPdKeS2HpkOpniPx4SswEZh2dPsgLmEh+l5spEKjOpV
 QId+pFXYjy8X11x6yhX4ukQaRJja4SHR9g5bRHa5SPFx09O28bAdMmi0C9vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677518072; x=1677604472; bh=x5ROIrk4nVknCsj7dkM/MudcRnsZ
 xhLL3dBK6pxJRW4=; b=gsoMw+hvULCtKWzvyQ9ZAYvoAEZtdReS7dN2OrFePsum
 qL7BGMpXP86H2xYXNtqzkSeKgqRDmdPkLX+ycMycozGp53+aUd5TDCnxYienR7XJ
 1frhTwf85Z/mV2oHm8CZ07S2cKI+xe6V506RxxMQb++qhkcU+3umdixSN9L8opyz
 Qro8VAKzV7azrVhoahGPyIAB/PV0qhmmuMaDqV4V8QyyJ6Oxb8SGEpgZWey/N1Ig
 yiVkG1/OK8SB1SrHWGerSWYVUNNGpD2ONwsQ1uON5XepoXf2Cu0F6adJojQf8mYW
 bdWbqEL4eyYHvnWTBAVGZmONewgEI0KQF0yD0Nxbow==
X-ME-Sender: <xms:9uT8Y4uscdr03FNuy_pMWevJCGh-fE2RK62UxI7fI0yq4LaI2vr74g>
 <xme:9uT8Y1d1hQUJM3wPpHSAgnJG2XF1iwMM4K4fHAcIovV-8mYmr9mTkLgcw9uDRq_Ik
 gDeTgv0W680ZVN7Zss>
X-ME-Received: <xmr:9uT8Yzx409ZK-MnDAK3zSanUquMNPIgjFkeDkpCU8WdTMnLUY3vb_O--AOQyDvjhcV-nBzpjzf4EtxYjxyGEfqFrSXNbE2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:9-T8Y7OFQ5qLN1BkThpSHr4dmTWJHg0wmwUsSAUIzOWqIjDehzACIQ>
 <xmx:9-T8Y4-DJhDAD1hMiFvXVnumcc7-pA2CBtxWMk9XC7FDLIaGE9plZA>
 <xmx:9-T8YzUaU0WzEX1ccgaOUoOWTqyhFUuu_-CD_bzQIaD2HsEnSm_F_A>
 <xmx:-OT8Y28J3S41GXqW3lsW6_9Xeh1WFDKaqYxnaomodowftw1zs4wVPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 12:14:30 -0500 (EST)
Date: Mon, 27 Feb 2023 18:14:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for
 drmm_panel_bridge_add
Message-ID: <20230227171428.oztmm7p6jmwzgkbi@houat>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com>
 <20230227121149.c3ibajgog3i2s2ek@houat>
 <CAMty3ZDt64C0dv2=wVcaCLdZVFU2u6D4EKswuoqEjvByKyMseg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mev64xdy6ezuhnir"
Content-Disposition: inline
In-Reply-To: <CAMty3ZDt64C0dv2=wVcaCLdZVFU2u6D4EKswuoqEjvByKyMseg@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mev64xdy6ezuhnir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 05:58:03PM +0530, Jagan Teki wrote:
> On Mon, Feb 27, 2023 at 5:41 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> > > drmm_panel_bridge_add DRM-managed action helper is useful for the bri=
dge
> > > which automatically removes the bridge when drm pointer is cleaned.
> > >
> > > Supporting the same on non-component bridges like host DSI bridge req=
uires
> > > a drm pointer which is indeed available only when a panel-bridge is f=
ound.
> > >
> > > For these use cases, the caller would call the drmm_panel_bridge_add =
by
> > > passing NULL to drm pointer.
> > >
> > > So, assign the bridge->dev to drm pointer for those cases.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v13:
> > > - new patch
> > >
> > > Note: use case on
> > > "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge fi=
nd helper"
> > >
> > >  drivers/gpu/drm/bridge/panel.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/=
panel.c
> > > index d4b112911a99..45a0c6671000 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct =
drm_device *drm,
> > >       if (IS_ERR(bridge))
> > >               return bridge;
> > >
> > > +     /*
> > > +      * For non-component bridges, like host DSI bridge the DRM poin=
ter
> > > +      * can be available only when a panel-bridge is found.
> > > +      */
> > > +     if (!drm)
> > > +             drm =3D bridge->dev;
> > > +
> >
> > Why can't the caller use bridge->dev?
>=20
> The first step of drmm_panel_bridge_add is to find the panel-bridge,
> so we can only get bridge->dev after this step. The caller doesn't
> know anything about the panel bridge it just sends a panel pointer to
> find the panel-bridge

Ah, yes, indeed. This is still a hack we don't need.

> then assigns bridge->dev to drm for DRM action
>
> Please check this patch about the caller,
> https://patchwork.kernel.org/project/dri-devel/patch/20230227113925.87542=
5-5-jagan@amarulasolutions.com/

Because we've already been over this. You can't call that function from
DSI's attach. So you should change that to what I already pointed you
to, and then you'll have the drm device pointer available.

> > Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
> > going to convert it to a drm-managed version?
>=20
> Look like your suggestion to can't use devm_drm_of_dsi_get_bridge and
> call the DRM-action from the driver, that is the reason I have removed
> this and done the same as your previous inputs.
> https://lore.kernel.org/all/20230203110437.otzl2azscbujigv6@houat/

You can't use devm. You can and should definitely use drmm.

Maxime

--mev64xdy6ezuhnir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/zk7wAKCRDj7w1vZxhR
xfv1AP0arWD2a/4vaKVw9vWV6nfryAkPVe9t52I4MJIr8WGwHQEAlgxKdLLhJwhF
fPOStfl5kPaACAdvt5dvvXEAVGdevQ0=
=aQ5z
-----END PGP SIGNATURE-----

--mev64xdy6ezuhnir--
