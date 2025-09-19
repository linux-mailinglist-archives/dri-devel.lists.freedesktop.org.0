Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5324DB8B286
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 21:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3582810E259;
	Fri, 19 Sep 2025 19:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="du/t96Rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1434 seconds by postgrey-1.36 at gabe;
 Fri, 19 Sep 2025 19:58:38 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7804410E259
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 19:58:38 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJYVnd309082;
 Fri, 19 Sep 2025 14:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758310471;
 bh=4e+vM8y65RFB7t9z0rUFFvypiNgEA9GqKV1KkIOAjaw=;
 h=From:To:CC:Subject:Date;
 b=du/t96Rqu8z/S9y/E8DMnrXo9Sdt/i5dE5RVObEXS3ejwua+k1Lq79523nhCeQO00
 ZTmqtS+kG6lNgNqsEfrcU27dzoW1qNEIWWd8RWZqj+7JPVHmUBOs5eBKU/bCqM9cxS
 ekflEfqY3L+UCV/UvrVkoudRIAEFrA47KMcRj04g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJYVIE2559652
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 19 Sep 2025 14:34:31 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:34:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:34:31 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJYVKA3079903;
 Fri, 19 Sep 2025 14:34:31 -0500
From: <rs@ti.com>
To: <mwalle@kernel.org>, <afd@ti.com>, <conor+dt@kernel.org>,
 <frank.binns@imgtec.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
 <matt.coster@imgtec.com>, <nm@ti.com>, <robh@kernel.org>, <vigneshr@ti.com>
CC: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <detheridge@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
Date: Fri, 19 Sep 2025 14:33:42 -0500
Message-ID: <20250919193341.707660-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
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

From: Randolph Sapp <rs@ti.com>

Update the memory region listed in the k3-am62p.dtsi for the BXS-4-64
GPU to match the Main Memory Map described in the TRM [1].

[1] https://www.ti.com/lit/ug/spruj83b/spruj83b.pdf

Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
Signed-off-by: Randolph Sapp <rs@ti.com>
---

Requirement for the following series:
https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11..dd24c40c7965 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -59,7 +59,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripheral window */
 			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* Main CPSW */
 			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x01d20000>, /* Second peripheral window */
-			 <0x00 0x0fd00000 0x00 0x0fd00000 0x00 0x00020000>, /* GPU */
+			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
 			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
 			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00010100>, /* CSI window */
-- 
2.51.0

