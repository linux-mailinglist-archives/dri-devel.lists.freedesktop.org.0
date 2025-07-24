Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0DB103F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D0610E8ED;
	Thu, 24 Jul 2025 08:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mohmbY1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B177410E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346455;
 bh=mFbuAM5ZhB+OJa9KME98odHO4UJ473ILd2p4q9JxTKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mohmbY1pYbDjkf6kEDQF/IH0XkbcczQ5frh6z1HJDMqThe6CYH0tysljApwDw1NuM
 KkaStjTUtDm8fbHkG41N9PizXPGd08cbFyhyZavsJx0A5b0lQ1iqB8rjoFrCDZmahK
 o/Mucxkd4DCNLO3vW+0xdEJwLypaaGUhizPfU8fHLCvwit6gnUspvdNsM2bnkdGjjM
 zs6XpQMjngBqYBtc4ptxOqrLfFFFeYHB1zTipu2Jkj3rJbd7REqCzO3Cu9YR5DQvzP
 kcp5BrHHf7YQ+RVKjcu83t2+Pzf7no+o9bqZHDaAhQuHaHNwB9kv67OyurqVdgFP1Z
 /rqdiOPszak0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BAF117E11EE;
 Thu, 24 Jul 2025 10:40:53 +0200 (CEST)
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
Subject: [PATCH 34/38] arm64: dts: mediatek: mt8195: Fix ranges for jpeg
 enc/decoder nodes
Date: Thu, 24 Jul 2025 10:39:10 +0200
Message-ID: <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
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

The jpeg decoder main node is under the soc bus but currently has
no ranges or reg specified, while the children do, and this is
wrong in multiple aspects.

The very same is also valid for the jpeg encoder node.

Rename the decoder and encoder nodes to "jpeg-decoder@1a040000"
and to "jpeg-encoder@1a030000" respectively, and change their
children to use the newly defined ranges.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 +++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index dd065b1bf94a..35b10082bb89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3014,7 +3014,7 @@ venc: video-codec@1a020000 {
 			#size-cells = <2>;
 		};
 
-		jpgdec-master {
+		jpeg-decoder@1a040000 {
 			compatible = "mediatek,mt8195-jpgdec";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
 			iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
@@ -3025,11 +3025,12 @@ jpgdec-master {
 				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
+			ranges = <0 0 0 0x1a040000 0 0x20000>,
+				 <1 0 0 0x1b040000 0 0x10000>;
 
-			jpgdec@1a040000 {
+			jpgdec@0,0 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+				reg = <0 0 0 0x10000>;/* JPGDEC_C0 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -3042,9 +3043,9 @@ jpgdec@1a040000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
 			};
 
-			jpgdec@1a050000 {
+			jpgdec@0,10000 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -3057,9 +3058,9 @@ jpgdec@1a050000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
 			};
 
-			jpgdec@1b040000 {
+			jpgdec@1,0 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+				reg = <1 0 0 0x10000>;/* JPGDEC_C2 */
 				iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
 					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
 					 <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
@@ -3088,7 +3089,7 @@ vdosys0: syscon@1c01a000 {
 		};
 
 
-		jpgenc-master {
+		jpeg-encoder@1a030000 {
 			compatible = "mediatek,mt8195-jpgenc";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
 			iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
@@ -3097,11 +3098,12 @@ jpgenc-master {
 					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
+			ranges = <0 0 0 0x1a030000 0 0x10000>,
+				 <1 0 0 0x1b030000 0 0x10000>;
 
-			jpgenc@1a030000 {
+			jpgenc@0,0 {
 				compatible = "mediatek,mt8195-jpgenc-hw";
-				reg = <0 0x1a030000 0 0x10000>;
+				reg = <0 0 0 0x10000>;
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
 						<&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
 						<&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
@@ -3112,9 +3114,9 @@ jpgenc@1a030000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 			};
 
-			jpgenc@1b030000 {
+			jpgenc@1,0 {
 				compatible = "mediatek,mt8195-jpgenc-hw";
-				reg = <0 0x1b030000 0 0x10000>;
+				reg = <1 0 0 0x10000>;
 				iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
 						<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
 						<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
-- 
2.50.1

