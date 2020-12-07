Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA02D25F5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B086E951;
	Tue,  8 Dec 2020 08:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2DD6E860
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:50:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id q22so10179489pfk.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q+XDWKoV9MHFRTeqn/T5sJtop0zObfyxbDEIDUOub8M=;
 b=a/t4WS+UXOw4MusT8Kq3gn+Q4qwCLdI2ylQZsJMGgBF0XZuzKhh8A15IpnvNQEhmBf
 Jhch1zQqElf55Tv5lPhAWTwz4I7y95mdSxihEPRl3212uZU8JG+ibZBx2VHu17V9mmsv
 Z6z9RcCgA7yH/tklZLuiR3JM2mYlh7kLuC2BkwCgalqmYnTRCWZcTMmgiUQkZFE7uAn7
 kA9H4D8+jZ/O7aPn/V8B2xTpNVeV+dwXXThZxUvLQ2UEFl9c+ExBeG1ZiuN+WkonXCyX
 MimL/5K0bdb9qX2EswgHkdTxvclM7mCLpMUkR+ZPT9x6YAFjj/uVVdzDc6zuw8aOvmIn
 kJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q+XDWKoV9MHFRTeqn/T5sJtop0zObfyxbDEIDUOub8M=;
 b=F5sXfBWb/Vx4H2y0jaTWidpk7ryHhIMpZR9YkjQES5tQBjre32TbYyKoDGUqgpQE7n
 Qrns5RHcezvJWRmK0fLRykDSxCgTFBaQM9g9OM6cAlOIyEEE88REEto4tW6tWSBzPDv0
 KiM95schUGOkfXj+O0jHzqsQB5+sHpVbt23bFOSjiM/W8U//Yn2YWYH7yUAiQdvF46fG
 t6u5uP/W3jKPlmw9UzlCCZ/ORJBqc6Vy6XgkEdk7Zq98OLGhxFD3/iIZ4wvLO6TpnlUj
 KPleGo/RauikH48czDKPfqfm1F47TTrsYJ0JUTIYos2g9IWgdD6xOFCPyTsdU87z746a
 0t/Q==
X-Gm-Message-State: AOAM533onSlySNwFb9HHkfQJmTrObfIkHxkX0JAypPaTnSl8w41bwXrA
 t8PwdslLNrDJ0k8BzeP65N4=
X-Google-Smtp-Source: ABdhPJyapXvnIlFnQSDoSn3Mv1vOkBksKLdqOkVzV4BEWWUGxXSejNhG8BAdCLx03cZ8/XO/NrCScQ==
X-Received: by 2002:a05:6a00:1684:b029:18b:665e:5211 with SMTP id
 k4-20020a056a001684b029018b665e5211mr16718994pfc.20.1607352646011; 
 Mon, 07 Dec 2020 06:50:46 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u25sm10360249pgl.68.2020.12.07.06.50.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 06:50:45 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v1 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon,  7 Dec 2020 22:50:23 +0800
Message-Id: <1607352626-26088-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
References: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
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
