Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157E828AEE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170310E4AF;
	Tue,  9 Jan 2024 17:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1DC10E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:20:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 409HJtTH025983;
 Tue, 9 Jan 2024 11:19:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704820795;
 bh=w2PB4QobwSiLp9szgtnPOF2ZH+GGBmyRNVSuVnT/JME=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cBi+P+nvk2CO++KzlK8/+V2CBgqne4LuBWmSLJm3KUu+Bb1OgEDTtZt2EOdgPm01O
 bCVxfqvLNxKSDwyK5W/mNI6BDcwNlbW6qkbMD2kzfWW4XuG9i2g18mDy8cPaziiFf4
 yoCX7wxyEXb4S5iDlJVdeaXmjh892wdES6x3DbIY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 409HJtsR053325
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jan 2024 11:19:55 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jan 2024 11:19:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jan 2024 11:19:54 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 409HJou8089645;
 Tue, 9 Jan 2024 11:19:53 -0600
From: Andrew Davis <afd@ti.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Adam
 Ford <aford173@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 03/11] ARM: dts: omap3: Add device tree entry for SGX GPU
Date: Tue, 9 Jan 2024 11:19:42 -0600
Message-ID: <20240109171950.31010-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109171950.31010-1-afd@ti.com>
References: <20240109171950.31010-1-afd@ti.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Andrew Davis <afd@ti.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add SGX GPU device entries to base OMAP3 dtsi files.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 arch/arm/boot/dts/ti/omap/am3517.dtsi   | 11 ++++++-----
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi | 11 ++++++-----
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi |  9 +++++----
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am3517.dtsi b/arch/arm/boot/dts/ti/omap/am3517.dtsi
index 77e58e686fb17..19aad715dff70 100644
--- a/arch/arm/boot/dts/ti/omap/am3517.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am3517.dtsi
@@ -162,12 +162,13 @@ sgx_module: target-module@50000000 {
 			clock-names = "fck", "ick";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x50000000 0x4000>;
+			ranges = <0 0x50000000 0x10000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu@0 {
+				compatible = "ti,omap3430-gpu", "img,powervr-sgx530";
+				reg = <0x0 0x10000>; /* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap34xx.dtsi b/arch/arm/boot/dts/ti/omap/omap34xx.dtsi
index fc7233ac183a8..acdd0ee34421d 100644
--- a/arch/arm/boot/dts/ti/omap/omap34xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap34xx.dtsi
@@ -164,12 +164,13 @@ sgx_module: target-module@50000000 {
 			clock-names = "fck", "ick";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x50000000 0x4000>;
+			ranges = <0 0x50000000 0x10000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu@0 {
+				compatible = "ti,omap3430-gpu", "img,powervr-sgx530";
+				reg = <0x0 0x10000>; /* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index e6d8070c1bf88..c3d79ecd56e39 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -211,10 +211,11 @@ sgx_module: target-module@50000000 {
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu@0 {
+				compatible = "ti,omap3630-gpu", "img,powervr-sgx530";
+				reg = <0x0 0x2000000>; /* 32MB */
+				interrupts = <21>;
+			};
 		};
 	};
 
-- 
2.39.2

