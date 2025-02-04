Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE63A26C0C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 07:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582D10E13B;
	Tue,  4 Feb 2025 06:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="BgIdmKc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D816F10E13B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 06:16:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5146Ft9n2282131
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2025 00:15:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738649755;
 bh=iPtH4Nx71CfaLqe6GeiuXzY+1Zw6a8dLsu6iB2wlAKI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BgIdmKc6K6ZMzG15RLmlzDF4xWV/LahPzTtPK2wZTCAfPYOvdrkKHRqs0KyqFMcth
 LH4aPIxqgwRYEO0qbo7jH58+haSRE0rdC+kU9RY+mySlWNnrzsNZ8TkwqJiQr8xq/F
 7KJ7yCZlRz/nPVOcz0q88r3xB2tqJkyzGsABsxsA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5146FtHj023292
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Feb 2025 00:15:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 00:15:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 00:15:55 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5146Fscu075222;
 Tue, 4 Feb 2025 00:15:54 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: display: ti,
 am65x-dss: Add support for AM62L DSS
Date: Tue, 4 Feb 2025 11:45:51 +0530
Message-ID: <20250204061552.3720261-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250204061552.3720261-1-devarsht@ti.com>
References: <20250204061552.3720261-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

The DSS controller on TI's AM62L SoC is an update from that on TI's
AM625/AM65x/AM62A7 SoC. The AM62L DSS [1] only supports a single display
pipeline using a single overlay manager, single video port and a single
video lite pipeline which does not support scaling.

The output of video port is routed to SoC boundary via DPI interface and
the DPI signals from the video port are also routed to DSI Tx controller
present within the SoC.

[1]: Section 11.7 (Display Subsystem and Peripherals)
Link : https://www.ti.com/lit/pdf/sprujb4

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
- Add Reviewed-by
- s/ti,am62l,dss/ti,am62l-dss

NOTE: This patch needs to be applied on top of AM62A dt-binding fix: 
https://lore.kernel.org/all/20250203155431.2174170-1-devarsht@ti.com/ 

 .../bindings/display/ti/ti,am65x-dss.yaml     | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 31c4ffcb599c..f82e9a84e8a8 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -12,18 +12,29 @@ maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 description: |
-  The AM625 and AM65x TI Keystone Display SubSystem with two output
+  The AM625 and AM65x TI Keystone Display SubSystem has two output
   ports and two video planes. In AM65x DSS, the first video port
   supports 1 OLDI TX and in AM625 DSS, the first video port output is
   internally routed to 2 OLDI TXes. The second video port supports DPI
   format. The first plane is full video plane with all features and the
   second is a "lite plane" without scaling support.
+  The AM62A7 display subsystem has a single output port supporting DPI format
+  although similar to AM625 and AM65x Socs, it has two video planes where first
+  is full video plane with all features and second is a video "lite" plane which
+  does not support scaling.
+  The AM62L display subsystem also has a single output port which supports DPI
+  format but it only supports single video "lite plane" which does not support
+  scaling. The output port is routed to SoC boundary via DPI interface and same
+  DPI signals are also routed internally to DSI Tx controller present within the
+  SoC. Due to clocking limitations only one of the interface i.e. either DSI or
+  DPI can be used at once.
 
 properties:
   compatible:
     enum:
       - ti,am625-dss
       - ti,am62a7-dss
+      - ti,am62l-dss
       - ti,am65x-dss
 
   reg:
@@ -91,6 +102,8 @@ properties:
           For AM625 DSS, the internal DPI output port node from video
           port 1.
           For AM62A7 DSS, the port is tied off inside the SoC.
+          For AM62L DSS, the DSS DPI output port node from video port 1
+          or DSI Tx controller node connected to video port 1.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -123,6 +136,16 @@ allOf:
         ports:
           properties:
             port@0: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62l-dss
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
 
 required:
   - compatible
-- 
2.39.1

