Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03B6D7F51
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8043A10E995;
	Wed,  5 Apr 2023 14:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CE210E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:25:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335EOhSK059451;
 Wed, 5 Apr 2023 09:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1680704683;
 bh=qDO37Rl2u94OwUVPnEAZxBPCa+75piDWj4gv5a2V2Zc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fryHPY1mKzdLY30aiXYYZCvvFh7EQQgCwL3LiFwtyzgwyq+wJ14EzQvP+dzhWrGb/
 VRB9i0mIT4ZgujImeAPThTeFi5LDvAxZkIvIFk+BXL0Y/wXXrnWmFjmxiggCkZhxyc
 E4NnR9mZ8myUIwSTVCfqaeDxY/c374a4CWz1hTHk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335EOhTO064579
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Apr 2023 09:24:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 09:24:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 09:24:43 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335EOgNt014784;
 Wed, 5 Apr 2023 09:24:43 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: Add no-hpd property
Date: Wed, 5 Apr 2023 19:54:39 +0530
Message-ID: <20230405142440.191939-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405142440.191939-1-j-choudhary@ti.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, j-choudhary@ti.com,
 yamonkar@cadence.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rahul T R <r-ravikumar@ti.com>

The mhdp bridge can work without its HPD pin hooked up to the connector,
but the current bridge driver throws an error when hpd line is not
connected to the connector. For such cases, we need an indication for
no-hpd, using which we can bypass the hpd detection and instead use the
auxiliary channels connected to the DP connector to confirm the
connection.
So add no-hpd property to the bindings, to disable hpd when not
connected or unusable.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..3a6c6d837593 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -57,6 +57,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  cdns,no-hpd:
+    type: boolean
+    description:
+      Set if the HPD line on the bridge isn't hooked up to anything or is
+      otherwise unusable.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.25.1

