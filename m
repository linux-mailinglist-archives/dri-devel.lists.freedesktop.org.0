Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2C8242E4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 14:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7810E475;
	Thu,  4 Jan 2024 13:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2045310E475
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 13:46:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 404BSaUG003309; Thu, 4 Jan 2024 14:46:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=WM2MSIbMrg2Y/M9af1KUg6XNhb7hhWvF94YsQ4eGQyU=; b=hL
 5E8tANu4IgaGHeazd+euuUGCsiy6gscO8L4LSrbp6FWoFJKYzovTM0Y5YxQiSgi1
 BNUr2DoawCY38BgcAQS9KldCf+vtfNLYTioj35bBTaK/rfkAn9ig14/bk6p1qpC9
 Q+yYPDpGAuYpYNTps118XuAXIS7q8CxxBCIrKTQiNeZf3t57NCRVCTXWCwOJyWCA
 jjjK4xVBHgV1twHXzsd6XBlovsizKBXvOYWT1KLcJ8PcHMVZFbcVCflVygyY8zpk
 fGasDCbnYV/F9BIlhki/697J5IWorVFu+cPycIVJXgvdCWIjZBVR1Vyzo8i+rOti
 uqOFq0ktzRgN8cXtfaWw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vabe21evr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:46:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB7B810002A;
 Thu,  4 Jan 2024 14:46:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2BE722D19C;
 Thu,  4 Jan 2024 14:46:06 +0100 (CET)
Received: from localhost (10.252.5.254) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 14:46:05 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 4/4] arm: dts: st: fix DSI peripheral clock on stm32mp15
 boards
Date: Thu, 4 Jan 2024 14:44:34 +0100
Message-ID: <20240104134434.744497-5-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
References: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In RCC driver, 'DSI_K' is a kernel clock while 'DSI' has pclk4 as parent
clock, which means that it is an APB peripheral clock. Swap the clocks
in the DSI peripheral clock reference.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157.dtsi          | 2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157.dtsi b/arch/arm/boot/dts/st/stm32mp157.dtsi
index 6197d878894d..97cd24227cef 100644
--- a/arch/arm/boot/dts/st/stm32mp157.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157.dtsi
@@ -20,7 +20,7 @@ gpu: gpu@59000000 {
 		dsi: dsi@5a000000 {
 			compatible = "st,stm32-dsi";
 			reg = <0x5a000000 0x800>;
-			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
+			clocks = <&rcc DSI>, <&clk_hse>, <&rcc DSI_PX>;
 			clock-names = "pclk", "ref", "px_clk";
 			phy-dsi-supply = <&reg18>;
 			resets = <&rcc DSI_R>;
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index afcd6285890c..8634699cc65e 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -30,7 +30,7 @@ &cpu1 {
 };
 
 &dsi {
-	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
 &gpioz {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 39358d902000..3a897fa7e167 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -36,7 +36,7 @@ &cryp1 {
 
 &dsi {
 	phy-dsi-supply = <&scmi_reg18>;
-	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
 &gpioz {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 07ea765a4553..29d6465b1fe6 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -35,7 +35,7 @@ &cryp1 {
 };
 
 &dsi {
-	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
 &gpioz {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 813086ec2489..5acb78f0a084 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -37,7 +37,7 @@ &cryp1 {
 
 &dsi {
 	phy-dsi-supply = <&scmi_reg18>;
-	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
 };
 
 &gpioz {
-- 
2.25.1

