Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C83BAC32
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C70789C69;
	Sun,  4 Jul 2021 09:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E5289C69
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso9486642pjz.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTKmWZ3CVp6OOAYCiyLaCDGps1R2HQjeuLrAdsNm2oA=;
 b=UDC9ZLWAnBD/te5tkNc4neJrdsL39umnb6TeP5DVxcgX6VP1wc9JP051M8hMz8GF9C
 3PMZSFE7eMEduQqdDhaE6yZAMNT1kdQyQ7Xoidg6iu1lW8ZOQT3t9Rnqqo6q2foTQLii
 l/wW9qGcpF8BxYeozkF5e+ysR2VEEtjDL/K4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTKmWZ3CVp6OOAYCiyLaCDGps1R2HQjeuLrAdsNm2oA=;
 b=cPaXgKtfsLh3zJOaVAvZ5YfDCWWdlI4q1APGCY9VI0U8cw7B1TO4qOO0mtk6zDm6FY
 d8juY70WdGug0d4dsTlrkTJNCSrhpiL/rM/8RoJRqeqyP+lZo6vTUSqBk3vA7I/kucYD
 Wbz1H0mab3udNWJhbL0YidX7QYNEIXEToArY+5mKhoMgNZrWMSoPGmDGtC1Mi7VgsVQ+
 Hdpbn80GL5k3VA3F6znt36r/NuZE4FzDfL4fMFG8DylizxeAA2cJY1rX7mu/OmY9V+lF
 zX6VWR+Dq/5J2lZw/wB8s2Q+PSUpVahV2kRyrXl+9boagYxIEoepQj0rmwMJynMUvkBW
 er4A==
X-Gm-Message-State: AOAM5325n/JfyEZLHzVYZdWqFEjnNBJ3O2rpKGvs/gS8YaVEUQQ4K/s5
 m7mv5bk57+2/Kr2UJV3BZc7/kw==
X-Google-Smtp-Source: ABdhPJx7D44IjbUDdiCn9uNITwKa1N6d+4SXQCDPMDnwm/1x3fHOq9ypbbk1oXFGD/T4d0lggaK8jA==
X-Received: by 2002:a17:90a:b316:: with SMTP id
 d22mr8682362pjr.233.1625389448833; 
 Sun, 04 Jul 2021 02:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:08 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
Date: Sun,  4 Jul 2021 14:32:13 +0530
Message-Id: <20210704090230.26489-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8MM DSI devices.

Right now bridge offers two sets of implementations.

A. With component_ops and exynos specific code exclusively for
   exynos dsi drivers and it's legacy bindings.

B. Without componenet_ops for newly implemented bridges and its
   users like i.MX8MM.

The future plan is to fix the implementation A) by dropping
component_ops and fixing exynos specific code in order to make
the bridge more mature to use and the same is mentioned in
drivers TODO.

Patch 0001 - 0006: Bridge conversion
Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interest, please have a look on this repo
https://github.com/openedev/linux/tree/070421-imx8mm-dsim

Would appreciate anyone from the exynos team to test it on
the exynos platform?

Any inputs?
Jagan.

Jagan Teki (17):
  drm/exynos: dsi: Convert to bridge driver
  drm/exynos: dsi: Handle drm_device for bridge
  drm/exynos: dsi: Use the drm_panel_bridge API
  drm/exynos: dsi: Create bridge connector for encoder
  drm/exynos: dsi: Get the mode from bridge
  drm/exynos: dsi: Handle exynos specifics via driver_data
  drm: bridge: Move exynos_drm_dsi into bridges
  dt-bindings: display: bridge: Add Samsung MIPI DSIM bridge
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Update the of_node for port(s)
  drm: bridge: samsung-dsim: Find the possible DSI devices
  dt-bindings: display: bridge: samsung,mipi-dsim: Add i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support
  drm: bridge: samsung-dsim: Add input_bus_flags
  drm: bridge: samsung-dsim: Move DSI init in bridge enable
  drm: bridge: samsung-dsim: Fix PLL_P offset
  drm: bridge: samsung-dsim: Add bridge mode_fixup

 .../display/bridge/samsung,mipi-dsim.yaml     | 360 +++++++++
 .../bindings/display/exynos/exynos_dsim.txt   |  90 ---
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/bridge/Kconfig                |  15 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../samsung-dsim.c}                           | 758 ++++++++++--------
 drivers/gpu/drm/exynos/Kconfig                |   9 -
 drivers/gpu/drm/exynos/Makefile               |   1 -
 8 files changed, 795 insertions(+), 451 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
 rename drivers/gpu/drm/{exynos/exynos_drm_dsi.c => bridge/samsung-dsim.c} (69%)

-- 
2.25.1

