Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AF5BE139
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA2410E493;
	Tue, 20 Sep 2022 09:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF110E487
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:46 +0000 (UTC)
X-UUID: be043bde091d46f3a3847e303ec1ac33-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qRR6U+/XIkd1ylkSkBo3t92ig8EjtHqS1PEFmXU/6UI=; 
 b=VECUF3WkzIJnslpLWSxuewvG5eqFc6Hf2Wn4iOMu0Sqmx1CURhO2eKhBnuPjtHDQTImw4MLB7CPc/ioIjpjsIlYKRdiLh2d/jdcCD1Hm/ApwYkcGGP1skCTcAt7OaINoKKItZOAOktahPxwvQXj+1f9E1v/JWfwi8dq8A2HFtFU=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11, REQID:35807a83-6f76-44d0-929c-37e9ecda72bf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
 ION:quarantine,TS:120
X-CID-INFO: VERSION:1.1.11, REQID:35807a83-6f76-44d0-929c-37e9ecda72bf, IP:0,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:120
X-CID-META: VersionHash:39a5ff1, CLOUDID:3df0435e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:220920170142F93GBLVY,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:5,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0
X-UUID: be043bde091d46f3a3847e303ec1ac33-20220920
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334731202; Tue, 20 Sep 2022 17:01:40 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 02/18] phy: mediatek: tphy: remove macros to prepare bitfield
 value
Date: Tue, 20 Sep 2022 17:00:22 +0800
Message-ID: <20220920090038.15133-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer to make use of FIELD_PREP() macro to prepare bitfield value,
then no need local ones anymore.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 193 ++++++++++------------------
 1 file changed, 67 insertions(+), 126 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index cc10298bc70d..e906a82791bd 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -49,37 +49,28 @@
 #define U3P_USBPHYACR0		0x000
 #define PA0_RG_U2PLL_FORCE_ON		BIT(15)
 #define PA0_USB20_PLL_PREDIV		GENMASK(7, 6)
-#define PA0_USB20_PLL_PREDIV_VAL(x)	((0x3 & (x)) << 6)
 #define PA0_RG_USB20_INTR_EN		BIT(5)
 
 #define U3P_USBPHYACR1		0x004
 #define PA1_RG_INTR_CAL		GENMASK(23, 19)
-#define PA1_RG_INTR_CAL_VAL(x)	((0x1f & (x)) << 19)
 #define PA1_RG_VRT_SEL			GENMASK(14, 12)
-#define PA1_RG_VRT_SEL_VAL(x)	((0x7 & (x)) << 12)
 #define PA1_RG_TERM_SEL		GENMASK(10, 8)
-#define PA1_RG_TERM_SEL_VAL(x)	((0x7 & (x)) << 8)
 
 #define U3P_USBPHYACR2		0x008
 #define PA2_RG_U2PLL_BW			GENMASK(21, 19)
-#define PA2_RG_U2PLL_BW_VAL(x)		((0x7 & (x)) << 19)
 #define PA2_RG_SIF_U2PLL_FORCE_EN	BIT(18)
 
 #define U3P_USBPHYACR5		0x014
 #define PA5_RG_U2_HSTX_SRCAL_EN	BIT(15)
 #define PA5_RG_U2_HSTX_SRCTRL		GENMASK(14, 12)
-#define PA5_RG_U2_HSTX_SRCTRL_VAL(x)	((0x7 & (x)) << 12)
 #define PA5_RG_U2_HS_100U_U3_EN	BIT(11)
 
 #define U3P_USBPHYACR6		0x018
 #define PA6_RG_U2_PRE_EMP		GENMASK(31, 30)
-#define PA6_RG_U2_PRE_EMP_VAL(x)	((0x3 & (x)) << 30)
 #define PA6_RG_U2_BC11_SW_EN		BIT(23)
 #define PA6_RG_U2_OTG_VBUSCMP_EN	BIT(20)
 #define PA6_RG_U2_DISCTH		GENMASK(7, 4)
-#define PA6_RG_U2_DISCTH_VAL(x)	((0xf & (x)) << 4)
 #define PA6_RG_U2_SQTH		GENMASK(3, 0)
-#define PA6_RG_U2_SQTH_VAL(x)	(0xf & (x))
 
 #define U3P_U2PHYACR4		0x020
 #define P2C_RG_USB20_GPIO_CTL		BIT(9)
@@ -106,11 +97,9 @@
 #define P2C_FORCE_SUSPENDM		BIT(18)
 #define P2C_FORCE_TERMSEL		BIT(17)
 #define P2C_RG_DATAIN			GENMASK(13, 10)
-#define P2C_RG_DATAIN_VAL(x)		((0xf & (x)) << 10)
 #define P2C_RG_DMPULLDOWN		BIT(7)
 #define P2C_RG_DPPULLDOWN		BIT(6)
 #define P2C_RG_XCVRSEL			GENMASK(5, 4)
-#define P2C_RG_XCVRSEL_VAL(x)		((0x3 & (x)) << 4)
 #define P2C_RG_SUSPENDM			BIT(3)
 #define P2C_RG_TERMSEL			BIT(2)
 #define P2C_DTM0_PART_MASK \
@@ -141,87 +130,65 @@
 
 #define U3P_U3_PHYA_REG0	0x000
 #define P3A_RG_IEXT_INTR		GENMASK(15, 10)
-#define P3A_RG_IEXT_INTR_VAL(x)		((0x3f & (x)) << 10)
 #define P3A_RG_CLKDRV_OFF		GENMASK(3, 2)
-#define P3A_RG_CLKDRV_OFF_VAL(x)	((0x3 & (x)) << 2)
 
 #define U3P_U3_PHYA_REG1	0x004
 #define P3A_RG_CLKDRV_AMP		GENMASK(31, 29)
-#define P3A_RG_CLKDRV_AMP_VAL(x)	((0x7 & (x)) << 29)
 
 #define U3P_U3_PHYA_REG6	0x018
 #define P3A_RG_TX_EIDLE_CM		GENMASK(31, 28)
-#define P3A_RG_TX_EIDLE_CM_VAL(x)	((0xf & (x)) << 28)
 
 #define U3P_U3_PHYA_REG9	0x024
 #define P3A_RG_RX_DAC_MUX		GENMASK(5, 1)
-#define P3A_RG_RX_DAC_MUX_VAL(x)	((0x1f & (x)) << 1)
 
 #define U3P_U3_PHYA_DA_REG0	0x100
 #define P3A_RG_XTAL_EXT_PE2H		GENMASK(17, 16)
-#define P3A_RG_XTAL_EXT_PE2H_VAL(x)	((0x3 & (x)) << 16)
 #define P3A_RG_XTAL_EXT_PE1H		GENMASK(13, 12)
-#define P3A_RG_XTAL_EXT_PE1H_VAL(x)	((0x3 & (x)) << 12)
 #define P3A_RG_XTAL_EXT_EN_U3		GENMASK(11, 10)
-#define P3A_RG_XTAL_EXT_EN_U3_VAL(x)	((0x3 & (x)) << 10)
 
 #define U3P_U3_PHYA_DA_REG4	0x108
 #define P3A_RG_PLL_DIVEN_PE2H		GENMASK(21, 19)
 #define P3A_RG_PLL_BC_PE2H		GENMASK(7, 6)
-#define P3A_RG_PLL_BC_PE2H_VAL(x)	((0x3 & (x)) << 6)
 
 #define U3P_U3_PHYA_DA_REG5	0x10c
 #define P3A_RG_PLL_BR_PE2H		GENMASK(29, 28)
-#define P3A_RG_PLL_BR_PE2H_VAL(x)	((0x3 & (x)) << 28)
 #define P3A_RG_PLL_IC_PE2H		GENMASK(15, 12)
-#define P3A_RG_PLL_IC_PE2H_VAL(x)	((0xf & (x)) << 12)
 
 #define U3P_U3_PHYA_DA_REG6	0x110
 #define P3A_RG_PLL_IR_PE2H		GENMASK(19, 16)
-#define P3A_RG_PLL_IR_PE2H_VAL(x)	((0xf & (x)) << 16)
 
 #define U3P_U3_PHYA_DA_REG7	0x114
 #define P3A_RG_PLL_BP_PE2H		GENMASK(19, 16)
-#define P3A_RG_PLL_BP_PE2H_VAL(x)	((0xf & (x)) << 16)
 
 #define U3P_U3_PHYA_DA_REG20	0x13c
 #define P3A_RG_PLL_DELTA1_PE2H		GENMASK(31, 16)
-#define P3A_RG_PLL_DELTA1_PE2H_VAL(x)	((0xffff & (x)) << 16)
 
 #define U3P_U3_PHYA_DA_REG25	0x148
 #define P3A_RG_PLL_DELTA_PE2H		GENMASK(15, 0)
-#define P3A_RG_PLL_DELTA_PE2H_VAL(x)	(0xffff & (x))
 
 #define U3P_U3_PHYD_LFPS1		0x00c
 #define P3D_RG_FWAKE_TH		GENMASK(21, 16)
-#define P3D_RG_FWAKE_TH_VAL(x)	((0x3f & (x)) << 16)
 
 #define U3P_U3_PHYD_IMPCAL0		0x010
 #define P3D_RG_FORCE_TX_IMPEL		BIT(31)
 #define P3D_RG_TX_IMPEL			GENMASK(28, 24)
-#define P3D_RG_TX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
 
 #define U3P_U3_PHYD_IMPCAL1		0x014
 #define P3D_RG_FORCE_RX_IMPEL		BIT(31)
 #define P3D_RG_RX_IMPEL			GENMASK(28, 24)
-#define P3D_RG_RX_IMPEL_VAL(x)		((0x1f & (x)) << 24)
 
 #define U3P_U3_PHYD_RSV			0x054
 #define P3D_RG_EFUSE_AUTO_LOAD_DIS	BIT(12)
 
 #define U3P_U3_PHYD_CDR1		0x05c
 #define P3D_RG_CDR_BIR_LTD1		GENMASK(28, 24)
-#define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
 #define P3D_RG_CDR_BIR_LTD0		GENMASK(12, 8)
-#define P3D_RG_CDR_BIR_LTD0_VAL(x)	((0x1f & (x)) << 8)
 
 #define U3P_U3_PHYD_RXDET1		0x128
 #define P3D_RG_RXDET_STB2_SET		GENMASK(17, 9)
-#define P3D_RG_RXDET_STB2_SET_VAL(x)	((0x1ff & (x)) << 9)
 
 #define U3P_U3_PHYD_RXDET2		0x12c
 #define P3D_RG_RXDET_STB2_SET_P3	GENMASK(8, 0)
-#define P3D_RG_RXDET_STB2_SET_P3_VAL(x)	(0x1ff & (x))
 
 #define U3P_SPLLC_XTALCTL3		0x018
 #define XC3_RG_U3_XTAL_RX_PWD		BIT(9)
@@ -229,10 +196,8 @@
 
 #define U3P_U2FREQ_FMCR0	0x00
 #define P2F_RG_MONCLK_SEL	GENMASK(27, 26)
-#define P2F_RG_MONCLK_SEL_VAL(x)	((0x3 & (x)) << 26)
 #define P2F_RG_FREQDET_EN	BIT(24)
 #define P2F_RG_CYCLECNT		GENMASK(23, 0)
-#define P2F_RG_CYCLECNT_VAL(x)	((P2F_RG_CYCLECNT) & (x))
 
 #define U3P_U2FREQ_VALUE	0x0c
 
@@ -249,60 +214,45 @@
 #define PHYD_CTRL_SIGNAL_MODE4		0x1c
 /* CDR Charge Pump P-path current adjustment */
 #define RG_CDR_BICLTD1_GEN1_MSK		GENMASK(23, 20)
-#define RG_CDR_BICLTD1_GEN1_VAL(x)	((0xf & (x)) << 20)
 #define RG_CDR_BICLTD0_GEN1_MSK		GENMASK(11, 8)
-#define RG_CDR_BICLTD0_GEN1_VAL(x)	((0xf & (x)) << 8)
 
 #define PHYD_DESIGN_OPTION2		0x24
 /* Symbol lock count selection */
 #define RG_LOCK_CNT_SEL_MSK		GENMASK(5, 4)
-#define RG_LOCK_CNT_SEL_VAL(x)		((0x3 & (x)) << 4)
 
 #define PHYD_DESIGN_OPTION9	0x40
 /* COMWAK GAP width window */
 #define RG_TG_MAX_MSK		GENMASK(20, 16)
-#define RG_TG_MAX_VAL(x)	((0x1f & (x)) << 16)
 /* COMINIT GAP width window */
 #define RG_T2_MAX_MSK		GENMASK(13, 8)
-#define RG_T2_MAX_VAL(x)	((0x3f & (x)) << 8)
 /* COMWAK GAP width window */
 #define RG_TG_MIN_MSK		GENMASK(7, 5)
-#define RG_TG_MIN_VAL(x)	((0x7 & (x)) << 5)
 /* COMINIT GAP width window */
 #define RG_T2_MIN_MSK		GENMASK(4, 0)
-#define RG_T2_MIN_VAL(x)	(0x1f & (x))
 
 #define ANA_RG_CTRL_SIGNAL1		0x4c
 /* TX driver tail current control for 0dB de-empahsis mdoe for Gen1 speed */
 #define RG_IDRV_0DB_GEN1_MSK		GENMASK(13, 8)
-#define RG_IDRV_0DB_GEN1_VAL(x)		((0x3f & (x)) << 8)
 
 #define ANA_RG_CTRL_SIGNAL4		0x58
 #define RG_CDR_BICLTR_GEN1_MSK		GENMASK(23, 20)
-#define RG_CDR_BICLTR_GEN1_VAL(x)	((0xf & (x)) << 20)
 /* Loop filter R1 resistance adjustment for Gen1 speed */
 #define RG_CDR_BR_GEN2_MSK		GENMASK(10, 8)
-#define RG_CDR_BR_GEN2_VAL(x)		((0x7 & (x)) << 8)
 
 #define ANA_RG_CTRL_SIGNAL6		0x60
 /* I-path capacitance adjustment for Gen1 */
 #define RG_CDR_BC_GEN1_MSK		GENMASK(28, 24)
-#define RG_CDR_BC_GEN1_VAL(x)		((0x1f & (x)) << 24)
 #define RG_CDR_BIRLTR_GEN1_MSK		GENMASK(4, 0)
-#define RG_CDR_BIRLTR_GEN1_VAL(x)	(0x1f & (x))
 
 #define ANA_EQ_EYE_CTRL_SIGNAL1		0x6c
 /* RX Gen1 LEQ tuning step */
 #define RG_EQ_DLEQ_LFI_GEN1_MSK		GENMASK(11, 8)
-#define RG_EQ_DLEQ_LFI_GEN1_VAL(x)	((0xf & (x)) << 8)
 
 #define ANA_EQ_EYE_CTRL_SIGNAL4		0xd8
 #define RG_CDR_BIRLTD0_GEN1_MSK		GENMASK(20, 16)
-#define RG_CDR_BIRLTD0_GEN1_VAL(x)	((0x1f & (x)) << 16)
 
 #define ANA_EQ_EYE_CTRL_SIGNAL5		0xdc
 #define RG_CDR_BIRLTD0_GEN3_MSK		GENMASK(4, 0)
-#define RG_CDR_BIRLTD0_GEN3_VAL(x)	(0x1f & (x))
 
 /* PHY switch between pcie/usb3/sgmii/sata */
 #define USB_PHY_SWITCH_CTRL	0x0
@@ -414,9 +364,9 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 	/* set cycle count as 1024, and select u2 channel */
 	tmp = readl(fmreg + U3P_U2FREQ_FMCR0);
 	tmp &= ~(P2F_RG_CYCLECNT | P2F_RG_MONCLK_SEL);
-	tmp |= P2F_RG_CYCLECNT_VAL(U3P_FM_DET_CYCLE_CNT);
+	tmp |= FIELD_PREP(P2F_RG_CYCLECNT, U3P_FM_DET_CYCLE_CNT);
 	if (tphy->pdata->version == MTK_PHY_V1)
-		tmp |= P2F_RG_MONCLK_SEL_VAL(instance->index >> 1);
+		tmp |= FIELD_PREP(P2F_RG_MONCLK_SEL, instance->index >> 1);
 
 	writel(tmp, fmreg + U3P_U2FREQ_FMCR0);
 
@@ -449,8 +399,8 @@ static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 		tphy->src_ref_clk, tphy->src_coef);
 
 	/* set HS slew rate */
-	mtk_phy_update_bits(com + U3P_USBPHYACR5, PA5_RG_U2_HSTX_SRCTRL,
-			    PA5_RG_U2_HSTX_SRCTRL_VAL(calibration_val));
+	mtk_phy_update_field(com + U3P_USBPHYACR5, PA5_RG_U2_HSTX_SRCTRL,
+			     calibration_val);
 
 	/* disable USB ring oscillator */
 	mtk_phy_clear_bits(com + U3P_USBPHYACR5, PA5_RG_U2_HSTX_SRCAL_EN);
@@ -460,33 +410,30 @@ static void u3_phy_instance_init(struct mtk_tphy *tphy,
 	struct mtk_phy_instance *instance)
 {
 	struct u3phy_banks *u3_banks = &instance->u3_banks;
+	void __iomem *phya = u3_banks->phya;
+	void __iomem *phyd = u3_banks->phyd;
 
 	/* gating PCIe Analog XTAL clock */
 	mtk_phy_set_bits(u3_banks->spllc + U3P_SPLLC_XTALCTL3,
 			 XC3_RG_U3_XTAL_RX_PWD | XC3_RG_U3_FRC_XTAL_RX_PWD);
 
 	/* gating XSQ */
-	mtk_phy_update_bits(u3_banks->phya + U3P_U3_PHYA_DA_REG0,
-			    P3A_RG_XTAL_EXT_EN_U3, P3A_RG_XTAL_EXT_EN_U3_VAL(2));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_DA_REG0, P3A_RG_XTAL_EXT_EN_U3, 2);
 
-	mtk_phy_update_bits(u3_banks->phya + U3P_U3_PHYA_REG9,
-			    P3A_RG_RX_DAC_MUX, P3A_RG_RX_DAC_MUX_VAL(4));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_REG9, P3A_RG_RX_DAC_MUX, 4);
 
-	mtk_phy_update_bits(u3_banks->phya + U3P_U3_PHYA_REG6,
-			    P3A_RG_TX_EIDLE_CM, P3A_RG_TX_EIDLE_CM_VAL(0xe));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_REG6, P3A_RG_TX_EIDLE_CM, 0xe);
 
 	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_CDR1,
 			    P3D_RG_CDR_BIR_LTD0 | P3D_RG_CDR_BIR_LTD1,
-			    P3D_RG_CDR_BIR_LTD0_VAL(0xc) | P3D_RG_CDR_BIR_LTD1_VAL(0x3));
+			    FIELD_PREP(P3D_RG_CDR_BIR_LTD0, 0xc) |
+			    FIELD_PREP(P3D_RG_CDR_BIR_LTD1, 0x3));
 
-	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_LFPS1,
-			    P3D_RG_FWAKE_TH, P3D_RG_FWAKE_TH_VAL(0x34));
+	mtk_phy_update_field(phyd + U3P_U3_PHYD_LFPS1, P3D_RG_FWAKE_TH, 0x34);
 
-	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_RXDET1,
-			    P3D_RG_RXDET_STB2_SET, P3D_RG_RXDET_STB2_SET_VAL(0x10));
+	mtk_phy_update_field(phyd + U3P_U3_PHYD_RXDET1, P3D_RG_RXDET_STB2_SET, 0x10);
 
-	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_RXDET2,
-			    P3D_RG_RXDET_STB2_SET_P3, P3D_RG_RXDET_STB2_SET_P3_VAL(0x10));
+	mtk_phy_update_field(phyd + U3P_U3_PHYD_RXDET2, P3D_RG_RXDET_STB2_SET_P3, 0x10);
 
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, instance->index);
 }
@@ -500,11 +447,9 @@ static void u2_phy_pll_26m_set(struct mtk_tphy *tphy,
 	if (!tphy->pdata->sw_pll_48m_to_26m)
 		return;
 
-	mtk_phy_update_bits(com + U3P_USBPHYACR0, PA0_USB20_PLL_PREDIV,
-			    PA0_USB20_PLL_PREDIV_VAL(0));
+	mtk_phy_update_field(com + U3P_USBPHYACR0, PA0_USB20_PLL_PREDIV, 0);
 
-	mtk_phy_update_bits(com + U3P_USBPHYACR2, PA2_RG_U2PLL_BW,
-			    PA2_RG_U2PLL_BW_VAL(3));
+	mtk_phy_update_field(com + U3P_USBPHYACR2, PA2_RG_U2PLL_BW, 3);
 
 	writel(P2R_RG_U2PLL_FBDIV_26M, com + U3P_U2PHYA_RESV);
 
@@ -550,7 +495,7 @@ static void u2_phy_instance_init(struct mtk_tphy *tphy,
 	/* DP/DM BC1.1 path Disable */
 	mtk_phy_clear_bits(com + U3P_USBPHYACR6, PA6_RG_U2_BC11_SW_EN);
 
-	mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_SQTH, PA6_RG_U2_SQTH_VAL(2));
+	mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_SQTH, 2);
 
 	/* Workaround only for mt8195, HW fix it for others (V3) */
 	u2_phy_pll_26m_set(tphy, instance);
@@ -653,43 +598,39 @@ static void pcie_phy_instance_init(struct mtk_tphy *tphy,
 
 	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG0,
 			    P3A_RG_XTAL_EXT_PE1H | P3A_RG_XTAL_EXT_PE2H,
-			    P3A_RG_XTAL_EXT_PE1H_VAL(0x2) | P3A_RG_XTAL_EXT_PE2H_VAL(0x2));
+			    FIELD_PREP(P3A_RG_XTAL_EXT_PE1H, 0x2) |
+			    FIELD_PREP(P3A_RG_XTAL_EXT_PE2H, 0x2));
 
 	/* ref clk drive */
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_REG1, P3A_RG_CLKDRV_AMP,
-			    P3A_RG_CLKDRV_AMP_VAL(0x4));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_REG1, P3A_RG_CLKDRV_AMP, 0x4);
 
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_REG0, P3A_RG_CLKDRV_OFF,
-			    P3A_RG_CLKDRV_OFF_VAL(0x1));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_REG0, P3A_RG_CLKDRV_OFF, 0x1);
 
 	/* SSC delta -5000ppm */
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG20, P3A_RG_PLL_DELTA1_PE2H,
-			    P3A_RG_PLL_DELTA1_PE2H_VAL(0x3c));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_DA_REG20, P3A_RG_PLL_DELTA1_PE2H, 0x3c);
 
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG25, P3A_RG_PLL_DELTA_PE2H,
-			    P3A_RG_PLL_DELTA_PE2H_VAL(0x36));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_DA_REG25, P3A_RG_PLL_DELTA_PE2H, 0x36);
 
 	/* change pll BW 0.6M */
 	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG5,
 			    P3A_RG_PLL_BR_PE2H | P3A_RG_PLL_IC_PE2H,
-			    P3A_RG_PLL_BR_PE2H_VAL(0x1) | P3A_RG_PLL_IC_PE2H_VAL(0x1));
+			    FIELD_PREP(P3A_RG_PLL_BR_PE2H, 0x1) |
+			    FIELD_PREP(P3A_RG_PLL_IC_PE2H, 0x1));
 
 	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG4,
 			    P3A_RG_PLL_DIVEN_PE2H | P3A_RG_PLL_BC_PE2H,
-			    P3A_RG_PLL_BC_PE2H_VAL(0x3));
+			    FIELD_PREP(P3A_RG_PLL_BC_PE2H, 0x3));
 
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG6, P3A_RG_PLL_IR_PE2H,
-			    P3A_RG_PLL_IR_PE2H_VAL(0x2));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_DA_REG6, P3A_RG_PLL_IR_PE2H, 0x2);
 
-	mtk_phy_update_bits(phya + U3P_U3_PHYA_DA_REG7, P3A_RG_PLL_BP_PE2H,
-			    P3A_RG_PLL_BP_PE2H_VAL(0xa));
+	mtk_phy_update_field(phya + U3P_U3_PHYA_DA_REG7, P3A_RG_PLL_BP_PE2H, 0xa);
 
 	/* Tx Detect Rx Timing: 10us -> 5us */
-	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_RXDET1,
-			    P3D_RG_RXDET_STB2_SET, P3D_RG_RXDET_STB2_SET_VAL(0x10));
+	mtk_phy_update_field(u3_banks->phyd + U3P_U3_PHYD_RXDET1,
+			     P3D_RG_RXDET_STB2_SET, 0x10);
 
-	mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_RXDET2,
-			    P3D_RG_RXDET_STB2_SET_P3, P3D_RG_RXDET_STB2_SET_P3_VAL(0x10));
+	mtk_phy_update_field(u3_banks->phyd + U3P_U3_PHYD_RXDET2,
+			     P3D_RG_RXDET_STB2_SET_P3, 0x10);
 
 	/* wait for PCIe subsys register to active */
 	usleep_range(2500, 3000);
@@ -730,38 +671,38 @@ static void sata_phy_instance_init(struct mtk_tphy *tphy,
 	/* charge current adjustment */
 	mtk_phy_update_bits(phyd + ANA_RG_CTRL_SIGNAL6,
 			    RG_CDR_BIRLTR_GEN1_MSK | RG_CDR_BC_GEN1_MSK,
-			    RG_CDR_BIRLTR_GEN1_VAL(0x6) | RG_CDR_BC_GEN1_VAL(0x1a));
+			    FIELD_PREP(RG_CDR_BIRLTR_GEN1_MSK, 0x6) |
+			    FIELD_PREP(RG_CDR_BC_GEN1_MSK, 0x1a));
 
-	mtk_phy_update_bits(phyd + ANA_EQ_EYE_CTRL_SIGNAL4, RG_CDR_BIRLTD0_GEN1_MSK,
-			    RG_CDR_BIRLTD0_GEN1_VAL(0x18));
+	mtk_phy_update_field(phyd + ANA_EQ_EYE_CTRL_SIGNAL4, RG_CDR_BIRLTD0_GEN1_MSK, 0x18);
 
-	mtk_phy_update_bits(phyd + ANA_EQ_EYE_CTRL_SIGNAL5, RG_CDR_BIRLTD0_GEN3_MSK,
-			    RG_CDR_BIRLTD0_GEN3_VAL(0x06));
+	mtk_phy_update_field(phyd + ANA_EQ_EYE_CTRL_SIGNAL5, RG_CDR_BIRLTD0_GEN3_MSK, 0x06);
 
 	mtk_phy_update_bits(phyd + ANA_RG_CTRL_SIGNAL4,
 			    RG_CDR_BICLTR_GEN1_MSK | RG_CDR_BR_GEN2_MSK,
-			    RG_CDR_BICLTR_GEN1_VAL(0x0c) | RG_CDR_BR_GEN2_VAL(0x07));
+			    FIELD_PREP(RG_CDR_BICLTR_GEN1_MSK, 0x0c) |
+			    FIELD_PREP(RG_CDR_BR_GEN2_MSK, 0x07));
 
 	mtk_phy_update_bits(phyd + PHYD_CTRL_SIGNAL_MODE4,
 			    RG_CDR_BICLTD0_GEN1_MSK | RG_CDR_BICLTD1_GEN1_MSK,
-			    RG_CDR_BICLTD0_GEN1_VAL(0x08) | RG_CDR_BICLTD1_GEN1_VAL(0x02));
+			    FIELD_PREP(RG_CDR_BICLTD0_GEN1_MSK, 0x08) |
+			    FIELD_PREP(RG_CDR_BICLTD1_GEN1_MSK, 0x02));
 
-	mtk_phy_update_bits(phyd + PHYD_DESIGN_OPTION2, RG_LOCK_CNT_SEL_MSK,
-			    RG_LOCK_CNT_SEL_VAL(0x02));
+	mtk_phy_update_field(phyd + PHYD_DESIGN_OPTION2, RG_LOCK_CNT_SEL_MSK, 0x02);
 
 	mtk_phy_update_bits(phyd + PHYD_DESIGN_OPTION9,
 			    RG_T2_MIN_MSK | RG_TG_MIN_MSK,
-			    RG_T2_MIN_VAL(0x12) | RG_TG_MIN_VAL(0x04));
+			    FIELD_PREP(RG_T2_MIN_MSK, 0x12) |
+			    FIELD_PREP(RG_TG_MIN_MSK, 0x04));
 
 	mtk_phy_update_bits(phyd + PHYD_DESIGN_OPTION9,
 			    RG_T2_MAX_MSK | RG_TG_MAX_MSK,
-			    RG_T2_MAX_VAL(0x31) | RG_TG_MAX_VAL(0x0e));
+			    FIELD_PREP(RG_T2_MAX_MSK, 0x31) |
+			    FIELD_PREP(RG_TG_MAX_MSK, 0x0e));
 
-	mtk_phy_update_bits(phyd + ANA_RG_CTRL_SIGNAL1, RG_IDRV_0DB_GEN1_MSK,
-			    RG_IDRV_0DB_GEN1_VAL(0x20));
+	mtk_phy_update_field(phyd + ANA_RG_CTRL_SIGNAL1, RG_IDRV_0DB_GEN1_MSK, 0x20);
 
-	mtk_phy_update_bits(phyd + ANA_EQ_EYE_CTRL_SIGNAL1, RG_EQ_DLEQ_LFI_GEN1_MSK,
-			    RG_EQ_DLEQ_LFI_GEN1_VAL(0x03));
+	mtk_phy_update_field(phyd + ANA_EQ_EYE_CTRL_SIGNAL1, RG_EQ_DLEQ_LFI_GEN1_MSK, 0x03);
 
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, instance->index);
 }
@@ -857,33 +798,33 @@ static void u2_phy_props_set(struct mtk_tphy *tphy,
 		mtk_phy_set_bits(com + U3P_U2PHYBC12C, P2C_RG_CHGDT_EN);
 
 	if (tphy->pdata->version < MTK_PHY_V3 && instance->eye_src)
-		mtk_phy_update_bits(com + U3P_USBPHYACR5, PA5_RG_U2_HSTX_SRCTRL,
-				    PA5_RG_U2_HSTX_SRCTRL_VAL(instance->eye_src));
+		mtk_phy_update_field(com + U3P_USBPHYACR5, PA5_RG_U2_HSTX_SRCTRL,
+				     instance->eye_src);
 
 	if (instance->eye_vrt)
-		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_VRT_SEL,
-				    PA1_RG_VRT_SEL_VAL(instance->eye_vrt));
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_VRT_SEL,
+				     instance->eye_vrt);
 
 	if (instance->eye_term)
-		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL,
-				    PA1_RG_TERM_SEL_VAL(instance->eye_term));
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL,
+				     instance->eye_term);
 
 	if (instance->intr) {
 		if (u2_banks->misc)
 			mtk_phy_set_bits(u2_banks->misc + U3P_MISC_REG1,
 					 MR1_EFUSE_AUTO_LOAD_DIS);
 
-		mtk_phy_update_bits(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
-				    PA1_RG_INTR_CAL_VAL(instance->intr));
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
+				     instance->intr);
 	}
 
 	if (instance->discth)
-		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
-				    PA6_RG_U2_DISCTH_VAL(instance->discth));
+		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH,
+				     instance->discth);
 
 	if (instance->pre_emphasis)
-		mtk_phy_update_bits(com + U3P_USBPHYACR6, PA6_RG_U2_PRE_EMP,
-				    PA6_RG_U2_PRE_EMP_VAL(instance->pre_emphasis));
+		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_PRE_EMP,
+				     instance->pre_emphasis);
 }
 
 /* type switch for usb3/pcie/sgmii/sata */
@@ -1032,23 +973,23 @@ static void phy_efuse_set(struct mtk_phy_instance *instance)
 	case PHY_TYPE_USB2:
 		mtk_phy_set_bits(u2_banks->misc + U3P_MISC_REG1, MR1_EFUSE_AUTO_LOAD_DIS);
 
-		mtk_phy_update_bits(u2_banks->com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
-				    PA1_RG_INTR_CAL_VAL(instance->efuse_intr));
+		mtk_phy_update_field(u2_banks->com + U3P_USBPHYACR1, PA1_RG_INTR_CAL,
+				     instance->efuse_intr);
 		break;
 	case PHY_TYPE_USB3:
 	case PHY_TYPE_PCIE:
 		mtk_phy_set_bits(u3_banks->phyd + U3P_U3_PHYD_RSV, P3D_RG_EFUSE_AUTO_LOAD_DIS);
 
-		mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_IMPCAL0, P3D_RG_TX_IMPEL,
-				    P3D_RG_TX_IMPEL_VAL(instance->efuse_tx_imp));
+		mtk_phy_update_field(u3_banks->phyd + U3P_U3_PHYD_IMPCAL0, P3D_RG_TX_IMPEL,
+				    instance->efuse_tx_imp);
 		mtk_phy_set_bits(u3_banks->phyd + U3P_U3_PHYD_IMPCAL0, P3D_RG_FORCE_TX_IMPEL);
 
-		mtk_phy_update_bits(u3_banks->phyd + U3P_U3_PHYD_IMPCAL1, P3D_RG_RX_IMPEL,
-				    P3D_RG_RX_IMPEL_VAL(instance->efuse_rx_imp));
+		mtk_phy_update_field(u3_banks->phyd + U3P_U3_PHYD_IMPCAL1, P3D_RG_RX_IMPEL,
+				    instance->efuse_rx_imp);
 		mtk_phy_set_bits(u3_banks->phyd + U3P_U3_PHYD_IMPCAL1, P3D_RG_FORCE_RX_IMPEL);
 
-		mtk_phy_update_bits(u3_banks->phya + U3P_U3_PHYA_REG0, P3A_RG_IEXT_INTR,
-				    P3A_RG_IEXT_INTR_VAL(instance->efuse_intr));
+		mtk_phy_update_field(u3_banks->phya + U3P_U3_PHYA_REG0, P3A_RG_IEXT_INTR,
+				    instance->efuse_intr);
 		break;
 	default:
 		dev_warn(dev, "no sw efuse for type %d\n", instance->type);
-- 
2.18.0

