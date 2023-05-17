Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A8706B3E
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886D10E42A;
	Wed, 17 May 2023 14:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294810E429
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:36:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HEZPqO020544; Wed, 17 May 2023 16:35:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=r4Xid0BJpcowfrztv2+K9DYezOgnM0eN/cUAdmp7QF0=;
 b=AcK1JTbsOOZ3cdTOJO4eNqO4WVx088Gk6qRbFJAZrZ/Mivb5+T3eBVczzG7udCzVYgNQ
 wU9xbuZH1M37x9DsPzWOdOmxvgRxKiR5Ramc2WqiN5NwKt+5YiIAlDlt6p0QjnHnfwg3
 f2Nn1AQV86OL2gyHkq9s7on7pmO0i+ImeJtJ32ailA93y031YDNxBc2PatVDfaE8zHYk
 SyQy3SrOS+kQeJW6iOejYEUvS+VIIByG7uG0tBJ3kYL7/acperGKWfxoX7Epe/qtaUdr
 1KQfpCIXRZoQMz099jsb1NPYhDJjh+IURZ6ct39tH8/mwWJolsH3ZWn7g9RcvG/CF4kp 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qmtefk65s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 16:35:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 574F7100038;
 Wed, 17 May 2023 16:35:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4ECA123356C;
 Wed, 17 May 2023 16:35:49 +0200 (CEST)
Received: from localhost (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 16:35:48 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH v3 1/3] ARM: dts: stm32: fix warnings on stm32f469-disco board
Date: Wed, 17 May 2023 16:35:40 +0200
Message-ID: <20230517143542.284029-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several warnings appear when building and checking stm32f429 device-tree:

arch/arm/boot/dts/stm32f469-disco.dts:182.28-184.5: Warning (unit_address_vs_reg):
/soc/display-controller@40016800/port/endpoint@0: node has a unit name, but no reg or ranges property

.../arch/arm/boot/dts/stm32f469-disco.dtb: dsi@40016c00: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
	From schema: .../Documentation/devicetree/bindings/display/st,stm32-dsi.yaml

Fix those.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 5a0daf8e8b11..cbbd521bf010 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -160,7 +160,7 @@ dsi_out: endpoint {
 		};
 	};
 
-	panel-dsi@0 {
+	panel@0 {
 		compatible = "orisetech,otm8009a";
 		reg = <0>; /* dsi virtual channel (0..3) */
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
@@ -179,7 +179,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_out_dsi: endpoint@0 {
+		ltdc_out_dsi: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
-- 
2.25.1

