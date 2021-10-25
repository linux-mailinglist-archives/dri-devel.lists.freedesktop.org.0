Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC343927F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 11:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088E389D2F;
	Mon, 25 Oct 2021 09:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901E89D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 09:35:26 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id o133so10173250pfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=Vmcu4Az0I9FR2ZZGKOzztPA7QQ+4yo4Y6w25mmAUD7cg82oT3n8O3nTiayNeQDXQzC
 WpcMtf/X74wjNgMlfgQi8p/3PXFHLv5oOeFiJnjzbjLHcLkJT7sD8DRLgP6Dj9gSkBJG
 S8FruKDK5qYZg7FUeUurgtZ71rzsW8fEteOQFEEE8mq45t+jNGRyF9uBNkKMq7zY3HLx
 Cq82uEDRZ1gXQWde534LeLiNhrsB9X7gREXCXUGke4lioNBvtGcBaKi4U/VFxVPCApMQ
 4CqM5ZwIdIxqCA7Fk2LCESyt3ZEliFxGAm1OLRa8hI/mfp294TfxONstuYmcoxb1LWRL
 HhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3VX3I7y9xb7wsw2EFMUi2KX7EoFTuOAW4MR3tKQ32Y=;
 b=mshVM0Z1/9DJmWi2QF7svuqhNUflthIJi36S6AfAl8nT80iWw+grjl2nYRh3c1T0U6
 7iNm3pPqi++QyAR9+Qa8fpjIwcM48cBvn8yvEM2p4N+X8UMRe4Tfxlf/FUE5whiGMwyh
 Q5sK/O4Tld04lUviGdCzs5LMuLSRQrm+H54RPB3fJWF1O6kJ/V9dChkpHpr66n3tSfwV
 QTX5YDiAEkgICminqnjtID7/UB828PtLXR7sgPf6uftrsYlNsNRpDqZYeqA/aNVwEJ+l
 SyvNgHEZc5onrXahjZkQuFzvJwe8iDeILVXZbDMg8rT1LXMLD+VQLQogh8BsN01zUO/W
 KN+g==
X-Gm-Message-State: AOAM533548S6xikjClhDkdenV/gDDyS2NIuqL31LiH273DPaKP5uBp2b
 HrypdGjFOjbZT0I90DQdfb0=
X-Google-Smtp-Source: ABdhPJwi5kemHSSmk3zuYfGYuSIGBaIhEdA3n0Zfwe7jGo6a8HRkfjZ1C/bXvRBITc7K92ViEQX0EQ==
X-Received: by 2002:a63:7f0f:: with SMTP id a15mr9354923pgd.9.1635154526201;
 Mon, 25 Oct 2021 02:35:26 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:878:6a2:e0f0:8dca:6977:afd5])
 by smtp.gmail.com with ESMTPSA id c9sm15446100pgq.58.2021.10.25.02.35.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 02:35:25 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 25 Oct 2021 17:34:15 +0800
Message-Id: <20211025093418.20545-4-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211025093418.20545-1-kevin3.tang@gmail.com>
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,sharkl3-dpu.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 000000000..4ebea60b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc Sharkl3 Display Processor Unit (DPU)
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+description: |
+  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+  which transfers the image data from a video memory buffer to an internal
+  LCD interface.
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: clk_src_128m
+      - const: clk_src_384m
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DSI.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dpu: dpu@63000000 {
+        compatible = "sprd,sharkl3-dpu";
+        reg = <0x63000000 0x1000>;
+        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "clk_src_128m", "clk_src_384m";
+
+        clocks = <&pll CLK_TWPLL_128M>,
+          <&pll CLK_TWPLL_384M>;
+
+        dpu_port: port {
+            dpu_out: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
+        };
+    };
-- 
2.29.0

