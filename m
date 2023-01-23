Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAFE677944
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3725F10E1C7;
	Mon, 23 Jan 2023 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077010E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:34:44 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so165089777b3.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuELA5eJL0GXEM4lxOz4obFMwuhpFvSTSbelyHWfOQo=;
 b=JGf5VhyXzZuXCUIiaS+rb2AtMQHIKDQdgMNqDCN9AkC8KeHgguAR+rTY7J5biCMWBk
 L/l83cJ1OGkLthGP/gomw5XtgwmqyjyvRnLa6xV5w0yMvZLTqIYoLlGW1OsITtymaMQZ
 XvvZP+g5Woxbw8LEWRTIaMiZerjvw2Bm2WEWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuELA5eJL0GXEM4lxOz4obFMwuhpFvSTSbelyHWfOQo=;
 b=WM7m2G+qRztj8RoKd6XN45QjaOfuxrlpxIBf8+8EGEPGZCxGQqoytb/yarSpDCk3cb
 Vg3ebrZ0kBW2Fx5KylBnZS4iKlx+yAZBDy2+CerlcCbNv4o5vpdhzyQ+U8OMOLd+C7Zm
 /2f+I10EbF+65cgG3HFcn1xGBVfMx88xOD4gZVUa448pJHIbWKwGs/3xoLIsADp633iz
 wXWQ5YRvBRSYSnIDnsjC+qFevmhm/FJUYPOSah5BFiARkiPDK8KCeldWTytjM/moc3rQ
 kZGM6BOtRDuWadVgo7X0fFcAklozy7QdWKJpzW+EgrulGc30HL+E760dIg5DYeE5nQeQ
 pm8Q==
X-Gm-Message-State: AFqh2krxQS9JPK+W3beUybROZAMdghGxIrn1lDZaKUia7cyN1sOtLLCp
 bG71A++vO+nwa4NtnS0VdgpX7hezNYSuVtpoZpNYMg==
X-Google-Smtp-Source: AMrXdXuwp0WqAnLdEP2O/k9BxfNQlg3SV4ooUvyyJOF53YlIqbPCs0lvc2g2uG1Be5jVt8vYF3OFCtnufIguZISwaJ8=
X-Received: by 2002:a0d:fe03:0:b0:470:533:cb89 with SMTP id
 o3-20020a0dfe03000000b004700533cb89mr3161546ywf.81.1674470083462; Mon, 23 Jan
 2023 02:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com>
 <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
 <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
 <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
In-Reply-To: <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 23 Jan 2023 16:04:31 +0530
Message-ID: <CAMty3ZD7=hvMT2bUSAweFczPEvZHg44MBx7K7GfqY3byegy1zA@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain
 order
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Sat, Jan 21, 2023 at 1:12 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> On Fri, 20 Jan 2023 at 19:10, Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Dave,
> >
> > On Sat, Jan 21, 2023 at 12:26 AM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Jagan
> > >
> > > Responding due to Marek's comment on the "Add Samsung MIPI DSIM
> > > bridge" series, although I know very little about the Exynos
> > > specifics, and may well be missing context of what you're trying to
> > > achieve.
> > >
> > > On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Restore the proper bridge chain by finding the previous bridge
> > > > in the chain instead of passing NULL.
> > > >
> > > > This establishes a proper bridge chain while attaching downstream
> > > > bridges.
> > > >
> > > > Reviewed-by: Marek Vasut <marex@denx.de>
> > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > > Changes for v11:
> > > > - add bridge.pre_enable_prev_first
> > > > Changes for v10:
> > > > - collect Marek review tag
> > > >
> > > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > index ec673223d6b7..9d10a89d28f1 100644
> > > > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
> > > >  {
> > > >         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > > >
> > > > -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> > > > +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> > > > +                                flags);
> > >
> > > Agreed on this change.
> > >
> > > >  }
> > > >
> > > >  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > > > @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > > >
> > > >         drm_bridge_add(&dsi->bridge);
> > > >
> > > > -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> > > > +       drm_bridge_attach(encoder, &dsi->bridge,
> > > > +                         list_first_entry_or_null(&encoder->bridge_chain,
> > > > +                                                  struct drm_bridge,
> > > > +                                                  chain_node), 0);
> > >
> > > What bridge are you expecting between the encoder and this bridge?
> > > The encoder is the drm_simple_encoder_init encoder that you've created
> > > in exynos_dsi_bind, so separating that from the bridge you're also
> > > creating here seems weird.
> > >
> > > >
> > > >         /*
> > > >          * This is a temporary solution and should be made by more generic way.
> > > > @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> > > >         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> > > >         dsi->bridge.of_node = dev->of_node;
> > > >         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> > > > +       dsi->bridge.pre_enable_prev_first = true;
> > >
> > > Setting dsi->bridge.pre_enable_prev_first on what is presumably the
> > > DSI host controller seems a little odd.
> > > Same question again - what bridge are you expecting to be upstream of
> > > the DSI host that needs to be preenabled before it? Whilst it's
> > > possible that there's another bridge, I'd have expected that to be the
> > > first link from your encoder as they appear to both belong to the same
> > > bit of driver.
> >
> > Let me answer all together here. I can explain a bit about one of the
> > pipelines used in Exynos. Exynos DSI DRM drivers have some strict host
> > initialization which is not the same as what we used in i.MX8M even
> > though it uses the same DSIM IP.
> >
> > Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
> >
> > Here MIC is the bridge, Exynos DSI is the bridge and the requirement
> > is to expect the upstream bridge to pre_enable first from DSI which
> > means the MIC.
>
> That makes sense for the pre_enable_prev_first flag.
>
> The drm_bridge_attach(... list_first_entry_or_null) still seems a
> little weird. I think you are making the assumption that there is only
> ever going to be the zero or one bridge (the MIC) between encoder and
> DSI bridge - the DSI bridge is linking itself to the first entry off
> the encoder bridge_chain (or NULL to link to the encoder). Is that
> reasonable? I've no idea!

That is true, the reason would be that DSI bridges still use an
encoder, usually, the first bridge in the chain will use an encoder
and subsequent bridges are fully bridge-driven drivers (without an
encoder) in order to follow the DRM bridge chain topology.
Unfortunately, the Exynos DRM drivers follow component-based binding
so DSI is part of that topology any attempt to exclude the encoder
from it not compatible with Exynos DRM drivers. So, in order to make
the bridge chain work properly we assume that linking. I think this
bridge attach from the DSI driver bind can be dropped if we make
Exynos DSIM as an independent bridge driver.

Jagan.
