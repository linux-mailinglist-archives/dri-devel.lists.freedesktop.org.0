Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E75BAB786
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BECC10E4C8;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="ifyQouFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D0110E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:07 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035523epoutp01cc7e3abb985b19891dc3d087768ac128~p8zF39EoI2952829528epoutp01y
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035523epoutp01cc7e3abb985b19891dc3d087768ac128~p8zF39EoI2952829528epoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204523;
 bh=OAKHIMC+SGgb607BRAlenii1CobqGR9qOX07bcaTIu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ifyQouFSGONTM7Qqzq+msnwCGfAhGfONx4PDxuP83CVvFnrzLo8TvsZjFHNq+mhdA
 ouTs1fgA0IQeOUghS71iWxf/2PjnCqo09nBN+wSAwoLU8e71ZQUg1qmEuWpLu7AEgb
 T408bQus/Cr4pQrlUmbH6ztIxLJVLJKu6TiHikcA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20250930035523epcas5p23c238981ff1efe5bf2c24f04766373e8~p8zFo_kiA2195921959epcas5p2G;
 Tue, 30 Sep 2025 03:55:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cbPN967Dtz3hhT3; Tue, 30 Sep
 2025 03:55:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663~p8zEG_8yz2319723197epcas5p4h;
 Tue, 30 Sep 2025 03:55:21 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035518epsmtip13069665488924124e1d46773ced32431~p8zBxTW5-2942629426epsmtip1Q;
 Tue, 30 Sep 2025 03:55:18 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 01/29] dt-bindings: media: mfc: Add Exynos MFC devicetree
 binding
Date: Tue, 30 Sep 2025 09:33:20 +0530
Message-Id: <20250930040348.3702923-2-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663@epcas5p4.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Introduce a new DT binding file for exynos-mfc

Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
which describes the Exynos Multi‑Format Codec (MFC) IP.  The schema
covers the core node properties, required fields, and provides an
example snippet.

Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
---
 .../bindings/media/samsung,exynos-mfc.yaml    | 77 +++++++++++++++++++
 MAINTAINERS                                   | 10 +++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml

diff --git a/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
new file mode 100644
index 000000000000..fbed987fb9cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos-mfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Multi Format Codec (MFC)
+
+maintainers:
+  - Nagaraju Siddineni <nagaraju.s@samsung.com>
+  - Himanshu Dewangan <h.dewangan@samsung.com>
+
+description:
+  Multi Format Codec (MFC) is the IP present in Samsung SoCs which
+  supports high resolution decoding and encoding functionalities.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - samsung,exynos-mfc            # Exynos920
+          - samsung,mfc_core0_mem         # Reserved Memory
+          - samsung,mfc_core1_mem         # Reserved Memory
+
+  power-domains:
+    maximum: 1
+
+  memory-region:
+    minimum: 1
+    maximum: 2
+
+additionalProperties: true
+
+patternProperties:
+  "^mfc_core[0-9]$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - samsung,exynos-mfc-core
+      reg:
+        maximum: 1
+      interrupts:
+        maximum: 1
+      clocks:
+        minimum: 1
+        maximum: 1
+      clock-names:
+        items:
+          - const: aclk_mfc
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    mfc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        compatible = "samsung,exynos-mfc";
+        mfc_core0: MFC-0@19cd0000 {
+          #address-cells = <2>;
+          #size-cells = <2>;
+          compatible = "samsung,exynos-mfc-core";
+          reg = <0x0 0x19ED0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>;
+          power-domains = <&pd_mfc>;
+          clocks = <&cmu_top 2000>;
+          clock-names = "aclk_mfc";
+          };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 156fa8eefa69..e47016804ac8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3374,6 +3374,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
 F:	drivers/media/platform/samsung/s5p-mfc/
 
+ARM/SAMSUNG EXYNOS SERIES Multi Format Codec (MFC) SUPPORT
+M:	Nagaraju Siddineni <nagaraju.s@samsung.com>
+M:	Himanshu Dewangan <h.dewangan@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
+F:	drivers/media/platform/samsung/exynos-mfc/
+F:	drivers/media/platform/samsung/exynos-mfc/base/
+
 ARM/SOCFPGA ARCHITECTURE
 M:	Dinh Nguyen <dinguyen@kernel.org>
 S:	Maintained
-- 
2.34.1

