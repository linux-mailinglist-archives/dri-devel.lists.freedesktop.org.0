Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5EA665B92
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 13:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F012D10E71A;
	Wed, 11 Jan 2023 12:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6CF10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 12:37:23 +0000 (UTC)
X-UUID: afc36af491ac11ed945fc101203acc17-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BWKe6zW3OozMra5zW8Umlb+TgA2g/HpZDzkEf1yramo=; 
 b=MKmI6r7GIUgu5GjKU6o8Q942EOQXGQzKKiwjsuqJBU1ceI6fIywtJt4kYtjIRlVxz6TNuion7vveh99x6lVRkhFjOTB9jzWbFbXp+3VH3AukSbKuftTHWWmYB05TS02r+k35Ws6UbOvAPD6l4eLfWYIOHD4bTKEVlW+SYTDfry8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:64d38d8c-80af-495d-8fed-081687349602, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:543e81c, CLOUDID:6a5b5b54-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: afc36af491ac11ed945fc101203acc17-20230111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1222058794; Wed, 11 Jan 2023 20:37:18 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:17 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] arm64: dts: mediatek: mt8186: Add ADSP node
Date: Wed, 11 Jan 2023 20:37:07 +0800
Message-ID: <20230111123711.32020-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ADSP node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0b7dacc10cd..2700c830316f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -640,6 +640,26 @@
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		adsp: adsp@10680000 {
+			compatible = "mediatek,mt8186-dsp";
+			reg = <0 0x10680000 0 0x2000>,
+			      <0 0x10800000 0 0x100000>,
+			      <0 0x1068b000 0 0x100>,
+			      <0 0x1068f000 0 0x1000>;
+			reg-names = "cfg", "sram", "sec", "bus";
+			clocks = <&topckgen CLK_TOP_AUDIODSP>,
+				 <&topckgen CLK_TOP_ADSP_BUS>;
+			clock-names = "audiodsp",
+				      "adsp_bus";
+			assigned-clocks = <&topckgen CLK_TOP_AUDIODSP>,
+					  <&topckgen CLK_TOP_ADSP_BUS>;
+			assigned-clock-parents = <&clk26m>, <&topckgen CLK_TOP_MAINPLL_D2_D2>;
+			mbox-names = "rx", "tx";
+			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_ADSP_TOP>;
+			status = "disabled";
+		};
+
 		adsp_mailbox0: mailbox@10686000 {
 			compatible = "mediatek,mt8186-adsp-mbox";
 			#mbox-cells = <0>;
-- 
2.18.0

