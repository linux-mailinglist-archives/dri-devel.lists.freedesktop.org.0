Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4585794E8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190B611A1DD;
	Tue, 19 Jul 2022 08:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B9F11A1C7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88m7Q051575;
 Tue, 19 Jul 2022 03:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218128;
 bh=mu9BFM9rYVtQQzUO3YjwGa6tpEwrofIGftk9mV+ERTk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=bE5dUTqaFXErr/Aqu4CMp9s9loNgrvJwhJljixEcKEWtD50PpRNuAQ4FHnFySn22A
 ieSjTB0knhKN/mH+sb333Jnkxxj4f1yrnZxu/xy1rojwPvrWPKIWNh/3XIlmSjRNEV
 EqoOsnqptn+WDOZApbJ/dg+AVR6THAaQeShTNibU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88mJ9022582
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88lJE011171;
 Tue, 19 Jul 2022 03:08:47 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/8] dt-bindings: display: ti,
 am65x-dss: Add port properties for DSS
Date: Tue, 19 Jul 2022 13:38:38 +0530
Message-ID: <20220719080845.22122-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719080845.22122-1-a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add "ti,oldi-mode" property to indicate the tidss driver the OLDI output
mode. The 2 OLDI TXes on am625-dss allow a 3 different types of panel
connections with the board.

1. Single Link / Single Mode on OLDI TX 0 OR 1.
2. Single Link / Duplicate Mode on OLDI TX 0 and 1.
3. Dual Link / Single Mode on OLDI TX 0 and 1.

Add "ti,rgb565-to-888" property to override 16bit output from a videoport
for a bridge that only accepts 24bit RGB888 DPI input.

On some boards the HDMI bridge takes a 24bit DPI input, but only 16 data
pins are actually enabled from the SoC.  This new property forces the
output to be RGB565 on a specific video port if the bridge requests a
24bit RGB color space.

This assumes that the video port is connected like so:

SoC : Bridge
R0 ->   R3
R1 ->   R4
R2 ->   R5
R3 ->   R6
R4 ->   R7
G0 ->   G2
G1 ->   G3
G2 ->   G4
G3 ->   G5
G4 ->   G6
G5 ->   G7
B0 ->   B3
B1 ->   B4
B2 ->   B5
B3 ->   B6
B4 ->   B7

On the bridge side R0->R2, G0->G1, B0->B2 would be tied to ground.
The bridge sees 24bits of data,  but the lsb's are always zero.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 6bbce921479d..11d9b3821409 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -80,15 +80,35 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           The DSS OLDI output port node form video port 1
 
+        properties:
+          ti,oldi-mode:
+            description: TI specific property to indicate the mode the OLDI TXes
+              and the display panel are connected in.
+              0 -> OLDI TXes OFF (driver default for am625-dss)
+              1 -> Single link, Single Mode (OLDI0) (driver default for am65x-dss)
+              2 -> Single link, Single Mode (OLDI1)
+              3 -> Single link, Duplicate Mode
+              4 -> Dual link (Only Single Mode)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3, 4]
+
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           The DSS DPI output port node from video port 2
 
+        properties:
+          ti,rgb565-to-888:
+            description:
+              property to override DPI output to 16bit for 24bit bridge
+            type: boolean
+
   ti,am65x-oldi-io-ctrl:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description:
@@ -144,6 +164,7 @@ examples:
                     #size-cells = <0>;
                     port@0 {
                             reg = <0>;
+                            ti,oldi-mode = <1>;
                             oldi_out0: endpoint {
                                     remote-endpoint = <&lcd_in0>;
                             };
-- 
2.37.0

