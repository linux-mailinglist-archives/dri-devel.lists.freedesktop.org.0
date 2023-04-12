Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C26DF373
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527A510E790;
	Wed, 12 Apr 2023 11:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B2B10E785
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:16 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C6A0066058AD;
 Wed, 12 Apr 2023 12:28:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298895;
 bh=GDKZQ67J0y6mdLDj0BABrBY5g8TxhLW2mBwCl/mxgGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=USPyrLGQvib/VqoSxzNh1ByE6Zrr7sFSutJabzc9WhYYc/x/VpCTGKKAOEc0UMOuK
 Rnt7i8WXOD5hJhzh1o95KJm9bkyeCFrDnxuskXkmJq4952fh+xYaJUDRHzuw8V1oHC
 EUnmGBIayDtvV9txyr1hCII0h5UHXhlF1Vi5gW2deQlk1MD9MmlBcuOs/7BPpy7RRI
 cjkKdSYHQ69s6yN4h+91GhmNywZq/EYwq5EvsT5TnkgPvy8QQ3FmqC2ZqDjR9iqM67
 2j2McbHXbS4IiXpjR306aI3y39j5RSfy783/BSAU2LHTWjdinnUpXQ8DwjIJ5V4jIa
 405BvuAl3FcFA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 21/27] arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
Date: Wed, 12 Apr 2023 13:27:33 +0200
Message-Id: <20230412112739.160376-22-angelogioacchino.delregno@collabora.com>
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

Add the pwrap node: this is used to communicate with the PMIC(s).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 50d9276d18c6..29ca9a7bf0b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -391,6 +391,17 @@ timer: timer@10008000 {
 			clocks = <&system_clk>, <&clk32k>;
 		};
 
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt6795-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&infracfg MT6795_INFRA_RST0_PMIC_WRAP_RST>;
+			reset-names = "pwrap";
+			clocks = <&topckgen CLK_TOP_PMICSPI_SEL>, <&clk26m>;
+			clock-names = "spi", "wrap";
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
2.40.0

