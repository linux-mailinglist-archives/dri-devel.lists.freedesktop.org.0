Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB6389802
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E186EE8D;
	Wed, 19 May 2021 20:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242546EE86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:35:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j14so13620388wrq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHNW49TmyZaaRrFWUNtWXt+ZlgbUc2SAp8tKEH8gOoY=;
 b=o3bt4GjXWraSnEy+C9ViC9P14StdEqRMztBo8yt4KXqmgIKa2B6FGstQuPjVjMMwMC
 ThLdrtuT6oddEi3gI/axnzz1d4S3kdhZUOYnTHI1feyuxLVsVdX3b/Ti8ZFg5x9nXnRI
 Mm098zmlkuvhFQBxFQZAoj/JDGDVQpLaz0NRg6qt0Hf2O+32LYqLrKvW9B4gwOeum6Br
 H/5TsIGVkpRlCXsjcjAU5/+BN+C9hHc+SkEMhkX7cFPp3iVX9cT0GKv6yknOKNQKTZ7x
 cKWY1POEUVL/Ux4cNd6q3BrXRDF2R1D0Ahm/dKlucEECJN2XxwFGprlp3w+ezADMMeiq
 hwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHNW49TmyZaaRrFWUNtWXt+ZlgbUc2SAp8tKEH8gOoY=;
 b=Zt7bceqNMs7LTF4wm8I7d/pjoB9X6oVRYxFy1EPlUH2zBBeOL5yw6WzTzprqefwTNZ
 PjC2SzBKjQuCV1U+cGHkssYtFLZT0LxjdhrgpIfdJcjzVkCSmixsiNsa4v3Ujw1/Rjgp
 syVNSXruSdi5rkzAQPpceaqIx8f4OUU4EhZzG/xoWze7De9577P3FxDgKR2/udPJwDMM
 svNR2PWDGvKhxfS4uPXq4jknvTFVXZBtj5BtYcQG750OsIlrQepydCZvtU3ykIpv1N0u
 qx0iEA0BlMSI4hJqDtz6gJTYlPK58GVqQwL730TeX+fmqVGoFhgmU9nyAGBAU30jfiOz
 sOKQ==
X-Gm-Message-State: AOAM533OwsSAoMX3USMGI5PqHRA9zvCv9VtxChaYzfEuPYF5X4+9VdSr
 7seY4RplNklo6m1y3PtI0A6esg==
X-Google-Smtp-Source: ABdhPJzAHcq/7ZxKFF4pjEJZP86gjjMy+kdD+NQ/hRlf+/06xeRDG7FxZP7QHAYkDFynteVfB8HWjA==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr801711wrv.164.1621456553771; 
 Wed, 19 May 2021 13:35:53 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id y20sm7531918wmi.0.2021.05.19.13.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:35:53 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, linus.walleij@linaro.org,
 robh+dt@kernel.org, ulli.kroll@googlemail.com
Subject: [PATCH v2 1/3] dt-bindings: display: convert faraday,tve200
Date: Wed, 19 May 2021 20:35:45 +0000
Message-Id: <20210519203547.837237-1-clabbe@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts display/faraday,tve200.txt to yaml.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Changes since v1:
- added two subsequent patchs fixing issue found when converting
- fixed all issues reported by Rob Herring
 .../bindings/display/faraday,tve200.txt       | 54 ---------------
 .../bindings/display/faraday,tve200.yaml      | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt
 create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.yaml

diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.txt b/Documentation/devicetree/bindings/display/faraday,tve200.txt
deleted file mode 100644
index 82e3bc0b7485..000000000000
--- a/Documentation/devicetree/bindings/display/faraday,tve200.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* Faraday TV Encoder TVE200
-
-Required properties:
-
-- compatible: must be one of:
-	"faraday,tve200"
-	"cortina,gemini-tvc", "faraday,tve200"
-
-- reg: base address and size of the control registers block
-
-- interrupts: contains an interrupt specifier for the interrupt
-	line from the TVE200
-
-- clock-names: should contain "PCLK" for the clock line clocking the
-	silicon and "TVE" for the 27MHz clock to the video driver
-
-- clocks: contains phandle and clock specifier pairs for the entries
-	in the clock-names property. See
-	Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Optional properties:
-
-- resets: contains the reset line phandle for the block
-
-Required sub-nodes:
-
-- port: describes LCD panel signals, following the common binding
-	for video transmitter interfaces; see
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-	This port should have the properties:
-	reg = <0>;
-	It should have one endpoint connected to a remote endpoint where
-	the display is connected.
-
-Example:
-
-display-controller@6a000000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "faraday,tve200";
-	reg = <0x6a000000 0x1000>;
-	interrupts = <13 IRQ_TYPE_EDGE_RISING>;
-	resets = <&syscon GEMINI_RESET_TVC>;
-	clocks = <&syscon GEMINI_CLK_GATE_TVC>,
-		 <&syscon GEMINI_CLK_TVC>;
-	clock-names = "PCLK", "TVE";
-
-	port@0 {
-		reg = <0>;
-		display_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.yaml b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
new file mode 100644
index 000000000000..e2ee77767321
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/faraday,tve200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday TV Encoder TVE200
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: faraday,tve200
+      - items:
+          - const: cortina,gemini-tvc
+          - const: faraday,tve200
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: PCLK
+      - const: TVE
+
+  clocks:
+    minItems: 2
+
+  resets:
+    minItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cortina,gemini-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/cortina,gemini-reset.h>
+    display-controller@6a000000 {
+      compatible = "faraday,tve200";
+      reg = <0x6a000000 0x1000>;
+      interrupts = <13 IRQ_TYPE_EDGE_RISING>;
+      resets = <&syscon GEMINI_RESET_TVC>;
+      clocks = <&syscon GEMINI_CLK_GATE_TVC>,
+               <&syscon GEMINI_CLK_TVC>;
+      clock-names = "PCLK", "TVE";
+
+      port {
+        display_out: endpoint {
+          remote-endpoint = <&panel_in>;
+        };
+      };
+    };
-- 
2.26.3

