Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632C733458
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC5D10E646;
	Fri, 16 Jun 2023 15:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B919D10E646
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 15:09:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35GF93td122964;
 Fri, 16 Jun 2023 10:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686928143;
 bh=XeIU5HNvzXauPjfZz7sVlrtEWovC6iJ5yfAQPIyTlqs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oxGzyFqxL8h3HdPvusRX/mUzbjoLYAIF9MWivL3J4XIzzF9SGqJwtHDKn041d8GGW
 FFyoPmbL2AdqFFWYXKZ+E0+5XWRK0Dytkc3djti+CBna4nAhyB53ZasR+7SUo6Iuqz
 N2Elpal75nn6GZBYaomMzT3NlA7/roLJv8k9umbU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35GF93xM123895
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Jun 2023 10:09:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 10:09:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 10:09:02 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35GF91r8024602;
 Fri, 16 Jun 2023 10:09:02 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 1/2] dt-bindings: display: ti,
 am65x-dss: Add am625 dss compatible
Date: Fri, 16 Jun 2023 20:38:59 +0530
Message-ID: <20230616150900.6617-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616150900.6617-1-a-bhatia1@ti.com>
References: <20230616150900.6617-1-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSS controller on TI's AM625 SoC is an update from that on TI's
AM65X SoC. The former has an additional OLDI TX on its first video port
that helps output cloned video or WUXGA (1920x1200@60fps) resolution
video output over a dual-link mode to reduce the required OLDI clock
output.

The second video port is same from AM65x DSS and it outputs DPI video
data. It can support 2K resolutions @ 60fps, independently.

Add the new controller's compatible and update descriptions.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

Notes:
  Changes from v8:
  * Add Krzysztof Kozlowski's and Tomi Valkeinen's tags.

  Changes from v7:
  * Drop the 3rd port property and update descriptions.
  * Drop the Reviewed-by tags of Krzysztof Kozlowski and Rahul T R
    because of the changes.

 .../bindings/display/ti/ti,am65x-dss.yaml      | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index b6b402f16161..ae09cd3cbce1 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -12,14 +12,18 @@ maintainers:
   - Tomi Valkeinen <tomi.valkeinen@ti.com>
 
 description: |
-  The AM65x TI Keystone Display SubSystem with two output ports and
-  two video planes. The first video port supports OLDI and the second
-  supports DPI format. The fist plane is full video plane with all
-  features and the second is a "lite plane" without scaling support.
+  The AM625 and AM65x TI Keystone Display SubSystem with two output
+  ports and two video planes. In AM65x DSS, the first video port
+  supports 1 OLDI TX and in AM625 DSS, the first video port output is
+  internally routed to 2 OLDI TXes. The second video port supports DPI
+  format. The first plane is full video plane with all features and the
+  second is a "lite plane" without scaling support.
 
 properties:
   compatible:
-    const: ti,am65x-dss
+    enum:
+      - ti,am625-dss
+      - ti,am65x-dss
 
   reg:
     description:
@@ -80,7 +84,9 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          The DSS OLDI output port node form video port 1
+          For AM65x DSS, the OLDI output port node from video port 1.
+          For AM625 DSS, the internal DPI output port node from video
+          port 1.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-- 
2.40.1

