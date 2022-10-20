Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D060605B01
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BB110E038;
	Thu, 20 Oct 2022 09:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8710E038
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:20:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id q9so45938836ejd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q4S70YJksDVYlpSIdOzNDF7El0xkhTpiwZNPCDS+5kU=;
 b=l1/4BAalaP5NMZFyq2rYuLQVevKjwfJysvzaoYfcfIbTpap1NfrBUn4EaAptkq670r
 rYfSiHt0+B0QhKl42Rl8l3I5X10iAJ0+NQzaAgNUcJBMGcSVQudAR65ehvpFGwvwfnOd
 k0oiwXr2tOd0KK2BC4OOY3odFrf/99cIdtTvmZNHrhjqJz5XmjolI4lEGGEbZOCKhsUu
 B25FWuOLxM/LiN5g4ItXrk48P8xkKLeB1nBga9HjaOEXedZBZUYTBHHkQc7o/6/5x/Et
 kE0+0QACGJC6hn2fTOfOK+pMdv93Zr9NJAYZmPamV4hKK7l0WMIGB9igiU07JQv6tege
 q6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4S70YJksDVYlpSIdOzNDF7El0xkhTpiwZNPCDS+5kU=;
 b=vWpZlar5ducrlHh50g+XURpd6DCyJvOD3itN1veIqM02zNQEqxk1Ks2fVi3l2bmE3m
 mF1E26IH88SMHXMtwLQ5R3h4iPyaiauGLsMdjVvZT9Zx6ECdnBp35Otm8paJX1QMF2LK
 6bSNFNdgXbwexUIy3RPSpCKIZvpeRWq6TqroSans885XyS+8bfoYAmus8I/yhHTn5TcD
 LqAroktxAJEGqeBH896PGo/4WsYuUy2uZz7/yRIbJw1VyeHf2QL6lOja6YH8y6mA8Rw6
 /CocGCq3BHHvJaJXBVKVI2KrPP42D33lZIcDih/6GNmLUIobCoqtbYkYFbG3KfhQLJHB
 KK6A==
X-Gm-Message-State: ACrzQf2mguh851Xnbmb1rE+5bCqtfWsk0A4dnR0tyiz2R1JInTXZRkOC
 pXuhTNs8n/KijL7mXqIsKPaEzc1P2lOCc83eBOnV3w==
X-Google-Smtp-Source: AMsMyM6fMToLGQtLNv+aUrAPf/AfuLJ7BTxZcq++tnNuT1/RtcRsuqcD24ON4TgId/nbjhi99Ln6pRLaDqFaU62Tfoo=
X-Received: by 2002:a17:907:7ba8:b0:78e:1b38:6b1b with SMTP id
 ne40-20020a1709077ba800b0078e1b386b1bmr9851699ejc.626.1666257612142; Thu, 20
 Oct 2022 02:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 20 Oct 2022 11:20:01 +0200
Message-ID: <CAG3jFytYaUG5mj6SCd+ZRRhU=paCo-irj4ZXFDXP2etHztV9yg@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
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
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jagan,

On Wed, 5 Oct 2022 at 17:13, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Patch 0001:     Samsung DSIM bridge
>
> Patch 0002:     PHY optional
>
> Patch 0003:     OF-graph or Child node lookup
>
> Patch 0004:     DSI host initialization
>
> Patch 0005:     atomic check
>
> Patch 0006:     PMS_P offset via plat data
>
> Patch 0007:     atomic_get_input_bus_fmts
>
> Patch 0008:     input_bus_flags
>
> Patch 0009:     document fsl,imx8mm-mipi-dsim
>
> Patch 0010:     add i.MX8MM DSIM support
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7
>
> Any inputs?
> Jagan.
>
> Jagan Teki (10):
>   drm: bridge: Add Samsung DSIM bridge driver
>   drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
>   drm: bridge: samsung-dsim: Mark PHY as optional
>   drm: bridge: samsung-dsim: Handle proper DSI host initialization
>   drm: bridge: samsung-dsim: Add atomic_check
>   drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
>   drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
>   drm: bridge: samsung-dsim: Add input_bus_flags
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
>   drm: bridge: samsung-dsim: Add i.MX8MM support
>
>  .../bindings/display/exynos/exynos_dsim.txt   |    1 +
>  MAINTAINERS                                   |    9 +
>  drivers/gpu/drm/bridge/Kconfig                |   12 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
>  include/drm/bridge/samsung-dsim.h             |  115 +
>  8 files changed, 2108 insertions(+), 1653 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h

I'm seeing some checkpatch --strict warnings throughout this series,
do you mind having a look at them?
