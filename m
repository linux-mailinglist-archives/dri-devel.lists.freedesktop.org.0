Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15819858E5C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 10:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D503610E0A5;
	Sat, 17 Feb 2024 09:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XvTqX/w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D910E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 09:39:43 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a3e43a7c94cso3563166b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708162781; x=1708767581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X75RlHDlmi5XCIOWvGc6BMu59jRgO14yvUgaoxgEH+c=;
 b=XvTqX/w5pj1oeGSC+SlvTnmJ09ailoZufSXbCDrLaC2BJkqsrbwZFHUchUJR/nbtuJ
 5AgwZt+K7zYIo+m2QLlnMsFb7TEWKJDRLz7OE+8+Noqixb5f87qcFEaYlElaj7mE+Nl3
 sCnzSoI9/QB8uC1fr4uCINBFdbPWF401NaBPpHFbk5c4QriIAt7ieQzbfokg/OyBxZRF
 RrH4MO9tyJNV+5II1LSy57Hl3me3YAMODdp1ZAT9g/KsKA4VwcVVREEtBWMCwJ4DFJfg
 e8rR9AGp3/ZaqnDTTs34w/nIAm18mNHF8V33hLp2hgzny7UhjPzZD3mnR6iYub/Hrpck
 L0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708162781; x=1708767581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X75RlHDlmi5XCIOWvGc6BMu59jRgO14yvUgaoxgEH+c=;
 b=LEpKrP8ag5PSDbPsrUZKIkKsyQ9j6o1yPRzAnOqBKJYviUZnGKX2YgpUT6Jrq3eDsE
 yyeovOZOUz0PfMP3bdPEnPQ6JgljegpOOSycsPFUHwkn/jAsikDlq2kHYMG5PybaQ9L3
 XLK1E5R7vtThMEKFvFDczeITfBN864dV3Ngfit0ZRJtjV4ugKgM/DqCEa9d8xcrAKhLc
 qvHWdfSAcpGJiaGT4ejvIzxBp7eEIWeEjzuqTz1vq39Ny4hoXwNyFfAu4BuMhBRImZhq
 6PlfCb3R32+SayMnFpfdGQ+eMtIu2OiXhruD4uqcIUNWyzJ9GTP6LhYFDJ4iw/x25Qfc
 PB2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDs82AKZIG22P02mqpoWdUeKhePrLwdVhvk58SS5z4NzroTIVI5/PkyPhQwdnUj6ZN1BXF2lAknNV07jP8mIAdVOncW+xYxypcIzAj26y1
X-Gm-Message-State: AOJu0YxDSJz+ofyHZyH8QQlqmjNuyGcbUezIFBvE8uKzVKiXiVO2jJA7
 jQJFpyVE6LiYYIyjIOowCA3aGOP1hQSi69t+Raa1G/A17VJKJ7JDf4pbSa+xRbY=
X-Google-Smtp-Source: AGHT+IEzkjPFuVfn8DWdUX4zamD0M9/nG+w/NggF3hD3S/inITRTlG1ZGNvYnl9Tc1SdVCj8EdTREg==
X-Received: by 2002:a17:906:da09:b0:a3d:eaf9:6404 with SMTP id
 fi9-20020a170906da0900b00a3deaf96404mr2751348ejb.57.1708162781090; 
 Sat, 17 Feb 2024 01:39:41 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130]) by smtp.gmail.com with ESMTPSA id
 vg8-20020a170907d30800b00a3d70dc4337sm821145ejc.102.2024.02.17.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 01:39:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: constify of_phandle_args in xlate
Date: Sat, 17 Feb 2024 10:39:37 +0100
Message-Id: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The xlate callbacks are supposed to translate of_phandle_args to proper
provider without modifying the of_phandle_args.  Make the argument
pointer to const for code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/allwinner/phy-sun4i-usb.c              |  2 +-
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c     |  2 +-
 drivers/phy/broadcom/phy-bcm-sr-pcie.c             |  2 +-
 drivers/phy/broadcom/phy-bcm-sr-usb.c              |  2 +-
 drivers/phy/broadcom/phy-bcm63xx-usbh.c            |  2 +-
 drivers/phy/broadcom/phy-brcm-usb.c                |  2 +-
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c    |  2 +-
 drivers/phy/freescale/phy-fsl-lynx-28g.c           |  2 +-
 drivers/phy/hisilicon/phy-histb-combphy.c          |  2 +-
 drivers/phy/intel/phy-intel-lgm-combo.c            |  2 +-
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c        |  2 +-
 drivers/phy/marvell/phy-armada375-usb2.c           |  2 +-
 drivers/phy/marvell/phy-armada38x-comphy.c         |  2 +-
 drivers/phy/marvell/phy-berlin-sata.c              |  2 +-
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c       |  2 +-
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c       |  2 +-
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c        |  2 +-
 drivers/phy/mediatek/phy-mtk-tphy.c                |  2 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c               |  2 +-
 drivers/phy/microchip/lan966x_serdes.c             |  2 +-
 drivers/phy/microchip/sparx5_serdes.c              |  2 +-
 drivers/phy/mscc/phy-ocelot-serdes.c               |  2 +-
 drivers/phy/phy-core.c                             |  8 ++++----
 drivers/phy/phy-xgene.c                            |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  2 +-
 drivers/phy/ralink/phy-mt7621-pci.c                |  2 +-
 drivers/phy/renesas/phy-rcar-gen2.c                |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  2 +-
 drivers/phy/renesas/r8a779f0-ether-serdes.c        |  2 +-
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  2 +-
 drivers/phy/rockchip/phy-rockchip-pcie.c           |  2 +-
 drivers/phy/samsung/phy-exynos-mipi-video.c        |  2 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c           |  2 +-
 drivers/phy/samsung/phy-samsung-usb2.c             |  2 +-
 drivers/phy/socionext/phy-uniphier-usb2.c          |  2 +-
 drivers/phy/st/phy-miphy28lp.c                     |  2 +-
 drivers/phy/st/phy-spear1310-miphy.c               |  2 +-
 drivers/phy/st/phy-spear1340-miphy.c               |  2 +-
 drivers/phy/st/phy-stm32-usbphyc.c                 |  2 +-
 drivers/phy/tegra/xusb.c                           |  2 +-
 drivers/phy/ti/phy-am654-serdes.c                  |  2 +-
 drivers/phy/ti/phy-da8xx-usb.c                     |  2 +-
 drivers/phy/ti/phy-gmii-sel.c                      |  2 +-
 drivers/phy/xilinx/phy-zynqmp.c                    |  2 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-
 include/linux/phy/phy.h                            | 14 +++++++-------
 46 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e53a9a9317bc..b0f19e950601 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -683,7 +683,7 @@ static int sun4i_usb_phy0_vbus_notify(struct notifier_block *nb,
 }
 
 static struct phy *sun4i_usb_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct sun4i_usb_phy_data *data = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 2712c4bd549d..5468831d6ab9 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -350,7 +350,7 @@ static int phy_g12a_usb3_pcie_exit(struct phy *phy)
 }
 
 static struct phy *phy_g12a_usb3_pcie_xlate(struct device *dev,
-					    struct of_phandle_args *args)
+					    const struct of_phandle_args *args)
 {
 	struct phy_g12a_usb3_pcie_priv *priv = dev_get_drvdata(dev);
 	unsigned int mode;
diff --git a/drivers/phy/broadcom/phy-bcm-sr-pcie.c b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
index 8a4aadf166cf..ff9b3862bf7a 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
@@ -195,7 +195,7 @@ static const struct phy_ops sr_paxc_phy_ops = {
 };
 
 static struct phy *sr_pcie_phy_xlate(struct device *dev,
-				     struct of_phandle_args *args)
+				     const struct of_phandle_args *args)
 {
 	struct sr_pcie_phy_core *core;
 	int phy_idx;
diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index b0bd18a5df87..6bcfe83609c8 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -209,7 +209,7 @@ static const struct phy_ops sr_phy_ops = {
 };
 
 static struct phy *bcm_usb_phy_xlate(struct device *dev,
-				     struct of_phandle_args *args)
+				     const struct of_phandle_args *args)
 {
 	struct bcm_usb_phy_cfg *phy_cfg;
 	int phy_idx;
diff --git a/drivers/phy/broadcom/phy-bcm63xx-usbh.c b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
index f8183dea774b..647644de041b 100644
--- a/drivers/phy/broadcom/phy-bcm63xx-usbh.c
+++ b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
@@ -366,7 +366,7 @@ static const struct phy_ops bcm63xx_usbh_phy_ops = {
 };
 
 static struct phy *bcm63xx_usbh_phy_xlate(struct device *dev,
-					  struct of_phandle_args *args)
+					  const struct of_phandle_args *args)
 {
 	struct bcm63xx_usbh_phy *usbh = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index a16f0b58eb74..ad2eec095601 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -175,7 +175,7 @@ static const struct phy_ops brcm_usb_phy_ops = {
 };
 
 static struct phy *brcm_usb_phy_xlate(struct device *dev,
-				      struct of_phandle_args *args)
+				      const struct of_phandle_args *args)
 {
 	struct brcm_usb_phy_data *data = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index 0ae052df3765..38388dd04bdc 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -294,7 +294,7 @@ static int mixel_lvds_phy_reset(struct device *dev)
 }
 
 static struct phy *mixel_lvds_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct mixel_lvds_phy_priv *priv = dev_get_drvdata(dev);
 	unsigned int phy_id;
diff --git a/drivers/phy/freescale/phy-fsl-lynx-28g.c b/drivers/phy/freescale/phy-fsl-lynx-28g.c
index e2187767ce00..b86da8e9daa4 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-28g.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-28g.c
@@ -556,7 +556,7 @@ static void lynx_28g_lane_read_configuration(struct lynx_28g_lane *lane)
 }
 
 static struct phy *lynx_28g_xlate(struct device *dev,
-				  struct of_phandle_args *args)
+				  const struct of_phandle_args *args)
 {
 	struct lynx_28g_priv *priv = dev_get_drvdata(dev);
 	int idx = args->args[0];
diff --git a/drivers/phy/hisilicon/phy-histb-combphy.c b/drivers/phy/hisilicon/phy-histb-combphy.c
index c44588fd5a53..7436dcae3981 100644
--- a/drivers/phy/hisilicon/phy-histb-combphy.c
+++ b/drivers/phy/hisilicon/phy-histb-combphy.c
@@ -163,7 +163,7 @@ static const struct phy_ops histb_combphy_ops = {
 };
 
 static struct phy *histb_combphy_xlate(struct device *dev,
-				       struct of_phandle_args *args)
+				       const struct of_phandle_args *args)
 {
 	struct histb_combphy_priv *priv = dev_get_drvdata(dev);
 	struct histb_combphy_mode *mode = &priv->mode;
diff --git a/drivers/phy/intel/phy-intel-lgm-combo.c b/drivers/phy/intel/phy-intel-lgm-combo.c
index d32e267c0001..f8e3054a9e59 100644
--- a/drivers/phy/intel/phy-intel-lgm-combo.c
+++ b/drivers/phy/intel/phy-intel-lgm-combo.c
@@ -508,7 +508,7 @@ static const struct phy_ops intel_cbphy_ops = {
 };
 
 static struct phy *intel_cbphy_xlate(struct device *dev,
-				     struct of_phandle_args *args)
+				     const struct of_phandle_args *args)
 {
 	struct intel_combo_phy *cbphy = dev_get_drvdata(dev);
 	u32 iphy_id;
diff --git a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
index ef93bf2cba10..406a87c8b759 100644
--- a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
+++ b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
@@ -358,7 +358,7 @@ static const struct phy_ops ltq_vrx200_pcie_phy_ops = {
 };
 
 static struct phy *ltq_vrx200_pcie_phy_xlate(struct device *dev,
-					     struct of_phandle_args *args)
+					     const struct of_phandle_args *args)
 {
 	struct ltq_vrx200_pcie_phy_priv *priv = dev_get_drvdata(dev);
 	unsigned int mode;
diff --git a/drivers/phy/marvell/phy-armada375-usb2.c b/drivers/phy/marvell/phy-armada375-usb2.c
index b141e3cd8a94..3731f9b25655 100644
--- a/drivers/phy/marvell/phy-armada375-usb2.c
+++ b/drivers/phy/marvell/phy-armada375-usb2.c
@@ -61,7 +61,7 @@ static const struct phy_ops armada375_usb_phy_ops = {
  * USB3 case it still optional and we use ENODEV.
  */
 static struct phy *armada375_usb_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct armada375_cluster_phy *cluster_phy = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/marvell/phy-armada38x-comphy.c b/drivers/phy/marvell/phy-armada38x-comphy.c
index d3259984ee8e..5063361b0120 100644
--- a/drivers/phy/marvell/phy-armada38x-comphy.c
+++ b/drivers/phy/marvell/phy-armada38x-comphy.c
@@ -160,7 +160,7 @@ static const struct phy_ops a38x_comphy_ops = {
 };
 
 static struct phy *a38x_comphy_xlate(struct device *dev,
-				     struct of_phandle_args *args)
+				     const struct of_phandle_args *args)
 {
 	struct a38x_comphy_lane *lane;
 	struct phy *phy;
diff --git a/drivers/phy/marvell/phy-berlin-sata.c b/drivers/phy/marvell/phy-berlin-sata.c
index f972d78372ea..c90e2867900c 100644
--- a/drivers/phy/marvell/phy-berlin-sata.c
+++ b/drivers/phy/marvell/phy-berlin-sata.c
@@ -155,7 +155,7 @@ static int phy_berlin_sata_power_off(struct phy *phy)
 }
 
 static struct phy *phy_berlin_sata_phy_xlate(struct device *dev,
-					     struct of_phandle_args *args)
+					     const struct of_phandle_args *args)
 {
 	struct phy_berlin_priv *priv = dev_get_drvdata(dev);
 	int i;
diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
index 24c3371e2bb2..41162d7228c9 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
@@ -1213,7 +1213,7 @@ static const struct phy_ops mvebu_a3700_comphy_ops = {
 };
 
 static struct phy *mvebu_a3700_comphy_xlate(struct device *dev,
-					    struct of_phandle_args *args)
+					    const struct of_phandle_args *args)
 {
 	struct mvebu_a3700_comphy_lane *lane;
 	unsigned int port;
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index b0dd13366598..da5e8f405749 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -917,7 +917,7 @@ static const struct phy_ops mvebu_comphy_ops = {
 };
 
 static struct phy *mvebu_comphy_xlate(struct device *dev,
-				      struct of_phandle_args *args)
+				      const struct of_phandle_args *args)
 {
 	struct mvebu_comphy_lane *lane;
 	struct phy *phy;
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
index 972c129185f7..058e1d926630 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -165,7 +165,7 @@ static int mtk_mipi_phy_power_off(struct phy *phy)
 }
 
 static struct phy *mtk_mipi_cdphy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct mtk_mipi_cdphy_port *priv = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index a4746f6cb8a1..25b86bbb9cec 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1467,7 +1467,7 @@ static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 static struct phy *mtk_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct mtk_tphy *tphy = dev_get_drvdata(dev);
 	struct mtk_phy_instance *instance = NULL;
diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index b222fbbd71d1..064fd0941727 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -378,7 +378,7 @@ static int mtk_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 static struct phy *mtk_phy_xlate(struct device *dev,
-				 struct of_phandle_args *args)
+				 const struct of_phandle_args *args)
 {
 	struct mtk_xsphy *xsphy = dev_get_drvdata(dev);
 	struct xsphy_instance *inst = NULL;
diff --git a/drivers/phy/microchip/lan966x_serdes.c b/drivers/phy/microchip/lan966x_serdes.c
index b5ac2b7995e7..835e369cdfc5 100644
--- a/drivers/phy/microchip/lan966x_serdes.c
+++ b/drivers/phy/microchip/lan966x_serdes.c
@@ -518,7 +518,7 @@ static const struct phy_ops serdes_ops = {
 };
 
 static struct phy *serdes_simple_xlate(struct device *dev,
-				       struct of_phandle_args *args)
+				       const struct of_phandle_args *args)
 {
 	struct serdes_ctrl *ctrl = dev_get_drvdata(dev);
 	unsigned int port, idx, i;
diff --git a/drivers/phy/microchip/sparx5_serdes.c b/drivers/phy/microchip/sparx5_serdes.c
index 01bd5ea620c5..7cb85029fab3 100644
--- a/drivers/phy/microchip/sparx5_serdes.c
+++ b/drivers/phy/microchip/sparx5_serdes.c
@@ -2509,7 +2509,7 @@ static struct sparx5_serdes_io_resource sparx5_serdes_iomap[] =  {
 
 /* Client lookup function, uses serdes index */
 static struct phy *sparx5_serdes_xlate(struct device *dev,
-				     struct of_phandle_args *args)
+				     const struct of_phandle_args *args)
 {
 	struct sparx5_serdes_private *priv = dev_get_drvdata(dev);
 	int idx;
diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index d9443e865a78..1cd1b5db2ad7 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -441,7 +441,7 @@ static const struct phy_ops serdes_ops = {
 };
 
 static struct phy *serdes_simple_xlate(struct device *dev,
-				       struct of_phandle_args *args)
+				       const struct of_phandle_args *args)
 {
 	struct serdes_ctrl *ctrl = dev_get_drvdata(dev);
 	unsigned int port, idx, i;
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 2e8b07eb637a..c5c8d70bc853 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(devm_phy_put);
  * should provide a custom of_xlate function that reads the *args* and returns
  * the appropriate phy.
  */
-struct phy *of_phy_simple_xlate(struct device *dev, struct of_phandle_args
-	*args)
+struct phy *of_phy_simple_xlate(struct device *dev,
+				const struct of_phandle_args *args)
 {
 	struct phy *phy;
 	struct class_dev_iter iter;
@@ -1142,7 +1142,7 @@ EXPORT_SYMBOL_GPL(devm_phy_destroy);
 struct phy_provider *__of_phy_provider_register(struct device *dev,
 	struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args))
+				 const struct of_phandle_args *args))
 {
 	struct phy_provider *phy_provider;
 
@@ -1205,7 +1205,7 @@ EXPORT_SYMBOL_GPL(__of_phy_provider_register);
 struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
 	struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args))
+				 const struct of_phandle_args *args))
 {
 	struct phy_provider **ptr, *phy_provider;
 
diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index 1f0f908323f0..5007dc7a357c 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -1611,7 +1611,7 @@ static const struct phy_ops xgene_phy_ops = {
 };
 
 static struct phy *xgene_phy_xlate(struct device *dev,
-				   struct of_phandle_args *args)
+				   const struct of_phandle_args *args)
 {
 	struct xgene_phy_ctx *ctx = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b6908a03da58..546d3c6bee32 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3454,7 +3454,7 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	return 0;
 }
 
-static struct phy *qmp_combo_phy_xlate(struct device *dev, struct of_phandle_args *args)
+static struct phy *qmp_combo_phy_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index 2f876f158e1d..a591ad95347c 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -263,7 +263,7 @@ static const struct phy_ops mt7621_pci_phy_ops = {
 };
 
 static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
-					    struct of_phandle_args *args)
+					    const struct of_phandle_args *args)
 {
 	struct mt7621_pci_phy *mt7621_phy = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 507435af2656..c0221e7258c0 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -306,7 +306,7 @@ static const struct of_device_id rcar_gen2_phy_match_table[] = {
 MODULE_DEVICE_TABLE(of, rcar_gen2_phy_match_table);
 
 static struct phy *rcar_gen2_phy_xlate(struct device *dev,
-				       struct of_phandle_args *args)
+				       const struct of_phandle_args *args)
 {
 	struct rcar_gen2_phy_driver *drv;
 	struct device_node *np = args->np;
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 6387c0d34c55..fbab6ac0f0d1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -608,7 +608,7 @@ static const unsigned int rcar_gen3_phy_cable[] = {
 };
 
 static struct phy *rcar_gen3_phy_usb2_xlate(struct device *dev,
-					    struct of_phandle_args *args)
+					    const struct of_phandle_args *args)
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index fc6e398fa3bf..f1f1da4a0b1f 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -334,7 +334,7 @@ static const struct phy_ops r8a779f0_eth_serdes_ops = {
 };
 
 static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
-					     struct of_phandle_args *args)
+					     const struct of_phandle_args *args)
 {
 	struct r8a779f0_eth_serdes_drv_data *dd = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 5de5e2e97ffa..76b9cf417591 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -251,7 +251,7 @@ static const struct phy_ops rochchip_combphy_ops = {
 	.owner = THIS_MODULE,
 };
 
-static struct phy *rockchip_combphy_xlate(struct device *dev, struct of_phandle_args *args)
+static struct phy *rockchip_combphy_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	struct rockchip_combphy_priv *priv = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 1bbd6be2a584..51cc5ece0e63 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -82,7 +82,7 @@ static struct rockchip_pcie_phy *to_pcie_phy(struct phy_pcie_instance *inst)
 }
 
 static struct phy *rockchip_pcie_phy_of_xlate(struct device *dev,
-					      struct of_phandle_args *args)
+					      const struct of_phandle_args *args)
 {
 	struct rockchip_pcie_phy *rk_phy = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index 592d8067e848..f6756a609a9a 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -274,7 +274,7 @@ static int exynos_mipi_video_phy_power_off(struct phy *phy)
 }
 
 static struct phy *exynos_mipi_video_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct exynos_mipi_video_phy *state = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 3f310b28bfff..04171eed5b16 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -715,7 +715,7 @@ static int exynos5420_usbdrd_phy_calibrate(struct exynos5_usbdrd_phy *phy_drd)
 }
 
 static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index 68a174eca0ba..9de744cd6f39 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -87,7 +87,7 @@ static const struct phy_ops samsung_usb2_phy_ops = {
 };
 
 static struct phy *samsung_usb2_phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct samsung_usb2_phy_driver *drv;
 
diff --git a/drivers/phy/socionext/phy-uniphier-usb2.c b/drivers/phy/socionext/phy-uniphier-usb2.c
index 3f2086ed4fe4..21c201717d95 100644
--- a/drivers/phy/socionext/phy-uniphier-usb2.c
+++ b/drivers/phy/socionext/phy-uniphier-usb2.c
@@ -81,7 +81,7 @@ static int uniphier_u2phy_init(struct phy *phy)
 }
 
 static struct phy *uniphier_u2phy_xlate(struct device *dev,
-					struct of_phandle_args *args)
+					const struct of_phandle_args *args)
 {
 	struct uniphier_u2phy_priv *priv = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
index e30305b77f0d..063fc38788ed 100644
--- a/drivers/phy/st/phy-miphy28lp.c
+++ b/drivers/phy/st/phy-miphy28lp.c
@@ -1074,7 +1074,7 @@ static int miphy28lp_get_addr(struct miphy28lp_phy *miphy_phy)
 }
 
 static struct phy *miphy28lp_xlate(struct device *dev,
-				   struct of_phandle_args *args)
+				   const struct of_phandle_args *args)
 {
 	struct miphy28lp_dev *miphy_dev = dev_get_drvdata(dev);
 	struct miphy28lp_phy *miphy_phy = NULL;
diff --git a/drivers/phy/st/phy-spear1310-miphy.c b/drivers/phy/st/phy-spear1310-miphy.c
index 35a9831b5161..c661ab63505f 100644
--- a/drivers/phy/st/phy-spear1310-miphy.c
+++ b/drivers/phy/st/phy-spear1310-miphy.c
@@ -183,7 +183,7 @@ static const struct phy_ops spear1310_miphy_ops = {
 };
 
 static struct phy *spear1310_miphy_xlate(struct device *dev,
-					 struct of_phandle_args *args)
+					 const struct of_phandle_args *args)
 {
 	struct spear1310_miphy_priv *priv = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/st/phy-spear1340-miphy.c b/drivers/phy/st/phy-spear1340-miphy.c
index 34a1cf21015f..85a60d64ebb7 100644
--- a/drivers/phy/st/phy-spear1340-miphy.c
+++ b/drivers/phy/st/phy-spear1340-miphy.c
@@ -220,7 +220,7 @@ static SIMPLE_DEV_PM_OPS(spear1340_miphy_pm_ops, spear1340_miphy_suspend,
 			 spear1340_miphy_resume);
 
 static struct phy *spear1340_miphy_xlate(struct device *dev,
-					 struct of_phandle_args *args)
+					 const struct of_phandle_args *args)
 {
 	struct spear1340_miphy_priv *priv = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index d5e7e44000b5..9dbe60dcf319 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -574,7 +574,7 @@ static void stm32_usbphyc_switch_setup(struct stm32_usbphyc *usbphyc,
 }
 
 static struct phy *stm32_usbphyc_of_xlate(struct device *dev,
-					  struct of_phandle_args *args)
+					  const struct of_phandle_args *args)
 {
 	struct stm32_usbphyc *usbphyc = dev_get_drvdata(dev);
 	struct stm32_usbphyc_phy *usbphyc_phy = NULL;
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 142ebe0247cc..0dc86a7740e3 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -22,7 +22,7 @@
 #include "xusb.h"
 
 static struct phy *tegra_xusb_pad_of_xlate(struct device *dev,
-					   struct of_phandle_args *args)
+					   const struct of_phandle_args *args)
 {
 	struct tegra_xusb_pad *pad = dev_get_drvdata(dev);
 	struct phy *phy = NULL;
diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 3f1d43e8b7ad..8b3b937de624 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -495,7 +495,7 @@ static void serdes_am654_release(struct phy *x)
 }
 
 static struct phy *serdes_am654_xlate(struct device *dev,
-				      struct of_phandle_args *args)
+				      const struct of_phandle_args *args)
 {
 	struct serdes_am654 *am654_phy;
 	struct phy *phy;
diff --git a/drivers/phy/ti/phy-da8xx-usb.c b/drivers/phy/ti/phy-da8xx-usb.c
index b7a9ef3f4654..0fe577f0d6c1 100644
--- a/drivers/phy/ti/phy-da8xx-usb.c
+++ b/drivers/phy/ti/phy-da8xx-usb.c
@@ -119,7 +119,7 @@ static const struct phy_ops da8xx_usb20_phy_ops = {
 };
 
 static struct phy *da8xx_usb_phy_of_xlate(struct device *dev,
-					 struct of_phandle_args *args)
+					 const struct of_phandle_args *args)
 {
 	struct da8xx_usb_phy *d_phy = dev_get_drvdata(dev);
 
diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 81dd1c3449d9..b30bf740e2e0 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -297,7 +297,7 @@ static const struct phy_ops phy_gmii_sel_ops = {
 };
 
 static struct phy *phy_gmii_sel_of_xlate(struct device *dev,
-					 struct of_phandle_args *args)
+					 const struct of_phandle_args *args)
 {
 	struct phy_gmii_sel_priv *priv = dev_get_drvdata(dev);
 	int phy_id = args->args[0];
diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 2559c6594cea..f72c5257d712 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -768,7 +768,7 @@ static const unsigned int icm_matrix[NUM_LANES][CONTROLLERS_PER_LANE] = {
 
 /* Translate OF phandle and args to PHY instance. */
 static struct phy *xpsgtr_xlate(struct device *dev,
-				struct of_phandle_args *args)
+				const struct of_phandle_args *args)
 {
 	struct xpsgtr_dev *gtr_dev = dev_get_drvdata(dev);
 	struct xpsgtr_phy *gtr_phy;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 7641848be4de..96ef57a7d385 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -685,7 +685,7 @@ static const struct phy_ops sata_phy_ops = {
 };
 
 static struct phy *tegra_xusb_padctl_xlate(struct device *dev,
-					   struct of_phandle_args *args)
+					   const struct of_phandle_args *args)
 {
 	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
 	unsigned int index = args->args[0];
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index aa76609ba258..03cd5bae92d3 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -181,7 +181,7 @@ struct phy_provider {
 	struct module		*owner;
 	struct list_head	list;
 	struct phy * (*of_xlate)(struct device *dev,
-		struct of_phandle_args *args);
+				 const struct of_phandle_args *args);
 };
 
 /**
@@ -272,7 +272,7 @@ void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
 struct phy *of_phy_get(struct device_node *np, const char *con_id);
 struct phy *of_phy_simple_xlate(struct device *dev,
-	struct of_phandle_args *args);
+				const struct of_phandle_args *args);
 struct phy *phy_create(struct device *dev, struct device_node *node,
 		       const struct phy_ops *ops);
 struct phy *devm_phy_create(struct device *dev, struct device_node *node,
@@ -282,11 +282,11 @@ void devm_phy_destroy(struct device *dev, struct phy *phy);
 struct phy_provider *__of_phy_provider_register(struct device *dev,
 	struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args));
+				 const struct of_phandle_args *args));
 struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
 	struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args));
+				 const struct of_phandle_args *args));
 void of_phy_provider_unregister(struct phy_provider *phy_provider);
 void devm_of_phy_provider_unregister(struct device *dev,
 	struct phy_provider *phy_provider);
@@ -500,7 +500,7 @@ static inline struct phy *of_phy_get(struct device_node *np, const char *con_id)
 }
 
 static inline struct phy *of_phy_simple_xlate(struct device *dev,
-	struct of_phandle_args *args)
+					      const struct of_phandle_args *args)
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -530,7 +530,7 @@ static inline void devm_phy_destroy(struct device *dev, struct phy *phy)
 static inline struct phy_provider *__of_phy_provider_register(
 	struct device *dev, struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args))
+				 const struct of_phandle_args *args))
 {
 	return ERR_PTR(-ENOSYS);
 }
@@ -538,7 +538,7 @@ static inline struct phy_provider *__of_phy_provider_register(
 static inline struct phy_provider *__devm_of_phy_provider_register(struct device
 	*dev, struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
-				 struct of_phandle_args *args))
+				 const struct of_phandle_args *args))
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.34.1

