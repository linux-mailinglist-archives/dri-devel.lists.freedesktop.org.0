Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC841ABCB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 11:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3826E0F4;
	Tue, 28 Sep 2021 09:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7FD6E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:28:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 575E8580743;
 Tue, 28 Sep 2021 05:28:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Sep 2021 05:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=v
 FTIQRLZr/dArPvWWyWXOtO3bm56Qd7mD1aEXj7fSF4=; b=A+e0TYhHh0znYGJ3e
 2mpCX1lsbgqMC/T9SMPn/wYORa7svwJEHQ756WW3uTpLBuAYAUdBgQv4cN/EGwGO
 LQL42aQVJiukHgIgBybulyVVxrHMEz5tLxOhblrtN/HAMcu1W6B+WAPnuESRCLSd
 eWEUxs1JDaN1b5QzCIqKGz8gXs6VR3n+yRZ/gdJPCcBR5pOjDFVXfdAdB4tvZi4x
 5ixGiZK3eDS3Gc0YnEl7t4FJ1jcVDHaMok/+rkHvn/THpOwV1cbeGZPJSw6vhuZD
 OprRqRWgiqoPZzJWyoaRCq5OPm5fVLDEjV+4jmxj16GGkTUf6biZS0+qKyGCMJv4
 ciLAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=vFTIQRLZr/dArPvWWyWXOtO3bm56Qd7mD1aEXj7fS
 F4=; b=DdUqr9mZUoVwDCQaWDk7IqdJVHvBwLIjLg7Ptj/vwWvORiACaisq8YlXA
 dIlGynkivXO6BO44HIF4nKmPT5V/C0H0AwSgcFEXNoai2Ts0Tj5DiXzHin6T5OlG
 jPW6hvJSJT5hV+i4rGbRrcjfWUfLxkTGYA5ZjYB8IVojFdRDNgj0QgQJM0i9Kr5O
 vaXielntuNHjKGM0cwG+XaWd9Rzfebyyq5lfZj4fXW6sIyZAY7TUq+2iAEfuCD9W
 5PwGRO4EdAA6m1YNpQ0EzJtBf+1vJYrBv7fQGr0Cp9IXc/TEGUptDHhycenY0PYU
 BEQp9GJn7AARa8M49fu0gz6lx/4sg==
X-ME-Sender: <xms:J-BSYc0l21CZZdIkl1k9kNYenlsBD2H-mqI0bvNs-DKUEuniSFP2WQ>
 <xme:J-BSYXFiNzjxArsmEru4Pr41Wo7LlT7L21JKZjXNQLsNuJvYtfEnkAH54l4_cdJmo
 G1gfwDbJT8k2IFdipg>
X-ME-Received: <xmr:J-BSYU7Ikmf1rRf9AztUp1VlwlBvIMMtPJfmF3fRDf3oiVBtJbWMVXuS2Zi3w752ikQSbUncWr528VqL6eNSvcRs577uTsErEZJ6uUCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhueeggfdvieegjeeigeffudeuhfeuveeuieelgfffleelgedtiefgvdev
 ieevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:J-BSYV3JQIo1Q3lHBgATMNyzKCX7Gt_YFQdv_si7r5c-2uBh7smiLA>
 <xmx:J-BSYfEOf5Zzv6wboTHvGpzveIt2rIe4o15oCh1_Jcvt13FmVKBpnA>
 <xmx:J-BSYe9-mICFg3VQBK3niUmLjudkBWoCGjOd_T0GuxFNRW-aWxWD6g>
 <xmx:KOBSYW8rmDroH5_U1E0bg3fL20ywNBBrauSDHYn6XHMrjJQ-0gYrCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 05:28:07 -0400 (EDT)
Date: Tue, 28 Sep 2021 11:28:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20210928092805.wbc4ev3ze7a7zgqr@gilmour>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-7-kevin3.tang@gmail.com>
 <20210917154047.leojvqjqjj2sg34l@gilmour>
 <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 26, 2021 at 10:31:53PM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B49=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8811:40=E5=86=99=E9=81=93=EF=BC=9A
> > > +static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
> > > +                              struct drm_display_mode *mode,
> > > +                              struct drm_display_mode *adj_mode)
> > > +{
> > > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > > +
> > > +     drm_dbg(dsi->drm, "%s() set mode: %s\n", __func__, dsi->mode->n=
ame);
> > > +}
> >
> > You don't need that function?
> No need for now. need to delete it?

Yes

> > > +static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encoder,
> > > +                                 struct drm_crtc_state *crtc_state,
> > > +                                 struct drm_connector_state *conn_st=
ate)
> > > +{
> > > +     return 0;
> > > +}
> >
> > Ditto
>
> No need for now. need to delete it?

Yep

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
> > > +
> > > +     drm_err(dsi->drm, "of_drm_find_panel() failed\n");
> > > +     return -ENODEV;
> > > +}
> >
> > Just use devm_drm_of_get_bridge there
>
> We use drm_panel_init and drm_panel_add API to add panel, so here is a
> panel device, not a bridge.

Like Sam said, the panel API is on its way out and is being superseded
by bridge_panels.

> > > +static int sprd_dsi_host_init(struct sprd_dsi *dsi, struct device *d=
ev)
> > > +{
> > > +     int ret;
> > > +
> > > +     dsi->host.dev =3D dev;
> > > +     dsi->host.ops =3D &sprd_dsi_host_ops;
> > > +
> > > +     ret =3D mipi_dsi_host_register(&dsi->host);
> > > +     if (ret)
> > > +             drm_err(dsi->drm, "failed to register dsi host\n");
> > > +
> > > +     return ret;
> > > +}
> > >
> > > [...]
> > >
> > > +static int sprd_dsi_connector_init(struct drm_device *drm, struct sp=
rd_dsi *dsi)
> > > +{
> > > +     struct drm_encoder *encoder =3D &dsi->encoder;
> > > +     struct drm_connector *connector =3D &dsi->connector;
> > > +     int ret;
> > > +
> > > +     connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > > +
> > > +     ret =3D drm_connector_init(drm, connector,
> > > +                              &sprd_dsi_atomic_connector_funcs,
> > > +                              DRM_MODE_CONNECTOR_DSI);
> > > +     if (ret) {
> > > +             drm_err(drm, "drm_connector_init() failed\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     drm_connector_helper_add(connector,
> > > +                              &sprd_dsi_connector_helper_funcs);
> > > +
> > > +     drm_connector_attach_encoder(connector, encoder);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int sprd_dsi_context_init(struct sprd_dsi *dsi,
> > > +                     struct device *dev)
> > > +{
> > > +     struct platform_device *pdev =3D to_platform_device(dev);
> > > +     struct dsi_context *ctx =3D &dsi->ctx;
> > > +     struct resource *res;
> > > +
> > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +     ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
> > > +     if (!ctx->base) {
> > > +             drm_err(dsi->drm, "failed to map dsi host registers\n");
> > > +             return -ENXIO;
> > > +     }
> > > +
> > > +     ctx->pll =3D devm_kzalloc(dev, sizeof(*ctx->pll), GFP_KERNEL);
> > > +     if (!ctx->pll)
> > > +             return -ENOMEM;
> > > +
> > > +     ctx->regmap =3D devm_regmap_init(dev, &regmap_tst_io, dsi, &byt=
e_config);
> > > +     if (IS_ERR(ctx->regmap)) {
> > > +             drm_err(dsi->drm, "dphy regmap init failed\n");
> > > +             return PTR_ERR(ctx->regmap);
> > > +     }
> > > +
> > > +     ctx->data_hs2lp =3D 120;
> > > +     ctx->data_lp2hs =3D 500;
> > > +     ctx->clk_hs2lp =3D 4;
> > > +     ctx->clk_lp2hs =3D 15;
> > > +     ctx->max_rd_time =3D 6000;
> > > +     ctx->int0_mask =3D 0xffffffff;
> > > +     ctx->int1_mask =3D 0xffffffff;
> > > +     ctx->enabled =3D true;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int sprd_dsi_bind(struct device *dev, struct device *master, =
void *data)
> > > +{
> > > +     struct drm_device *drm =3D data;
> > > +     struct sprd_dsi *dsi;
> > > +     int ret;
> > > +
> > > +     dsi =3D sprd_dsi_encoder_init(drm, dev);
> > > +     if (IS_ERR(dsi))
> > > +             return PTR_ERR(dsi);
> > > +
> > > +     dsi->drm =3D drm;
> > > +     dev_set_drvdata(dev, dsi);
> > > +
> > > +     ret =3D sprd_dsi_connector_init(drm, dsi);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D sprd_dsi_context_init(dsi, dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D sprd_dsi_host_init(dsi, dev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void sprd_dsi_unbind(struct device *dev,
> > > +                     struct device *master, void *data)
> > > +{
> > > +     struct sprd_dsi *dsi =3D dev_get_drvdata(dev);
> > > +
> > > +     mipi_dsi_host_unregister(&dsi->host);
> > > +}
> > > +
> > > +static const struct component_ops dsi_component_ops =3D {
> > > +     .bind   =3D sprd_dsi_bind,
> > > +     .unbind =3D sprd_dsi_unbind,
> > > +};
> > > +
> > > +static const struct of_device_id dsi_match_table[] =3D {
> > > +     { .compatible =3D "sprd,sharkl3-dsi-host" },
> > > +     { /* sentinel */ },
> > > +};
> > > +
> > > +static int sprd_dsi_probe(struct platform_device *pdev)
> > > +{
> > > +     return component_add(&pdev->dev, &dsi_component_ops);
> >
> > In order to prevent probe issues, you need to register you mipi_dsi_host
> > here, see:
> > https://lore.kernel.org/dri-devel/20210910101218.1632297-3-maxime@cerno=
=2Etech/
>
> We register mipi_dsi_hot on our panel driver, like this:
>=20
> 1092   ret =3D mipi_dsi_attach(slave);
> 1093   if (ret) {
> 1094   DRM_ERROR("failed to attach dsi panel to host\n");
> 1095   drm_panel_remove(&panel->base);
> 1096   return ret;
> 1097   }

It's not about when you attach, but when you call
mipi_dsi_host_register. You're doing it in sprd_dsi_host_init that you
call in bind(), which is against the best practices and will create
probing issues in the future.

Maxime
