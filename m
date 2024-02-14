Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C438549A1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A410E219;
	Wed, 14 Feb 2024 12:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="xhFTB4xw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B802410E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:52:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41ECpsBx046986;
 Wed, 14 Feb 2024 06:51:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707915114;
 bh=9drq11wZTisZijPvJJM8MH1DpunI3GKUmCw2q0B7AEo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xhFTB4xwMxpo1VJ8GodGbL6nn61mh3xAsqmZ4UL8Wf33ZslqGrud9+MS2dYAh0u2s
 2nX8ggmbG0GAGhyfParpK6vfbjU823i3xIwY+j3B1dC+QYTbaI408StFDRqClBSBPg
 1lOpZqTT71M3ZeGE4r020aytCKQHqMun9FqmDZdE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41ECpsHt072714
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Feb 2024 06:51:54 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 06:51:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 06:51:54 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41ECprfd056051;
 Wed, 14 Feb 2024 06:51:53 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>, <devarsht@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: display: ti,
 am65x-dss: Add support for common1 region
Date: Wed, 14 Feb 2024 18:21:50 +0530
Message-ID: <20240214125151.1965137-2-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214125151.1965137-1-devarsht@ti.com>
References: <20240214125151.1965137-1-devarsht@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TI keystone display subsystem present in AM65 and other SoCs such as AM62
support two separate register spaces namely "common" and "common1" which
can be used by two separate hosts to program the display controller as
described in respective Technical Reference Manuals [1].

The common1 register space has similar set of configuration registers as
supported in common register space except the global configuration
registers which are exclusive to common region.

This adds binding for "common1" register region too as supported by the
hardware.

[1]:
AM62x TRM:
https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)

AM65x TRM:
https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)

AM62A TRM:
https://www.ti.com/lit/pdf/spruj16 (Section 14.9.9.1 DSS Registers)

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V2: Add Acked-by tag
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index b6767ef0d24d..55e3e490d0e6 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -37,6 +37,7 @@ properties:
       - description: OVR2 overlay manager for vp2
       - description: VP1 video port 1
       - description: VP2 video port 2
+      - description: common1 DSS register area
 
   reg-names:
     items:
@@ -47,6 +48,7 @@ properties:
       - const: ovr2
       - const: vp1
       - const: vp2
+      - const: common1
 
   clocks:
     items:
@@ -147,9 +149,10 @@ examples:
                     <0x04a07000 0x1000>, /* ovr1 */
                     <0x04a08000 0x1000>, /* ovr2 */
                     <0x04a0a000 0x1000>, /* vp1 */
-                    <0x04a0b000 0x1000>; /* vp2 */
+                    <0x04a0b000 0x1000>, /* vp2 */
+                    <0x04a01000 0x1000>; /* common1 */
             reg-names = "common", "vidl1", "vid",
-                    "ovr1", "ovr2", "vp1", "vp2";
+                    "ovr1", "ovr2", "vp1", "vp2", "common1";
             ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
             power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
             clocks =        <&k3_clks 67 1>,
-- 
2.34.1

