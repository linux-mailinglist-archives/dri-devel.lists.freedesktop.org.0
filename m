Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE11619916
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E612310E7F3;
	Fri,  4 Nov 2022 14:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BF410E7EB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:14:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a14so7242212wru.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gQ1OLAy3O7dnI7CizhjFg6PRk/JeyoT4+Y1vnUnwQT8=;
 b=wOfR23MqNKDEHiD6MeB3yjr1ULzHb/2aNAQWUfEdwPtyWuQNM4j2qLjciPf1jiKZE5
 yBFz9leZoSVDXUI2hv/XOT1WBYSeog/TuUtHM8gGvcGdUzlkAvC9aOD5t1L0fVwzcBrE
 ybB5xFgpRv9wioV9seAWfdxROAnH2P21s/gLAzopD/YKq7VgMJFFAaLHB57qIVhikT1l
 ZF1dXf8AKZe3OzELdxN2JfU1IBpCSmCxyLANbUW2STDY+J84g2hQD8r65n6kbNuSP3c5
 4vJJ868ilwxqFDyYB2MvNb8S3GC3A5SShF9YwhJUQf+R1sG7kkUiN000IBKGVCCTQGGQ
 XW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQ1OLAy3O7dnI7CizhjFg6PRk/JeyoT4+Y1vnUnwQT8=;
 b=x9FqVECKUbBky/Xh+M2n9fqgcrjY82q5XSaCeQ5hnWCkBNgVdohVmhejZnZhjpQpyJ
 qM+tLLRAY7VzTr3VMqwSojMbFCCBnJ826xMpFY3/ZMmZ6OcTJsbV5wv5jbdwiWYSBvsh
 CsS4VopZizbxUmdgnEwO6ei9luGiIgVuqPHn8I5kCcCU9R4CKtNN4tG+ziQnX8LHLMHv
 iZySOxI/W+nOrsgpJaBvKxc2fSBfp7F3rSsB+LQqnXohEQ8LdFquMUbRkw5FbgHGtc7h
 C7Rwq1TVsPeWUqReY9BQWUzdC0U2vdP7E8TiuOocOA5ingyQrmOx9QlMPv6rBXE+opSi
 uKjw==
X-Gm-Message-State: ACrzQf1FCDc4QJfoUlvbt5WWUtDPyyEv1AeWlb7uU0IErHEdiguit0Ed
 TOYK2aFvV+RJG4MZ3huCCjIRuQ==
X-Google-Smtp-Source: AMsMyM4FEEfqbH3hJmFGag8euH1IhdoZ+MkfzfDI+RBUv6qnsXVKNiAidDyGwehYNtDQ/wwZVBiRQg==
X-Received: by 2002:a05:6000:1f07:b0:238:aa36:6b0d with SMTP id
 bv7-20020a0560001f0700b00238aa366b0dmr93812wrb.688.1667571265852; 
 Fri, 04 Nov 2022 07:14:25 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6440:7fff:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:14:25 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:56 +0100
Subject: [PATCH v3 10/12] phy: mediatek: add support for phy-mtk-hdmi-mt8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-10-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, 
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@ti.com>
X-Mailer: b4 0.11.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, stuart.lee@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add basic support for the mediatek hdmi phy on MT8195 SoC

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/Makefile              |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 543 +++++++++++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 109 ++++++
 drivers/phy/mediatek/phy-mtk-hdmi.c        |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   1 +
 5 files changed, 657 insertions(+)

diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index fb1f8edaffa7..c9a50395533e 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
 phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
+phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
 obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
 
 phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
new file mode 100644
index 000000000000..48efd3936f29
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/nvmem-consumer.h>
+
+#include "phy-mtk-io.h"
+#include "phy-mtk-hdmi.h"
+#include "phy-mtk-hdmi-mt8195.h"
+
+static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
+{
+	/* make data fifo writable for hdmi2.0 */
+	mtk_phy_set_bits(hdmi_phy->regs + HDMI_ANA_CTL, REG_ANA_HDMI20_FIFO_EN);
+}
+
+static void
+mtk_mt8195_phy_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy *hdmi_phy,
+				       bool enable)
+{
+	void __iomem *regs = hdmi_phy->regs;
+
+	mtk_hdmi_ana_fifo_en(hdmi_phy);
+
+	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
+	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
+	 */
+	if (enable)
+		mtk_phy_update_field(regs + HDMI20_CLK_CFG, REG_TXC_DIV, REG_TXC_DIV);
+	else
+		mtk_phy_clear_bits(regs + HDMI20_CLK_CFG, REG_TXC_DIV);
+}
+
+static void mtk_hdmi_pll_select_source(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *regs = hdmi_phy->regs;
+
+	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_REF_XTAL_SEL);
+	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_REF_RESPLL_SEL);
+
+	/* DA_HDMITX21_REF_CK for TXPLL input source */
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITXPLL_REF_CK_SEL);
+}
+
+static int mtk_hdmi_pll_performance_setting(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *regs = hdmi_phy->regs;
+
+	/* BP2 */
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_BP2);
+
+	/* BC */
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BC);
+
+	/* IC */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IC, 0x1);
+
+	/* BR */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BR, 0x2);
+
+	/* IR */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_IR, 0x2);
+
+	/* BP */
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_BP);
+
+	/* IBAND_FIX_EN, RESERVE[14] */
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_IBAND_FIX_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
+
+	/* HIKVCO */
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_HIKVCO);
+
+	/* HREN */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_HREN, 0x1);
+
+	/* LVR_SEL */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_LVR_SEL, 0x1);
+
+	/* RG_HDMITXPLL_RESERVE[12:11] */
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT12_11);
+
+	/* TCL_EN */
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_0, RG_HDMITXPLL_TCL_EN);
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, unsigned char prediv,
+			       unsigned char fbkdiv_high,
+			       unsigned long fbkdiv_low,
+			       unsigned char fbkdiv_hs3, unsigned char posdiv1,
+			       unsigned char posdiv2, unsigned char txprediv,
+			       unsigned char txposdiv,
+			       unsigned char digital_div)
+{
+	unsigned char txposdiv_value = 0;
+	unsigned char div3_ctrl_value = 0;
+	unsigned char posdiv_vallue = 0;
+	unsigned char div_ctrl_value = 0;
+	unsigned char reserve_3_2_value = 0;
+	unsigned char prediv_value = 0;
+	unsigned char reserve13_value = 0;
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *regs = hdmi_phy->regs;
+
+	mtk_hdmi_pll_select_source(hw);
+
+	mtk_hdmi_pll_performance_setting(hw);
+
+	mtk_phy_update_field(regs + HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_BG_VREF_SEL, 0x2);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_VREF_SEL);
+	mtk_phy_update_field(regs + HDMI_1_CFG_9, RG_HDMITX21_SLDO_VREF_SEL, 0x2);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BIAS_PE_VREF_SELB);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDOLPF_EN);
+	mtk_phy_update_field(regs + HDMI_1_CFG_6, RG_HDMITX21_INTR_CAL, 0x11);
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+
+	/* TXPOSDIV */
+	txposdiv_value = ilog2(txposdiv);
+
+	mtk_phy_update_field(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV, txposdiv_value);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_EN);
+
+	/* TXPREDIV */
+	switch (txprediv) {
+	case 2:
+		div3_ctrl_value = 0x0;
+		posdiv_vallue = 0x0;
+		break;
+	case 4:
+		div3_ctrl_value = 0x0;
+		posdiv_vallue = 0x1;
+		break;
+	case 6:
+		div3_ctrl_value = 0x1;
+		posdiv_vallue = 0x0;
+		break;
+	case 12:
+		div3_ctrl_value = 0x1;
+		posdiv_vallue = 0x1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV_DIV3_CTRL, div3_ctrl_value);
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_POSDIV, posdiv_vallue );
+
+	/* POSDIV1 */
+	switch (posdiv1) {
+	case 5:
+		div_ctrl_value = 0x0;
+		break;
+	case 10:
+		div_ctrl_value = 0x1;
+		break;
+	case 12:
+		div_ctrl_value = 0x2;
+		break;
+	case 15:
+		div_ctrl_value = 0x3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_DIV_CTRL, div_ctrl_value);
+
+	/* DE add new setting */
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT14);
+
+	/* POSDIV2 */
+	switch (posdiv2) {
+		case 1:
+			reserve_3_2_value = 0x0;
+			break;
+		case 2:
+			reserve_3_2_value = 0x1;
+			break;
+		case 4:
+			reserve_3_2_value = 0x2;
+			break;
+		case 6:
+			reserve_3_2_value = 0x3;
+			break;
+		default:
+			return -EINVAL;
+	}
+
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT3_2, reserve_3_2_value);
+
+	/* DE add new setting */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT1_0, 0x2);
+
+	/* PREDIV */
+	prediv_value = ilog2(prediv);
+
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_PREDIV, prediv_value);
+
+	/* FBKDIV_HS3 */
+	reserve13_value = ilog2(fbkdiv_hs3);
+
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_1, RG_HDMITXPLL_RESERVE_BIT13, reserve13_value);
+
+	/* FBDIV */
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_4, RG_HDMITXPLL_FBKDIV_HIGH, fbkdiv_high);
+	mtk_phy_update_field(regs + HDMI_1_PLL_CFG_3, RG_HDMITXPLL_FBKDIV_LOW, fbkdiv_low);
+
+
+	/* Digital DIVIDER */
+	mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_PIXEL_CLOCK_SEL);
+
+	if (digital_div == 1) {
+		mtk_phy_clear_bits(regs + HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
+	} else {
+		mtk_phy_set_bits(regs + HDMI_CTL_3, REG_HDMITX_PIXEL_CLOCK);
+		mtk_phy_update_field(regs + HDMI_CTL_3, REG_HDMITXPLL_DIV, digital_div - 1);
+	}
+
+	return 0;
+}
+
+#define PCW_DECIMAL_WIDTH 24
+
+static int mtk_hdmi_pll_calculate_params(struct clk_hw *hw, unsigned long rate,
+					 unsigned long parent_rate)
+{
+	int ret;
+	unsigned long long tmds_clk = 0;
+	unsigned long long pixel_clk = 0;
+	/* pll input source frequency */
+	unsigned long long da_hdmitx21_ref_ck = 0;
+	/* ICO output clk */
+	unsigned long long ns_hdmipll_ck = 0;
+	/* source clk for Display digital */
+	unsigned long long ad_hdmipll_pixel_ck = 0;
+	unsigned char digital_div = 0;
+	unsigned long long pcw = 0;
+	unsigned char txprediv = 0;
+	unsigned char txposdiv = 0;
+	unsigned char fbkdiv_high = 0;
+	unsigned long fbkdiv_low = 0;
+	unsigned char posdiv1 = 0;
+	unsigned char posdiv2 = 0;
+	/* prediv is always 1 */
+	unsigned char prediv = 1;
+	/* fbkdiv_hs3 is always 1 */
+	unsigned char fbkdiv_hs3 = 1;
+	int i = 0;
+	unsigned char txpredivs[4] = { 2, 4, 6, 12 };
+
+	pixel_clk = rate;
+	tmds_clk = pixel_clk;
+
+	if (tmds_clk < 25000000 || tmds_clk > 594000000)
+		return -EINVAL;
+
+	/* in Hz */
+	da_hdmitx21_ref_ck = 26000000UL;
+
+	/*  TXPOSDIV stage treatment:
+	 *	0M  <  TMDS clk  < 54M		  /8
+	 *	54M <= TMDS clk  < 148.35M    /4
+	 *	148.35M <=TMDS clk < 296.7M   /2
+	 *	296.7 <=TMDS clk <= 594M	  /1
+	 */
+	if (tmds_clk < 54000000UL)
+		txposdiv = 8;
+	else if (tmds_clk >= 54000000UL && tmds_clk < 148350000UL)
+		txposdiv = 4;
+	else if (tmds_clk >= 148350000UL && tmds_clk < 296700000UL)
+		txposdiv = 2;
+	else if (tmds_clk >= 296700000UL && tmds_clk <= 594000000UL)
+		txposdiv = 1;
+	else
+		return -EINVAL;
+
+	/* calculate txprediv: can be 2, 4, 6, 12
+	 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
+	 * ICO clk constraint: 5G =< ICO clk <= 12G
+	 */
+	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
+		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
+		if (ns_hdmipll_ck >= 5000000000UL &&
+		    ns_hdmipll_ck <= 12000000000UL)
+			break;
+	}
+	if (i == (ARRAY_SIZE(txpredivs) - 1) &&
+	    (ns_hdmipll_ck < 5000000000UL || ns_hdmipll_ck > 12000000000UL)) {
+		return -EINVAL;
+	}
+	if (i == ARRAY_SIZE(txpredivs))
+		return -EINVAL;
+
+	txprediv = txpredivs[i];
+
+	/* PCW calculation: FBKDIV
+	 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
+	 * RG_HDMITXPLL_FBKDIV[32:0]:
+	 * [32,24] 9bit integer, [23,0]:24bit fraction
+	 */
+	pcw = ns_hdmipll_ck;
+	pcw = pcw << PCW_DECIMAL_WIDTH;
+	pcw = pcw / da_hdmitx21_ref_ck;
+	pcw = pcw / fbkdiv_hs3;
+
+	if ((pcw / BIT(32)) > 1) {
+		return -EINVAL;
+	} else if ((pcw / BIT(32)) == 1) {
+		fbkdiv_high = 1;
+		fbkdiv_low = pcw % BIT(32);
+	} else {
+		fbkdiv_high = 0;
+		fbkdiv_low = pcw;
+	}
+
+	/* posdiv1:
+	 * posdiv1 stage treatment according to color_depth:
+	 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
+	 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
+	 */
+	posdiv1 = 10;
+	posdiv2 = 1;
+	ad_hdmipll_pixel_ck = (ns_hdmipll_ck / 10) / 1;
+
+	/* Digital clk divider, max /32 */
+	digital_div = ad_hdmipll_pixel_ck / pixel_clk;
+	if (!(digital_div <= 32 && digital_div >= 1))
+		return -EINVAL;
+
+	ret = mtk_hdmi_pll_set_hw(hw, prediv, fbkdiv_high, fbkdiv_low,
+				  fbkdiv_hs3, posdiv1, posdiv2, txprediv,
+				  txposdiv, digital_div);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
+{
+	unsigned char data_channel_bias, clk_channel_bias;
+	unsigned char impedance, impedance_en;
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	unsigned long tmds_clk;
+	unsigned long pixel_clk = hdmi_phy->pll_rate;
+	void __iomem *regs = hdmi_phy->regs;
+
+	tmds_clk = pixel_clk;
+
+	/* bias & impedance setting:
+	 * 3G < data rate <= 6G: enable impedance 100ohm,
+	 *      data channel bias 24mA, clock channel bias 20mA
+	 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
+	 *      enalbe impedance 100ohm
+	 *      data channel 20mA, clock channel 16mA
+	 * 27M =< pixel clk < 74.175: disable impedance
+	 *      data channel & clock channel bias 10mA
+	 */
+
+	/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
+	if (tmds_clk > 300000000UL && tmds_clk <= 594000000UL) {
+		data_channel_bias = 0x3c; /* 24mA */
+		clk_channel_bias = 0x34; /* 20mA */
+		impedance_en = 0xf;
+		impedance = 0x36; /* 100ohm */
+	} else if (pixel_clk >= 74175000UL && pixel_clk <= 300000000UL) {
+		data_channel_bias = 0x34; /* 20mA */
+		clk_channel_bias = 0x2c; /* 16mA */
+		impedance_en = 0xf;
+		impedance = 0x36; /* 100ohm */
+	} else if (pixel_clk >= 27000000UL && pixel_clk < 74175000UL) {
+		data_channel_bias = 0x14; /* 10mA */
+		clk_channel_bias = 0x14; /* 10mA */
+		impedance_en = 0x0;
+		impedance = 0x0;
+	} else {
+		return -EINVAL;
+	}
+
+	/* bias */
+	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D0, data_channel_bias);
+	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D1, data_channel_bias);
+	mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D2, data_channel_bias);
+	mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IBIAS_CLK, clk_channel_bias);
+
+	/* impedance */
+	mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IMP_EN, impedance_en);
+	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D0_EN1, impedance);
+	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D1_EN1, impedance);
+	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D2_EN1, impedance);
+	mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_CLK_EN1, impedance);
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *regs = hdmi_phy->regs;
+
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
+
+	mtk_phy_set_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_SER_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D0_DRV_OP_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D1_DRV_OP_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_D2_DRV_OP_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_CK_DRV_OP_EN);
+
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D0_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D1_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D2_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_CK_EN);
+
+	mtk_hdmi_pll_drv_setting(hw);
+
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
+	mtk_phy_set_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
+
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
+	usleep_range(5, 10);
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
+	usleep_range(5, 10);
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+	usleep_range(30, 50);
+	return 0;
+}
+
+static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *regs = hdmi_phy->regs;
+
+	mtk_phy_set_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_CKLDO_EN);
+	mtk_phy_clear_bits(regs + HDMI_1_CFG_3, RG_HDMITX21_SLDO_EN);
+
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_2, RG_HDMITXPLL_PWD);
+	usleep_range(10, 20);
+	mtk_phy_set_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_ISO_EN);
+	usleep_range(10, 20);
+	mtk_phy_clear_bits(regs + HDMI_1_PLL_CFG_4, DA_HDMITXPLL_PWR_ON);
+}
+
+static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	dev_dbg(hdmi_phy->dev, "%s: %lu Hz, parent: %lu Hz\n", __func__, rate,
+		parent_rate);
+
+	return mtk_hdmi_pll_calculate_params(hw, rate, parent_rate);
+}
+
+static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	hdmi_phy->pll_rate = rate;
+	return rate;
+}
+
+static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	return hdmi_phy->pll_rate;
+}
+
+static const struct clk_ops mtk_hdmi_pll_ops = {
+	.prepare = mtk_hdmi_pll_prepare,
+	.unprepare = mtk_hdmi_pll_unprepare,
+	.set_rate = mtk_hdmi_pll_set_rate,
+	.round_rate = mtk_hdmi_pll_round_rate,
+	.recalc_rate = mtk_hdmi_pll_recalc_rate,
+};
+
+static void vtx_signal_en(struct mtk_hdmi_phy *hdmi_phy, bool on)
+{
+	void __iomem *regs = hdmi_phy->regs;
+
+	if (on)
+		mtk_phy_set_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
+	else
+		mtk_phy_clear_bits(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_EN);
+}
+
+static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
+{
+	vtx_signal_en(hdmi_phy, true);
+	usleep_range(100, 150);
+}
+
+static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
+{
+	vtx_signal_en(hdmi_phy, false);
+}
+
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	ret = clk_set_rate(hdmi_phy->pll, dp_opts->link_rate);
+
+	if (ret)
+		return ret;
+
+	mtk_mt8195_phy_tmds_high_bit_clk_ratio(hdmi_phy, false);
+
+	return ret;
+}
+
+struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf = {
+	.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	.hdmi_phy_clk_ops = &mtk_hdmi_pll_ops,
+	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,
+	.hdmi_phy_disable_tmds = mtk_hdmi_phy_disable_tmds,
+	.hdmi_phy_configure = mtk_hdmi_phy_configure,
+};
+
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek MT8195 HDMI PHY Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
new file mode 100644
index 000000000000..2c139f57ab91
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ */
+
+#ifndef _MTK_HDMI_PHY_8195_H
+#define _MTK_HDMI_PHY_8195_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/types.h>
+
+#define HDMI20_CLK_CFG 0x70
+#define REG_TXC_DIV GENMASK(31, 30)
+
+#define HDMI_1_CFG_0 0x00
+#define RG_HDMITX21_DRV_IBIAS_CLK GENMASK(10, 5)
+#define RG_HDMITX21_DRV_IMP_EN GENMASK(23, 20)
+#define RG_HDMITX21_DRV_EN GENMASK(27, 24)
+#define RG_HDMITX21_SER_EN GENMASK(31, 28)
+
+#define HDMI_1_CFG_1 0x04
+#define RG_HDMITX21_DRV_IBIAS_D0 GENMASK(19, 14)
+#define RG_HDMITX21_DRV_IBIAS_D1 GENMASK(25, 20)
+#define RG_HDMITX21_DRV_IBIAS_D2 GENMASK(31, 26)
+
+#define HDMI_1_CFG_10 0x40
+#define RG_HDMITXPLL_REF_CK_SEL GENMASK(2, 1)
+#define RG_HDMITX21_VREF_SEL BIT(4)
+#define RG_HDMITX21_BIAS_PE_VREF_SELB BIT(10)
+#define RG_HDMITX21_BIAS_PE_BG_VREF_SEL GENMASK(16, 15)
+#define RG_HDMITX21_BG_PWD BIT(20)
+
+#define HDMI_1_CFG_2 0x08
+#define RG_HDMITX21_DRV_IMP_D0_EN1 GENMASK(13, 8)
+#define RG_HDMITX21_DRV_IMP_D1_EN1 GENMASK(19, 14)
+#define RG_HDMITX21_DRV_IMP_D2_EN1 GENMASK(25, 20)
+#define RG_HDMITX21_DRV_IMP_CLK_EN1 GENMASK(31, 26)
+
+#define HDMI_1_CFG_3 0x0c
+#define RG_HDMITX21_CKLDO_EN BIT(3)
+#define RG_HDMITX21_SLDOLPF_EN BIT(7)
+#define RG_HDMITX21_SLDO_EN GENMASK(11, 8)
+
+#define HDMI_1_CFG_6 0x18
+#define RG_HDMITX21_D2_DRV_OP_EN BIT(8)
+#define RG_HDMITX21_D1_DRV_OP_EN BIT(9)
+#define RG_HDMITX21_D0_DRV_OP_EN BIT(10)
+#define RG_HDMITX21_CK_DRV_OP_EN BIT(11)
+#define RG_HDMITX21_FRL_EN BIT(12)
+#define RG_HDMITX21_FRL_CK_EN BIT(13)
+#define RG_HDMITX21_FRL_D0_EN BIT(14)
+#define RG_HDMITX21_FRL_D1_EN BIT(15)
+#define RG_HDMITX21_FRL_D2_EN BIT(16)
+#define RG_HDMITX21_INTR_CAL GENMASK(22, 18)
+#define RG_HDMITX21_TX_POSDIV GENMASK(27, 26)
+#define RG_HDMITX21_TX_POSDIV_EN BIT(28)
+#define RG_HDMITX21_BIAS_EN BIT(29)
+
+#define HDMI_1_CFG_9 0x24
+#define RG_HDMITX21_SLDO_VREF_SEL GENMASK(5, 4)
+
+#define HDMI_1_PLL_CFG_0 0x44
+#define RG_HDMITXPLL_HREN GENMASK(13, 12)
+#define RG_HDMITXPLL_IBAND_FIX_EN BIT(24)
+#define RG_HDMITXPLL_LVR_SEL GENMASK(27, 26)
+#define RG_HDMITXPLL_BP2 BIT(30)
+#define RG_HDMITXPLL_TCL_EN BIT(31)
+
+#define HDMI_1_PLL_CFG_1 0x48
+#define RG_HDMITXPLL_RESERVE_BIT1_0 GENMASK(1, 0)
+#define RG_HDMITXPLL_RESERVE_BIT3_2 GENMASK(3, 2)
+#define RG_HDMITXPLL_RESERVE_BIT12_11 GENMASK(12, 11)
+#define RG_HDMITXPLL_RESERVE_BIT13 BIT(13)
+#define RG_HDMITXPLL_RESERVE_BIT14 BIT(14)
+
+#define HDMI_1_PLL_CFG_2 0x4c
+#define RG_HDMITXPLL_BC GENMASK(28, 27)
+#define RG_HDMITXPLL_IC GENMASK(26, 22)
+#define RG_HDMITXPLL_BR GENMASK(21, 19)
+#define RG_HDMITXPLL_IR GENMASK(18, 14)
+#define RG_HDMITXPLL_BP GENMASK(13, 10)
+#define RG_HDMITXPLL_HIKVCO BIT(29)
+#define RG_HDMITXPLL_PWD BIT(31)
+
+#define HDMI_1_PLL_CFG_3 0x50
+#define RG_HDMITXPLL_FBKDIV_LOW GENMASK(31, 0)
+
+#define HDMI_1_PLL_CFG_4 0x54
+#define DA_HDMITXPLL_ISO_EN BIT(1)
+#define DA_HDMITXPLL_PWR_ON BIT(2)
+#define RG_HDMITXPLL_POSDIV_DIV3_CTRL BIT(21)
+#define RG_HDMITXPLL_POSDIV GENMASK(23, 22)
+#define RG_HDMITXPLL_DIV_CTRL GENMASK(25, 24)
+#define RG_HDMITXPLL_PREDIV GENMASK(29, 28)
+#define RG_HDMITXPLL_FBKDIV_HIGH BIT(31)
+
+#define HDMI_ANA_CTL 0x7c
+#define REG_ANA_HDMI20_FIFO_EN BIT(16)
+
+#define HDMI_CTL_3 0xcc
+#define REG_HDMITXPLL_DIV GENMASK(4, 0)
+#define REG_HDMITX_REF_XTAL_SEL BIT(7)
+#define REG_HDMITX_REF_RESPLL_SEL BIT(9)
+#define REG_PIXEL_CLOCK_SEL BIT(10)
+#define REG_HDMITX_PIXEL_CLOCK BIT(23)
+
+#endif /* MTK_HDMI_PHY_8195_H */
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 32f713301768..d2e824771f9d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -161,6 +161,9 @@ static const struct of_device_id mtk_hdmi_phy_match[] = {
 	{ .compatible = "mediatek,mt8173-hdmi-phy",
 	  .data = &mtk_hdmi_phy_8173_conf,
 	},
+	{ .compatible = "mediatek,mt8195-hdmi-phy",
+	  .data = &mtk_hdmi_phy_8195_conf,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_phy_match);
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index f5aac9d352d8..9dfb725fc57f 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -44,6 +44,7 @@ struct mtk_hdmi_phy {
 
 struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
 
+extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8195_conf;
 extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
 extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf;
 

-- 
b4 0.11.0-dev
