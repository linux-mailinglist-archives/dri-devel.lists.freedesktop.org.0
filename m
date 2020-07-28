Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E5231296
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5F86E332;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B956E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:16 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id o1so9644317plk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9stfAM+ZdeHh3qDD2ZttFiTlZK9f5XlMjB7C2Y230oQ=;
 b=IlCrX5i3kdsGXTRcTZEioU2wTVLe2QnYkzgYUSvcAqajkHC6du/RlolyPjSYi+1tGT
 bLy+oro58RsI/QMLRKJDDDdfTgTNYk9yTQ4rWqf0SqdKKVaC5Oz4/YPbZx1UQtfe5Hus
 ucKHTB3moUk2x76laFxN6Ol0+CZszRS8rMcCe9OPgBi4URomdBNfcJn1s35xo/N5FugY
 awzGx7Q2FO/fy8cGMcN74eUZ5Ay0dfPj9bYjy5Y0QCFnR80bqxsBMSDWHc2Ba0MvXHXb
 +21d7C5VfIMi17Ay55F37OxtxAbIuu3JXAlv4RUbST4wM8zQLwM+yzmaNt+i3Iub4Dcp
 PsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9stfAM+ZdeHh3qDD2ZttFiTlZK9f5XlMjB7C2Y230oQ=;
 b=PMMDKUPjUseNwZnzfoeExroNXw+1OM9IkDuvf607s7fpDW4au4akcBQdf5ChbedNAP
 4OFPT/UyQyXD5iFWHnlrEuNtrN38hAYN7JT2HcAIwjkyn1Cp/Tz8+3OFkbUFzqI+wznp
 zFce46G41FZK1vvkUijAkzktN2jAlAFdUBwAXNgxIKDncZbuYrIC7dm0UY+Xm3/B25xO
 0kUrKutP93wWXf5odDACORozNeTpLoGJgRt2EDLP24RPamQcPMyaGUKHSdeapnZt3vT8
 SIS/jE6U7Llt9tnoaYvujrZk2NJZqD9cOh057chtrHgS9v436pdhO4rNW63KSeixq5Do
 q0bQ==
X-Gm-Message-State: AOAM530nT9rAOs/i2lTZKw5YhEz1EuBWtKBKBYBiyXcTKcy3WAKEbNxc
 Xx/7lFjw3EjaRj1ItcpiujU=
X-Google-Smtp-Source: ABdhPJzZLlwYKqSfnQbtrST5Aj19ru81oKwhh3BOdIy3UgAspQ7opzxAfjyCQ31aJJObydQ9QI34dg==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr3532882pjz.151.1595930896191; 
 Tue, 28 Jul 2020 03:08:16 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:15 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Tue, 28 Jul 2020 18:07:56 +0800
Message-Id: <1595930879-2478-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dpu.yaml      | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
new file mode 100644
index 0000000..54ba9b6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SoC Display Processor Unit (DPU)
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
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
+    description: A phandle to DPU power domain node.
+
+  iommus:
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
+    dpu: dpu@0x63000000 {
+          compatible = "sprd,sharkl3-dpu";
+          reg = <0x0 0x63000000 0x0 0x1000>;
+          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+          clock-names = "clk_src_128m",
+      	        "clk_src_384m";
+
+          clocks = <&pll CLK_TWPLL_128M>,
+                <&pll CLK_TWPLL_384M>;
+
+          dpu_port: port {
+                  dpu_out: endpoint {
+                          remote-endpoint = <&dsi_in>;
+                  };
+          };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
