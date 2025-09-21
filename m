Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210BB8D772
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 10:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDF110E307;
	Sun, 21 Sep 2025 08:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="bJsuA6Mp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D6A10E307
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 08:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758443749; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kZzxXIqCUjH7/iwMEFCMr8ulqFqapCbhRM5CtQ6M4K10QvXxWmFthHEkzqL43vWxEj42L9yBoj7LNg17AL+Sj2u7HojhoVA7dj72OEqce3asIV1WubYno5yfz5RXQow4kDNuFsFAukrXxKijGVBIE5HLY5SLuXjdPosH9zUYGLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758443749;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZQMW3pDG5WDodQGYeG70/5D1wcY//Br6I7ApUTIn31c=; 
 b=jKLg4iplQhStR5g5crc+Tb6XOVTwifl+fpFaQ3dMreWh3TJG4E7t61OCpOFjopMeov1sDlv+H9W/Jn8a/7senawdO0LUWlwRk7Ia8v//6XPhGvqCgmBGHfRTK73RcHWvZKO4FxB2EUFOhBxVlxe5YuQjNrqLKfnehHrGRAhwGZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443748; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZQMW3pDG5WDodQGYeG70/5D1wcY//Br6I7ApUTIn31c=;
 b=bJsuA6MpOHlhryLBeKEsg3O6ffmN+xL1wF6EeJ/FJbjDvtAXLejOkQXNX8wNT7tT
 x+BGuB7S9szntmsTLnDU1hXuioX55QmV7gvb2TuOlINYOo29udvXpZbvl5acDs9pk7K
 QMrXiACk2+xag9ix+XQfucc5BJDVdt5difTzAIej3Wyd8oJGJ/NfC5Wk7KHPHzYMoWn
 oD+tQZuwAb6vEXSuzXgudQW+i+ZNUgISWj6s4lTnQ3ZYIXVPBDlR4RPZ2gwWC4LK5rE
 0fymylMpetf1vmqGFTSJdIJ1LnCxeR2wFeBNwa6u8Ga2FIDDK1KwW4J6mOTBa3AOHX3
 +yi7m1dFaQ==
Received: by mx.zohomail.com with SMTPS id 1758443747174375.15260920239746;
 Sun, 21 Sep 2025 01:35:47 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 3/8] drm: verisilicon: add a driver for Verisilicon display
 controllers
Date: Sun, 21 Sep 2025 16:34:41 +0800
Message-ID: <20250921083446.790374-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This is a from-scratch driver targeting Verisilicon DC-series display
controllers, which feature self-identification functionality like their
GC-series GPUs.

Only DC8200 is being supported now, and only the main framebuffer is set
up (as the DRM primary plane). Support for more DC models and more
features is my further targets.

As the display controller is delivered to SoC vendors as a whole part,
this driver does not use component framework and extra bridges inside a
SoC is expected to be implemented as dedicated bridges (this driver
properly supports bridge chaining).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Changes in v2:
- Changed some Control flows according to previous reviews.
- Added missing of_node_put when checking of endpoints for output type.
- Switched all userspace-visible modeset objects to be managed by drmm
  instead of devm.
- Utilize devm_drm_bridge_alloc() in internal bridge.
- Prevented the usage of simple encoder helpers by passing a NULL funcs pointer.
- Let devm enable clocks when getting them.
- Removed explicit `.cache_type = REGCACHE_NONE` in regmap config.
- Fixed a debug print using a variable before initialization.
- Fixed a wrong index when using bulk to handle resets.
- Added missing configuration for DPI format (currently fixed RGB888).

 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/verisilicon/Kconfig           |  15 +
 drivers/gpu/drm/verisilicon/Makefile          |   5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
 drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
 drivers/gpu/drm/verisilicon/vs_dc.c           | 205 +++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
 drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 157 +++++++++
 .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
 21 files changed, 1789 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c0..33601485ecdba 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
 
 source "drivers/gpu/drm/imagination/Kconfig"
 
+source "drivers/gpu/drm/verisilicon/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86ac..32ed4cf9df1bd 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -231,6 +231,7 @@ obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
+obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon/
 
 # Ensure drm headers are self-contained and pass kernel-doc
 hdrtest-files := \
diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
new file mode 100644
index 0000000000000..0235577c72824
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_VERISILICON_DC
+	tristate "DRM Support for Verisilicon DC-series display controllers"
+	depends on DRM && COMMON_CLK
+	depends on RISCV || COMPILER_TEST
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_DMA_HELPER
+	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select REGMAP_MMIO
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you have a SoC with Verisilicon DC-series
+	  display controllers. If M is selected, the module will be called
+	  verisilicon-dc.
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
new file mode 100644
index 0000000000000..fd8d805fbcde1
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
+
+obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
new file mode 100644
index 0000000000000..9696e574bcc7c
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <uapi/linux/media-bus-format.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "vs_bridge.h"
+#include "vs_bridge_regs.h"
+#include "vs_crtc.h"
+#include "vs_dc.h"
+
+static int vs_bridge_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+
+	return drm_bridge_attach(encoder, vbridge->next,
+				 bridge, flags);
+}
+
+struct vsdc_dp_format {
+	u32 linux_fmt;
+	bool is_yuv;
+	u32 vsdc_fmt;
+};
+
+static struct vsdc_dp_format vsdc_dp_supported_fmts[] = {
+	/* default to RGB888 */
+	{ MEDIA_BUS_FMT_FIXED, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
+	{ MEDIA_BUS_FMT_RGB888_1X24, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
+	{ MEDIA_BUS_FMT_RGB565_1X16, false, VSDC_DISP_DP_CONFIG_FMT_RGB565 },
+	{ MEDIA_BUS_FMT_RGB666_1X18, false, VSDC_DISP_DP_CONFIG_FMT_RGB666 },
+	{ MEDIA_BUS_FMT_RGB101010_1X30,
+	  false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
+	{ MEDIA_BUS_FMT_UYVY10_1X20, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
+	{ MEDIA_BUS_FMT_YUV8_1X24, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
+	{ MEDIA_BUS_FMT_YUV10_1X30, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
+	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
+	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30,
+	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
+};
+
+static u32 *vs_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+	u32 *output_fmts;
+	unsigned int i;
+
+	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI)
+		*num_output_fmts = 2;
+	else
+		*num_output_fmts = ARRAY_SIZE(vsdc_dp_supported_fmts);
+
+	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
+			      GFP_KERNEL);
+	if (!output_fmts)
+		return NULL;
+
+	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI) {
+		/* TODO: support more DPI output formats */
+		output_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		output_fmts[1] = MEDIA_BUS_FMT_FIXED;
+	} else {
+		for (i = 0; i < *num_output_fmts; i++)
+			output_fmts[i] = vsdc_dp_supported_fmts[i].linux_fmt;
+	}
+
+	return output_fmts;
+}
+
+static bool vs_bridge_out_dp_fmt_supported(u32 out_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++)
+		if (vsdc_dp_supported_fmts[i].linux_fmt == out_fmt)
+			return true;
+
+	return false;
+}
+
+static u32 *vs_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+
+	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
+	    !vs_bridge_out_dp_fmt_supported(output_fmt)) {
+		*num_input_fmts = 0;
+		return NULL;
+	}
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							  crtc_state,
+							  conn_state,
+							  output_fmt,
+							  num_input_fmts);
+}
+
+static int vs_bridge_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+
+	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
+	    !vs_bridge_out_dp_fmt_supported(bridge_state->output_bus_cfg.format))
+		return -EINVAL;
+
+	vbridge->output_bus_fmt = bridge_state->output_bus_cfg.format;
+
+	return 0;
+}
+
+static void vs_bridge_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+	struct drm_bridge_state *br_state = drm_atomic_get_bridge_state(state,
+									bridge);
+	struct vs_crtc *crtc = vbridge->crtc;
+	struct vs_dc *dc = crtc->dc;
+	unsigned int output = crtc->id;
+	u32 dp_fmt;
+	unsigned int i;
+
+	DRM_DEBUG_DRIVER("Enabling output %u\n", output);
+
+	switch (vbridge->intf) {
+	case VSDC_OUTPUT_INTERFACE_DPI:
+		regmap_clear_bits(dc->regs, VSDC_DISP_DP_CONFIG(output),
+				  VSDC_DISP_DP_CONFIG_DP_EN);
+		regmap_write(dc->regs, VSDC_DISP_DPI_CONFIG(output),
+			     VSDC_DISP_DPI_CONFIG_FMT_RGB888);
+		break;
+	case VSDC_OUTPUT_INTERFACE_DP:
+		for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++) {
+			if (vsdc_dp_supported_fmts[i].linux_fmt ==
+			    vbridge->output_bus_fmt)
+				break;
+		}
+		if (WARN_ON_ONCE(i == ARRAY_SIZE(vsdc_dp_supported_fmts)))
+			return;
+		dp_fmt = vsdc_dp_supported_fmts[i].vsdc_fmt;
+		dp_fmt |= VSDC_DISP_DP_CONFIG_DP_EN;
+		regmap_write(dc->regs, VSDC_DISP_DP_CONFIG(output), dp_fmt);
+		regmap_assign_bits(dc->regs,
+				   VSDC_DISP_PANEL_CONFIG(output),
+				   VSDC_DISP_PANEL_CONFIG_YUV,
+				   vsdc_dp_supported_fmts[i].is_yuv);
+		break;
+	}
+
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			  VSDC_DISP_PANEL_CONFIG_DAT_POL);
+	regmap_assign_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			   VSDC_DISP_PANEL_CONFIG_DE_POL,
+			   br_state->output_bus_cfg.flags &
+			   DRM_BUS_FLAG_DE_LOW);
+	regmap_assign_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			   VSDC_DISP_PANEL_CONFIG_CLK_POL,
+			   br_state->output_bus_cfg.flags &
+			   DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			VSDC_DISP_PANEL_CONFIG_DE_EN |
+			VSDC_DISP_PANEL_CONFIG_DAT_EN |
+			VSDC_DISP_PANEL_CONFIG_CLK_EN);
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			VSDC_DISP_PANEL_CONFIG_RUNNING);
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
+			VSDC_DISP_PANEL_START_RUNNING(output));
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
+{
+	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
+	struct vs_crtc *crtc = vbridge->crtc;
+	struct vs_dc *dc = crtc->dc;
+	unsigned int output = crtc->id;
+
+	DRM_DEBUG_DRIVER("Disabling output %u\n", output);
+
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
+			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
+			  VSDC_DISP_PANEL_START_RUNNING(output));
+	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
+			  VSDC_DISP_PANEL_CONFIG_RUNNING);
+
+	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
+			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
+}
+
+static const struct drm_bridge_funcs vs_bridge_funcs = {
+	.attach = vs_bridge_attach,
+	.atomic_enable = vs_bridge_atomic_enable,
+	.atomic_disable = vs_bridge_atomic_disable,
+	.atomic_check = vs_bridge_atomic_check,
+	.atomic_get_input_bus_fmts = vs_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts = vs_bridge_atomic_get_output_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static int vs_bridge_detect_output_interface(struct device_node *of_node,
+					     unsigned int output)
+{
+	int ret;
+	struct device_node *remote;
+
+	remote = of_graph_get_remote_node(of_node, output,
+					  VSDC_OUTPUT_INTERFACE_DPI);
+	if (remote) {
+		ret = VSDC_OUTPUT_INTERFACE_DPI;
+	} else {
+		remote = of_graph_get_remote_node(of_node, output,
+						  VSDC_OUTPUT_INTERFACE_DP);
+		if (remote)
+			ret = VSDC_OUTPUT_INTERFACE_DP;
+		else
+			ret = -ENODEV;
+	}
+
+	if (remote)
+		of_node_put(remote);
+
+	return ret;
+}
+
+struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
+				 struct vs_crtc *crtc)
+{
+	unsigned int output = crtc->id;
+	struct vs_bridge *bridge;
+	struct drm_bridge *next;
+	enum vs_bridge_output_interface intf;
+	int ret, enctype;
+
+	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
+						 output);
+	if (intf == -ENODEV) {
+		dev_info(drm_dev->dev, "Skipping output %u\n", output);
+		return NULL;
+	}
+
+	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
+				      output, intf);
+	if (IS_ERR(next)) {
+		ret = PTR_ERR(next);
+		dev_err_probe(drm_dev->dev, ret,
+			      "Cannot get downstream bridge of output %u\n",
+			      output);
+		return ERR_PTR(ret);
+	}
+
+	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
+				       &vs_bridge_funcs);
+	if (!bridge)
+		return ERR_PTR(-ENOMEM);
+
+	bridge->crtc = crtc;
+	bridge->intf = intf;
+	bridge->next = next;
+
+	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
+		enctype = DRM_MODE_ENCODER_DPI;
+	else
+		enctype = DRM_MODE_ENCODER_NONE;
+
+	bridge->enc = drmm_plain_encoder_alloc(drm_dev, NULL, enctype, NULL);
+	if (IS_ERR(bridge->enc)) {
+		dev_err(drm_dev->dev,
+			"Cannot initialize encoder for output %u\n", output);
+		ret = PTR_ERR(bridge->enc);
+		return ERR_PTR(ret);
+	}
+
+	bridge->enc->possible_crtcs = drm_crtc_mask(&crtc->base);
+
+	ret = drm_bridge_attach(bridge->enc, &bridge->base, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(drm_dev->dev,
+			"Cannot attach bridge for output %u\n", output);
+		return ERR_PTR(ret);
+	}
+
+	bridge->conn = drm_bridge_connector_init(drm_dev, bridge->enc);
+	if (IS_ERR(bridge->conn)) {
+		dev_err(drm_dev->dev,
+			"Cannot create connector for output %u\n", output);
+		ret = PTR_ERR(bridge->conn);
+		return ERR_PTR(ret);
+	}
+	drm_connector_attach_encoder(bridge->conn, bridge->enc);
+
+	return bridge;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.h b/drivers/gpu/drm/verisilicon/vs_bridge.h
new file mode 100644
index 0000000000000..4120abafdaed6
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#ifndef _VS_BRIDGE_H_
+#define _VS_BRIDGE_H_
+
+#include <linux/types.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+
+struct vs_crtc;
+
+enum vs_bridge_output_interface {
+	VSDC_OUTPUT_INTERFACE_DPI = 0,
+	VSDC_OUTPUT_INTERFACE_DP = 1
+};
+
+struct vs_bridge {
+	struct drm_bridge base;
+	struct drm_encoder *enc;
+	struct drm_connector *conn;
+
+	struct vs_crtc *crtc;
+	struct drm_bridge *next;
+	enum vs_bridge_output_interface intf;
+	u32 output_bus_fmt;
+};
+
+static inline struct vs_bridge *drm_bridge_to_vs_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct vs_bridge, base);
+}
+
+struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
+				 struct vs_crtc *crtc);
+#endif /* _VS_BRIDGE_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge_regs.h b/drivers/gpu/drm/verisilicon/vs_bridge_regs.h
new file mode 100644
index 0000000000000..9eb30e4564beb
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_bridge_regs.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_BRIDGE_REGS_H_
+#define _VS_BRIDGE_REGS_H_
+
+#include <linux/bits.h>
+
+#define VSDC_DISP_PANEL_CONFIG(n)		(0x1418 + 0x4 * (n))
+#define VSDC_DISP_PANEL_CONFIG_DE_EN		BIT(0)
+#define VSDC_DISP_PANEL_CONFIG_DE_POL		BIT(1)
+#define VSDC_DISP_PANEL_CONFIG_DAT_EN		BIT(4)
+#define VSDC_DISP_PANEL_CONFIG_DAT_POL		BIT(5)
+#define VSDC_DISP_PANEL_CONFIG_CLK_EN		BIT(8)
+#define VSDC_DISP_PANEL_CONFIG_CLK_POL		BIT(9)
+#define VSDC_DISP_PANEL_CONFIG_RUNNING		BIT(12)
+#define VSDC_DISP_PANEL_CONFIG_GAMMA		BIT(13)
+#define VSDC_DISP_PANEL_CONFIG_YUV		BIT(16)
+
+#define VSDC_DISP_DPI_CONFIG(n)			(0x14B8 + 0x4 * (n))
+#define VSDC_DISP_DPI_CONFIG_FMT_MASK		GENMASK(2, 0)
+#define VSDC_DISP_DPI_CONFIG_FMT_RGB565		(0)
+#define VSDC_DISP_DPI_CONFIG_FMT_RGB666		(3)
+#define VSDC_DISP_DPI_CONFIG_FMT_RGB888		(5)
+#define VSDC_DISP_DPI_CONFIG_FMT_RGB101010	(6)
+
+#define VSDC_DISP_PANEL_START			0x1CCC
+#define VSDC_DISP_PANEL_START_RUNNING(n)	BIT(n)
+#define VSDC_DISP_PANEL_START_MULTI_DISP_SYNC	BIT(3)
+
+#define VSDC_DISP_DP_CONFIG(n)			(0x1CD0 + 0x4 * (n))
+#define VSDC_DISP_DP_CONFIG_DP_EN		BIT(3)
+#define VSDC_DISP_DP_CONFIG_FMT_MASK		GENMASK(2, 0)
+#define VSDC_DISP_DP_CONFIG_FMT_RGB565		(0)
+#define VSDC_DISP_DP_CONFIG_FMT_RGB666		(1)
+#define VSDC_DISP_DP_CONFIG_FMT_RGB888		(2)
+#define VSDC_DISP_DP_CONFIG_FMT_RGB101010	(3)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_MASK	GENMASK(7, 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8	(2 << 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8	(4 << 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10	(8 << 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10	(10 << 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8	(12 << 4)
+#define VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10	(13 << 4)
+
+#define VSDC_DISP_PANEL_CONFIG_EX(n)		(0x2518 + 0x4 * (n))
+#define VSDC_DISP_PANEL_CONFIG_EX_COMMIT	BIT(0)
+
+#endif /* _VS_BRIDGE_REGS_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/verisilicon/vs_crtc.c
new file mode 100644
index 0000000000000..8825b77ed3ca0
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_managed.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_plane.h"
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct drm_pending_vblank_event *event = crtc_state->event;
+
+	DRM_DEBUG_DRIVER("Flushing CRTC %u vblank events\n", vcrtc->id);
+
+	if (event) {
+		crtc_state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	DRM_DEBUG_DRIVER("Disabling CRTC %u\n", output);
+
+	drm_crtc_vblank_off(crtc);
+
+	clk_disable_unprepare(dc->pix_clk[output]);
+}
+
+static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	DRM_DEBUG_DRIVER("Enabling CRTC %u\n", output);
+
+	WARN_ON(clk_prepare_enable(dc->pix_clk[output]));
+
+	drm_crtc_vblank_on(crtc);
+}
+
+static void vs_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+
+	DRM_DEBUG_DRIVER("Setting mode on CRTC %u\n", output);
+
+	regmap_write(dc->regs, VSDC_DISP_HSIZE(output),
+		     VSDC_DISP_HSIZE_DISP(mode->hdisplay) |
+		     VSDC_DISP_HSIZE_TOTAL(mode->htotal));
+	regmap_write(dc->regs, VSDC_DISP_VSIZE(output),
+		     VSDC_DISP_VSIZE_DISP(mode->vdisplay) |
+		     VSDC_DISP_VSIZE_TOTAL(mode->vtotal));
+	regmap_write(dc->regs, VSDC_DISP_HSYNC(output),
+		     VSDC_DISP_HSYNC_START(mode->hsync_start) |
+		     VSDC_DISP_HSYNC_END(mode->hsync_end) |
+		     VSDC_DISP_HSYNC_EN);
+	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
+		regmap_set_bits(dc->regs, VSDC_DISP_HSYNC(output),
+				VSDC_DISP_HSYNC_POL);
+	regmap_write(dc->regs, VSDC_DISP_VSYNC(output),
+		     VSDC_DISP_VSYNC_START(mode->vsync_start) |
+		     VSDC_DISP_VSYNC_END(mode->vsync_end) |
+		     VSDC_DISP_VSYNC_EN);
+	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
+		regmap_set_bits(dc->regs, VSDC_DISP_VSYNC(output),
+				VSDC_DISP_VSYNC_POL);
+
+	WARN_ON(clk_set_rate(dc->pix_clk[output], mode->crtc_clock * 1000));
+}
+
+static enum drm_mode_status
+vs_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+	long rate;
+
+	if (mode->htotal > 0x7FFF)
+		return MODE_BAD_HVALUE;
+	if (mode->vtotal > 0x7FFF)
+		return MODE_BAD_VVALUE;
+
+	rate = clk_round_rate(dc->pix_clk[output], mode->clock * 1000);
+	if (rate <= 0)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
+static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
+			       const struct drm_display_mode *m,
+			       struct drm_display_mode *adjusted_mode)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+	unsigned int output = vcrtc->id;
+	long clk_rate;
+
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+
+	/* Feedback the pixel clock to crtc_clock */
+	clk_rate = adjusted_mode->crtc_clock * 1000;
+	clk_rate = clk_round_rate(dc->pix_clk[output], clk_rate);
+	if (clk_rate <= 0)
+		return false;
+
+	adjusted_mode->crtc_clock = clk_rate / 1000;
+
+	return true;
+}
+
+static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
+	.atomic_flush	= vs_crtc_atomic_flush,
+	.atomic_enable	= vs_crtc_atomic_enable,
+	.atomic_disable	= vs_crtc_atomic_disable,
+	.mode_set_nofb	= vs_crtc_mode_set_nofb,
+	.mode_valid	= vs_crtc_mode_valid,
+	.mode_fixup	= vs_crtc_mode_fixup,
+};
+
+static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+
+	DRM_DEBUG_DRIVER("Enabling VBLANK on CRTC %u\n", vcrtc->id);
+	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+
+	return 0;
+}
+
+static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
+	struct vs_dc *dc = vcrtc->dc;
+
+	DRM_DEBUG_DRIVER("Disabling VBLANK on CRTC %u\n", vcrtc->id);
+	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN, VSDC_TOP_IRQ_VSYNC(vcrtc->id));
+}
+
+static const struct drm_crtc_funcs vs_crtc_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.set_config		= drm_atomic_helper_set_config,
+	.enable_vblank		= vs_crtc_enable_vblank,
+	.disable_vblank		= vs_crtc_disable_vblank,
+};
+
+struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct vs_dc *dc,
+			     unsigned int output)
+{
+	struct vs_crtc *vcrtc;
+	struct drm_plane *primary;
+	int ret;
+
+	vcrtc = drmm_kzalloc(drm_dev, sizeof(*vcrtc), GFP_KERNEL);
+	if (!vcrtc)
+		return ERR_PTR(-ENOMEM);
+	vcrtc->dc = dc;
+	vcrtc->id = output;
+
+	/* Create our primary plane */
+	primary = vs_primary_plane_init(drm_dev, dc);
+	if (IS_ERR(primary)) {
+		dev_err(drm_dev->dev, "Couldn't create the primary plane\n");
+		return ERR_PTR(PTR_ERR(primary));
+	}
+
+	ret = drmm_crtc_init_with_planes(drm_dev, &vcrtc->base,
+					 primary,
+					 NULL,
+					 &vs_crtc_funcs,
+					 NULL);
+	if (ret) {
+		dev_err(drm_dev->dev, "Couldn't initialize CRTC\n");
+		return ERR_PTR(ret);
+	}
+
+	drm_crtc_helper_add(&vcrtc->base, &vs_crtc_helper_funcs);
+
+	return vcrtc;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h b/drivers/gpu/drm/verisilicon/vs_crtc.h
new file mode 100644
index 0000000000000..6f862d609b984
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#ifndef _VS_CRTC_H_
+#define _VS_CRTC_H_
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_vblank.h>
+
+struct vs_dc;
+
+struct vs_crtc {
+	struct drm_crtc base;
+
+	struct vs_dc *dc;
+	unsigned int id;
+};
+
+static inline struct vs_crtc *drm_crtc_to_vs_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct vs_crtc, base);
+}
+
+struct vs_crtc *vs_crtc_init(struct drm_device *drm_dev, struct vs_dc *dc,
+			     unsigned int output);
+
+#endif /* _VS_CRTC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
new file mode 100644
index 0000000000000..c7930e817635c
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_CRTC_REGS_H_
+#define _VS_CRTC_REGS_H_
+
+#include <linux/bits.h>
+
+#define VSDC_DISP_DITHER_CONFIG(n)		(0x1410 + 0x4 * (n))
+
+#define VSDC_DISP_DITHER_TABLE_LOW(n)		(0x1420 + 0x4 * (n))
+#define VSDC_DISP_DITHER_TABLE_LOW_DEFAULT	0x7B48F3C0
+
+#define VSDC_DISP_DITHER_TABLE_HIGH(n)		(0x1428 + 0x4 * (n))
+#define VSDC_DISP_DITHER_TABLE_HIGH_DEFAULT	0x596AD1E2
+
+#define VSDC_DISP_HSIZE(n)			(0x1430 + 0x4 * (n))
+#define VSDC_DISP_HSIZE_DISP_MASK		GENMASK(14, 0)
+#define VSDC_DISP_HSIZE_DISP(v)			((v) << 0)
+#define VSDC_DISP_HSIZE_TOTAL_MASK		GENMASK(30, 16)
+#define VSDC_DISP_HSIZE_TOTAL(v)		((v) << 16)
+
+#define VSDC_DISP_HSYNC(n)			(0x1438 + 0x4 * (n))
+#define VSDC_DISP_HSYNC_START_MASK		GENMASK(14, 0)
+#define VSDC_DISP_HSYNC_START(v)		((v) << 0)
+#define VSDC_DISP_HSYNC_END_MASK		GENMASK(29, 15)
+#define VSDC_DISP_HSYNC_END(v)			((v) << 15)
+#define VSDC_DISP_HSYNC_EN			BIT(30)
+#define VSDC_DISP_HSYNC_POL			BIT(31)
+
+#define VSDC_DISP_VSIZE(n)			(0x1440 + 0x4 * (n))
+#define VSDC_DISP_VSIZE_DISP_MASK		GENMASK(14, 0)
+#define VSDC_DISP_VSIZE_DISP(v)			((v) << 0)
+#define VSDC_DISP_VSIZE_TOTAL_MASK		GENMASK(30, 16)
+#define VSDC_DISP_VSIZE_TOTAL(v)		((v) << 16)
+
+#define VSDC_DISP_VSYNC(n)			(0x1448 + 0x4 * (n))
+#define VSDC_DISP_VSYNC_START_MASK		GENMASK(14, 0)
+#define VSDC_DISP_VSYNC_START(v)		((v) << 0)
+#define VSDC_DISP_VSYNC_END_MASK		GENMASK(29, 15)
+#define VSDC_DISP_VSYNC_END(v)			((v) << 15)
+#define VSDC_DISP_VSYNC_EN			BIT(30)
+#define VSDC_DISP_VSYNC_POL			BIT(31)
+
+#define VSDC_DISP_CURRENT_LOCATION(n)		(0x1450 + 0x4 * (n))
+
+#define VSDC_DISP_GAMMA_INDEX(n)		(0x1458 + 0x4 * (n))
+
+#define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
+
+#define VSDC_DISP_IRQ_STA			0x147C
+
+#define VSDC_DISP_IRQ_EN			0x1480
+
+#endif /* _VS_CRTC_REGS_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
new file mode 100644
index 0000000000000..a413479c6cfff
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_drm.h"
+#include "vs_hwdb.h"
+
+static const struct regmap_config vs_dc_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = sizeof(u32),
+	/* VSDC_OVL_CONFIG_EX(1) */
+	.max_register = 0x2544,
+};
+
+static const struct of_device_id vs_dc_driver_dt_match[] = {
+	{ .compatible = "verisilicon,dc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, vs_dc_driver_dt_match);
+
+static irqreturn_t vs_dc_irq_handler(int irq, void *private)
+{
+	struct vs_dc *dc = private;
+	u32 irqs;
+
+	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
+
+	return vs_drm_handle_irq(dc, irqs);
+}
+
+static int vs_dc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vs_dc *dc;
+	void __iomem *regs;
+	unsigned int outputs, i;
+	/* pix0/pix1 */
+	char pixclk_name[5];
+	int irq, ret;
+
+	if (!dev->of_node) {
+		dev_err(dev, "can't find DC devices\n");
+		return -ENODEV;
+	}
+
+	outputs = of_graph_get_port_count(dev->of_node);
+	if (!outputs) {
+		dev_err(dev, "can't find DC downstream ports\n");
+		return -ENODEV;
+	}
+	if (outputs > VSDC_MAX_OUTPUTS) {
+		dev_err(dev, "too many DC downstream ports than possible\n");
+		return -EINVAL;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "No suitable DMA available\n");
+		return ret;
+	}
+
+	dc = devm_kzalloc(dev, sizeof(*dc), GFP_KERNEL);
+	if (!dc)
+		return -ENOMEM;
+
+	dc->outputs = outputs;
+
+	dc->rsts[0].id = "core";
+	dc->rsts[1].id = "axi";
+	dc->rsts[2].id = "ahb";
+
+	ret = devm_reset_control_bulk_get_optional_shared(dev, VSDC_RESET_COUNT,
+							  dc->rsts);
+	if (ret) {
+		dev_err(dev, "can't get reset lines\n");
+		return ret;
+	}
+
+	dc->core_clk = devm_clk_get_enabled(dev, "core");
+	if (IS_ERR(dc->core_clk)) {
+		dev_err(dev, "can't get core clock\n");
+		return PTR_ERR(dc->core_clk);
+	}
+
+	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+	if (IS_ERR(dc->axi_clk)) {
+		dev_err(dev, "can't get axi clock\n");
+		return PTR_ERR(dc->axi_clk);
+	}
+
+	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+	if (IS_ERR(dc->ahb_clk)) {
+		dev_err(dev, "can't get ahb clock\n");
+		return PTR_ERR(dc->ahb_clk);
+	}
+
+	for (i = 0; i < outputs; i++) {
+		snprintf(pixclk_name, sizeof(pixclk_name), "pix%u", i);
+		dc->pix_clk[i] = devm_clk_get(dev, pixclk_name);
+		if (IS_ERR(dc->pix_clk[i])) {
+			dev_err(dev, "can't get pixel clk %u\n", i);
+			return PTR_ERR(dc->pix_clk[i]);
+		}
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "can't get irq\n");
+		return irq;
+	}
+
+	ret = reset_control_bulk_deassert(VSDC_RESET_COUNT, dc->rsts);
+	if (ret) {
+		dev_err(dev, "can't deassert reset lines\n");
+		return ret;
+	}
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs)) {
+		dev_err(dev, "can't map registers");
+		ret = PTR_ERR(regs);
+		goto err_rst_assert;
+	}
+
+	dc->regs = devm_regmap_init_mmio(dev, regs, &vs_dc_regmap_cfg);
+	if (IS_ERR(dc->regs)) {
+		ret = PTR_ERR(dc->regs);
+		goto err_rst_assert;
+	}
+
+	ret = vs_fill_chip_identity(dc->regs, &dc->identity);
+	if (ret)
+		goto err_rst_assert;
+
+	dev_info(dev, "DC%x rev %x customer %x\n", dc->identity.model,
+		 dc->identity.revision, dc->identity.customer_id);
+
+	if (outputs > dc->identity.display_count) {
+		dev_err(dev, "too many downstream ports than HW capability\n");
+		ret = -EINVAL;
+		goto err_rst_assert;
+	}
+
+	ret = devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
+			       dev_name(dev), dc);
+	if (ret) {
+		dev_err(dev, "can't request irq\n");
+		goto err_rst_assert;
+	}
+
+	dev_set_drvdata(dev, dc);
+
+	ret = vs_drm_initialize(dc, pdev);
+	if (ret)
+		goto err_rst_assert;
+
+	return 0;
+
+err_rst_assert:
+	reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
+	return ret;
+}
+
+static void vs_dc_remove(struct platform_device *pdev)
+{
+	struct vs_dc *dc = dev_get_drvdata(&pdev->dev);
+
+	vs_drm_finalize(dc);
+
+	dev_set_drvdata(&pdev->dev, NULL);
+
+	reset_control_bulk_assert(VSDC_RESET_COUNT, dc->rsts);
+}
+
+static void vs_dc_shutdown(struct platform_device *pdev)
+{
+	struct vs_dc *dc = dev_get_drvdata(&pdev->dev);
+
+	vs_drm_shutdown_handler(dc);
+}
+
+struct platform_driver vs_dc_platform_driver = {
+	.probe = vs_dc_probe,
+	.remove = vs_dc_remove,
+	.shutdown = vs_dc_shutdown,
+	.driver = {
+		.name = "verisilicon-dc",
+		.of_match_table = vs_dc_driver_dt_match,
+	},
+};
+
+module_platform_driver(vs_dc_platform_driver);
+
+MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
+MODULE_DESCRIPTION("Verisilicon display controller driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
new file mode 100644
index 0000000000000..5e071501b1c38
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_DC_H_
+#define _VS_DC_H_
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_device.h>
+
+#include "vs_hwdb.h"
+
+#define VSDC_MAX_OUTPUTS 2
+#define VSDC_RESET_COUNT 3
+
+struct vs_drm_dev;
+struct vs_crtc;
+
+struct vs_dc {
+	struct regmap *regs;
+	struct clk *core_clk;
+	struct clk *axi_clk;
+	struct clk *ahb_clk;
+	struct clk *pix_clk[VSDC_MAX_OUTPUTS];
+	struct reset_control_bulk_data rsts[VSDC_RESET_COUNT];
+
+	struct vs_drm_dev *drm_dev;
+	struct vs_chip_identity identity;
+	unsigned int outputs;
+};
+
+#endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc_top_regs.h b/drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
new file mode 100644
index 0000000000000..50509bbbff08f
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_DC_TOP_H_
+#define _VS_DC_TOP_H_
+
+#include <linux/bits.h>
+
+#define VSDC_TOP_RST				0x0000
+
+#define VSDC_TOP_IRQ_ACK			0x0010
+#define VSDC_TOP_IRQ_VSYNC(n)			BIT(n)
+
+#define VSDC_TOP_IRQ_EN				0x0014
+
+#define VSDC_TOP_CHIP_MODEL			0x0020
+
+#define VSDC_TOP_CHIP_REV			0x0024
+
+#define VSDC_TOP_CHIP_CUSTOMER_ID		0x0030
+
+#endif /* _VS_DC_TOP_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.c b/drivers/gpu/drm/verisilicon/vs_drm.c
new file mode 100644
index 0000000000000..f356d7832c449
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drm.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/aperture.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/console.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_bridge.h"
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_dc_top_regs.h"
+#include "vs_drm.h"
+
+#define DRIVER_NAME	"verisilicon"
+#define DRIVER_DESC	"Verisilicon DC-series display controller driver"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static int vs_gem_dumb_create(struct drm_file *file_priv,
+			      struct drm_device *drm,
+			      struct drm_mode_create_dumb *args)
+{
+	/* The hardware wants 128B-aligned pitches for linear buffers. */
+	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 128);
+
+	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
+}
+
+DEFINE_DRM_GEM_FOPS(vs_drm_driver_fops);
+
+static const struct drm_driver vs_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			= &vs_drm_driver_fops,
+	.name	= DRIVER_NAME,
+	.desc	= DRIVER_DESC,
+	.major	= DRIVER_MAJOR,
+	.minor	= DRIVER_MINOR,
+
+	/* GEM Operations */
+	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vs_gem_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
+};
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs vs_mode_config_helper_funcs = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail,
+};
+
+static void vs_mode_config_init(struct drm_device *drm)
+{
+	drm_mode_config_reset(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 8192;
+	drm->mode_config.max_height = 8192;
+	drm->mode_config.funcs = &vs_mode_config_funcs;
+	drm->mode_config.helper_private = &vs_mode_config_helper_funcs;
+}
+
+int vs_drm_initialize(struct vs_dc *dc, struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vs_drm_dev *vdrm;
+	struct drm_device *drm;
+	struct vs_crtc *crtc;
+	struct vs_bridge *bridge;
+	unsigned int i;
+	int ret;
+
+	vdrm = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_dev, base);
+	if (IS_ERR(vdrm))
+		return PTR_ERR(vdrm);
+
+	drm = &vdrm->base;
+	vdrm->dc = dc;
+	dc->drm_dev = vdrm;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < dc->outputs; i++) {
+		crtc = vs_crtc_init(drm, dc, i);
+		if (IS_ERR(crtc))
+			return PTR_ERR(crtc);
+
+		bridge = vs_bridge_init(drm, crtc);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+
+		vdrm->crtcs[i] = crtc;
+	}
+
+	ret = drm_vblank_init(drm, dc->outputs);
+	if (ret)
+		return ret;
+
+	/* Remove early framebuffers (ie. simplefb) */
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret)
+		return ret;
+
+	vs_mode_config_init(drm);
+
+	/* Enable connectors polling */
+	drm_kms_helper_poll_init(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		goto err_fini_poll;
+
+	drm_client_setup(drm, NULL);
+
+	return 0;
+
+err_fini_poll:
+	drm_kms_helper_poll_fini(drm);
+	return ret;
+}
+
+void vs_drm_finalize(struct vs_dc *dc)
+{
+	struct vs_drm_dev *vdrm = dc->drm_dev;
+	struct drm_device *drm = &vdrm->base;
+
+	drm_dev_unregister(drm);
+	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
+	dc->drm_dev = NULL;
+}
+
+void vs_drm_shutdown_handler(struct vs_dc *dc)
+{
+	struct vs_drm_dev *vdrm = dc->drm_dev;
+
+	drm_atomic_helper_shutdown(&vdrm->base);
+}
+
+irqreturn_t vs_drm_handle_irq(struct vs_dc *dc, u32 irqs)
+{
+	unsigned int i;
+
+	for (i = 0; i < dc->outputs; i++) {
+		if (irqs & VSDC_TOP_IRQ_VSYNC(i)) {
+			irqs &= ~VSDC_TOP_IRQ_VSYNC(i);
+			if (dc->drm_dev->crtcs[i])
+				drm_crtc_handle_vblank(&dc->drm_dev->crtcs[i]->base);
+		}
+	}
+
+	if (irqs)
+		pr_warn("Unknown Verisilicon DC interrupt 0x%x fired!\n", irqs);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_drm.h b/drivers/gpu/drm/verisilicon/vs_drm.h
new file mode 100644
index 0000000000000..bbcd2e527deb6
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drm.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#ifndef _VS_DRM_H_
+#define _VS_DRM_H_
+
+#include <linux/irqreturn.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+
+struct vs_dc;
+
+struct vs_drm_dev {
+	struct drm_device base;
+
+	struct vs_dc *dc;
+	struct vs_crtc *crtcs[VSDC_MAX_OUTPUTS];
+};
+
+int vs_drm_initialize(struct vs_dc *dc, struct platform_device *pdev);
+void vs_drm_finalize(struct vs_dc *dc);
+void vs_drm_shutdown_handler(struct vs_dc *dc);
+irqreturn_t vs_drm_handle_irq(struct vs_dc *dc, u32 irqs);
+
+#endif /* _VS_DRM_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
new file mode 100644
index 0000000000000..4a87e5d4701f3
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/errno.h>
+
+#include <drm/drm_fourcc.h>
+
+#include "vs_dc_top_regs.h"
+#include "vs_hwdb.h"
+
+static const u32 vs_formats_array_no_yuv444[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XBGR4444,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_BGRX5551,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_BGRA1010102,
+	/* TODO: non-RGB formats */
+};
+
+static const u32 vs_formats_array_with_yuv444[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XBGR4444,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_BGRX5551,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_BGRA1010102,
+	/* TODO: non-RGB formats */
+};
+
+static const struct vs_formats vs_formats_no_yuv444 = {
+	.array = vs_formats_array_no_yuv444,
+	.num = ARRAY_SIZE(vs_formats_array_no_yuv444)
+};
+
+static const struct vs_formats vs_formats_with_yuv444 = {
+	.array = vs_formats_array_with_yuv444,
+	.num = ARRAY_SIZE(vs_formats_array_with_yuv444)
+};
+
+static struct vs_chip_identity vs_chip_identities[] = {
+	{
+		.model = 0x8200,
+		.revision = 0x5720,
+		.customer_id = ~0U,
+
+		.display_count = 2,
+		.formats = &vs_formats_no_yuv444,
+	},
+	{
+		.model = 0x8200,
+		.revision = 0x5721,
+		.customer_id = 0x30B,
+
+		.display_count = 2,
+		.formats = &vs_formats_no_yuv444,
+	},
+	{
+		.model = 0x8200,
+		.revision = 0x5720,
+		.customer_id = 0x310,
+
+		.display_count = 2,
+		.formats = &vs_formats_with_yuv444,
+	},
+	{
+		.model = 0x8200,
+		.revision = 0x5720,
+		.customer_id = 0x311,
+
+		.display_count = 2,
+		.formats = &vs_formats_no_yuv444,
+	},
+};
+
+int vs_fill_chip_identity(struct regmap *regs,
+			  struct vs_chip_identity *ident)
+{
+	u32 model;
+	u32 revision;
+	u32 customer_id;
+	int i;
+
+	regmap_read(regs, VSDC_TOP_CHIP_MODEL, &model);
+	regmap_read(regs, VSDC_TOP_CHIP_REV, &revision);
+	regmap_read(regs, VSDC_TOP_CHIP_CUSTOMER_ID, &customer_id);
+
+	for (i = 0; i < ARRAY_SIZE(vs_chip_identities); i++) {
+		if (vs_chip_identities[i].model == model &&
+		    vs_chip_identities[i].revision == revision &&
+		    (vs_chip_identities[i].customer_id == customer_id ||
+			 vs_chip_identities[i].customer_id == ~0U)) {
+			memcpy(ident, &vs_chip_identities[i], sizeof(*ident));
+			ident->customer_id = customer_id;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
new file mode 100644
index 0000000000000..92192e4fa0862
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#ifndef _VS_HWDB_H_
+#define _VS_HWDB_H_
+
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct vs_formats {
+	const u32 *array;
+	unsigned int num;
+};
+
+struct vs_chip_identity {
+	u32 model;
+	u32 revision;
+	u32 customer_id;
+
+	u32 display_count;
+	const struct vs_formats *formats;
+};
+
+int vs_fill_chip_identity(struct regmap *regs,
+			  struct vs_chip_identity *ident);
+
+#endif /* _VS_HWDB_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.c b/drivers/gpu/drm/verisilicon/vs_plane.c
new file mode 100644
index 0000000000000..f3c9963b6a4ea
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/errno.h>
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+
+#include "vs_plane.h"
+
+void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_XRGB4444:
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_BGRX4444:
+		vs_format->color = VSDC_COLOR_FORMAT_X4R4G4B4;
+		break;
+	case DRM_FORMAT_ARGB4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_BGRA4444:
+		vs_format->color = VSDC_COLOR_FORMAT_A4R4G4B4;
+		break;
+	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_BGRX5551:
+		vs_format->color = VSDC_COLOR_FORMAT_X1R5G5B5;
+		break;
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGRA5551:
+		vs_format->color = VSDC_COLOR_FORMAT_A1R5G5B5;
+		break;
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+		vs_format->color = VSDC_COLOR_FORMAT_R5G6B5;
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_BGRX8888:
+		vs_format->color = VSDC_COLOR_FORMAT_X8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_BGRA8888:
+		vs_format->color = VSDC_COLOR_FORMAT_A8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRA1010102:
+		vs_format->color = VSDC_COLOR_FORMAT_A2R10G10B10;
+		break;
+	default:
+		DRM_WARN("Unexpected drm format!\n");
+	}
+
+	switch (drm_format) {
+	case DRM_FORMAT_RGBX4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBX5551:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBA1010102:
+		vs_format->swizzle = VSDC_SWIZZLE_RGBA;
+		break;
+	case DRM_FORMAT_XBGR4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ABGR2101010:
+		vs_format->swizzle = VSDC_SWIZZLE_ABGR;
+		break;
+	case DRM_FORMAT_BGRX4444:
+	case DRM_FORMAT_BGRA4444:
+	case DRM_FORMAT_BGRX5551:
+	case DRM_FORMAT_BGRA5551:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
+		vs_format->swizzle = VSDC_SWIZZLE_BGRA;
+		break;
+	default:
+		/* N/A for YUV formats */
+		vs_format->swizzle = VSDC_SWIZZLE_ARGB;
+	}
+
+	/* N/A for non-YUV formats */
+	vs_format->uv_swizzle = false;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_plane.h b/drivers/gpu/drm/verisilicon/vs_plane.h
new file mode 100644
index 0000000000000..3595267c89b53
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_plane.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_PLANE_H_
+#define _VS_PLANE_H_
+
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_plane.h>
+
+#define VSDC_MAKE_PLANE_SIZE(w, h) (((w) & 0x7fff) | (((h) & 0x7fff) << 15))
+#define VSDC_MAKE_PLANE_POS(x, y) (((x) & 0x7fff) | (((y) & 0x7fff) << 15))
+
+struct vs_dc;
+
+enum vs_color_format {
+	VSDC_COLOR_FORMAT_X4R4G4B4,
+	VSDC_COLOR_FORMAT_A4R4G4B4,
+	VSDC_COLOR_FORMAT_X1R5G5B5,
+	VSDC_COLOR_FORMAT_A1R5G5B5,
+	VSDC_COLOR_FORMAT_R5G6B5,
+	VSDC_COLOR_FORMAT_X8R8G8B8,
+	VSDC_COLOR_FORMAT_A8R8G8B8,
+	VSDC_COLOR_FORMAT_YUY2,
+	VSDC_COLOR_FORMAT_UYVY,
+	VSDC_COLOR_FORMAT_INDEX8,
+	VSDC_COLOR_FORMAT_MONOCHROME,
+	VSDC_COLOR_FORMAT_YV12 = 0xf,
+	VSDC_COLOR_FORMAT_A8,
+	VSDC_COLOR_FORMAT_NV12,
+	VSDC_COLOR_FORMAT_NV16,
+	VSDC_COLOR_FORMAT_RG16,
+	VSDC_COLOR_FORMAT_R8,
+	VSDC_COLOR_FORMAT_NV12_10BIT,
+	VSDC_COLOR_FORMAT_A2R10G10B10,
+	VSDC_COLOR_FORMAT_NV16_10BIT,
+	VSDC_COLOR_FORMAT_INDEX1,
+	VSDC_COLOR_FORMAT_INDEX2,
+	VSDC_COLOR_FORMAT_INDEX4,
+	VSDC_COLOR_FORMAT_P010,
+	VSDC_COLOR_FORMAT_YUV444,
+	VSDC_COLOR_FORMAT_YUV444_10BIT
+};
+
+enum vs_swizzle {
+	VSDC_SWIZZLE_ARGB,
+	VSDC_SWIZZLE_RGBA,
+	VSDC_SWIZZLE_ABGR,
+	VSDC_SWIZZLE_BGRA,
+};
+
+struct vs_format {
+	enum vs_color_format color;
+	enum vs_swizzle swizzle;
+	bool uv_swizzle;
+};
+
+void drm_format_to_vs_format(u32 drm_format, struct vs_format *vs_format);
+
+struct drm_plane *vs_primary_plane_init(struct drm_device *dev, struct vs_dc *dc);
+
+#endif /* _VS_PLANE_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
new file mode 100644
index 0000000000000..e5dcfc76f0702
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "vs_crtc.h"
+#include "vs_plane.h"
+#include "vs_dc.h"
+#include "vs_primary_plane_regs.h"
+
+static int vs_primary_plane_atomic_check(struct drm_plane *plane,
+					 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, true);
+}
+
+
+static void vs_primary_plane_atomic_update(struct drm_plane *plane,
+					   struct drm_atomic_state *atomic_state)
+{
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
+								       plane);
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_gem_dma_object *gem;
+	struct vs_dc *dc;
+	struct vs_crtc *vcrtc;
+	struct vs_format fmt;
+	unsigned int output, bpp;
+	dma_addr_t dma_addr;
+
+	if (!crtc)
+		return;
+
+	vcrtc = drm_crtc_to_vs_crtc(crtc);
+	output = vcrtc->id;
+	dc = vcrtc->dc;
+
+	DRM_DEBUG_DRIVER("Updating output %d primary plane\n", output);
+
+	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
+			   VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
+
+	if (!state->visible || !fb) {
+		regmap_write(dc->regs, VSDC_FB_CONFIG(output), 0);
+		regmap_write(dc->regs, VSDC_FB_CONFIG_EX(output), 0);
+		goto commit;
+	} else {
+		regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+				VSDC_FB_CONFIG_EX_FB_EN);
+	}
+
+	drm_format_to_vs_format(state->fb->format->format, &fmt);
+
+	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
+			   VSDC_FB_CONFIG_FMT_MASK,
+			   VSDC_FB_CONFIG_FMT(fmt.color));
+	regmap_update_bits(dc->regs, VSDC_FB_CONFIG(output),
+			   VSDC_FB_CONFIG_SWIZZLE_MASK,
+			   VSDC_FB_CONFIG_SWIZZLE(fmt.swizzle));
+	regmap_assign_bits(dc->regs, VSDC_FB_CONFIG(output),
+			   VSDC_FB_CONFIG_UV_SWIZZLE_EN, fmt.uv_swizzle);
+
+	/* Get the physical address of the buffer in memory */
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
+
+	/* Compute the start of the displayed memory */
+	bpp = fb->format->cpp[0];
+	dma_addr = gem->dma_addr + fb->offsets[0];
+
+	/* Fixup framebuffer address for src coordinates */
+	dma_addr += (state->src.x1 >> 16) * bpp;
+	dma_addr += (state->src.y1 >> 16) * fb->pitches[0];
+
+	regmap_write(dc->regs, VSDC_FB_ADDRESS(output),
+		     lower_32_bits(dma_addr));
+	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
+		     fb->pitches[0]);
+
+	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x, state->crtc_y));
+	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
+		     VSDC_MAKE_PLANE_POS(state->crtc_x + state->crtc_w,
+					 state->crtc_y + state->crtc_h));
+	regmap_write(dc->regs, VSDC_FB_SIZE(output),
+		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state->crtc_h));
+
+	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
+		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
+commit:
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			VSDC_FB_CONFIG_EX_COMMIT);
+}
+
+static const struct drm_plane_helper_funcs vs_primary_plane_helper_funcs = {
+	.atomic_check	= vs_primary_plane_atomic_check,
+	.atomic_update	= vs_primary_plane_atomic_update,
+};
+
+static const struct drm_plane_funcs vs_primary_plane_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.update_plane		= drm_atomic_helper_update_plane,
+};
+
+struct drm_plane *vs_primary_plane_init(struct drm_device *drm_dev, struct vs_dc *dc)
+{
+	struct drm_plane *plane;
+
+	plane = drmm_universal_plane_alloc(drm_dev, struct drm_plane, dev, 0,
+					   &vs_primary_plane_funcs,
+					   dc->identity.formats->array,
+					   dc->identity.formats->num,
+					   NULL,
+					   DRM_PLANE_TYPE_PRIMARY,
+					   NULL);
+
+	if (IS_ERR(plane))
+		return plane;
+
+	drm_plane_helper_add(plane, &vs_primary_plane_helper_funcs);
+
+	return plane;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
new file mode 100644
index 0000000000000..cbb125c46b390
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on vs_dc_hw.h, which is:
+ *   Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef _VS_PRIMARY_PLANE_REGS_H_
+#define _VS_PRIMARY_PLANE_REGS_H_
+
+#include <linux/bits.h>
+
+#define VSDC_FB_ADDRESS(n)			(0x1400 + 0x4 * (n))
+
+#define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
+
+#define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
+#define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
+#define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
+#define VSDC_FB_CONFIG_YUV_SPACE_MASK		GENMASK(16, 14)
+#define VSDC_FB_CONFIG_YUV_SPACE(v)		((v) << 14)
+#define VSDC_FB_CONFIG_TILE_MODE_MASK		GENMASK(21, 17)
+#define VSDC_FB_CONFIG_TILE_MODE(v)		((v) << 14)
+#define VSDC_FB_CONFIG_SCALE_EN			BIT(22)
+#define VSDC_FB_CONFIG_SWIZZLE_MASK		GENMASK(24, 23)
+#define VSDC_FB_CONFIG_SWIZZLE(v)		((v) << 23)
+#define VSDC_FB_CONFIG_UV_SWIZZLE_EN		BIT(25)
+#define VSDC_FB_CONFIG_FMT_MASK			GENMASK(31, 26)
+#define VSDC_FB_CONFIG_FMT(v)			((v) << 26)
+
+#define VSDC_FB_SIZE(n)				(0x1810 + 0x4 * (n))
+/* Fill with value generated with VSDC_MAKE_PLANE_SIZE(w, h) */
+
+#define VSDC_FB_CONFIG_EX(n)			(0x1CC0 + 0x4 * (n))
+#define VSDC_FB_CONFIG_EX_COMMIT		BIT(12)
+#define VSDC_FB_CONFIG_EX_FB_EN			BIT(13)
+#define VSDC_FB_CONFIG_EX_ZPOS_MASK		GENMASK(18, 16)
+#define VSDC_FB_CONFIG_EX_ZPOS(v)		((v) << 16)
+#define VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK	GENMASK(19, 19)
+#define VSDC_FB_CONFIG_EX_DISPLAY_ID(v)		((v) << 19)
+
+#define VSDC_FB_TOP_LEFT(n)			(0x24D8 + 0x4 * (n))
+/* Fill with value generated with VSDC_MAKE_PLANE_POS(x, y) */
+
+#define VSDC_FB_BOTTOM_RIGHT(n)			(0x24E0 + 0x4 * (n))
+/* Fill with value generated with VSDC_MAKE_PLANE_POS(x, y) */
+
+#define VSDC_FB_BLEND_CONFIG(n)			(0x2510 + 0x4 * (n))
+#define VSDC_FB_BLEND_CONFIG_BLEND_DISABLE	BIT(1)
+
+#endif /* _VS_PRIMARY_PLANE_REGS_H_ */
-- 
2.51.0

