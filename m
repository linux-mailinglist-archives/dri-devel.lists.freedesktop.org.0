Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0985085A4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 12:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC54710F0C8;
	Wed, 20 Apr 2022 10:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718210F0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 10:17:54 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v15so1605924edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ShvS3HJ5rjHZpPifq/WYscuh7jL9nqoQ8QbWdsKiPVk=;
 b=b1EMw3PxJyV/nSPSDjbi573dYh5IAVHM9cjb1RIyWJbkw+RhZ5sGMgNObsxCtJT8IQ
 L6Okl6qm88+rNX+n9T0/Onl0oJeMN3ntlJnMsrUykPlUXRH5ZrHhKkT3PxrvY+FQ0G6g
 Oy/u8XyJbiufgiEVj+O9pmpGPcDmnj/+mWzV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ShvS3HJ5rjHZpPifq/WYscuh7jL9nqoQ8QbWdsKiPVk=;
 b=wot5Hhu+A6Oda95mLCKcXhw8hxzKbUfHz5sQHZ3iXGUHsyRcd/f/Gaeq4xx9FK57Cn
 aw16qtb1/i5c6/d5RrI7++ByeloD5A5Uu98ori7BQRXIwLwNwyUCyXfud12X15cxGiM6
 tqxRDZqR75COKhIDfw7yFkVSueeHGg/WdG1d+OrFDCjIQP4J8Y0z9QA+e1d2T++yuew8
 lLuZbj/2sHfT4R5RZbZeGsA8E7CT5ar+3v1D1Dkh4x/Uyxwj+kHwr+mDToXLdLxj+BTC
 oC1e2JsIGzkOZCQMeiXjFiZIcfjzSSUEQov95oSLRKYnZOp0//QM3g8TLxA5Q96KO8HG
 +DaA==
X-Gm-Message-State: AOAM531qM6IHc6eTUQB6lT1jdBNut7VMRt7gUwTzGQc/qydMG0cjroi+
 Kt5iMVxElRnuPaxupob/jbt4g9Ql0tUikwRFnZuljTPEl/tsNw==
X-Google-Smtp-Source: ABdhPJy22zKXfekTigtWQIge1k2C9W87M9jXkm0NSS4CCCVQjoCJKD+V2sbDYGpkBk/EJ/yASVnkv4Qb5fuzwjcx7lk=
X-Received: by 2002:a05:6402:438c:b0:423:f57a:596f with SMTP id
 o12-20020a056402438c00b00423f57a596fmr11017747edc.367.1650449873294; Wed, 20
 Apr 2022 03:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220419091438eucas1p2a7d13d5d81a3ef59fdf762718b674d0c@eucas1p2.samsung.com>
 <20220419091422.4255-1-m.szyprowski@samsung.com>
 <CAMty3ZB31chzCfFkogx7otqH8rOZ0wEGDBuxLcG-PKQ-HBHy4w@mail.gmail.com>
 <CAG3jFyuwH2Hj7EtzuXZ1GmCcSoaVpaN1Rr7A+W+m2a2qr0o-NA@mail.gmail.com>
 <Yl7zcdYfkQlv/bsj@pendragon.ideasonboard.com>
In-Reply-To: <Yl7zcdYfkQlv/bsj@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 20 Apr 2022 15:47:42 +0530
Message-ID: <CAMty3ZBuWJGtrEKA8KNdxebeJ94NcAs872avdQWKWb8E+JgEKg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: panel: Register connector if DRM device is
 already registered
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 11:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 19, 2022 at 06:16:07PM +0200, Robert Foss wrote:
> > On Tue, 19 Apr 2022 at 11:41, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > On Tue, Apr 19, 2022 at 2:44 PM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > > >
> > > > If panel_bridge_attach() happens after DRM device registration, the
> > > > created connector will not be registered by the DRM core anymore. Fix
> > > > this by registering it explicitely in such case.
> > > >
> > > > This fixes the following issue observed on Samsung Exynos4210-based Trats
> > > > board with a DSI panel (the panel driver is registed after the Exynos DRM
> > > > component device is bound):
> > > >
> > > > $ ./modetest -c -Mexynos
> > > > could not get connector 56: No such file or directory
> > > > Segmentation fault
> > > >
> > > > While touching this, move the connector reset() call also under the DRM
> > > > device registered check, because otherwise it is not really needed.
> > > >
> > > > Fixes: 934aef885f9d ("drm: bridge: panel: Reset the connector state pointer")
> > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > ---
> > > > Here is a bit more backgroud on this issue is available in this thread:
> > > > https://lore.kernel.org/all/f0474a95-4ba3-a74f-d7de-ef7aab12bc86@samsung.com/
> > > > ---
> > > >  drivers/gpu/drm/bridge/panel.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > > index ff1c37b2e6e5..0ee563eb2b6f 100644
> > > > --- a/drivers/gpu/drm/bridge/panel.c
> > > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > > @@ -83,8 +83,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
> > > >         drm_connector_attach_encoder(&panel_bridge->connector,
> > > >                                           bridge->encoder);
> > > >
> > > > -       if (connector->funcs->reset)
> > > > -               connector->funcs->reset(connector);
> > > > +       if (bridge->dev->registered) {
> > > > +               if (connector->funcs->reset)
> > > > +                       connector->funcs->reset(connector);
> > > > +               drm_connector_register(connector);
> > > > +       }
> > >
> > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Fixed typos in commit message.
> >
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> >
> > Applied to drm-misc-next
>
> Doesn't this open the door to various race conditions ?
>
> Also, what happens if the panel bridge is detached and reattached ? If I

I believe the dev->registered is the check for those already registered.

Jagan.
