Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1CF7CC3C2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E87210E13C;
	Tue, 17 Oct 2023 12:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6FA10E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1697547374; x=1729083374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lLcqEjandV7TrWsUfx/5TzzhZmbGiZMsw4Ouv3pAs1s=;
 b=JMkR3cvpKyc6MR3imKCoognOwcMwYfxLoXHJZNMgfyLXgaP5ZA6kbUUu
 +kJLXCQWPm9a09hHUg5pRVf8Kp2Vx5kgCFraNobt7kWKkYMXcZi3oXIda
 VSNBX+i0bLtC4cOU5NljnFRO89odV4UWhrpMH4A+N08vi7E/ShRIxtOSX
 OorPDeTXN9OdVHx8P6SkLI+pN2yjiEYUs6ZhFMgFcANOz5R12UE2RLeAh
 bgNqD7WeCzFWx0zzZF550g0QPt+DR4WIJqD1NdSXFio0/7FrESrZCXYhP
 MD1cPmRlGcI0vguFw8BlSeHIbhqOYXu6HI/tJD7hRXbqTqjRQvoZYbJl+ g==;
X-IronPort-AV: E=Sophos;i="6.03,232,1694728800"; d="scan'208";a="33507302"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Oct 2023 14:56:11 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 53A1F280082;
 Tue, 17 Oct 2023 14:56:11 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v11 6/7] phy: freescale: Add DisplayPort PHY driver for
 i.MX8MQ
Date: Tue, 17 Oct 2023 14:56:12 +0200
Message-ID: <2101977.bB369e8A3T@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <fbb6245959647b260ffaa7b1dc02e83d28090cf6.1697524277.git.Sandor.yu@nxp.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
 <fbb6245959647b260ffaa7b1dc02e83d28090cf6.1697524277.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

thanks for the patch.

Am Dienstag, 17. Oktober 2023, 09:04:02 CEST schrieb Sandor Yu:
> Add Cadence HDP-TX DisplayPort PHY driver for i.MX8MQ
>=20
> Cadence HDP-TX PHY could be put in either DP mode or
> HDMI mode base on the configuration chosen.
> DisplayPort PHY mode is configurated in the driver.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v9->v11:
>  *No change.
>=20
>  drivers/phy/freescale/Kconfig             |  10 +
>  drivers/phy/freescale/Makefile            |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-dp.c | 720 ++++++++++++++++++++++
>  3 files changed, 731 insertions(+)
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c
>=20
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index 853958fb2c063..c39709fd700ac 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
>  	  Enable this to add support for the PCIE PHY as found on
>  	  i.MX8M family of SOCs.
>=20
> +config PHY_FSL_IMX8MQ_DP
> +	tristate "Freescale i.MX8MQ DP PHY support"
> +	depends on OF && HAS_IOMEM
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	select CDNS_MHDP_HELPER
> +	help
> +	  Enable this to support the Cadence HDPTX DP PHY driver
> +	  on i.MX8MQ SOC.
> +
>  endif
>=20
>  config PHY_FSL_LYNX_28G
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makef=
ile
> index cedb328bc4d28..47e5285209fa8 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_FSL_IMX8MQ_DP)		+=3D phy-fsl-imx8mq-dp.o
>  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+=3D phy-fsl-imx8mq-usb.o
>  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+=3D phy-fsl-imx8qm-lvds-phy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+=3D phy-fsl-imx8-mipi-dphy.o
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
> b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c new file mode 100644
> index 0000000000000..5f0d7da16b422
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-dp.c
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence HDP-TX Display Port Interface (DP) PHY driver
> + *
> + * Copyright (C) 2022, 2023 NXP Semiconductor, Inc.
> + */
> +#include <asm/unaligned.h>
> +#include <drm/bridge/cdns-mhdp-helper.h>
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#define ADDR_PHY_AFE	0x80000
> +
> +/* PHY registers */
> +#define CMN_SSM_BIAS_TMR			0x0022
> +#define CMN_PLLSM0_PLLEN_TMR			0x0029
> +#define CMN_PLLSM0_PLLPRE_TMR			0x002a
> +#define CMN_PLLSM0_PLLVREF_TMR			0x002b
> +#define CMN_PLLSM0_PLLLOCK_TMR			0x002c
> +#define CMN_PLLSM0_USER_DEF_CTRL		0x002f
> +#define CMN_PSM_CLK_CTRL			0x0061
> +#define CMN_PLL0_VCOCAL_START			0x0081
> +#define CMN_PLL0_VCOCAL_INIT_TMR		0x0084
> +#define CMN_PLL0_VCOCAL_ITER_TMR		0x0085
> +#define CMN_PLL0_INTDIV				0x0094
> +#define CMN_PLL0_FRACDIV			0x0095
> +#define CMN_PLL0_HIGH_THR			0x0096
> +#define CMN_PLL0_DSM_DIAG			0x0097
> +#define CMN_PLL0_SS_CTRL2			0x0099
> +#define CMN_ICAL_INIT_TMR			0x00c4
> +#define CMN_ICAL_ITER_TMR			0x00c5
> +#define CMN_RXCAL_INIT_TMR			0x00d4
> +#define CMN_RXCAL_ITER_TMR			0x00d5
> +#define CMN_TXPUCAL_INIT_TMR			0x00e4
> +#define CMN_TXPUCAL_ITER_TMR			0x00e5
> +#define CMN_TXPDCAL_INIT_TMR			0x00f4
> +#define CMN_TXPDCAL_ITER_TMR			0x00f5
> +#define CMN_ICAL_ADJ_INIT_TMR			0x0102
> +#define CMN_ICAL_ADJ_ITER_TMR			0x0103
> +#define CMN_RX_ADJ_INIT_TMR			0x0106
> +#define CMN_RX_ADJ_ITER_TMR			0x0107
> +#define CMN_TXPU_ADJ_INIT_TMR			0x010a
> +#define CMN_TXPU_ADJ_ITER_TMR			0x010b
> +#define CMN_TXPD_ADJ_INIT_TMR			0x010e
> +#define CMN_TXPD_ADJ_ITER_TMR			0x010f
> +#define CMN_DIAG_PLL0_FBH_OVRD			0x01c0
> +#define CMN_DIAG_PLL0_FBL_OVRD			0x01c1
> +#define CMN_DIAG_PLL0_OVRD			0x01c2
> +#define CMN_DIAG_PLL0_TEST_MODE			0x01c4
> +#define CMN_DIAG_PLL0_V2I_TUNE			0x01c5
> +#define CMN_DIAG_PLL0_CP_TUNE			0x01c6
> +#define CMN_DIAG_PLL0_LF_PROG			0x01c7
> +#define CMN_DIAG_PLL0_PTATIS_TUNE1		0x01c8
> +#define CMN_DIAG_PLL0_PTATIS_TUNE2		0x01c9
> +#define CMN_DIAG_HSCLK_SEL			0x01e0
> +#define CMN_DIAG_PER_CAL_ADJ			0x01ec
> +#define CMN_DIAG_CAL_CTRL			0x01ed
> +#define CMN_DIAG_ACYA				0x01ff
> +#define XCVR_PSM_RCTRL				0x4001
> +#define XCVR_PSM_CAL_TMR			0x4002
> +#define XCVR_PSM_A0IN_TMR			0x4003
> +#define TX_TXCC_CAL_SCLR_MULT_0			0x4047
> +#define TX_TXCC_CPOST_MULT_00_0			0x404c
> +#define XCVR_DIAG_PLLDRC_CTRL			0x40e0
> +#define XCVR_DIAG_PLLDRC_CTRL			0x40e0
> +#define XCVR_DIAG_HSCLK_SEL			0x40e1
> +#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR		0x40f2
> +#define TX_PSC_A0				0x4100
> +#define TX_PSC_A1				0x4101
> +#define TX_PSC_A2				0x4102
> +#define TX_PSC_A3				0x4103
> +#define TX_RCVDET_EN_TMR			0x4122
> +#define TX_RCVDET_ST_TMR			0x4123
> +#define TX_DIAG_BGREF_PREDRV_DELAY		0x41e7
> +#define TX_DIAG_BGREF_PREDRV_DELAY		0x41e7
> +#define TX_DIAG_ACYA_0				0x41ff
> +#define TX_DIAG_ACYA_1				0x43ff
> +#define TX_DIAG_ACYA_2				0x45ff
> +#define TX_DIAG_ACYA_3				0x47ff
> +#define TX_ANA_CTRL_REG_1			0x5020
> +#define TX_ANA_CTRL_REG_2			0x5021
> +#define TX_DIG_CTRL_REG_1			0x5023
> +#define TX_DIG_CTRL_REG_2			0x5024
> +#define TXDA_CYA_AUXDA_CYA			0x5025
> +#define TX_ANA_CTRL_REG_3			0x5026
> +#define TX_ANA_CTRL_REG_4			0x5027
> +#define TX_ANA_CTRL_REG_5			0x5029
> +#define RX_PSC_A0				0x8000
> +#define RX_PSC_CAL				0x8006
> +#define PHY_HDP_MODE_CTRL			0xc008
> +#define PHY_HDP_CLK_CTL				0xc009
> +#define PHY_PMA_CMN_CTRL1			0xc800
> +
> +/* PHY_PMA_CMN_CTRL1 */
> +#define CMA_REF_CLK_SEL_MASK			GENMASK(6, 4)
> +#define CMA_REF_CLK_RCV_EN_MASK			BIT(3)
> +#define CMA_REF_CLK_RCV_EN			1
> +
> +/* PHY_HDP_CLK_CTL */
> +#define PLL_DATA_RATE_CLK_DIV_MASK		GENMASK(15, 8)
> +#define PLL_DATA_RATE_CLK_DIV_HBR		0x24
> +#define PLL_DATA_RATE_CLK_DIV_HBR2		0x12
> +#define PLL_CLK_EN_ACK				BIT(3)
> +#define PLL_CLK_EN				BIT(2)
> +#define PLL_READY				BIT(1)
> +#define PLL_EN					BIT(0)
> +
> +/* CMN_DIAG_HSCLK_SEL */
> +#define HSCLK1_SEL_MASK				GENMASK(5, 4)
> +#define HSCLK0_SEL_MASK				GENMASK(1, 0)
> +#define HSCLK_PLL0_DIV2				1
> +
> +/* XCVR_DIAG_HSCLK_SEL */
> +#define HSCLK_SEL_MODE3_MASK			GENMASK(13, 12)
> +#define HSCLK_SEL_MODE3_HSCLK1			1
> +
> +/* XCVR_DIAG_PLLDRC_CTRL */
> +#define DPLL_CLK_SEL_MODE3			BIT(14)
> +#define DPLL_DATA_RATE_DIV_MODE3_MASK		GENMASK(13, 12)
> +
> +/* PHY_HDP_MODE_CTRL */
> +#define POWER_STATE_A3_ACK			BIT(7)
> +#define POWER_STATE_A2_ACK			BIT(6)
> +#define POWER_STATE_A1_ACK			BIT(5)
> +#define POWER_STATE_A0_ACK			BIT(4)
> +#define POWER_STATE_A3				BIT(3)
> +#define POWER_STATE_A2				BIT(2)
> +#define POWER_STATE_A1				BIT(1)
> +#define POWER_STATE_A0				BIT(0)
> +
> +#define REF_CLK_27MHZ		27000000
> +
> +enum dp_link_rate {
> +	RATE_1_6 =3D 162000,
> +	RATE_2_1 =3D 216000,
> +	RATE_2_4 =3D 243000,
> +	RATE_2_7 =3D 270000,
> +	RATE_3_2 =3D 324000,
> +	RATE_4_3 =3D 432000,
> +	RATE_5_4 =3D 540000,
> +	RATE_8_1 =3D 810000,

RATE_8_1 is unused.

> +};
> +
> +#define MAX_LINK_RATE RATE_5_4
> +
> +struct phy_pll_reg {
> +	u16 val[7];
> +	u32 addr;
> +};
> +
> +static const struct phy_pll_reg phy_pll_27m_cfg[] =3D {
> +	/*  1.62    2.16    2.43    2.7     3.24    4.32    5.4     =20
register
> address */ +	{{ 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e=20
},
> CMN_PLL0_VCOCAL_INIT_TMR }, +	{{ 0x001b, 0x001b, 0x001b, 0x001b,=20
0x001b,
> 0x001b, 0x001b }, CMN_PLL0_VCOCAL_ITER_TMR }, +	{{ 0x30b9, 0x3087, 0x3096,
> 0x30b4, 0x30b9, 0x3087, 0x30b4 }, CMN_PLL0_VCOCAL_START }, +	{{=20
0x0077,
> 0x009f, 0x00b3, 0x00c7, 0x0077, 0x009f, 0x00c7 }, CMN_PLL0_INTDIV }, +=09
{{
> 0xf9da, 0xf7cd, 0xf6c7, 0xf5c1, 0xf9da, 0xf7cd, 0xf5c1 }, CMN_PLL0_FRACDIV
> }, +	{{ 0x001e, 0x0028, 0x002d, 0x0032, 0x001e, 0x0028, 0x0032 },
> CMN_PLL0_HIGH_THR }, +	{{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020,=20
0x0020,
> 0x0020 }, CMN_PLL0_DSM_DIAG }, +	{{ 0x0000, 0x1000, 0x1000, 0x1000,=20
0x0000,
> 0x1000, 0x1000 }, CMN_PLLSM0_USER_DEF_CTRL }, +	{{ 0x0000, 0x0000, 0x0000,
> 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_OVRD }, +	{{ 0x0000,
> 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 }, CMN_DIAG_PLL0_FBH_OVRD =
},
> +	{{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
> CMN_DIAG_PLL0_FBL_OVRD }, +	{{ 0x0006, 0x0007, 0x0007, 0x0007, 0x0006,
> 0x0007, 0x0007 }, CMN_DIAG_PLL0_V2I_TUNE }, +	{{ 0x0043, 0x0043, 0x0043,
> 0x0042, 0x0043, 0x0043, 0x0042 }, CMN_DIAG_PLL0_CP_TUNE }, +	{{=20
0x0008,
> 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008 }, CMN_DIAG_PLL0_LF_PROG },
> +	{{ 0x0100, 0x0001, 0x0001, 0x0001, 0x0100, 0x0001, 0x0001 },
> CMN_DIAG_PLL0_PTATIS_TUNE1 }, +	{{ 0x0007, 0x0001, 0x0001, 0x0001,=20
0x0007,
> 0x0001, 0x0001 }, CMN_DIAG_PLL0_PTATIS_TUNE2 }, +	{{ 0x0020, 0x0020,
> 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 }, CMN_DIAG_PLL0_TEST_MODE}, +	{{
> 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016 }, CMN_PSM_CLK_CTRL
> } +};
> +
> +struct cdns_hdptx_dp_phy {
> +	struct cdns_mhdp_base base;
> +
> +	void __iomem *regs;	/* DPTX registers base */
> +	struct device *dev;
> +	struct phy *phy;
> +	struct mutex mbox_mutex;	/* mutex to protect mailbox */
> +	struct clk *ref_clk, *apb_clk;
> +	u32 ref_clk_rate;
> +	u32 num_lanes;
> +	u32 link_rate;
> +	bool power_up;
> +};
> +
> +static int cdns_phy_reg_write(struct cdns_hdptx_dp_phy *cdns_phy, u32 ad=
dr,
> u32 val) +{
> +	return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE + (addr <<=20
2),
> val); +}
> +
> +static u32 cdns_phy_reg_read(struct cdns_hdptx_dp_phy *cdns_phy, u32 add=
r)
> +{
> +	u32 reg32;
> +
> +	cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr << 2),=20
&reg32);
> +	return reg32;
> +}
> +
> +static int link_rate_index(u32 rate)
> +{
> +	switch (rate) {
> +	case RATE_1_6:
> +		return 0;
> +	case RATE_2_1:
> +		return 1;
> +	case RATE_2_4:
> +		return 2;
> +	case RATE_2_7:
> +		return 3;
> +	case RATE_3_2:
> +		return 4;
> +	case RATE_4_3:
> +		return 5;
> +	case RATE_5_4:
> +		return 6;
> +	default:
> +		return -1;
> +	}
> +}
> +
> +static int hdptx_dp_clk_enable(struct cdns_hdptx_dp_phy *cdns_phy)
> +{
> +	struct device *dev =3D cdns_phy->dev;
> +	u32 ref_clk_rate;
> +	int ret;
> +
> +	cdns_phy->ref_clk =3D devm_clk_get(dev, "ref");
> +	if (IS_ERR(cdns_phy->ref_clk)) {
> +		dev_err(dev, "phy ref clock not found\n");
> +		return PTR_ERR(cdns_phy->ref_clk);
> +	}
> +
> +	cdns_phy->apb_clk =3D devm_clk_get(dev, "apb");
> +	if (IS_ERR(cdns_phy->apb_clk)) {
> +		dev_err(dev, "phy apb clock not found\n");
> +		return PTR_ERR(cdns_phy->apb_clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(cdns_phy->ref_clk);
> +	if (ret) {
> +		dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
> +		return ret;
> +	}
> +
> +	ref_clk_rate =3D clk_get_rate(cdns_phy->ref_clk);
> +	if (!ref_clk_rate) {
> +		dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
> +		goto err_ref_clk;
> +	}
> +
> +	if (ref_clk_rate =3D=3D REF_CLK_27MHZ) {
> +		cdns_phy->ref_clk_rate =3D ref_clk_rate;
> +	} else {
> +		dev_err(cdns_phy->dev, "Not support Ref Clock Rate(%dHz)
\n",
> ref_clk_rate); +		goto err_ref_clk;
> +	}
> +
> +	ret =3D clk_prepare_enable(cdns_phy->apb_clk);
> +	if (ret) {
> +		dev_err(cdns_phy->dev, "Failed to prepare apb clock\n");
> +		goto err_ref_clk;
> +	}
> +
> +	return 0;
> +
> +err_ref_clk:
> +	clk_disable_unprepare(cdns_phy->ref_clk);
> +	return -EINVAL;
> +}
> +
> +static void hdptx_dp_clk_disable(struct cdns_hdptx_dp_phy *cdns_phy)
> +{
> +	clk_disable_unprepare(cdns_phy->ref_clk);
> +	clk_disable_unprepare(cdns_phy->apb_clk);
> +}
> +
> +static void hdptx_dp_aux_cfg(struct cdns_hdptx_dp_phy *cdns_phy)
> +{
> +	/* Power up Aux */
> +	cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 1);
> +
> +	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_1, 0x3);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, 36);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa018);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa098);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa198);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
> +	ndelay(150);
> +	cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
> +}
> +
> +/* PMA common configuration for 27MHz */
> +static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_dp_phy
> *cdns_phy) +{
> +	u32 num_lanes =3D cdns_phy->num_lanes;
> +	u16 val;
> +	int k;
> +
> +	/* Enable PMA input ref clk(CMN_REF_CLK_RCV_EN) */
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +	val &=3D ~CMA_REF_CLK_RCV_EN_MASK;
> +	val |=3D FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK, CMA_REF_CLK_RCV_EN);
> +	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +
> +	/* Startup state machine registers */
> +	cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
> +	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR, 0x001b);
> +	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR, 0x0036);
> +	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR, 0x001b);
> +	cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR, 0x006c);
> +
> +	/* Current calibration registers */
> +	cdns_phy_reg_write(cdns_phy, CMN_ICAL_INIT_TMR, 0x0044);
> +	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_ITER_TMR, 0x0006);
> +
> +	/* Resistor calibration registers */
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_RXCAL_ITER_TMR, 0x0006);
> +	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_INIT_TMR, 0x0022);
> +	cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_ITER_TMR, 0x0006);
> +
> +	for (k =3D 0; k < num_lanes; k =3D k + 1) {
> +		/* Power state machine registers */
> +		cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  | (k << 9),=20
0x016d);
> +		cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR | (k << 9),=20
0x016d);
> +		/* Transceiver control and diagnostic registers */
> +		cdns_phy_reg_write(cdns_phy, XCVR_DIAG_LANE_FCM_EN_MGN_TMR=20
| (k << 9),
> 0x00a2); +		cdns_phy_reg_write(cdns_phy,=20
TX_DIAG_BGREF_PREDRV_DELAY | (k <<
> 9), 0x0097); +		/* Transmitter receiver detect registers */
> +		cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k << 9),=20
0x0a8c);
> +		cdns_phy_reg_write(cdns_phy, TX_RCVDET_ST_TMR | (k << 9),=20
0x0036);
> +	}
> +
> +	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
> +	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
> +	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
> +	cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
> +}
> +
> +static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_dp_phy
> *cdns_phy) +{
> +	u32 num_lanes =3D cdns_phy->num_lanes;
> +	u32 link_rate =3D cdns_phy->link_rate;
> +	u16 val;
> +	int index, i, k;
> +
> +	/* DP PLL data rate 0/1 clock divider value */
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +	val &=3D ~PLL_DATA_RATE_CLK_DIV_MASK;
> +	if (link_rate <=3D RATE_2_7)
> +		val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> +				  PLL_DATA_RATE_CLK_DIV_HBR);
> +	else
> +		val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> +				  PLL_DATA_RATE_CLK_DIV_HBR2);
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +
> +	/* High speed clock 0/1 div */
> +	val =3D cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
> +	val &=3D ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
> +	if (link_rate <=3D RATE_2_7) {
> +		val |=3D FIELD_PREP(HSCLK1_SEL_MASK, HSCLK_PLL0_DIV2);
> +		val |=3D FIELD_PREP(HSCLK0_SEL_MASK, HSCLK_PLL0_DIV2);
> +	}
> +	cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
> +
> +	for (k =3D 0; k < num_lanes; k++) {
> +		val =3D cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_HSCLK_SEL |=20
(k << 9)));
> +		val &=3D ~HSCLK_SEL_MODE3_MASK;
> +		if (link_rate <=3D RATE_2_7)
> +			val |=3D FIELD_PREP(HSCLK_SEL_MODE3_MASK,=20
HSCLK_SEL_MODE3_HSCLK1);
> +		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL | (k <<=20
9)), val);
> +	}
> +
> +	/* DP PHY PLL 27MHz configuration */
> +	index =3D link_rate_index(link_rate);
> +	for (i =3D 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
> +		cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i].addr,
> +				   phy_pll_27m_cfg[i].val[index]);
> +
> +	/* Transceiver control and diagnostic registers */
> +	for (k =3D 0; k < num_lanes; k++) {
> +		val =3D cdns_phy_reg_read(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL |=20
(k << 9)));
> +		val &=3D ~(DPLL_DATA_RATE_DIV_MODE3_MASK |=20
DPLL_CLK_SEL_MODE3);
> +		if (link_rate <=3D RATE_2_7)
> +			val |=3D FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK,=20
2);
> +		else
> +			val |=3D FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK,=20
1);
> +		cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_PLLDRC_CTRL | (k=20
<< 9)), val);
> +	}
> +
> +	for (k =3D 0; k < num_lanes; k =3D k + 1) {
> +		/* Power state machine registers */
> +		cdns_phy_reg_write(cdns_phy, (XCVR_PSM_RCTRL | (k << 9)),=20
0xbefc);
> +		cdns_phy_reg_write(cdns_phy, (TX_PSC_A0 | (k << 9)),=20
0x6799);
> +		cdns_phy_reg_write(cdns_phy, (TX_PSC_A1 | (k << 9)),=20
0x6798);
> +		cdns_phy_reg_write(cdns_phy, (TX_PSC_A2 | (k << 9)),=20
0x0098);
> +		cdns_phy_reg_write(cdns_phy, (TX_PSC_A3 | (k << 9)),=20
0x0098);
> +		/* Receiver calibration power state definition register */
> +		val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k << 9));
> +		val &=3D 0xffbb;
> +		cdns_phy_reg_write(cdns_phy, (RX_PSC_CAL | (k << 9)),=20
val);
> +		val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k << 9));
> +		val &=3D 0xffbb;
> +		cdns_phy_reg_write(cdns_phy, (RX_PSC_A0 | (k << 9)), val);
> +	}
> +}
> +
> +static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_dp_phy *cdns_p=
hy)
> +{
> +	u32 val;
> +
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +	val &=3D ~CMA_REF_CLK_SEL_MASK;
> +	/*
> +	 * single ended reference clock (val |=3D 0x0030);
> +	 * differential clock  (val |=3D 0x0000);
> +	 *
> +	 * for differential clock on the refclk_p and
> +	 * refclk_m off chip pins: CMN_DIAG_ACYA[8]=3D1'b1
> +	 * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
> +	 */
> +	val |=3D FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
> +	cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +}
> +
> +static int wait_for_ack(struct cdns_hdptx_dp_phy *cdns_phy, u32 reg, u32
> mask, +			const char *err_msg)
> +{
> +	u32 val, i;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		val =3D cdns_phy_reg_read(cdns_phy, reg);
> +		if (val & mask)
> +			return 0;
> +		msleep(20);
> +	}
> +
> +	dev_err(cdns_phy->dev, "%s\n", err_msg);
> +	return -1;

return -ETIMEDOUT?

> +}
> +
> +static int wait_for_ack_clear(struct cdns_hdptx_dp_phy *cdns_phy, u32 re=
g,
> u32 mask, +			      const char *err_msg)
> +{
> +	u32 val, i;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		val =3D cdns_phy_reg_read(cdns_phy, reg);
> +		if (!(val & mask))
> +			return 0;
> +		msleep(20);
> +	}
> +
> +	dev_err(cdns_phy->dev, "%s\n", err_msg);
> +	return -1;

return -ETIMEDOUT?

> +}
> +
> +static int hdptx_dp_phy_power_up(struct cdns_hdptx_dp_phy *cdns_phy)
> +{
> +	u32 val;
> +
> +	/* Enable HDP PLL=E2=80=99s for high speed clocks */
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +	val |=3D PLL_EN;
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +	if (wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
> +			 "Wait PLL Ack failed"))
> +		return -1;
> +
> +	/* Enable HDP PLL=E2=80=99s data rate and full rate clocks out of PMA. =
*/
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +	val |=3D PLL_CLK_EN;
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +	if (wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_CLK_EN_ACK,
> +			 "Wait PLL clock enable ACK failed"))
> +		return -1;
> +
> +	/* Configure PHY in A2 Mode */
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2);
> +	if (wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A2_ACK,
> +			 "Wait A2 Ack failed"))
> +		return -1;
> +
> +	/* Configure PHY in A0 mode (PHY must be in the A0 power
> +	 * state in order to transmit data)
> +	 */
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0);
> +	if (wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A0_ACK,
> +			 "Wait A0 Ack failed"))
> +		return -1;

Maybe you should just return the return value of wait_for_ack() in each err=
or=20
case.

> +	cdns_phy->power_up =3D true;
> +
> +	return 0;
> +}
> +
> +static void hdptx_dp_phy_power_down(struct cdns_hdptx_dp_phy *cdns_phy)
> +{
> +	u16 val;
> +
> +	if (!cdns_phy->power_up)
> +		return;
> +
> +	/* Place the PHY lanes in the A3 power state. */
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3);
> +	if (wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL, POWER_STATE_A3_ACK,
> +			 "Wait A3 Ack failed"))
> +		return;
> +
> +	/* Disable HDP PLL=E2=80=99s data rate and full rate clocks out of PMA.=
 */
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +	val &=3D ~PLL_CLK_EN;
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +	if (wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_CLK_EN_ACK,
> +			       "Wait PLL clock Ack clear failed"))
> +		return;
> +
> +	/* Disable HDP PLL=E2=80=99s for high speed clocks */
> +	val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +	val &=3D ~PLL_EN;
> +	cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +	if (wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
> +			       "Wait PLL Ack clear failed"))
> +		return;

I would have expected cdns_phy->power_up =3D false somewhere in this functi=
on.

> +}
> +
> +static int cdns_hdptx_dp_phy_on(struct phy *phy)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy =3D phy_get_drvdata(phy);
> +
> +	return hdptx_dp_phy_power_up(cdns_phy);
> +}
> +
> +static int cdns_hdptx_dp_phy_off(struct phy *phy)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy =3D phy_get_drvdata(phy);
> +
> +	hdptx_dp_phy_power_down(cdns_phy);
> +
> +	return 0;
> +}
> +
> +static int cdns_hdptx_dp_phy_init(struct phy *phy)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	hdptx_dp_phy_ref_clock_type(cdns_phy);
> +
> +	/* PHY power up */
> +	ret =3D hdptx_dp_phy_power_up(cdns_phy);
> +	if (ret < 0)
> +		return ret;
> +
> +	hdptx_dp_aux_cfg(cdns_phy);
> +
> +	return ret;
> +}
> +
> +static int cdns_hdptx_dp_configure(struct phy *phy,
> +				   union phy_configure_opts *opts)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	cdns_phy->link_rate =3D opts->dp.link_rate;
> +	cdns_phy->num_lanes =3D opts->dp.lanes;
> +
> +	if (cdns_phy->link_rate > MAX_LINK_RATE) {
> +		dev_err(cdns_phy->dev, "Link Rate(%d) Not supported\n",
> cdns_phy->link_rate); +		return false;
> +	}
> +
> +	/* Disable phy clock if PHY in power up state */
> +	hdptx_dp_phy_power_down(cdns_phy);
> +
> +	if (cdns_phy->ref_clk_rate =3D=3D REF_CLK_27MHZ) {
> +		hdptx_dp_phy_pma_cmn_cfg_27mhz(cdns_phy);
> +		hdptx_dp_phy_pma_cmn_pll0_27mhz(cdns_phy);
> +	} else {
> +		dev_err(cdns_phy->dev, "Not support ref clock rate\n");
> +	}
> +
> +	/* PHY power up */
> +	ret =3D hdptx_dp_phy_power_up(cdns_phy);
> +
> +	return ret;
> +}
> +
> +static const struct phy_ops cdns_hdptx_dp_phy_ops =3D {
> +	.init =3D cdns_hdptx_dp_phy_init,
> +	.configure =3D cdns_hdptx_dp_configure,
> +	.power_on =3D cdns_hdptx_dp_phy_on,
> +	.power_off =3D cdns_hdptx_dp_phy_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int cdns_hdptx_dp_phy_probe(struct platform_device *pdev)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct phy_provider *phy_provider;
> +	struct resource *res;
> +	struct phy *phy;
> +	int ret;
> +
> +	cdns_phy =3D devm_kzalloc(dev, sizeof(*cdns_phy), GFP_KERNEL);
> +	if (!cdns_phy)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, cdns_phy);
> +	cdns_phy->dev =3D dev;
> +	mutex_init(&cdns_phy->mbox_mutex);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +	cdns_phy->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	if (IS_ERR(cdns_phy->regs))
> +		return PTR_ERR(cdns_phy->regs);
> +
> +	phy =3D devm_phy_create(dev, node, &cdns_hdptx_dp_phy_ops);
> +	if (IS_ERR(phy))
> +		return PTR_ERR(phy);
> +
> +	phy->attrs.mode =3D PHY_MODE_DP;
> +	cdns_phy->phy =3D phy;
> +	phy_set_drvdata(phy, cdns_phy);
> +
> +	/* init base struct for access mhdp mailbox */
> +	cdns_phy->base.dev =3D cdns_phy->dev;
> +	cdns_phy->base.regs =3D cdns_phy->regs;
> +	cdns_phy->base.mbox_mutex =3D &cdns_phy->mbox_mutex;

How is this mutex supposed to work? From the name cdns_phy->base.mbox_mutex=
 is=20
supposed to protect the mailbox access in the cdns-mhdp base, right?
But this mutex is different, initialized separately and thus is independent=
=20
from mhdp->mbox_mutex in cdns-mhdp8501-core.c.

Best regards,
Alexander

> +
> +	ret =3D hdptx_dp_clk_enable(cdns_phy);
> +	if (ret) {
> +		dev_err(dev, "Init clk fail\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev,=20
of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		ret =3D PTR_ERR(phy_provider);
> +		goto clk_disable;
> +	}
> +
> +	return 0;
> +
> +clk_disable:
> +	hdptx_dp_clk_disable(cdns_phy);
> +
> +	return -EINVAL;
> +}
> +
> +static int cdns_hdptx_dp_phy_remove(struct platform_device *pdev)
> +{
> +	struct cdns_hdptx_dp_phy *cdns_phy =3D platform_get_drvdata(pdev);
> +
> +	hdptx_dp_clk_disable(cdns_phy);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cdns_hdptx_dp_phy_of_match[] =3D {
> +	{.compatible =3D "fsl,imx8mq-dp-phy" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cdns_hdptx_dp_phy_of_match);
> +
> +static struct platform_driver cdns_hdptx_dp_phy_driver =3D {
> +	.probe =3D cdns_hdptx_dp_phy_probe,
> +	.remove =3D cdns_hdptx_dp_phy_remove,
> +	.driver =3D {
> +		.name	=3D "cdns-hdptx-dp-phy",
> +		.of_match_table	=3D cdns_hdptx_dp_phy_of_match,
> +	}
> +};
> +module_platform_driver(cdns_hdptx_dp_phy_driver);
> +
> +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> +MODULE_DESCRIPTION("Cadence HDP-TX DisplayPort PHY driver");
> +MODULE_LICENSE("GPL");


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


