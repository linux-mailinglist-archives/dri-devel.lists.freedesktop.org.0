Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB6E1CEDB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619F36E845;
	Tue, 12 May 2020 07:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144896E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:03:53 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x15so5349760pfa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o//dTfJVTpsa5Zo7nPNQBSOusaLkGD86FZMNihxJfus=;
 b=gHte5rVUD6y77Xe/TFwjDfYe9ap4bclJIR3xqi1I4zZijHaTmhe0Gim+Ke3EaFnJXe
 XJUjPVATgmdLPBcdDcR2qvWe2tRzSWZuFX3VmGuLTvYRJYbWD4+vqJebdZlZ0s+4uF/q
 EOsHEQv66zGagOhM3QAwtb5vCkNRPX9YPjRBJiOCej/P6J6Acyko6XtZNeWvFM1CbH2I
 VSToK4mNIq0e1Y1inpqYK+SmtdgxbaFKQe+EzRBulSqHa2pf3fwoMz5qa+5MZbIeK3uV
 YvPxu4ZQgWH6ZHmBADxC/MtYhY7NVcdmzOg40KLgnYVFrmHg+4htNhrzMAMfu+zc8Uei
 VoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o//dTfJVTpsa5Zo7nPNQBSOusaLkGD86FZMNihxJfus=;
 b=SF04NUULM2XMr0rtL6jyPZFzi7/jDMcn6Pgh+1MpAO+vcA8+Dow3O4TxtpBdwC2j3X
 8107cEM2bxo3TTxcblCpJl72ySeVYVrLJkmJMDjuWpa2BvlU3QN1RCSavrbxLPgSieVU
 c5NE0OYFVO46ICC6xA0ow3x/o+k9FAIAtUMHVQL+QQYNRWUyF4q73OjFyJ2N2opxhPoY
 +wVzk+tlBcZC051q6WwtYtTus1Jp3GV2yDlX6jfwJixgR9Dr+f5Jz+qkWFby1CaC7+ZU
 jpLQYx6i9DKRJsTb9AwzH3KId349rYa9cIPNvipFJHXFefPQ35InA6J4Mhy+L0ChZHQe
 X6MA==
X-Gm-Message-State: AOAM531sp0/9zdhs8wQJX0AKEjszN+PmaEg380uw4Wv31bWpoSIBqupN
 5cQrdMRcEiFRC2MFUN8VEC0=
X-Google-Smtp-Source: ABdhPJyvQqwVfnqNh+p34cdkk3VkqZVcQx818ZVzyde7cIL1JuJ8VM2Siydwch4p+f1lnq+Vtm0N7A==
X-Received: by 2002:a63:3c19:: with SMTP id j25mr9279778pga.434.1589267032602; 
 Tue, 12 May 2020 00:03:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:03:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 2/5] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
Date: Tue, 12 May 2020 15:03:34 +0800
Message-Id: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes:

V3:
    change compatible to st,sf-tc240t-9370-t, match #vendor,#lcd_module style

V2:
    verifyied with make dt_binding_check

V1:
    none

.../bindings/display/panel/ilitek,ili9341.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..9f694d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek-9341 Display Panel
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+description: |
+  Ilitek ILI9341 TFT panel driver with SPI control bus
+  This is a driver for 320x240 TFT panels, accepting a rgb input
+  streams with 16 bits or 18 bits.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ili9341 240*320 Color on stm32f429-disco board
+        - st,sf-tc240t-9370-t
+      - const: ilitek,ili9341
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
+                 reg = <0>;
+                 spi-3wire;
+                 spi-max-frequency = <10000000>;
+                 dc-gpios = <&gpiod 13 0>;
+                 port {
+                         panel_in: endpoint {
+                           remote-endpoint = <&display_out>;
+                      };
+                 };
+             };
+        };
+...
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
