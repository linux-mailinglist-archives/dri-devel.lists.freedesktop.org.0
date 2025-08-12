Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D842EB22939
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E0610E5F3;
	Tue, 12 Aug 2025 13:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="zXP9an4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A690F10E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:51:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CD1jhO006642;
 Tue, 12 Aug 2025 15:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zQREU73Ww2AuSHi+YSI1jSIYYenhpdvJj73K8k6oTeg=; b=zXP9an4Z4Y6DLlGi
 j7wljYCYFBnKXpiKdgI9P8IOPW57Zz3MO5poKrDZywaQgGUb8uiR57AHPx8WJZ7h
 j1r8I82139Z4BKaiA8HpYB8Kk7d4iSamK4Iw4MXed8BDwow3+4z2Hff01rXqIU3C
 kSq2h6lUE5CdkCW/X3NBW3JV6HIMVArqX9FBITC7QaTvizXpg+DzTfgZgfsLLDVk
 K9O1rlfolFLpik0RK34TzZCxzY2SZCJX8nz+a8EB43tWVQOeZZxq2NCQkI/7h/4Z
 vaU9qcSEIB6abU7nljw8g+BDTFAa4ijLFTXJku8xtQv3HrUpAs07M2vfsQVwzBTs
 JVJt4Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gad9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 15:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E78CC40077;
 Tue, 12 Aug 2025 15:49:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92A2378C592;
 Tue, 12 Aug 2025 15:49:05 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:49:05 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 12 Aug 2025 15:49:06 +0200
Subject: [PATCH v2 09/13] arm64: dts: st: add ltdc support on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-drm-misc-next-v2-9-132fd84463d7@foss.st.com>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
In-Reply-To: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
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

The LCD-TFT Display Controller (LTDC) handles display composition,
scaling and rotation.  It provides a parallel digital RGB flow to be
used by display interfaces.

Add the LTDC node.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 8d87865850a7a6e8095c36acdef83c8e3a73ae54..6e8f76aa4680d5c253bae882edc455f4e95413f3 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1052,6 +1052,18 @@ dcmipp: dcmipp@48030000 {
 				status = "disabled";
 			};
 
+			ltdc: display-controller@48010000 {
+				compatible = "st,stm32mp251-ltdc";
+				reg = <0x48010000 0x400>;
+				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>;
+				clock-names = "lcd", "bus";
+				resets = <&rcc LTDC_R>;
+				access-controllers = <&rifsc 80>;
+				status = "disabled";
+			};
+
 			combophy: phy@480c0000 {
 				compatible = "st,stm32mp25-combophy";
 				reg = <0x480c0000 0x1000>;

-- 
2.25.1

