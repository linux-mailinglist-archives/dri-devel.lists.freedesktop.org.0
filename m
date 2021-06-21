Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B133AE40E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452E789D8D;
	Mon, 21 Jun 2021 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DFD89D8D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:24:39 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id i34so7802396pgl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Mz90SrmvetiiKOz2FA2/q5WPVb/5Mateql9uC1osYI=;
 b=LH6roB4QN50Ss3fd6q+CBK16FfSLRV/++biPwO3AeQTv8PFz5YsC987Yl5PrPtbQUR
 grYaD4IXKWdJJOg4dF6BckzRXAb951oI2Olp611oMhF3JgfviD5I5Jhy/q+gsRLvIMqk
 koZVmpZYLZherETZSArj4lMgsAiX7fGYNfJ8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Mz90SrmvetiiKOz2FA2/q5WPVb/5Mateql9uC1osYI=;
 b=mr/vk6KJ5tW6RHsEunZz3XnxG5nqxLUAGQnX9PXZLJI1uj6vDrGnlBk5hZCHNyy2Rb
 j+FHLefCOTUwEVYXzYHlNDroIeovHG5m6srmh1PgEnRX0RhnUe+ro8UbLJqEpOozW3Ut
 ofPOE4mEMLTHlrh6efwq5u+JQ3xZA5EQrrdGSnQ4pw7urbgRUT2XK13PAzp371xq1Rgp
 JDunhcE+OHSRVkCccpN6u/XhJx+oFLsriI3NXdUZ9yxkAaHqBQkc9441EmWFXngv5h3D
 TMXIn9We+JOzucKc+JXZLUwas0LOpwtTmnnpcX2JSBEli/QeZAwvpnCG10JeCfkwDZIl
 X4qg==
X-Gm-Message-State: AOAM531cKR4KfGtp05F8rjZ8kZJgKIHRg6sdNNZGEVRRWgpFDPrpMkcF
 ijmqk87IDVawGyroa9etd8eDvg==
X-Google-Smtp-Source: ABdhPJxiCxvGt4Lvg95BHdbOmEwOZrpqM6XZznMkEdEE3H9U0aYNeyTH/9EQGYu7BduM/FJvQrX1Kg==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr22267854pgh.429.1624260278855; 
 Mon, 21 Jun 2021 00:24:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:24:38 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 0/9] arm64: imx8mm: Add MIPI DSI support
Date: Mon, 21 Jun 2021 12:54:15 +0530
Message-Id: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series support MIPI DSI on i.MX8MM.

It worked directly with existing mxsfb driver but the SEC DSIM
timings has to be validate and tested through all platforms, 
ie reason I'm sending it as RFC.

Tested on Engicam i.Core MX8M Mini SoM.

patch 1: dt-bindings for SEC MIPI DSIM

patch 2: SEC MIPI DSIM bridge driver

patch 3: dt-bindings for SEC DSIM DPHY

patch 4: SEC DSIM DPHY driver

patch 5: MIPI DPHY reset enable in blk-ctl

patch 6: display mix blk ctl node

patch 7: eLCDIF node

patch 8: MIPI DSI pipeline nodes

patch 9: Enable LVDS panel on EDIMM2.2

Note:
- all these patches on top of Peng Fan's blk-ctl driver.
- anyone interest, please have a look on this repo
  https://github.com/openedev/linux/commits/imx8mm

Any inputs?
Jagan.

Jagan Teki (9):
  dt-bindings: display: bridge: Add Samsung SEC MIPI DSIM bindings
  drm: bridge: Add Samsung SEC MIPI DSIM bridge driver
  dt-bindings: phy: Add SEC DSIM DPHY bindings
  phy: samsung: Add SEC DSIM DPHY driver
  soc: imx8mm: blk-ctl: Add MIPI DPHY reset enable
  arm64: dts: imx8mm: Add display mix blk ctl
  arm64: dts: imx8mm: Add eLCDIF node support
  arm64: dts: imx8mm: Add MIPI DSI pipeline
  arm64: dts: imx8mm-icore: Enable LVDS panel for EDIMM2.2

 .../display/bridge/samsung,sec-dsim.yaml      |  184 ++
 .../bindings/phy/samsung,sec-dsim-dphy.yaml   |   56 +
 .../freescale/imx8mm-icore-mx8mm-edimm2.2.dts |   90 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  104 ++
 drivers/gpu/drm/bridge/Kconfig                |   15 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/sec-dsim.c             | 1535 +++++++++++++++++
 drivers/phy/samsung/Kconfig                   |    9 +
 drivers/phy/samsung/Makefile                  |    1 +
 drivers/phy/samsung/phy-sec-dsim-dphy.c       |  236 +++
 drivers/soc/imx/blk-ctl-imx8mm.c              |    4 +
 include/dt-bindings/power/imx8mm-power.h      |    5 +-
 12 files changed, 2238 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
 create mode 100644 drivers/gpu/drm/bridge/sec-dsim.c
 create mode 100644 drivers/phy/samsung/phy-sec-dsim-dphy.c

-- 
2.25.1

