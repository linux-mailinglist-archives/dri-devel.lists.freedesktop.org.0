Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890965395B2
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF6112826;
	Tue, 31 May 2022 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC7112AAA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:19:56 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso1980918pjg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QTCg5JULGIw2Y2CEYchomvyXaPsSNLMR9ooYVVdBZ18=;
 b=f80pJjbcKhcG0CN7S5ImfXbMlUkPpHhR6whKzXTj8GwE0sj/nMZcScogMBLYSCxSaD
 jKiSGwbtonPp1K3AWmd45rKa0nCYSRj3JUvVcyxbhwadXmlUHLXg5dmfZGc4wx3HnIsx
 udyITFEdnpQwkeXFBRkFXpOLOAacecld0Em95PhwM6ku6hKUhyZ8O6XtXxHMMlQ2d4X1
 MEiw4jPrARFbmgXhJNNqAnoOPXYbk+iUZriTSZ7WbK5xDWSinFU5ENPH3ZmfKI18YdBL
 TPCpzz78uL9v1VCF1n0ZC3efTwFKb9Y+ABqcR9X/tfTkyBWDr0zKtExQwG0+glxiMbs0
 v24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTCg5JULGIw2Y2CEYchomvyXaPsSNLMR9ooYVVdBZ18=;
 b=G33ddtoAIRBLChHaJujcJpxiNaiab4nhaMI1TWIKJll2GDKmURE/jVAXm3bPdHeAS0
 sS+Fb02svhxQydcSmptxe77TDud7FiANxWbmyqrJ1+ehl9cQqvJblpsMWzUwpGF+MsgB
 HtS+miURePPmhZJjSBCkmneH3AnqbQHPsYHc1nQQRUzhszGvla79VDfzYQPVrwRERap8
 n+sFLoiuI44C4PFGzn6hJws2lRP1ZMlDsJWPyiDyFjtIhvp0q2c2nQ1G5NbNLT4luXED
 3SRsgrhLFXwRFypxwxzQ/GjsQADT6fanR211UBXZ0QHdrXSppRA3qsP1L077jIaT+m2c
 FeOQ==
X-Gm-Message-State: AOAM5301MewcNmNhDNTloV7ffSuHW3pOBvIRgqoaHEtcQZRQpebYzAir
 KrVqnwSw4y4EpuJbxGHSX2I=
X-Google-Smtp-Source: ABdhPJx/euaOz6v7OyJx1iCsp3yZg8ssyOfS/BSRPF0+39f4j60vmbMwZG2ot54aIzIR2b735Bfx6A==
X-Received: by 2002:a17:902:b418:b0:15f:713:c914 with SMTP id
 x24-20020a170902b41800b0015f0713c914mr61117474plr.171.1653995996375; 
 Tue, 31 May 2022 04:19:56 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:56 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 08/14] usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci
 driver
Date: Tue, 31 May 2022 19:18:54 +0800
Message-Id: <20220531111900.19422-9-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add chip level mt6370 tcpci driver.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/usb/typec/tcpm/Kconfig        |   8 +
 drivers/usb/typec/tcpm/Makefile       |   1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 212 ++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 557f392fe24d..f4b7363bc7e9 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -35,6 +35,14 @@ config TYPEC_MT6360
 	  USB Type-C. It works with Type-C Port Controller Manager
 	  to provide USB PD and USB Type-C functionalities.
 
+config TYPEC_TCPCI_MT6370
+	tristate "Mediatek MT6370 Type-C driver"
+	depends on MFD_MT6370
+	help
+	  Mediatek MT6370 is a multi-functional IC that includes
+	  USB Type-C. It works with Type-C Port Controller Manager
+	  to provide USB PD and USB Type-C functionalities.
+
 config TYPEC_TCPCI_MAXIM
 	tristate "Maxim TCPCI based Type-C chip driver"
 	help
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7d499f3569fd..906d9dced8e7 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -6,4 +6,5 @@ typec_wcove-y				:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
 obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
 obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
+obj-$(CONFIG_TYPEC_TCPCI_MT6370)	+= tcpci_mt6370.o
 obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
new file mode 100644
index 000000000000..ce7f5e03fd10
--- /dev/null
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeup.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/tcpm.h>
+#include "tcpci.h"
+
+#define MT6370_REG_SYSCTRL8	0x9B
+
+#define MT6370_AUTOIDLE_MASK	BIT(3)
+
+#define MT6370_VENDOR_ID	0x29CF
+#define MT6370_TCPC_DID_A	0x2170
+
+struct mt6370_priv {
+	struct device *dev;
+	struct regulator *vbus;
+	struct tcpci *tcpci;
+	struct tcpci_data tcpci_data;
+	int irq;
+};
+
+static const struct reg_sequence mt6370_reg_init[] = {
+	REG_SEQ(0xA0, 0x1, 1000),
+	REG_SEQ(0x81, 0x38, 0),
+	REG_SEQ(0x82, 0x82, 0),
+	REG_SEQ(0xBA, 0xFC, 0),
+	REG_SEQ(0xBB, 0x50, 0),
+	REG_SEQ(0x9E, 0x8F, 0),
+	REG_SEQ(0xA1, 0x5, 0),
+	REG_SEQ(0xA2, 0x4, 0),
+	REG_SEQ(0xA3, 0x4A, 0),
+	REG_SEQ(0xA4, 0x01, 0),
+	REG_SEQ(0x95, 0x01, 0),
+	REG_SEQ(0x80, 0x71, 0),
+	REG_SEQ(0x9B, 0x3A, 1000)
+};
+
+static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data *data)
+{
+	u16 did;
+	int ret;
+
+	ret = regmap_register_patch(data->regmap, mt6370_reg_init,
+				    ARRAY_SIZE(mt6370_reg_init));
+	if (ret)
+		return ret;
+
+	ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did, sizeof(u16));
+	if (ret)
+		return ret;
+
+	if (did == MT6370_TCPC_DID_A) {
+		ret = regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
+				 bool enable)
+{
+	return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
+				  MT6370_AUTOIDLE_MASK,
+				  !enable ? MT6370_AUTOIDLE_MASK : 0);
+}
+
+static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data,
+				bool source, bool sink)
+{
+	struct mt6370_priv *priv = container_of(data, struct mt6370_priv,
+						tcpci_data);
+	int ret;
+
+	ret = regulator_is_enabled(priv->vbus);
+	if (ret < 0)
+		return ret;
+
+	if (ret && !source)
+		ret = regulator_disable(priv->vbus);
+	else if (!ret && source)
+		ret = regulator_enable(priv->vbus);
+	else
+		ret = 0;
+
+	return ret;
+}
+
+static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
+{
+	struct mt6370_priv *priv = dev_id;
+
+	return tcpci_irq(priv->tcpci);
+}
+
+static int mt6370_check_vendor_info(struct mt6370_priv *priv)
+{
+	struct regmap *regmap = priv->tcpci_data.regmap;
+	u16 vid;
+	int ret;
+
+	ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid, sizeof(u16));
+	if (ret)
+		return ret;
+
+	if (vid != MT6370_VENDOR_ID) {
+		dev_err(priv->dev, "Vendor ID not correct 0x%02x\n", vid);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mt6370_tcpc_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
+
+	priv->tcpci_data.regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->tcpci_data.regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to check vendor info (%d)\n", ret);
+		return ret;
+	}
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		dev_err(&pdev->dev, "Failed to get TCPC irq (%d)\n", priv->irq);
+		return priv->irq;
+	}
+
+	/* Assign TCPCI feature and ops */
+	priv->tcpci_data.auto_discharge_disconnect = 1;
+	priv->tcpci_data.init = mt6370_tcpc_init;
+	priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
+
+	priv->vbus = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (!IS_ERR(priv->vbus))
+		priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
+
+	priv->tcpci = tcpci_register_port(&pdev->dev, &priv->tcpci_data);
+	if (IS_ERR(priv->tcpci)) {
+		dev_err(&pdev->dev, "Failed to register tcpci port\n");
+		return PTR_ERR(priv->tcpci);
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
+					mt6370_irq_handler, IRQF_ONESHOT,
+					dev_name(&pdev->dev), priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to allocate irq (%d)\n", ret);
+		tcpci_unregister_port(priv->tcpci);
+		return ret;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+	dev_pm_set_wake_irq(&pdev->dev, priv->irq);
+	return 0;
+}
+
+static int mt6370_tcpc_remove(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv = platform_get_drvdata(pdev);
+
+	disable_irq(priv->irq);
+	tcpci_unregister_port(priv->tcpci);
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+	return 0;
+}
+
+static const struct of_device_id mt6370_tcpc_devid_table[] = {
+	{ .compatible = "mediatek,mt6370-tcpc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
+
+static struct platform_driver mt6370_tcpc_driver = {
+	.driver = {
+		.name = "mt6370-tcpc",
+		.of_match_table = mt6370_tcpc_devid_table,
+	},
+	.probe = mt6370_tcpc_probe,
+	.remove = mt6370_tcpc_remove,
+};
+module_platform_driver(mt6370_tcpc_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

