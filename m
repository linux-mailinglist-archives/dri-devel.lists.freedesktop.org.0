Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA97146F7
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D610E25F;
	Mon, 29 May 2023 09:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72110E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 09:14:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34T6EVdo029608; Mon, 29 May 2023 11:14:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2yzj+A8i3nHCZfHMqMF8cvs2yklr1iT9gFpTVjyZLSs=;
 b=HB7bSktGyQB/sosz8Hw5lyMqsJw31xBDYjIj0LKQakeAqhqYbsp3+4x2fiWlS+obc0JT
 JtdK0btvbdv7d20dtB9+JKOC5+aLwK1UshWDaTOCfQcacZZVwTG/eTAaNr2WzMHD9hXB
 d8iVKFAwcmfe/JaRt8oZ62w+VgJM7Zwmp9BTs9O5eizU3SpQo0Am5VXXwEP+4gHxTWqx
 4/CDETTZZo4XM/BsG+ODoCsHr5c+ChM/v26YUNwSmxeRGNUU+7ZPBjdxe5vB6h+Mo5MV
 NM4PwdQsWqQsgVPnOsDLauF8OHd0Ezay3yPKM9YLaFzBlg5iNT5O8VS35fnWBdRX13Cj 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy0j7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 11:14:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B908100034;
 Mon, 29 May 2023 11:14:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42AFF217B8F;
 Mon, 29 May 2023 11:14:25 +0200 (CEST)
Received: from localhost (10.252.18.236) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 11:14:24 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH v4 3/4] ARM: dts: stm32: fix dsi warnings on stm32mp15 boards
Date: Mon, 29 May 2023 11:13:58 +0200
Message-ID: <20230529091359.71987-4-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.18.236]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_06,2023-05-25_03,2023-05-22_02
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
Cc: devicetree@vger.kernel.org,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes DSI related warnings:

 * "#size-cells" and "#address-cells" wrongly used
 * Changed 'panel-dsi@0' to 'panel@0' according to dsi-controller.yaml

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157.dtsi                          | 7 -------
 .../boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts   | 3 +++
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts  | 3 +++
 arch/arm/boot/dts/stm32mp157c-dk2.dts                      | 5 +++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts                      | 7 ++++++-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
index 54e73ccea446..5e733cd16ff9 100644
--- a/arch/arm/boot/dts/stm32mp157.dtsi
+++ b/arch/arm/boot/dts/stm32mp157.dtsi
@@ -24,14 +24,7 @@ dsi: dsi@5a000000 {
 			clock-names = "pclk", "ref", "px_clk";
 			resets = <&rcc DSI_R>;
 			reset-names = "apb";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index 9a2a4bc7d079..47d03bd9ef0b 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -49,6 +49,9 @@ &dsi {
 	phy-dsi-supply = <&reg18>;
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
 			reg = <0>;
 			dsi_in: endpoint {
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index 390ee8c05754..d2f68997a471 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -49,6 +49,9 @@ &dsi {
 	phy-dsi-supply = <&reg18>;
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
 			reg = <0>;
 			dsi_in_ltdc: endpoint {
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index ab13e340f4ef..0067c6248cd1 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -31,10 +31,15 @@ &cryp1 {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	phy-dsi-supply = <&reg18>;
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
 			reg = <0>;
 			dsi_in: endpoint {
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index ba8e9d9a42fa..67c6b9440878 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -101,9 +101,14 @@ dcmi_0: endpoint {
 
 &dsi {
 	phy-dsi-supply = <&reg18>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
 			reg = <0>;
 			dsi_in: endpoint {
@@ -119,7 +124,7 @@ dsi_out: endpoint {
 		};
 	};
 
-	panel-dsi@0 {
+	panel@0 {
 		compatible = "raydium,rm68200";
 		reg = <0>;
 		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
-- 
2.25.1

