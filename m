Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5CB103E1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3010E8E1;
	Thu, 24 Jul 2025 08:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YUcauFlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3110E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346423;
 bh=HmcM0WeCZU7S4LzqqW3oQHysgDBq3tk4yf4yJqDJOZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YUcauFlv/b9vDuXRLNiXYP5fX6JLVhE2p5S2nlvhh8SjU50Eebfq3Km5CMp8paEVi
 xMIYIYOZjSGJ2BmtPCEHEZisaGV2nY2me9bSngW4ysRMzTnLqsfKj47VMO//FEhSZ4
 wWiz/zHDd18LGWCFuls9E2VjeKey52GoZ7U43O5foDLbDoG3rOJysSu8ZmsJQH1Zgq
 wdIaPt6lTMkADy/C/REo+6HH4P2zKErEBI3VSFtofio5OdnBqWoiAlffopBK627c0+
 wSx5wrl8I6jIGHoQjAcyz083dAlke8YtbqxH7JaUzcDsuT4r7dgkPsrElJ8EVmD/Er
 Cj4JPDO2tipDw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 464D117E1110;
 Thu, 24 Jul 2025 10:40:21 +0200 (CEST)
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
Subject: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ
 controller on all SoCs
Date: Thu, 24 Jul 2025 10:38:58 +0200
Message-ID: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
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

The sysirq has "intpol-controller" as node name, but being this an
interrupt controller, it needs to be named "interrupt-controller"
as per what the bindings (correctly) expect.

This commit brings no functional changes, but fixes a dtbs_check
warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
index b55d3fac9bd4..8da5c0a56a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
@@ -98,7 +98,7 @@ timer {
 			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6755-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 5c579e88e749..70f3375916e8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
 
 		};
 
-		sysirq: intpol-controller@c53a650 {
+		sysirq: interrupt-controller@c53a650 {
 			compatible = "mediatek,mt6779-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 38f65aad2802..58833e5135c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
-		sysirq: intpol-controller@10200620 {
+		sysirq: interrupt-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index f2d93bf6a055..8ac98a378fd6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
 		#clock-cells = <1>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
-- 
2.50.1

