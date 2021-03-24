Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21C34744E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04B36E989;
	Wed, 24 Mar 2021 09:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51D16E989
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:15:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z1so26804487edb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsFZ3U+MTNyWBA6xTX8iF9xhpZHq3owuoQogBCZG32k=;
 b=SFaIWTPXjQmFIZdTzls7n3rZGu4qFTSI7ywPxkxDafUt+AG1O9zJ6P1P/a/TiI2mWP
 JyFpey4vtoBKpJMOf9daf8sVPp1ktAftF5yUmUQoRacS6+vGRKilP4xu9aRHgZ14jCE2
 voQErrwf259SU9J9GSKws7cwMszh3ta43hPQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsFZ3U+MTNyWBA6xTX8iF9xhpZHq3owuoQogBCZG32k=;
 b=qmjo/2aG9EjyFRt5BX7aXU8erWjWcGbvAZsyQsINq+JM6UUqogeGZLYABYUiEK+vin
 yrPwtJWNtYcuDMRJszw02iQ7RNkdk4jmqzIH3+p3le39dfa7R63RcBhAxxWutpUjnzx7
 8mpAWJ7idlgEqCaOStfTSnivSna+3i90roArOlpASSDNfOb4V7JOu5y1hsoGLdv2Vzz8
 qKbMdYFXrgXZiIyDiOTD793aFxy928r5bjcoAvhQmGoDqKBFNbaSsHI3cx+Di/A0t97G
 C35k21hZ6r132Kkq0gOE1RKbphu84xXaKE1zhlfWHrxLkg4O/Z3+YOCKxguDpC4NsgGp
 GU9g==
X-Gm-Message-State: AOAM530iCo92NzLSip429jXy5/HFhWeI/BXnPyeNgKWh0O5KDNk3LpS0
 MbqJ3YwRnyW73syibnR9iQl1pBIeGsG99mhp7m5S0A==
X-Google-Smtp-Source: ABdhPJzmOXx9kgtZw4VSF8lAJqdI06RPrtHvtgVdVzxXyy5P7sR9NmJCv5xvsQKHo/odSeVeUt60nl7GZ+W71/v/OPI=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr2349372edb.204.1616577308579; 
 Wed, 24 Mar 2021 02:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-2-jagan@amarulasolutions.com>
 <YFpxYpA+EIZm7sOf@pendragon.ideasonboard.com>
 <f47bc0ad-dbd6-05b5-aaec-2e3256e3715a@sholland.org>
In-Reply-To: <f47bc0ad-dbd6-05b5-aaec-2e3256e3715a@sholland.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Mar 2021 14:44:57 +0530
Message-ID: <CAMty3ZDOVeMeYTsuF8n4EQTG6eEbj6e33TuTPrFiMWG4RhRdSw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
To: Samuel Holland <samuel@sholland.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 8:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 3/23/21 5:53 PM, Laurent Pinchart wrote:
> > Hi Jagan,
> >
> > Thank you for the patch.
> >
> > On Mon, Mar 22, 2021 at 07:31:49PM +0530, Jagan Teki wrote:
> >> Replace of_drm_find_panel with drm_of_find_panel_or_bridge
> >> for finding panel, this indeed help to find the bridge if
> >> bridge support added.
> >>
> >> Added NULL in bridge argument, same will replace with bridge
> >> parameter once bridge supported.
> >>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Looks good, there should be no functional change.
>
> Actually this breaks all existing users of this driver, see below.
>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> >> ---
> >> Changes for v4, v3:
> >> - none
> >>
> >>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >> index 4f5efcace68e..2e9e7b2d4145 100644
> >> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >> @@ -21,6 +21,7 @@
> >>
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <drm/drm_mipi_dsi.h>
> >> +#include <drm/drm_of.h>
> >>  #include <drm/drm_panel.h>
> >>  #include <drm/drm_print.h>
> >>  #include <drm/drm_probe_helper.h>
> >> @@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
> >>                          struct mipi_dsi_device *device)
> >>  {
> >>      struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> >> -    struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
>
> This is using the OF node of the DSI device, which is a direct child of
> the DSI host's OF node. There is no OF graph involved.
>
> >> +    struct drm_panel *panel;
> >> +    int ret;
> >> +
> >> +    ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 0, 0,
> >> +                                      &panel, NULL);
>
> However, this function expects to find the panel using OF graph. This
> does not work with existing device trees (PinePhone, PineTab) which do
> not use OF graph to connect the panel. And it cannot work, because the
> DSI host's binding specifies a single port: the input port from the
> display engine.

Thanks for noticing this. I did understand your point and yes, I did
mention the updated pipeline in previous versions and forgot to add it
to this series.

Here is the updated pipeline to make it work:

https://patchwork.kernel.org/project/dri-devel/patch/20190524104252.20236-1-jagan@amarulasolutions.com/

Let me know your comments on this, so I will add a patch for the
above-affected DTS files.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
