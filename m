Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB44C9CEE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 06:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468B010EA59;
	Wed,  2 Mar 2022 05:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5065D10EA59
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 05:11:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o26so680377pgb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 21:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VXYJujKtr44YtvQDoOdyVAgb3HOMrNGPu6HPM67Z31Y=;
 b=CI94sNlicCE8vnH2iXXu/anR1zPHMrfYfeJ8eYUU3X/4KZi2brqoqABHB4WVln2xQZ
 ZFO4w6MPQZrevm9xFmyWD1byh/PR8/zc1QJfDdj4rLDLQBh63r1aaK/WbVvI5aMqh2hG
 g6r64kFoS1XKPXSEelOx6A3j/7HV4OGWdu5b3c/68jXo0wGCriRFWqYGuKMhvHlzdedg
 +NiVerY1Exf3V7mq+IbTNjbJ1nXEZh2RvgPfmvn5QqGCmhhET3Bgp8A26nf65A0AxACY
 W5EbC3W2R6fNIaSwE6M7Gf5lBQJ7k509gopNRxsbq6rkmSYbIQ9/ziSsZXaFo4jgwQ8H
 TVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VXYJujKtr44YtvQDoOdyVAgb3HOMrNGPu6HPM67Z31Y=;
 b=iBwuTRcqAflqq1fsBJ19fPziBi5Y5qno4RG3vEjc+HhWjyXuJOIeXwoaDJBUZIed91
 3SSyqW6qF+QVo67tdJMOLzJutCrEBzDjRyiEILzidqbHWMW9blwJCP/wkYlY2oV1PyzT
 iptzhG6Ks0FtpsIoqRkyNGU1Y+24Xke6q20SryEFKHopPUK1TWsscsEeacdFtJrKwXhS
 YumGXaKqXoNFdrf42h/zgv2c05XEZNQH25UHqYk99c5aB/7J8jI01T4LiGHvcME6R/7g
 vhJkoAkcaho44RIuEoD5TkIZKFchxJuqIULatEPEl/iNhxgahcNO3bRCZIMxTM68X0OC
 P1NQ==
X-Gm-Message-State: AOAM533cvRtqb3O8uYUfwiPFwyxXDgyPZgmcmszbJpZjq8LsG9Dy3LG9
 9mQZAKRucuyNpLUKIQmE8b7q2YyzWPm7HA==
X-Google-Smtp-Source: ABdhPJxLjPxHaXKauIVKY96fVaLPwD3J1+P2lCyvRvSZNfehciKkFmVCRLxs1Ww9G/4haOE/E0ZtMA==
X-Received: by 2002:a63:cc52:0:b0:372:7f35:cf84 with SMTP id
 q18-20020a63cc52000000b003727f35cf84mr24662539pgi.211.1646197869757; 
 Tue, 01 Mar 2022 21:11:09 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm3386177pjb.46.2022.03.01.21.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 21:11:08 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Tommy Haung <tommy_huang@aspeedtech.com>
Subject: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
Date: Wed,  2 Mar 2022 15:40:56 +1030
Message-Id: <20220302051056.678367-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the bindings to yaml and add the ast2600 compatible string.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
 .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
 2 files changed, 69 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt

diff --git a/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
new file mode 100644
index 000000000000..8ddc4fa6e8e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/aspeed,gfx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED GFX display device
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2400-gfx
+          - aspeed,ast2500-gfx
+          - aspeed,ast2600-gfx
+      - const: syscon
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  memory-region: true
+
+  syscon: true
+
+  reg-io-width: true
+
+required:
+  - reg
+  - compatible
+  - interrupts
+  - clocks
+  - resets
+  - memory-region
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/clock/aspeed-clock.h>
+   gfx: display@1e6e6000 {
+       compatible = "aspeed,ast2500-gfx", "syscon";
+       reg = <0x1e6e6000 0x1000>;
+       reg-io-width = <4>;
+       clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+       resets = <&syscon ASPEED_RESET_CRT1>;
+       interrupts = <0x19>;
+       syscon = <&syscon>;
+       memory-region = <&gfx_memory>;
+   };
+
+   gfx_memory: framebuffer {
+       size = <0x01000000>;
+       alignment = <0x01000000>;
+       compatible = "shared-dma-pool";
+       reusable;
+   };
diff --git a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
deleted file mode 100644
index 958bdf962339..000000000000
--- a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Device tree configuration for the GFX display device on the ASPEED SoCs
-
-Required properties:
-  - compatible
-    * Must be one of the following:
-      + aspeed,ast2500-gfx
-      + aspeed,ast2400-gfx
-    * In addition, the ASPEED pinctrl bindings require the 'syscon' property to
-      be present
-
-  - reg: Physical base address and length of the GFX registers
-
-  - interrupts: interrupt number for the GFX device
-
-  - clocks: clock number used to generate the pixel clock
-
-  - resets: reset line that must be released to use the GFX device
-
-  - memory-region:
-    Phandle to a memory region to allocate from, as defined in
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-
-Example:
-
-gfx: display@1e6e6000 {
-	compatible = "aspeed,ast2500-gfx", "syscon";
-	reg = <0x1e6e6000 0x1000>;
-	reg-io-width = <4>;
-	clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
-	resets = <&syscon ASPEED_RESET_CRT1>;
-	interrupts = <0x19>;
-	memory-region = <&gfx_memory>;
-};
-
-gfx_memory: framebuffer {
-	size = <0x01000000>;
-	alignment = <0x01000000>;
-	compatible = "shared-dma-pool";
-	reusable;
-};
-- 
2.34.1

