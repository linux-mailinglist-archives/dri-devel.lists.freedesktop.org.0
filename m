Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD36A4A82
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBD810E3BF;
	Mon, 27 Feb 2023 19:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7318210E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:01:36 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-536c2a1cc07so204079327b3.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bbW4sU0s1kcqSS7K1zznkPttVBDfpTp3pE111rq5zio=;
 b=B4O0e+vuc5pGWeYuNCu72tWPIongyzqo1o7K77WYcMCWaelmxh+C7N+yYNb0lZfr9m
 j5KMAPBvDKOfroiR957Gq4qkgiiZKi5w88bB29m55VQRlZbvq9qUTcHSZwBPFbawXKyM
 VIQ+xTAby6VNCAZFI0tJTEGWvVUA51szvv2TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbW4sU0s1kcqSS7K1zznkPttVBDfpTp3pE111rq5zio=;
 b=VFOMvqdpWs37ZC7MbkWx7VEA8qy13DL0OZMjE5kQ/gEzKPUk1I39H9zS92t/rhXyDp
 PFJ1YRFTZfJaFFow+1/HMcbVQi/a7lBhfMO8jbHqknKto9pvkcQoUV1BWdKMFvu+TGCR
 x8dhkFSMR/jOl1476ncnjKU3ppz6bwkuUEIiO4fAywgZezrkBq3XbmL0EmHYoBljZeuV
 pb+TgGyArc0AvIAbcdgMeoj+H92l2yTRJrWwRiK2gkeVKRGN+Jzzy4YWcVT5IrALJzBr
 6cjnV5qEHu2TKFmM34mVhMhFLXpsJ2PVyK8DepVJ3W0C1EMnYKSAY7Vc8gacnoVcPYoz
 jXVw==
X-Gm-Message-State: AO0yUKWcH1wC63WhGv8zPvmdfu5R9E11SBpQAgs8UpdpUYKfQkfYvA0e
 tDZHUJydzGxdQhdaVmgusLzvYhg5PnneSWt4QhX/kQ==
X-Google-Smtp-Source: AK7set+Z/FmZXkRjTjMaQfbSlEDda+xLmqvPkzq8zRZG69iwMnvGsQ7zu8Z2OMsQqJkMSa8VbrM6Mttn9IA8Sjay9mY=
X-Received: by 2002:a25:8f91:0:b0:a9d:be6e:3340 with SMTP id
 u17-20020a258f91000000b00a9dbe6e3340mr1268801ybl.1.1677524495462; Mon, 27 Feb
 2023 11:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
In-Reply-To: <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 00:31:23 +0530
Message-ID: <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, Maxime Ripard <maxime@cerno.tech>,
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

On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 12:39, Jagan Teki wrote:
> > drm_of_dsi_find_panel_or_bridge is capable of looking up the
> > downstream DSI bridge and panel and trying to add a panel bridge
> > if the panel is found.
> >
> > Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> > followed with drmm_panel_bridge_add.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13, v12, v11:
> > - none
> > Changes for v10:
> > - new patch
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >   1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index df15501b1075..12a6dd987e8f 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -25,6 +25,7 @@
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_bridge.h>
> >   #include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> >   #include <drm/drm_panel.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_probe_helper.h>
> > @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >       struct device *dev = dsi->dev;
> >       struct drm_encoder *encoder = &dsi->encoder;
> >       struct drm_device *drm = encoder->dev;
> > +     struct drm_bridge *bridge;
> >       struct drm_panel *panel;
> >       int ret;
> >
> > -     panel = of_drm_find_panel(device->dev.of_node);
> > -     if (!IS_ERR(panel)) {
> > -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -     } else {
> > -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> > -             if (!dsi->out_bridge)
> > -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> > -     }
>
> As far as I understand this from my conversation with Maxime (please put
> him on CC of V15), the change here should instead perform the panel look
> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> the component_ops .bind callback . Here is an example of correct
> implementation:
>
> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805

But, we don't have component_ops.bind for imx8m case, so where do we
want to place the panel hook?

Exynos drm drivers are component-based but, imx8mm is not.

Jagan.
