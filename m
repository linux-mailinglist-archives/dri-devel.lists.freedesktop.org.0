Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2D42987C5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC736E852;
	Mon, 26 Oct 2020 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77396E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 06:43:59 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q6PP1n001258; Mon, 26 Oct 2020 02:43:57 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com with ESMTP id 34ce45pmu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 02:43:57 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 09Q6huxL007330
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL); 
 Mon, 26 Oct 2020 02:43:56 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 26 Oct
 2020 02:43:55 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Mon, 26 Oct 2020 02:43:55 -0400
Received: from btogorean-pc.ad.analog.com ([10.48.65.113])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 09Q6geJQ003008;
 Mon, 26 Oct 2020 02:43:52 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm: dt-bindings: adi: axi-hdmi-tx: Add DT bindings
 for axi-hdmi-tx
Date: Mon, 26 Oct 2020 08:41:06 +0200
Message-ID: <20201026064122.2831-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026064122.2831-1-bogdan.togorean@analog.com>
References: <20201026064122.2831-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260045
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Mike Looijmans <mike.looijmans@topic.nl>, Rob Herring <robh+dt@kernel.org>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add YAML device tree bindings for Analog Devices Inc. AXI HDMI TX
IP core DRM driver.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 .../bindings/display/adi/adi,axi-hdmi-tx.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/adi/adi,axi-hdmi-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/adi/adi,axi-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/adi/adi,axi-hdmi-tx.yaml
new file mode 100644
index 000000000000..12a0ed9b187e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/adi/adi,axi-hdmi-tx.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/adi/adi,axi-hdmi-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AXI HDMI TX HDL core
+
+maintainers:
+  - Bogdan Togorean <bogdan.togorean@analog.com>
+
+description: |
+  The AXI HDMI HDL driver is the driver for the HDL graphics core which
+  is used on various FPGA designs. It's mostly used to interface with
+  the ADV7511 driver on some Zynq boards (e.g. ZC702 & ZedBoard).
+
+properties:
+  compatible:
+    const: adi,axi-hdmi-tx-1.00.a
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: phandle to AXIS DMA controller
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: video
+
+  clocks:
+    maxItems: 1
+    description: phandle to the pixel clock
+
+  adi,is-rgb:
+    type: boolean
+    description: enable color space conversion
+
+  port:
+    type: object
+    description: |
+      Port as described in Documentation/devicetree/bindings/graph.txt.
+      Remote output connection to bridge driver
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_hdmi_tx: axi_hdmi@70e00000 {
+            compatible = "adi,axi-hdmi-tx-1.00.a";
+            reg = <0x70e00000 0x10000>;
+            dmas = <&hdmi_dma 0>;
+            dma-names = "video";
+            clocks = <&hdmi_clock>;
+
+            port {
+                    axi_hdmi_out: endpoint {
+                            remote-endpoint = <&zynq_hdmi_in>;
+                    };
+            };
+    };
+...
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
