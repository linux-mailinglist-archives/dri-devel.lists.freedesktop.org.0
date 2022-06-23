Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA7557940
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061810F4C5;
	Thu, 23 Jun 2022 11:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B1810F4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:57:48 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id u37so18888219pfg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kYDAIYpgARSkhlJAS1w8GzutNoERHREuaD/gOQJe+Kk=;
 b=D/BOvFacwXMnRRHgH1W7LV3LEbuVd5WaW0wtTistTFTI3k38EKA4Hg39VpEmGNVWMw
 jjLvgWt8HBtuWmcKgdBbPoLdHonOpVs+7C9EtHottxAxtJwCBSKrvQcCYazBfxIPVQK6
 EuhgpqTmW1/B440lGBM0vQDaEyMS3KIKYGDXmpl1bHkIQ+sqySf67hBYWfk/BvUGfsKs
 gTYv4bWBCDQ64nQ5Qmf49acHnv30EiG6OWj7FF27vbA70mj8XKz+aaD9O8sCYG1C4HPX
 qF952MyDLHd6r7/agrG8BFua28JwDL6+GhjplNT4r1X8gtqVgY/LGyGN6dcn/vmVhPrQ
 LunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYDAIYpgARSkhlJAS1w8GzutNoERHREuaD/gOQJe+Kk=;
 b=ggMneLmuxTm7GJmwvMFrEEjqMH396JkCYrMwshyHn39eok21i6Sqb5MXVZLkjnWvv8
 UMtEUyVCCf+OU9qzwBZLSKsRsC3MmUZsadzGWrDBuux1t/VDRvr4xi6Lak4ZKNyNyCve
 G33EetCHG6ybaHhC2QTnyClI7rT+eqH14marz/6MEtdGamdNzu6M3OF2FtiJhW91bC2g
 WKZTRxcuU76Qte+Tz0XrGQnJnKpf86o+/bgj/c7usRWZpR1bZ5oxxeW6FTlF7iPLkKuY
 NN18gMwFupoW8JJlEF9UsDa68yq/CL23+vPwU6V85AkHWhq2qEW58mbYX8/ix1Hw8s1P
 3z5A==
X-Gm-Message-State: AJIora9HTU9TDTBOCAvNg/drgzWYzY14xvBcEG8Cmxh/7h8RYR1JYOq/
 XUkKIbAZEC1saEKM+VIDark=
X-Google-Smtp-Source: AGRyM1u+JEBzdwBNJZHzNmotIZqrvoZNc0gFSgtOXIlhjusYZ47JVDTedijJD8sVIY2mtAm7l1fMGg==
X-Received: by 2002:a63:7a49:0:b0:40c:ca38:aed7 with SMTP id
 j9-20020a637a49000000b0040cca38aed7mr7279129pgn.11.1655985467923; 
 Thu, 23 Jun 2022 04:57:47 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net.
 [111.71.94.93]) by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 04:57:47 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
Date: Thu, 23 Jun 2022 19:56:24 +0800
Message-Id: <20220623115631.22209-8-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 MFD support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v3
- Refine Kconfig help text
- Refine error message of unknown vendor ID in
  mt6370_check_vendor_info()
- Refine return value handling of mt6370_regmap_read()
- Refine all probe error by using dev_err_probe()
- Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
  mt6370_regmap_write()
- Add "#define VENID*" and drop the comments in
  mt6370_check_vendor_info()
- Drop "MFD" in MODULE_DESCRIPTION()
---
 drivers/mfd/Kconfig  |  13 ++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 372 insertions(+)
 create mode 100644 drivers/mfd/mt6370.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3b59456..4c900c4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -937,6 +937,19 @@ config MFD_MT6360
 	  PMIC part includes 2-channel BUCKs and 2-channel LDOs
 	  LDO part includes 4-channel LDOs
 
+config MFD_MT6370
+	tristate "Mediatek MT6370 SubPMIC"
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	depends on I2C
+	help
+	  Say Y here to enable MT6370 SubPMIC functional support.
+	  It consists of a single cell battery charger with ADC monitoring, RGB
+	  LEDs, dual channel flashlight, WLED backlight driver, display bias
+	  voltage supply, one general purpose LDO, and the USB Type-C & PD
+	  controller complies with the latest USB Type-C and PD standards.
+
 config MFD_MT6397
 	tristate "MediaTek MT6397 PMIC Support"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 858cacf..62b2712 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
 obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
 obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
 obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
+obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)	+= intel_soc_pmic_mrfld.o
diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
new file mode 100644
index 0000000..49f02b1
--- /dev/null
+++ b/drivers/mfd/mt6370.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+enum {
+	MT6370_USBC_I2C = 0,
+	MT6370_PMU_I2C,
+	MT6370_MAX_I2C
+};
+
+#define MT6370_REG_DEV_INFO	0x100
+#define MT6370_REG_CHG_IRQ1	0x1C0
+#define MT6370_REG_CHG_MASK1	0x1E0
+
+#define MT6370_VENID_MASK	GENMASK(7, 4)
+
+#define MT6370_NUM_IRQREGS	16
+#define MT6370_USBC_I2CADDR	0x4E
+#define MT6370_REG_ADDRLEN	2
+#define MT6370_REG_MAXADDR	0x1FF
+
+#define MT6370_VENID_RT5081	0x8
+#define MT6370_VENID_RT5081A	0xA
+#define MT6370_VENID_MT6370	0xE
+#define MT6370_VENID_MT6371	0xF
+#define MT6370_VENID_MT6372P	0x9
+#define MT6370_VENID_MT6372CP	0xB
+
+/* IRQ definitions */
+#define MT6370_IRQ_DIRCHGON		0
+#define MT6370_IRQ_CHG_TREG		4
+#define MT6370_IRQ_CHG_AICR		5
+#define MT6370_IRQ_CHG_MIVR		6
+#define MT6370_IRQ_PWR_RDY		7
+#define MT6370_IRQ_FL_CHG_VINOVP	11
+#define MT6370_IRQ_CHG_VSYSUV		12
+#define MT6370_IRQ_CHG_VSYSOV		13
+#define MT6370_IRQ_CHG_VBATOV		14
+#define MT6370_IRQ_CHG_VINOVPCHG	15
+#define MT6370_IRQ_TS_BAT_COLD		20
+#define MT6370_IRQ_TS_BAT_COOL		21
+#define MT6370_IRQ_TS_BAT_WARM		22
+#define MT6370_IRQ_TS_BAT_HOT		23
+#define MT6370_IRQ_TS_STATC		24
+#define MT6370_IRQ_CHG_FAULT		25
+#define MT6370_IRQ_CHG_STATC		26
+#define MT6370_IRQ_CHG_TMR		27
+#define MT6370_IRQ_CHG_BATABS		28
+#define MT6370_IRQ_CHG_ADPBAD		29
+#define MT6370_IRQ_CHG_RVP		30
+#define MT6370_IRQ_TSHUTDOWN		31
+#define MT6370_IRQ_CHG_IINMEAS		32
+#define MT6370_IRQ_CHG_ICCMEAS		33
+#define MT6370_IRQ_CHGDET_DONE		34
+#define MT6370_IRQ_WDTMR		35
+#define MT6370_IRQ_SSFINISH		36
+#define MT6370_IRQ_CHG_RECHG		37
+#define MT6370_IRQ_CHG_TERM		38
+#define MT6370_IRQ_CHG_IEOC		39
+#define MT6370_IRQ_ADC_DONE		40
+#define MT6370_IRQ_PUMPX_DONE		41
+#define MT6370_IRQ_BST_BATUV		45
+#define MT6370_IRQ_BST_MIDOV		46
+#define MT6370_IRQ_BST_OLP		47
+#define MT6370_IRQ_ATTACH		48
+#define MT6370_IRQ_DETACH		49
+#define MT6370_IRQ_HVDCP_STPDONE	51
+#define MT6370_IRQ_HVDCP_VBUSDET_DONE	52
+#define MT6370_IRQ_HVDCP_DET		53
+#define MT6370_IRQ_CHGDET		54
+#define MT6370_IRQ_DCDT			55
+#define MT6370_IRQ_DIRCHG_VGOK		59
+#define MT6370_IRQ_DIRCHG_WDTMR		60
+#define MT6370_IRQ_DIRCHG_UC		61
+#define MT6370_IRQ_DIRCHG_OC		62
+#define MT6370_IRQ_DIRCHG_OV		63
+#define MT6370_IRQ_OVPCTRL_SWON		67
+#define MT6370_IRQ_OVPCTRL_UVP_D	68
+#define MT6370_IRQ_OVPCTRL_UVP		69
+#define MT6370_IRQ_OVPCTRL_OVP_D	70
+#define MT6370_IRQ_OVPCTRL_OVP		71
+#define MT6370_IRQ_FLED_STRBPIN		72
+#define MT6370_IRQ_FLED_TORPIN		73
+#define MT6370_IRQ_FLED_TX		74
+#define MT6370_IRQ_FLED_LVF		75
+#define MT6370_IRQ_FLED2_SHORT		78
+#define MT6370_IRQ_FLED1_SHORT		79
+#define MT6370_IRQ_FLED2_STRB		80
+#define MT6370_IRQ_FLED1_STRB		81
+#define mT6370_IRQ_FLED2_STRB_TO	82
+#define MT6370_IRQ_FLED1_STRB_TO	83
+#define MT6370_IRQ_FLED2_TOR		84
+#define MT6370_IRQ_FLED1_TOR		85
+#define MT6370_IRQ_OTP			93
+#define MT6370_IRQ_VDDA_OVP		94
+#define MT6370_IRQ_VDDA_UV		95
+#define MT6370_IRQ_LDO_OC		103
+#define MT6370_IRQ_BLED_OCP		118
+#define MT6370_IRQ_BLED_OVP		119
+#define MT6370_IRQ_DSV_VNEG_OCP		123
+#define MT6370_IRQ_DSV_VPOS_OCP		124
+#define MT6370_IRQ_DSV_BST_OCP		125
+#define MT6370_IRQ_DSV_VNEG_SCP		126
+#define MT6370_IRQ_DSV_VPOS_SCP		127
+
+struct mt6370_info {
+	struct i2c_client *i2c[MT6370_MAX_I2C];
+	struct device *dev;
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
+};
+
+static const struct regmap_irq mt6370_irqs[] = {
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
+	REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)
+};
+
+static const struct regmap_irq_chip mt6370_irq_chip = {
+	.name		= "mt6370-irqs",
+	.status_base	= MT6370_REG_CHG_IRQ1,
+	.mask_base	= MT6370_REG_CHG_MASK1,
+	.num_regs	= MT6370_NUM_IRQREGS,
+	.irqs		= mt6370_irqs,
+	.num_irqs	= ARRAY_SIZE(mt6370_irqs),
+};
+
+static const struct resource mt6370_regulator_irqs[] = {
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
+	DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")
+};
+
+static const struct mfd_cell mt6370_devices[] = {
+	MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
+	MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
+	MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
+	MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
+	MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
+	MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
+	MFD_CELL_RES("regulator", mt6370_regulator_irqs)
+};
+
+static int mt6370_check_vendor_info(struct mt6370_info *info)
+{
+	unsigned int devinfo;
+	int ret;
+
+	ret = regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
+	if (ret)
+		return ret;
+
+	switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
+	case MT6370_VENID_RT5081:
+	case MT6370_VENID_RT5081A:
+	case MT6370_VENID_MT6370:
+	case MT6370_VENID_MT6371:
+	case MT6370_VENID_MT6372P:
+	case MT6370_VENID_MT6372CP:
+		break;
+	default:
+		dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinfo);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mt6370_regmap_read(void *context, const void *reg_buf,
+			      size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct mt6370_info *info = context;
+	u8 bank_idx, bank_addr;
+	int ret;
+
+	bank_idx = *(u8 *)reg_buf;
+	bank_addr = *(u8 *)(reg_buf + 1);
+
+	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					    val_size, val_buf);
+	if (ret < 0)
+		return ret;
+	else if (ret != val_size)
+		return -EIO;
+
+	return 0;
+}
+
+static int mt6370_regmap_write(void *context, const void *data, size_t count)
+{
+	struct mt6370_info *info = context;
+	u8 bank_idx, bank_addr;
+	int len = count - MT6370_REG_ADDRLEN;
+
+	bank_idx = *(u8 *)data;
+	bank_addr = *(u8 *)(data + 1);
+
+	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
+					      len, data + MT6370_REG_ADDRLEN);
+}
+
+static const struct regmap_bus mt6370_regmap_bus = {
+	.read		= mt6370_regmap_read,
+	.write		= mt6370_regmap_write,
+};
+
+static const struct regmap_config mt6370_regmap_config = {
+	.reg_bits		= 16,
+	.val_bits		= 8,
+	.reg_format_endian	= REGMAP_ENDIAN_BIG,
+	.max_register		= MT6370_REG_MAXADDR,
+};
+
+static int mt6370_probe(struct i2c_client *i2c)
+{
+	struct mt6370_info *info;
+	struct i2c_client *usbc_i2c;
+	int ret;
+
+	info = devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = &i2c->dev;
+
+	usbc_i2c = devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
+					     MT6370_USBC_I2CADDR);
+	if (IS_ERR(usbc_i2c))
+		return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
+				     "Failed to register USBC I2C client\n");
+
+	/* Assign I2C client for PMU and TypeC */
+	info->i2c[MT6370_PMU_I2C] = i2c;
+	info->i2c[MT6370_USBC_I2C] = usbc_i2c;
+
+	info->regmap = devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, info,
+					&mt6370_regmap_config);
+	if (IS_ERR(info->regmap))
+		return dev_err_probe(&i2c->dev, PTR_ERR(info->regmap),
+				     "Failed to register regmap\n");
+
+	ret = mt6370_check_vendor_info(info);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to check vendor info\n");
+
+	ret = devm_regmap_add_irq_chip(&i2c->dev, info->regmap, i2c->irq,
+				       IRQF_ONESHOT, -1, &mt6370_irq_chip,
+				       &info->irq_data);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to add irq chip\n");
+
+	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
+				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
+				    NULL, 0,
+				    regmap_irq_get_domain(info->irq_data));
+}
+
+static const struct of_device_id mt6370_match_table[] = {
+	{ .compatible = "mediatek,mt6370", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_match_table);
+
+static struct i2c_driver mt6370_driver = {
+	.driver = {
+		.name = "mt6370",
+		.of_match_table = mt6370_match_table,
+	},
+	.probe_new = mt6370_probe,
+};
+module_i2c_driver(mt6370_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MT6370 I2C Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

