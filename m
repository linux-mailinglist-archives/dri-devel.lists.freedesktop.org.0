Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CDBF4F74
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A4110E572;
	Tue, 21 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hy3dnRt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72A410E572
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761031907;
 bh=u+G8Mt1dpRFClpUAKvKbFwgypYjcR8NzUmnmamS1YxM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hy3dnRt3eGLK9sJNQcn2Pt6rxou3kv6Wfv2SP/N/THo1eNPYIzy9TRnq63NrEe4wM
 3d0cKnRe9qgCTziRmCs+3GxI/w15CJl941+Z3ktXdfq/GWSexB2keIn2YeTgglJqQd
 xQv04P2xssQLfgyP4AVJ/tJ20JJllo4EuuLKDjyNKJllhPKO271r3IS9m//4ynms0i
 zl75+KqwwF7Qdq12kbfhNk46A+POCAp9k+aIDz6qJ9ubhe3tUMINsDzVQhIIdLZgYm
 a3dI8YlQBaScUvg85jgXwWmLp6lFcqrzXqHEq88bJgmn2zWhnvevXiMw/L0tgWWDa8
 9wBba5oa2yjVA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E0EA417E1305;
 Tue, 21 Oct 2025 09:31:46 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 21 Oct 2025 09:30:52 +0200
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8365: Add GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-mt8365-enable-gpu-v2-2-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761031905; l=2580;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=u+G8Mt1dpRFClpUAKvKbFwgypYjcR8NzUmnmamS1YxM=;
 b=y05pIlBN0LFY95ArJuuCsCuEONmMvdyrcfp3eGfkpqGJkcEnRG5trecSjXqSwe1G06oqT2A7H
 LCL+qahdJMeCBNOr/GGmvc/3avl+W9OykjeO9G1siKKpKZItu8jez8d
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

The Mediatek MT8365 SoC has an integrated Arm Mali G52 MC1 GPU
(Bifrost).
Add gpu, OPP table, and MFG clock driver nodes in mt8365.dtsi to support
it using the Panfrost driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b7a855129258b379ae4bc2fd05449..a5ca3cda6ef30d59a106222549dc15bcb6ce503d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -267,6 +267,26 @@ clk26m: oscillator {
 		clock-output-names = "clk26m";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <650000>;
+		};
+
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000>;
+			opp-microvolt = <700000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -292,6 +312,27 @@ gic: interrupt-controller@c000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mfgcfg: syscon@13000000 {
+			compatible = "mediatek,mt8365-mfgcfg", "syscon";
+			reg = <0 0x13000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8365-mali", "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MFG>;
+			status = "disabled";
+		};
+
 		topckgen: syscon@10000000 {
 			compatible = "mediatek,mt8365-topckgen", "syscon";
 			reg = <0 0x10000000 0 0x1000>;
@@ -398,7 +439,7 @@ power-domain@MT8365_POWER_DOMAIN_CONN {
 					mediatek,infracfg = <&infracfg>;
 				};
 
-				power-domain@MT8365_POWER_DOMAIN_MFG {
+				mfg: power-domain@MT8365_POWER_DOMAIN_MFG {
 					reg = <MT8365_POWER_DOMAIN_MFG>;
 					clocks = <&topckgen CLK_TOP_MFG_SEL>;
 					clock-names = "mfg";

-- 
2.51.0

