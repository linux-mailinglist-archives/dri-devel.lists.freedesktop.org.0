Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A5458F41
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1366E0CE;
	Mon, 22 Nov 2021 13:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03C6E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:16:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x6so64970290edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lCRsR0pKyMc+G/zyWnPG8WzLESNEovBPjmxXuyemZYc=;
 b=mluxfmACwAfcUnq/ak6qBUFSVw/fJLpNAgzsD5Ob6WnRproTCLf0EKqZvBiZcAYxjU
 oxfFbkP1Og863IJhSokOEKu/G+xfXxj6mIzIy6GpmEhWhgOlb2IuK8fI1SREIf2PWY2N
 oIB3ErI51ifksdjeRJWZm3iahdCbBc/UvwGqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCRsR0pKyMc+G/zyWnPG8WzLESNEovBPjmxXuyemZYc=;
 b=Y8ASDDRDRjrLjAK5OPshUnG2s2u2jxGXRUvZKtBVebsh8v6JYPYyCs4oPO7TlNgJ5T
 B9RC919Lr4hy5aaqDSmbfbc8KDja82MVthAZAXt3EC2FmsTALuKcgiZf5pbTejqj4MRc
 RrYFqmcFnLeTJR5bxZRRZHZIkH5zbmUNjIdOPs938LonNm1iR09dD6zrPyfftwX+Qbql
 Ln5mdyKplvHm3rJWAQJBMEr6vyORXLHWrwI9PKsy9OiSTRdu8q8+owYecYcbgRpTmWcC
 XNSNeCSzK2tyJ7NEnWgsQqm2Nlq6DAQejHIzQHgV4C/MWHENmNTHChXKnQE9nXGP3Pad
 3m/Q==
X-Gm-Message-State: AOAM5336d2+O1sZsc9zhc32d9U4ZSWxOq6I9B+AtwiHCWGCnlZM5yMVL
 5gJ59opxRDnf4XxJ+MHO2/jSS/nU28lhS6s3Go9JwA==
X-Google-Smtp-Source: ABdhPJwdV1EFlV3POYWXlequ6FQSAPsvPzSCJ8vIJ4oo/qvUtmSjoWUBuGHaSkak4BXLKeKnCzpLFSqnfGCQqtOBY44=
X-Received: by 2002:a17:906:b2c7:: with SMTP id
 cf7mr41735118ejb.303.1637586990035; 
 Mon, 22 Nov 2021 05:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
In-Reply-To: <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 18:46:19 +0530
Message-ID: <CAMty3ZDATTKoJq7aLOe5i=RPo2UHzqnLs8j8sT-EBNdpC7=3DQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Mon, Nov 22, 2021 at 6:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 22/11/2021 07:52, Jagan Teki wrote:
> > Some display panels would come up with a non-DSI output, those
> > can have an option to connect the DSI host by means of interface
> > bridge converter.
> >
> > This DSI to non-DSI interface bridge converter would requires
> > DSI Host to handle drm bridge functionalities in order to DSI
> > Host to Interface bridge.
> >
> > This patch convert the existing to a drm bridge driver with a
> > built-in encoder support for compatibility with existing
> > component drivers.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v5:
> > - add atomic APIs
> > - find host and device variant DSI devices.
> > Changes for v4, v3:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> >  2 files changed, 96 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 43d9c9e5198d..a6a272b55f77 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -21,6 +21,7 @@
> >
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
> >       return 0;
> >  }
> >
> > -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> > +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state *old_bridge_state)
> >  {
> > -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> > -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> > +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> > +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> >       struct mipi_dsi_device *device = dsi->device;
> >       union phy_configure_opts opts = { };
> >       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       if (dsi->panel)
> >               drm_panel_prepare(dsi->panel);
> >
> > +     if (dsi->next_bridge)
> > +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> > +
> >       /*
> >        * FIXME: This should be moved after the switch to HS mode.
> >        *
> > @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >       if (dsi->panel)
> >               drm_panel_enable(dsi->panel);
> >
> > +     if (dsi->next_bridge)
> > +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> > +
>
>
> No need to call the next bridge atomic pre_enable/enable/disable/post_disable since they will
> be called automatically on the bridge chain.

Correct, but the existing bridge chain (stack) is not compatible with
sun6i DSI start sequence. We cannot send any DCS once we start HS
mode.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n775

This specific problem can be fixed only if we change the bridge chain
from stack to queue. Please check this series
https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-6-jagan@amarulasolutions.com/

Jagan.
