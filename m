Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C575565BDDA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69E10E3D4;
	Tue,  3 Jan 2023 10:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9E210E3CD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 10:20:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303AK5l7130193;
 Tue, 3 Jan 2023 04:20:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672741205;
 bh=3GQKbMmlwLTURi8g3PJtXSNB0nvr/fid1qs+DsbMEY8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xbb4sSBLrDeNhAs/oDd6yOA6ungEuPasyn8BgTnAwSL6JF0FqVkdkdru4uYcPAZ6t
 4RLD/NbTobWvpdRAUocp35kmZvVnGnmxEXVFzS9kWAZ546NZFNfDM0reFGp8YyPJOU
 KReSoodju6pCwCU+iE341cPOyOclq5xSBIHTiw/8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303AK5K7036402
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Jan 2023 04:20:05 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 04:20:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 04:20:05 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303AK3NB004362;
 Tue, 3 Jan 2023 04:20:04 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v11 4/5] drm/bridge: cdns-dsi: Create a header file
Date: Tue, 3 Jan 2023 15:49:50 +0530
Message-ID: <20230103101951.10963-5-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103101951.10963-1-r-ravikumar@ti.com>
References: <20230103101951.10963-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a header file for cdns dsi and move structure definations to
prepare for adding j721e wrapper support

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 48 +-------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 64 +++++++++++++++++++
 2 files changed, 66 insertions(+), 46 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 20bece84ff8c..058349bfeb67 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -6,10 +6,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_mipi_dsi.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <video/mipi_display.h>
 
@@ -23,9 +20,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include "cdns-dsi-core.h"
+
 #define IP_CONF				0x0
 #define SP_HS_FIFO_DEPTH(x)		(((x) & GENMASK(30, 26)) >> 26)
 #define SP_LP_FIFO_DEPTH(x)		(((x) & GENMASK(25, 21)) >> 21)
@@ -424,48 +422,6 @@
 #define DSI_NULL_FRAME_OVERHEAD		6
 #define DSI_EOT_PKT_SIZE		4
 
-struct cdns_dsi_output {
-	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
-	struct drm_bridge *bridge;
-	union phy_configure_opts phy_opts;
-};
-
-enum cdns_dsi_input_id {
-	CDNS_SDI_INPUT,
-	CDNS_DPI_INPUT,
-	CDNS_DSC_INPUT,
-};
-
-struct cdns_dsi_cfg {
-	unsigned int hfp;
-	unsigned int hsa;
-	unsigned int hbp;
-	unsigned int hact;
-	unsigned int htotal;
-};
-
-struct cdns_dsi_input {
-	enum cdns_dsi_input_id id;
-	struct drm_bridge bridge;
-};
-
-struct cdns_dsi {
-	struct mipi_dsi_host base;
-	void __iomem *regs;
-	struct cdns_dsi_input input;
-	struct cdns_dsi_output output;
-	unsigned int direct_cmd_fifo_depth;
-	unsigned int rx_fifo_depth;
-	struct completion direct_cmd_comp;
-	struct clk *dsi_p_clk;
-	struct reset_control *dsi_p_rst;
-	struct clk *dsi_sys_clk;
-	bool link_initialized;
-	bool phy_initialized;
-	struct phy *dphy;
-};
-
 static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
 {
 	return container_of(input, struct cdns_dsi, input);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
new file mode 100644
index 000000000000..d5bb5caf77b1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright: 2017 Cadence Design Systems, Inc.
+ *
+ * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ */
+
+#ifndef __CDNS_DSI_H__
+#define __CDNS_DSI_H__
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/phy/phy.h>
+
+struct clk;
+struct reset_control;
+
+struct cdns_dsi_output {
+	struct mipi_dsi_device *dev;
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+	union phy_configure_opts phy_opts;
+};
+
+enum cdns_dsi_input_id {
+	CDNS_SDI_INPUT,
+	CDNS_DPI_INPUT,
+	CDNS_DSC_INPUT,
+};
+
+struct cdns_dsi_cfg {
+	unsigned int hfp;
+	unsigned int hsa;
+	unsigned int hbp;
+	unsigned int hact;
+	unsigned int htotal;
+};
+
+struct cdns_dsi_input {
+	enum cdns_dsi_input_id id;
+	struct drm_bridge bridge;
+};
+
+struct cdns_dsi {
+	struct mipi_dsi_host base;
+	void __iomem *regs;
+	struct cdns_dsi_input input;
+	struct cdns_dsi_output output;
+	unsigned int direct_cmd_fifo_depth;
+	unsigned int rx_fifo_depth;
+	struct completion direct_cmd_comp;
+	struct clk *dsi_p_clk;
+	struct reset_control *dsi_p_rst;
+	struct clk *dsi_sys_clk;
+	bool link_initialized;
+	bool phy_initialized;
+	struct phy *dphy;
+};
+
+#endif /* !__CDNS_DSI_H__ */
-- 
2.39.0

