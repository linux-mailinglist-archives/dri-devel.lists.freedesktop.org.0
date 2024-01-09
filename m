Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62260828AEF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7621210E4B4;
	Tue,  9 Jan 2024 17:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F00710E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:20:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 409HK1S0072326;
 Tue, 9 Jan 2024 11:20:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704820801;
 bh=VawEpna3v0lS7GPRRlnu64Wvw1h5R0QsWm64N4grDiw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xmiYQpsARtN81uqOzExACSARNxYnhZvs4K0pyNiKgxK2BJzbiJfcdiB3+ZV8vxNJs
 tQN/JZcPK1Jf0hcRMO7dYO8iJTHC4g47Dojqj2Q/fJTpPEcC25YGuy+PeugZcaQXGb
 J6vM3E+qLYpUyLRXoZNJrkHHCulmNNhtXak5EflM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 409HK1pE123483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jan 2024 11:20:01 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jan 2024 11:20:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jan 2024 11:20:00 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 409HJouF089645;
 Tue, 9 Jan 2024 11:20:00 -0600
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
Subject: [PATCH 10/11] ARM: dts: sun6i: Add device tree entry for SGX GPU
Date: Tue, 9 Jan 2024 11:19:49 -0600
Message-ID: <20240109171950.31010-11-afd@ti.com>
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

Add SGX GPU device entry to base sun6i-a31 dtsi file.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 arch/arm/boot/dts/allwinner/sun6i-a31.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi b/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
index 5cce4918f84c9..e6998783b89aa 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31.dtsi
@@ -962,6 +962,15 @@ mdio: mdio {
 			};
 		};
 
+		gpu: gpu@1c40000 {
+			compatible = "allwinner,sun6i-a31-gpu", "img,powervr-sgx544";
+			reg = <0x01c40000 0x10000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_GPU_CORE>, <&ccu CLK_GPU_MEMORY>;
+			clock-names = "core", "mem";
+			status = "disabled";
+		};
+
 		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun6i-a31-crypto",
 				     "allwinner,sun4i-a10-crypto";
-- 
2.39.2

