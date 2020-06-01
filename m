Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEF1E9E3C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652216E04A;
	Mon,  1 Jun 2020 06:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C36E05C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:29:44 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 57FE22004CA;
 Mon,  1 Jun 2020 08:23:16 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 90AAA200480;
 Mon,  1 Jun 2020 08:23:10 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 60F9D40280;
 Mon,  1 Jun 2020 14:23:03 +0800 (SGT)
From: sandor.yu@nxp.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, heiko@sntech.de, hjc@rock-chips.com,
 Sandor.yu@nxp.com, dkos@cadence.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Initial support for Cadence MHDP(HDMI/DP)
Date: Mon,  1 Jun 2020 14:17:30 +0800
Message-Id: <cover.1590982881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

The patch set initial support for Cadence MHDP(HDMI/DP) drm bridge
driver and iMX8MQ HDMI/DP.

The first patch drm/rockchip: prepare common code for cdns and rk dpi/dp driver
is from the link https://patchwork.kernel.org/patch/10788309/
that still in reviewing.

Files in drm/bridge/cadence compose with serveral parties,
drm bridge driver, Audio and API functions.
 -cdns-dp-core.c: Displayport bridge driver
 -cdns-hdmi-core.c: HDMI bridge driver 
 -cdns-mhdp-audio.c: DP/HDMI Audio
 -cdns-mhdp-common.c: MHDP common API functions
 -cdns-mhdp-dp.c: MHDP DP API functions
 -cdns-mhdp-hdmi.c: MHDP HDMI API functions

Sandor Yu (7):
  drm/rockchip: prepare common code for cdns and rk dpi/dp driver
  drm: bridge: cadence: Create cadence fold
  drm: bridge: cadence: initial support for MHDP DP bridge driver
  drm: imx: mhdp: initial support for i.MX8MQ MHDP Displayport
  drm: bridge: cadence: Initial support for MHDP HDMI bridge driver
  drm: imx: mhdp: Initial support for i.MX8MQ MHDP HDMI
  dt-bindings: display: Document Cadence MHDP HDMI/DP bindings

 .../bindings/display/bridge/cdns,mhdp.yaml    |  46 +
 .../devicetree/bindings/display/imx/mhdp.yaml |  59 ++
 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |  15 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   5 +
 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c | 530 ++++++++++
 .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 600 +++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-audio.c  | 298 ++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.c | 682 +++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  40 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c | 206 ++++
 .../gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c   | 330 ++++++
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/mhdp/Kconfig              |   9 +
 drivers/gpu/drm/imx/mhdp/Makefile             |   4 +
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-dp-phy.c   | 390 +++++++
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-hdmi-phy.c | 588 +++++++++++
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c   | 142 +++
 drivers/gpu/drm/imx/mhdp/cdns-mhdp-phy.h      | 148 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 247 ++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  44 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.c         | 960 ------------------
 .../drm/bridge/cdns-mhdp.h                    | 257 ++++-
 27 files changed, 4464 insertions(+), 1144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/mhdp.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/cadence/Makefile
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-hdmi.c
 create mode 100644 drivers/gpu/drm/imx/mhdp/Kconfig
 create mode 100644 drivers/gpu/drm/imx/mhdp/Makefile
 create mode 100644 drivers/gpu/drm/imx/mhdp/cdns-mhdp-dp-phy.c
 create mode 100644 drivers/gpu/drm/imx/mhdp/cdns-mhdp-hdmi-phy.c
 create mode 100644 drivers/gpu/drm/imx/mhdp/cdns-mhdp-imxdrv.c
 create mode 100644 drivers/gpu/drm/imx/mhdp/cdns-mhdp-phy.h
 delete mode 100644 drivers/gpu/drm/rockchip/cdn-dp-reg.c
 rename drivers/gpu/drm/rockchip/cdn-dp-reg.h => include/drm/bridge/cdns-mhdp.h (64%)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
