Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AA5134B0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4992510E855;
	Thu, 28 Apr 2022 13:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3610E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:16:47 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 23SDGYqj005923;
 Thu, 28 Apr 2022 22:16:34 +0900
X-Iguazu-Qid: 2wGqsJ4YeyRgLo03tY
X-Iguazu-QSIG: v=2; s=0; t=1651151794; q=2wGqsJ4YeyRgLo03tY;
 m=SYvkMgjPSSPEN+Bzc42nEfYVR1JFYB06GyV1TrVNbLA=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1111) id 23SDGXxC011000
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 22:16:33 +0900
X-SA-MID: 3363559
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/4] dt-bindings: soc: visconti: Add Toshiba Visconti DNN
 image processing accelerator bindings
Date: Thu, 28 Apr 2022 22:11:25 +0900
X-TSB-HOP2: ON
Message-Id: <20220428131128.5053-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds the Device Tree binding documentation that allows to describe
the DNN image processing accelerator found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../soc/visconti/toshiba,visconti-dnn.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml

diff --git a/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml b/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml
new file mode 100644
index 000000000..28576a55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml
@@ -0,0 +1,54 @@
+# SPDX-LIcense-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/visconti/toshiba,visconti-dnn.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti DNN image processing accelerator
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |
+  Toshiba Visconti DNN image processing accelerator.
+  Visconti5 have up to 2 DNN units.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,visconti-dnn
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  index:
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - index
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dnn0: dnn@14280000 {
+            compatible = "toshiba,visconti-dnn";
+            reg = <0 0x14280000 0 0x8000>;
+            interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+            index = <0>;
+            status = "disabled";
+        };
+    };
-- 
2.17.1


