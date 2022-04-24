Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C461150D554
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 23:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF24210F310;
	Sun, 24 Apr 2022 21:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC310E6C5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 21:45:59 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B328D3E4;
 Sun, 24 Apr 2022 23:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650836758;
 bh=HP/4VVMe7mFL/ZoeHnc2effDXGYBRTFy5xqZKO3Noxk=;
 h=From:To:Cc:Subject:Date:From;
 b=CZ+Bq3srTB9S76kFFjiLp6aHP4izfMAuHI/ZfwFk3OgwBkpfG3K+jcK6IEuZuiOr/
 DQCSvSDV1L5Z55QkNeyiz9a6KwulX994s+TwG4OdBdoJCAjQ/OYf9tt3B0DOIFGwy+
 HXyZronuaVwR6OZ8jqNi/zKx20rv2Df5RTDjumIU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Drop file name from comment header blocks
Date: Mon, 25 Apr 2022 00:45:50 +0300
Message-Id: <20220424214550.19463-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comment blocks at the beginning of each file have a one-line
summary description of the file that includes the file name. While the
description is useful, the file name only creates opportunities for
mistakes (as seen in rcar_du_vsp.c) without any added value. Drop it.

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_cmm.c           | 2 +-
 drivers/gpu/drm/rcar-du/rcar_cmm.h           | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c       | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h       | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h    | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c      | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.h      | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c      | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h      | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h       | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h        | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c  | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.h  | 2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c          | 2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h          | 2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h     | 2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
index 382d53f8a22e..e2a67dda4658 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_cmm.c -- R-Car Display Unit Color Management Module
+ * R-Car Display Unit Color Management Module
  *
  * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
index b5f7ec6db04a..628072acc98b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_cmm.h -- R-Car Display Unit Color Management Module
+ * R-Car Display Unit Color Management Module
  *
  * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 23e1aedf8dc0..621bbccb95d4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_crtc.c  --  R-Car Display Unit CRTCs
+ * R-Car Display Unit CRTCs
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 66e8839db708..d0f38a8b3561 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_crtc.h  --  R-Car Display Unit CRTCs
+ * R-Car Display Unit CRTCs
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 1bc7325aa356..70d85610d720 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_drv.c  --  R-Car Display Unit DRM driver
+ * R-Car Display Unit DRM driver
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 83530721e373..bfad7775d9a1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_drv.h  --  R-Car Display Unit DRM driver
+ * R-Car Display Unit DRM driver
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 3977aaa1ab5a..bf76a60776bd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_encoder.c  --  R-Car Display Unit Encoder
+ * R-Car Display Unit Encoder
  *
  * Copyright (C) 2013-2014 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 73560563fb31..e5ec8fbb3979 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_encoder.h  --  R-Car Display Unit Encoder
+ * R-Car Display Unit Encoder
  *
  * Copyright (C) 2013-2014 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 8665a1dd2186..1fe8581577ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_group.c  --  R-Car Display Unit Channels Pair
+ * R-Car Display Unit Channels Pair
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index e9906609c635..55649ad86a10 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_group.c  --  R-Car Display Unit Planes and CRTCs Group
+ * R-Car Display Unit Planes and CRTCs Group
  *
  * Copyright (C) 2013-2014 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 190dbb7f15dd..166b2346d8c6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_kms.c  --  R-Car Display Unit Mode Setting
+ * R-Car Display Unit Mode Setting
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 789154e19535..f31afeeee05a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_kms.h  --  R-Car Display Unit Mode Setting
+ * R-Car Display Unit Mode Setting
  *
  * Copyright (C) 2013-2014 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5c1c7bb04f3f..f214a8b6cfd3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_plane.c  --  R-Car Display Unit Planes
+ * R-Car Display Unit Planes
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
index 81bbf207ad0e..f9893d7d6dfc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_plane.h  --  R-Car Display Unit Planes
+ * R-Car Display Unit Planes
  *
  * Copyright (C) 2013-2014 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index 1cdaa51eb9ac..c1bcb0e8b5b4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * rcar_du_regs.h  --  R-Car Display Unit Registers Definitions
+ * R-Car Display Unit Registers Definitions
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4a3e710eb684..6b535abd799a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
+ * R-Car Display Unit VSP-Based Compositor
  *
  * Copyright (C) 2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 9b4724159378..67630f0b6599 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
+ * R-Car Display Unit VSP-Based Compositor
  *
  * Copyright (C) 2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index c79d1259e49b..2f5f3557bd90 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * rcar_du_writeback.c  --  R-Car Display Unit Writeback Support
+ * R-Car Display Unit Writeback Support
  *
  * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.h b/drivers/gpu/drm/rcar-du/rcar_du_writeback.h
index fa87ebf8d21f..a71c9c08cafa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * rcar_du_writeback.h  --  R-Car Display Unit Writeback Support
+ * R-Car Display Unit Writeback Support
  *
  * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8dbfbbd3cad1..8d22ade69df1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * rcar_lvds.c  --  R-Car LVDS Encoder
+ * R-Car LVDS Encoder
  *
  * Copyright (C) 2013-2018 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
index eb7c6ef03b00..3097bf749bec 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * rcar_lvds.h  --  R-Car LVDS Encoder
+ * R-Car LVDS Encoder
  *
  * Copyright (C) 2013-2018 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
index 87149f2f8056..ab0406a27d33 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * rcar_lvds_regs.h  --  R-Car LVDS Interface Registers Definitions
+ * R-Car LVDS Interface Registers Definitions
  *
  * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 891bb956fd61..0e62dd14bf97 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * rcar_mipi_dsi.c  --  R-Car MIPI DSI Encoder
+ * R-Car MIPI DSI Encoder
  *
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
index 0e7a9274749f..2eaca54636f3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * rcar_mipi_dsi_regs.h  --  R-Car MIPI DSI Interface Registers Definitions
+ * R-Car MIPI DSI Interface Registers Definitions
  *
  * Copyright (C) 2020 Renesas Electronics Corporation
  */
-- 
Regards,

Laurent Pinchart

