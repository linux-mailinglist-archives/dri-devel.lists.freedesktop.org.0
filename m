Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8FE6AFDF3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 05:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B01810E1BC;
	Wed,  8 Mar 2023 04:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC6F10E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 04:37:23 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id ky4so16585206plb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 20:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678250243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMAsT+vc4vnBNJAi1V7MFQdPcieGmrxygv7oC7zQQY8=;
 b=p7Xwvz3ByTM7CBnHB/t0Q4dgAArr6IjT0AYx9diZpADY3jLkauJ8uNrppXjALuITjx
 9BlrGMs3vdPAcnFhzB8fHXW7UTBPXJ60o2oaxA0vs8HM2aqSmZMuET0/h3IAnF4qdlyP
 JFCZzBmnngeez92vbYjCOA59e2sGx1SMZX9BMFWSEuXweSXFEh7gP/hcS/CnCe11YdcB
 Qsz2bzj7hukkuBhAg9xsPaaOQN/uVyJheA6BfY19zmTmGIFs+EbYUAwpDplxUiPS5jd/
 Mbg9njOchrhnx+eEPDdsf+t3ZjbcH5bXcsmjwEPcLvYawI5nAWWxj4cbM4O3KREP9Bf6
 uQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678250243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMAsT+vc4vnBNJAi1V7MFQdPcieGmrxygv7oC7zQQY8=;
 b=LiySsKLUf4qxty4da3v+Tr4InGmIijrphnrF4PYufvwt0E1+euzn57YxwH8MiUXtzL
 hMNu0hI1uuHkfQz5JnqR1uVXgD4awjy96kbLt8bHfoBs1jL463vbs1dUVry++wbwPAvb
 HS2pEIa2nHlzVkpu85J0Kri3h4ttiIaik6HmLJka/am/+pyQBuR7Bun3UBk/Qk/td7GT
 78Dc73sxVvp/awoBdMnNpeyeUdSfah9WhdcXeuh1LCwu2bcU/ct9qCyUXy2yCShOdre2
 lWKQHomAYieZYQER9hn3RV19u7kiilo9WfOc7D+CCdrptYz6eU9eBTR7+zSYCMxXZAzG
 8hHw==
X-Gm-Message-State: AO0yUKXjNqW0049t4VRyGktYc1mDVH6iaW3sW1kLqiDTxf1mg46Q7Q2T
 IRPzVCHETIgSVlUCQiwjitg=
X-Google-Smtp-Source: AK7set+Yz4aCyrUU66gPyQcRq45W1GP4MSl4SXWUPUHLYON+0AbJMIB1xLMcU61sj/RSVyGIzXL5pg==
X-Received: by 2002:a05:6a20:430f:b0:cd:1367:3b69 with SMTP id
 h15-20020a056a20430f00b000cd13673b69mr16986050pzk.17.1678250243243; 
 Tue, 07 Mar 2023 20:37:23 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 j14-20020a62e90e000000b005a8de0f4c76sm8909257pfh.17.2023.03.07.20.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 20:37:22 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Date: Wed,  8 Mar 2023 12:37:06 +0800
Message-Id: <20230308043706.16318-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308043706.16318-1-lujianhua000@gmail.com>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for panels using the Novatek NT36523 display driver IC.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v3:
  - Refactor source code

Changes in v2:
  - Refactor and clean up source code

 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 770 ++++++++++++++++++
 4 files changed, 788 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36523.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5383af5d3b45..3586248bb05d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6537,6 +6537,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35560.c
 
+DRM DRIVER FOR NOVATEK NT36523 PANELS
+M:	Jianhua Lu <lujianhua000@gmail.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
+
 DRM DRIVER FOR NOVATEK NT36672A PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8eeee71c0000..268508743b5c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -377,6 +377,16 @@ config DRM_PANEL_NOVATEK_NT35950
 	  Sharp panels used in Sony Xperia Z5 Premium and XZ Premium
 	  mobile phones.
 
+config DRM_PANEL_NOVATEK_NT36523
+	tristate "Novatek NT36523 panel driver"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the Novatek NT36523 display controller, such as some
+	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
+
 config DRM_PANEL_NOVATEK_NT36672A
 	tristate "Novatek NT36672A DSI panel"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index c05aa9e23907..570eab8bf2b2 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
+obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
 obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
new file mode 100644
index 000000000000..0df41ef9690c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -0,0 +1,770 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Novatek NT36523 DriverIC panels driver
+ *
+ * Copyright (c) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define DSI_NUM_MIN 1
+
+/* Macro modified from mipi_dual_dsi_dcs_write_seq */
+#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)           	   \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		int i, ret;                                                \
+		for (i = 0; i < ARRAY_SIZE(dsi); i++) {                    \
+			ret = mipi_dsi_dcs_write_buffer(dsi[i], d, ARRAY_SIZE(d));    \
+			if (ret < 0) {                                             \
+				dev_err_ratelimited(                               \
+					&dsi[i]->dev, "sending command %#02x failed: %d\n", \
+					cmd, ret);                                 \
+				return ret;                                        \
+			}                                                          \
+		}                                                                  \
+	} while (0)
+
+struct panel_info {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi[2];
+	const struct panel_desc *desc;
+
+	struct gpio_desc *reset_gpio;
+	struct backlight_device *backlight;
+	struct regulator *vddio;
+
+	bool prepared;
+};
+
+struct panel_desc {
+	unsigned int width_mm;
+	unsigned int height_mm;
+
+	unsigned int bpc;
+	unsigned int lanes;
+	unsigned long mode_flags;
+	enum mipi_dsi_pixel_format format;
+
+	const struct drm_display_mode *modes;
+	const struct mipi_dsi_device_info dsi_info;
+	int (*init_sequence)(struct panel_info *pinfo);
+
+	bool is_dual_dsi;
+};
+
+static inline struct panel_info *to_panel_info(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_info, panel);
+}
+
+static int elish_boe_init_sequence(struct panel_info *pinfo)
+{
+	/* No datasheet */
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x05);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x18, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x23);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x00, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x01, 0x84);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x05, 0x2D);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x06, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x07, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x08, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x09, 0x45);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x11, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x12, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x15, 0x83);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x16, 0x0C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x29, 0x0A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x30, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x31, 0xFE);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x32, 0xFD);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x33, 0xFB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x34, 0xF8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x35, 0xF5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x36, 0xF3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x37, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x38, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x39, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3A, 0xEF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3B, 0xEC);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3D, 0xE9);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3F, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x40, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x41, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2A, 0x13);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x45, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x46, 0xF4);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x47, 0xE7);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x48, 0xDA);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x49, 0xCD);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4A, 0xC0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4B, 0xB3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4C, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4D, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4E, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4F, 0x99);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x50, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x68);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x52, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x53, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x54, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2B, 0x0E);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x58, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x59, 0xFB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5A, 0xF7);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5B, 0xF3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5C, 0xEF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5D, 0xE3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5E, 0xDA);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5F, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x60, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x61, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x62, 0xCB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x63, 0xBF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x64, 0xB3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x65, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x66, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x67, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x2A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x25, 0x47);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x30, 0x47);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x39, 0x47);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x26);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x19, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1A, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1B, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1C, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2A, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2B, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xF0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x84, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x85, 0x0C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x91, 0x1F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x92, 0x0F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x93, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x94, 0x18);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x95, 0x03);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x96, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB0, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x19, 0x1F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1B, 0x1B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x24);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB8, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x27);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD0, 0x31);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD1, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD2, 0x30);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD4, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDE, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDF, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x26);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x00, 0x81);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x01, 0xB0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x22);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9F, 0x50);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x6F, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x70, 0x11);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x73, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x74, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x76, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x77, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xA0, 0x3F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xA9, 0x50);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAA, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAB, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAD, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB8, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBA, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBB, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBE, 0x04);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBF, 0x49);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC0, 0x04);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC1, 0x59);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC2, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC5, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC6, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC7, 0x48);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCA, 0x43);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCB, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCE, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCF, 0x43);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD0, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD3, 0x43);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD4, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD7, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDC, 0x43);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDD, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xE1, 0x43);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xE2, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xF2, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xF3, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xF4, 0x48);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x13, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x14, 0x23);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBC, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBD, 0x23);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x2A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x97, 0x3C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x98, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x99, 0x95);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9A, 0x03);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9B, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9C, 0x0B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9D, 0x0A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9E, 0x90);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x22);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9F, 0x50);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x23);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xA3, 0x50);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x14, 0x60);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x16, 0xC0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4F, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xF0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3A, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xD0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x02, 0xAF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x09, 0xEE);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1C, 0x99);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1D, 0x09);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x0F, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x53, 0x2C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x35, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBB, 0x13);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3B, 0x03, 0xAC, 0x1A, 0x04, 0x04);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x11);
+	msleep(70);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x29);
+	return 0;
+}
+
+static int elish_csot_init_sequence(struct panel_info *pinfo)
+{
+	/* No datasheet */
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x05);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x18, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xD0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x02, 0xAF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x00, 0x30);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x09, 0xEE);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1C, 0x99);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1D, 0x09);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xF0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3A, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4F, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x58, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x35, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x23);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x00, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x01, 0x84);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x05, 0x2D);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x06, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x07, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x08, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x09, 0x45);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x11, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x12, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x15, 0x83);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x16, 0x0C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x29, 0x0A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x30, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x31, 0xFE);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x32, 0xFD);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x33, 0xFB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x34, 0xF8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x35, 0xF5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x36, 0xF3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x37, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x38, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x39, 0xF2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3A, 0xEF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3B, 0xEC);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3D, 0xE9);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3F, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x40, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x41, 0xE5);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2A, 0x13);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x45, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x46, 0xF4);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x47, 0xE7);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x48, 0xDA);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x49, 0xCD);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4A, 0xC0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4B, 0xB3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4C, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4D, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4E, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x4F, 0x99);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x50, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x68);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x52, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x53, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x54, 0x66);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2B, 0x0E);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x58, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x59, 0xFB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5A, 0xF7);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5B, 0xF3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5C, 0xEF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5D, 0xE3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5E, 0xDA);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x5F, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x60, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x61, 0xD8);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x62, 0xCB);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x63, 0xBF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x64, 0xB3);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x65, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x66, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x67, 0xB2);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x0F, 0xFF);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x53, 0x2C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x55, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBB, 0x13);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x3B, 0x03, 0xAC, 0x1A, 0x04, 0x04);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x2A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x25, 0x46);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x30, 0x46);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x39, 0x46);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x26);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x01, 0xB0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x19, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1A, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1B, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1C, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2A, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x2B, 0xE0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0xF0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x84, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x85, 0x0C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x51, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x91, 0x1F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x92, 0x0F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x93, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x94, 0x18);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x95, 0x03);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x96, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB0, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x19, 0x1F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x1B, 0x1B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x24);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB8, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x27);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD0, 0x31);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD1, 0x20);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD4, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDE, 0x80);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xDF, 0x02);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x26);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x00, 0x81);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x01, 0xB0);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x22);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x6F, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x70, 0x11);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x73, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x74, 0x4D);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xA0, 0x3F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xA9, 0x50);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAA, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAB, 0x28);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xAD, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB8, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xB9, 0x4B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBA, 0x96);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBB, 0x4B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBE, 0x07);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBF, 0x4B);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC0, 0x07);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC1, 0x5C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC2, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC5, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC6, 0x3F);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xC7, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCA, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCB, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCE, 0x00);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xCF, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD0, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD3, 0x08);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xD4, 0x40);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x25);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBC, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xBD, 0x1C);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x2A);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFB, 0x01);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x9A, 0x03);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0xFF, 0x10);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x11);
+	msleep(70);
+	mipi_dual_dsi_dcs_write_seq(pinfo->dsi, 0x29);
+	return 0;
+}
+
+static const struct drm_display_mode elish_boe_mode = {
+	/* Current max freqency is 104HZ, TODO 120HZ */
+	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 60,
+	.hsync_end = 1600 + 60 + 8,
+	.htotal = 1600 + 60 + 8 + 60,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 26,
+	.vsync_end = 2560 + 26 + 4,
+	.vtotal = 2560 + 26 + 4 + 168,
+};
+
+static const struct drm_display_mode elish_csot_mode = {
+	/* Current max freqency is 104HZ, TODO 120HZ */
+	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
+	.hdisplay = 1600,
+	.hsync_start = 1600 + 200,
+	.hsync_end = 1600 + 200 + 40,
+	.htotal = 1600 + 200 + 40 + 52,
+	.vdisplay = 2560,
+	.vsync_start = 2560 + 26,
+	.vsync_end = 2560 + 26 + 4,
+	.vtotal = 2560 + 26 + 4 + 168,
+};
+
+static const struct panel_desc elish_boe_desc = {
+	.modes = &elish_boe_mode,
+	.dsi_info = {
+		.type = "NT36523",
+		.channel = 0,
+		.node = NULL,
+	},
+	.width_mm = 127,
+	.height_mm = 203,
+	.bpc = 8,
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_sequence = elish_boe_init_sequence,
+	.is_dual_dsi = true,
+};
+
+static const struct panel_desc elish_csot_desc = {
+	.modes = &elish_csot_mode,
+	.dsi_info = {
+		.type = "NT36523",
+		.channel = 0,
+		.node = NULL,
+	},
+	.width_mm = 127,
+	.height_mm = 203,
+	.bpc = 8,
+	.lanes = 3,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_sequence = elish_csot_init_sequence,
+	.is_dual_dsi = true,
+};
+
+static void nt36523_reset(struct panel_info *pinfo)
+{
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 0);
+	usleep_range(12000, 13000);
+}
+
+static int nt36523_prepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	int ret;
+
+	if (pinfo->prepared)
+		return 0;
+
+	ret = regulator_enable(pinfo->vddio);
+	if (ret) {
+		dev_err(panel->dev, "failed to enable vddio regulator: %d\n", ret);
+		return ret;
+	}
+
+	nt36523_reset(pinfo);
+
+	ret = pinfo->desc->init_sequence(pinfo);
+	if (ret < 0) {
+		regulator_disable(pinfo->vddio);
+		dev_err(panel->dev, "failed to initialize panel: %d\n", ret);
+		return ret;
+	}
+
+	pinfo->prepared = true;
+
+	return 0;
+}
+
+static int nt36523_disable(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	int i, ret;
+
+	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
+		ret = mipi_dsi_dcs_set_display_off(pinfo->dsi[i]);
+		if (ret < 0)
+			dev_err(&pinfo->dsi[i]->dev, "failed to set display off: %d\n", ret);
+	}
+
+	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
+		ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->dsi[i]);
+		if (ret < 0)
+			dev_err(&pinfo->dsi[i]->dev, "failed to enter sleep mode: %d\n", ret);
+	}
+
+	msleep(70);
+
+	return 0;
+}
+
+static int nt36523_unprepare(struct drm_panel *panel)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+
+	if (!pinfo->prepared)
+		return 0;
+
+	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
+	regulator_disable(pinfo->vddio);
+
+	pinfo->prepared = false;
+
+	return 0;
+}
+
+static void nt36523_remove(struct mipi_dsi_device *dsi)
+{
+	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(pinfo->dsi[0]);
+	if (ret < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI0 host: %d\n", ret);
+
+	if (pinfo->desc->is_dual_dsi) {
+		ret = mipi_dsi_detach(pinfo->dsi[1]);
+		if (ret < 0)
+			dev_err(&pinfo->dsi[1]->dev, "failed to detach from DSI1 host: %d\n", ret);
+		mipi_dsi_device_unregister(pinfo->dsi[1]);
+	}
+
+	drm_panel_remove(&pinfo->panel);
+}
+
+static int nt36523_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
+{
+	struct panel_info *pinfo = to_panel_info(panel);
+	const struct drm_display_mode *m = pinfo->desc->modes;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
+		return -ENOMEM;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+	connector->display_info.bpc = pinfo->desc->bpc;
+
+	return 1;
+}
+
+static const struct drm_panel_funcs nt36523_panel_funcs = {
+	.disable = nt36523_disable,
+	.prepare = nt36523_prepare,
+	.unprepare = nt36523_unprepare,
+	.get_modes = nt36523_get_modes,
+};
+
+static int nt36523_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct device_node *dsi1;
+	struct mipi_dsi_host *dsi1_host;
+	struct panel_info *pinfo;
+	const struct mipi_dsi_device_info *info;
+	int i, ret;
+
+	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	pinfo->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(pinfo->vddio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->vddio),
+				     "failed to request vddio regulator\n");
+
+	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pinfo->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
+
+	pinfo->desc = of_device_get_match_data(dev);
+	if (!pinfo->desc)
+		return -ENODEV;
+
+	/* If the panel is dual dsi, register DSI1 */
+	if (pinfo->desc->is_dual_dsi) {
+		info = &pinfo->desc->dsi_info;
+
+		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
+		if (!dsi1) {
+			dev_err(dev, "cannot get secondary DSI node.\n");
+			return -ENODEV;
+		}
+
+		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
+		of_node_put(dsi1);
+		if (!dsi1_host) {
+			dev_err(dev, "cannot get secondary DSI host\n");
+			return -EPROBE_DEFER;
+		}
+
+		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
+		if (!pinfo->dsi[1]) {
+			dev_err(dev, "cannot get secondary DSI device\n");
+			return -ENODEV;
+		}
+	}
+
+	pinfo->dsi[0] = dsi;
+	mipi_dsi_set_drvdata(dsi, pinfo);
+	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	ret = drm_panel_of_backlight(&pinfo->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	drm_panel_add(&pinfo->panel);
+
+	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
+		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
+		pinfo->dsi[i]->format = pinfo->desc->format;
+		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
+
+		ret = mipi_dsi_attach(pinfo->dsi[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nt36523_of_match[] = {
+	{
+		.compatible = "xiaomi,elish-boe-nt36523",
+		.data = &elish_boe_desc,
+	},
+	{
+		.compatible = "xiaomi,elish-csot-nt36523",
+		.data = &elish_csot_desc,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, nt36523_of_match);
+
+static struct mipi_dsi_driver nt36523_driver = {
+	.probe = nt36523_probe,
+	.remove = nt36523_remove,
+	.driver = {
+		.name = "panel-novatek-nt36523",
+		.of_match_table = nt36523_of_match,
+	},
+};
+module_mipi_dsi_driver(nt36523_driver);
+
+MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
+MODULE_DESCRIPTION("DRM driver for Novatek NT36523 based MIPI DSI panels");
+MODULE_LICENSE("GPL");
-- 
2.39.2

