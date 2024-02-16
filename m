Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B38575F1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 07:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2D610E2CE;
	Fri, 16 Feb 2024 06:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YruDre8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA8B10E100
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 06:24:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G6OUWS111886;
 Fri, 16 Feb 2024 00:24:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1708064670;
 bh=YlUKJ/ZBPCovTx7duyKgenYDeCXp0wXvXMuXsPZswKE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YruDre8Q3ItQEdORS0nbyBF7eogbBAYTZP8DJ8sFYUgbZ1T9chjTbIAEjHYB4p4ZT
 lPRPoRFrK9oqDoezb79iGad0MjCZSHtYQosAiIuM6rRYOGL9JyvizbnFM0sf2ZpWAR
 NDN7yjLnzPrAcGtoByhtmu4z9Js8Vl99D4W2uCs8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G6OU1D076345
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Feb 2024 00:24:30 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 00:24:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 00:24:30 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G6OTNu097143;
 Fri, 16 Feb 2024 00:24:30 -0600
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
Subject: [PATCH v5 2/4] arm64: dts: ti: Add common1 register space for AM65x
 SoC
Date: Fri, 16 Feb 2024 11:54:24 +0530
Message-ID: <20240216062426.4170528-3-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216062426.4170528-1-devarsht@ti.com>
References: <20240216062426.4170528-1-devarsht@ti.com>
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

This adds common1 register space for AM65x SoC which is using TI's Keystone
display hardware and supporting it as described in
Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml

Fixes: fc539b90eda2 ("arm64: dts: ti: am654: Add DSS node")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V4 :
- No change (this was part of "arm64: dts: ti: Add common1 register
  space for AM62x, AM62A & AM65x SoCs )

V5 :
- Split this as a separate patch from "arm64: dts: ti: Add common1
  register space for AM62x, AM62A & AM65x SoCs"
- Remove Reviewed-By tag as patch is split now
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 07010d31350e..ff857117d719 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -991,9 +991,10 @@ dss: dss@4a00000 {
 		      <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
 		      <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
 		      <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
-		      <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
+		      <0x0 0x04a0b000 0x0 0x1000>, /* vp2 */
+		      <0x0 0x04a01000 0x0 0x1000>; /* common1 */
 		reg-names = "common", "vidl1", "vid",
-			"ovr1", "ovr2", "vp1", "vp2";
+			"ovr1", "ovr2", "vp1", "vp2", "common1";
 
 		ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
 
-- 
2.34.1

