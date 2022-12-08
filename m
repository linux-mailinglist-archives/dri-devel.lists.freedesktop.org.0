Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14905646C28
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 10:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D38210E1B5;
	Thu,  8 Dec 2022 09:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C7610E1B5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670492737; x=1702028737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhjU3FouTLZkNXCNcABeX9zaLe4WwPV4oXIVd2IeUko=;
 b=jl8giPYZh/KhYtWFAbjZncgqukRsA5DAopvbeGOEIAu4QdBK32yewHc9
 tUmbGKt6hdki8w7bnWYO5p+BOCpsgdCuBcuHRsgZ0xIYgmi81c6aYSRzR
 n3/vvRVaUW4abt97eWsuG3ZygaX0cXISVA9hGq69p6GDl8pdbghePv3F4
 BL1XoNz1EaE1rQA/Q97N/5KEwnJPL8I+HSESaS/MsSljDMdQ1WAORPLyO
 yz3Qcvd73L/ty8XzhYe4HsTF1FflL6q1AoA81SK94UeDYpI8YtVWIinv9
 o4R7YWRGW6SsnVDvBS8ewNBIzSkwX+vtpRO8fYM2ZlnEy6OC13W9zbZeH A==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27832957"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 10:45:33 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 10:45:33 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 10:45:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670492733; x=1702028733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhjU3FouTLZkNXCNcABeX9zaLe4WwPV4oXIVd2IeUko=;
 b=Mbljh1T0u+Kd9ObhAOPEQSbdDECnGsuI/VFjq/qKUuqAlR3Z5PMq9j+3
 gKFSyDVzjGiFS2nTIHRudtZFLcH61LEquqWjNug5XY3RZbDAxUM5Tl+mV
 SFgdmdv3CIPydJpsPClHELZHhMPqZEM++XJTINrUa8+nPaZj6UwMPJS0o
 mPS5arasIYlbPW+nldg74luLyq5yb4Gjw7LxmOK2Yei7bxNMl9g/clTXj
 3BaEBZx0V8Oge1DcYfvj5QuCqvA/MP4SrvOsFlz0ZGVZ1vk+3I09Yy1oS
 0p3Pyesgga1qVNs4IDyp7HZV1cqtPNUvYZ57uj0MOvCpLIWjokJR2F2KV A==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27832953"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 10:45:31 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F3764280071;
 Thu,  8 Dec 2022 10:45:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/1] dt-bindings: lcdif: Fix constraints for imx8mp
Date: Thu,  8 Dec 2022 10:45:19 +0100
Message-Id: <20221208094519.3561610-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8MP uses 3 clocks, so soften the restrictions for clocks & clock-names.
This SoC requires a power-domain for this peripheral to use. Add it as
a required property.

Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Squash both patches into one
* Split the conditionals from fsl,imx6sx-lcdif
* Mark power-domains as required for fsl,imx8mp-lcdif
* Ignored the A-b & R-b due to reorganization

I'm not sure if this is the best way to add the constraints. I noticed that
imx6sx also uses a power-domain, but imx6ul which is compatible to imx6sx does
not, so they can't be merged.

I also have noticed that dtbs_check doesn't raise a warning when
power-domains is actually missing.

 .../bindings/display/fsl,lcdif.yaml           | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 876015a44a1e6..24014651f7dc8 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -52,6 +52,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
@@ -81,7 +84,33 @@ allOf:
           maxItems: 3
       required:
         - clock-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mp-lcdif
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          minItems: 3
+          maxItems: 3
+        power-domains:
+          minItems: 1
+      required:
+        - clock-names
+        - power-domains
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx6sx-lcdif
+                - fsl,imx8mp-lcdif
+    then:
       properties:
         clocks:
           maxItems: 1
-- 
2.34.1

