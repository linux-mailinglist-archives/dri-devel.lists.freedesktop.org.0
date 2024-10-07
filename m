Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42636992787
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4B10E31D;
	Mon,  7 Oct 2024 08:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="SMbomuSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B610E307
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1728291142; x=1730883142;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B9zujzAKvv5sce8cu4Pj2ClVC8Ea3SSfSYNnhTHta+g=;
 b=SMbomuSfNW7slXUQ/g9mHEfFmJL0ab5CUzVoUcjNnvM/qUROzeqPuQpte5XZiGLx
 SbRKbaKOS2qKbV9RrLFxmsPSkAlgpaIW6xqgVPpnxxVyQNlVJk5gnZc9RLtvVwwv
 GU6nxa+pxHp3jRF9Ya2SOPx5j4koLAgcNs0IUV/XuJE=;
X-AuditID: ac14000a-ecaea24000004e2a-f6-6703a1461352
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 43.A0.20010.641A3076;
 Mon,  7 Oct 2024 10:52:22 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 7 Oct 2024
 10:52:21 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bbrezillon@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
 <robh@kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: sil,
 sii9022: Add bus-width
Date: Mon, 7 Oct 2024 10:52:12 +0200
Message-ID: <20241007085213.2918982-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007085213.2918982-1-w.egorov@phytec.de>
References: <20241007085213.2918982-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWyRpKBR9dtIXO6webrohYnri9isri/+DOL
 xeqW6YwWa/aeY7KYf+Qcq8WVr+/ZLJ7PX8docfLNVRaLl7PusVl0TlzCbnF51xw2i4Uft7JY
 tHUuY7V4v/MWo8WkeTdZLf7v2cFuMfvdfnaLLW8mslp0v1N3EPbY+20Bi8fOWXfZPWZ3zGT1
 WLznJZPHplWdbB4nJlxi8rhzbQ+bx7yTgR73u48zefR3t7B6bD5d7fF5k1wATxSXTUpqTmZZ
 apG+XQJXxqXNixkLVvBUvDl/jKWBcTZnFyMnh4SAicTVo49Yuhi5OIQEljBJdDdtZYVwHjFK
 3P/ymhGkik1AXeLOhm+sILaIgJ/ErS/72EGKmAU2MUt8fr0bLCEsECDR2LCdDcRmEVCRmDJt
 JzuIzStgKbHnXRMTxDp5iZmXvoPFOQWsJKbfn8IMYgsB1Xw/u40Jol5Q4uTMJywgNjNQffPW
 2cwQtoTEwRcvoOrlJV5cWs4CM3PaudfMEHaoxJFNq5kmMArNQjJqFpJRs5CMWsDIvIpRKDcz
 OTu1KDNbryCjsiQ1WS8ldRMjKJZFGLh2MPbN8TjEyMTBeIhRgoNZSYQ3Yg1juhBvSmJlVWpR
 fnxRaU5q8SFGaQ4WJXHe1R3BqUIC6YklqdmpqQWpRTBZJg5OqQbGogOmH/3PLtxn//en+KYm
 8fy1K/72iH660jtnx9/1L9Ju3LO3NP+qtHiRjdeRrvtMnfvefDnjHTnhS4nUnrNrf35YlrtF
 KmLP4RWrKzeZ/Ne5NidbpVtI3ul0yIli+6Pr2q13GGX6inTXad+zTOKfmZTEt+/SurkHDy1Z
 3uN6u0LHNentrcNCzUosxRmJhlrMRcWJAPD479HTAgAA
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

The SI9022 HDMI transmitter can be configured with a bus-width of 16,
18, or 24 bits. Introduce a bus-width property to the input endpoint,
specifying the number of parallel RGB input bits connected to the
transmitter.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: 
  - Use bus-width instead of data-lines as suggested by Krzysztof
  - Provide a default
---
 .../bindings/display/bridge/sil,sii9022.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
index 5a69547ad3d7..1509c4535e53 100644
--- a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
@@ -81,9 +81,22 @@ properties:
 
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
+              bus-width:
+                description:
+                  Endpoint bus width.
+                enum: [ 16, 18, 24 ]
+                default: 24
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
-- 
2.34.1

