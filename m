Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF2728533
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A3010E5EA;
	Thu,  8 Jun 2023 16:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744AF10E5F1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:38:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358GbbNS115695;
 Thu, 8 Jun 2023 11:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686242257;
 bh=fto8hspIWYbudCmEl2g6ecL/UhlQpTiwRoj5dazNq+E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yjZCdYecCqlAfAByHrEBHPQ46JbIDet0HySG5g4tlTO8ToNCtOrdBEP8Lh9YsF8eQ
 rlI5HTv/e0wwJbPunaMQrHN6oM8k6Li0HzGF1jXHKletw92au7WdAOTEQBstJ2KP2z
 cT7ATZeBN3QAVhtFA97yk8QZvzRD0TTXtdeEDd1g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Gbbkn111920
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Jun 2023 11:37:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 11:37:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 11:37:37 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358GbZV7024680;
 Thu, 8 Jun 2023 11:37:36 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 1/2] dt-bindings: display: ti,
 am65x-dss: Add am625 dss compatible
Date: Thu, 8 Jun 2023 22:07:33 +0530
Message-ID: <20230608163734.2578-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608163734.2578-1-a-bhatia1@ti.com>
References: <20230608163734.2578-1-a-bhatia1@ti.com>
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
---

Notes:

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

