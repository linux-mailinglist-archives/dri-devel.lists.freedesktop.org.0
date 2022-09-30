Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CFE5F0C6A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0622E10E160;
	Fri, 30 Sep 2022 13:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0879F10E160
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 13:29:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSws7006484;
 Fri, 30 Sep 2022 08:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664544538;
 bh=aadHezguYQeD2kW2CbO/+mP6/QHw2qVrvkPoQObMvGU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jWa/FAaani+ljMyJprX43p4Yyp6tlPXcGyXaofC+6fYqk9ohZY/tKbQoWYIJ4HBcf
 ictggu/4sJP+EsZ1lrxlMUvBLj0SfH7FObldJYKR0InK5yeREN7buSgAbhtnzaYmtQ
 CoKR+KssST4xmE1SFZIf8aP/08KIaE3/2MROpQ+Q=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28UDSw9F074080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Sep 2022 08:28:58 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 30
 Sep 2022 08:28:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 30 Sep 2022 08:28:57 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSuVj124003;
 Fri, 30 Sep 2022 08:28:57 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <nm@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 1/2] dt-bindings: dp-connector: Fix the property name for dp
 pwr
Date: Fri, 30 Sep 2022 18:58:41 +0530
Message-ID: <20220930132842.23421-2-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930132842.23421-1-r-ravikumar@ti.com>
References: <20220930132842.23421-1-r-ravikumar@ti.com>
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
Cc: devicetree@vger.kernel.org, Rahul T R <r-ravikumar@ti.com>,
 linux-arm-kernel@lists.infradead.org, kristo@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Property name for DisplayPort regulator is not matching in
the binding and the driver implementation. Fix the same
in the binding

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Reported-by: Nishanth Menon <nm@ti.com>
---
 .../devicetree/bindings/display/connector/dp-connector.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
index 22792a79e7ce..529d3f11ac16 100644
--- a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
@@ -24,7 +24,7 @@ properties:
     description: A GPIO line connected to HPD
     maxItems: 1
 
-  dp-pwr-supply:
+  dp-pwr:
     description: Power supply for the DP_PWR pin
 
   port:
-- 
2.37.3

