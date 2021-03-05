Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820532EE9C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2926E0A5;
	Fri,  5 Mar 2021 15:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB356E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:22:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id s23so2238222pji.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wxoa0yK9hiaUs30uaCIrzcYi8kY+19xmjNAI3OUqgyg=;
 b=c75le3XEPFcaZsVxGM3XsBqhWjLvTlNKBzxbjjFdzHpTqSV+KWCcxT2bVCNFk+GFZ6
 urTe715ydlT8zINgnoPrAYD8TlU3dMsHt9eIVazFtO+I6Jg0wu6E0+tEtVJhkLRi8ARy
 Ve/CJk1MOYjD27mhwxBhCpMjfY9cB+XKhWjWPcIRuhFS4tU7EkDv7FrmJ4U/lq4Xdclm
 Zkdx2YP4xODMnTxJsG7XYZ9s4wmwg7MvUjR/iDLo2/dy7mCOGAq0w13I8NWbVCvdK+cC
 2Wzz/0xRJOFqWI7mD5fS+8K2QpotzkCQWXEJ2uZO8dGpJgzG+gEvBMNIPotvWxX5CAmI
 5fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wxoa0yK9hiaUs30uaCIrzcYi8kY+19xmjNAI3OUqgyg=;
 b=t+cvRg4bK5ZGoLLyCDZqDOq7K8/hGNgAYhMmuqniS+f8J2ctv1+vpQcz8j7/VelQMz
 +Lj7u9Ob1jX2sdfn3CrH9i5asdmHt5FIVvzitTfjrjQEK77MNjM6HiJwvlZ5fY4BjDKQ
 wpshFVqK2RSVAYwNPGafn3qCmrSB1g7jpeAI6/V831BFuxKqDtMKwNau2s1+4n7tQ7zn
 vA1rSDlzHSoBMjdTzMelxUMt4ItnCSnRj83orpU8McOoWL76zjcEOuXevAAuNpTKT0qW
 tniPLfFW8NLq63vlMEplkWYLcNQXlcIvsg4Tg/cPQwEtA2V3PbQQuxnELurJOtxz4Eqk
 vfWg==
X-Gm-Message-State: AOAM532bnw6DS8WNYQjCUgkp6xZZT71O3Z3KquS9HFXEse8tkOhmArz8
 ZlXwXD/vakIySihxlbOfnSGHDgGKCl8oYWZvWKxzZw==
X-Google-Smtp-Source: ABdhPJw5ZAsqywVtH0BwssTWluIZq8MEdOUKOr5IiQoU7/DNBPrVI23nRNbeFLpq6wTLR3mk95fmV9ZUlyvgaQ8X+wE=
X-Received: by 2002:a17:902:d707:b029:e5:c9ce:cb33 with SMTP id
 w7-20020a170902d707b02900e5c9cecb33mr9156791ply.32.1614957741057; Fri, 05 Mar
 2021 07:22:21 -0800 (PST)
MIME-Version: 1.0
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <a89d5c08c9f0793acfb9d056d5748e4a3cf16c2f.camel@nxp.com>
In-Reply-To: <a89d5c08c9f0793acfb9d056d5748e4a3cf16c2f.camel@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Mar 2021 16:22:10 +0100
Message-ID: <CAG3jFyvWZV_WVeR1+EvvH0C47CqCtPDMULiOVKzR51ukzFMJwA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY
 mode support
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 agx@sigxcpu.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 martin.kepplinger@puri.sm, kishon@ti.com, linux-imx@nxp.com,
 robert.chiras@nxp.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 s.hauer@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liu,

Looking at this series[1], all but patch#2 has been reviewed, and #2
looks good to me. So I think this series is ready to have v4 re-spun
and and all of the r-bs from v3 added to the relevant patches.

[1] https://patchwork.kernel.org/project/dri-devel/cover/1607651182-12307-1-git-send-email-victor.liu@nxp.com/

On Fri, 19 Feb 2021 at 10:22, Liu Ying <victor.liu@nxp.com> wrote:
>
> A gentle ping.
>
> Vinod, Kishon, it would be nice if you may help review this.
>
> Thanks,
> Liu Ying
>
> On Fri, 2020-12-11 at 09:46 +0800, Liu Ying wrote:
> > Hi,
> >
> > This series adds i.MX8qxp LVDS PHY mode support for the Mixel PHY in the
> > Freescale i.MX8qxp SoC.
> >
> > The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
> > MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
> > SCU firmware.  The PHY driver would call a SCU function to configure the
> > mode.
> >
> > The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
> > where it appears to be a single MIPI DPHY.
> >
> >
> > Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
> > bridge driver, since i.MX8qxp SoC embeds this controller IP to support
> > MIPI DSI displays together with the Mixel PHY.
> >
> > Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
> > and through a custom structure added to the generic PHY configuration union.
> >
> > Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.
> >
> > Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.
> >
> > Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.
> >
> >
> > Welcome comments, thanks.
> >
> > v2->v3:
> > * Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
> > * Improve the 'clock-names' property in the PHY dt binding.
> >
> > v1->v2:
> > * Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
> > * Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
> > * Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.
> >
> > Liu Ying (5):
> >   drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
> >   phy: Add LVDS configuration options
> >   dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
> >   dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
> >     i.MX8qxp
> >   phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
> >     support
> >
> >  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt |  29 ---
> >  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 107 ++++++++
> >  drivers/gpu/drm/bridge/nwl-dsi.c                   |   6 +
> >  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c     | 269 ++++++++++++++++++++-
> >  include/linux/phy/phy-lvds.h                       |  48 ++++
> >  include/linux/phy/phy.h                            |   4 +
> >  6 files changed, 423 insertions(+), 40 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> >  create mode 100644 include/linux/phy/phy-lvds.h
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
