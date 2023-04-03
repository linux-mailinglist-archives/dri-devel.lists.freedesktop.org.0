Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C86D3E01
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 09:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2910E16F;
	Mon,  3 Apr 2023 07:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D8310E161
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 07:20:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q19so25126644wrc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680506399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HNxrkMKzkeJmPHsocCG7IvyDD2jEgSq/BSvAma681o=;
 b=jY8WBlhnxjUV/FsCz487r6NyUW0zk0IaApuwoSeroehWPPFYW8FBRPcrlODt/OJmwb
 ZNOGdFyVpZlzVgGhllhgu9jLcP5iMmAbQdml3W+AdCqO8B28ZXR5pRRhFu+0UMhpwvz5
 aWfVpV+6sxAe2nvK6Qxnz0XB3rJ5pQFqMsnnYsPuJk1LncJ6dE2QMzue+TDfnQ833RYg
 MHyT4PGZlfq6nH81KsfoGbT2ngDLbd1QYMa+v7kDsGG8b4J5QTjJed6ttWNXJjiOqyrt
 6x/lQ6lLqBeBQFAd4v4/aYX0owD3ZqL0hxFwVjWfcFgviBssfQM6oQlxXRtpbayzIYdy
 iRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680506399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HNxrkMKzkeJmPHsocCG7IvyDD2jEgSq/BSvAma681o=;
 b=323ZxU4aQcz2sU4XP3DkOkwTZ5LZECWLkBE35KUK2MUqiwF/htwLlJlpNvUcYTWPc6
 3ghXH3bpznoRTp6tENOjmOAXGgdccll2yJjWd1NFJbH8my4U16IOrxa4ycFSKB04X6j3
 2/fbMCd5O+DcQ6DeDYM3hTQ7AaWQ+YKxu3gkufDV5PW7Ze/wgoc6xif12eUPoaF0XMs1
 +reLJTrKT1hIyJ7JCP+3Y12HKNDrHgbBl50ox9IHqU7FfalDEHRitjw7L2hyWcIPop2c
 2TsNyysruBTS9oqH83OqN4jlFX/QnJXffv3y0zenUcDnpJM1W26j80Fvk4i846HTCswW
 HwQg==
X-Gm-Message-State: AAQBX9cNLLDwo9H9UmV+zWprzsq0Tcpkgb9fCezsU68Y2ep4kOYYFMQ6
 c2u7itqpLLAlemolJeBuVyJhQg==
X-Google-Smtp-Source: AKy350ZcYjTlNnPN2FlK38JA1ApyqoAt6/49RpDy+xb0dkZJiHzAMc7XaEcDu95M6zHN9q8QFnemNQ==
X-Received: by 2002:a05:6000:114b:b0:2e4:cbef:9f2a with SMTP id
 d11-20020a056000114b00b002e4cbef9f2amr10025587wrx.2.1680506399241; 
 Mon, 03 Apr 2023 00:19:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003ee6aa4e6a9sm19060418wmp.5.2023.04.03.00.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:19:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Mon,  3 Apr 2023 09:19:29 +0200
Message-Id: <20230403071929.360911-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403071929.360911-1-jstephan@baylibre.com>
References: <20230403071929.360911-1-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This is a new driver that supports the MIPI CSI CD-PHY for mediatek
mt8365 soc

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
[Julien Stephan: use regmap]
[Julien Stephan: use GENMASK]
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
 MAINTAINERS                                   |   1 +
 drivers/phy/mediatek/Kconfig                  |   8 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
 6 files changed, 845 insertions(+), 2 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c

diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
index c026e43f35fd..ad4ba1d93a68 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
@@ -33,9 +33,14 @@ additionalProperties: false
 
 examples:
   - |
-    phy@10011800 {
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      phy@11c10000 {
         compatible = "mediatek,mt8365-mipi-csi";
-        reg = <0 0x10011800 0 0x60>;
+        reg = <0 0x11c10000 0 0x4000>;
         #phy-cells = <1>;
+      };
     };
 ...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9308b4bb88bf..b3077eddd0bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13103,6 +13103,7 @@ M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
+F:	drivers/phy/mediatek/phy-mtk-mipi-csi*
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 3125ecb5d119..63fb0fa77573 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -74,3 +74,11 @@ config PHY_MTK_DP
 	select GENERIC_PHY
 	help
 	  Support DisplayPort PHY for MediaTek SoCs.
+
+config PHY_MTK_MIPI_CSI
+	tristate "MediaTek CSI CD-PHY Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the MIPI CSI CD-PHY receiver.
+	  The driver supports multiple CSI cdphy ports simultaneously.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index fb1f8edaffa7..9a178c1c2628 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -18,3 +18,5 @@ phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
 obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
+
+obj-$(CONFIG_PHY_MTK_MIPI_CSI)		+= phy-mtk-mipi-csi.o
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h b/drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
new file mode 100644
index 000000000000..f360e807e3d1
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
@@ -0,0 +1,435 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __MIPI_CDPHY_RX_REG_H__
+#define __MIPI_CDPHY_RX_REG_H__
+
+/*
+ * CSI1 and CSI2 are identical, and similar to CSI0. All CSIx macros are
+ * applicable to the three PHYs. Where differences exist, they are denoted by
+ * macro names using CSI0 and CSI1, the latter being applicable to CSI1 and
+ * CSI2 alike.
+ */
+
+/*
+ * Due to lanes supporting C-PHY mode on CSI0, register fields that control the
+ * behaviour of lanes are named differently between CSI0 and CSI1/CSI2, even
+ * when they control parameters that are agnostic to the PHY mode. In those
+ * cases, the macros below use the CSI0 field names (e.g.
+ * MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0P_T0A_HSRT_CODE_SHIFT).
+ */
+
+#define MIPI_RX_ANA00_CSIxA							0x0000
+#define MIPI_RX_ANA00_CSIxA_RG_CSI0A_CPHY_EN_SHIFT				0
+#define MIPI_RX_ANA00_CSIxA_RG_CSI0A_CPHY_EN_MASK				BIT(0)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_EQ_PROTECT_EN_SHIFT			1
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_EQ_PROTECT_EN_MASK				BIT(1)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_BG_LPF_EN_SHIFT				2
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_BG_LPF_EN_MASK				BIT(2)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_BG_CORE_EN_SHIFT				3
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_BG_CORE_EN_MASK				BIT(3)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L0_CKMODE_EN_SHIFT			5
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L0_CKMODE_EN_MASK			BIT(5)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L0_CKSEL_SHIFT			6
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L0_CKSEL_MASK				BIT(6)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L1_CKMODE_EN_SHIFT			8
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L1_CKMODE_EN_MASK			BIT(8)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L1_CKSEL_SHIFT			9
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L1_CKSEL_MASK				BIT(9)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L2_CKMODE_EN_SHIFT			11
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L2_CKMODE_EN_MASK			BIT(11)
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L2_CKSEL_SHIFT			12
+#define MIPI_RX_ANA00_CSIxA_RG_CSIxA_DPHY_L2_CKSEL_MASK				BIT(12)
+
+#define MIPI_RX_ANA04_CSIxA							0x0004
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTH_SEL_SHIFT			0
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTH_SEL_MASK			GENMASK(2, 0)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTL_SEL_SHIFT			4
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTL_SEL_MASK			GENMASK(6, 4)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTH_SEL_SHIFT			8
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTH_SEL_MASK			GENMASK(10, 8)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTL_SEL_SHIFT			12
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTL_SEL_MASK			GENMASK(14, 12)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_VREF_SEL_SHIFT				16
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_VREF_SEL_MASK				GENMASK(19, 16)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_MON_VREF_SEL_SHIFT			24
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_MON_VREF_SEL_MASK			GENMASK(27, 24)
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_FORCE_HSRT_EN_SHIFT			28
+#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_FORCE_HSRT_EN_MASK				BIT(28)
+
+#define MIPI_RX_ANA08_CSIxA							0x0008
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0P_T0A_HSRT_CODE_SHIFT			0
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0P_T0A_HSRT_CODE_MASK			GENMASK(4, 0)
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0N_T0B_HSRT_CODE_SHIFT			8
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0N_T0B_HSRT_CODE_MASK			GENMASK(12, 8)
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1P_T0C_HSRT_CODE_SHIFT			16
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1P_T0C_HSRT_CODE_MASK			GENMASK(20, 16)
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1N_T1A_HSRT_CODE_SHIFT			24
+#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1N_T1A_HSRT_CODE_MASK			GENMASK(28, 24)
+
+#define MIPI_RX_ANA0C_CSIxA							0x000c
+#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2P_T1B_HSRT_CODE_SHIFT			0
+#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2P_T1B_HSRT_CODE_MASK			GENMASK(4, 0)
+#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2N_T1C_HSRT_CODE_SHIFT			8
+#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2N_T1C_HSRT_CODE_MASK			GENMASK(12, 8)
+
+#define MIPI_RX_ANA10_CSIxA							0x0010
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_EN_SHIFT			0
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_RSTB_SHIFT		1
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_RSTB_MASK			BIT(1)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_VREF_SEL_SHIFT			2
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_VREF_SEL_MASK			GENMASK(7, 2)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_EN_SHIFT			8
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_EN_MASK			BIT(8)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_RSTB_SHIFT		9
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_RSTB_MASK			BIT(9)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_VREF_SEL_SHIFT			10
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_VREF_SEL_MASK			GENMASK(15, 10)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_EN_SHIFT			16
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_EN_MASK			BIT(16)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_RSTB_SHIFT		17
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_RSTB_MASK			BIT(17)
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_VREF_SEL_SHIFT			18
+#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_VREF_SEL_MASK			GENMASK(23, 18)
+/* C-PHY fields are only available in CSIx. */
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_SHIFT		24
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_MASK		BIT(24)
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_SHIFT		25
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_MASK		BIT(25)
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_VREF_SEL_SHIFT			26
+#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_VREF_SEL_MASK			GENMASK(31, 26)
+
+#define MIPI_RX_ANA14_CSIxA							0x0014
+/* C-PHY fields are only available in CSIx. */
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_SHIFT		0
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_MASK		BIT(0)
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_SHIFT		1
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_MASK		BIT(1)
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_VREF_SEL_SHIFT			2
+#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_VREF_SEL_MASK			GENMASK(7, 2)
+
+#define MIPI_RX_ANA18_CSIxA							0x0018
+/* CSIx-specific fields. */
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_OS_CAL_EN_SHIFT			0
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_OS_CAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_MON_EN_SHIFT			1
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_MON_EN_MASK			BIT(1)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SCA_SHIFT			2
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SCA_MASK			BIT(2)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SCB_SHIFT			3
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SCB_MASK			BIT(3)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_IS_SHIFT			4
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_IS_MASK				GENMASK(5, 4)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_BW_SHIFT			6
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_BW_MASK				GENMASK(7, 6)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SRA_SHIFT			8
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SRA_MASK			GENMASK(11, 8)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SRB_SHIFT			12
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_L0_T0AB_EQ_SRB_MASK			GENMASK(15, 12)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_OS_CAL_EN_SHIFT			16
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_OS_CAL_EN_MASK			BIT(16)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_MON_EN_SHIFT			17
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_MON_EN_MASK			BIT(17)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SCA_SHIFT			18
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SCA_MASK			BIT(18)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SCB_SHIFT			19
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SCB_MASK			BIT(19)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_IS_SHIFT			20
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_IS_MASK				GENMASK(21, 20)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_BW_SHIFT			22
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_BW_MASK				GENMASK(23, 22)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SRA_SHIFT			24
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SRA_MASK			GENMASK(27, 24)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SRB_SHIFT			28
+#define MIPI_RX_ANA18_CSIxA_RG_CSI0A_XX_T0CA_EQ_SRB_MASK			GENMASK(31, 28)
+/* CSI1- and CSI2-specific fields. */
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_OS_CAL_EN_SHIFT			0
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_OS_CAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_MON_EN_SHIFT				1
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_MON_EN_MASK				BIT(1)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SCA_SHIFT				2
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SCA_MASK				BIT(2)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SCB_SHIFT				3
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SCB_MASK				BIT(3)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_IS_SHIFT				4
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_IS_MASK				GENMASK(5, 4)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_BW_SHIFT				6
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_BW_MASK				GENMASK(7, 6)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SRA_SHIFT				8
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SRA_MASK				GENMASK(11, 8)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SRB_SHIFT				12
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L0_EQ_SRB_MASK				GENMASK(15, 12)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_OS_CAL_EN_SHIFT			16
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_OS_CAL_EN_MASK			BIT(16)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_MON_EN_SHIFT				17
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_MON_EN_MASK				BIT(17)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SCA_SHIFT				18
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SCA_MASK				BIT(18)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SCB_SHIFT				19
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SCB_MASK				BIT(19)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_IS_SHIFT				20
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_IS_MASK				GENMASK(21, 20)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_BW_SHIFT				22
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_BW_MASK				GENMASK(23, 22)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SRA_SHIFT				24
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SRA_MASK				GENMASK(27, 24)
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SRB_SHIFT				28
+#define MIPI_RX_ANA18_CSIxA_RG_CSI1A_L1_EQ_SRB_MASK				GENMASK(31, 28)
+
+#define MIPI_RX_ANA1C_CSIxA							0x001c
+/* CSIx-specific fields. */
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_OS_CAL_EN_SHIFT			0
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_OS_CAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_MON_EN_SHIFT			1
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_MON_EN_MASK			BIT(1)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SCA_SHIFT			2
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SCA_MASK			BIT(2)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SCB_SHIFT			3
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SCB_MASK			BIT(3)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_IS_SHIFT			4
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_IS_MASK				GENMASK(5, 4)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_BW_SHIFT			6
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_BW_MASK				GENMASK(7, 6)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SRA_SHIFT			8
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SRA_MASK			GENMASK(11, 8)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SRB_SHIFT			12
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_XX_T0BC_EQ_SRB_MASK			GENMASK(15, 12)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_OS_CAL_EN_SHIFT			16
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_OS_CAL_EN_MASK			BIT(16)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_MON_EN_SHIFT			17
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_MON_EN_MASK			BIT(17)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SCA_SHIFT			18
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SCA_MASK			BIT(18)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SCB_SHIFT			19
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SCB_MASK			BIT(19)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_IS_SHIFT			20
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_IS_MASK				GENMASK(21, 20)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_BW_SHIFT			22
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_BW_MASK				GENMASK(23, 22)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SRA_SHIFT			24
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SRA_MASK			GENMASK(27, 24)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SRB_SHIFT			28
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI0A_L1_T1AB_EQ_SRB_MASK			GENMASK(31, 28)
+/* CSI1- and CSI2-specific fields. */
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_OS_CAL_EN_SHIFT			0
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_OS_CAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_MON_EN_SHIFT				1
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_MON_EN_MASK				BIT(1)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SCA_SHIFT				2
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SCA_MASK				BIT(2)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SCB_SHIFT				3
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SCB_MASK				BIT(3)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_IS_SHIFT				4
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_IS_MASK				GENMASK(5, 4)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_BW_SHIFT				6
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_BW_MASK				GENMASK(7, 6)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SRA_SHIFT				8
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SRA_MASK				GENMASK(11, 8)
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SRB_SHIFT				12
+#define MIPI_RX_ANA1C_CSIxA_RG_CSI1A_L2_EQ_SRB_MASK				GENMASK(15, 12)
+
+/* CSI0-specific register. */
+#define MIPI_RX_ANA20_CSI0A							0x0020
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_OS_CAL_EN_SHIFT			0
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_OS_CAL_EN_MASK			BIT(0)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_MON_EN_SHIFT			1
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_MON_EN_MASK			BIT(1)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCA_SHIFT			2
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCA_MASK			BIT(2)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCB_SHIFT			3
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SCB_MASK			BIT(3)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_IS_SHIFT			4
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_IS_MASK				GENMASK(5, 4)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_BW_SHIFT			6
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_BW_MASK				GENMASK(7, 6)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRA_SHIFT			8
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRA_MASK			GENMASK(11, 8)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRB_SHIFT			12
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_XX_T1CA_EQ_SRB_MASK			GENMASK(15, 12)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_OS_CAL_EN_SHIFT			16
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_OS_CAL_EN_MASK			BIT(16)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_MON_EN_SHIFT			17
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_MON_EN_MASK			BIT(17)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCA_SHIFT			18
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCA_MASK			BIT(18)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCB_SHIFT			19
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SCB_MASK			BIT(19)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_IS_SHIFT			20
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_IS_MASK				GENMASK(21, 20)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_BW_SHIFT			22
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_BW_MASK				GENMASK(23, 22)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRA_SHIFT			24
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRA_MASK			GENMASK(27, 24)
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRB_SHIFT			28
+#define MIPI_RX_ANA20_CSI0A_RG_CSI0A_L2_T1BC_EQ_SRB_MASK			GENMASK(31, 28)
+
+#define MIPI_RX_ANA24_CSIxA							0x0024
+#define MIPI_RX_ANA24_CSIxA_RG_CSIxA_RESERVE_SHIFT				24
+#define MIPI_RX_ANA24_CSIxA_RG_CSIxA_RESERVE_MASK				(0xff << 24)
+
+/* CSI0-specific register. */
+#define MIPI_RX_ANA28_CSI0A							0x0028
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_DIRECT_EN_SHIFT		0
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_DIRECT_EN_MASK			BIT(0)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AUTOLOAD_EN_SHIFT		1
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AUTOLOAD_EN_MASK		BIT(1)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_LPF_CTRL_SHIFT			2
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_LPF_CTRL_MASK			GENMASK(3, 2)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AB_WIDTH_SHIFT			4
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_AB_WIDTH_MASK			GENMASK(7, 4)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_BC_WIDTH_SHIFT			8
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_BC_WIDTH_MASK			GENMASK(11, 8)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CA_WIDTH_SHIFT			12
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CA_WIDTH_MASK			GENMASK(15, 12)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CK_DELAY_SHIFT			16
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_CK_DELAY_MASK			GENMASK(19, 16)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_HSDET_SEL_SHIFT			20
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_HSDET_SEL_MASK			GENMASK(21, 20)
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_MANUAL_EN_SHIFT		24
+#define MIPI_RX_ANA28_CSI0A_RG_CSI0A_CPHY_T0_CDR_MANUAL_EN_MASK			BIT(24)
+
+/* CSI0-specific register. */
+#define MIPI_RX_ANA2C_CSI0A							0x002c
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_INIT_CODE_SHIFT		0
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_INIT_CODE_MASK			GENMASK(4, 0)
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_EARLY_CODE_SHIFT		8
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_EARLY_CODE_MASK		GENMASK(12, 8)
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_LATE_CODE_SHIFT		16
+#define MIPI_RX_ANA2C_CSI0A_RG_CSI0A_CPHY_T0_CDR_LATE_CODE_MASK			GENMASK(20, 16)
+
+/* CSI0-specific register. */
+#define MIPI_RX_ANA34_CSI0A							0x0034
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_DIRECT_EN_SHIFT		0
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_DIRECT_EN_MASK			BIT(0)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AUTOLOAD_EN_SHIFT		1
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AUTOLOAD_EN_MASK		BIT(1)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_LPF_CTRL_SHIFT			2
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_LPF_CTRL_MASK			GENMASK(3, 2)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AB_WIDTH_SHIFT			4
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_AB_WIDTH_MASK			GENMASK(7, 4)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_BC_WIDTH_SHIFT			8
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_BC_WIDTH_MASK			GENMASK(11, 8)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CA_WIDTH_SHIFT			12
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CA_WIDTH_MASK			GENMASK(15, 12)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CK_DELAY_SHIFT			16
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_CK_DELAY_MASK			GENMASK(19, 16)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_HSDET_SEL_SHIFT			20
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_HSDET_SEL_MASK			GENMASK(21, 20)
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_MANUAL_EN_SHIFT		24
+#define MIPI_RX_ANA34_CSI0A_RG_CSI0A_CPHY_T1_CDR_MANUAL_EN_MASK			BIT(24)
+
+/* CSI0-specific register. */
+#define MIPI_RX_ANA38_CSI0A							0x0038
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_INIT_CODE_SHIFT		0
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_INIT_CODE_MASK			GENMASK(4, 0)
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_EARLY_CODE_SHIFT		8
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_EARLY_CODE_MASK		GENMASK(12, 8)
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_LATE_CODE_SHIFT		16
+#define MIPI_RX_ANA38_CSI0A_RG_CSI0A_CPHY_T1_CDR_LATE_CODE_MASK			GENMASK(20, 16)
+
+#define MIPI_RX_ANA40_CSIxA							0x0040
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_CPHY_FMCK_SEL_SHIFT			0
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_CPHY_FMCK_SEL_MASK				GENMASK(1, 0)
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_ASYNC_OPTION_SHIFT				4
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_ASYNC_OPTION_MASK				GENMASK(7, 4)
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_CPHY_SPARE_SHIFT				16
+#define MIPI_RX_ANA40_CSIxA_RG_CSIxA_CPHY_SPARE_MASK				GENMASK(31, 16)
+
+#define MIPI_RX_ANA48_CSIxA							0x0048
+/* CSI0-specific fields. */
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L0_T0AB_OS_CAL_CPLT_SHIFT		0
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L0_T0AB_OS_CAL_CPLT_MASK		BIT(0)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T0CA_OS_CAL_CPLT_SHIFT		1
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T0CA_OS_CAL_CPLT_MASK		BIT(1)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T0BC_OS_CAL_CPLT_SHIFT		2
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T0BC_OS_CAL_CPLT_MASK		BIT(2)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L1_T1AB_OS_CAL_CPLT_SHIFT		3
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L1_T1AB_OS_CAL_CPLT_MASK		BIT(3)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T1CA_OS_CAL_CPLT_SHIFT		4
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CPHY_T1CA_OS_CAL_CPLT_MASK		BIT(4)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L2_T1BC_OS_CAL_CPLT_SHIFT		5
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI0A_CDPHY_L2_T1BC_OS_CAL_CPLT_MASK		BIT(5)
+/* CSI1- and CSI2-specific fields. */
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L0_OS_CAL_CPLT_SHIFT			3
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L0_OS_CAL_CPLT_MASK			BIT(3)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L1_OS_CAL_CPLT_SHIFT			4
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L1_OS_CAL_CPLT_MASK			BIT(4)
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L2_OS_CAL_CPLT_SHIFT			5
+#define MIPI_RX_ANA48_CSIxA_RGS_CSI1A_DPHY_L2_OS_CAL_CPLT_MASK			BIT(5)
+/* Common fields. */
+#define MIPI_RX_ANA48_CSIxA_RGS_CSIxA_OS_CAL_CODE_SHIFT				8
+#define MIPI_RX_ANA48_CSIxA_RGS_CSIxA_OS_CAL_CODE_MASK				GENMASK(15, 8)
+
+#define MIPI_RX_WRAPPER80_CSIxA							0x0080
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_CLK_MON_SHIFT				0
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_CLK_MON_MASK				BIT(0)
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_CLK_EN_SHIFT				1
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_CLK_EN_MASK				BIT(1)
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_MON_MUX_SHIFT				8
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_MON_MUX_MASK				GENMASK(15, 8)
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_RST_MODE_SHIFT				16
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_CSI_RST_MODE_MASK				GENMASK(17, 16)
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_SW_RST_SHIFT				24
+#define MIPI_RX_WRAPPER80_CSIxA_CSR_SW_RST_MASK					GENMASK(27, 24)
+
+#define MIPI_RX_WRAPPER84_CSIxA							0x0084
+#define MIPI_RX_WRAPPER84_CSIxA_CSI_DEBUG_OUT_SHIFT				0
+#define MIPI_RX_WRAPPER84_CSIxA_CSI_DEBUG_OUT_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER88_CSIxA							0x0088
+#define MIPI_RX_WRAPPER88_CSIxA_CSR_SW_MODE_0_SHIFT				0
+#define MIPI_RX_WRAPPER88_CSIxA_CSR_SW_MODE_0_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER8C_CSIxA							0x008c
+#define MIPI_RX_WRAPPER8C_CSIxA_CSR_SW_MODE_1_SHIFT				0
+#define MIPI_RX_WRAPPER8C_CSIxA_CSR_SW_MODE_1_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER90_CSIxA							0x0090
+#define MIPI_RX_WRAPPER90_CSIxA_CSR_SW_MODE_2_SHIFT				0
+#define MIPI_RX_WRAPPER90_CSIxA_CSR_SW_MODE_2_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER94_CSIxA							0x0094
+#define MIPI_RX_WRAPPER94_CSIxA_CSR_SW_VALUE_0_SHIFT				0
+#define MIPI_RX_WRAPPER94_CSIxA_CSR_SW_VALUE_0_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER98_CSIxA							0x0098
+#define MIPI_RX_WRAPPER98_CSIxA_CSR_SW_VALUE_1_SHIFT				0
+#define MIPI_RX_WRAPPER98_CSIxA_CSR_SW_VALUE_1_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_WRAPPER9C_CSIxA							0x009c
+#define MIPI_RX_WRAPPER9C_CSIxA_CSR_SW_VALUE_2_SHIFT				0
+#define MIPI_RX_WRAPPER9C_CSIxA_CSR_SW_VALUE_2_MASK				GENMASK(31, 0)
+
+#define MIPI_RX_ANAA4_CSIxA							0x00a4
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L0_T0_SYNC_INIT_SEL_SHIFT		0
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L0_T0_SYNC_INIT_SEL_MASK		BIT(0)
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L0_T0_FORCE_INIT_SHIFT		1
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L0_T0_FORCE_INIT_MASK		BIT(1)
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_DPHY_L1_SYNC_INIT_SEL_SHIFT		2
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_DPHY_L1_SYNC_INIT_SEL_MASK			BIT(2)
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_DPHY_L1_FORCE_INIT_SHIFT			3
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_DPHY_L1_FORCE_INIT_MASK			BIT(3)
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L2_T2_SYNC_INIT_SEL_SHIFT		4
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L2_T2_SYNC_INIT_SEL_MASK		BIT(4)
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L2_T2_FORCE_INIT_SHIFT		5
+#define MIPI_RX_ANAA4_CSIxA_RG_CSIxA_CDPHY_L2_T2_FORCE_INIT_MASK		BIT(5)
+
+#define MIPI_RX_ANAA8_CSIxA							0x00a8
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT_SHIFT		0
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT_MASK		BIT(0)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_L1_BYTECK_INVERT_SHIFT		1
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_L1_BYTECK_INVERT_MASK			BIT(1)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT_SHIFT		2
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT_MASK		BIT(2)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_HSDET_LEVEL_MODE_EN_SHIFT		3
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_HSDET_LEVEL_MODE_EN_MASK		BIT(3)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_OS_CAL_SEL_SHIFT				4
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_OS_CAL_SEL_MASK				GENMASK(6, 4)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_HSDET_DIG_BACK_EN_SHIFT		7
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_DPHY_HSDET_DIG_BACK_EN_MASK		BIT(7)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_DELAYCAL_CK_SEL_SHIFT		8
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_CDPHY_DELAYCAL_CK_SEL_MASK			GENMASK(10, 8)
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_OS_CAL_DIV_SHIFT				11
+#define MIPI_RX_ANAA8_CSIxA_RG_CSIxA_OS_CAL_DIV_MASK				GENMASK(12, 11)
+
+#endif
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi.c b/drivers/phy/mediatek/phy-mtk-mipi-csi.c
new file mode 100644
index 000000000000..6ce3f95f57bd
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/regmap.h>
+
+#include "phy-mtk-mipi-csi-rx-reg.h"
+
+#define CSIxB_OFFSET		0x1000
+
+struct mtk_mipi_dphy;
+
+enum mtk_mipi_dphy_port_id {
+	MTK_MIPI_PHY_PORT_0 = 0x0, /* 4D1C - CDPHY */
+	MTK_MIPI_PHY_PORT_1, /* 4D1C - DPHY */
+	MTK_MIPI_PHY_PORT_2, /* 4D1C - DPHY */
+	MTK_MIPI_PHY_PORT_0A, /* 2D1C - CDPHY */
+	MTK_MIPI_PHY_PORT_0B, /* 2D1C - CDPHY */
+	MTK_MIPI_PHY_PORT_MAX_NUM
+};
+
+struct mtk_mipi_dphy_port {
+	struct mtk_mipi_dphy *dev;
+	enum mtk_mipi_dphy_port_id id;
+	struct regmap *regmap_base;
+	struct regmap *regmap_4d1c;
+	struct phy *phy;
+	bool active;
+	bool is_cdphy;
+	bool is_4d1c;
+};
+
+struct mtk_mipi_dphy {
+	struct device *dev;
+	void __iomem *rx;
+	struct mtk_mipi_dphy_port ports[MTK_MIPI_PHY_PORT_MAX_NUM];
+	struct mutex lock; /* Ports CSI0 and CSI0A/B are mutually exclusive */
+};
+
+#define REGMAP_BIT(map, reg, field, val) \
+	regmap_update_bits((map), reg, reg##_##field##_MASK, \
+			   (val) << reg##_##field##_SHIFT)
+
+static int mtk_mipi_phy_power_on(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	struct mtk_mipi_dphy *priv = port->dev;
+	struct regmap *regmap_base = port->regmap_base;
+	struct regmap *regmap_4d1c = port->regmap_4d1c;
+	int ret = 0;
+
+	mutex_lock(&priv->lock);
+
+	switch (port->id) {
+	case MTK_MIPI_PHY_PORT_0:
+		if (priv->ports[MTK_MIPI_PHY_PORT_0A].active ||
+		    priv->ports[MTK_MIPI_PHY_PORT_0B].active)
+			ret = -EBUSY;
+		break;
+
+	case MTK_MIPI_PHY_PORT_0A:
+	case MTK_MIPI_PHY_PORT_0B:
+		if (priv->ports[MTK_MIPI_PHY_PORT_0].active)
+			ret = -EBUSY;
+		break;
+	}
+
+	if (!ret)
+		port->active = true;
+
+	mutex_unlock(&priv->lock);
+
+	if (ret < 0)
+		return ret;
+
+	/* Set analog phy mode to DPHY */
+	if (port->is_cdphy)
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSI0A_CPHY_EN, 0);
+
+	if (port->is_4d1c) {
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKSEL, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKSEL, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKMODE_EN, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKSEL, 1);
+	} else {
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKSEL, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKMODE_EN, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKSEL, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKSEL, 0);
+	}
+
+	if (port->is_4d1c) {
+		if (port->is_cdphy)
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+				   RG_CSI0A_CPHY_EN, 0);
+
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L0_CKSEL, 1);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L1_CKSEL, 1);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_DPHY_L2_CKSEL, 1);
+	}
+
+	/* Byte clock invert */
+	REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
+		   RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
+		   RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
+	REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
+		   RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	if (port->is_4d1c) {
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
+			   RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
+			   RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
+			   RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+	}
+
+	/* Start ANA EQ tuning */
+	if (port->is_cdphy) {
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI0A_L0_T0AB_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI0A_L0_T0AB_EQ_BW, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
+			   RG_CSI0A_L1_T1AB_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
+			   RG_CSI0A_L1_T1AB_EQ_BW, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA20_CSI0A,
+			   RG_CSI0A_L2_T1BC_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA20_CSI0A,
+			   RG_CSI0A_L2_T1BC_EQ_BW, 1);
+
+		if (port->is_4d1c) {
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI0A_L0_T0AB_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI0A_L0_T0AB_EQ_BW, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
+				   RG_CSI0A_L1_T1AB_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
+				   RG_CSI0A_L1_T1AB_EQ_BW, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA20_CSI0A,
+				   RG_CSI0A_L2_T1BC_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA20_CSI0A,
+				   RG_CSI0A_L2_T1BC_EQ_BW, 1);
+		}
+	} else {
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI1A_L0_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI1A_L0_EQ_BW, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI1A_L1_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
+			   RG_CSI1A_L1_EQ_BW, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
+			   RG_CSI1A_L2_EQ_IS, 1);
+		REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
+			   RG_CSI1A_L2_EQ_BW, 1);
+
+		if (port->is_4d1c) {
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI1A_L0_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI1A_L0_EQ_BW, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI1A_L1_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
+				   RG_CSI1A_L1_EQ_BW, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
+				   RG_CSI1A_L2_EQ_IS, 1);
+			REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
+				   RG_CSI1A_L2_EQ_BW, 1);
+		}
+	}
+
+	/* End ANA EQ tuning */
+	regmap_write(regmap_base, MIPI_RX_ANA40_CSIxA, 0x90);
+
+	REGMAP_BIT(regmap_base, MIPI_RX_ANA24_CSIxA,
+		   RG_CSIxA_RESERVE, 0x40);
+	if (port->is_4d1c)
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA24_CSIxA,
+			   RG_CSIxA_RESERVE, 0x40);
+	REGMAP_BIT(regmap_base, MIPI_RX_WRAPPER80_CSIxA,
+		   CSR_CSI_RST_MODE, 0);
+	if (port->is_4d1c)
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_WRAPPER80_CSIxA,
+			   CSR_CSI_RST_MODE, 0);
+	/* ANA power on */
+	REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+		   RG_CSIxA_BG_CORE_EN, 1);
+	if (port->is_4d1c)
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_BG_CORE_EN, 1);
+	usleep_range(20, 40);
+	REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+		   RG_CSIxA_BG_LPF_EN, 1);
+	if (port->is_4d1c)
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_BG_LPF_EN, 1);
+
+	return 0;
+}
+
+static int mtk_mipi_phy_power_off(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	struct regmap *regmap_base = port->regmap_base;
+	struct regmap *regmap_4d1c = port->regmap_4d1c;
+
+	/* Disable MIPI BG. */
+	REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+		   RG_CSIxA_BG_CORE_EN, 0);
+	REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
+		   RG_CSIxA_BG_LPF_EN, 0);
+
+	if (port->is_4d1c) {
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_BG_CORE_EN, 0);
+		REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
+			   RG_CSIxA_BG_LPF_EN, 0);
+	}
+
+	mutex_lock(&port->dev->lock);
+	port->active = false;
+	mutex_unlock(&port->dev->lock);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dphy_ops = {
+	.power_on	= mtk_mipi_phy_power_on,
+	.power_off	= mtk_mipi_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *mtk_mipi_dphy_xlate(struct device *dev,
+				       struct of_phandle_args *args)
+{
+	struct mtk_mipi_dphy *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	if (args->args[0] >= ARRAY_SIZE(priv->ports))
+		return ERR_PTR(-ENODEV);
+
+	return priv->ports[args->args[0]].phy;
+}
+
+static const struct regmap_config mt8365_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x700,
+};
+
+static int mtk_mipi_dphy_probe(struct platform_device *pdev)
+{
+	static const unsigned int ports_offsets[] = {
+		[MTK_MIPI_PHY_PORT_0] = 0,
+		[MTK_MIPI_PHY_PORT_0A] = 0,
+		[MTK_MIPI_PHY_PORT_0B] = 0x1000,
+		[MTK_MIPI_PHY_PORT_1] = 0x2000,
+		[MTK_MIPI_PHY_PORT_2] = 0x4000,
+	};
+
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct mtk_mipi_dphy *priv;
+	struct resource *res;
+	unsigned int i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->rx = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->rx))
+		return PTR_ERR(priv->rx);
+
+	for (i = 0; i < ARRAY_SIZE(priv->ports); ++i) {
+		struct mtk_mipi_dphy_port *port = &priv->ports[i];
+		struct phy *phy;
+		void __iomem *base;
+
+		port->dev = priv;
+		port->id = i;
+		base = priv->rx + ports_offsets[i];
+
+		port->regmap_base = devm_regmap_init_mmio(port->dev->dev,
+							  base,
+							  &mt8365_phy_regmap_config);
+
+		port->is_cdphy = i == MTK_MIPI_PHY_PORT_0A ||
+				 i == MTK_MIPI_PHY_PORT_0B ||
+				 i == MTK_MIPI_PHY_PORT_0;
+		port->is_4d1c = i < MTK_MIPI_PHY_PORT_0A;
+
+		if (port->is_4d1c)
+			port->regmap_4d1c = devm_regmap_init_mmio(port->dev->dev,
+								  base + CSIxB_OFFSET,
+								  &mt8365_phy_regmap_config);
+
+		phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
+		if (IS_ERR(phy)) {
+			dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
+			return PTR_ERR(phy);
+		}
+
+		port->phy = phy;
+		phy_set_drvdata(phy, port);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, mtk_mipi_dphy_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "Failed to register PHY provider: %ld\n",
+			PTR_ERR(phy_provider));
+		return PTR_ERR(phy_provider);
+	}
+
+	mutex_init(&priv->lock);
+
+	return 0;
+}
+
+static int mtk_mipi_dphy_remove(struct platform_device *pdev)
+{
+	struct mtk_mipi_dphy *priv = platform_get_drvdata(pdev);
+
+	mutex_destroy(&priv->lock);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_mipi_dphy_of_match[] = {
+	{.compatible = "mediatek,mt8365-mipi-csi"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
+
+static struct platform_driver mipi_dphy_pdrv = {
+	.probe = mtk_mipi_dphy_probe,
+	.remove = mtk_mipi_dphy_remove,
+	.driver	= {
+		.name	= "mtk-mipi-csi",
+		.of_match_table = of_match_ptr(mtk_mipi_dphy_of_match),
+	},
+};
+
+module_platform_driver(mipi_dphy_pdrv);
+
+MODULE_DESCRIPTION("MTK mipi csi cdphy driver");
+MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.40.0

