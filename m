Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C581D702C93
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5B710E1B4;
	Mon, 15 May 2023 12:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838D710E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:22:58 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E183866031DA;
 Mon, 15 May 2023 13:22:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684153375;
 bh=98B5mJTAUSmVKru8czA0oh+6LAGepM46W0mrjhZI4Oo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PV3ty7dex/OyBcCnmX4b3QfFuoxppPLa+W6rlkQWbI9M9eB3rqPSiobVwSizmSln8
 w23OlQA1JyeOMH5P8tubC4GPfgeXpTl3L8TLqeBV//iFPSmpvQodJ58AuW8hzuFLYC
 Dptl97l32kis0bZI3CXCsTcnK7rbYv226L03/Q3seWNz4wOGtMcaeqMk0zoPVJQ/MG
 lqtwjesOW813Jy3YEGSDlQwASoHJJo4r+FSpcmvQtv1XNtmHj326bfsEokYyAWidNX
 yUFJy73AGMHAlu/gmWIu6oMp7naCB3W+1d+OkKGe+8grQV7ANylJ1gCGwJa/qpBq8b
 COILUkevTd5bA==
Message-ID: <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
Date: Mon, 15 May 2023 14:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515090551.1251389-3-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/05/23 11:05, Julien Stephan ha scritto:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This is a new driver that supports the MIPI CSI CD-PHY version 0.5
> 
> The number of PHYs depend on the soc.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use GENMASK]
> [Julien Stephan: refactor code]
> [Julien Stephan: update device tree support and probe function]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   MAINTAINERS                                   |   1 +
>   drivers/phy/mediatek/Kconfig                  |   8 +
>   drivers/phy/mediatek/Makefile                 |   2 +
>   .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  58 ++++
>   drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 257 ++++++++++++++++++
>   5 files changed, 326 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
>   create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44f0ff11e984..fc2766cb50d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13103,6 +13103,7 @@ M:	Julien Stephan <jstephan@baylibre.com>
>   M:	Andy Hsieh <andy.hsieh@mediatek.com>
>   S:	Supported
>   F:	Documentation/devicetree/bindings/phy/mediatek,phy-mipi-csi-0-5.yaml
> +F:	drivers/phy/mediatek/phy-mtk-mipi-csi-0-5*
>   
>   MEDIATEK MMC/SD/SDIO DRIVER
>   M:	Chaotian Jing <chaotian.jing@mediatek.com>
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 3125ecb5d119..452bc7ac5ce5 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -74,3 +74,11 @@ config PHY_MTK_DP
>   	select GENERIC_PHY
>   	help
>   	  Support DisplayPort PHY for MediaTek SoCs.
> +
> +config PHY_MTK_MIPI_CSI_0_5
> +	tristate "MediaTek CSI CD-PHY v 0.5 Driver"

"MediaTek CSI CD-PHY v0.5 Driver"

> +	depends on ARCH_MEDIATEK && OF
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the MIPI CSI CD-PHY receiver version 0.5.
> +	  The driver supports multiple CSI cdphy ports simultaneously.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index fb1f8edaffa7..8eb7b8747c67 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -18,3 +18,5 @@ phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
>   phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
>   phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
>   obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
> +
> +obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
> new file mode 100644
> index 000000000000..e9a7f1ab3e2f
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H__
> +#define __PHY_MTK__MIPI_CSI__C_0_5_RX_REG_H__

What about....

__PHY_MTK_MIPI_CSI_V_0_5_RX_REG_H ?

> +
> +/*
> + * CSI1 and CSI2 are identical, and similar to CSI0. All CSIx macros are
> + * applicable to the three PHYs. Where differences exist, they are denoted by
> + * macro names using CSI0 and CSI1, the latter being applicable to CSI1 and
> + * CSI2 alike.
> + */
> +
> +#define MIPI_RX_ANA00_CSIxA			0x0000

I would rename all those from "CSIx" to "CSIX" (so, just toupper('x')).

> +#define RG_CSI0A_CPHY_EN			BIT(0)

..snip..

> +
> +#endif
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
> new file mode 100644
> index 000000000000..ae2d3dc9631d
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "phy-mtk-io.h"
> +#include "phy-mtk-mipi-csi-0-5-rx-reg.h"
> +
> +#define CSIxB_OFFSET		0x1000

What if we grab two (or three?) iospaces from devicetree?

- base (global)
- csi_a
- csi_b

That would make it possible to maybe eventually extend this driver to more
versions (older or newer) of the CSI PHY IP without putting fixes offsets
inside of platform data structures and such.

> +
> +struct mtk_mipi_dphy;
> +
> +struct mtk_mipi_dphy_port {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct phy *phy;
> +	bool is_cdphy;
> +};
> +
> +static int mtk_mipi_phy_power_on(struct phy *phy)
> +{
> +	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
> +	void __iomem *base = port->base;
> +
> +	/*
> +	 * Only DPHY is supported for now,
> +	 * so set analog phy mode to DPHY in CDPHY compatible PHYs
> +	 */
> +	if (port->is_cdphy) {
> +		mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +				     RG_CSI0A_CPHY_EN, 0);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +				     RG_CSI0A_CPHY_EN, 0);
> +	}
> +
> +	/*
> +	 * Lane configuration:
> +	 *
> +	 * Only 4 data + 1 clock is supported for now with the following mapping:
> +	 *
> +	 * CSIxA_LNR0 --> D2
> +	 * CSIxA_LNR1 --> D0
> +	 * CSIxA_LNR2 --> C
> +	 * CSIxB_LNR0 --> D1
> +	 * CSIxB_LNR1 --> D3
> +	 */
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L0_CKSEL, 1);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L1_CKSEL, 1);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L2_CKMODE_EN, 1);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L2_CKSEL, 1);
> +
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L0_CKSEL, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L1_CKSEL, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_DPHY_L2_CKSEL, 1);
> +
> +	/* Byte clock invert */
> +	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
> +	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANAA8_CSIxA,
> +			     RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +	/* Start ANA EQ tuning */
> +	if (port->is_cdphy) {

statid void mtk_phy_csi_analog_eq_tune(struct mtk_mipi_dphy_port *port)
{
	if (port->is_cdphy)
		mtk_phy_csi_dphy_ana_eq_tune(...)
	else
		mtk_phy_csi_cphy_ana_eq_tune(...)

	/* CPHY/DPHY common "end of tuning" sequence below */
	mtk_phy_update_field( ... stuff ...);
}

...then all those calls will also fit in one line due to the reduced
indentation, improving readability and reducing line count.

> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
> +				     RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
> +				     RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA20_CSI0A,
> +				     RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA20_CSI0A,
> +				     RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +	} else {
> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L0_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L0_EQ_BW, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L1_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L1_EQ_BW, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI1A_L2_EQ_IS, 1);
> +		mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI1A_L2_EQ_BW, 1);
> +
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L0_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L0_EQ_BW, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L1_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA18_CSIxA,
> +				     RG_CSI1A_L1_EQ_BW, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI1A_L2_EQ_IS, 1);
> +		mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA1C_CSIxA,
> +				     RG_CSI1A_L2_EQ_BW, 1);
> +	}
> +
> +	/* End ANA EQ tuning */
> +	mtk_phy_set_bits(base + MIPI_RX_ANA40_CSIxA, 0x90);
> +
> +	mtk_phy_update_field(base + MIPI_RX_ANA24_CSIxA,
> +			     RG_CSIxA_RESERVE, 0x40);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA24_CSIxA,
> +			     RG_CSIxA_RESERVE, 0x40);
> +	mtk_phy_update_field(base + MIPI_RX_WRAPPER80_CSIxA,
> +			     CSR_CSI_RST_MODE, 0);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_WRAPPER80_CSIxA,
> +			     CSR_CSI_RST_MODE, 0);
> +	/* ANA power on */
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_CORE_EN, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_CORE_EN, 1);
> +	usleep_range(20, 40);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_LPF_EN, 1);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_LPF_EN, 1);
> +
> +	return 0;
> +}
> +
> +static int mtk_mipi_phy_power_off(struct phy *phy)
> +{
> +	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
> +	void __iomem *base = port->base;
> +
> +	/* Disable MIPI BG. */
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_CORE_EN, 0);
> +	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_LPF_EN, 0);
> +
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_CORE_EN, 0);
> +	mtk_phy_update_field(base + CSIxB_OFFSET + MIPI_RX_ANA00_CSIxA,
> +			     RG_CSIxA_BG_LPF_EN, 0);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops mtk_dphy_ops = {
> +	.power_on	= mtk_mipi_phy_power_on,
> +	.power_off	= mtk_mipi_phy_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int mtk_mipi_dphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct mtk_mipi_dphy_port *port;
> +	struct phy *phy;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, port);
> +
> +	port->dev = dev;
> +
> +	port->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(port->base))
> +		return PTR_ERR(port->base);
> +
> +	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");

This driver doesn't support C-PHY mode, so you either add support for that, or in
my opinion you should simply refuse to probe it, as it is *dysfunctional* for the
unsupported case (and might even introduce unstabilities).

	/* At the moment, only D-PHY mode is supported */
	if (!port->is_cdphy)
		return -EINVAL;

Also, please don't use underscores for devicetree properties: "mediatek,is-cdphy"
is fine.

> +
> +	phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
> +		return PTR_ERR(phy);
> +	}
> +
> +	port->phy = phy;
> +	phy_set_drvdata(phy, port);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		dev_err(dev, "Failed to register PHY provider: %ld\n",
> +			PTR_ERR(phy_provider));
> +		return PTR_ERR(phy_provider);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_mipi_dphy_of_match[] = {
> +	{.compatible = "mediatek,phy-mipi-csi-0-5"},

leave spaces.

	{ .comp... " },

...and always end with

	{ /* sentinel */ }


Also, please follow what the other PHY drivers do and use a SoC model,
example:

"mediatek,mt7777-csi-phy", or "mediatek,mt8888-csi-rx"

where the latter would make more sense imo.

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> +
> +static struct platform_driver mipi_dphy_pdrv = {
> +	.probe = mtk_mipi_dphy_probe,
> +	.driver	= {
> +		.name	= "mtk-mipi-csi-0-5",
> +		.of_match_table = mtk_mipi_dphy_of_match,
> +	},
> +};
> +

remove extra blank line here.

> +module_platform_driver(mipi_dphy_pdrv);
> +
> +MODULE_DESCRIPTION("MTK mipi csi cdphy driver");

"MediaTek MIPI CSI CDPHY Driver"

> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL");

Regards,
Angelo

