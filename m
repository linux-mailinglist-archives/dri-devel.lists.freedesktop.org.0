Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B593DB392
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 08:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BEE6F3E4;
	Fri, 30 Jul 2021 06:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE326E219
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 02:55:30 +0000 (UTC)
X-UUID: 911f4e65bfa74707aecf73c96660a054-20210730
X-UUID: 911f4e65bfa74707aecf73c96660a054-20210730
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 646978137; Fri, 30 Jul 2021 10:55:25 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:55:23 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:55:19 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 11/12] arm: dts: mediatek: Get rid of mediatek,
 larb for MM nodes
Date: Fri, 30 Jul 2021 10:52:37 +0800
Message-ID: <20210730025238.22456-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Jul 2021 06:27:41 +0000
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 yong.wu@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 acourbot@chromium.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After adding device_link between the IOMMU consumer and smi,
the mediatek,larb is unnecessary now.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 arch/arm/boot/dts/mt2701.dtsi  | 2 --
 arch/arm/boot/dts/mt7623n.dtsi | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 4776f85d6d5b..ef583cfd3baf 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -564,7 +564,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -577,7 +576,6 @@
 		clocks =  <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
 	};
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index bcb0846e29fd..3adab5cd1fef 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -121,7 +121,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -144,7 +143,6 @@
 		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_OVL>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	rdma0: rdma@14008000 {
@@ -154,7 +152,6 @@
 		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	wdma@14009000 {
@@ -164,7 +161,6 @@
 		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_WDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	bls: pwm@1400a000 {
@@ -215,7 +211,6 @@
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
-		mediatek,larb = <&larb0>;
 	};
 
 	dpi0: dpi@14014000 {
-- 
2.18.0

