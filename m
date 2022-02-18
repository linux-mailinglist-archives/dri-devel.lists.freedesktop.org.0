Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FD4BB280
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 07:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC3310EFF9;
	Fri, 18 Feb 2022 06:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9719010EFF7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:36:17 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so7655127pjm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQbAoqa1KwsbzMCJZPl0QEWgqTPAIhCjokqucaj50oY=;
 b=AYiuXzt+VjjBbC8zDKNraQA+ivOdwWihW359vxsCkXzMcRx2t7py4bkBRZjgd+W/xV
 +zZUcRr0FejKug0DGu7gQNZ9WG7i317125t/vZiO3jacVxigNHyPNZImGAoNeCHdEN9R
 1YYRi20EyMR++891bATZSZ9pEWDhHp8OM//irMJSflSfAJjjzjB5EbyVKEoIMnSornb5
 /ffUzCTkA2tLG8DUVFgMI+U/5LIfROe1HYM0lVpBcNiHYLLeUSokukLWRnHD+mRJuRr6
 fo67qJQuI4XvqqASObdLtKshonxZ2RgQPS2A0zdsJD86x/SdGzRkrQuKzyDx9bFKjlzf
 r5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQbAoqa1KwsbzMCJZPl0QEWgqTPAIhCjokqucaj50oY=;
 b=7we296KSbjfQrYbQQHIggrzzFW3BbRCzV9X06etYCj2hEQjXAcqbCLbrVGGq0jvTHX
 tQIPYLY0h0FE/kN9jcr3WdG96Y1EAlC7/rtW6n/+cVCqQGjAPBXs9bcu1xzABRURj464
 9hsUSb3xBe3Y/r5+xi0MyF9LS/2ax1Fi7xF5E4fVx37gQoaxzmNlzmxrlYbaxDSTsPmB
 HPpH05a8+bO8SRJggQ6aml13e83VgbKOT6VSEBofErp3mZQ2ZVDKLsTAXqnhY0ScdU0u
 4lo0olGgtAFzI7ZXDI0Gxk670++15Wl+bx8HPTeWhZ02jqlsUyD05VQz1p6M88j5kVsC
 dL9g==
X-Gm-Message-State: AOAM531O4yPIAgAV3RVE0sbeMirZqUaB7v7iKys7aiKEIfi1z+WnaFGw
 AQ5LcU9/2o1ReWfURdVyYqM=
X-Google-Smtp-Source: ABdhPJybcMeibfzO9kHX/YbZmh51OF4KbpZX/mTydmB1H9MdHMPIId3WfgzwMptueR01D0dG5cCTBQ==
X-Received: by 2002:a17:902:930b:b0:14d:b0c0:1f71 with SMTP id
 bc11-20020a170902930b00b0014db0c01f71mr6270349plb.113.1645166177121; 
 Thu, 17 Feb 2022 22:36:17 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id a29sm9664298pgl.24.2022.02.17.22.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 22:36:16 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/panel: Add panel-edp: add lcd innolux,n140hca-eac
Date: Fri, 18 Feb 2022 14:36:10 +0800
Message-Id: <20220218063610.1530630-1-rexnie3@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, hsinyi@chromium.org,
 rexnie3@gmail.com, sam@ravnborg.org
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
index f7bfcf63d48e..f5f9c9cb26ba 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
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
@@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] = {
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

