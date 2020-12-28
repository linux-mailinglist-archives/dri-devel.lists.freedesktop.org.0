Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FC2E35D9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CBF89B42;
	Mon, 28 Dec 2020 10:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C294897F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 10:02:12 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id r4so5400454pls.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vv0Tt7wUhLrWCRhDSflLKD0bX0DOHnjLkBF71kuu380=;
 b=vCTTnj7+GzOvNpAKrMVp2zDe4HA4xPfrZFuIio2ouwLZxOo6rLpSMbinORbG9ZBEUP
 cdeJWKiSVj9siXQ9tOpWstpC90V4I2viYeoYw6YANB2apV0Hpz8FGZcAVdS5xnTMyoEf
 LUOwykxJHhEtOAVT/KGSi+Ui3RjsXcxTsnpfBQbgw8j9NO6jC4TSw4BpDQAZkTw2/g6a
 qBzsW7xTYMHF0LcB+GT1HF4oV7FIQRFS+iGmXS7YklajLThkCGbK9WFGLd/NhB6MC4fR
 tsi7vJOloi0wVlELTJ3QFZsA2/NPSXdsen31F60+NYuy4lOixpiHH7JXEvxEeScG+G3C
 8sOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vv0Tt7wUhLrWCRhDSflLKD0bX0DOHnjLkBF71kuu380=;
 b=OxX+O+erfBIOc/PbzldUwiM7ueGbhoBFqf87BDWfE3leWXDq281io/SUB6KaVz/0iN
 V/+6q2zBFS6E5LnZNe+Lnl2j5+PgkKIYX5i/0onXvgNTVcRhmmy3Fji3BFtmZCpjwxE1
 xaWsckXIniQLpJ0JqLUGIRsMpzkv11C80qoWsb+sJQn6ENV2HI5/3KgA/TzyPLrexdUu
 xmK3mKD7RvhwKeylQPy9tgifKxjfZS53Gzl1WN4Lw+3BVGrYzhWiuLsmgCHwTDOPy6DQ
 QATnm/6nQf+xoKyBzQZ2bh7zG+DlrtbYhVoxQnKz5ZjOueNik5QKaNSva6f43J7yKE8b
 4Tkg==
X-Gm-Message-State: AOAM532qRomQNsiowQR5uUuWus9OzdRFqUihhPUp1A6aejbsuAnFyRh2
 fVWzSCT22XYNCo54FeKd0fo=
X-Google-Smtp-Source: ABdhPJyyhLUIkAER5gLVdEXNUusmZUYOGsbveXGxvMUfapz4nXPGbqCn5VWjPq1NEDkUiCNDhj28uw==
X-Received: by 2002:a17:90a:4:: with SMTP id 4mr20557128pja.19.1609149731767; 
 Mon, 28 Dec 2020 02:02:11 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id s1sm33775240pjk.1.2020.12.28.02.02.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Dec 2020 02:02:11 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v2 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Mon, 28 Dec 2020 18:01:44 +0800
Message-Id: <1609149707-21411-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609149707-21411-1-git-send-email-kevin3.tang@gmail.com>
References: <1609149707-21411-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
new file mode 100644
index 0000000..4ebea60
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
