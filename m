Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C766F49498E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AFC10E89C;
	Thu, 20 Jan 2022 08:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068910E8B7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:34:11 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso5575644wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhUmQjlVEm98FuejkV49ied/cxReTiKl0adLMVVp/04=;
 b=Y42GihL3YeLZb7uOM3lU8skBE5QQEe7cNwRcCy0HbdHWbxuACLx6rCIJ7ZlZRc+i5y
 VNKL2Pn4Ndxc7/9dEOr6Zw9maTwRAc5j6bbpGDBcBkZfq7iGzYP2yvuJBMPxhd+mig9E
 uTsIEPSARAXp6Q6m3wMfzf2aHGi15lXF1HSwbzaGdGdQWIjRfblf7m6vkObCXhpGKtO9
 1xwxeEKHJUzRVR9gxU3aVOvx8vp7yzbEcHitPn7vAgRWJzaccbTWW905+N21KN9b3EkT
 f39NLJ0EYUQR5FpW+axFTzVh23rP/jnArwSCCzYq3huXQcKLfyLMjKv8SuR6zE3EYvdu
 Iutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhUmQjlVEm98FuejkV49ied/cxReTiKl0adLMVVp/04=;
 b=6sci54OsXd/zpaHFAJpwUqpnadAcA9ui/E9AQ0ffKUQwfG9k3OSsPZf6p6iP9KQPxq
 lkMsLsyPmCimLRfBOl1uFEN/dJa18OEmuoINEqgiFeBpsJbgtrD7CjfMqTbP9+kcu1Vi
 eMqppcEaJka97IN/6HOJwqk0L5iZd9AKcZ31y10ZlJGXfW+yRDjFkmk05ZfOdvxN8jAj
 sgb2DwENWiqp+jkDh1TM/6E11tURnczm+8DU0zyvNWc8kvZPxLEcef7qnT/mECDr/ijg
 YHeCVe0OMHKKL1Q9BFEol/mCZ90YEV5RDd35OYdFzaOK8U1XjmFKpouiPng+1VTuUW2q
 4ifw==
X-Gm-Message-State: AOAM533HcrA7aGEyrKFjkDN0UsMWDLvaQJr1PexCy0irULaDx7PreNSQ
 +Ri64BJZvtYUbPTNsrDJ6xTCNjaDg3Caug==
X-Google-Smtp-Source: ABdhPJyZC1bKOAl9gpX++fV1urhuFYoqoxlV8kFLB45AN5ZXdk0Gt49gPUaC4fSIBNIPuRC2+YZDBw==
X-Received: by 2002:a05:600c:3d9b:: with SMTP id
 bi27mr7592930wmb.36.1642667650031; 
 Thu, 20 Jan 2022 00:34:10 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Date: Thu, 20 Jan 2022 09:33:52 +0100
Message-Id: <20220120083357.1541262-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532; h=from:subject;
 bh=nfzFDo4vSJe6xj0FTwEJ/U/lIAnr1DaEgJJpcHdVaxw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2HY5ZuFCHuvgCYy0WNIdOndZlC1wP7beVGnIlw
 N220U86JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdhwAKCRB33NvayMhJ0fFMEA
 DL88tmgR+ibybnnUB80PN5R7nYIMoWYyi7G9P96HUH0rg1ZSKt8xZjDvTWZ5Mu2jRSzx4JPL0trLwP
 Pd0fIEwl9GDLdZvTBN8z6tG8XA4oN+IYzxO9Mr2ahLj2Y+Vt1I8sLwu2DEJVrfUytQkbiemOjwHfU3
 v83Su7MHGk4VNjDkW14KLnHp9D2khQQeXuRb7NaDpT5qjbHJLX9e+dJ8XvoLeHUCCW49h1ndd/B2tU
 YM86fgTy52FNr/gccY8B+35jwy3mfIWIwxYDJlAWeP6he51KvHCGMIGgB6dY3tR3wd0U6gtFJjMd0M
 ejgvyiaAmm2DniNpxD/cRbAFbUBQGWGRK8yedVrrNEMhWqOs7Kt78eEUDnUOIhjep5ARt+zJ/gJxPF
 AQOU0a0q4HCjkDoKavdmzADEUFOMfRDkcgeOnt/irj+ybg2rpOMqQzH3/oKsTdmPy+u6arMYrdSC/D
 yujqmVRg9v527fWkEH8bSIf7lKg+zqD4hUv4NWxEiy7/zsiU5zAYkBo86cHL1g6xE2KJWcnY2zsF8k
 7RGmD2Nd1r2ZJNP3j9Z843W5OY0PuTsP972KMMkEaz0pP0Lv6SFOOu7A/ibol68PPQtQws7gZurDay
 buWGws0Z8TzWI8xpQbEHlPfSuMyZQDIfjugE5kCOuZpuUuyTLlzgKwEvjlhA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
on the same Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..e057659545a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson Synopsys Designware Integration is composed of
+  - A Synopsys DesignWare MIPI DSI Host Controller IP
+  - A TOP control block controlling the Clocks & Resets of the IP
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-dw-mipi-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pclk
+      - const: px_clk
+      - const: meas_clk
+
+  resets:
+    minItems: 1
+
+  reset-names:
+    items:
+      - const: top
+
+  phys:
+    minItems: 1
+
+  phy-names:
+    items:
+      - const: dphy
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input node to receive pixel data.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DSI output node to panel.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@7000 {
+          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+          reg = <0x6000 0x400>;
+          resets = <&reset_top>;
+          reset-names = "top";
+          clocks = <&clk_pclk>, <&clk_px>;
+          clock-names = "pclk", "px_clk";
+          phys = <&mipi_dphy>;
+          phy-names = "dphy";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              /* VPU VENC Input */
+              mipi_dsi_venc_port: port@0 {
+                  reg = <0>;
+
+                  mipi_dsi_in: endpoint {
+                       remote-endpoint = <&dpi_out>;
+                  };
+              };
+
+              /* DSI Output */
+              mipi_dsi_panel_port: port@1 {
+                  reg = <1>;
+
+                  mipi_out_panel: endpoint {
+                      remote-endpoint = <&mipi_in_panel>;
+                  };
+              };
+          };
+    };
-- 
2.25.1

