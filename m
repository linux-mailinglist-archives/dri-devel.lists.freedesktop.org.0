Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD48551934
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2CE10E097;
	Mon, 20 Jun 2022 12:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 744 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jun 2022 12:45:03 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2F810E097
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:45:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25KCWMbv004303;
 Mon, 20 Jun 2022 07:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1655728342;
 bh=O3wOPFel2p9ibgr0WvLvqkGUcUI5oKjGaC6/OAwe0B8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oHV6UTIZ9kBc2MH2qU6IZ5zbL/NiI2php58FZ/UghAZdFMxA01PkEsLMb5LmIcRo7
 Y3Qg/qgW4/5cwCvBPMajnVzO6kyTBCR3kNa0ji9y2Ur2p0eW2iZNAooMJqHeH1DCQa
 9Z/FLDh+VUcEgPXKAiSeCtr2hd0a2ppw0M0l66sA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25KCWMsu102989
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jun 2022 07:32:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Jun 2022 07:32:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Jun 2022 07:32:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25KCWLv6018203;
 Mon, 20 Jun 2022 07:32:22 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] dt-bindings: display: ti,
 am65x-dss: Add am625 dss compatible
Date: Mon, 20 Jun 2022 18:02:16 +0530
Message-ID: <20220620123217.25809-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620123217.25809-1-a-bhatia1@ti.com>
References: <20220620123217.25809-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Devel List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ti,am625-dss compatible string.
The DSS IP on TI's AM625 SoC is an update from the DSS on TI's AM65X
SoC. The former has an additional OLDI TX to enable a 2K resolution on
OLDI displays or enable 2 duplicated displayw with a smaller resolution.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 5c7d2cbc4aac..0fc77674eb50 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: ti,am65x-dss
+    enum:
+      - ti,am65x-dss
+      - ti,am625-dss
 
   reg:
     description:
-- 
2.36.1

