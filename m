Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B26DF376
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D65D10E793;
	Wed, 12 Apr 2023 11:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE410E377
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:20 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 04496660328E;
 Wed, 12 Apr 2023 12:28:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298899;
 bh=VzMpC2ylIvPbeGRaM8hTndNXA0jJmN7L511Odi3RhPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NXvDtQJ37lxvR/koYZz67/GC+4r1u9X0Qh/yvf8gDT6BI9s/W+l4B0js3i6aGEQpb
 4U+O5sQJBxuWwmFqisqL4TrC3Eghy10zEK0IzMV73BsVJcphsVZTBHBt1JrHgerCrA
 55LDUQ9x6w9zIbc5nbZaDtp50KHbE/tXfA/heWMSShd8dHZIaKDziqcYCMcxAFxakU
 9QdIQoLtXP0CYrbZlFWhPD4vgrrUteqwW+cZyjKBBfZfNwV8aWqtnJeDLfZjGrz10a
 JQoruXQ0qNStVKMPgLuVft6us1VVthVll1SqrStJpmjY8mb1Lm51Y7c2NZRgPWwh/z
 sZdyM2NTdjcew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 24/27] arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331
 Combo PMIC
Date: Wed, 12 Apr 2023 13:27:36 +0200
Message-Id: <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This smartphone uses the Helio X10 standard MT6331+MT6332 combo PMICs:
include the mt6331 devicetree and add the required interrupt.

Note that despite there being two interrupts, one for MT6331 and one
for MT6332, in configurations using the companion PMIC, the interrupt
of the latter fires for both events on MT6331 and for ones on MT6332,
while the interrupt for the main PMIC fires only for events of the
main PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index a0e01a756f03..debe0f2553d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
 #include "mt6795.dtsi"
+#include "mt6331.dtsi"
 
 / {
 	model = "Sony Xperia M5";
@@ -219,6 +220,15 @@ pins-tx {
 	};
 };
 
+&pmic {
+	/*
+	 * Smartphones, including the Xperia M5, are equipped with a companion
+	 * MT6332 PMIC: when this is present, the main MT6331 PMIC will fire
+	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
+	 */
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 
-- 
2.40.0

