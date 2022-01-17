Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D130491193
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639BE10FF94;
	Mon, 17 Jan 2022 22:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FDB10E150
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 11:21:32 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so10289765pjl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCp1Yld/vpc2MEgC67K2Cu0TtaZ+rl5TSq3oT9JL66c=;
 b=DySnb2akplB5B2gFkfTkn9N7CWEm3VhLRDOcyWKHwInQ+Jl941EHqwXnklWSzLYcMj
 Xx+9z1LWwSdSYYO29yOskFpwRZfDdtomwz8dhJKo5rAmaBxIG9zWvi+QjmluFOz4q+7H
 O3a8Pt16MC1MY14u8Do9KH3Glx6plCsujTXlbOXqE5m38ZJsU/6u7JWlT/QauTt5ZSoB
 H8P7SoGm1zvFKMex3Gil13uD7TPPmYTl/P7lqaQFBhIi3+3N+eQ78v2N1rcay/ZS/r97
 2P2N1rFAvoWiqu+wcmeEWYXZwPu+BrGyrkLLuJClmbJ9OYErBmPiyk0XhtUZkAYUaFTM
 Lkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCp1Yld/vpc2MEgC67K2Cu0TtaZ+rl5TSq3oT9JL66c=;
 b=sCpDKXBDLzAQ2mHuOjtAUmKrTxpynqdlOt10e1rMk35TaWvp44KcGf/NNdKPSkS8R6
 4whdjAQZvIWZA0qjJ4BpSHHFC2BVSzerviMd7KeEj3Lqjryvf0qHfzM/Ijk3FQT8T9Y5
 TGVpy9MfhqGMp3TbqnVModH1xV4E4hjfTTrg+/7SQLf/qKTpRZq3O7/7NTd7HMsI/bBM
 k4o5+w3nnxlKrwUJcg7aOIW7DuKAp52b/JLj+bx1WGhMLE7XC8pQf8R73Cq3CaJ3WFjH
 8x6wfqgFPQ/krF7w3+sWTY9Go7m50QeVtih1dX3R3Cgt8dBvCV/Jn/BunnZLi+jDAJ1m
 605w==
X-Gm-Message-State: AOAM531+Ei4yqQGwGvrYRL5H+w2NvElD8gfG0xMVNtT66AWGr0iGcqsf
 sQ6zXb0HxlFn+B0lNHoLr74=
X-Google-Smtp-Source: ABdhPJxaYCEXTeRD+ovcFEEJTeAhoTOAiDir6d7G3UF3S7wnWg0yP70GSg56NZlduFTxdHgGhvmW2g==
X-Received: by 2002:a17:903:1d2:b0:14a:8c22:cd11 with SMTP id
 e18-20020a17090301d200b0014a8c22cd11mr17419729plh.118.1642418491854; 
 Mon, 17 Jan 2022 03:21:31 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id j6sm3991599pjn.20.2022.01.17.03.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:21:31 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/panel: Add panel-edp: add lcd innolux,n140hca-eac
Date: Mon, 17 Jan 2022 19:21:24 +0800
Message-Id: <20220117112124.2358888-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rex Nie <rexnie3@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

innolux,n140hca-eac is a eDP-based LCD panel. This panel has 1920x1080
resolution in 14-inch TFT panel.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
---
 .../display/panel/innolux,n140hca-eac.yaml    | 43 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             | 26 +++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
new file mode 100644
index 000000000000..5493e383c97c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,n140hca-eac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux N140HCA-EAC 14 inch eDP 1080p display panel
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+  - Douglas Anderson <dianders@chromium.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,n140hca-eac
+
+  enable-gpios: true
+  power-supply: true
+  backlight: true
+  no-hpd: true
+
+required:
+  - compatible
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel_edp: panel-edp {
+        compatible = "innolux,n140hca-eac";
+        enable-gpios = <&pio 96 GPIO_ACTIVE_HIGH>;
+        power-supply = <&pp3300_disp_x>;
+        backlight = <&backlight_lcd0>;
+        no-hpd;
+    };
+
+...
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 176ef0c3cc1d..3682986608dc 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1303,6 +1303,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct display_timing innolux_n140hca_eac_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 80, 80 },
+	.hback_porch = { 190, 190, 190 },
+	.hsync_len = { 60, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 38, 38, 38 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n140hca_eac = {
+	.timings = &innolux_n140hca_eac_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+};
+
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
 	.clock = 206016,
 	.hdisplay = 2160,
@@ -1682,6 +1705,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,n140hca-eac",
+		.data = &innolux_n140hca_eac,
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-- 
2.25.1

