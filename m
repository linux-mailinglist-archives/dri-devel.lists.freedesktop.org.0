Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE5B103EE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AA610E8EF;
	Thu, 24 Jul 2025 08:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k4MdlrNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182210E8ED
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346450;
 bh=c3mbvg3u8ROaaVs8EH08ECKYZrtr/aCMlnPYd9mL1/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k4MdlrNzkD4Rmw1BMR/lF2F0uaiAwVc82OaIwwu1Fbki6DayF4jykh+gTzEPdt//d
 0SyD4eRgRLg9R8nuQipR7l7OzJ7gF9HT27S1UsB/mb8iqofl4/h1iefpl3xr8bfiyn
 npCe2sAd5AyQc9QoJtz+q/BLXBlGrw+B3JnmpGItPJ4RqDI9Nm6RdlvVOW+dpU7n9E
 ANXFwEfKPieMsmX5YcWJcrHhttc0AU8vHmJpUVUX1wclqmBu3X6RPjeRJJ8cg3lgrA
 oT/pZ0DJQPtwT11WUhafef4x4nS8GhGHYrJTiJvDFoIlKq+DU93Fx70eMOJD3fzue7
 hPUeh9yjNFyRA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8A8217E1110;
 Thu, 24 Jul 2025 10:40:47 +0200 (CEST)
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
Subject: [PATCH 32/38] arm64: dts: mediatek: mt8183: Migrate to display
 controller OF graph
Date: Thu, 24 Jul 2025 10:39:08 +0200
Message-ID: <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
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

The display related IPs in MT8183 are flexible and support being
interconnected with different instances of DDP IPs forming a full
Display Data Path that ends with an actual display output, which
is board specific.

Add a common graph in the main mt8183.dtsi devicetree, which is
shared between all of the currently supported boards, and do it
such that only a very minimal amount of changes are needed to
each board - the only required change was done in mt8183-pumpkin,
using a phandle to assign the display to DPI0.

All boards featuring any display functionality will extend this
common graph to hook the display controller of the SoC to their
specific output port(s).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   8 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
 2 files changed, 238 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index d5fcb010e1ac..cf1d33384bf0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -531,10 +531,8 @@ &dpi0 {
 	pinctrl-0 = <&dpi_func_pins>;
 	pinctrl-1 = <&dpi_idle_pins>;
 	status = "okay";
+};
 
-	port {
-		dpi_out: endpoint {
-			remote-endpoint = <&it66121_in>;
-		};
-	};
+&dpi_out {
+	remote-endpoint = <&it66121_in>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9..960d8955d018 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1667,6 +1667,21 @@ mmsys: syscon@14000000 {
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_ep_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+
+				mmsys_ep_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&ovl_2l1_in>;
+				};
+			};
 		};
 
 		dma-controller0@14001000 {
@@ -1733,6 +1748,25 @@ ovl0: ovl@14008000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_ep_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&ovl_2l0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l0: ovl@14009000 {
@@ -1743,6 +1777,25 @@ ovl_2l0: ovl@14009000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l0_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l0_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l1: ovl@1400a000 {
@@ -1753,6 +1806,25 @@ ovl_2l1: ovl@1400a000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l1_in: endpoint {
+						remote-endpoint = <&mmsys_ep_ext>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l1_out: endpoint {
+						remote-endpoint = <&rdma1_in>;
+					};
+				};
+			};
 		};
 
 		rdma0: rdma@1400b000 {
@@ -1764,6 +1836,25 @@ rdma0: rdma@1400b000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&ovl_2l0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&color0_in>;
+					};
+				};
+			};
 		};
 
 		rdma1: rdma@1400c000 {
@@ -1775,6 +1866,25 @@ rdma1: rdma@1400c000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma1_in: endpoint {
+						remote-endpoint = <&ovl_2l1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma1_out: endpoint {
+						remote-endpoint = <&dpi_in>;
+					};
+				};
+			};
 		};
 
 		color0: color@1400e000 {
@@ -1785,6 +1895,25 @@ color0: color@1400e000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color0_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color0_out: endpoint {
+						remote-endpoint = <&ccorr0_in>;
+					};
+				};
+			};
 		};
 
 		ccorr0: ccorr@1400f000 {
@@ -1794,6 +1923,25 @@ ccorr0: ccorr@1400f000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr0_in: endpoint {
+						remote-endpoint = <&color0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr0_out: endpoint {
+						remote-endpoint = <&aal0_in>;
+					};
+				};
+			};
 		};
 
 		aal0: aal@14010000 {
@@ -1803,6 +1951,25 @@ aal0: aal@14010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal0_in: endpoint {
+						remote-endpoint = <&ccorr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal0_out: endpoint {
+						remote-endpoint = <&gamma0_in>;
+					};
+				};
+			};
 		};
 
 		gamma0: gamma@14011000 {
@@ -1812,6 +1979,25 @@ gamma0: gamma@14011000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma0_in: endpoint {
+						remote-endpoint = <&aal0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma0_out: endpoint {
+						remote-endpoint = <&dither0_in>;
+					};
+				};
+			};
 		};
 
 		dither0: dither@14012000 {
@@ -1821,6 +2007,25 @@ dither0: dither@14012000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither0_in: endpoint {
+						remote-endpoint = <&gamma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither0_out: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
 		};
 
 		dsi0: dsi@14014000 {
@@ -1837,8 +2042,21 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 			status = "disabled";
 
-			port {
-				dsi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&dither0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
 			};
 		};
 
@@ -1853,8 +2071,21 @@ dpi0: dpi@14015000 {
 			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
 
-			port {
-				dpi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi_in: endpoint {
+						remote-endpoint = <&rdma1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi_out: endpoint { };
+				};
 			};
 		};
 
-- 
2.50.1

