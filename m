Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C598C3379
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 21:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BB310E42D;
	Sat, 11 May 2024 19:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fuJCcCUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776D10E3F7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 19:31:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BJUxwR064269;
 Sat, 11 May 2024 14:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715455859;
 bh=2JLwXcZpH6yuthGcGjHMs859UbxlGytFLCWXhqRG6GE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fuJCcCUq8rq59s4diBin08Yhz5n9wHabymAZa60aSSj6y/1XmRKkEUT2FN5mii5cd
 MnmutXVMjq+dTn8eMVZ7M3WdFnGrHV7OxUXH4qUayZaEqvIeXEtiiS7Sy1u7CPvUYf
 TJ+zCVyVL64114m/6yOKR+q8MC9v79LoRAIqiLpc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BJUxg6029991
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 14:30:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 14:30:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 14:30:58 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BJUv8t091609;
 Sat, 11 May 2024 14:30:58 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH 1/4] dt-bindings: display: ti,am65x-dss: Minor Cleanup
Date: Sun, 12 May 2024 01:00:52 +0530
Message-ID: <20240511193055.1686149-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511193055.1686149-1-a-bhatia1@ti.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Reduce tab size from 8 spaces to 4 spaces to make the bindings
consistent, and easy to expand.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 55e3e490d0e6..399d68986326 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -142,32 +142,32 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     dss: dss@4a00000 {
-            compatible = "ti,am65x-dss";
-            reg =   <0x04a00000 0x1000>, /* common */
-                    <0x04a02000 0x1000>, /* vidl1 */
-                    <0x04a06000 0x1000>, /* vid */
-                    <0x04a07000 0x1000>, /* ovr1 */
-                    <0x04a08000 0x1000>, /* ovr2 */
-                    <0x04a0a000 0x1000>, /* vp1 */
-                    <0x04a0b000 0x1000>, /* vp2 */
-                    <0x04a01000 0x1000>; /* common1 */
-            reg-names = "common", "vidl1", "vid",
-                    "ovr1", "ovr2", "vp1", "vp2", "common1";
-            ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
-            power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
-            clocks =        <&k3_clks 67 1>,
-                            <&k3_clks 216 1>,
-                            <&k3_clks 67 2>;
-            clock-names = "fck", "vp1", "vp2";
-            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
-            ports {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    port@0 {
-                            reg = <0>;
-                            oldi_out0: endpoint {
-                                    remote-endpoint = <&lcd_in0>;
-                            };
-                    };
+        compatible = "ti,am65x-dss";
+        reg = <0x04a00000 0x1000>, /* common */
+              <0x04a02000 0x1000>, /* vidl1 */
+              <0x04a06000 0x1000>, /* vid */
+              <0x04a07000 0x1000>, /* ovr1 */
+              <0x04a08000 0x1000>, /* ovr2 */
+              <0x04a0a000 0x1000>, /* vp1 */
+              <0x04a0b000 0x1000>, /* vp2 */
+              <0x04a01000 0x1000>; /* common1 */
+        reg-names = "common", "vidl1", "vid",
+                "ovr1", "ovr2", "vp1", "vp2", "common1";
+        ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+        power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
+        clocks =        <&k3_clks 67 1>,
+                        <&k3_clks 216 1>,
+                        <&k3_clks 67 2>;
+        clock-names = "fck", "vp1", "vp2";
+        interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                oldi_out0: endpoint {
+                    remote-endpoint = <&lcd_in0>;
+                };
             };
+        };
     };
-- 
2.34.1

