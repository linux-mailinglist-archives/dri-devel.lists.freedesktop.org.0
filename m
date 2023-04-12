Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3C6DF374
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D2A10E4BB;
	Wed, 12 Apr 2023 11:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B431510E791
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:14 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65634660322C;
 Wed, 12 Apr 2023 12:28:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298893;
 bh=FBEtOJ4WIs2BY9QNkotVKZUvt7CQzM53jFa4FvLuaOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DoAp7wTIj1oqZn671PpiSDWzBbaVQ4ovQGo02MLSH9jh2QhQzCG/mpRMzm0xRzhrr
 v9+b7inz9dkg+vX6tWhbS93utWRW+io95SFdVmlDy/JZ1Oypsn7EF3Zo9KxnWrqQN5
 Ih9qxPG5xZ6/xcjq+KpEWcpHf5SRXFI7GTDfCuKthurFADfPnKBEyLjEV/794Ui4fB
 FFxpuexeNlO4cpeYi+AsEGgPtSGgsrGJ97cHLaOVhv73lN9BStPj/13Tju1jXh/NMr
 ehMlB9AcJcIqYo0loEHD9jY9AOOK9/NgAh41AsuP5iYysfQWtfB3kaz3PffcnP9a9E
 zYnotGletuYNA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 20/27] arm64: dts: mediatek: mt6795: Add tertiary PWM node
Date: Wed, 12 Apr 2023 13:27:32 +0200
Message-Id: <20230412112739.160376-21-angelogioacchino.delregno@collabora.com>
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

The PWM at 0x11006000 is the tertiary PWM; unlike PWM0, PWM1, this is
not display specific and can be used as a generic PWM controller.

This node is left disabled as usage is board-specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index cf45cb4ad3d2..50d9276d18c6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -583,6 +583,25 @@ uart3: serial@11005000 {
 			status = "disabled";
 		};
 
+		pwm2: pwm@11006000 {
+			compatible = "mediatek,mt6795-pwm";
+			reg = <0 0x11006000 0 0x1000>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_PWM_SEL>,
+				 <&pericfg CLK_PERI_PWM>,
+				 <&pericfg CLK_PERI_PWM1>,
+				 <&pericfg CLK_PERI_PWM2>,
+				 <&pericfg CLK_PERI_PWM3>,
+				 <&pericfg CLK_PERI_PWM4>,
+				 <&pericfg CLK_PERI_PWM5>,
+				 <&pericfg CLK_PERI_PWM6>,
+				 <&pericfg CLK_PERI_PWM7>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4", "pwm5", "pwm6", "pwm7";
+			status = "disabled";
+		};
+
 		i2c0: i2c@11007000 {
 			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
 			reg = <0 0x11007000 0 0x70>, <0 0x11000100 0 0x80>;
-- 
2.40.0

