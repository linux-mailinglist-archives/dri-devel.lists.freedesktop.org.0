Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951EC4377B1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D3189BB2;
	Fri, 22 Oct 2021 13:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AB889B60
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:07:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so2164855wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UGjYpSf1suvoAVRlObzio963Ea2jH5VZ7H2sh84EWBI=;
 b=6BpJXt7YtQEcAYjgIiBbsV3sGe9kkzUlhP7LAcmXAjR+O9ozBayImK4hXyJuh+Ubii
 OWZ7yvAoqWKoLaDYVs5Maiz62tJmDhI0tYt/FX5QSy/i9aFn1/QI6WgCTu9lNE3MyxPo
 6o6TwBtBWCsx2Ol6Yxhz0fNXd9iDruBwVRvZYUwxXbYeEvAUnNWuvfSiAeOURK3TJqoZ
 HXCGME99q0D0mjVrTj7sQHieetc1rLJjnA4XFrJuMleY6NVRRuFeV/ifG5TBk76Y54RU
 zy/sn2vxC5cK4/iNRuA5WP/L21/DBrco+kUXgbTdpVubQMpy8ZfJRPx+hFqAuuSTjrCF
 IqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UGjYpSf1suvoAVRlObzio963Ea2jH5VZ7H2sh84EWBI=;
 b=ZfBWVgYEP+/xN+0hbT5J0jpNcLgSjuoHJ6mOX+7oCYnwlcIQGuvwfvp1dlXJuXRCe4
 rw3wGHH93UlputMadw5K8wuOsmZMy8ni9iP/Xi9vBs6cTCXaylxP0mjT7jSVOMi80Dyi
 Y6jSeTLJoNupiQnPYpWMti9SRRGJMwa8vlsTYuUKsBA2tvd5L3mvK6a/X/ht8974S1T9
 4LHdfGDBqv6S6U5jo4jJHpLnViF1ur2uTzE/VAZgZC9093xZyftSYlesLOkzDOFZmriz
 U6F0prooCu3XX0QUPiv87CcAneNyH6tjcF3trXjBjv4GytdMQ5RutiO4i+2Mf2+VN0yS
 6IrA==
X-Gm-Message-State: AOAM533dL+RQzG/h5PsUEYZ5lbrkxXU1aoyH/xHunC2wSFaSIu/FTXki
 qASOW1q+ZDlxWNGOtyxmhySXww==
X-Google-Smtp-Source: ABdhPJzU7AOubtWvY0RAtHRDoCIlaQvtCUqfe0GbkGk3JXb6JITNYUnVWGk6+dXfe4eP5aZ3/K7ZtQ==
X-Received: by 2002:adf:f192:: with SMTP id h18mr15656560wro.33.1634908057568; 
 Fri, 22 Oct 2021 06:07:37 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id d3sm8164815wrb.36.2021.10.22.06.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 06:07:09 -0700 (PDT)
Date: Fri, 22 Oct 2021 15:06:36 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <20211022130636.ncqisltwsvkkc7cg@blmsp>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-7-msp@baylibre.com>
 <YXJIPu/Ax6qeft03@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXJIPu/Ax6qeft03@matsya>
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

Hi Vinod,

On Fri, Oct 22, 2021 at 10:42:30AM +0530, Vinod Koul wrote:
> On 21-10-21, 11:27, Markus Schneider-Pargmann wrote:
> > This is a new driver that supports the integrated DisplayPort phy for
> > mediatek SoCs, especially the mt8195. The phy is integrated into the
> > DisplayPort controller and will be created by the mtk-dp driver. This
> > driver expects a struct regmap to be able to work on the same registers
> > as the DisplayPort controller. It sets the device data to be the struct
> > phy so that the DisplayPort controller can easily work with it.
> > 
> > The driver does not have any devicetree bindings because the datasheet
> > does not list the controller and the phy as distinct units.
> > 
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v3 -> v4:
> >     - Split DP controller driver and phy driver into separate patches.
> >     - Add entry to MAINTAINERS for this phy driver
> > 
> >  MAINTAINERS                       |   1 +
> >  drivers/phy/mediatek/Kconfig      |   8 ++
> >  drivers/phy/mediatek/Makefile     |   1 +
> >  drivers/phy/mediatek/phy-mtk-dp.c | 219 ++++++++++++++++++++++++++++++
> >  4 files changed, 229 insertions(+)
> >  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index eeb4c70b3d5b..8a47eb628734 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6276,6 +6276,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >  S:	Supported
> >  F:	Documentation/devicetree/bindings/display/mediatek/
> >  F:	drivers/gpu/drm/mediatek/
> > +F:	drivers/phy/mediatek/phy-mtk-dp.c
> >  F:	drivers/phy/mediatek/phy-mtk-hdmi*
> >  F:	drivers/phy/mediatek/phy-mtk-mipi*
> >  
> > diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> > index 55f8e6c048ab..f7ec86059049 100644
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
> > +	  Support DisplayPort PHY for Mediatek SoCs.
> > diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
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
> > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> > new file mode 100644
> > index 000000000000..296203e319ac
> > --- /dev/null
> > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 BayLibre
> > + * Author: Markus Schneider-Pargmann <msp@baylibre.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define PHY_OFFSET 0x1000
> > +
> > +#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x014)
> > +# define TPLL_SSC_EN				BIT(3)
> > +
> > +#define MTK_DP_PHY_DIG_BIT_RATE			(PHY_OFFSET + 0x03C)
> > +# define BIT_RATE_RBR				0
> > +# define BIT_RATE_HBR				1
> > +# define BIT_RATE_HBR2				2
> > +# define BIT_RATE_HBR3				3
> > +
> > +#define MTK_DP_PHY_DIG_SW_RST			(PHY_OFFSET + 0x038)
> > +# define DP_GLB_SW_RST_PHYD			BIT(0)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	0x10
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(0x14 << 8)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	(0x18 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	(0x20 << 24)
> 
> Pls use GENMASK() for this?
> 
> > +# define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_4		(PHY_OFFSET + 0x13C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_4		(PHY_OFFSET + 0x23C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_4		(PHY_OFFSET + 0x33C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_4		(PHY_OFFSET + 0x43C)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	0x18
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	(0x1e << 8)
> > +# define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(0x24 << 16)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	(0x20 << 24)
> > +# define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_5		(PHY_OFFSET + 0x140)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_5		(PHY_OFFSET + 0x240)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_5		(PHY_OFFSET + 0x340)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_5		(PHY_OFFSET + 0x440)
> > +# define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	0x28
> > +# define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	(0x30 << 8)
> > +# define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_6		(PHY_OFFSET + 0x144)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_6		(PHY_OFFSET + 0x244)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_6		(PHY_OFFSET + 0x344)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_6		(PHY_OFFSET + 0x444)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0x00
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	(0x04 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	(0x08 << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	(0x10 << 24)
> > +# define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_7		(PHY_OFFSET + 0x148)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_7		(PHY_OFFSET + 0x248)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_7		(PHY_OFFSET + 0x348)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_7		(PHY_OFFSET + 0x448)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0x00
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	(0x06 << 8)
> > +# define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	(0x0c << 16)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	(0x00 << 24)
> > +# define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> > +
> > +#define MTK_DP_LANE0_DRIVING_PARAM_8		(PHY_OFFSET + 0x14C)
> > +#define MTK_DP_LANE1_DRIVING_PARAM_8		(PHY_OFFSET + 0x24C)
> > +#define MTK_DP_LANE2_DRIVING_PARAM_8		(PHY_OFFSET + 0x34C)
> > +#define MTK_DP_LANE3_DRIVING_PARAM_8		(PHY_OFFSET + 0x44C)
> > +# define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	0x08
> > +# define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	(0x00 << 8)
> > +# define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> > +						 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
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
> > +static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> > +{
> > +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> > +	u32 val;
> > +
> > +	if (opts->dp.set_rate) {
> > +		switch (opts->dp.link_rate) {
> > +		default:
> > +			dev_err(&phy->dev,
> > +				"Implementation error, unknown linkrate %x\n",
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
> > +		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
> > +	}
> > +
> > +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE,
> > +			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
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
> > +
> > +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> > +	if (!dp_phy)
> > +		return -ENOMEM;
> > +
> > +	dp_phy->regs = *(struct regmap **)dev->platform_data;
> > +	if (!dp_phy->regs) {
> > +		dev_err(dev, "No data passed, requires struct regmap**\n");
> > +		return -EINVAL;
> > +	}
> 
> is there a reason to do it this way? Why not set the IORESOURCE_MEM for
> this device and let the driver map here?
> 
> NO clocks?

As briefly mentioned in the commit message, this phy is not a dedicated
phy. It is embedded in the DisplayPort controller that is added in patch
7 of this series. The registerspace of the DisplayPort controller starts
at offset 0x0, continues with 0x1000 for PHY related functions and goes
on with encoder related and other registers at 0x2000, 0x3000 and
0x4000.

As this seems to me to be a single function block (also from what I read
from the datasheet), I designed the binding documentation so that the
DisplayPort controller starts at 0x0 and spans all registers. Based on
that I wanted to share the regmap created in the DisplayPort controller
with this PHY driver that is a direct child of that driver, similar to
multi function device drivers.

That also means that the PHY does not have any clocks it requires as it
only exists in the context of the DisplayPort controller. I could pass
the same clocks to the PHY, but the use of these clocks does not make
any difference.

As I don't have a piece of devicetree, I struggled with using phy_get
as, if I understand it correctly, it uses the devicetree to find the
correct PHY device?

Do you have a suggestion on how I could improve this interaction between
DP controller and PHY? Maybe some driver that I could look at that has
similar constraints?

Thank you!

Best,
Markus

> 
> > +
> > +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> > +	if (IS_ERR(phy)) {
> > +		dev_err(dev, "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
> > +		return PTR_ERR(phy);
> > +	}
> > +	phy_set_drvdata(phy, dp_phy);
> > +
> > +	// Set device data to the phy so that mtk-dp can get it easily
> 
> pls change comment style
> 
> also why should mtk-dp do it this way, there is very nice API phy_get()
> to do that, pls use that..
> 
> 
> > +	dev_set_drvdata(dev, phy);
> > +
> > +	return 0;
> > +}
> > +
> > +struct platform_driver mtk_dp_phy_driver = {
> 
> who creates this platform device?
> 
> > +	.probe = mtk_dp_phy_probe,
> > +	.driver = {
> > +		.name = "mediatek-dp-phy",
> > +	},
> > +};
> > +module_platform_driver(mtk_dp_phy_driver);
> > +
> > +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> > +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 2.33.0
> 
> -- 
> ~Vinod
