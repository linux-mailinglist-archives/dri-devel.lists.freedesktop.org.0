Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C53A2A2E7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AA410E7E6;
	Thu,  6 Feb 2025 08:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="BYTbs25L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05A310E1C8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:03:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515Boerv2525990
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Feb 2025 05:50:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738756240;
 bh=VCtGI+uCG2hWdsoWCIe4rbkbeS3s2t98T4jUhXD2A+c=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=BYTbs25La01gzes7U3VWPeKdIFbiB38mEOMZ2tjGXU28ns//v9JAOAIhx9a8Ffp/L
 utiaMWNrEBZdD5Eo/aAhb5FclsbjrHXD49+OMcFqEPYp3vq0Pc9Nr/T0uJeb/S4c+O
 k5XAvKGVUXUmFPBPfGxCc2ROuPSUJO1d1D1EUr50=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515Boesf101811
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Feb 2025 05:50:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:50:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:50:40 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.227.96])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BoPCi043245;
 Wed, 5 Feb 2025 05:50:33 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <jani.nikula@intel.com>, <j-choudhary@ti.com>,
 <sui.jingfeng@linux.dev>, <viro@zeniv.linux.org.uk>,
 <r-ravikumar@ti.com>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2]  dt-bindings: drm/bridge: Add no-hpd property
Date: Wed, 5 Feb 2025 17:20:24 +0530
Message-ID: <20250205115025.3133487-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205115025.3133487-1-h-shenoy@ti.com>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Thu, 06 Feb 2025 08:05:28 +0000
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

From: Rahul T R <r-ravikumar@ti.com>

The mhdp bridge can work without its HPD pin hooked up to the connector,
but the current bridge driver throws an error when hpd line is not
connected to the connector. For such cases, we need an indication for
no-hpd, using which we can bypass the hpd detection and instead use the
auxiliary channels connected to the DP connector to confirm the
connection.
So add no-hpd property to the bindings, to disable hpd when not
connected or unusable due to DP0-HPD not connected to correct HPD 
pin on SOC like in case of J721S2.

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
2.34.1

