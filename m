Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDEB103FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E71C10E8F8;
	Thu, 24 Jul 2025 08:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HymlcTuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBBA10E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346463;
 bh=Pel7h38bcUMPfE/D3HqIepQWXGSnvjnAoZZOpkysy0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HymlcTuK7c/Bm3rlM5A2/bpPos7MG5VigxisyMResbZzyrX3Si6gHiNxYTjgPpZH2
 WSsj912RwYurKIeVl7ernFmlDS4bVobJfvv3TSVkhpBRl4hoYASx2QQDjQnFSP+Lov
 4gIiPuSAY1ImG6gM71MLaBwTtd1RvyLoxPcmym3IJ6QkGIvgC4OCv3LIN/HwE3Vn6b
 MXwb0oZZ5TzIXiRt6ZJNks9zCI+cHiQL74HyaUGaow2LIylkClfuUqkCasuRsSOMZ6
 dfVQVYFDRrqNkNfUqQdkbcgi/BsAM7hQ+IZRbhs6PIfK0VYscP1JZldAPp3lNuJ8v3
 MtLqDTdE3eu0Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ECB2117E1062;
 Thu, 24 Jul 2025 10:41:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, atenart@kernel.org,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 37/38] arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360
 regulator nodes
Date: Thu, 24 Jul 2025 10:39:13 +0200
Message-ID: <20250724083914.61351-38-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All of the MT6360 regulator nodes were wrong and would not probe
because the regulator names are supposed to be lower case, but
they are upper case in this devicetree.

Change all nodes to be lower case to get working regulators.

Fixes: 94aaf79a6af5 ("arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index 4985b65925a9..d16f545cbbb2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -352,7 +352,7 @@ regulator {
 			LDO_VIN2-supply = <&vsys>;
 			LDO_VIN3-supply = <&vsys>;
 
-			mt6360_buck1: BUCK1 {
+			mt6360_buck1: buck1 {
 				regulator-name = "emi_vdd2";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1800000>;
@@ -362,7 +362,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_buck2: BUCK2 {
+			mt6360_buck2: buck2 {
 				regulator-name = "emi_vddq";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1300000>;
@@ -372,7 +372,7 @@ MT6360_OPMODE_LP
 				regulator-always-on;
 			};
 
-			mt6360_ldo1: LDO1 {
+			mt6360_ldo1: ldo1 {
 				regulator-name = "mt6360_ldo1"; /* Test point */
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3600000>;
@@ -380,7 +380,7 @@ mt6360_ldo1: LDO1 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo2: LDO2 {
+			mt6360_ldo2: ldo2 {
 				regulator-name = "panel1_p1v8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -388,7 +388,7 @@ mt6360_ldo2: LDO2 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo3: LDO3 {
+			mt6360_ldo3: ldo3 {
 				regulator-name = "vmc_pmu";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
@@ -396,7 +396,7 @@ mt6360_ldo3: LDO3 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo5: LDO5 {
+			mt6360_ldo5: ldo5 {
 				regulator-name = "vmch_pmu";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -404,7 +404,7 @@ mt6360_ldo5: LDO5 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo6: LDO6 {
+			mt6360_ldo6: ldo6 {
 				regulator-name = "mt6360_ldo6"; /* Test point */
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2100000>;
@@ -412,7 +412,7 @@ mt6360_ldo6: LDO6 {
 							   MT6360_OPMODE_LP>;
 			};
 
-			mt6360_ldo7: LDO7 {
+			mt6360_ldo7: ldo7 {
 				regulator-name = "emi_vmddr_en";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-- 
2.50.1

