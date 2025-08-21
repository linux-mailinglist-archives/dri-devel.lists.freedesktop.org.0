Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F3B2F612
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE83D10E932;
	Thu, 21 Aug 2025 11:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="l6aS4tbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67D10E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:12:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LBBDHn018680;
 Thu, 21 Aug 2025 13:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 RUmj8Nt5UtGZPKvlR+QnuojqoxKp1z0jwnSFCxypOrQ=; b=l6aS4tbOQjqnuEBm
 ccNRG7ibCIyp398fXuPe3xuSRQG6AyGMUlUDxgC7gQKjyeC4mAIP12PafXYXnGjB
 9RoGzOXjvwcSQ/bf9VwIEaywOJF93XTxpI7E2QkAoD1/lgQAlWxFVLIsPTL/tYo2
 zNm01wYm7mMmdqY+41BEXdRNe1K3n84DSlLZNic0rXB6ID6LLFB/cIo2rj0gQupQ
 kreUTFL/DkjMKFDKuFDTHZlrQt30BMToSS2tAFHz3/hsh4HYGs40KP/3SYBNToMR
 sCYIWXk2+HQwKRfCcY910feOgKFJyLtDrfiRrEV96pn2fITpTAmiQHruZA6optm+
 sQjTDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70dej4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 13:12:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AD18A40054;
 Thu, 21 Aug 2025 13:10:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E4A574E7CD;
 Thu, 21 Aug 2025 13:09:59 +0200 (CEST)
Received: from localhost (10.252.7.99) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 13:09:59 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 21 Aug 2025 13:08:59 +0200
Subject: [PATCH v4 09/13] arm64: dts: st: add ltdc support on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-drm-misc-next-v4-9-7060500f8fd3@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
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
index 303abf915b8e489671b51a8c832041c14a42ecb8..372a99d9cc5c3730e8fbeddeb6134a3b18d938b6 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1576,6 +1576,18 @@ dcmipp: dcmipp@48030000 {
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

