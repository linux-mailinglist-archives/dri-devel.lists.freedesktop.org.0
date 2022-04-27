Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A7511855
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F7D10E8B7;
	Wed, 27 Apr 2022 13:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1114.securemx.jp [210.130.202.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023510E8B7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:29:12 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 23RDSqVA009238;
 Wed, 27 Apr 2022 22:28:53 +0900
X-Iguazu-Qid: 2wGr4Oa00fx9XzPiVd
X-Iguazu-QSIG: v=2; s=0; t=1651066132; q=2wGr4Oa00fx9XzPiVd;
 m=nwZjeysEFhDZNLuNwJjFM27BefwGI4Ax4ET4+IPW4ws=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1110) id 23RDSp6v026492
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 22:28:51 +0900
X-SA-MID: 36913145
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 1/4] dt-bindings: soc: visconti: Add Toshiba Visconti
 AFFINE image processing accelerator bindings
Date: Wed, 27 Apr 2022 22:23:42 +0900
X-TSB-HOP2: ON
Message-Id: <20220427132345.27327-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427132345.27327-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220427132345.27327-1-yuji2.ishikawa@toshiba.co.jp>
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

Adds the Device Tree binding documentation that allows to describe
the AFFINE image processing accelerator found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../soc/visconti/toshiba,visconti-affine.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-affine.yaml

diff --git a/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-affine.yaml b/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-affine.yaml
new file mode 100644
index 000000000..a446e1c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-affine.yaml
@@ -0,0 +1,53 @@
+# SPDX-LIcense-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/visconti/toshiba,visconti-affine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti AFFINE image processing accelerator
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |
+  Toshiba Visconti AFFINE image processing accelerator provides affine transform, lens undistortion and LUT transform.
+  Visconti5 have up to 2 AFFINE units.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,visconti-affine
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
+        affine0: affine@14000000 {
+            compatible = "toshiba,visconti-affine";
+            reg = <0 0x14000000 0 0x8000>;
+            interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+            index = <0>;
+            status = "disabled";
+        };
+    };
-- 
2.17.1


