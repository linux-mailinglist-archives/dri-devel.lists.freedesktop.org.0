Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB92B41C7B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DF710E200;
	Wed,  3 Sep 2025 10:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="pgG0iKLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7980F10E200
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:59:30 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583AxR7g2753182;
 Wed, 3 Sep 2025 05:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756897167;
 bh=2ePqsIFvvYXVPKunzCWZj6k6JrCoCIdpXe0VE1H9j9g=;
 h=From:To:CC:Subject:Date;
 b=pgG0iKLdQk+VnT3dHk6ffRodif254b75gQbcy3Wbat7EiBDu/9EuzdqVRAkkuOPiA
 Mzgr4ECw1WNBiBWII/AD/DnfgdHuCSAolPsZhmKXB3Lznqnr6mzSG+nS+44EOd6Mxk
 yhmP76Op3Pu2ppzYzWtfRN0hliMymnkFD7mZ+B2Q=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583AxRRF029452
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 3 Sep 2025 05:59:27 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 05:59:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 05:59:26 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583AxMR21169200;
 Wed, 3 Sep 2025 05:59:23 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tomi.valkeinen@ti.com>,
 <r-ravikumar@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com--smtp-debug>
CC: <h-shenoy@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-main: Update DSS EDP integration
 configuration register
Date: Wed, 3 Sep 2025 16:29:22 +0530
Message-ID: <20250903105922.2602183-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
TRM Table 2-1 MAIN Domain Memory Map.
Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM

Fixes: 92c996f4ceab ("arm64: dts: ti: k3-j721e-*: add DP & DP PHY")

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index ab3666ff4297..3fa7537d5414 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1863,7 +1863,7 @@ mhdp: dp-bridge@a000000 {
 		 * the PHY driver.
 		 */
 		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
-		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
+		      <0x00 0x04f40000 0x00 0x100>;    /* DSS_EDP0_INTG_CFG_VP */
 		reg-names = "mhdptx", "j721e-intg";
 
 		clocks = <&k3_clks 151 36>;
-- 
2.34.1

