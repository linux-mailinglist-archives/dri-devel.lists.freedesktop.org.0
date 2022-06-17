Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D654F2CD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F8410E7FD;
	Fri, 17 Jun 2022 08:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154A10E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:25:38 +0000 (UTC)
X-UUID: 57794b13054148f0b9c8bab759e9ecc9-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:de822b26-532c-423c-8e03-90e40310dca6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:de822b26-532c-423c-8e03-90e40310dca6, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:580ce348-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:d65a67a1ec62,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 57794b13054148f0b9c8bab759e9ecc9-20220617
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1435036830; Fri, 17 Jun 2022 16:25:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 16:25:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 16:25:30 +0800
Message-ID: <d060eab1fe9a76fe53e5f2a60cfca7b1960ff18d.camel@mediatek.com>
Subject: Re: [PATCH v11 1/1] phy: phy-mtk-dp: Add driver for DP phy
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Fri, 17 Jun 2022 16:25:30 +0800
In-Reply-To: <YqvPJg67Zb76lhap@matsya>
References: <20220613072648.11081-1-rex-bc.chen@mediatek.com>
 <20220613072648.11081-2-rex-bc.chen@mediatek.com> <YqvPJg67Zb76lhap@matsya>
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
Cc: chunkuang.hu@kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 airlied@linux.ie, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 chunfeng.yun@mediatek.com, msp@baylibre.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-16 at 17:47 -0700, Vinod Koul wrote:
> On 13-06-22, 15:26, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This is a new driver that supports the integrated DisplayPort phy
> > for
> > mediatek SoCs, especially the mt8195. The phy is integrated into
> > the
> > DisplayPort controller and will be created by the mtk-dp driver.
> > This
> > driver expects a struct regmap to be able to work on the same
> > registers
> > as the DisplayPort controller. It sets the device data to be the
> > struct
> > phy so that the DisplayPort controller can easily work with it.
> > 
> > The driver does not have any devicetree bindings because the
> > datasheet
> > does not list the controller and the phy as distinct units.
> > 
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/phy/mediatek/Kconfig      |   8 ++
> >  drivers/phy/mediatek/Makefile     |   1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c | 202
> > ++++++++++++++++++++++++++++++
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a6d3bd9d2a8d..f1460ee9ce83 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6698,6 +6698,7 @@ L:	linux-mediatek@lists.infradead.org
> > (moderated for non-subscribers)
> >  S:	Supported
> >  F:	Documentation/devicetree/bindings/display/mediatek/
> >  F:	drivers/gpu/drm/mediatek/
> > +F:	drivers/phy/mediatek/phy-mtk-dp.c
> >  F:	drivers/phy/mediatek/phy-mtk-hdmi*
> >  F:	drivers/phy/mediatek/phy-mtk-mipi*
> >  
> > diff --git a/drivers/phy/mediatek/Kconfig
> > b/drivers/phy/mediatek/Kconfig
> > index 55f8e6c048ab..d631525d12e1 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
> >  	select GENERIC_PHY
> >  	help
> >  	  Support MIPI DSI for Mediatek SoCs.
> > +
> > +config PHY_MTK_DP
> > +	tristate "MediaTek DP-PHY Driver"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on OF
> > +	select GENERIC_PHY
> > +	help
> > +	  Support DisplayPort PHY for MediaTek SoCs.
> > diff --git a/drivers/phy/mediatek/Makefile
> > b/drivers/phy/mediatek/Makefile
> > index ace660fbed3a..4ba1e0650434 100644
> > --- a/drivers/phy/mediatek/Makefile
> > +++ b/drivers/phy/mediatek/Makefile
> > @@ -3,6 +3,7 @@
> >  # Makefile for the phy drivers.
> >  #
> >  
> > +obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
> >  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
> >  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
> >  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c
> > b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 000000000000..c4d5ca1719a4
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > @@ -0,0 +1,202 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * MediaTek DisplayPort PHY driver
> > + *
> > + * Copyright (c) 2022 BayLibre
> > + * Copyright (c) 2022 MediaTek
> 
> It should be proper name of companies (hint see other uses)
> 

Hello Vinod,

Thanks for review.
I will modify like this:
 /*
  * MediaTek DisplayPort PHY driver
  *
  * Copyright (c) 2022 BayLibre Inc.
  * Copyright (c) 2022 MediaTek Inc.
  */
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define PHY_OFFSET			0x1000
> > +
> > +#define MTK_DP_PHY_DIG_PLL_CTL_1	(PHY_OFFSET + 0x14)
> > +#define TPLL_SSC_EN			BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x3C)
> > +#define BIT_RATE_RBR			0
> > +#define BIT_RATE_HBR			1
> > +#define BIT_RATE_HBR2			2
> > +#define BIT_RATE_HBR3			3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
> > +#define DP_GLB_SW_RST_PHYD		BIT(0)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET +
> > 0x138)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET +
> > 0x238)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET +
> > 0x338)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET +
> > 0x438)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(BIT(10) | BIT(12))
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
> > +#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
> > +#define DRIVING_PARAM_3_DEFAULT	(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFA
> > ULT | \
> > +				 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> > +				 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> > +				 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
> > +#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(BIT(18) | BIT(21))
> > +#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
> > +#define DRIVING_PARAM_4_DEFAULT	(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFA
> > ULT | \
> > +				 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> > +				 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> > +				 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
> > +#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
> > +#define DRIVING_PARAM_5_DEFAULT	(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFA
> > ULT | \
> > +				 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
> > +#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
> > +#define DRIVING_PARAM_6_DEFAULT	(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEF
> > AULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
> > +#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
> > +#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
> > +#define DRIVING_PARAM_7_DEFAULT	(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEF
> > AULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> > +
> > +#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
> > +#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
> > +#define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEF
> > AULT | \
> > +				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> > +
> > +struct mtk_dp_phy {
> > +	struct regmap *regs;
> > +};
> > +
> > +static int mtk_dp_phy_init(struct phy *phy)
> > +{
> > +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +	u32 driving_params[] = {
> > +		DRIVING_PARAM_3_DEFAULT,
> > +		DRIVING_PARAM_4_DEFAULT,
> > +		DRIVING_PARAM_5_DEFAULT,
> > +		DRIVING_PARAM_6_DEFAULT,
> > +		DRIVING_PARAM_7_DEFAULT,
> > +		DRIVING_PARAM_8_DEFAULT
> > +	};
> > +
> > +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
> > +			  driving_params, ARRAY_SIZE(driving_params));
> > +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
> > +			  driving_params, ARRAY_SIZE(driving_params));
> > +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
> > +			  driving_params, ARRAY_SIZE(driving_params));
> > +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
> > +			  driving_params, ARRAY_SIZE(driving_params));
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_dp_phy_configure(struct phy *phy, union
> > phy_configure_opts *opts)
> > +{
> > +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +	u32 val;
> > +
> > +	if (opts->dp.set_rate) {
> > +		switch (opts->dp.link_rate) {
> > +		default:
> > +			dev_err(&phy->dev,
> > +				"Implementation error, unknown linkrate
> > %x\n",
> > +				opts->dp.link_rate);
> > +			return -EINVAL;
> > +		case 1620:
> > +			val = BIT_RATE_RBR;
> > +			break;
> > +		case 2700:
> > +			val = BIT_RATE_HBR;
> > +			break;
> > +		case 5400:
> > +			val = BIT_RATE_HBR2;
> > +			break;
> > +		case 8100:
> > +			val = BIT_RATE_HBR3;
> > +			break;
> > +		}
> > +		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE,
> > val);
> > +	}
> > +
> > +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> > +			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN :
> > 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_dp_phy_reset(struct phy *phy)
> > +{
> > +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +
> > +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +			   DP_GLB_SW_RST_PHYD, 0);
> > +	usleep_range(50, 200);
> > +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> > +			   DP_GLB_SW_RST_PHYD, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct phy_ops mtk_dp_phy_dev_ops = {
> > +	.init = mtk_dp_phy_init,
> > +	.configure = mtk_dp_phy_configure,
> > +	.reset = mtk_dp_phy_reset,
> > +	.owner = THIS_MODULE,
> > +};
> > +
> > +static int mtk_dp_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_dp_phy *dp_phy;
> > +	struct phy *phy;
> > +	struct regmap *regs;
> > +
> > +	regs = *(struct regmap **)dev->platform_data;
> 
> why do you need this cast away from void?
> 

When register platform data (in mtk_dp.c prober)
we do this where "struct regmap *regs;":

mtk_dp->phy_dev = platform_device_register_data(
			dev, "mediatek-dp-phy",
			PLATFORM_DEVID_AUTO, &mtk_dp->regs,
			sizeof(struct regmap *));

refer to [1].

[1]: 
https://lore.kernel.org/all/20220610105522.13449-6-rex-bc.chen@mediatek.com/

BRs,
Bo-Chen
> > +	if (!regs)
> > +		return dev_err_probe(dev, EINVAL,
> > +				     "No data passed, requires struct
> > regmap**\n");
> > +
> > +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> > +	if (!dp_phy)
> > +		return -ENOMEM;
> > +
> > +	dp_phy->regs = regs;
> > +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> > +	if (IS_ERR(phy))
> > +		return dev_err_probe(dev, PTR_ERR(phy),
> > +				     "Failed to create DP PHY\n");
> > +
> > +	phy_set_drvdata(phy, dp_phy);
> > +	if (!dev->of_node)
> > +		phy_create_lookup(phy, "dp", dev_name(dev));
> > +
> > +	return 0;
> > +}
> > +
> > +struct platform_driver mtk_dp_phy_driver = {
> > +	.probe = mtk_dp_phy_probe,
> > +	.driver = {
> > +		.name = "mediatek-dp-phy",
> > +	},
> > +};
> > +module_platform_driver(mtk_dp_phy_driver);
> > +
> > +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> > +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.18.0
> 
> 

