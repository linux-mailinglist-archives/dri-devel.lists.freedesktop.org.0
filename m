Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6B4348B7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 12:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7C86E964;
	Wed, 20 Oct 2021 10:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE5A6E964
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:12:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x27so13932159lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o5vW3+1/Yb9DoK8RFz9pKj6hMdqBTflWtxCfKKNKjIM=;
 b=ll8xtqZzt4j/xPMOFRixiOUUn0YawGc0VpIb27yrU/5xEc2mz9U7AIdXr9JuC/4fNY
 Kbn29sUg9B/ceg0QlMmILfZwibgluYxemdn3/tXoz4Dw5IE6TN7mK0jE8ig9ytSmi1TD
 B9KKbY+j3HXZ2uK17Bbu8IM6RLJZ9itwBOrR/m1obI+vU2upfUmChSjVnu3jV23pFVln
 tu3XJxSWcEH411KfT9u797yh1Y966wFahCYFKbaZfy18abMmyS3l668wHNjfRiT3EDRP
 eBonaGqc8zVkf8va7O2qG7bEAUjKvAceZJYfBNWVb4yTvPXvE5n1o1GAoYvJLyh7C2vT
 jSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o5vW3+1/Yb9DoK8RFz9pKj6hMdqBTflWtxCfKKNKjIM=;
 b=7MC3YAsEecMGWkq+9OthOwqu4j3Z3Ii93dmUU1eFuOoShybVE+76Gtp3RCkkLPgJ6o
 lkERlaYK4+UUeXt+kwe0uOx0l4TQJRMD3m/5pbEYIeRAHKHnbdVHGCTc7O1Fg6Dpn+eV
 cZB+WUhOWdFFNwGz7j9whgwr/8gsucApvOzYfU3vN+Z6Q9Uwrdl7RgksVI9abUbCeGBS
 9eI1nl1TrUkIMFH7wBCZUorAhT1wCY3qJM+GgsTpFdx8yJFpszuxHmXvrZLQsmcHccWX
 jKVI1uf2GpmvWbz3RV2IdXsx5bKL3suWCwurRev9I0KvDVnXSv5YcQZB2Oi7VwaH80L/
 hX+A==
X-Gm-Message-State: AOAM530eZV4/H+GhgWxDhPMiwCYZccaJsU88dXsQ3IdNki6X6ZhT9Xs2
 3Arsz2n1TZUjAUJVVZRHx+J2fH473xGmKfUAfY0=
X-Google-Smtp-Source: ABdhPJz0yOlCXwfArD9Mal5dBBBBtkMwEzgvgerdM1r51AASanzPqDKjABdfiE+rhkOn/dNQZ6rtdgQ7i2KZDFEoQ1s=
X-Received: by 2002:ac2:4e85:: with SMTP id o5mr11286411lfr.105.1634724720016; 
 Wed, 20 Oct 2021 03:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-7-kevin3.tang@gmail.com>
 <20210917154047.leojvqjqjj2sg34l@gilmour>
 <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
 <20210928092805.wbc4ev3ze7a7zgqr@gilmour>
In-Reply-To: <20210928092805.wbc4ev3ze7a7zgqr@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Wed, 20 Oct 2021 18:09:32 +0800
Message-ID: <CAFPSGXZta-oJ7Hp3AyiGjpXr5e42g3r24Su6-L6HOwMR4QU5Zw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B49=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=885:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Sep 26, 2021 at 10:31:53PM +0800, Kevin Tang wrote:
> > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B49=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8811:40=E5=86=99=E9=81=93=EF=BC=9A
> > > > +static void sprd_dsi_encoder_mode_set(struct drm_encoder *encoder,
> > > > +                              struct drm_display_mode *mode,
> > > > +                              struct drm_display_mode *adj_mode)
> > > > +{
> > > > +     struct sprd_dsi *dsi =3D encoder_to_dsi(encoder);
> > > > +
> > > > +     drm_dbg(dsi->drm, "%s() set mode: %s\n", __func__, dsi->mode-=
>name);
> > > > +}
> > >
> > > You don't need that function?
> > No need for now. need to delete it?
>
> Yes
>
> > > > +static int sprd_dsi_encoder_atomic_check(struct drm_encoder *encod=
er,
> > > > +                                 struct drm_crtc_state *crtc_state=
,
> > > > +                                 struct drm_connector_state *conn_=
state)
> > > > +{
> > > > +     return 0;
> > > > +}
> > >
> > > Ditto
> >
> > No need for now. need to delete it?
>
> Yep
>
> > > > +static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
> > > > +{
> > > > +     struct device *dev =3D dsi->host.dev;
> > > > +     struct device_node *child, *lcds_node;
> > > > +     struct drm_panel *panel;
> > > > +
> > > > +     /* search /lcds child node first */
> > > > +     lcds_node =3D of_find_node_by_path("/lcds");
> > > > +     for_each_child_of_node(lcds_node, child) {
> > > > +             panel =3D of_drm_find_panel(child);
> > > > +             if (!IS_ERR(panel)) {
> > > > +                     dsi->panel =3D panel;
> > > > +                     return 0;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * If /lcds child node search failed, we search
> > > > +      * the child of dsi host node.
> > > > +      */
> > > > +     for_each_child_of_node(dev->of_node, child) {
> > > > +             panel =3D of_drm_find_panel(child);
> > > > +             if (!IS_ERR(panel)) {
> > > > +                     dsi->panel =3D panel;
> > > > +                     return 0;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     drm_err(dsi->drm, "of_drm_find_panel() failed\n");
> > > > +     return -ENODEV;
> > > > +}
> > >
> > > Just use devm_drm_of_get_bridge there
> >
> > We use drm_panel_init and drm_panel_add API to add panel, so here is a
> > panel device, not a bridge.
>
> Like Sam said, the panel API is on its way out and is being superseded
> by bridge_panels.
hi maxime,
If get a panel by devm_drm_of_get_bridge, how to use bridge api to access p=
anel?
it seems that pre_enable/enable still needs to be implemented, so we
need to add drm_bridge_func,
then move the panel-related operations in drm_encoder_helper_funcs to
drm_bridge_funcs callback?
>
> > > > +static int sprd_dsi_host_init(struct sprd_dsi *dsi, struct device =
*dev)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     dsi->host.dev =3D dev;
> > > > +     dsi->host.ops =3D &sprd_dsi_host_ops;
> > > > +
> > > > +     ret =3D mipi_dsi_host_register(&dsi->host);
> > > > +     if (ret)
> > > > +             drm_err(dsi->drm, "failed to register dsi host\n");
> > > > +
> > > > +     return ret;
> > > > +}
> > > >
> > > > [...]
> > > >
> > > > +static int sprd_dsi_connector_init(struct drm_device *drm, struct =
sprd_dsi *dsi)
> > > > +{
> > > > +     struct drm_encoder *encoder =3D &dsi->encoder;
> > > > +     struct drm_connector *connector =3D &dsi->connector;
> > > > +     int ret;
> > > > +
> > > > +     connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > > > +
> > > > +     ret =3D drm_connector_init(drm, connector,
> > > > +                              &sprd_dsi_atomic_connector_funcs,
> > > > +                              DRM_MODE_CONNECTOR_DSI);
> > > > +     if (ret) {
> > > > +             drm_err(drm, "drm_connector_init() failed\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     drm_connector_helper_add(connector,
> > > > +                              &sprd_dsi_connector_helper_funcs);
> > > > +
> > > > +     drm_connector_attach_encoder(connector, encoder);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int sprd_dsi_context_init(struct sprd_dsi *dsi,
> > > > +                     struct device *dev)
> > > > +{
> > > > +     struct platform_device *pdev =3D to_platform_device(dev);
> > > > +     struct dsi_context *ctx =3D &dsi->ctx;
> > > > +     struct resource *res;
> > > > +
> > > > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     ctx->base =3D devm_ioremap(dev, res->start, resource_size(res=
));
> > > > +     if (!ctx->base) {
> > > > +             drm_err(dsi->drm, "failed to map dsi host registers\n=
");
> > > > +             return -ENXIO;
> > > > +     }
> > > > +
> > > > +     ctx->pll =3D devm_kzalloc(dev, sizeof(*ctx->pll), GFP_KERNEL)=
;
> > > > +     if (!ctx->pll)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ctx->regmap =3D devm_regmap_init(dev, &regmap_tst_io, dsi, &b=
yte_config);
> > > > +     if (IS_ERR(ctx->regmap)) {
> > > > +             drm_err(dsi->drm, "dphy regmap init failed\n");
> > > > +             return PTR_ERR(ctx->regmap);
> > > > +     }
> > > > +
> > > > +     ctx->data_hs2lp =3D 120;
> > > > +     ctx->data_lp2hs =3D 500;
> > > > +     ctx->clk_hs2lp =3D 4;
> > > > +     ctx->clk_lp2hs =3D 15;
> > > > +     ctx->max_rd_time =3D 6000;
> > > > +     ctx->int0_mask =3D 0xffffffff;
> > > > +     ctx->int1_mask =3D 0xffffffff;
> > > > +     ctx->enabled =3D true;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int sprd_dsi_bind(struct device *dev, struct device *master=
, void *data)
> > > > +{
> > > > +     struct drm_device *drm =3D data;
> > > > +     struct sprd_dsi *dsi;
> > > > +     int ret;
> > > > +
> > > > +     dsi =3D sprd_dsi_encoder_init(drm, dev);
> > > > +     if (IS_ERR(dsi))
> > > > +             return PTR_ERR(dsi);
> > > > +
> > > > +     dsi->drm =3D drm;
> > > > +     dev_set_drvdata(dev, dsi);
> > > > +
> > > > +     ret =3D sprd_dsi_connector_init(drm, dsi);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D sprd_dsi_context_init(dsi, dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D sprd_dsi_host_init(dsi, dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void sprd_dsi_unbind(struct device *dev,
> > > > +                     struct device *master, void *data)
> > > > +{
> > > > +     struct sprd_dsi *dsi =3D dev_get_drvdata(dev);
> > > > +
> > > > +     mipi_dsi_host_unregister(&dsi->host);
> > > > +}
> > > > +
> > > > +static const struct component_ops dsi_component_ops =3D {
> > > > +     .bind   =3D sprd_dsi_bind,
> > > > +     .unbind =3D sprd_dsi_unbind,
> > > > +};
> > > > +
> > > > +static const struct of_device_id dsi_match_table[] =3D {
> > > > +     { .compatible =3D "sprd,sharkl3-dsi-host" },
> > > > +     { /* sentinel */ },
> > > > +};
> > > > +
> > > > +static int sprd_dsi_probe(struct platform_device *pdev)
> > > > +{
> > > > +     return component_add(&pdev->dev, &dsi_component_ops);
> > >
> > > In order to prevent probe issues, you need to register you mipi_dsi_h=
ost
> > > here, see:
> > > https://lore.kernel.org/dri-devel/20210910101218.1632297-3-maxime@cer=
no.tech/
> >
> > We register mipi_dsi_hot on our panel driver, like this:
> >
> > 1092   ret =3D mipi_dsi_attach(slave);
> > 1093   if (ret) {
> > 1094   DRM_ERROR("failed to attach dsi panel to host\n");
> > 1095   drm_panel_remove(&panel->base);
> > 1096   return ret;
> > 1097   }
>
> It's not about when you attach, but when you call
> mipi_dsi_host_register. You're doing it in sprd_dsi_host_init that you
> call in bind(), which is against the best practices and will create
> probing issues in the future.
>
> Maxime
