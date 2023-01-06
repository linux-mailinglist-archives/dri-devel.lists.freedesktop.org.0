Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622066024B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 15:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F310E010;
	Fri,  6 Jan 2023 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1710E010
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 14:34:42 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so5963228pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 06:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZaYPy2tPVFksG/KUTGQyNyi3qYzIkXR+MVojde5xOo=;
 b=iuKyNvVsyi+JoRiZKQ5M642RXQ+jrigvnNAyN4XUob3BjJOPOvoY4N659ySXW/w/eU
 5LXGUwga9nfjeOHeHwV4Xkmygovebw1LCaU4RIQ1wjG7VJ3vGCNOmMzbMQz8ui/esgOK
 pM2ZgxWxLbt9QEQTuJ9jU9z/U2cBT2Y/m7uvSTDRAZYPe/A3OXYA/l3V9rg+dpkOew2B
 vT/TR59O9nVDdUTKkIskOK75NCtriixC1I8E+Bli16Z17lLD9+aOASIBH1dzwLrXSyuU
 xrHFBs1O1DIvFkPy4tJoHn3ZXX7MrjnxRNhonNgueupaVTphNAu4G2nQdoJaQJQspsi0
 zifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZaYPy2tPVFksG/KUTGQyNyi3qYzIkXR+MVojde5xOo=;
 b=n0pCVf0sspCm2OFO8/2P6Gfv6lp5JnpLVk3IkJATR6Jkm928p5bMTOxVUA0mTtTf3Q
 PT/vds06nA4UO/vqLGs7i+RGsVjp8QstNQzDFaRZDepAIyJ60ALtyCCUO3/OYiMaW9I7
 /qOTfToEku87HKAseQutvHruQeuTwqM4N3Zvuwxkeitd9b3jWUUqoAwqz6kE8QY3ARBz
 AbvxlYKHI2JgI57JID2nfGJm8tA79LPlmPGYKbedi6HcXqvFu6fzgtPdd8y5Xf0fXKBY
 LB6Wn5cE9+oRhv1noBTCHTlVJ30n4DhgsnCXPd4yu7Lo+9xE2e6yagvGaPqAsg+v1wEW
 NxIA==
X-Gm-Message-State: AFqh2kqfGPb8V9zgZrYNldw2UyuEBATitvWqE/rRsadcnupK7oFk0gV6
 iSNUfgTtLBOByBFO6CLwnhJFOg9lkIGvWX/nJsM=
X-Google-Smtp-Source: AMrXdXtgXMVF9F+kBpfmC6kWHetjRYrPuuzz4gzUJuQ9KVBKzTvk0uO/wT2FJSA7o0+qxu8gdyTuTAZty2ADOJM+55A=
X-Received: by 2002:a17:902:7e41:b0:192:5aae:c828 with SMTP id
 a1-20020a1709027e4100b001925aaec828mr2263552pln.125.1673015682162; Fri, 06
 Jan 2023 06:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
In-Reply-To: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 6 Jan 2023 08:34:30 -0600
Message-ID: <CAHCN7xLyS8Jr38gNSyaRMEU3zYg04AhyC79owpTrHbbLf8cL5A@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 4:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Dec 14, 2022 at 6:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
> >
> > Patch 0005 - 0006: optional PHY, PMS_P offset
> >
> > Patch 0007       : introduce hw_type
> >
> > Patch 0008       : fixing host init
> >
> > Patch 0009       : atomic_check
> >
> > Patch 0010       : input_bus_flags
> >
> > Patch 0011       : atomic_get_input_bus_fmts
> >
> > Patch 0012 - 0013: component vs bridge
> >
> > Patch 0014       : DSIM bridge
> >
> > Patch 0015 - 0016: i.MX8M Mini/Nano
> >
> > Patch 0017 - 0018: i.MX8M Plus
> >
> > Changes for v10:
> > - rebase on drm-misc-next
> > - add drm_of_dsi_find_panel_or_bridge
> > - add devm_drm_of_dsi_get_bridge
> > - fix host initialization (Thanks to Marek Szyprowski)
> > - rearrange the tiny patches for easy to review
> > - update simple names for enum hw_type
> > - add is_hw_exynos macro
> > - rework on commit messages
> >
> > Changes for v9:
> > - rebase on drm-misc-next
> > - drop drm bridge attach fix for Exynos
> > - added prepare_prev_first flag
> > - added pre_enable_prev_first flag
> > - fix bridge chain order for exynos
> > - added fix for Exynos host init for first DSI transfer
> > - added MEDIA_BUS_FMT_FIXED
> > - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
> >   list is unsupported.
> > - added MEDIA_BUS_FMT_YUYV10_1X20
> > - added MEDIA_BUS_FMT_YUYV12_1X24
> >
> > Changes for v8:
> > * fixed comment lines
> > * fixed commit messages
> > * fixed video mode bits
> > * collect Marek Ack
> > * fixed video mode bit names
> > * update input formats logic
> > * added imx8mplus support
> >
> > Changes for v7:
> > * fix the drm bridge attach chain for exynos drm dsi driver
> > * fix the hw_type checking logic
> >
> > Changes for v6:
> > * handle previous bridge for exynos dsi while attaching bridge
> >
> > Changes for v5:
> > * bridge changes to support multi-arch
> > * updated and clear commit messages
> > * add hw_type via plat data
> > * removed unneeded quirk
> > * rebased on linux-next
> >
> > Changes for v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> > * update init handling to ensure host init done on first cmd transfer
> >
> > Changes for v3:
> > * fix the mult-arch build
> > * fix dsi host init
> > * updated commit messages
> >
> > Changes for v2:
> > * fix bridge handling
> > * fix dsi host init
> > * correct the commit messages
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> >
> > v9:
> > https://lore.kernel.org/all/20221209152343.180139-1-jagan@amarulasolutions.com/
> >
> > Any inputs?
> > Jagan.
> >
> > Jagan Teki (16):
> >   drm: of: Lookup if child node has DSI panel or bridge
> >   drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
> >   drm: exynos: dsi: Drop explicit call to bridge detach
> >   drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
> >   drm: exynos: dsi: Mark PHY as optional
> >   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
> >   drm: exynos: dsi: Introduce hw_type platform data
> >   drm: exynos: dsi: Add atomic check
> >   drm: exynos: dsi: Add input_bus_flags
> >   drm: exynos: dsi: Add atomic_get_input_bus_fmts
> >   drm: exynos: dsi: Consolidate component and bridge
> >   drm: exynos: dsi: Add Exynos based host irq hooks
> >   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
> >   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
> >   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
> >   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> >
> > Marek Szyprowski (1):
> >   drm: exynos: dsi: Handle proper host initialization
> >
> > Marek Vasut (1):
> >   drm: bridge: samsung-dsim: Add i.MX8M Plus support
>
> Does anyone have any other comments on this? I would like to send v11
> with a few nits on v10. Please let me know.

I got it working on an LVDS display that I have, but I didn't get it
working on the HDMI bridge.  Since we have a few tested-by people,
it'd be nice to see this integrated so we can work on ading more
functionality

adam
>
> Thanks,
> Jagan.
