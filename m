Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58585B37B6D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4C10E319;
	Wed, 27 Aug 2025 07:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="f+UvqjMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82F10E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:06:45 +0000 (UTC)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250827045907epoutp013700bbc36f7bdeb0dff4901b8bf34736~fhvCiBhBo0387503875epoutp01G
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250827045907epoutp013700bbc36f7bdeb0dff4901b8bf34736~fhvCiBhBo0387503875epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756270747;
 bh=tGTk3Wm4FgeLO1LcfvGq5xnHmbsU4cVvWOSH+YZEQMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f+UvqjMlha9M9x/2elF5M2d8zrBXWZkLEf7232JtiBqFYTPMSdjaGY3tuZGIRdTZE
 m6eR56jXr0D9Kh1M2DoysDMZecUD05HFv2183pWnYpVzBodrMFMv470exSoDZGmwP8
 +zfL73ly5LC//Eu1c/D3URAU+lS+0TT2KHf2D9lA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20250827045907epcas2p2da1a021d41298a66065a5191e3dce0cb~fhvCA7fHR1733217332epcas2p2c;
 Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.68]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ4FfLz3hhTP; Wed, 27 Aug
 2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476~fhvA2c-hA2756227562epcas2p3T;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epsmtip2e74a3e3b66e327ddfc875170a9ec110d~fhvAwZKpe1437614376epsmtip2S;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: exynosautov920: enable support for scaler
 device
Date: Wed, 27 Aug 2025 04:47:19 +0000
Message-ID: <20250827044720.3751272-4-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
 <CGME20250827045905epcas2p3a52debf186f41eef08e6d0a351d80476@epcas2p3.samsung.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

Add the Scaler Devicetree for the Scaler present on the
ExynosAutoV920 SoC. The scaler provides hardware acceleration
for 2D scaling up/down and color space conversion processing.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 0fdf2062930a..e3dad683fa36 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -26,6 +26,7 @@ aliases {
 		pinctrl5 = &pinctrl_hsi2ufs;
 		pinctrl6 = &pinctrl_peric0;
 		pinctrl7 = &pinctrl_peric1;
+		scaler0 = &scaler_0;
 	};
 
 	arm-pmu {
@@ -1504,6 +1505,27 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	scaler_0: scaler@1A830000 {
+		compatible = "samsung,exynos5-scaler";
+		reg = <0x0 0x1A830000 0x0 0x3000>;
+		interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
+
+		mscl_qos_table = < 0 800000 800000
+				   0 663000 663000
+				   0 533000 553000
+				   0 400000 400000
+				   0 350000 350000
+				   0 200000 200000
+				   0 160000 160000 >;
+
+		mscl_ppc_table = <  12  496 470
+				    16  374 342
+				    24  303 288
+				    32  189 188
+				   100  479 436	>;
+		status = "disabled";
+	};
 };
 
 #include "exynosautov920-pinctrl.dtsi"
-- 
2.25.1

