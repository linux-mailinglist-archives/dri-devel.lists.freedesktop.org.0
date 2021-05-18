Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED5387B04
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0665D6EB8A;
	Tue, 18 May 2021 14:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152766EB8A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:21:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E39BD5808BA;
 Tue, 18 May 2021 10:21:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 18 May 2021 10:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=lWIf1SAehz/MyS6HAHHwUIo8Dvl
 Qutv5w9WI0Lg2kmc=; b=QyeF9DW43KQ36ukC1peXzYdFHKFadkwOb71yOYJ5vQ3
 XzEI/11psIyt7lFlcUS9WqqsScu9y3NBOBtIWYc8dK6X+200V9gyoVCGi3izOSlV
 v5u+2oZIHRBbiiun/WSYVTGrnNFmHU7zovAlfMXN3oPuTJhh/Det7j72KUQJCf6a
 qbZv3YEXR4q9LMPSpJULtcu2wHZ0roQo63vfUJDhxpiQAoO68ouvwF9WB1m8byFB
 CwqpI1O9pyzsNAx7PABdRP1+tJISqN18Xb8WaANhCdHeA8SGQfzN1iHkJHlY7Fna
 JxlJ44bcoJYbZ8y3ZfCDrDqF94aMr3lWeTnJJLyzTqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lWIf1S
 Aehz/MyS6HAHHwUIo8DvlQutv5w9WI0Lg2kmc=; b=pdPTvbnCm9SvLC0OtOXzuX
 2qPtSnDcqScMIbae9z9LQq3wgIy2dSsh4l0nPZjw0XSzg27K4d4iRngCex5n547J
 YxH1s8HfTqpL/phEqd+1Zanevc4EF2DXt6XULfh4eCv9UYYB2OCGRVuvmARCzsbz
 Yl5Fo8aBTCRYGpheqT0h4c8RM+LfZ1TVnF7VAYJ9JxKUJG3gaBbw8yEKBeBHww69
 NinBnXeGnn9A/b+jHPT0woriamANA+n9VU6AfnKFI7DPiSdWmllVZ1g4LNB/Bfci
 bpUhZHeOd23nc8IlALdZmwrnnoEKq68mmGE/Fr4OBrsBMu+vRRxwZ1icAs8qwTYg
 ==
X-ME-Sender: <xms:Ts2jYLsv7CSWG70YjH8bYmeci22PqTCxxRdxA7CIDgM7DsXKduQd2A>
 <xme:Ts2jYMdwzF3e7_yLfDrebLZelczb8JzF76gHQSNrU7EaYLKdTb_HoqDzBiTDSYXCa
 Nkhbc7ps_-39i5brvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ts2jYOwmMx5USEZYrBeGONH2aMZ2S_LNpVKQzBFqY7CyVYtGWvYvNw>
 <xmx:Ts2jYKMGM59xNC0-KDz-mbohe05CG0tDBiL_ee-ePudDUb7AyUOP7Q>
 <xmx:Ts2jYL8JOFUUFEh81g8CQiqzRQy0OsZ8MW3EJqdA1p_FEloi_L3MVw>
 <xmx:T82jYCYW8xCCucm2a-cId6fQx11gf_93IGJKqy-ZSVJNP24HwBNUGw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 10:21:02 -0400 (EDT)
Date: Tue, 18 May 2021 16:20:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v5 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20210518142059.o7ql6de4src53y4l@gilmour>
References: <20210425123607.26537-1-kevin3.tang@gmail.com>
 <20210425123607.26537-7-kevin3.tang@gmail.com>
 <20210430093503.aupvt2qkrzkzy2ed@gilmour>
 <CAFPSGXZR9cSneohFk-5RQbqgkvQHFU0=Te=J1m+k=xqcWWrp4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cu37uqlsbtggd2ix"
Content-Disposition: inline
In-Reply-To: <CAFPSGXZR9cSneohFk-5RQbqgkvQHFU0=Te=J1m+k=xqcWWrp4A@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cu37uqlsbtggd2ix
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 09:53:06PM +0800, Kevin Tang wrote:
> > > +struct dsi_reg {
> > > +     union _0x00 {
> > > +             u32 val;
> > > +             struct _DSI_VERSION {
> > > +             u32 dsi_version: 16;
> > > +             u32 reserved: 16;
> > > +             } bits;
> > > +     } DSI_VERSION;
> >
> > Using unions and structures to define the register is really frowned
> > upon in favor of defines, like you rightfully did in the crtc driver.
>
> This workload is too big, this design has been used for many years,
> so I actually want to keep it the same, but if it really doesn=E2=80=99t =
meet
> the current design.
>
> I can change the design, but it may take a lot of time......

There's no rush :)

> > > +static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
> > > +{
> > > +     struct device *dev =3D dsi->host.dev;
> > > +     struct device_node *child, *lcds_node;
> > > +     struct drm_panel *panel;
> > > +
> > > +     /* search /lcds child node first */
> > > +     lcds_node =3D of_find_node_by_path("/lcds");
> > > +     for_each_child_of_node(lcds_node, child) {
> > > +             panel =3D of_drm_find_panel(child);
> > > +             if (!IS_ERR(panel)) {
> > > +                     dsi->panel =3D panel;
> > > +                     return 0;
> > > +             }
> > > +     }
> >
> > That's not part of your binding
> Ok, i will remove it.
> >
> > > +
> > > +     /*
> > > +      * If /lcds child node search failed, we search
> > > +      * the child of dsi host node.
> > > +      */
> > > +     for_each_child_of_node(dev->of_node, child) {
> > > +             panel =3D of_drm_find_panel(child);
> > > +             if (!IS_ERR(panel)) {
> > > +                     dsi->panel =3D panel;
> > > +                     return 0;
> > > +             }
> > > +     }
> >
> > And you don't need this either. You'll register a mipi_dsi_host,
> > that will in turn probe all the devices under that bus, and will
> > then call the .attach callback.
>
> This should be move to the .attach callback?

The panel pointer assignment can. The rest is useless.

> > > +     drm_err(dsi->drm, "of_drm_find_panel() failed\n");
> > > +     return -ENODEV;
> > > +}
> > > +
> > > +static int sprd_dsi_host_attach(struct mipi_dsi_host *host,
> > > +                        struct mipi_dsi_device *slave)
> > > +{
> > > +     struct sprd_dsi *dsi =3D host_to_dsi(host);
> > > +     struct dsi_context *ctx =3D &dsi->ctx;
> > > +     int ret;
> > > +
> > > +     dsi->slave =3D slave;
> > > +     ctx->lanes =3D slave->lanes;
> > > +     ctx->format =3D slave->format;
> > > +     ctx->byte_clk =3D slave->hs_rate / 8;
> > > +     ctx->esc_clk =3D slave->lp_rate;
> > > +
> > > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > +             ctx->work_mode =3D DSI_MODE_VIDEO;
> > > +     else
> > > +             ctx->work_mode =3D DSI_MODE_CMD;
> > > +
> > > +     if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > > +             ctx->burst_mode =3D VIDEO_BURST_WITH_SYNC_PULSES;
> > > +     else if (slave->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> > > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_PULSES;
> > > +     else
> > > +             ctx->burst_mode =3D VIDEO_NON_BURST_WITH_SYNC_EVENTS;
> > > +
> > > +     if (slave->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > > +             ctx->nc_clk_en =3D true;
> >
> > I'm not sure why you need to duplicate all this, can't you just
> > dereference the dsi->slave pointer when you need it?
>
> Sorry, can you help me with a demo?

In your sprd_dsi_encoder_enable function, you call sprd_dphy_init which
takes a pointer to struct dsi_context, and will call, say,
dsi_phy_datalane_en, using ctx->lanes.

Since you have access to the struct sprd_dsi in sprd_dsi_encoder_enable,
why not pass it and the mipi_dsi_device pointer to sprd_dphy_init, and
dereference slave->lanes in dsi_phy_datalane_en?

This will greatly reduce the size of the dsi_context structure.

> > > +static enum drm_mode_status
> > > +sprd_dsi_connector_mode_valid(struct drm_connector *connector,
> > > +                      struct drm_display_mode *mode)
> > > +{
> > > +     struct sprd_dsi *dsi =3D connector_to_dsi(connector);
> > > +
> > > +     drm_dbg(dsi->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_=
MODE_ARG(mode));
> > > +
> > > +     if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > > +             dsi->mode =3D mode;
> > > +             drm_display_mode_to_videomode(dsi->mode, &dsi->ctx.vm);
> > > +     }
> >
> > Again, what happens if the mode isn't the preferred one?
>
> We hope to restore the low-resolution image to the original resolution
> through the scaling algorithm while keeping the resolution unchanged.
> So whether it's dpu or dsi, must be keeping on preferred mode.

Is there any particular reason to do so? Why do you need to take the
preferred mode into account in the first place? Can't you just use
whatever drm_display_mode is being passed?

Maxime

--cu37uqlsbtggd2ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKPNSwAKCRDj7w1vZxhR
xTkyAQDlju0M602qpVt5QqMkP/mXG96XFA7wwVjdRUi6ftdYuQEAwB33bO0dbA4k
Q8V37uwQo+IwBHQ+nx9rFtITgynxIQI=
=VvI9
-----END PGP SIGNATURE-----

--cu37uqlsbtggd2ix--
