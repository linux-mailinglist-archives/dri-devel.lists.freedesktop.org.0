Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36240519E2A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAC210EE8D;
	Wed,  4 May 2022 11:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DF310EE8D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:40:41 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id o69so994930pjo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ehaGQfcCZN53TBoTLw2+Ao4eNOjwyEob9y3SvApsCQ=;
 b=Xufl5D8FVB5aTshkuBjnf2aLcau/fM4m0Oaiqec6L81OrRBsMCODiUuIpJ7Wfut+Ar
 +Y+gmMTesfjms7Daw7HQf2cqZYq3BPUgvPNYfxe8TkYHGVju2TrrBy9wfmIrKiA8kkNU
 ibO4468CtMpMMz/0GHLS6zxLuCfe6++Fa09QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ehaGQfcCZN53TBoTLw2+Ao4eNOjwyEob9y3SvApsCQ=;
 b=gD7U/Ti4SVzY0A4qNLTc9k6lzFlALqOAc5OCrk53F2Av30oc8la7HAr/tr6zqtjKdW
 RlbXHljE3Iovj6P2AB44lO4eNuAd47yZFsUgxJ9sTigbJOkuzELmD8p3ghuFLJfppZDe
 cZUZyYLGZHGadC1eoZ0DYYHuhSF3efnmKIisdg1jwrDRJkTvoA3+kdTOldKp6klABLf/
 h3cnxDFnoVjyNkuhTl6EtwEg5IBnpmJhETi839lr/LgtcoFcsziQXAsShuPVJ9Q08L1P
 ZihVyT1Jy5xljNeGXTmlxtnaRx3HWmToDndTuCM3RZRVagfvK5+0DShIudl4b5y3XlCc
 a0qw==
X-Gm-Message-State: AOAM530S7qmehGGDadDgyt8DuF/vo9l21FbdoR7vVSBU1P/k6uiWJjsR
 dHpPKjMaL+51xQaX4pJ9tQeUwg==
X-Google-Smtp-Source: ABdhPJz/PBatSLvInFvPkn66hxIPrXqLpUU9MJRpqA06WkboxrvASyB60iDc9X4HhiYc4BEoDGXKNg==
X-Received: by 2002:a17:90b:4a05:b0:1dc:1a2c:8c69 with SMTP id
 kk5-20020a17090b4a0500b001dc1a2c8c69mr9685274pjb.9.1651664440868; 
 Wed, 04 May 2022 04:40:40 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:40:40 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Wed,  4 May 2022 17:10:09 +0530
Message-Id: <20220504114021.33265-1-jagan@amarulasolutions.com>
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

Previous v1 can be available here [1].

The final bridge supports both the Exynos and i.MX8MM DSI devices.

On, summary this patch-set break the entire DSIM driver into
- platform specific glue code for platform ops, component_ops.
- common bridge driver which handle platform glue init and invoke.

Patch 0000: 	Samsung DSIM bridge

Patch 0001:	Common lookup code for OF-graph or child

Patch 0002: 	platform init flag via driver_data

Patch 0003/10:  bridge fixes, atomic API's

Patch 0011:	document fsl,imx8mm-mipi-dsim

Patch 0012:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interested, please have a look on this repo [2]

[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2 
[1] https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.184583-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (12):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Handle platform init via driver_data
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
  drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1847 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1724 +--------------
 include/drm/bridge/samsung-dsim.h             |   99 +
 8 files changed, 2032 insertions(+), 1661 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

