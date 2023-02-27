Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0926A40DA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7893510E3CF;
	Mon, 27 Feb 2023 11:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587A510E3CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:39:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so9830005pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+B+4fWqTJ+kpLsspGC/byjd+RBAKSMPeH8ZfrgeNAFg=;
 b=E/TKChr6snmbXDo4wtFSBbFVifaFNzFxGtPnl5O/vgmeEACa25K+zrWK7rlI7fCH2i
 qyqqTh4JE1gPNjaw5tRYu5l3peKIYlwiOMEddWU1oOlneh9T9l2dMGAcC48/8+DvRvpM
 QxoIrEZl43UX4dsyFomYUTe7e8h3sDdImRRa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+B+4fWqTJ+kpLsspGC/byjd+RBAKSMPeH8ZfrgeNAFg=;
 b=Ipqy94HI8eLWdIrTsR/zj9ISPWM9uQ0NVVdbI2TKKdyt3MK6byB1jOTcBXiE/JmRfy
 ft5k7IrkiUyHYEOkbDABQIHH5zaCRf7aIYGEg+ltnBhpZM/ucla9cC3LdRA+jd0PpKd9
 U06H5UtwvYcUZ3Ryd0mqjqwaaucjg71rqyXjS4EFTSt2tlWiDABAEUo8YeZq6ZsL1zsV
 gqQzDEeLGLVfTfdiRbViND0IHBZxd5pFyGzkLAOCgwnFX5Q9Q29qaSXo4ULQkkihqR/6
 BesK9suJWsbwt827OBaFBmTpoE8T4iK4xrVQejJmQhto5pLY4r29+6YUzgknA+nWIes9
 IiEA==
X-Gm-Message-State: AO0yUKWXFA9+pZm4FvtWdTt7OYicC9/nee6wFw1uB1ErEC4UQhD9ZBt+
 zJcyHFeehzWTG/XKwBz0nwZp/A==
X-Google-Smtp-Source: AK7set8/9gmmq9W5O0oVvO9kIR4YvX2KBirbIu5xIHPkZqBBK+vj2v8g3n37mN0UOPJmOmzwn9anbA==
X-Received: by 2002:a17:902:e80f:b0:19a:972a:7cb3 with SMTP id
 u15-20020a170902e80f00b0019a972a7cb3mr29524107plg.60.1677497976857; 
 Mon, 27 Feb 2023 03:39:36 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:39:36 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 00/18] drm: Add Samsung MIPI DSIM bridge
Date: Mon, 27 Feb 2023 17:09:07 +0530
Message-Id: <20230227113925.875425-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Patch 0001 - 0004: find child DSI bridge and panel

Patch 0005 - 0006: optional PHY, PMS_P offset

Patch 0007       : introduce hw_type

Patch 0008	 : fixing host init

Patch 0009	 : atomic_check

Patch 0010	 : input_bus_flags

Patch 0011	 : atomic_get_input_bus_fmts

Patch 0012 - 0013: component vs bridge

Patch 0014	 : DSIM bridge

Patch 0015 - 0016: i.MX8M Mini/Nano

Patch 0017 - 0018: i.MX8M Plus

Changes for v13:
- remove devm call for DSI panel or bridge finding
- rebased on drm-misc-next

Changes for v12:
- collect RB from Marek V
- add te_irq_handler hook
- fix comments from Marek V
- update atomic_get_input_bus_fmts logic

Changes for v11:
- collect RB from Frieder Schrempf
- collect ACK from Rob
- collect ACK from Robert
- fix BIT macro replacements
- fix checkpatch --strict warnings
- fix unneeded commit text
- drop extra lines

Changes for v10:
- rebase on drm-misc-next
- add drm_of_dsi_find_panel_or_bridge
- add devm_drm_of_dsi_get_bridge
- fix host initialization (Thanks to Marek Szyprowski)
- rearrange the tiny patches for easy to review
- update simple names for enum hw_type
- add is_hw_exynos macro
- rework on commit messages

Changes for v9:
- rebase on drm-misc-next
- drop drm bridge attach fix for Exynos
- added prepare_prev_first flag
- added pre_enable_prev_first flag
- fix bridge chain order for exynos
- added fix for Exynos host init for first DSI transfer
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20
- added MEDIA_BUS_FMT_YUYV12_1X24

Changes for v8:
* fixed comment lines
* fixed commit messages
* fixed video mode bits
* collect Marek Ack
* fixed video mode bit names
* update input formats logic
* added imx8mplus support

Changes for v7:
* fix the drm bridge attach chain for exynos drm dsi driver
* fix the hw_type checking logic

Changes for v6:
* handle previous bridge for exynos dsi while attaching bridge 

Changes for v5:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next

Changes for v4:
* include Inki Dae in MAINTAINERS
* remove dsi_driver probe in exynos_drm_drv to support multi-arch build
* update init handling to ensure host init done on first cmd transfer

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://github.com/openedev/kernel/tree/imx8mm-dsi-v13

v11:
https://lore.kernel.org/all/20230126144427.607098-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (16):
  drm: of: Lookup if child node has DSI panel or bridge
  drm: bridge: panel: Support nodrm case for drmm_panel_bridge_add
  drm: exynos: dsi: Drop explicit call to bridge detach
  drm: exynos: dsi: Switch to DSI panel or bridge find helper
  drm: exynos: dsi: Mark PHY as optional
  drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
  drm: exynos: dsi: Introduce hw_type platform data
  drm: exynos: dsi: Add atomic check
  drm: exynos: dsi: Add input_bus_flags
  drm: exynos: dsi: Add atomic_get_input_bus_fmts
  drm: exynos: dsi: Consolidate component and bridge
  drm: exynos: dsi: Add host helper for te_irq_handler
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
  drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/panel.c                |    7 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1933 +++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  112 +-
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1819 +---------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 include/drm/drm_of.h                          |   12 +
 11 files changed, 2271 insertions(+), 1752 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

