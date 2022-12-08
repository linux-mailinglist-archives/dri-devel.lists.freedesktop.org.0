Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D180647155
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 15:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCE610E4AA;
	Thu,  8 Dec 2022 14:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A512D10E4A2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670508525; x=1702044525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o2rKyCWo/i92zJrOkGubl8HRyLvMB0jfTjO6UhKs7xc=;
 b=hXOnGZv+IROjHhvo8sBG4YrkgBqAo78vGsfd0bYF3wwvG8dUhhxDCG50
 iUbSe3Tu+hC1YVjP0VUwtHb7CA82wYFsDFHtZ0Mt7Ib+n4olSC1y4uPnx
 6KmGZ4UchiKeM5Gg3wCkaR2NFuuRNm1VSurZpDNlbo04fGSn3v4esAohr
 ZErvfQOJYcdhYe3k7Br5yqkVWt95zu8t3pSrSlWTx4jTm02n7J4fjQC3r
 ZOsN1Ox/mY5Yash3yPv5IF8CB4OXIERJJ45W8+3Kl8wq0HdJ/zuZVjsQ3
 MsjzzTWsXisw+ALTTu5dLeQnDPJxDlYXvWzbFZYLiylGa5pRUfAx5PHP7 w==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27842106"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 15:08:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 15:08:44 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 15:08:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670508523; x=1702044523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o2rKyCWo/i92zJrOkGubl8HRyLvMB0jfTjO6UhKs7xc=;
 b=myBfQmB5Uo8LsbyG06Z499sCGkE/h581fv6Imo35n+UQxk0NNa4qKndp
 ilbNfY4VFjvtWDBqVPJv2VHVa0JVNTOAgdH6wl5E8qj85aRugj5ekopkY
 3ogR0QeD4LNcsXupd3fhGWfLTn7AqrQW0avWM0Y0XXTgMecTMNrssWjSk
 kRWJmvAcGhcruK6xBzFilWYys3fypOj+a31SmQhHmk/iJopmCGFcG+vBx
 dAV9rQJSF6soyKmBoOo6W1Vbj5glfAkXlS4QXrEKj5XSM0p7+0VNH9FTg
 cepDFjG9mTig+VS/Hrkz9k+/KqaaH+A3eSWS3ww/tnxw7iKUCjqPjoO6r w==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27842104"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 15:08:43 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 66B7B280072;
 Thu,  8 Dec 2022 15:08:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/1] dt-bindings: lcdif: Fix constraints for imx8mp
Date: Thu,  8 Dec 2022 15:08:40 +0100
Message-Id: <20221208140840.3227035-1-alexander.stein@ew.tq-group.com>
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
Changes in v3:
* Removed power-domains minItems: 1 constraint

Changes in v2:
* Squash both patches into one
* Split the conditionals from fsl,imx6sx-lcdif
* Mark power-domains as required for fsl,imx8mp-lcdif
* Ignored the A-b & R-b due to reorganization

 .../bindings/display/fsl,lcdif.yaml           | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 876015a44a1e6..f449cfc767899 100644
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
@@ -81,7 +84,31 @@ allOf:
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

