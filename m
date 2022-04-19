Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E431506569
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 09:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686110EED5;
	Tue, 19 Apr 2022 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DF610EECE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:11:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23J73gRB090906;
 Tue, 19 Apr 2022 02:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650351822;
 bh=cS1ujKRXfeekCoucx1kpu9VR/rYFmM9er/UxuZoNJeI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rDyD6C4s31J2ShRr2xeK6mZdF6+nLe19aQfcIvOMdOhCVnCKICq3Fo7EAYZc9sVU0
 uMyexsL7828uQL2UckJG6f6eJaznxU+/fAltthGeEZ9H6E52keYOf4FANc9/xi/Aou
 gs5IcCn5wlykbRJRkPFfRDLxPJJsC8fSIpfDPTXw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23J73gKc099040
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Apr 2022 02:03:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 02:03:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 02:03:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23J73fjU026287;
 Tue, 19 Apr 2022 02:03:42 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH 1/2] dt-bindings: display: ti,
 am65x-dss: Add missing register & interrupt
Date: Tue, 19 Apr 2022 12:33:01 +0530
Message-ID: <20220419070302.16502-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220419070302.16502-1-a-bhatia1@ti.com>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
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
Cc: Devicetree <devicetree@vger.kernel.org>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSS IP on the ti-am65x soc supports an additional register space,
named "common1". Further. the IP services a maximum number of 2
interrupts.

Add the missing register space "common1" and the additional interrupt.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 5c7d2cbc4aac..102059e9e0d5 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -26,6 +26,7 @@ properties:
       Addresses to each DSS memory region described in the SoC's TRM.
     items:
       - description: common DSS register area
+      - description: common1 DSS register area
       - description: VIDL1 light video plane
       - description: VID video plane
       - description: OVR1 overlay manager for vp1
@@ -36,6 +37,7 @@ properties:
   reg-names:
     items:
       - const: common
+      - const: common1
       - const: vidl1
       - const: vid
       - const: ovr1
@@ -64,7 +66,7 @@ properties:
     maxItems: 3
 
   interrupts:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -122,13 +124,14 @@ examples:
     dss: dss@4a00000 {
             compatible = "ti,am65x-dss";
             reg =   <0x04a00000 0x1000>, /* common */
+            reg =   <0x04a01000 0x1000>, /* common1 */
                     <0x04a02000 0x1000>, /* vidl1 */
                     <0x04a06000 0x1000>, /* vid */
                     <0x04a07000 0x1000>, /* ovr1 */
                     <0x04a08000 0x1000>, /* ovr2 */
                     <0x04a0a000 0x1000>, /* vp1 */
                     <0x04a0b000 0x1000>; /* vp2 */
-            reg-names = "common", "vidl1", "vid",
+            reg-names = "common", "common1". "vidl1", "vid",
                     "ovr1", "ovr2", "vp1", "vp2";
             ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
             power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
@@ -136,7 +139,8 @@ examples:
                             <&k3_clks 216 1>,
                             <&k3_clks 67 2>;
             clock-names = "fck", "vp1", "vp2";
-            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
             ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
-- 
2.35.3

