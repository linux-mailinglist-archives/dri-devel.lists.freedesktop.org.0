Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06531BCF88F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BCF10E0E8;
	Sat, 11 Oct 2025 17:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v17tz+tJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fOf3IvO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BC310E0E8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:02:53 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVKm1Lvnz9t8r;
 Sat, 11 Oct 2025 19:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mL1+Jl7MA/4qoWAJdJa7Mwpah/QL/KBofTWVwpT9vcQ=;
 b=v17tz+tJ4Qd2MFf5nMyiML7pzfojjVnwMlVGf8YZXLnmCNdiV6kKloKsx/Cy3k1xpDbJlO
 2kAMjXrPo02ZKS65uG+KuIMey6tCA20VVnbSlE/su/6H1fbq2ReJ9lvhwhmgBNlVN5Aov2
 fE762fqdNpdt0xbjaz1qFqFA2DpdIigssugTTtE31oqZeiRu1NUeoVgxWNxHPUXVKqcAAD
 WfUk2vebvtAMOejZ11+tREEcXN9LZjz5DNT5Ze9hi80ueP6iZ+tYZTrqeeP4rwnyi9XKdG
 CttMdmpYKRkTJUFx+FHa7kN61mrqrc8R1BkpviVISC9mavHy14mnHNndiWmnVw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mL1+Jl7MA/4qoWAJdJa7Mwpah/QL/KBofTWVwpT9vcQ=;
 b=fOf3IvO2feDe+e8hnSxNLxlH3hILMtTs5FU4j9NwAOvSzaD5bmd/zkR7MkHSicKr1CASif
 v9kJwCIxGljdV0I/HpqKoYNzIGpOluun+FOmmIAarOyRXQEv3VSNaCLW6TEUhTw/5sJQ30
 1LsCwmnjVk50O6gp4Oyogd+gjT96SrGKmlkN7070/Zs0iQf7vIsC+GHvD3fxpEVXrb/5F7
 vNUN7bsQVKNT/iPawQdzUWBxHG475I7k0IcwpUP+uleVATOk+xs8f3+idJHY+AEzMKny/k
 ziCzErMXp/BfSGjDh4g/X64PTrfH8PyRP3OrGw/qDIe9TwUyFNJ/6xlfBWxRiA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Date: Sat, 11 Oct 2025 18:51:15 +0200
Message-ID: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x47qkkhta4xd3ewnu1awe5y7riujfwoj
X-MBO-RS-ID: 238e2e9e1fd66030e55
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This large series adds support for the i.MX95 display pipeline, including
DPU, DSI and LVDS support. Most of the components extend existin drivers,
DPU is added into DC driver, DSI into iMX93 DSI driver, LVDS into iMX8MP
LDB. Pixel link and pixel interleaver drivers are reworked to work as two
independent channels, since there seems to be no dependency between their
two channels. The i.MX95 DTSI changes are also included.

Since the DPU chapter is missing from the i.MX95 RM, this is based on the
NXP downstream kernel fork code and there might be issues.

Majority of this series are DPU patches on top of the DC driver, I tried
to keep them separate and easy to review. Later part adds LVDS and DSI
support, this can be split into separate series.

Both DSI-to-HDMI path using LT8912 bridge and LVDS single-lane with Logic
Techno LT170410-2WHC panel were tested on Toradex i.MX95 Verdin EVK v1.2 .

Liu Ying (2):
  drm/bridge: imx: Add NXP i.MX95 pixel interleaver support
  drm/bridge: imx: Add NXP i.MX95 pixel link support

Marek Vasut (36):
  dt-bindings: display: imx: Document i.MX95 Display Controller
    DomainBlend
  drm/imx: Add i.MX95 Display Controller DomainBlend
  dt-bindings: display: imx: Document i.MX95 Display Controller
    processing units
  drm/imx: dc: Use bulk clock
  drm/imx: dc: Rework dc_subdev_get_id() to drop ARRAY_SIZE() use
  drm/imx: dc: Rename i.MX8QXP specific Link IDs
  drm/imx: dc: cf: Pass struct dc_subdev_info via OF match data
  drm/imx: dc: de: Pass struct dc_de_subdev_match_data via OF match data
  drm/imx: dc: ed: Rework dc_ed_pec_src_sel() to drop ARRAY_SIZE() use
  drm/imx: dc: ed: Pass struct dc_ed_subdev_match_data via OF match data
  drm/imx: dc: fg: Parametrize register access
  drm/imx: dc: ed: Pass struct dc_fg_subdev_match_data via OF match data
  drm/imx: dc: fu: Describe remaining register offsets
  drm/imx: dc: fu: Inline FRAC_OFFSET into FetchLayer and FetchWrap
  drm/imx: dc: fu: Pass struct dc_fu_subdev_match_data via OF match data
  drm/imx: dc: lb: Pass struct dc_lb_subdev_match_data via OF match data
  drm/imx: dc: tc: Pass struct dc_tc_subdev_match_data via OF match data
  drm/imx: dc: ic: Pass struct dc_ic_subdev_match_data via OF match data
  drm/imx: dc: ic: Use DT node as interrupt controller name
  drm/imx: dc: Configure display CSR clock feed select
  drm/imx: dc: crtc: Do not check disabled CRTCs
  drm/imx: dc: Keep FU unit running on i.MX95
  drm/imx: dc: Add OF match data for i.MX95
  drm/imx: Add more RGB swizzling options
  dt-bindings: display: bridge: Document NXP i.MX95 pixel interleaver
    support
  dt-bindings: display: bridge: Document NXP i.MX95 pixel link support
  dt-bindings: display: bridge: Document Freescale i.MX95 MIPI DSI
  drm/bridge: imx93-mipi-dsi: Add i.MX95 PLL initialization
  dt-bindings: clock: Split support for i.MX95 LVDS CSR
  dt-bindings: display: bridge: Document i.MX95 LVDS display bridge
    binding
  dt-bindings: display: bridge: ldb: Add an i.MX95 entry
  drm/bridge: fsl-ldb: Parse register offsets from DT
  drm/bridge: fsl-ldb: Add i.MX95 support
  dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support
  dt-bindings: clock: support i.MX95 Display Stream CSR module
  arm64: dts: imx95: Describe display pipeline

Sandor Yu (1):
  drm: bridge: imx: Add i.MX95 LVDS Display Bridge (LDB) driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml     |   1 -
 .../clock/nxp,imx95-lvds-blk-ctl.yaml         |  80 ++
 .../display/bridge/fsl,imx93-mipi-dsi.yaml    |  48 +-
 .../display/bridge/fsl,imx95-lvds.yaml        | 140 ++++
 .../bridge/fsl,imx95-pixel-interleaver.yaml   |  85 +++
 .../display/bridge/fsl,imx95-pixel-link.yaml  | 101 +++
 .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |   4 +-
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    |  45 +-
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |   4 +-
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml |   1 +
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  13 +-
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |   4 +-
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      |  52 +-
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |   5 +-
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  |  53 +-
 .../display/imx/fsl,imx95-dc-domainblend.yaml |  32 +
 .../imx/nxp,imx95-display-stream-csr.yaml     |  41 +
 .../interrupt-controller/fsl,irqsteer.yaml    |   2 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 710 ++++++++++++++++++
 drivers/gpu/drm/bridge/fsl-ldb.c              |  65 +-
 drivers/gpu/drm/bridge/imx/Kconfig            |  28 +
 drivers/gpu/drm/bridge/imx/Makefile           |   3 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h   |   2 +
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 612 ++++++++++++++-
 drivers/gpu/drm/bridge/imx/imx95-ldb.c        | 470 ++++++++++++
 .../drm/bridge/imx/imx95-pixel-interleaver.c  | 217 ++++++
 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c | 184 +++++
 drivers/gpu/drm/imx/dc/Kconfig                |   4 +-
 drivers/gpu/drm/imx/dc/Makefile               |   2 +-
 drivers/gpu/drm/imx/dc/dc-cf.c                |  41 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c              |   6 +
 drivers/gpu/drm/imx/dc/dc-db.c                | 227 ++++++
 drivers/gpu/drm/imx/dc/dc-de.c                |  83 +-
 drivers/gpu/drm/imx/dc/dc-de.h                |  14 +
 drivers/gpu/drm/imx/dc/dc-drv.c               |  45 +-
 drivers/gpu/drm/imx/dc/dc-drv.h               |  11 +-
 drivers/gpu/drm/imx/dc/dc-ed.c                |  67 +-
 drivers/gpu/drm/imx/dc/dc-fg.c                | 157 ++--
 drivers/gpu/drm/imx/dc/dc-fl.c                | 145 +++-
 drivers/gpu/drm/imx/dc/dc-fu.c                |  46 +-
 drivers/gpu/drm/imx/dc/dc-fu.h                |   7 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                |  54 +-
 drivers/gpu/drm/imx/dc/dc-ic.c                | 192 +++--
 drivers/gpu/drm/imx/dc/dc-kms.h               |   6 +
 drivers/gpu/drm/imx/dc/dc-lb.c                | 109 ++-
 drivers/gpu/drm/imx/dc/dc-pe.c                |  12 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                |  41 +-
 drivers/gpu/drm/imx/dc/dc-plane.c             |  18 +-
 drivers/gpu/drm/imx/dc/dc-tc.c                |  55 +-
 50 files changed, 4000 insertions(+), 346 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-lvds-blk-ctl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-interleaver.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-db.c

---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org

-- 
2.51.0

