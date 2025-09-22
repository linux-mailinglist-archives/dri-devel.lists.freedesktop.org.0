Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0670B904FC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA20010E41F;
	Mon, 22 Sep 2025 11:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5C110E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:11:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.trumtrar.info)
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1v0eRk-0002HM-ET; Mon, 22 Sep 2025 13:11:04 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/5] arm64: dts: imx8mp-skov: add new 10" variant
Date: Mon, 22 Sep 2025 13:10:51 +0200
Message-Id: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-0-abbb759cf8ef@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsu0WgC/52NQQ6DIBBFr2JYdxogWrUr79G4sDLotBEIILEx3
 r3UI3T18/7ivZ0F9ISB3YudeUwUyJoM8lKwcR7MhEAqM5NcVryRAtINRA3ROhqBlq1ZHIS3TaB
 igNca7TrOIDiZPC3qVg9DXVWiZFnoPGraztijzzxTiNZ/znYSv/evTBLA4Vm2EnXDayVk59BMa
 /TW0HZVyPrjOL4D5acR6QAAAA==
X-Change-ID: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 10" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- add wider compat "eeti,exc80h84" after "eeti,exc81w32" to pass CHECK_DTB 
- add Acked-by and Reviewed-By
- Link to v1: https://lore.kernel.org/r/20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de

---
Steffen Trumtrar (5):
      dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      drm/panel: simple: add JuTouch JT101TM023
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 10" panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt101tm023.dts        | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++
 6 files changed, 120 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

