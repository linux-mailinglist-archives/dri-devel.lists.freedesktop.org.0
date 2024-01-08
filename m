Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E4827784
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 19:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C03E10E14F;
	Mon,  8 Jan 2024 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37E10E14F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 18:33:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 408IXB3f118827;
 Mon, 8 Jan 2024 12:33:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704738791;
 bh=/DHNdb2h/H27I/9d/VEE7PByu6B0S/1IcDh2mFWNTsA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Q+N/VumYrDVvQrG3H8VtK2FcGaR/oPbAJNQcA3+rxlDGsVvWE3xhwwUYhuDIYFmZ5
 VtOz0SgS3mryyHl9xHJBeULWl5+zBYTH9egL72oN/9NHGTxwVwMunQVcG40bNIExos
 53uWGNxi7pXSSg2UEkRr90M5HiIQAM2XeeifUSzI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 408IXBST057389
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jan 2024 12:33:11 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jan 2024 12:33:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jan 2024 12:33:10 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 408IX3hG051691;
 Mon, 8 Jan 2024 12:33:09 -0600
From: Andrew Davis <afd@ti.com>
To: Frank Binns <frank.binns@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
Subject: [PATCH RFC v2 07/11] ARM: dts: AM437x: Add device tree entry for SGX
 GPU
Date: Mon, 8 Jan 2024 12:32:58 -0600
Message-ID: <20240108183302.255055-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108183302.255055-1-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
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

Add SGX GPU device entry to base AM437x dtsi file.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm/boot/dts/ti/omap/am4372.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am4372.dtsi b/arch/arm/boot/dts/ti/omap/am4372.dtsi
index 9d2c064534f7d..5fd1b380ece62 100644
--- a/arch/arm/boot/dts/ti/omap/am4372.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am4372.dtsi
@@ -719,6 +719,12 @@ target-module@56000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
+
+			gpu@0 {
+				compatible = "ti,omap3630-gpu", "img,powervr-sgx530";
+				reg = <0x0 0x10000>; /* 64kB */
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 	};
 };
-- 
2.39.2

