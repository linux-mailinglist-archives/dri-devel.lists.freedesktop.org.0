Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8557F9D9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DA310FBE9;
	Mon, 25 Jul 2022 07:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59FD10FC09
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 07:06:55 +0000 (UTC)
X-UUID: 90b453bb580944f8883dbe434af52809-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:33a33025-2038-4ef5-a669-3b329abc2c66, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:33a33025-2038-4ef5-a669-3b329abc2c66, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:b6ae67b3-06d2-48ef-b2dd-540836705165,
 C
 OID:d24ea36d58f7,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90b453bb580944f8883dbe434af52809-20220725
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 49096496; Mon, 25 Jul 2022 15:06:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 25 Jul 2022 15:06:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 15:06:43 +0800
Message-ID: <1f1a37daf6f3c19a2506f53689c8efbed2b716c3.camel@mediatek.com>
Subject: Re: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>, <pavel@ucw.cz>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <sre@kernel.org>, <gregkh@linuxfoundation.org>,
 <jic23@kernel.org>, <lars@metafoo.de>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <linux@roeck-us.net>,
 <heikki.krogerus@linux.intel.com>, <deller@gmx.de>,
 <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 15:06:43 +0800
In-Reply-To: <20220722102407.2205-9-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-9-peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-07-22 at 18:24 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> 
> v6
> - Convert tcpci as device resource managed with
> 'devm_add_action_or_reset' API.
> - Refine remvoe callback.
> - Refine the commit text from 'This commit add' to 'Add'.
> ---
>  drivers/usb/typec/tcpm/Kconfig        |  11 ++
>  drivers/usb/typec/tcpm/Makefile       |   1 +
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 208
> ++++++++++++++++++++++++++++++++++
>  3 files changed, 220 insertions(+)
>  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig
> b/drivers/usb/typec/tcpm/Kconfig
> index 073fd2e..e6b88ca 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -35,6 +35,17 @@ config TYPEC_MT6360
>  	  USB Type-C. It works with Type-C Port Controller Manager
>  	  to provide USB PD and USB Type-C functionalities.
>  
> +config TYPEC_TCPCI_MT6370
> +	tristate "MediaTek MT6370 Type-C driver"
> +	depends on MFD_MT6370
> +	help
> +	  MediaTek MT6370 is a multi-functional IC that includes
> +	  USB Type-C. It works with Type-C Port Controller Manager
> +	  to provide USB PD and USB Type-C functionalities.
> +
> +	  This driver can also be built as a module. The module
> +	  will be called "tcpci_mt6370".
> +
>  config TYPEC_TCPCI_MAXIM
>  	tristate "Maxim TCPCI based Type-C chip driver"
>  	help
> diff --git a/drivers/usb/typec/tcpm/Makefile
> b/drivers/usb/typec/tcpm/Makefile
> index 7d499f3..906d9dc 100644
> --- a/drivers/usb/typec/tcpm/Makefile
> +++ b/drivers/usb/typec/tcpm/Makefile
> @@ -6,4 +6,5 @@ typec_wcove-y				:= wcove.o
>  obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
>  obj-$(CONFIG_TYPEC_RT1711H)		+= tcpci_rt1711h.o
>  obj-$(CONFIG_TYPEC_MT6360)		+= tcpci_mt6360.o
> +obj-$(CONFIG_TYPEC_TCPCI_MT6370)	+= tcpci_mt6370.o
>  obj-$(CONFIG_TYPEC_TCPCI_MAXIM)		+= tcpci_maxim.o
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> new file mode 100644
> index 0000000..4f53319
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: ChiYuan Huang <cy_huang@richtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/tcpm.h>
> +#include "tcpci.h"
> +
> +#define MT6370_REG_SYSCTRL8	0x9B
> +
> +#define MT6370_AUTOIDLE_MASK	BIT(3)
> +
> +#define MT6370_VENDOR_ID	0x29CF
> +#define MT6370_TCPC_DID_A	0x2170
> +
> +struct mt6370_priv {
> +	struct device *dev;
> +	struct regulator *vbus;
> +	struct tcpci *tcpci;
> +	struct tcpci_data tcpci_data;
> +};
> +
> +static const struct reg_sequence mt6370_reg_init[] = {
> +	REG_SEQ(0xA0, 0x1, 1000),
> +	REG_SEQ(0x81, 0x38, 0),
> +	REG_SEQ(0x82, 0x82, 0),
> +	REG_SEQ(0xBA, 0xFC, 0),
> +	REG_SEQ(0xBB, 0x50, 0),
> +	REG_SEQ(0x9E, 0x8F, 0),
> +	REG_SEQ(0xA1, 0x5, 0),
> +	REG_SEQ(0xA2, 0x4, 0),
> +	REG_SEQ(0xA3, 0x4A, 0),
> +	REG_SEQ(0xA4, 0x01, 0),
> +	REG_SEQ(0x95, 0x01, 0),
> +	REG_SEQ(0x80, 0x71, 0),
> +	REG_SEQ(0x9B, 0x3A, 1000),
> +};
> +
> +static int mt6370_tcpc_init(struct tcpci *tcpci, struct tcpci_data
> *data)
> +{
> +	u16 did;
> +	int ret;
> +
> +	ret = regmap_register_patch(data->regmap, mt6370_reg_init,
> +				    ARRAY_SIZE(mt6370_reg_init));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_read(data->regmap, TCPC_BCD_DEV, &did,
> sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	if (did == MT6370_TCPC_DID_A)
> +		return regmap_write(data->regmap, TCPC_FAULT_CTRL,
> 0x80);
> +
> +	return 0;
> +}
> +
> +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct
> tcpci_data *data,
> +				 bool enable)
> +{
> +	return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> +				  MT6370_AUTOIDLE_MASK,
> +				  !enable ? MT6370_AUTOIDLE_MASK : 0);
> +}
> +
> +static int mt6370_tcpc_set_vbus(struct tcpci *tcpci, struct
> tcpci_data *data,
> +				bool source, bool sink)
@sink is not used in this function?

> +{
> +	struct mt6370_priv *priv = container_of(data, struct
> mt6370_priv,
> +						tcpci_data);
> +	int ret;
> +
> +	ret = regulator_is_enabled(priv->vbus);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret && !source)
> +		return regulator_disable(priv->vbus);
> +
> +	if (!ret && source)
> +		return regulator_enable(priv->vbus);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t mt6370_irq_handler(int irq, void *dev_id)
> +{
> +	struct mt6370_priv *priv = dev_id;
> +
> +	return tcpci_irq(priv->tcpci);
> +}
> +
> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +	struct regmap *regmap = priv->tcpci_data.regmap;
> +	u16 vid;
> +	int ret;
> +
> +	ret = regmap_raw_read(regmap, TCPC_VENDOR_ID, &vid,
> sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	if (vid != MT6370_VENDOR_ID)
> +		return dev_err_probe(priv->dev, -ENODEV,
> +				     "Vendor ID not correct 0x%02x\n",
> vid);
> +
> +	return 0;
> +}
> +
> +static void mt6370_unregister_tcpci_port(void *tcpci)
> +{
> +	tcpci_unregister_port(tcpci);
> +}
> +
> +static int mt6370_tcpc_probe(struct platform_device *pdev)
> +{
> +	struct mt6370_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	int irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +
> +	priv->tcpci_data.regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!priv->tcpci_data.regmap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to init
> regmap\n");
> +
> +	ret = mt6370_check_vendor_info(priv);
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +
> +	/* Assign TCPCI feature and ops */
> +	priv->tcpci_data.auto_discharge_disconnect = 1;
> +	priv->tcpci_data.init = mt6370_tcpc_init;
> +	priv->tcpci_data.set_vconn = mt6370_tcpc_set_vconn;
> +
> +	priv->vbus = devm_regulator_get_optional(dev, "vbus");
> +	if (!IS_ERR(priv->vbus))
> +		priv->tcpci_data.set_vbus = mt6370_tcpc_set_vbus;
> +
> +	priv->tcpci = tcpci_register_port(dev, &priv->tcpci_data);
> +	if (IS_ERR(priv->tcpci))
> +		return dev_err_probe(dev, PTR_ERR(priv->tcpci),
> +				     "Failed to register tcpci
> port\n");
> +
> +	ret = devm_add_action_or_reset(dev,
> mt6370_unregister_tcpci_port,
> +				       priv->tcpci);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> mt6370_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev),
> priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to allocate
> irq\n");
> +
> +	device_init_wakeup(dev, true);
> +	dev_pm_set_wake_irq(dev, irq);
> +
> +	return 0;
> +}
> +
> +static int mt6370_tcpc_remove(struct platform_device *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mt6370_tcpc_devid_table[] = {
> +	{ .compatible = "mediatek,mt6370-tcpc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6370_tcpc_devid_table);
> +
> +static struct platform_driver mt6370_tcpc_driver = {
> +	.driver = {
> +		.name = "mt6370-tcpc",
> +		.of_match_table = mt6370_tcpc_devid_table,
> +	},
> +	.probe = mt6370_tcpc_probe,
> +	.remove = mt6370_tcpc_remove,
> +};
> +module_platform_driver(mt6370_tcpc_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("MT6370 USB Type-C Port Controller Interface
> Driver");
> +MODULE_LICENSE("GPL v2");

