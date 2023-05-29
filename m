Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A77146F3
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA2310E25B;
	Mon, 29 May 2023 09:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEAE10E259
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 09:14:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34T6E9rj029309; Mon, 29 May 2023 11:14:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=B28932ysMM4Fnx/W56GI8Wfbt/tHdsgnlH6ChOgbdy8=;
 b=c3iK2C0iCut8yrNZ0Ob/dWcLgkDNKVmy2W7l8qhEV1dqr6QER/IcpBekMpITPr0Ln1PG
 e/YJ/HtyOjbh28+FlBstGKO6Xog0AY3wC+zFQAtVsLeg/Vz3Oo8/1F8xYWE5369VKq9b
 JROHXFscKpjP+m/bSUilvXyHOEf0TZMYpwNjFtRY9zM/JC0agEyGTPsEOVWU05PkNqvb
 VCq+vfVXENj6J5AuHio9EBnzg1usy7hSAnBJ0qh9Yznui4bgX3Pb3xbBPRzmn1Kf5m4g
 tuHXWs9FH5OjywbM02Rt5qcrVrOuDz9nDDcD5QBHxdHsYZJ7rdyEUDGg/n3zMjcpARKi 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quakkrscm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 11:14:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA4DE10002A;
 Mon, 29 May 2023 11:14:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDBAD217B8F;
 Mon, 29 May 2023 11:14:25 +0200 (CEST)
Received: from localhost (10.252.18.236) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 11:14:25 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Marek Vasut <marex@denx.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
Subject: [PATCH v4 4/4] ARM: dts: stm32: fix ltdc warnings in stm32mp15 boards
Date: Mon, 29 May 2023 11:13:59 +0200
Message-ID: <20230529091359.71987-5-raphael.gallais-pou@foss.st.com>
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

Those concern:
  * "#size-cells" and "#address-cells" wrongly used
  * residual "reg" property appearing on endpoints where it could be
    avoided

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi                           | 5 -----
 .../boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    | 3 +--
 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts   | 3 +--
 .../dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts   | 3 +--
 arch/arm/boot/dts/stm32mp157c-dk2.dts                       | 3 +++
 arch/arm/boot/dts/stm32mp157c-ev1.dts                       | 3 +--
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts                   | 3 +--
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi          | 6 +-----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                      | 3 +--
 9 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index a98ae58e2c1c..bf3830dca742 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1529,11 +1529,6 @@ ltdc: display-controller@5a001000 {
 			clock-names = "lcd";
 			resets = <&rcc LTDC_R>;
 			status = "disabled";
-
-			port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
 		};
 
 		iwdg2: watchdog@5a002000 {
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index 47d03bd9ef0b..4279b26547df 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -107,8 +107,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index d2f68997a471..efba54289820 100644
--- a/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -107,8 +107,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_out_dsi: endpoint@0 {
-			reg = <0>;
+		ltdc_out_dsi: endpoint {
 			remote-endpoint = <&dsi_in_ltdc>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 0d7560ba2950..5116a7785201 100644
--- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -81,8 +81,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&panel_in>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 0067c6248cd1..4bef2300ed7c 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -87,6 +87,9 @@ &ltdc {
 	status = "okay";
 
 	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		ltdc_ep1_out: endpoint@1 {
 			reg = <1>;
 			remote-endpoint = <&dsi_in>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 67c6b9440878..49ca94c19b02 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -244,8 +244,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 407ed3952f75..eada9cf257be 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -161,8 +161,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&panel_input>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 302efac5d26f..e1306f92fd82 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -336,11 +336,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&adv7513_in>;
 		};
 	};
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 0f1110e42c93..a6e2e20f12fa 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -457,8 +457,7 @@ &ltdc {
 	status = "okay";
 
 	port {
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
+		ltdc_ep0_out: endpoint {
 			remote-endpoint = <&sii9022_in>;
 		};
 	};
-- 
2.25.1

