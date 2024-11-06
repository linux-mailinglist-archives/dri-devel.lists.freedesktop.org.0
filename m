Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C607E9BE27F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B19D10E245;
	Wed,  6 Nov 2024 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xbGvqpQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6151D10E245
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 09:29:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso55524445e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730885344; x=1731490144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v9BNFftP/9JbBjJulhRtmQU52iWjwQTyyHEQ0Y0WFwc=;
 b=xbGvqpQ1Hn1qZLn+taA5+6G4J0zM5V4JJYyKx2dfIvr92L2Dk1bBEbQ06+h/SGwPhe
 MK2rn3IWgS1Q4PHBiTNp7JjdmlDJ1h79fh7gLbDIOg+v0gpj/fv8zd7WgpxJqKZ/pOD5
 uqO9CK5dAKto108Ubr0H+Ctkrtu1dgv9jNrJFpKYmEompgrP1CewC99R+SAQJUGkSPBy
 ca/l7PWvLRPDK3FCTbDPLZ1ESj0V3xriraNnMsjYxFAnZwm/BZkKRp19p1v2PWOO15kJ
 5XC6W/2mtg4yo/7EHC4IwgNBPrplx2u27XCAGABQokDAZhT13yanRYZ32ZnQ8v7XJMuu
 EliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730885344; x=1731490144;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v9BNFftP/9JbBjJulhRtmQU52iWjwQTyyHEQ0Y0WFwc=;
 b=odQRhoQidQ/ySdzvwGRQ1Uf7yfFElZ5MJ0mU+CCypybwgmjCOUIEuN1WfvZ3EuUjaM
 aiiE9wvqMIkedTbSpXzz4gv1F3Wl5Z3NLZjUpasFv3/dD740eHmNLhYRG0CvhMT88PyQ
 2LabSihDJIs0L74fGnKdm4+EgDsro16WjUPuFSreRqZARyjlK5ihdPKO+ToyR55N2cwb
 r1cLXtuEzThBCgyCpv3chOucfYvaUpEb0eFplw3H5pxeCjOIryIXeaZjTPmGkccrqCyK
 zNnwIYOD7nK0B/+QQifPZx72Bg8EY0QzeWopwEsu9T4ygdqo03a5d8A1SNCN8fm+Ly21
 WxZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0CdKcanHVuJKNMIIr0Ak37CTQ89Mvrd2vp6E2cFqEYDi63hGS5KI4m2aj/wUSI31rWWK6oez0Uu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpEkmLGsCQ7eJN13pri969Nvlfkm3Wp+xVmvIuwlUP1bYj9fBi
 ht3W72DwMYW+S2IcjiyvVGeWdzQuUc9hIPmluPMb+YmjeHcSaBhNm90fFeijfJE=
X-Google-Smtp-Source: AGHT+IEOtokUoBRQI2XAFzJ+IWl2NWt7HNy3nKAcTrQJf1dBD9o/eGI2ZO2AB8CxjM4v2vqdj43Ytg==
X-Received: by 2002:a05:600c:3b91:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-4327b7ea7c6mr212963425e9.26.1730885343562; 
 Wed, 06 Nov 2024 01:29:03 -0800 (PST)
Received: from [127.0.0.1] ([89.101.134.25]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa737c86sm15752715e9.38.2024.11.06.01.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 01:29:03 -0800 (PST)
Date: Wed, 06 Nov 2024 09:29:01 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v18_6/8=5D_phy=3A_freescale=3A_Add_Di?=
 =?US-ASCII?Q?splayPort/HDMI_Combo-PHY_driver_for_i=2EMX8MQ?=
User-Agent: Thunderbird for Android
In-Reply-To: <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
Message-ID: <76D430C8-3DBB-4D89-9361-9B5D3EDCF067@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 5 November 2024 14:05:51 GMT, Sandor Yu <sandor=2Eyu@nxp=2Ecom> wrote:
>>=20
>> On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
>> > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i=2EMX8MQ=2E
>> >
>> > Cadence HDP-TX PHY could be put in either DP mode or
>> > HDMI mode base on the configuration chosen=2E
>> > DisplayPort or HDMI PHY mode is configured in the driver=2E
>> >
>> > Signed-off-by: Sandor Yu <Sandor=2Eyu@nxp=2Ecom>
>> > Signed-off-by: Alexander Stein <alexander=2Estein@ew=2Etq-group=2Ecom=
>
>> > ---
>> > v17->v18:
>> > - fix build error as code rebase to latest kernel version=2E
>> >
>> >  drivers/phy/freescale/Kconfig                |   10 +
>> >  drivers/phy/freescale/Makefile               |    1 +
>> >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx=2Ec | 1337
>> ++++++++++++++++++
>> >  3 files changed, 1348 insertions(+)
>> >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx=2Ec
>> >
>> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kc=
onfig
>> > index dcd9acff6d01a=2E=2E2b1210367b31c 100644
>> > --- a/drivers/phy/freescale/Kconfig
>> > +++ b/drivers/phy/freescale/Kconfig
>> > @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
>> >         Enable this to add support for the PCIE PHY as found on
>> >         i=2EMX8M family of SOCs=2E
>> >
>> > +config PHY_FSL_IMX8MQ_HDPTX
>> > +     tristate "Freescale i=2EMX8MQ DP/HDMI PHY support"
>> > +     depends on OF && HAS_IOMEM
>> > +     depends on COMMON_CLK
>> > +     select GENERIC_PHY
>> > +     select CDNS_MHDP_HELPER
>>=20
>> This can have problems with being satisfied on randconfig builds,
>> because CDNS_MHDP_HELPER is deep inside the DRM tree=2E
>
>Yes, it should be=2E Change it to "depend on CDNS_MHDP_HELPER" will elimi=
nate this problem=2E

No, depending on a non-user-selectable symbol is a bad idea=2E You should =
either depend/select all necessary symbols or, better in my opinion, move y=
our helpers out of the DRM tree=2E


>
>>=20
>> > +     help
>> > +       Enable this to support the Cadence HDPTX DP/HDMI PHY driver
>> > +       on i=2EMX8MQ SOC=2E
>> > +
>> >  config PHY_FSL_IMX8QM_HSIO
>> >       tristate "Freescale i=2EMX8QM HSIO PHY"
>> >       depends on OF && HAS_IOMEM
>> > diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/M=
akefile
>> > index 658eac7d0a622=2E=2Ea946b87905498 100644
>> > --- a/drivers/phy/freescale/Makefile
>> > +++ b/drivers/phy/freescale/Makefile
>> > @@ -1,4 +1,5 @@
>> >  # SPDX-License-Identifier: GPL-2=2E0-only
>> > +obj-$(CONFIG_PHY_FSL_IMX8MQ_HDPTX)   +=3D phy-fsl-imx8mq-hdptx=2Eo
>> >  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)     +=3D phy-fsl-imx8mq-usb=2Eo
>> >  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)     +=3D
>> phy-fsl-imx8qm-lvds-phy=2Eo
>> >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)    +=3D phy-fsl-imx8-mipi-dphy=2Eo
>> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdptx=2Ec
>> b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx=2Ec
>> > new file mode 100644
>> > index 0000000000000=2E=2E7aac39df0ab02
>> > --- /dev/null
>> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx=2Ec
>> > @@ -0,0 +1,1337 @@
>> > +// SPDX-License-Identifier: GPL-2=2E0-only
>> > +/*
>> > + * Cadence DP/HDMI PHY driver
>> > + *
>> > + * Copyright (C) 2022-2024 NXP Semiconductor, Inc=2E
>> > + */
>> > +#include <drm/bridge/cdns-mhdp-helper=2Eh>
>> > +#include <linux/clk=2Eh>
>> > +#include <linux/kernel=2Eh>
>> > +#include <linux/phy/phy=2Eh>
>> > +#include <linux/platform_device=2Eh>
>> > +#include <linux/io=2Eh>
>> > +#include <linux/unaligned=2Eh>
>> > +
>> > +#define ADDR_PHY_AFE 0x80000
>> > +
>> > +/* PHY registers */
>> > +#define CMN_SSM_BIAS_TMR                     0x0022
>> > +#define CMN_PLLSM0_PLLEN_TMR                 0x0029
>> > +#define CMN_PLLSM0_PLLPRE_TMR                        0x002a
>> > +#define CMN_PLLSM0_PLLVREF_TMR                       0x002b
>> > +#define CMN_PLLSM0_PLLLOCK_TMR                       0x002c
>> > +#define CMN_PLLSM0_USER_DEF_CTRL             0x002f
>> > +#define CMN_PSM_CLK_CTRL                     0x0061
>> > +#define CMN_CDIAG_REFCLK_CTRL                        0x0062
>> > +#define CMN_PLL0_VCOCAL_START                        0x0081
>> > +#define CMN_PLL0_VCOCAL_INIT_TMR             0x0084
>> > +#define CMN_PLL0_VCOCAL_ITER_TMR             0x0085
>> > +#define CMN_PLL0_INTDIV                              0x0094
>> > +#define CMN_PLL0_FRACDIV                     0x0095
>> > +#define CMN_PLL0_HIGH_THR                    0x0096
>> > +#define CMN_PLL0_DSM_DIAG                    0x0097
>> > +#define CMN_PLL0_SS_CTRL2                    0x0099
>> > +#define CMN_ICAL_INIT_TMR                    0x00c4
>> > +#define CMN_ICAL_ITER_TMR                    0x00c5
>> > +#define CMN_RXCAL_INIT_TMR                   0x00d4
>> > +#define CMN_RXCAL_ITER_TMR                   0x00d5
>> > +#define CMN_TXPUCAL_CTRL                     0x00e0
>> > +#define CMN_TXPUCAL_INIT_TMR                 0x00e4
>> > +#define CMN_TXPUCAL_ITER_TMR                 0x00e5
>> > +#define CMN_TXPDCAL_CTRL                     0x00f0
>> > +#define CMN_TXPDCAL_INIT_TMR                 0x00f4
>> > +#define CMN_TXPDCAL_ITER_TMR                 0x00f5
>> > +#define CMN_ICAL_ADJ_INIT_TMR                        0x0102
>> > +#define CMN_ICAL_ADJ_ITER_TMR                        0x0103
>> > +#define CMN_RX_ADJ_INIT_TMR                  0x0106
>> > +#define CMN_RX_ADJ_ITER_TMR                  0x0107
>> > +#define CMN_TXPU_ADJ_CTRL                    0x0108
>> > +#define CMN_TXPU_ADJ_INIT_TMR                        0x010a
>> > +#define CMN_TXPU_ADJ_ITER_TMR                        0x010b
>> > +#define CMN_TXPD_ADJ_CTRL                    0x010c
>> > +#define CMN_TXPD_ADJ_INIT_TMR                        0x010e
>> > +#define CMN_TXPD_ADJ_ITER_TMR                        0x010f
>> > +#define CMN_DIAG_PLL0_FBH_OVRD                       0x01c0
>> > +#define CMN_DIAG_PLL0_FBL_OVRD                       0x01c1
>> > +#define CMN_DIAG_PLL0_OVRD                   0x01c2
>> > +#define CMN_DIAG_PLL0_TEST_MODE                      0x01c4
>> > +#define CMN_DIAG_PLL0_V2I_TUNE                       0x01c5
>> > +#define CMN_DIAG_PLL0_CP_TUNE                        0x01c6
>> > +#define CMN_DIAG_PLL0_LF_PROG                        0x01c7
>> > +#define CMN_DIAG_PLL0_PTATIS_TUNE1           0x01c8
>> > +#define CMN_DIAG_PLL0_PTATIS_TUNE2           0x01c9
>> > +#define CMN_DIAG_PLL0_INCLK_CTRL             0x01ca
>> > +#define CMN_DIAG_PLL0_PXL_DIVH                       0x01cb
>> > +#define CMN_DIAG_PLL0_PXL_DIVL                       0x01cc
>> > +#define CMN_DIAG_HSCLK_SEL                   0x01e0
>> > +#define CMN_DIAG_PER_CAL_ADJ                 0x01ec
>> > +#define CMN_DIAG_CAL_CTRL                    0x01ed
>> > +#define CMN_DIAG_ACYA                                0x01ff
>> > +#define XCVR_PSM_RCTRL                               0x4001
>> > +#define XCVR_PSM_CAL_TMR                     0x4002
>> > +#define XCVR_PSM_A0IN_TMR                    0x4003
>> > +#define TX_TXCC_CAL_SCLR_MULT_0                      0x4047
>> > +#define TX_TXCC_CPOST_MULT_00_0                      0x404c
>> > +#define XCVR_DIAG_PLLDRC_CTRL                        0x40e0
>> > +#define XCVR_DIAG_HSCLK_SEL                  0x40e1
>> > +#define XCVR_DIAG_BIDI_CTRL                  0x40e8
>> > +#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR
>> 0x40f2
>> > +#define TX_PSC_A0                            0x4100
>> > +#define TX_PSC_A1                            0x4101
>> > +#define TX_PSC_A2                            0x4102
>> > +#define TX_PSC_A3                            0x4103
>> > +#define TX_RCVDET_EN_TMR                     0x4122
>> > +#define TX_RCVDET_ST_TMR                     0x4123
>> > +#define TX_DIAG_TX_CTRL                              0x41e0
>> > +#define TX_DIAG_TX_DRV                               0x41e1
>> > +#define TX_DIAG_BGREF_PREDRV_DELAY           0x41e7
>> > +#define TX_DIAG_ACYA_0                               0x41ff
>> > +#define TX_DIAG_ACYA_1                               0x43ff
>> > +#define TX_DIAG_ACYA_2                               0x45ff
>> > +#define TX_DIAG_ACYA_3                               0x47ff
>> > +#define TX_ANA_CTRL_REG_1                    0x5020
>> > +#define TX_ANA_CTRL_REG_2                    0x5021
>> > +#define TX_DIG_CTRL_REG_1                    0x5023
>> > +#define TX_DIG_CTRL_REG_2                    0x5024
>> > +#define TXDA_CYA_AUXDA_CYA                   0x5025
>> > +#define TX_ANA_CTRL_REG_3                    0x5026
>> > +#define TX_ANA_CTRL_REG_4                    0x5027
>> > +#define TX_ANA_CTRL_REG_5                    0x5029
>> > +#define RX_PSC_A0                            0x8000
>> > +#define RX_PSC_CAL                           0x8006
>> > +#define PHY_HDP_MODE_CTRL                    0xc008
>> > +#define PHY_HDP_CLK_CTL                              0xc009
>> > +#define PHY_ISO_CMN_CTRL                     0xc010
>> > +#define PHY_PMA_CMN_CTRL1                    0xc800
>> > +#define PHY_PMA_ISO_CMN_CTRL                 0xc810
>> > +#define PHY_PMA_ISO_PLL_CTRL1                        0xc812
>> > +#define PHY_PMA_ISOLATION_CTRL                       0xc81f
>> > +
>> > +/* PHY_HDP_CLK_CTL */
>> > +#define PLL_DATA_RATE_CLK_DIV_MASK           GENMASK(15, 8)
>> > +#define PLL_DATA_RATE_CLK_DIV_HBR            0x24
>> > +#define PLL_DATA_RATE_CLK_DIV_HBR2           0x12
>> > +#define PLL_CLK_EN_ACK                               BIT(3)
>> > +#define PLL_CLK_EN                           BIT(2)
>> > +#define PLL_READY                            BIT(1)
>> > +#define PLL_EN                                       BIT(0)
>> > +
>> > +/* PHY_PMA_CMN_CTRL1 */
>> > +#define CMA_REF_CLK_DIG_DIV_MASK             GENMASK(13, 12)
>> > +#define CMA_REF_CLK_SEL_MASK                 GENMASK(6, 4)
>> > +#define CMA_REF_CLK_RCV_EN_MASK                      BIT(3)
>> > +#define CMA_REF_CLK_RCV_EN                   1
>> > +#define CMN_READY                            BIT(0)
>> > +
>> > +/* PHY_PMA_ISO_PLL_CTRL1 */
>> > +#define CMN_PLL0_CLK_DATART_DIV_MASK         GENMASK(7, 0)
>> > +
>> > +/* TX_DIAG_TX_DRV */
>> > +#define TX_DRIVER_PROG_BOOST_ENABLE          BIT(10)
>> > +#define TX_DRIVER_PROG_BOOST_LEVEL_MASK
>> GENMASK(9, 8)
>> > +#define TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE        BIT(7)
>> > +#define TX_DRIVER_LDO_BANDGAP_REF_ENABLE     BIT(6)
>> > +
>> > +/* TX_TXCC_CAL_SCLR_MULT_0 */
>> > +#define SCALED_RESISTOR_CALIBRATION_CODE_ADD BIT(8)
>> > +#define RESISTOR_CAL_MULT_VAL_32_128         BIT(5)
>> > +
>> > +/* CMN_CDIAG_REFCLK_CTRL */
>> > +#define DIG_REF_CLK_DIV_SCALER_MASK          GENMASK(14, 12)
>> > +#define REFCLK_TERMINATION_EN_OVERRIDE_EN    BIT(7)
>> > +#define REFCLK_TERMINATION_EN_OVERRIDE               BIT(6)
>> > +
>> > +/* CMN_DIAG_HSCLK_SEL */
>> > +#define HSCLK1_SEL_MASK
>> GENMASK(5, 4)
>> > +#define HSCLK0_SEL_MASK
>> GENMASK(1, 0)
>> > +#define HSCLK_PLL0_DIV2                              1
>> > +
>> > +/* XCVR_DIAG_HSCLK_SEL */
>> > +#define HSCLK_SEL_MODE3_MASK                 GENMASK(13, 12)
>> > +#define HSCLK_SEL_MODE3_HSCLK1                       1
>> > +
>> > +/* CMN_PLL0_VCOCAL_START */
>> > +#define VCO_CALIB_CODE_START_POINT_VAL_MASK  GENMASK(8, 0)
>> > +
>> > +/* CMN_DIAG_PLL0_FBH_OVRD */
>> > +#define PLL_FEEDBACK_DIV_HI_OVERRIDE_EN              BIT(15)
>> > +
>> > +/* CMN_DIAG_PLL0_FBL_OVRD */
>> > +#define PLL_FEEDBACK_DIV_LO_OVERRIDE_EN              BIT(15)
>> > +
>> > +/* CMN_DIAG_PLL0_PXL_DIVH */
>> > +#define PLL_PCLK_DIV_EN                              BIT(15)
>> > +
>> > +/* XCVR_DIAG_PLLDRC_CTRL */
>> > +#define DPLL_CLK_SEL_MODE3                   BIT(14)
>> > +#define DPLL_DATA_RATE_DIV_MODE3_MASK
>> GENMASK(13, 12)
>> > +
>> > +/* TX_DIAG_TX_CTRL */
>> > +#define TX_IF_SUBRATE_MODE3_MASK             GENMASK(7, 6)
>> > +
>> > +/* PHY_HDP_MODE_CTRL */
>> > +#define POWER_STATE_A3_ACK                   BIT(7)
>> > +#define POWER_STATE_A2_ACK                   BIT(6)
>> > +#define POWER_STATE_A1_ACK                   BIT(5)
>> > +#define POWER_STATE_A0_ACK                   BIT(4)
>> > +#define POWER_STATE_A3                               BIT(3)
>> > +#define POWER_STATE_A2                               BIT(2)
>> > +#define POWER_STATE_A1                               BIT(1)
>> > +#define POWER_STATE_A0                               BIT(0)
>> > +
>> > +/* PHY_PMA_ISO_CMN_CTRL */
>> > +#define CMN_MACRO_PWR_EN_ACK                 BIT(5)
>> > +
>> > +#define KEEP_ALIVE           0x18
>> > +
>> > +#define REF_CLK_27MHZ                27000000
>> > +
>> > +/* HDMI TX clock control settings */
>> > +struct hdptx_hdmi_ctrl {
>> > +     u32 pixel_clk_freq_min;
>> > +     u32 pixel_clk_freq_max;
>> > +     u32 feedback_factor;
>> > +     u32 data_range_kbps_min;
>> > +     u32 data_range_kbps_max;
>> > +     u32 cmnda_pll0_ip_div;
>> > +     u32 cmn_ref_clk_dig_div;
>> > +     u32 ref_clk_divider_scaler;
>> > +     u32 pll_fb_div_total;
>> > +     u32 cmnda_pll0_fb_div_low;
>> > +     u32 cmnda_pll0_fb_div_high;
>> > +     u32 pixel_div_total;
>> > +     u32 cmnda_pll0_pxdiv_low;
>> > +     u32 cmnda_pll0_pxdiv_high;
>> > +     u32 vco_freq_min;
>> > +     u32 vco_freq_max;
>> > +     u32 vco_ring_select;
>> > +     u32 cmnda_hs_clk_0_sel;
>> > +     u32 cmnda_hs_clk_1_sel;
>> > +     u32 hsclk_div_at_xcvr;
>> > +     u32 hsclk_div_tx_sub_rate;
>> > +     u32 cmnda_pll0_hs_sym_div_sel;
>> > +     u32 cmnda_pll0_clk_freq_min;
>> > +     u32 cmnda_pll0_clk_freq_max;
>> > +};
>> > +
>> > +struct cdns_hdptx_phy {
>> > +     struct cdns_mhdp_base base;
>> > +
>> > +     void __iomem *regs;     /* DPTX registers base */
>> > +     struct device *dev;
>> > +     struct phy *phy;
>> > +     struct clk *ref_clk, *apb_clk;
>> > +     u32 ref_clk_rate;
>> > +     bool power_up;
>> > +     union {
>> > +             struct phy_configure_opts_hdmi hdmi;
>> > +             struct phy_configure_opts_dp dp;
>> > +     };
>> > +};
>> > +
>> > +/* HDMI TX clock control settings, pixel clock is output */
>> > +static const struct hdptx_hdmi_ctrl pixel_clk_output_ctrl_table[] =
=3D {
>> > +/*Minclk  Maxclk Fdbak  DR_min   DR_max  ip_d  dig  DS    Totl
>> */
>> > +{ 27000,  27000, 1000,  270000,  270000, 0x03, 0x1, 0x1,  240, 0x0bc=
,
>> 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x3,  27000,
>> 27000},
>> > +{ 27000,  27000, 1250,  337500,  337500, 0x03, 0x1, 0x1,  300, 0x0ec=
,
>> 0x03c, 100, 0x030, 0x030, 2700000, 2700000, 0, 2, 2, 2, 4, 0x3,  33750,
>> 33750},
>> > +{ 27000,  27000, 1500,  405000,  405000, 0x03, 0x1, 0x1,  360, 0x11c=
,
>> 0x048, 120, 0x03a, 0x03a, 3240000, 3240000, 0, 2, 2, 2, 4, 0x3,  40500,
>> 40500},
>> > +{ 27000,  27000, 2000,  540000,  540000, 0x03, 0x1, 0x1,  240, 0x0bc=
,
>> 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x2,  54000,
>> 54000},
>> > +{ 54000,  54000, 1000,  540000,  540000, 0x03, 0x1, 0x1,  480, 0x17c=
,
>> 0x060,  80, 0x026, 0x026, 4320000, 4320000, 1, 2, 2, 2, 4, 0x3,  54000,
>> 54000},
>> > +{ 54000,  54000, 1250,  675000,  675000, 0x04, 0x1, 0x1,  400, 0x13c=
,
>> 0x050,  50, 0x017, 0x017, 2700000, 2700000, 0, 1, 1, 2, 4, 0x2,  67500,
>> 67500},
>> > +{ 54000,  54000, 1500,  810000,  810000, 0x04, 0x1, 0x1,  480, 0x17c=
,
>> 0x060,  60, 0x01c, 0x01c, 3240000, 3240000, 0, 2, 2, 2, 2, 0x2,  81000,
>> 81000},
>> > +{ 54000,  54000, 2000, 1080000, 1080000, 0x03, 0x1, 0x1,  240, 0x0bc=
,
>> 0x030,  40, 0x012, 0x012, 2160000, 2160000, 0, 2, 2, 2, 1, 0x1, 108000,
>> 108000},
>> > +{ 74250,  74250, 1000,  742500,  742500, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  80, 0x026, 0x026, 5940000, 5940000, 1, 2, 2, 2, 4, 0x3,  74250,
>> 74250},
>> > +{ 74250,  74250, 1250,  928125,  928125, 0x04, 0x1, 0x1,  550, 0x1b4=
,
>> 0x06e,  50, 0x017, 0x017, 3712500, 3712500, 1, 1, 1, 2, 4, 0x2,  92812,
>> 92812},
>> > +{ 74250,  74250, 1500, 1113750, 1113750, 0x04, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  60, 0x01c, 0x01c, 4455000, 4455000, 1, 2, 2, 2, 2, 0x2, 111375,
>> 111375},
>> > +{ 74250,  74250, 2000, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104=
,
>> 0x042,  40, 0x012, 0x012, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500,
>> 148500},
>> > +{ 99000,  99000, 1000,  990000,  990000, 0x03, 0x1, 0x1,  440, 0x15c=
,
>> 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 2, 0x2,  99000,
>> 99000},
>> > +{ 99000,  99000, 1250, 1237500, 1237500, 0x03, 0x1, 0x1,  275, 0x0d8=
,
>> 0x037,  25, 0x00b, 0x00a, 2475000, 2475000, 0, 1, 1, 2, 2, 0x1, 123750,
>> 123750},
>> > +{ 99000,  99000, 1500, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104=
,
>> 0x042,  30, 0x00d, 0x00d, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500,
>> 148500},
>> > +{ 99000,  99000, 2000, 1980000, 1980000, 0x03, 0x1, 0x1,  440, 0x15c=
,
>> 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 1, 0x1, 198000,
>> 198000},
>> > +{148500, 148500, 1000, 1485000, 1485000, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 2, 0x2, 148500,
>> 148500},
>> > +{148500, 148500, 1250, 1856250, 1856250, 0x04, 0x1, 0x1,  550, 0x1b4=
,
>> 0x06e,  25, 0x00b, 0x00a, 3712500, 3712500, 1, 1, 1, 2, 2, 0x1, 185625,
>> 185625},
>> > +{148500, 148500, 1500, 2227500, 2227500, 0x03, 0x1, 0x1,  495, 0x188=
,
>> 0x063,  30, 0x00d, 0x00d, 4455000, 4455000, 1, 1, 1, 2, 2, 0x1, 222750,
>> 222750},
>> > +{148500, 148500, 2000, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 1, 0x1, 297000,
>> 297000},
>> > +{198000, 198000, 1000, 1980000, 1980000, 0x03, 0x1, 0x1,  220, 0x0ac=
,
>> 0x02c,  10, 0x003, 0x003, 1980000, 1980000, 0, 1, 1, 2, 1, 0x0, 198000,
>> 198000},
>> > +{198000, 198000, 1250, 2475000, 2475000, 0x03, 0x1, 0x1,  550, 0x1b4=
,
>> 0x06e,  25, 0x00b, 0x00a, 4950000, 4950000, 1, 1, 1, 2, 2, 0x1, 247500,
>> 247500},
>> > +{198000, 198000, 1500, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104=
,
>> 0x042,  15, 0x006, 0x005, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000,
>> 297000},
>> > +{198000, 198000, 2000, 3960000, 3960000, 0x03, 0x1, 0x1,  440, 0x15c=
,
>> 0x058,  20, 0x008, 0x008, 3960000, 3960000, 1, 1, 1, 2, 1, 0x0, 396000,
>> 396000},
>> > +{297000, 297000, 1000, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104=
,
>> 0x042,  10, 0x003, 0x003, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000,
>> 297000},
>> > +{297000, 297000, 1500, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188=
,
>> 0x063,  15, 0x006, 0x005, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500,
>> 445500},
>> > +{297000, 297000, 2000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  20, 0x008, 0x008, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000,
>> 594000},
>> > +{594000, 594000, 1000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000,
>> 594000},
>> > +{594000, 594000,  750, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188=
,
>> 0x063,  10, 0x003, 0x003, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500,
>> 445500},
>> > +{594000, 594000,  625, 3712500, 3712500, 0x04, 0x1, 0x1,  550, 0x1b4=
,
>> 0x06e,  10, 0x003, 0x003, 3712500, 3712500, 1, 1, 1, 2, 1, 0x0, 371250,
>> 371250},
>> > +{594000, 594000,  500, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c=
,
>> 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 2, 0x1, 297000,
>> 297000},
>>=20
>> Is there a chance that this table or a part of it can be simplified or
>> calculated at runtime? For example, I think in all the cases minclk =3D
>> maxclk and DR_min =3D DR_max, dig and DS are always 0x1, etc=2E
>
>The calculation method used to generate this table is not publicly disclo=
sed by the vendor=2E

I just pointed out how to simplify the table=2E If the exact method is not=
 known, please apply some common sense to reduce duplication=2E

>
>This PHY operates in two modes: one where the pixel clock is generated in=
ternally by the PHY,=20
>and another where the pixel clock is input externally=2E=20
>The table above shows the configuration where the pixel clock is generate=
d internally,=20
>It is the PHY work mode for i=2EMX8MQ HDMI PHY=2E=20
>When the pixel clock is input externally, the values for minclk, maxclk, =
DR_min, DR_max, dig, and DS are different=2E=20
>This operating mode is used in other SOCs=2E

Make use of it when there is a need for that=2E You might have different t=
ables or platform-specific code instead=2E


>
>>=20
>> > +};
>> > +
>> > +/* HDMI TX PLL tuning settings */
>> > +struct hdptx_hdmi_pll_tuning {
>> > +     u32 vco_freq_bin;
>> > +     u32 vco_freq_min;
>> > +     u32 vco_freq_max;
>> > +     u32 volt_to_current_coarse;
>> > +     u32 volt_to_current;
>> > +     u32 ndac_ctrl;
>> > +     u32 pmos_ctrl;
>> > +     u32 ptat_ndac_ctrl;
>> > +     u32 feedback_div_total;
>> > +     u32 charge_pump_gain;
>> > +     u32 coarse_code;
>> > +     u32 v2i_code;
>> > +     u32 vco_cal_code;
>> > +};
>> > +
>> > +/* HDMI TX PLL tuning settings, pixel clock is output */
>> > +static const struct hdptx_hdmi_pll_tuning pixel_clk_output_pll_table=
[] =3D {
>> > +/*bin VCO_freq min/max  coar  cod NDAC  PMOS PTAT div-T P-Gain
>> Coa V2I CAL */
>> > +{  1, 1980000, 1980000, 0x4, 0x3, 0x0, 0x09, 0x09, 220, 0x42, 160, 5=
,
>> 183 },
>> > +{  2, 2160000, 2160000, 0x4, 0x3, 0x0, 0x09, 0x09, 240, 0x42, 166, 6=
,
>> 208 },
>> > +{  3, 2475000, 2475000, 0x5, 0x3, 0x1, 0x00, 0x07, 275, 0x42, 167, 6=
,
>> 209 },
>> > +{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 300, 0x42, 188, 6=
,
>> 230 },
>> > +{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 400, 0x4c, 188, 6=
,
>> 230 },
>> > +{  5, 2970000, 2970000, 0x6, 0x3, 0x1, 0x00, 0x07, 330, 0x42, 183, 6=
,
>> 225 },
>> > +{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 360, 0x42, 203, 7=
,
>> 256 },
>> > +{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 480, 0x4c, 203, 7=
,
>> 256 },
>> > +{  7, 3712500, 3712500, 0x4, 0x3, 0x0, 0x07, 0x0F, 550, 0x4c, 212, 7=
, 257 },
>> > +{  8, 3960000, 3960000, 0x5, 0x3, 0x0, 0x07, 0x0F, 440, 0x42, 184, 6=
, 226 },
>> > +{  9, 4320000, 4320000, 0x5, 0x3, 0x1, 0x07, 0x0F, 480, 0x42, 205, 7=
, 258 },
>> > +{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 495, 0x42, 219, 7=
, 272 },
>> > +{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 660, 0x4c, 219, 7=
, 272 },
>> > +{ 11, 4950000, 4950000, 0x6, 0x3, 0x1, 0x00, 0x07, 550, 0x42, 213, 7=
, 258 },
>> > +{ 12, 5940000, 5940000, 0x7, 0x3, 0x1, 0x00, 0x07, 660, 0x42, 244, 8=
, 292 },
>> > +};
>> > +
>> > +enum dp_link_rate {
>> > +     RATE_1_6 =3D 162000,
>> > +     RATE_2_1 =3D 216000,
>> > +     RATE_2_4 =3D 243000,
>> > +     RATE_2_7 =3D 270000,
>> > +     RATE_3_2 =3D 324000,
>> > +     RATE_4_3 =3D 432000,
>> > +     RATE_5_4 =3D 540000,
>> > +};
>> > +
>> > +#define MAX_LINK_RATE RATE_5_4
>> > +
>> > +struct phy_pll_reg {
>> > +     u16 val[7];
>> > +     u32 addr;
>> > +};
>> > +
>> > +static const struct phy_pll_reg phy_pll_27m_cfg[] =3D {
>> > +     /*  1=2E62    2=2E16    2=2E43    2=2E7     3=2E24    4=2E32   =
 5=2E4
>> register address */
>> > +     {{ 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e },
>> CMN_PLL0_VCOCAL_INIT_TMR },
>> > +     {{ 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b },
>> CMN_PLL0_VCOCAL_ITER_TMR },
>> > +     {{ 0x30b9, 0x3087, 0x3096, 0x30b4, 0x30b9, 0x3087, 0x30b4 },
>> CMN_PLL0_VCOCAL_START },
>> > +     {{ 0x0077, 0x009f, 0x00b3, 0x00c7, 0x0077, 0x009f, 0x00c7 },
>> CMN_PLL0_INTDIV },
>> > +     {{ 0xf9da, 0xf7cd, 0xf6c7, 0xf5c1, 0xf9da, 0xf7cd, 0xf5c1 },
>> CMN_PLL0_FRACDIV },
>> > +     {{ 0x001e, 0x0028, 0x002d, 0x0032, 0x001e, 0x0028, 0x0032 },
>> CMN_PLL0_HIGH_THR },
>> > +     {{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 },
>> CMN_PLL0_DSM_DIAG },
>> > +     {{ 0x0000, 0x1000, 0x1000, 0x1000, 0x0000, 0x1000, 0x1000 },
>> CMN_PLLSM0_USER_DEF_CTRL },
>> > +     {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
>> CMN_DIAG_PLL0_OVRD },
>> > +     {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
>> CMN_DIAG_PLL0_FBH_OVRD },
>> > +     {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
>> CMN_DIAG_PLL0_FBL_OVRD },
>> > +     {{ 0x0006, 0x0007, 0x0007, 0x0007, 0x0006, 0x0007, 0x0007 },
>> CMN_DIAG_PLL0_V2I_TUNE },
>> > +     {{ 0x0043, 0x0043, 0x0043, 0x0042, 0x0043, 0x0043, 0x0042 },
>> CMN_DIAG_PLL0_CP_TUNE },
>> > +     {{ 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008 },
>> CMN_DIAG_PLL0_LF_PROG },
>> > +     {{ 0x0100, 0x0001, 0x0001, 0x0001, 0x0100, 0x0001, 0x0001 },
>> CMN_DIAG_PLL0_PTATIS_TUNE1 },
>> > +     {{ 0x0007, 0x0001, 0x0001, 0x0001, 0x0007, 0x0001, 0x0001 },
>> CMN_DIAG_PLL0_PTATIS_TUNE2 },
>> > +     {{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 },
>> CMN_DIAG_PLL0_TEST_MODE},
>> > +     {{ 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016 },
>> CMN_PSM_CLK_CTRL }
>> > +};
>> > +
>> > +static int dp_link_rate_index(u32 rate)
>> > +{
>> > +     switch (rate) {
>> > +     case RATE_1_6:
>> > +             return 0;
>> > +     case RATE_2_1:
>> > +             return 1;
>> > +     case RATE_2_4:
>> > +             return 2;
>> > +     case RATE_2_7:
>> > +             return 3;
>> > +     case RATE_3_2:
>> > +             return 4;
>> > +     case RATE_4_3:
>> > +             return 5;
>> > +     case RATE_5_4:
>>=20
>> If this is the only usage, please drop the enum=2E
>
>OK=2E
>
>>=20
>> > +     default:
>> > +             return 6;
>>=20
>> default should be -EINVAL
>>=20
>
>OK=2E
>
>>=20
>> > +     }
>> > +}
>> > +
>> > +static int cdns_phy_reg_write(struct cdns_hdptx_phy *cdns_phy, u32 a=
ddr,
>> u32 val)
>> > +{
>> > +     return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE +
>> (addr << 2), val);
>> > +}
>> > +
>> > +static u32 cdns_phy_reg_read(struct cdns_hdptx_phy *cdns_phy, u32
>> addr)
>> > +{
>> > +     u32 reg32;
>> > +
>> > +     cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr <<
>> 2), &reg32);
>> > +
>> > +     return reg32;
>> > +}
>> > +
>> > +static void hdptx_dp_aux_cfg(struct cdns_hdptx_phy *cdns_phy)
>> > +{
>> > +     /* Power up Aux */
>> > +     cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 1);
>> > +
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_1, 0x3);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, 36);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa018);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa098);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa198);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
>> > +     ndelay(150);
>> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
>> > +}
>> > +
>> > +/* PMA common configuration for 27MHz */
>> > +static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_phy
>> *cdns_phy)
>> > +{
>> > +     u32 num_lanes =3D cdns_phy->dp=2Elanes;
>> > +     u16 val;
>> > +     int k;
>> > +
>> > +     /* Enable PMA input ref clk(CMN_REF_CLK_RCV_EN) */
>> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
>> > +     val &=3D ~CMA_REF_CLK_RCV_EN_MASK;
>> > +     val |=3D FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK,
>> CMA_REF_CLK_RCV_EN);
>> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
>> > +
>> > +     /* Startup state machine registers */
>> > +     cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR,
>> 0x001b);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR,
>> 0x0036);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR,
>> 0x001b);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR,
>> 0x006c);
>> > +
>> > +     /* Current calibration registers */
>> > +     cdns_phy_reg_write(cdns_phy, CMN_ICAL_INIT_TMR, 0x0044);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_ICAL_ITER_TMR, 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_INIT_TMR,
>> 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_ITER_TMR,
>> 0x0006);
>> > +
>> > +     /* Resistor calibration registers */
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_INIT_TMR, 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_ITER_TMR,
>> 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_INIT_TMR,
>> 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_ITER_TMR,
>> 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_INIT_TMR, 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_ITER_TMR,
>> 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_INIT_TMR,
>> 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_ITER_TMR,
>> 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_RXCAL_INIT_TMR, 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_RXCAL_ITER_TMR, 0x0006);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_INIT_TMR, 0x0022);
>> > +     cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_ITER_TMR, 0x0006);
>> > +
>> > +     for (k =3D 0; k < num_lanes; k =3D k + 1) {
>> > +             /* Power state machine registers */
>> > +             cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  |
>> (k << 9), 0x016d);
>> > +             cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR |
>> (k << 9), 0x016d);
>> > +             /* Transceiver control and diagnostic registers */
>> > +             cdns_phy_reg_write(cdns_phy,
>> XCVR_DIAG_LANE_FCM_EN_MGN_TMR | (k << 9), 0x00a2);
>> > +             cdns_phy_reg_write(cdns_phy,
>> TX_DIAG_BGREF_PREDRV_DELAY | (k << 9), 0x0097);
>> > +             /* Transmitter receiver detect registers */
>> > +             cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k
>> << 9), 0x0a8c);
>> > +             cdns_phy_reg_write(cdns_phy, TX_RCVDET_ST_TMR | (k
>> << 9), 0x0036);
>> > +     }
>> > +
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
>> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
>> > +}
>> > +
>> > +static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_phy
>> *cdns_phy)
>> > +{
>> > +     u32 num_lanes =3D cdns_phy->dp=2Elanes;
>> > +     u32 link_rate =3D cdns_phy->dp=2Elink_rate;
>> > +     u16 val;
>> > +     int index, i, k;
>> > +
>> > +     /* DP PLL data rate 0/1 clock divider value */
>> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
>> > +     val &=3D ~PLL_DATA_RATE_CLK_DIV_MASK;
>> > +     if (link_rate <=3D RATE_2_7)
>> > +             val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
>> > +                               PLL_DATA_RATE_CLK_DIV_HBR);
>> > +     else
>> > +             val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
>> > +                               PLL_DATA_RATE_CLK_DIV_HBR2);
>> > +     cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
>> > +
>> > +     /* High speed clock 0/1 div */
>> > +     val =3D cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
>> > +     val &=3D ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
>> > +     if (link_rate <=3D RATE_2_7) {
>> > +             val |=3D FIELD_PREP(HSCLK1_SEL_MASK,
>> HSCLK_PLL0_DIV2);
>> > +             val |=3D FIELD_PREP(HSCLK0_SEL_MASK,
>> HSCLK_PLL0_DIV2);
>> > +     }
>> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
>> > +
>> > +     for (k =3D 0; k < num_lanes; k++) {
>> > +             val =3D cdns_phy_reg_read(cdns_phy,
>> (XCVR_DIAG_HSCLK_SEL | (k << 9)));
>> > +             val &=3D ~HSCLK_SEL_MODE3_MASK;
>> > +             if (link_rate <=3D RATE_2_7)
>> > +                     val |=3D FIELD_PREP(HSCLK_SEL_MODE3_MASK,
>> HSCLK_SEL_MODE3_HSCLK1);
>> > +             cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL |
>> (k << 9)), val);
>> > +     }
>> > +
>> > +     /* DP PHY PLL 27MHz configuration */
>> > +     index =3D dp_link_rate_index(link_rate);
>> > +     for (i =3D 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
>> > +             cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i]=2Eaddr,
>> > +                                phy_pll_27m_cfg[i]=2Eval[index]);
>> > +
>> > +     /* Transceiver control and diagnostic registers */
>> > +     for (k =3D 0; k < num_lanes; k++) {
>> > +             val =3D cdns_phy_reg_read(cdns_phy,
>> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
>> > +             val &=3D ~(DPLL_DATA_RATE_DIV_MODE3_MASK |
>> DPLL_CLK_SEL_MODE3);
>> > +             if (link_rate <=3D RATE_2_7)
>> > +                     val |=3D
>> FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 2);
>> > +             else
>> > +                     val |=3D
>> FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 1);
>> > +             cdns_phy_reg_write(cdns_phy,
>> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
>> > +     }
>> > +
>> > +     for (k =3D 0; k < num_lanes; k =3D k + 1) {
>> > +
