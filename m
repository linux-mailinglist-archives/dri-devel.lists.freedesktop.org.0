Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D0530EBA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 14:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481C510F308;
	Mon, 23 May 2022 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A310F308
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:54:16 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b5so5962472plx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=I+vGqH+3C1E3CpD3/4I+O6QuVZ7joNauIQKwNIO0kKw=;
 b=seLJhlqbRbYAeGtnbCF7+eHcU1FPgfpxDnSQ6Lkt70sMtG5iAirhOkuWyyR8QYqkYR
 ahsTYUKJqZKvhqqgE0068ZprOrAdGyHjSbCnuLpgRwhv7hzXVL9RXZ0QNHPugsEzR+4g
 WeE+87Wub5gacPpRtSXnFgUJOfrOBU65hpRInaY3AOoIyqLKqpHIB4eTbaCmmbdzpBO7
 cpLMKLxulmZUVnSSj9MJT5raUx8L+BTgIMZnFvasxdN0AFE1CPPGci3GHJhA7OP8crqW
 P9or4uhjhUagV5LScIWr4lNj7huwvmHg46i5xakvGs9lxsErulPQtvWiWCaDCMVyRJT6
 YqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I+vGqH+3C1E3CpD3/4I+O6QuVZ7joNauIQKwNIO0kKw=;
 b=U+818LN0uLi3wdVIvAkLzufq4eC3K2ZOZUP292OQwsnoozKOILQOUOQAFOx3dOzUqc
 uylwucvbr9goULGCIJhURKwCpr7WfuKKUNqBT8AYPAzgqfq2HN56rSMws10up1W0QywH
 uoujEOKpj5qAKCGP4UbZsuAINu4HVIZZNIDgsUlifmNqd7ccM6/LR0ZOCJvvgXPCC2UZ
 T0YZCHWRR3mHd7LiAek5ZpWGkMIKiDwhhKNDj9HOmtYmIGHAVuVggIy51MxzeqJcE+/8
 HP0G0L6QMrW4fIVe7cRyy3Z/YNeX+kyZcTXKoNI08p9/SziF4e4Li4ROVABeC8qtlIYc
 tBqQ==
X-Gm-Message-State: AOAM532jiOkOSwjsixLmbehePnyS1t1tVl1B//DieXuYhKt5PFxF3JZg
 bRLd+DlVutuB/Sn0T+Gmc5krBnikT5WrCNo6bTGbMg==
X-Google-Smtp-Source: ABdhPJwMet/Wx069lnchRvkgjhCl6l69HHssjtZOQy/2qmA7Fm6Yx1UPvTaNVLMgv8Z0GzK0SmzM3++Vn5NXejPqCbA=
X-Received: by 2002:a17:903:1c6:b0:161:9fbc:5a6 with SMTP id
 e6-20020a17090301c600b001619fbc05a6mr22737538plh.65.1653310456152; Mon, 23
 May 2022 05:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084615.13510-1-robert.foss@linaro.org>
 <CAG3jFytkFcmYjj6AHye3imsTDyP1LxHQvAzjswuRBsVVHRTnKg@mail.gmail.com>
In-Reply-To: <CAG3jFytkFcmYjj6AHye3imsTDyP1LxHQvAzjswuRBsVVHRTnKg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 14:54:04 +0200
Message-ID: <CAG3jFytGDm29GVAQ5bs7XQ+hMDABd7btggFGN2pASBEzRPE50A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "drm/bridge: anx7625: Use DPI bus type"
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, xji@analogixsemi.com, hsinyi@chromium.org, 
 sam@ravnborg.org, tzimmermann@suse.de, maxime@cerno.tech, 
 jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two patches need to be reverted since they were part (3/4 & 4/4)
of a series, that was partially (1/4 + 2/4) on the linux-media tree.
These two patches depend on the patches in the media tree, and will
not build without them, which leaves linux-drm-misc-next in a broken
state. Let's revert the two latter patches until rc1 has been branched
and the dependency wont cause issues any more.

On Mon, 23 May 2022 at 14:50, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Mon, 23 May 2022 at 10:46, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > This reverts commit a77c2af0994e24ee36c7ffb6dc852770bdf06fb1.
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 01f46d9189c1..53a5da6c49dd 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> >
> >         anx7625_get_swing_setting(dev, pdata);
> >
> > -       pdata->is_dpi = 0; /* default dsi mode */
> > +       pdata->is_dpi = 1; /* default dpi mode */
> >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >         if (!pdata->mipi_host_node) {
> >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >                 return -ENODEV;
> >         }
> >
> > -       bus_type = 0;
> > +       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> >         mipi_lanes = MAX_LANES_SUPPORT;
> >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> >         if (ep0) {
> > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> >         }
> >
> > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > -               pdata->is_dpi = 1;
> > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > +               pdata->is_dpi = 0;
> >
> >         pdata->mipi_lanes = mipi_lanes;
> >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > --
> > 2.34.1
> >
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
