Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DD98EBB5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EBC10E062;
	Thu,  3 Oct 2024 08:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="gYT1MbKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2024 08:35:20 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B1E10E062
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1727943616; x=1730535616;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZS1DqAcLXOylqarIwLjyRPvbIyThJtJvm66m95KT0M=;
 b=gYT1MbKuLOga+5NwnKc2gtoOTJZLOg7LQZWc3jlYIgsdseaibSb/6xZ4NLTD0Osi
 Tq7SQKqVJ9A3LoGFjQtLOl3wiuPPEo8kskuhg1AXe4Ktu2/L3ehn5LXHyeIxc6M9
 cTZUd8lL3uZaUosPt8EMvXEj/F7dlcelU0mti1KWeUQ=;
X-AuditID: ac14000a-4637f70000004e2a-a0-66fe53c07c40
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0F.F4.20010.0C35EF66;
 Thu,  3 Oct 2024 10:20:16 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 3 Oct 2024
 10:20:15 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bbrezillon@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
 <robh@kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/2] dt-bindings: display: bridge: sil, sii9022: Add data-lines
Date: Thu, 3 Oct 2024 10:20:06 +0200
Message-ID: <20241003082006.2728617-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003082006.2728617-1-w.egorov@phytec.de>
References: <20241003082006.2728617-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsWyRpKBR/dA8L80g5ZD3BYnri9isri/+DOL
 xeqW6YwWa/aeY7KYf+Qcq8WVr+/ZLJ7PX8docfLNVRaLl7PusVl0TlzCbnF51xw2i4Uft7JY
 tHUuY7V4v/MWo8WkeTdZLf7v2cFuMfvdfnaLLW8mslp0v1N3EPbY+20Bi8fOWXfZPWZ3zGT1
 WLznJZPHplWdbB4nJlxi8rhzbQ+bx7yTgR73u48zefR3t7B6bD5d7fF5k1wATxSXTUpqTmZZ
 apG+XQJXxoO9nawFa7grni2awdzAeJeji5GTQ0LAROLrxn72LkYuDiGBJUwS7yc9Z4FwHjFK
 LJx9nh2kik1AXeLOhm+sILaIgJ/ErS/7wDqYBTYxS3x+vRssIQyUmLfwJBOIzSKgIvGo5S4b
 iM0rYClxp6mFDWKdvMTMS9/BhnIKWElsefEQaBsH0DZLiS1HCiDKBSVOznzCAmIzA5U3b53N
 DGFLSBx88QLMFgKKv7i0nAVm5LRzr5kh7FCJrV+2M01gFJqFZNQsJKNmIRm1gJF5FaNQbmZy
 dmpRZrZeQUZlSWqyXkrqJkZQJIswcO1g7JvjcYiRiYPxEKMEB7OSCO+87X/ThHhTEiurUovy
 44tKc1KLDzFKc7AoifOu7ghOFRJITyxJzU5NLUgtgskycXBKNTBOYorqylf56SFz9X2DorTA
 gYeXm4wixfau3DD1Ms9OzsfJj9L7XAy+JiXtPaAhyH/P01vhFuMW68/KoQu6ryUeef177+aa
 e6uzisrU3n1c5C5+rGHz6uZjDSxy65+UdWn/Wpj9ZN1p3Yg3S/49dq/OeH2561uGxUaxi7MC
 dP5+uBAZISa90u2gEktxRqKhFnNRcSIAdGjyYdICAAA=
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

The SI9022 HDMI transmitter can be configured with 16, 18, or 24 input
data lines. This commit introduces the data-lines property to the input
endpoint, specifying the number of parallel RGB input pins connected
to the transmitter.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 .../bindings/display/bridge/sil,sii9022.yaml        | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
index 5a69547ad3d7..24306f8eb107 100644
--- a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
@@ -81,9 +81,20 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Parallel RGB input port
 
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lines:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [ 16, 18, 24 ]
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
-- 
2.34.1

