Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6930E27A83B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5823B6E40F;
	Mon, 28 Sep 2020 07:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EA86E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:28:01 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id fa1so37422pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dpkNk9YltVAY63g2nofiwaj/byf6XXtmodzYhSGCnXs=;
 b=AcuW8gR2SnqEkikx4G6DRGDvFTTkSsUu53QPV1fLpLYX/bPpffiOiSg0fzP6EPu+hp
 9+NaLvDTXj23Vig48QrgYFJN+RgB3cxQSfRfuQuqxjrUI190O6g2jPnkjxAOy6cSs0N/
 wfmuwsurlupReYN1Vvdx59xbyphKWrHqoLPjl0uQWKxfeYH/aTpP0gXaxW5KUaD1hbFr
 E1zw47XKvxyKpFHW8GhLnJtrddYV501wKjFfF3dYVcuIjCRSRyg218UzHjhfZGBomPdr
 LHk/68mH4WVv5PaXUleP0npTjxwwO2qfFviClaAxsPHMj7OzPAnivt9MWfgquZM/wDxH
 ZxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dpkNk9YltVAY63g2nofiwaj/byf6XXtmodzYhSGCnXs=;
 b=fyhKlmpVjwU+ei31pLhOxtXDwIfaRM1LPQbcUYtedYEPQ1UZsl3SGXjoDbERF9y98w
 eg6rgC0flCIl5bKBGCALotSnSZlwrBU+iV44+k8VD6f6QfB2hsTEtbBAIZU2HZKZk4M6
 wAlLQW1lAA2Ed2YK09lfr7ta/Sf8G4UW7vVaQ4iiKZbpzd7koV9eOOCBzSEdjitLdZZX
 ZoNBK0WetpgYqW+E43sC6vBGwIz80MKuqPZBt3jagGoQZEs2ryZJgZWxzrQyIS5/iAeK
 /jRLmY7WiHI2juPsItM4L26oF8W9tsEgyxO8kF5L+/ZpNhV54olj7Rbb7+PYKTQu4+bh
 r09Q==
X-Gm-Message-State: AOAM532CI5c4vlfhPKTY0ccAlnjNUmE9ydadRhxIjqhi5HOjq9KclNC5
 a5vg3xoysXMANZe8taeOVAk=
X-Google-Smtp-Source: ABdhPJx1l0zo0HWax0z23IHuyBYJgAaq8oyonW/pD7FZU0pR/Mp4+eN0cuYPenouLIsiM/JlvxKrgg==
X-Received: by 2002:a17:90a:ba06:: with SMTP id s6mr6020pjr.13.1601274481241; 
 Sun, 27 Sep 2020 23:28:01 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id il14sm5712509pjb.54.2020.09.27.23.27.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:28:00 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v7 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 28 Sep 2020 14:27:37 +0800
Message-Id: <1601274460-7866-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

RFC v7:
  - Fix DTC unit name warnings
  - Fix the problem of maintainers

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 0000000..a9052e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -0,0 +1,83 @@
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
+    description:
+      Physical base address and length of the DPU registers set
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt signal from DPU
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
+    description: A phandle to DPU power domain node.
+
+  iommus:
+    maxItems: 1
+    description: A phandle to DPU iommu node.
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
