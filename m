Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742235794E2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842911A1C8;
	Tue, 19 Jul 2022 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3011A1C8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88nMf051584;
 Tue, 19 Jul 2022 03:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218129;
 bh=LOvLTtdoguKuBhYsL4AKtA8lq3cPn9YzUP+bjBI0Ilw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DEgyD4f7qvBrFdBr0TZERYcfcuEmC64KR3YUBXq9zruRBW7uPfUjm6x7NRljEUqzc
 4Xfxad864tMjS00FzZOGkRnzpDlNbzijA/0wcxxQHy1T23hsCuEWOL6HA608yMDEYk
 95ewDxgEokl/z2sfNAYNJ/lcsdLZ5UhguqvBDTIM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88nGs091734
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88m6O121325;
 Tue, 19 Jul 2022 03:08:49 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/8] dt-bindings: display: ti,
 am65x-dss: Add IO CTRL property for AM625 OLDI
Date: Tue, 19 Jul 2022 13:38:39 +0530
Message-ID: <20220719080845.22122-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719080845.22122-1-a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add am625-io-ctrl dt property to provide access to the control MMR
registers for the OLDI TXes.

These registers are used to control the power input to the OLDI TXes as
well as to configure them in the Loopback test mode.

The MMR IO controller device has been updated since the AM65x SoC and
hence a newer property is needed to describe the one in AM625 SoC.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 11d9b3821409..672765ad1f30 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -118,12 +118,33 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,am625-oldi-io-ctrl:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description:
+      phandle to syscon device node mapping OLDI IO_CTRL registers, for
+      AM625 SoC. The mapped range should point to OLDI0_DAT0_IO_CTRL,
+      and map the registers up till OLDI_LB_CTRL. This property allows
+      the driver to control the power delivery to the OLDI TXes and
+      their loopback control as well.
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Input memory (from main memory to dispc) bandwidth limit in
       bytes per second
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,am65x-dss
+then:
+  properties:
+    ti,am625-oldi-io-ctrl: false
+else:
+  properties:
+    ti,am65x-oldi-io-ctrl: false
+
 required:
   - compatible
   - reg
-- 
2.37.0

