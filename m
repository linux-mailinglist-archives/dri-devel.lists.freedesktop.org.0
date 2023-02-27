Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D896A4AA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4F810E2D0;
	Mon, 27 Feb 2023 19:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994EA10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 19:15:42 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-536b7ffdd34so204839077b3.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vJ0PEb+cdNY7DG4C7LQ/ErPjGFU907p7f+jGsEX+0Y=;
 b=LPDlavxV0IgkdbK41fkEgVVOAF5S1ar8xXlkMFoeOOdKOKvMfCfiPOTsvGfykIK3P7
 Pbmlp53oSpmt4FPh5qyB14Xne+yuy1OE7icqEiKM9mRT3puzAMX53TspDEHohtZfNIKD
 rvku2OJvpF/XPLBBgOnhigEkDK+3i1luS+reY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vJ0PEb+cdNY7DG4C7LQ/ErPjGFU907p7f+jGsEX+0Y=;
 b=E1XsYjOsO8V0oxuMHob+QeHXACvND4hl0k1hkB2w2/mCPLCLlIO98xsDVHev0z6PHD
 nyWyxeC5XpNGU44Dy1Dwtdsp2ZnpS+NVhM2OpioreLZAr/zud+b5ajqHTmfa/IdfQWmR
 exV0qDmc9PoW9mnIIwDA0F+d9ZGIcdoQYyNBEQpZR+y6ninFwl7zyhFSBGdDioc5iQwM
 5dfHB+M2qKdtsBtKRzL8q0R3gx7bvOuvtGhy4j8aOux8FeX/GYM06dD1hDKgcYm9UO2K
 cJQTeA5R9biTxBcuLobZdHQeEJuERtvDfDJJcnM8u/8RaHngVVGVxoWiruhgAvMueOol
 7Etg==
X-Gm-Message-State: AO0yUKV5PukkAPoXfbGos1Kf+/qga37diIP7U8/rgfdI2EYt7ERBLPdx
 8BHLsxGuho4IgYZcYJX7hUer8T7Y6v/nVncTC2WkZw==
X-Google-Smtp-Source: AK7set+WBush+SD7X8YrWjXfq7TBxgTqfRk6xq+el+E8D/KPl3wAJ0QPXF23UO1RHgty640vs6wpkls4Sab6muTsMjI=
X-Received: by 2002:a25:5d0c:0:b0:aa2:475c:2982 with SMTP id
 r12-20020a255d0c000000b00aa2475c2982mr882946ybb.1.1677525341640; Mon, 27 Feb
 2023 11:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
In-Reply-To: <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 00:45:30 +0530
Message-ID: <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
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

On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 20:01, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/27/23 12:39, Jagan Teki wrote:
> >>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> >>> downstream DSI bridge and panel and trying to add a panel bridge
> >>> if the panel is found.
> >>>
> >>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> >>> followed with drmm_panel_bridge_add.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v13, v12, v11:
> >>> - none
> >>> Changes for v10:
> >>> - new patch
> >>>
> >>>    drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> >>>    1 file changed, 13 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> index df15501b1075..12a6dd987e8f 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> @@ -25,6 +25,7 @@
> >>>    #include <drm/drm_atomic_helper.h>
> >>>    #include <drm/drm_bridge.h>
> >>>    #include <drm/drm_mipi_dsi.h>
> >>> +#include <drm/drm_of.h>
> >>>    #include <drm/drm_panel.h>
> >>>    #include <drm/drm_print.h>
> >>>    #include <drm/drm_probe_helper.h>
> >>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>>        struct device *dev = dsi->dev;
> >>>        struct drm_encoder *encoder = &dsi->encoder;
> >>>        struct drm_device *drm = encoder->dev;
> >>> +     struct drm_bridge *bridge;
> >>>        struct drm_panel *panel;
> >>>        int ret;
> >>>
> >>> -     panel = of_drm_find_panel(device->dev.of_node);
> >>> -     if (!IS_ERR(panel)) {
> >>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> >>> -     } else {
> >>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> >>> -             if (!dsi->out_bridge)
> >>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> >>> -     }
> >>
> >> As far as I understand this from my conversation with Maxime (please put
> >> him on CC of V15), the change here should instead perform the panel look
> >> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> >> the component_ops .bind callback . Here is an example of correct
> >> implementation:
> >>
> >> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
> >
> > But, we don't have component_ops.bind for imx8m case, so where do we
> > want to place the panel hook?
> >
> > Exynos drm drivers are component-based but, imx8mm is not.
>
> In 14/18 patch, the same should be added to generic_dsim_register_host()
> , which is called from the driver .probe() callback, but that is OK.
>
> That's ^ is the iMX part.

Ohh. You mean, we need to find the panel hook separately in two places like
- bind for exynos
- probe for imx8mm

If so? how can I find the drm_device pointer in the probe?

Jagan.
