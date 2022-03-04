Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E04CCA64
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40A210E3C2;
	Fri,  4 Mar 2022 00:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3197410E3C2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:03:36 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p17so6229705plo.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 16:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4Na1N1IMcDiqM3XRO5aUsCt6DvAkHmrn4n5xsrfFdU=;
 b=aksTpisVOu8Uh3NepbnfMUB9aa45qUzmbOgSd4baOPEjlXfuyqmztPiilq2fGdJh6w
 5puTwtz4TuAJIObrFm4cf0Alz0Cp0cSO1zD8H8fdGAHce0D1HGDRsUBnOuLCuc3kfEqA
 684NIdrTHa7dsL4qQsUO60+rl8IXloVdWy9QjHk23YCSkT8Bhq64ujbbk31Ix8nmJPIm
 TWobxtxzNg7fQTM7QuFeZ93UF6UC9m89KY0kV22sAP+2DGYrDtjpBzupiGmbvqSFZHZN
 ozPxsQM8F7tkkjl7F/r5Bf07TG1p5xPGrnbxsj2Ph21ao6/ADl8TVNSmj80xycqyoJFT
 OeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i4Na1N1IMcDiqM3XRO5aUsCt6DvAkHmrn4n5xsrfFdU=;
 b=TC6wfUPZPtEn3SIvsLiZnU8hTL95aXJDuzto0ZeKaal+VceR8edSObGr0oChkyxibk
 e1DYGxumLyAm1swm5g5VaXAv/QHe4Hm0JVB2/6mUk5doYjILuXbpcxpvLIA0OXNDiDPb
 f+Ey+lDYE5WC1uEjeaBDFWsHrL4M/s613edBQy9bYyphLwFyqgRN+4rojBD0AL8Rkvvv
 Hzxq4wkCXM3o/FL2JcFb/IXEHWWUXa+EPmipoKjF+ASQyIYtOmbww5ZDBxov56RlrYh2
 /jfzsADHeJAtCDqE8xzqtVp8dgyH75IpF8NqWVy7z+jjZaqzOmmW4dD9KlfiobZsaTKA
 0Ruw==
X-Gm-Message-State: AOAM532BLoDVYezvddUQ5KlrufEF3tSmgYN6e4ZSZVfPG4P+aDfQlBSJ
 ofBzddJuBWXOvSQIRkQCL4g=
X-Google-Smtp-Source: ABdhPJyFQ7V0jyTkRptySF21wS+UPkx2IVBsSDOyqX7OEgOlQYE3EIIDIJ180eGmwMlEgjVLq8JPmQ==
X-Received: by 2002:a17:902:ef4d:b0:14f:e82b:25fd with SMTP id
 e13-20020a170902ef4d00b0014fe82b25fdmr38376369plx.80.1646352215575; 
 Thu, 03 Mar 2022 16:03:35 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79588000000b004e1dc67ead3sm3579070pfj.126.2022.03.03.16.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:03:33 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/2] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
Date: Fri,  4 Mar 2022 10:33:11 +1030
Message-Id: <20220304000311.970267-3-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304000311.970267-1-joel@jms.id.au>
References: <20220304000311.970267-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the bindings to yaml and add the ast2600 compatible string.

The legacy mfd description was put in place before the gfx bindings
existed, to document the compatible that is used in the pinctrl
bindings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
 .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
 .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
 3 files changed, 69 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

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
diff --git a/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt b/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
deleted file mode 100644
index aea5370efd97..000000000000
--- a/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device tree bindings for Aspeed SoC Display Controller (GFX)
-
-The Aspeed SoC Display Controller primarily does as its name suggests, but also
-participates in pinmux requests on the g5 SoCs. It is therefore considered a
-syscon device.
-
-Required properties:
-- compatible:		"aspeed,ast2500-gfx", "syscon"
-- reg:			contains offset/length value of the GFX memory
-			region.
-
-Example:
-
-gfx: display@1e6e6000 {
-	compatible = "aspeed,ast2500-gfx", "syscon";
-	reg = <0x1e6e6000 0x1000>;
-};
-- 
2.34.1

