Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F525072C2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283D210F019;
	Tue, 19 Apr 2022 16:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C110F019
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:16:19 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id n18so16236569plg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=07gmF3RRSTKhju3FJ03oKURgy12K7/rKfq4fEwUnNY8=;
 b=gT6+CZdIaDZQ6oTi4+OLN9Vt63ScPyEClhhiACkXUlgtDlMTmfjOa3nxMIqwlF4I0k
 EHZwLmDUV8ayJqXDuweuQ3DiEK7Jz0uP/xZgJPTPCd7e1cxXW4OYrNqdyQhTsmgm4ui5
 IgaijCZkNxsC0K0CsA0Il66fn9OLtq2JqILAo6YLrbtkhvnUkk2yCsndzsEHI6Vlo/sh
 eAB0PCyARqypFG/Z5lv/+IGiY3Ghumuj1jxwXK0xYknJw9GN3OWp4tx/HL9qQEQS+fAJ
 3/n5dr2I91rJ8hITSgarrVUC6Jb2UkE50GvGMncqBjO2Bv+Zx7g6/xxTGTgTAHAP/TCK
 Ymcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=07gmF3RRSTKhju3FJ03oKURgy12K7/rKfq4fEwUnNY8=;
 b=dWYqLemfPJjsd680IYZd2CvQ1aawqO1wdI4O1QASBKH5W2ebmR3SCfL4FflexMuwOq
 ODwwOgsMB4XcU73gws5XUBBCmY+GoLCwc/b9wrmqguX/4BzVGYcF4hDZdVXZiBzBWkBM
 fYoRRvbTDR462TJX9r8I82bxg0es2Wu6KhTvBXJBtILpz/YJGown40oVaB9J/7c8wiZ/
 XHit8f/IS5oxld12WrBTLhoz4m/2lIs6LSw/JBqtkQk7N4tq+9Y8R7rXL3upD2ffiLaa
 nLXMG1e+Lp3v73Vtg4ZcbwnVhMVxXSsvME094UQHlwp38LWdFe2QVizABBuub/Cx3kTr
 wRCw==
X-Gm-Message-State: AOAM532cPrTMcbr6fRiTJx4v1j51UIlrmn6wbMv8G2QWkoYsPSAgqpAI
 sx1t1AHB4bbhO9cQRLJJlhIe1xhdA3GFaUjqJSXvyQ==
X-Google-Smtp-Source: ABdhPJwtLMUJ/nxv/YM9AE82Wocx5M34EciLxvZCokBJp9uFicrlFpKgAHwgGAaMXUs1d4fnrPvG4YCAkaKxjG3QOvk=
X-Received: by 2002:a17:903:32c6:b0:158:ded2:e766 with SMTP id
 i6-20020a17090332c600b00158ded2e766mr16254499plr.117.1650384978585; Tue, 19
 Apr 2022 09:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
 <20220419091422.4255-1-m.szyprowski@samsung.com>
 <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
In-Reply-To: <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 18:16:07 +0200
Message-ID: <CAG3jFyuwH2Hj7EtzuXZ1GmCcSoaVpaN1Rr7A+W+m2a2qr0o-NA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 at 11:41, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Tue, Apr 19, 2022 at 2:44 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > If panel_bridge_attach() happens after DRM device registration, the
> > created connector will not be registered by the DRM core anymore. Fix
> > this by registering it explicitely in such case.
> >
> > This fixes the following issue observed on Samsung Exynos4210-based Trats
> > board with a DSI panel (the panel driver is registed after the Exynos DRM
> > component device is bound):
> >
> > $ ./modetest -c -Mexynos
> > could not get connector 56: No such file or directory
> > Segmentation fault
> >
> > While touching this, move the connector reset() call also under the DRM
> > device registered check, because otherwise it is not really needed.
> >
> > Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > Here is a bit more backgroud on this issue is available in this thread:
> > https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index ff1c37b2e6e5..0ee563eb2b6f 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
> >         drm_connector_attach_encoder(&panel_bridge->connector,
> >                                           bridge->encoder);
> >
> > -       if (connector->funcs->reset)
> > -               connector->funcs->reset(connector);
> > +       if (bridge->dev->registered) {
> > +               if (connector->funcs->reset)
> > +                       connector->funcs->reset(connector);
> > +               drm_connector_register(connector);
> > +       }
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

Fixed typos in commit message.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next
