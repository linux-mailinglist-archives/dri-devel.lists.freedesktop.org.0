Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9E67A271
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 20:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792E210E18B;
	Tue, 24 Jan 2023 19:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC1A10E18B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 19:13:05 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id 188so20147876ybi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dZlQnd1Ps/0Xsk7T1j6t5D52f6MhzQcFEYAGns4bZa8=;
 b=bmagdcu7XlzGpU70LABD8M5lxLdhXB3wkOKWSZPqyH4GTVU8JoSgHROWfoCexhHGwm
 xR+WxKbhO9XiouHFq3q9vrkFI+Lbq+iVRKA3eu5WGCgr05ppxAzJiLkQ0I+K+ZwmyAqN
 m1uO34/0FWHositfHFOaXDpuiqKLPi4JxAMBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZlQnd1Ps/0Xsk7T1j6t5D52f6MhzQcFEYAGns4bZa8=;
 b=fCBO1jnIIjs6jiDuvwIRR2wj57T2Ti6gUAay2EDLtDXAS2zRK0FctP87FygaWctOKQ
 mafNKBv5LBoxCUHG2JBeLNITFt/9qNc2L/KZFTYNanqU4wOiZg3Bz1jDSPJm2YnYXs20
 OyaFs9Nb3k3Rcisj38Ra7LWESBlSuKqodB1nqTf0v+IiresqaEzDTf1nVuTB71Gq1dPm
 hhmGNjmqdDRMqLfqHyghd88piZrpEdjgaZh9bunkRy6Jpanpq/+lpieYcM1ZiL3dvJs6
 PRDoZ/Xg5rDIrQyNHQjwgIa3gHza97sQzkNc1S/bBnG9hqFzeERFkTnZNmUUK5+3q3MQ
 U5Bg==
X-Gm-Message-State: AO0yUKXiDB+1nCQNuA8MwzDfFplfsF39fcPMX2NTsV5aBXcPuJI4+ZIC
 NVCwkb+zejrju1++vDr4Ssf8RSVVECuPpGuEzocV8g==
X-Google-Smtp-Source: AK7set+dvgIYsqjXszDD6gvJGJkbFtzPgeRu3GVbZ+V2Gz2p01ZAknJFQcCL43ZzIHSiF8zR9Q1b0VIFNXsC9Hdsl1k=
X-Received: by 2002:a25:d7d1:0:b0:80b:69cc:78d8 with SMTP id
 o200-20020a25d7d1000000b0080b69cc78d8mr386955ybg.475.1674587584433; Tue, 24
 Jan 2023 11:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 00:42:51 +0530
Message-ID: <CAMty3ZBurwPHZ3bCSV-L+Fk3NGjJKnM8r4gWHPdb3VnqWhzVtA@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 00/18] drm: Add Samsung MIPI DSIM bridge
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

On Mon, Jan 23, 2023 at 8:42 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
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
> Changes for v11:
> - collect RB from Frieder Schrempf
> - collect ACK from Rob
> - collect ACK from Robert
> - fix BIT macro replacements
> - fix checkpatch --strict warnings
> - fix unneeded commit text
> - drop extra lines
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
> https://github.com/openedev/kernel/tree/imx8mm-dsi-v11
>
> v10:
> https://lore.kernel.org/all/20221214125907.376148-1-jagan@amarulasolutions.com/
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

Can anyone pick this series?

Thanks,
Jagan.
