Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2596E65E8FA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D43C10E6E1;
	Thu,  5 Jan 2023 10:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FD410E6E1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:24:47 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 203so39558266yby.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G/dyLLm8QMU71DT4o1jiDbUQdJSSz8sU5W2KpVdkZ64=;
 b=D3awVxbC7TZHFowV5KAHADuWFawsgvCiL6kxdAU0yhWIZdsorHAhRax36xD0K/wFnf
 sC8wyWUJu2DyNHbs/wAdfwGdSKo52d+7zt8QLfZxdV4IxTEwwUiyMoGUg3PcClbhp2K4
 ylybLxvFXkE/X5u7lSg9y1qCPSrnLMJLdhsAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G/dyLLm8QMU71DT4o1jiDbUQdJSSz8sU5W2KpVdkZ64=;
 b=B5sLOwX4vaYVjjUfQDhS3SrKRpkSymoH+8UdWuh7qBaLRMV1fPo1kpUJ6xjxLHJaRL
 OsTZX1gfKc37i/+ShwDRzfYuQ2xrbF5zL5dHRl996FjFJZmPhi/+fTEqtBwsZPjows85
 W0RreWuLVDI4xeLZzMhnYYt0To1wgbcTWQDabABkTncVxSXpfU6qGqkvKJVYTZOrfA8T
 2kNgR3SMspUOgwLM1q6d1JigqN85phMk1LIjkWFg96p2RxndHqbWMb6H+ezukcsIW7kd
 /TZzgKaPZ/X6vr4IltrRjfCzD/A1qaPvOBkJmS4eXntZ8DyDVfGLuW698BobhAQzW+Pd
 V8Ew==
X-Gm-Message-State: AFqh2krj0WLadx0++e1BkV3lukJnVaXHsdy0Z1om/ziyR5PTig54aweb
 /4PMXERJYxjsTdqCFzq3vw//WZYE9/WA+menYp7FJg==
X-Google-Smtp-Source: AMrXdXvvCa38KG+MoU104XU9a3F25FbeTIXhowtBchKRQjzNAjAw0U2JlO8CqPNavOr8WmZbX19nSnbMFTg9PHlWAzc=
X-Received: by 2002:a25:ca02:0:b0:6f2:bad:1be7 with SMTP id
 a2-20020a25ca02000000b006f20bad1be7mr5741604ybg.84.1672914286159; Thu, 05 Jan
 2023 02:24:46 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 5 Jan 2023 15:54:34 +0530
Message-ID: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>, 
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, 
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 6:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>
> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
>
> Patch 0005 - 0006: optional PHY, PMS_P offset
>
> Patch 0007       : introduce hw_type
>
> Patch 0008       : fixing host init
>
> Patch 0009       : atomic_check
>
> Patch 0010       : input_bus_flags
>
> Patch 0011       : atomic_get_input_bus_fmts
>
> Patch 0012 - 0013: component vs bridge
>
> Patch 0014       : DSIM bridge
>
> Patch 0015 - 0016: i.MX8M Mini/Nano
>
> Patch 0017 - 0018: i.MX8M Plus
>
> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
>
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
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
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> v9:
> https://lore.kernel.org/all/20221209152343.180139-1-jagan@amarulasolutions.com/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (16):
>   drm: of: Lookup if child node has DSI panel or bridge
>   drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
>   drm: exynos: dsi: Drop explicit call to bridge detach
>   drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
>   drm: exynos: dsi: Mark PHY as optional
>   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>   drm: exynos: dsi: Introduce hw_type platform data
>   drm: exynos: dsi: Add atomic check
>   drm: exynos: dsi: Add input_bus_flags
>   drm: exynos: dsi: Add atomic_get_input_bus_fmts
>   drm: exynos: dsi: Consolidate component and bridge
>   drm: exynos: dsi: Add Exynos based host irq hooks
>   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>
> Marek Szyprowski (1):
>   drm: exynos: dsi: Handle proper host initialization
>
> Marek Vasut (1):
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support

Does anyone have any other comments on this? I would like to send v11
with a few nits on v10. Please let me know.

Thanks,
Jagan.
