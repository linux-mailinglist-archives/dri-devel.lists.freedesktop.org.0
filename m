Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E80232C5D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04A86E874;
	Thu, 30 Jul 2020 07:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC466E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 12:31:44 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s189so17050229iod.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=qc8Tu7+JCUkDgJVcNGOcmmnQo+zmizuHNF5jC9TsFoY=;
 b=Bms8xG/1je4UVIYqt1PfjmTiK4oF2a7PUPNjK5POMLLbILPBgVRL0NE5/S6VIBIjA3
 FQ8J4nqQRMMy9oMwCseOc8QiVvxtd54/chN/uOYTvKGfo1LzBXErALp6MGUaQtXtaV/E
 lg6wWtgIp2NDTunWWvooQBJ/IUUxNrHR/OEg0N/7H0zMEK91nwO/7ZNIKU1hdomRs29t
 u0BWDP9EIjEYthluAufUN720nwx9CCcte63vJ3aF8w0jlNHKz4FpLQ6yeQPG05vylU1i
 21UKpeCKwKqeQHoqg5VDxicNd9nqnHDGhG3Ir8Gh2isXRJwDUerxCiklo2hm/B44vFah
 AkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=qc8Tu7+JCUkDgJVcNGOcmmnQo+zmizuHNF5jC9TsFoY=;
 b=nIVpEshurdQeJMqwAOCtN0Yg9gs1p3ZfrEfCekfPvNn8jGK0KMFifcznsRrhwhky9a
 ZSKUKkKTm7il6dXSBnEk8WFWNlvLza9CuMNR4OLJgRgs93RWGmjLxQPNd6ikjy1FUWMT
 Hm3SGl3V+E4pdDaUBh0ErgxlhLJGWhXkJVVAizSrBrWVR1mCRlYDS95aPeK3u4hm3hhU
 peWpsiZDqBYsTmRM3tJcjKzyXbO4bhYlFfJx8ITOTTKlEQ7FxxZZPlzyk+hcq9jHu7hk
 BeNSdcjXXrVLAMX4fRYq/kntGZOdPrKW1ZvRIyvAPSjwZbAWdDP+gKHZIOxEJmFxpW0H
 xFag==
X-Gm-Message-State: AOAM531V8YFQHRp2kDcq4cXfeVWx9Fefl/T9ba5ovrWMUTMJBmN3Vg/U
 z9wuCY6hYAo0JSpLCm19+9hRzzbEVckILE/O1GI=
X-Received: by 2002:a6b:8e8c:: with SMTP id
 q134mt24619077iod.147.1596025903825; 
 Wed, 29 Jul 2020 05:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594388491-15129-1-git-send-email-simhavcs@gmail.com>
 <1594388491-15129-2-git-send-email-simhavcs@gmail.com>
In-Reply-To: <1594388491-15129-2-git-send-email-simhavcs@gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Wed, 29 Jul 2020 18:01:31 +0530
Message-ID: <CAGWqDJ4P9dKzGngkiEtL_X1HRjjtU17WqNFM-qiv16tXwQNZTg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1417827222=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1417827222==
Content-Type: multipart/alternative; boundary="0000000000000f116605ab93bdea"

--0000000000000f116605ab93bdea
Content-Type: text/plain; charset="UTF-8"

Hi All,

Please Review the patch

On Fri, Jul 10, 2020 at 7:11 PM Vinay Simha BN <simhavcs@gmail.com> wrote:

> This driver is tested with two panels individually with Apq8016-IFC6309
> board
>
> https://www.inforcecomputing.com/products/single-board-computers-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc
>
> 1. 1366x768@60 auo,b101xtn01 data-mapping = "jeida-24"
> 2. 800x480@60 innolux,at070tn92 data-mapping = "vesa-24"
>
> - power off sequence in proper order
> - put_unaligned_be16, put_unaligned_le32 macros used
> - static function for mode_valid
> - len initialized
> - MODE_CLOCK_HIGH handled properly
> - bus_formats handeld in mode_valid
> - GENMASK and FIELD_PREP used
> - Kconfig proper indentation
> - error handling enpoint data-lanes
> - check for bus_formats unsupported
> - display_timings naming local variables
> - help modified
> - ~vsdelay dynamic value set based on the
>   calculation of dsi speed, output speed, blanking
> - panel->connector_type removed
> - dual port implemented
> - devm_drm_panel_bridge_add method used instead of panel
>   description modified
> - regulator enable and disable with proper orders and delays
>   as per the spec
> - removed drm_connector_status
> - added bus_formats
> - mdelay to usleep_range
> - magic number to macros for CLRSI and mux registers
>   description modified
> - replaced u32 instead of uint32_t
> - updated alphabetic order of headers
> - added SPDX identifier license
>
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>
> ---
> v1:
>  Initial version
>
> v2:
> * Andrzej Hajda review comments incorporated
>   SPDX identifier
>   development debug removed
>   alphabetic order headers
>   u32 instead of unit32_t
>   magic numbers to macros for CLRSI and mux registers
>   ignored return value
>
> * Laurent Pinchart review comments incorporated
>   mdelay to usleep_range
>   bus_formats added
>
> v3:
> * Andrzej Hajda review comments incorporated
>   drm_connector_status removed
>   u32 rev removed and local variabl is used
>   regulator enable disable with proper orders and delays
>   as per the spec
>   devm_drm_panel_bridge_add method used instead of panel
>   description modified
>   dual port implemented
>
> v4:
> * Sam Ravnborg review comments incorporated
>   panel->connector_type removed
>
> * Reported-by: kernel test robot <lkp@intel.com>
>   parse_dt to static function
>   removed the if (endpoint), since data-lanes has to be
>   present for dsi dts ports
>
> v5:
>   ~vsdelay dynamic value set based on the
>   calculation of dsi speed, output speed, blanking
>
> v6:
> * Sam Ravnborg review comments incorporated
>   help modified
>   display_timings naming local variables
>   check for bus_formats unsupported
>   error handling enpoint data-lanes
>
> v7:
> * Sam Ravnborg review comments incorporated
>   Kconfig proper indentation
>   GENMASK and FIELD_PREP used
>   bus_formats handeld in mode_valid
>   MODE_CLOCK_HIGH handled properly
>
> * Reported-by: kernel test robot <lkp@intel.com>
>   len initialized
>   static function for mode_valid
>
> v8:
> * Andrzej Hajda review comments incorporated
>   power off sequence in proper order
>   put_unaligned_be16, put_unaligned_le32 macros used
> * change log modified in reverse chronological order
> ---
>  drivers/gpu/drm/bridge/Kconfig    |  10 +
>  drivers/gpu/drm/bridge/Makefile   |   1 +
>  drivers/gpu/drm/bridge/tc358775.c | 749
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 760 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/tc358775.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig
> b/drivers/gpu/drm/bridge/Kconfig
> index 43271c2..25c3097 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -181,6 +181,16 @@ config DRM_TOSHIBA_TC358768
>         help
>           Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
>
> +config DRM_TOSHIBA_TC358775
> +       tristate "Toshiba TC358775 DSI/LVDS bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       select REGMAP_I2C
> +       select DRM_PANEL
> +       select DRM_MIPI_DSI
> +       help
> +         Toshiba TC358775 DSI/LVDS bridge chip driver.
> +
>  config DRM_TI_TFP410
>         tristate "TI TFP410 DVI/HDMI bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile
> b/drivers/gpu/drm/bridge/Makefile
> index d63d4b7..23c770b 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
> +obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> new file mode 100644
> index 0000000..7da15cd
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -0,0 +1,749 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TC358775 DSI to LVDS bridge driver
> + *
> + * Copyright (C) 2020 SMART Wireless Computing
> + * Author: Vinay Simha BN <simhavcs@gmail.com>
> + *
> + */
> +/* #define DEBUG */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#include <asm/unaligned.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_dp_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)
> +
> +/* Registers */
> +
> +/* DSI D-PHY Layer Registers */
> +#define D0W_DPHYCONTTX  0x0004  /* Data Lane 0 DPHY Tx Control */
> +#define CLW_DPHYCONTRX  0x0020  /* Clock Lane DPHY Rx Control */
> +#define D0W_DPHYCONTRX  0x0024  /* Data Lane 0 DPHY Rx Control */
> +#define D1W_DPHYCONTRX  0x0028  /* Data Lane 1 DPHY Rx Control */
> +#define D2W_DPHYCONTRX  0x002C  /* Data Lane 2 DPHY Rx Control */
> +#define D3W_DPHYCONTRX  0x0030  /* Data Lane 3 DPHY Rx Control */
> +#define COM_DPHYCONTRX  0x0038  /* DPHY Rx Common Control */
> +#define CLW_CNTRL       0x0040  /* Clock Lane Control */
> +#define D0W_CNTRL       0x0044  /* Data Lane 0 Control */
> +#define D1W_CNTRL       0x0048  /* Data Lane 1 Control */
> +#define D2W_CNTRL       0x004C  /* Data Lane 2 Control */
> +#define D3W_CNTRL       0x0050  /* Data Lane 3 Control */
> +#define DFTMODE_CNTRL   0x0054  /* DFT Mode Control */
> +
> +/* DSI PPI Layer Registers */
> +#define PPI_STARTPPI    0x0104  /* START control bit of PPI-TX function.
> */
> +#define PPI_START_FUNCTION      1
> +
> +#define PPI_BUSYPPI     0x0108
> +#define PPI_LINEINITCNT 0x0110  /* Line Initialization Wait Counter  */
> +#define PPI_LPTXTIMECNT 0x0114
> +#define PPI_LANEENABLE  0x0134  /* Enables each lane at the PPI layer. */
> +#define PPI_TX_RX_TA    0x013C  /* DSI Bus Turn Around timing parameters
> */
> +
> +/* Analog timer function enable */
> +#define PPI_CLS_ATMR    0x0140  /* Delay for Clock Lane in LPRX  */
> +#define PPI_D0S_ATMR    0x0144  /* Delay for Data Lane 0 in LPRX */
> +#define PPI_D1S_ATMR    0x0148  /* Delay for Data Lane 1 in LPRX */
> +#define PPI_D2S_ATMR    0x014C  /* Delay for Data Lane 2 in LPRX */
> +#define PPI_D3S_ATMR    0x0150  /* Delay for Data Lane 3 in LPRX */
> +
> +#define PPI_D0S_CLRSIPOCOUNT    0x0164  /* For lane 0 */
> +#define PPI_D1S_CLRSIPOCOUNT    0x0168  /* For lane 1 */
> +#define PPI_D2S_CLRSIPOCOUNT    0x016C  /* For lane 2 */
> +#define PPI_D3S_CLRSIPOCOUNT    0x0170  /* For lane 3 */
> +
> +#define CLS_PRE         0x0180  /* Digital Counter inside of PHY IO */
> +#define D0S_PRE         0x0184  /* Digital Counter inside of PHY IO */
> +#define D1S_PRE         0x0188  /* Digital Counter inside of PHY IO */
> +#define D2S_PRE         0x018C  /* Digital Counter inside of PHY IO */
> +#define D3S_PRE         0x0190  /* Digital Counter inside of PHY IO */
> +#define CLS_PREP        0x01A0  /* Digital Counter inside of PHY IO */
> +#define D0S_PREP        0x01A4  /* Digital Counter inside of PHY IO */
> +#define D1S_PREP        0x01A8  /* Digital Counter inside of PHY IO */
> +#define D2S_PREP        0x01AC  /* Digital Counter inside of PHY IO */
> +#define D3S_PREP        0x01B0  /* Digital Counter inside of PHY IO */
> +#define CLS_ZERO        0x01C0  /* Digital Counter inside of PHY IO */
> +#define D0S_ZERO        0x01C4  /* Digital Counter inside of PHY IO */
> +#define D1S_ZERO        0x01C8  /* Digital Counter inside of PHY IO */
> +#define D2S_ZERO        0x01CC  /* Digital Counter inside of PHY IO */
> +#define D3S_ZERO        0x01D0  /* Digital Counter inside of PHY IO */
> +
> +#define PPI_CLRFLG      0x01E0  /* PRE Counters has reached set values */
> +#define PPI_CLRSIPO     0x01E4  /* Clear SIPO values, Slave mode use
> only. */
> +#define HSTIMEOUT       0x01F0  /* HS Rx Time Out Counter */
> +#define HSTIMEOUTENABLE 0x01F4  /* Enable HS Rx Time Out Counter */
> +#define DSI_STARTDSI    0x0204  /* START control bit of DSI-TX function */
> +#define DSI_RX_START   1
> +
> +#define DSI_BUSYDSI     0x0208
> +#define DSI_LANEENABLE  0x0210  /* Enables each lane at the Protocol
> layer. */
> +#define DSI_LANESTATUS0 0x0214  /* Displays lane is in HS RX mode. */
> +#define DSI_LANESTATUS1 0x0218  /* Displays lane is in ULPS or STOP state
> */
> +
> +#define DSI_INTSTATUS   0x0220  /* Interrupt Status */
> +#define DSI_INTMASK     0x0224  /* Interrupt Mask */
> +#define DSI_INTCLR      0x0228  /* Interrupt Clear */
> +#define DSI_LPTXTO      0x0230  /* Low Power Tx Time Out Counter */
> +
> +#define DSIERRCNT       0x0300  /* DSI Error Count */
> +#define APLCTRL         0x0400  /* Application Layer Control */
> +#define RDPKTLN         0x0404  /* Command Read Packet Length */
> +
> +#define VPCTRL          0x0450  /* Video Path Control */
> +#define HTIM1           0x0454  /* Horizontal Timing Control 1 */
> +#define HTIM2           0x0458  /* Horizontal Timing Control 2 */
> +#define VTIM1           0x045C  /* Vertical Timing Control 1 */
> +#define VTIM2           0x0460  /* Vertical Timing Control 2 */
> +#define VFUEN           0x0464  /* Video Frame Timing Update Enable */
> +#define VFUEN_EN       BIT(0)  /* Upload Enable */
> +
> +/* Mux Input Select for LVDS LINK Input */
> +#define LV_MX0003        0x0480  /* Bit 0 to 3 */
> +#define LV_MX0407        0x0484  /* Bit 4 to 7 */
> +#define LV_MX0811        0x0488  /* Bit 8 to 11 */
> +#define LV_MX1215        0x048C  /* Bit 12 to 15 */
> +#define LV_MX1619        0x0490  /* Bit 16 to 19 */
> +#define LV_MX2023        0x0494  /* Bit 20 to 23 */
> +#define LV_MX2427        0x0498  /* Bit 24 to 27 */
> +#define LV_MX(b0, b1, b2, b3)  (FLD_VAL(b0, 4, 0) | FLD_VAL(b1, 12, 8) | \
> +                               FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24))
> +
> +/* Input bit numbers used in mux registers */
> +enum {
> +       LVI_R0,
> +       LVI_R1,
> +       LVI_R2,
> +       LVI_R3,
> +       LVI_R4,
> +       LVI_R5,
> +       LVI_R6,
> +       LVI_R7,
> +       LVI_G0,
> +       LVI_G1,
> +       LVI_G2,
> +       LVI_G3,
> +       LVI_G4,
> +       LVI_G5,
> +       LVI_G6,
> +       LVI_G7,
> +       LVI_B0,
> +       LVI_B1,
> +       LVI_B2,
> +       LVI_B3,
> +       LVI_B4,
> +       LVI_B5,
> +       LVI_B6,
> +       LVI_B7,
> +       LVI_HS,
> +       LVI_VS,
> +       LVI_DE,
> +       LVI_L0
> +};
> +
> +#define LVCFG           0x049C  /* LVDS Configuration  */
> +#define LVPHY0          0x04A0  /* LVDS PHY 0 */
> +#define LV_PHY0_RST(v)          FLD_VAL(v, 22, 22) /* PHY reset */
> +#define LV_PHY0_IS(v)           FLD_VAL(v, 15, 14)
> +#define LV_PHY0_ND(v)           FLD_VAL(v, 4, 0) /* Frequency range
> select */
> +#define LV_PHY0_PRBS_ON(v)      FLD_VAL(v, 20, 16) /* Clock/Data Flag
> pins */
> +
> +#define LVPHY1          0x04A4  /* LVDS PHY 1 */
> +#define SYSSTAT         0x0500  /* System Status  */
> +#define SYSRST          0x0504  /* System Reset  */
> +
> +#define SYS_RST_I2CS   BIT(0) /* Reset I2C-Slave controller */
> +#define SYS_RST_I2CM   BIT(1) /* Reset I2C-Master controller */
> +#define SYS_RST_LCD    BIT(2) /* Reset LCD controller */
> +#define SYS_RST_BM     BIT(3) /* Reset Bus Management controller */
> +#define SYS_RST_DSIRX  BIT(4) /* Reset DSI-RX and App controller */
> +#define SYS_RST_REG    BIT(5) /* Reset Register module */
> +
> +/* GPIO Registers */
> +#define GPIOC           0x0520  /* GPIO Control  */
> +#define GPIOO           0x0524  /* GPIO Output  */
> +#define GPIOI           0x0528  /* GPIO Input  */
> +
> +/* I2C Registers */
> +#define I2CTIMCTRL      0x0540  /* I2C IF Timing and Enable Control */
> +#define I2CMADDR        0x0544  /* I2C Master Addressing */
> +#define WDATAQ          0x0548  /* Write Data Queue */
> +#define RDATAQ          0x054C  /* Read Data Queue */
> +
> +/* Chip ID and Revision ID Register */
> +#define IDREG           0x0580
> +
> +#define LPX_PERIOD             4
> +#define TTA_GET                        0x40000
> +#define TTA_SURE               6
> +#define SINGLE_LINK            1
> +#define DUAL_LINK              2
> +
> +#define TC358775XBG_ID  0x00007500
> +
> +/* Debug Registers */
> +#define DEBUG00         0x05A0  /* Debug */
> +#define DEBUG01         0x05A4  /* LVDS Data */
> +
> +#define DSI_CLEN_BIT           BIT(0)
> +#define DIVIDE_BY_3            3 /* PCLK=DCLK/3 */
> +#define DIVIDE_BY_6            6 /* PCLK=DCLK/6 */
> +#define LVCFG_LVEN_BIT         BIT(0)
> +
> +#define L0EN BIT(1)
> +
> +#define TC358775_VPCTRL_VSDELAY__MASK  0x3FF00000
> +#define TC358775_VPCTRL_VSDELAY__SHIFT 20
> +static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
> +{
> +       return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
> +                       TC358775_VPCTRL_VSDELAY__MASK;
> +}
> +
> +#define TC358775_VPCTRL_OPXLFMT__MASK  0x00000100
> +#define TC358775_VPCTRL_OPXLFMT__SHIFT 8
> +static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
> +{
> +       return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
> +                       TC358775_VPCTRL_OPXLFMT__MASK;
> +}
> +
> +#define TC358775_VPCTRL_MSF__MASK      0x00000001
> +#define TC358775_VPCTRL_MSF__SHIFT     0
> +static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
> +{
> +       return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
> +                       TC358775_VPCTRL_MSF__MASK;
> +}
> +
> +#define TC358775_LVCFG_PCLKDIV__MASK   0x000000f0
> +#define TC358775_LVCFG_PCLKDIV__SHIFT  4
> +static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> +{
> +       return ((val) << TC358775_LVCFG_PCLKDIV__SHIFT) &
> +                       TC358775_LVCFG_PCLKDIV__MASK;
> +}
> +
> +#define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> +#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> +static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> +{
> +       return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> +                       TC358775_LVCFG_LVDLINK__MASK;
> +}
> +
> +enum tc358775_ports {
> +       TC358775_DSI_IN,
> +       TC358775_LVDS_OUT0,
> +       TC358775_LVDS_OUT1,
> +};
> +
> +struct tc_data {
> +       struct i2c_client       *i2c;
> +       struct device           *dev;
> +
> +       struct drm_bridge       bridge;
> +       struct drm_bridge       *panel_bridge;
> +
> +       struct device_node *host_node;
> +       struct mipi_dsi_device *dsi;
> +       u8 num_dsi_lanes;
> +
> +       struct regulator        *vdd;
> +       struct regulator        *vddio;
> +       struct gpio_desc        *reset_gpio;
> +       struct gpio_desc        *stby_gpio;
> +       u8                      lvds_link; /* single-link or dual-link */
> +       u8                      bpc;
> +};
> +
> +static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> +{
> +       return container_of(b, struct tc_data, bridge);
> +}
> +
> +static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct tc_data *tc = bridge_to_tc(bridge);
> +       struct device *dev = &tc->dsi->dev;
> +       int ret;
> +
> +       ret = regulator_enable(tc->vddio);
> +       if (ret < 0)
> +               dev_err(dev, "regulator vddio enable failed, %d\n", ret);
> +       usleep_range(10000, 11000);
> +
> +       ret = regulator_enable(tc->vdd);
> +       if (ret < 0)
> +               dev_err(dev, "regulator vdd enable failed, %d\n", ret);
> +       usleep_range(10000, 11000);
> +
> +       gpiod_set_value(tc->stby_gpio, 0);
> +       usleep_range(10000, 11000);
> +
> +       gpiod_set_value(tc->reset_gpio, 0);
> +       usleep_range(10, 20);
> +}
> +
> +static void tc_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +       struct tc_data *tc = bridge_to_tc(bridge);
> +       struct device *dev = &tc->dsi->dev;
> +       int ret;
> +
> +       gpiod_set_value(tc->reset_gpio, 1);
> +       usleep_range(10, 20);
> +
> +       gpiod_set_value(tc->stby_gpio, 1);
> +       usleep_range(10000, 11000);
> +
> +       ret = regulator_disable(tc->vdd);
> +       if (ret < 0)
> +               dev_err(dev, "regulator vdd disable failed, %d\n", ret);
> +       usleep_range(10000, 11000);
> +
> +       ret = regulator_disable(tc->vddio);
> +       if (ret < 0)
> +               dev_err(dev, "regulator vddio disable failed, %d\n", ret);
> +       usleep_range(10000, 11000);
> +}
> +
> +static void d2l_read(struct i2c_client *i2c, u16 addr, u32 *val)
> +{
> +       int ret;
> +       u8 buf_addr[2];
> +
> +       put_unaligned_be16(addr, buf_addr);
> +       ret = i2c_master_send(i2c, buf_addr, sizeof(buf_addr));
> +       if (ret < 0)
> +               goto fail;
> +
> +       ret = i2c_master_recv(i2c, (u8 *)val, sizeof(*val));
> +       if (ret < 0)
> +               goto fail;
> +
> +       pr_debug("d2l: I2C : addr:%04x value:%08x\n", addr, *val);
> +
> +fail:
> +       dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
> +               ret, addr);
> +}
> +
> +static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
> +{
> +       u8 data[6];
> +       int ret;
> +
> +       put_unaligned_be16(addr, data);
> +       put_unaligned_le32(val, data + 2);
> +
> +       ret = i2c_master_send(i2c, data, ARRAY_SIZE(data));
> +       if (ret < 0)
> +               dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
> +                       ret, addr);
> +}
> +
> +/* helper function to access bus_formats */
> +static struct drm_connector *get_connector(struct drm_encoder *encoder)
> +{
> +       struct drm_device *dev = encoder->dev;
> +       struct drm_connector *connector;
> +
> +       list_for_each_entry(connector, &dev->mode_config.connector_list,
> head)
> +               if (connector->encoder == encoder)
> +                       return connector;
> +
> +       return NULL;
> +}
> +
> +static void tc_bridge_enable(struct drm_bridge *bridge)
> +{
> +       struct tc_data *tc = bridge_to_tc(bridge);
> +       u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
> +       u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
> +       u32 val = 0;
> +       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> +       struct drm_display_mode *mode;
> +       struct drm_connector *connector = get_connector(bridge->encoder);
> +
> +       mode = &bridge->encoder->crtc->state->adjusted_mode;
> +
> +       hback_porch = mode->htotal - mode->hsync_end;
> +       hsync_len  = mode->hsync_end - mode->hsync_start;
> +       vback_porch = mode->vtotal - mode->vsync_end;
> +       vsync_len  = mode->vsync_end - mode->vsync_start;
> +
> +       htime1 = (hback_porch << 16) + hsync_len;
> +       vtime1 = (vback_porch << 16) + vsync_len;
> +
> +       hfront_porch = mode->hsync_start - mode->hdisplay;
> +       hactive = mode->hdisplay;
> +       vfront_porch = mode->vsync_start - mode->vdisplay;
> +       vactive = mode->vdisplay;
> +
> +       htime2 = (hfront_porch << 16) + hactive;
> +       vtime2 = (vfront_porch << 16) + vactive;
> +
> +       d2l_read(tc->i2c, IDREG, &val);
> +
> +       dev_info(tc->dev, "DSI2LVDS Chip ID.%02x Revision ID. %02x **\n",
> +                (val >> 8) & 0xFF, val & 0xFF);
> +
> +       d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX |
> SYS_RST_BM |
> +                 SYS_RST_LCD | SYS_RST_I2CM | SYS_RST_I2CS);
> +       usleep_range(30000, 40000);
> +
> +       d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> +       d2l_write(tc->i2c, PPI_LPTXTIMECNT, LPX_PERIOD);
> +       d2l_write(tc->i2c, PPI_D0S_CLRSIPOCOUNT, 3);
> +       d2l_write(tc->i2c, PPI_D1S_CLRSIPOCOUNT, 3);
> +       d2l_write(tc->i2c, PPI_D2S_CLRSIPOCOUNT, 3);
> +       d2l_write(tc->i2c, PPI_D3S_CLRSIPOCOUNT, 3);
> +
> +       val = ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
> +       d2l_write(tc->i2c, PPI_LANEENABLE, val);
> +       d2l_write(tc->i2c, DSI_LANEENABLE, val);
> +
> +       d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
> +       d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
> +
> +       if (tc->bpc == 8)
> +               val = TC358775_VPCTRL_OPXLFMT(1);
> +       else /* bpc = 6; */
> +               val = TC358775_VPCTRL_MSF(1);
> +
> +       dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
> +       clkdiv = dsiclk / DIVIDE_BY_3 * tc->lvds_link;
> +       byteclk = dsiclk / 4;
> +       t1 = hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
> +       t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len +
> hfront_porch) / 1000;
> +       t3 = ((t2 * byteclk) / 100) - (hactive * (tc->bpc * 3 / 8) /
> +               tc->num_dsi_lanes);
> +
> +       vsdelay = (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_len
> - hactive;
> +
> +       val |= TC358775_VPCTRL_VSDELAY(vsdelay);
> +       d2l_write(tc->i2c, VPCTRL, val);
> +
> +       d2l_write(tc->i2c, HTIM1, htime1);
> +       d2l_write(tc->i2c, VTIM1, vtime1);
> +       d2l_write(tc->i2c, HTIM2, htime2);
> +       d2l_write(tc->i2c, VTIM2, vtime2);
> +
> +       d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> +       d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
> +       d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> +
> +       dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> +               connector->display_info.bus_formats[0],
> +               tc->bpc);
> +       /*
> +        * Default hardware register settings of tc358775 configured
> +        * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> +        */
> +       if (connector->display_info.bus_formats[0] ==
> +               MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> +               /* VESA-24 */
> +               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
> LVI_R2, LVI_R3));
> +               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7,
> LVI_R5, LVI_G0));
> +               d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2,
> LVI_G6, LVI_G7));
> +               d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4,
> LVI_G5, LVI_B0));
> +               d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_B6, LVI_B7,
> LVI_B1, LVI_B2));
> +               d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4,
> LVI_B5, LVI_L0));
> +               d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS,
> LVI_DE, LVI_R6));
> +       } else { /*  MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - JEIDA-18 */
> +               d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1,
> LVI_R2, LVI_R3));
> +               d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_L0,
> LVI_R5, LVI_G0));
> +               d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2,
> LVI_L0, LVI_L0));
> +               d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4,
> LVI_G5, LVI_B0));
> +               d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_L0, LVI_L0,
> LVI_B1, LVI_B2));
> +               d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4,
> LVI_B5, LVI_L0));
> +               d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS,
> LVI_DE, LVI_L0));
> +       }
> +
> +       d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> +
> +       val = LVCFG_LVEN_BIT;
> +       if (tc->lvds_link == DUAL_LINK) {
> +               val |= TC358775_LVCFG_LVDLINK(1);
> +               val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
> +       } else {
> +               val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
> +       };
> +       d2l_write(tc->i2c, LVCFG, val);
> +}
> +
> +static enum drm_mode_status
> +tc_mode_valid(struct drm_bridge *bridge,
> +             const struct drm_display_info *info,
> +             const struct drm_display_mode *mode)
> +{
> +       struct tc_data *tc = bridge_to_tc(bridge);
> +
> +       /*
> +        * Maximum pixel clock speed 135MHz for single-link
> +        * 270MHz for dual-link
> +        */
> +       if ((mode->clock > 135000 && tc->lvds_link == SINGLE_LINK) ||
> +           (mode->clock > 270000 && tc->lvds_link == DUAL_LINK))
> +               return MODE_CLOCK_HIGH;
> +
> +       switch (info->bus_formats[0]) {
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +               /* RGB888 */
> +               tc->bpc = 8;
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               /* RGB666 */
> +               tc->bpc = 6;
> +               break;
> +       default:
> +               dev_warn(tc->dev,
> +                        "unsupported LVDS bus format 0x%04x\n",
> +                        info->bus_formats[0]);
> +               return MODE_NOMODE;
> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
> +{
> +       struct device_node *endpoint;
> +       struct device_node *parent;
> +       struct device_node *remote;
> +       struct property *prop;
> +       int len = 0;
> +
> +       /*
> +        * To get the data-lanes of dsi, we need to access the dsi0_out of
> port1
> +        *  of dsi0 endpoint from bridge port0 of d2l_in
> +        */
> +       endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
> +                                                TC358775_DSI_IN, -1);
> +       if (endpoint) {
> +               /* dsi0_out node */
> +               parent = of_graph_get_remote_port_parent(endpoint);
> +               of_node_put(endpoint);
> +               if (parent) {
> +                       /* dsi0 port 1 */
> +                       endpoint = of_graph_get_endpoint_by_regs(parent,
> 1, -1);
> +                       of_node_put(parent);
> +                       if (endpoint) {
> +                               prop = of_find_property(endpoint,
> "data-lanes",
> +                                                       &len);
> +                               of_node_put(endpoint);
> +                               if (!prop) {
> +                                       dev_err(tc->dev,
> +                                               "failed to find data
> lane\n");
> +                                       return -EPROBE_DEFER;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       tc->num_dsi_lanes = len / sizeof(u32);
> +
> +       if (tc->num_dsi_lanes < 1 || tc->num_dsi_lanes > 4)
> +               return -EINVAL;
> +
> +       tc->host_node = of_graph_get_remote_node(np, 0, 0);
> +       if (!tc->host_node)
> +               return -ENODEV;
> +
> +       of_node_put(tc->host_node);
> +
> +       tc->lvds_link = SINGLE_LINK;
> +       endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
> +                                                TC358775_LVDS_OUT1, -1);
> +       if (endpoint) {
> +               remote = of_graph_get_remote_port_parent(endpoint);
> +               of_node_put(endpoint);
> +
> +               if (remote) {
> +                       if (of_device_is_available(remote))
> +                               tc->lvds_link = DUAL_LINK;
> +                       of_node_put(remote);
> +               }
> +       }
> +
> +       dev_dbg(tc->dev, "no.of dsi lanes: %d\n", tc->num_dsi_lanes);
> +       dev_dbg(tc->dev, "operating in %d-link mode\n", tc->lvds_link);
> +
> +       return 0;
> +}
> +
> +static int tc_bridge_attach(struct drm_bridge *bridge,
> +                           enum drm_bridge_attach_flags flags)
> +{
> +       struct tc_data *tc = bridge_to_tc(bridge);
> +       struct device *dev = &tc->i2c->dev;
> +       struct mipi_dsi_host *host;
> +       struct mipi_dsi_device *dsi;
> +       int ret;
> +
> +       const struct mipi_dsi_device_info info = { .type = "tc358775",
> +                                                       .channel = 0,
> +                                                       .node = NULL,
> +                                               };
> +
> +       host = of_find_mipi_dsi_host_by_node(tc->host_node);
> +       if (!host) {
> +               dev_err(dev, "failed to find dsi host\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       dsi = mipi_dsi_device_register_full(host, &info);
> +       if (IS_ERR(dsi)) {
> +               dev_err(dev, "failed to create dsi device\n");
> +               ret = PTR_ERR(dsi);
> +               goto err_dsi_device;
> +       }
> +
> +       tc->dsi = dsi;
> +
> +       dsi->lanes = tc->num_dsi_lanes;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> +
> +       ret = mipi_dsi_attach(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to attach dsi to host\n");
> +               goto err_dsi_attach;
> +       }
> +
> +       /* Attach the panel-bridge to the dsi bridge */
> +       return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
> +                                &tc->bridge, flags);
> +err_dsi_attach:
> +       mipi_dsi_device_unregister(dsi);
> +err_dsi_device:
> +       return ret;
> +}
> +
> +static const struct drm_bridge_funcs tc_bridge_funcs = {
> +       .attach = tc_bridge_attach,
> +       .pre_enable = tc_bridge_pre_enable,
> +       .enable = tc_bridge_enable,
> +       .mode_valid = tc_mode_valid,
> +       .post_disable = tc_bridge_post_disable,
> +};
> +
> +static int tc_probe(struct i2c_client *client, const struct i2c_device_id
> *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct drm_panel *panel;
> +       struct tc_data *tc;
> +       int ret;
> +
> +       tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> +       if (!tc)
> +               return -ENOMEM;
> +
> +       tc->dev = dev;
> +       tc->i2c = client;
> +
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, TC358775_LVDS_OUT0,
> +                                         0, &panel, NULL);
> +       if (ret < 0)
> +               return ret;
> +       if (!panel)
> +               return -ENODEV;
> +
> +       tc->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +       if (IS_ERR(tc->panel_bridge))
> +               return PTR_ERR(tc->panel_bridge);
> +
> +       ret = tc358775_parse_dt(dev->of_node, tc);
> +       if (ret)
> +               return ret;
> +
> +       tc->vddio = devm_regulator_get(dev, "vddio-supply");
> +       if (IS_ERR(tc->vddio)) {
> +               ret = PTR_ERR(tc->vddio);
> +               dev_err(dev, "vddio-supply not found\n");
> +               return ret;
> +       }
> +
> +       tc->vdd = devm_regulator_get(dev, "vdd-supply");
> +       if (IS_ERR(tc->vdd)) {
> +               ret = PTR_ERR(tc->vddio);
> +               dev_err(dev, "vdd-supply not found\n");
> +               return ret;
> +       }
> +
> +       tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
> +       if (IS_ERR(tc->stby_gpio)) {
> +               ret = PTR_ERR(tc->stby_gpio);
> +               dev_err(dev, "cannot get stby-gpio %d\n", ret);
> +               return ret;
> +       }
> +
> +       tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(tc->reset_gpio)) {
> +               ret = PTR_ERR(tc->reset_gpio);
> +               dev_err(dev, "cannot get reset-gpios %d\n", ret);
> +               return ret;
> +       }
> +
> +       tc->bridge.funcs = &tc_bridge_funcs;
> +       tc->bridge.of_node = dev->of_node;
> +       drm_bridge_add(&tc->bridge);
> +
> +       i2c_set_clientdata(client, tc);
> +
> +       return 0;
> +}
> +
> +static int tc_remove(struct i2c_client *client)
> +{
> +       struct tc_data *tc = i2c_get_clientdata(client);
> +
> +       drm_bridge_remove(&tc->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct i2c_device_id tc358775_i2c_ids[] = {
> +       { "tc358775", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
> +
> +static const struct of_device_id tc358775_of_ids[] = {
> +       { .compatible = "toshiba,tc358775", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, tc358775_of_ids);
> +
> +static struct i2c_driver tc358775_driver = {
> +       .driver = {
> +               .name = "tc358775",
> +               .of_match_table = tc358775_of_ids,
> +       },
> +       .id_table = tc358775_i2c_ids,
> +       .probe = tc_probe,
> +       .remove = tc_remove,
> +};
> +module_i2c_driver(tc358775_driver);
> +
> +MODULE_AUTHOR("Vinay Simha BN <simhavcs@gmail.com>");
> +MODULE_DESCRIPTION("TC358775 DSI/LVDS bridge driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.1.2
>
>

-- 
regards,
vinaysimha

--0000000000000f116605ab93bdea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Please Review the pa=
tch</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Jul 10, 2020 at 7:11 PM Vinay Simha BN &lt;<a href=3D"mail=
to:simhavcs@gmail.com">simhavcs@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This driver is tested with two pan=
els individually with Apq8016-IFC6309 board<br>
<a href=3D"https://www.inforcecomputing.com/products/single-board-computers=
-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.inforcecomputing.com/products/single-board-compu=
ters-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc</a><br>
<br>
1. 1366x768@60 auo,b101xtn01 data-mapping =3D &quot;jeida-24&quot;<br>
2. 800x480@60 innolux,at070tn92 data-mapping =3D &quot;vesa-24&quot;<br>
<br>
- power off sequence in proper order<br>
- put_unaligned_be16, put_unaligned_le32 macros used<br>
- static function for mode_valid<br>
- len initialized<br>
- MODE_CLOCK_HIGH handled properly<br>
- bus_formats handeld in mode_valid<br>
- GENMASK and FIELD_PREP used<br>
- Kconfig proper indentation<br>
- error handling enpoint data-lanes<br>
- check for bus_formats unsupported<br>
- display_timings naming local variables<br>
- help modified<br>
- ~vsdelay dynamic value set based on the<br>
=C2=A0 calculation of dsi speed, output speed, blanking<br>
- panel-&gt;connector_type removed<br>
- dual port implemented<br>
- devm_drm_panel_bridge_add method used instead of panel<br>
=C2=A0 description modified<br>
- regulator enable and disable with proper orders and delays<br>
=C2=A0 as per the spec<br>
- removed drm_connector_status<br>
- added bus_formats<br>
- mdelay to usleep_range<br>
- magic number to macros for CLRSI and mux registers<br>
=C2=A0 description modified<br>
- replaced u32 instead of uint32_t<br>
- updated alphabetic order of headers<br>
- added SPDX identifier license<br>
<br>
Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" tar=
get=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
<br>
---<br>
v1:<br>
=C2=A0Initial version<br>
<br>
v2:<br>
* Andrzej Hajda review comments incorporated<br>
=C2=A0 SPDX identifier<br>
=C2=A0 development debug removed<br>
=C2=A0 alphabetic order headers<br>
=C2=A0 u32 instead of unit32_t<br>
=C2=A0 magic numbers to macros for CLRSI and mux registers<br>
=C2=A0 ignored return value<br>
<br>
* Laurent Pinchart review comments incorporated<br>
=C2=A0 mdelay to usleep_range<br>
=C2=A0 bus_formats added<br>
<br>
v3:<br>
* Andrzej Hajda review comments incorporated<br>
=C2=A0 drm_connector_status removed<br>
=C2=A0 u32 rev removed and local variabl is used<br>
=C2=A0 regulator enable disable with proper orders and delays<br>
=C2=A0 as per the spec<br>
=C2=A0 devm_drm_panel_bridge_add method used instead of panel<br>
=C2=A0 description modified<br>
=C2=A0 dual port implemented<br>
<br>
v4:<br>
* Sam Ravnborg review comments incorporated<br>
=C2=A0 panel-&gt;connector_type removed<br>
<br>
* Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" targe=
t=3D"_blank">lkp@intel.com</a>&gt;<br>
=C2=A0 parse_dt to static function<br>
=C2=A0 removed the if (endpoint), since data-lanes has to be<br>
=C2=A0 present for dsi dts ports<br>
<br>
v5:<br>
=C2=A0 ~vsdelay dynamic value set based on the<br>
=C2=A0 calculation of dsi speed, output speed, blanking<br>
<br>
v6:<br>
* Sam Ravnborg review comments incorporated<br>
=C2=A0 help modified<br>
=C2=A0 display_timings naming local variables<br>
=C2=A0 check for bus_formats unsupported<br>
=C2=A0 error handling enpoint data-lanes<br>
<br>
v7:<br>
* Sam Ravnborg review comments incorporated<br>
=C2=A0 Kconfig proper indentation<br>
=C2=A0 GENMASK and FIELD_PREP used<br>
=C2=A0 bus_formats handeld in mode_valid<br>
=C2=A0 MODE_CLOCK_HIGH handled properly<br>
<br>
* Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" targe=
t=3D"_blank">lkp@intel.com</a>&gt;<br>
=C2=A0 len initialized<br>
=C2=A0 static function for mode_valid<br>
<br>
v8:<br>
* Andrzej Hajda review comments incorporated<br>
=C2=A0 power off sequence in proper order<br>
=C2=A0 put_unaligned_be16, put_unaligned_le32 macros used<br>
* change log modified in reverse chronological order<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/Kconfig=C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0drivers/gpu/drm/bridge/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/gpu/drm/bridge/tc358775.c | 749 +++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A03 files changed, 760 insertions(+)<br>
=C2=A0create mode 100644 drivers/gpu/drm/bridge/tc358775.c<br>
<br>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfi=
g<br>
index 43271c2..25c3097 100644<br>
--- a/drivers/gpu/drm/bridge/Kconfig<br>
+++ b/drivers/gpu/drm/bridge/Kconfig<br>
@@ -181,6 +181,16 @@ config DRM_TOSHIBA_TC358768<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Toshiba TC358768AXBG/TC358778XBG DSI bri=
dge chip driver.<br>
<br>
+config DRM_TOSHIBA_TC358775<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Toshiba TC358775 DSI/LVDS bridge=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_I2C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_PANEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Toshiba TC358775 DSI/LVDS bridge chip dr=
iver.<br>
+<br>
=C2=A0config DRM_TI_TFP410<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;TI TFP410 DVI/HDMI bridge&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on OF<br>
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makef=
ile<br>
index d63d4b7..23c770b 100644<br>
--- a/drivers/gpu/drm/bridge/Makefile<br>
+++ b/drivers/gpu/drm/bridge/Makefile<br>
@@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_THINE_THC63LVD1024) +=3D thc63lvd1024.o<=
br>
=C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358764) +=3D tc358764.o<br>
=C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o<br>
=C2=A0obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=3D tc358768.o<br>
+obj-$(CONFIG_DRM_TOSHIBA_TC358775) +=3D tc358775.o<br>
=C2=A0obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/<br>
=C2=A0obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o<br>
=C2=A0obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o<br>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc3=
58775.c<br>
new file mode 100644<br>
index 0000000..7da15cd<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/bridge/tc358775.c<br>
@@ -0,0 +1,749 @@<br>
+// SPDX-License-Identifier: GPL-2.0<br>
+/*<br>
+ * TC358775 DSI to LVDS bridge driver<br>
+ *<br>
+ * Copyright (C) 2020 SMART Wireless Computing<br>
+ * Author: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com" target=
=3D"_blank">simhavcs@gmail.com</a>&gt;<br>
+ *<br>
+ */<br>
+/* #define DEBUG */<br>
+#include &lt;linux/bitfield.h&gt;<br>
+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/gpio/consumer.h&gt;<br>
+#include &lt;linux/i2c.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/regulator/consumer.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+<br>
+#include &lt;asm/unaligned.h&gt;<br>
+<br>
+#include &lt;drm/drm_atomic_helper.h&gt;<br>
+#include &lt;drm/drm_bridge.h&gt;<br>
+#include &lt;drm/drm_crtc_helper.h&gt;<br>
+#include &lt;drm/drm_dp_helper.h&gt;<br>
+#include &lt;drm/drm_mipi_dsi.h&gt;<br>
+#include &lt;drm/drm_of.h&gt;<br>
+#include &lt;drm/drm_panel.h&gt;<br>
+#include &lt;drm/drm_probe_helper.h&gt;<br>
+<br>
+#define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)<br>
+<br>
+/* Registers */<br>
+<br>
+/* DSI D-PHY Layer Registers */<br>
+#define D0W_DPHYCONTTX=C2=A0 0x0004=C2=A0 /* Data Lane 0 DPHY Tx Control *=
/<br>
+#define CLW_DPHYCONTRX=C2=A0 0x0020=C2=A0 /* Clock Lane DPHY Rx Control */=
<br>
+#define D0W_DPHYCONTRX=C2=A0 0x0024=C2=A0 /* Data Lane 0 DPHY Rx Control *=
/<br>
+#define D1W_DPHYCONTRX=C2=A0 0x0028=C2=A0 /* Data Lane 1 DPHY Rx Control *=
/<br>
+#define D2W_DPHYCONTRX=C2=A0 0x002C=C2=A0 /* Data Lane 2 DPHY Rx Control *=
/<br>
+#define D3W_DPHYCONTRX=C2=A0 0x0030=C2=A0 /* Data Lane 3 DPHY Rx Control *=
/<br>
+#define COM_DPHYCONTRX=C2=A0 0x0038=C2=A0 /* DPHY Rx Common Control */<br>
+#define CLW_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0040=C2=A0 /* Clock Lane Con=
trol */<br>
+#define D0W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0044=C2=A0 /* Data Lane 0 Co=
ntrol */<br>
+#define D1W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0048=C2=A0 /* Data Lane 1 Co=
ntrol */<br>
+#define D2W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x004C=C2=A0 /* Data Lane 2 Co=
ntrol */<br>
+#define D3W_CNTRL=C2=A0 =C2=A0 =C2=A0 =C2=A00x0050=C2=A0 /* Data Lane 3 Co=
ntrol */<br>
+#define DFTMODE_CNTRL=C2=A0 =C2=A00x0054=C2=A0 /* DFT Mode Control */<br>
+<br>
+/* DSI PPI Layer Registers */<br>
+#define PPI_STARTPPI=C2=A0 =C2=A0 0x0104=C2=A0 /* START control bit of PPI=
-TX function. */<br>
+#define PPI_START_FUNCTION=C2=A0 =C2=A0 =C2=A0 1<br>
+<br>
+#define PPI_BUSYPPI=C2=A0 =C2=A0 =C2=A00x0108<br>
+#define PPI_LINEINITCNT 0x0110=C2=A0 /* Line Initialization Wait Counter=
=C2=A0 */<br>
+#define PPI_LPTXTIMECNT 0x0114<br>
+#define PPI_LANEENABLE=C2=A0 0x0134=C2=A0 /* Enables each lane at the PPI =
layer. */<br>
+#define PPI_TX_RX_TA=C2=A0 =C2=A0 0x013C=C2=A0 /* DSI Bus Turn Around timi=
ng parameters */<br>
+<br>
+/* Analog timer function enable */<br>
+#define PPI_CLS_ATMR=C2=A0 =C2=A0 0x0140=C2=A0 /* Delay for Clock Lane in =
LPRX=C2=A0 */<br>
+#define PPI_D0S_ATMR=C2=A0 =C2=A0 0x0144=C2=A0 /* Delay for Data Lane 0 in=
 LPRX */<br>
+#define PPI_D1S_ATMR=C2=A0 =C2=A0 0x0148=C2=A0 /* Delay for Data Lane 1 in=
 LPRX */<br>
+#define PPI_D2S_ATMR=C2=A0 =C2=A0 0x014C=C2=A0 /* Delay for Data Lane 2 in=
 LPRX */<br>
+#define PPI_D3S_ATMR=C2=A0 =C2=A0 0x0150=C2=A0 /* Delay for Data Lane 3 in=
 LPRX */<br>
+<br>
+#define PPI_D0S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0164=C2=A0 /* For lane 0 */<br=
>
+#define PPI_D1S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0168=C2=A0 /* For lane 1 */<br=
>
+#define PPI_D2S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x016C=C2=A0 /* For lane 2 */<br=
>
+#define PPI_D3S_CLRSIPOCOUNT=C2=A0 =C2=A0 0x0170=C2=A0 /* For lane 3 */<br=
>
+<br>
+#define CLS_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0180=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
+#define D0S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0184=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
+#define D1S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0188=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
+#define D2S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x018C=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
+#define D3S_PRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0190=C2=A0 /* Digital C=
ounter inside of PHY IO */<br>
+#define CLS_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A0=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D0S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A4=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D1S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01A8=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D2S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01AC=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D3S_PREP=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01B0=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define CLS_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C0=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D0S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C4=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D1S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01C8=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D2S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01CC=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+#define D3S_ZERO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01D0=C2=A0 /* Digital Counte=
r inside of PHY IO */<br>
+<br>
+#define PPI_CLRFLG=C2=A0 =C2=A0 =C2=A0 0x01E0=C2=A0 /* PRE Counters has re=
ached set values */<br>
+#define PPI_CLRSIPO=C2=A0 =C2=A0 =C2=A00x01E4=C2=A0 /* Clear SIPO values, =
Slave mode use only. */<br>
+#define HSTIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A00x01F0=C2=A0 /* HS Rx Time Out=
 Counter */<br>
+#define HSTIMEOUTENABLE 0x01F4=C2=A0 /* Enable HS Rx Time Out Counter */<b=
r>
+#define DSI_STARTDSI=C2=A0 =C2=A0 0x0204=C2=A0 /* START control bit of DSI=
-TX function */<br>
+#define DSI_RX_START=C2=A0 =C2=A01<br>
+<br>
+#define DSI_BUSYDSI=C2=A0 =C2=A0 =C2=A00x0208<br>
+#define DSI_LANEENABLE=C2=A0 0x0210=C2=A0 /* Enables each lane at the Prot=
ocol layer. */<br>
+#define DSI_LANESTATUS0 0x0214=C2=A0 /* Displays lane is in HS RX mode. */=
<br>
+#define DSI_LANESTATUS1 0x0218=C2=A0 /* Displays lane is in ULPS or STOP s=
tate */<br>
+<br>
+#define DSI_INTSTATUS=C2=A0 =C2=A00x0220=C2=A0 /* Interrupt Status */<br>
+#define DSI_INTMASK=C2=A0 =C2=A0 =C2=A00x0224=C2=A0 /* Interrupt Mask */<b=
r>
+#define DSI_INTCLR=C2=A0 =C2=A0 =C2=A0 0x0228=C2=A0 /* Interrupt Clear */<=
br>
+#define DSI_LPTXTO=C2=A0 =C2=A0 =C2=A0 0x0230=C2=A0 /* Low Power Tx Time O=
ut Counter */<br>
+<br>
+#define DSIERRCNT=C2=A0 =C2=A0 =C2=A0 =C2=A00x0300=C2=A0 /* DSI Error Coun=
t */<br>
+#define APLCTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0400=C2=A0 /* Applicati=
on Layer Control */<br>
+#define RDPKTLN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0404=C2=A0 /* Command R=
ead Packet Length */<br>
+<br>
+#define VPCTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0450=C2=A0 /* Video Pat=
h Control */<br>
+#define HTIM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0454=C2=A0 /* Hori=
zontal Timing Control 1 */<br>
+#define HTIM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0458=C2=A0 /* Hori=
zontal Timing Control 2 */<br>
+#define VTIM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x045C=C2=A0 /* Vert=
ical Timing Control 1 */<br>
+#define VTIM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0460=C2=A0 /* Vert=
ical Timing Control 2 */<br>
+#define VFUEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0464=C2=A0 /* Vide=
o Frame Timing Update Enable */<br>
+#define VFUEN_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)=C2=A0 /* Upload Enable *=
/<br>
+<br>
+/* Mux Input Select for LVDS LINK Input */<br>
+#define LV_MX0003=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0480=C2=A0 /* Bit 0 to 3 */=
<br>
+#define LV_MX0407=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0484=C2=A0 /* Bit 4 to 7 */=
<br>
+#define LV_MX0811=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0488=C2=A0 /* Bit 8 to 11 *=
/<br>
+#define LV_MX1215=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x048C=C2=A0 /* Bit 12 to 15 =
*/<br>
+#define LV_MX1619=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0490=C2=A0 /* Bit 16 to 19 =
*/<br>
+#define LV_MX2023=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0494=C2=A0 /* Bit 20 to 23 =
*/<br>
+#define LV_MX2427=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0498=C2=A0 /* Bit 24 to 27 =
*/<br>
+#define LV_MX(b0, b1, b2, b3)=C2=A0 (FLD_VAL(b0, 4, 0) | FLD_VAL(b1, 12, 8=
) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28,=
 24))<br>
+<br>
+/* Input bit numbers used in mux registers */<br>
+enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_R7,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_G7,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_B7,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_HS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_VS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_DE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LVI_L0<br>
+};<br>
+<br>
+#define LVCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x049C=C2=A0 /* LVDS=
 Configuration=C2=A0 */<br>
+#define LVPHY0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04A0=C2=A0 /* LVDS PHY =
0 */<br>
+#define LV_PHY0_RST(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FLD_VAL(v, 22, 22=
) /* PHY reset */<br>
+#define LV_PHY0_IS(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL(v, 1=
5, 14)<br>
+#define LV_PHY0_ND(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FLD_VAL(v, 4=
, 0) /* Frequency range select */<br>
+#define LV_PHY0_PRBS_ON(v)=C2=A0 =C2=A0 =C2=A0 FLD_VAL(v, 20, 16) /* Clock=
/Data Flag pins */<br>
+<br>
+#define LVPHY1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04A4=C2=A0 /* LVDS PHY =
1 */<br>
+#define SYSSTAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0500=C2=A0 /* System St=
atus=C2=A0 */<br>
+#define SYSRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0504=C2=A0 /* System Re=
set=C2=A0 */<br>
+<br>
+#define SYS_RST_I2CS=C2=A0 =C2=A0BIT(0) /* Reset I2C-Slave controller */<b=
r>
+#define SYS_RST_I2CM=C2=A0 =C2=A0BIT(1) /* Reset I2C-Master controller */<=
br>
+#define SYS_RST_LCD=C2=A0 =C2=A0 BIT(2) /* Reset LCD controller */<br>
+#define SYS_RST_BM=C2=A0 =C2=A0 =C2=A0BIT(3) /* Reset Bus Management contr=
oller */<br>
+#define SYS_RST_DSIRX=C2=A0 BIT(4) /* Reset DSI-RX and App controller */<b=
r>
+#define SYS_RST_REG=C2=A0 =C2=A0 BIT(5) /* Reset Register module */<br>
+<br>
+/* GPIO Registers */<br>
+#define GPIOC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0520=C2=A0 /* GPIO=
 Control=C2=A0 */<br>
+#define GPIOO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0524=C2=A0 /* GPIO=
 Output=C2=A0 */<br>
+#define GPIOI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0528=C2=A0 /* GPIO=
 Input=C2=A0 */<br>
+<br>
+/* I2C Registers */<br>
+#define I2CTIMCTRL=C2=A0 =C2=A0 =C2=A0 0x0540=C2=A0 /* I2C IF Timing and E=
nable Control */<br>
+#define I2CMADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0544=C2=A0 /* I2C Master Add=
ressing */<br>
+#define WDATAQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0548=C2=A0 /* Write Dat=
a Queue */<br>
+#define RDATAQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x054C=C2=A0 /* Read Data=
 Queue */<br>
+<br>
+/* Chip ID and Revision ID Register */<br>
+#define IDREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0580<br>
+<br>
+#define LPX_PERIOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+#define TTA_GET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x40000<br>
+#define TTA_SURE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<b=
r>
+#define SINGLE_LINK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define DUAL_LINK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+<br>
+#define TC358775XBG_ID=C2=A0 0x00007500<br>
+<br>
+/* Debug Registers */<br>
+#define DEBUG00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05A0=C2=A0 /* Debug */<=
br>
+#define DEBUG01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x05A4=C2=A0 /* LVDS Data=
 */<br>
+<br>
+#define DSI_CLEN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+#define DIVIDE_BY_3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 /* PCLK=3DD=
CLK/3 */<br>
+#define DIVIDE_BY_6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 /* PCLK=3DD=
CLK/6 */<br>
+#define LVCFG_LVEN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+<br>
+#define L0EN BIT(1)<br>
+<br>
+#define TC358775_VPCTRL_VSDELAY__MASK=C2=A0 0x3FF00000<br>
+#define TC358775_VPCTRL_VSDELAY__SHIFT 20<br>
+static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_VSDELAY_=
_SHIFT) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TC358775_VPCTRL_VSDELAY__MASK;<br>
+}<br>
+<br>
+#define TC358775_VPCTRL_OPXLFMT__MASK=C2=A0 0x00000100<br>
+#define TC358775_VPCTRL_OPXLFMT__SHIFT 8<br>
+static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_OPXLFMT_=
_SHIFT) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TC358775_VPCTRL_OPXLFMT__MASK;<br>
+}<br>
+<br>
+#define TC358775_VPCTRL_MSF__MASK=C2=A0 =C2=A0 =C2=A0 0x00000001<br>
+#define TC358775_VPCTRL_MSF__SHIFT=C2=A0 =C2=A0 =C2=A00<br>
+static inline u32 TC358775_VPCTRL_MSF(uint32_t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_VPCTRL_MSF__SHI=
FT) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TC358775_VPCTRL_MSF__MASK;<br>
+}<br>
+<br>
+#define TC358775_LVCFG_PCLKDIV__MASK=C2=A0 =C2=A00x000000f0<br>
+#define TC358775_LVCFG_PCLKDIV__SHIFT=C2=A0 4<br>
+static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_LVCFG_PCLKDIV__=
SHIFT) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TC358775_LVCFG_PCLKDIV__MASK;<br>
+}<br>
+<br>
+#define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br>
+#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((val) &lt;&lt; TC358775_LVCFG_LVDLINK__=
SHIFT) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TC358775_LVCFG_LVDLINK__MASK;<br>
+}<br>
+<br>
+enum tc358775_ports {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TC358775_DSI_IN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TC358775_LVDS_OUT0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TC358775_LVDS_OUT1,<br>
+};<br>
+<br>
+struct tc_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client=C2=A0 =C2=A0 =C2=A0 =C2=A0*i2=
c;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge=C2=A0 =C2=A0 =C2=A0 =C2=A0bri=
dge;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge=C2=A0 =C2=A0 =C2=A0 =C2=A0*pa=
nel_bridge;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *host_node;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 num_dsi_lanes;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator=C2=A0 =C2=A0 =C2=A0 =C2=A0 *vd=
d;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator=C2=A0 =C2=A0 =C2=A0 =C2=A0 *vd=
dio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 *re=
set_gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 *st=
by_gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds_link; /* single-link or dual-link */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpc;<br>
+};<br>
+<br>
+static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(b, struct tc_data, bridge);=
<br>
+}<br>
+<br>
+static void tc_bridge_pre_enable(struct drm_bridge *bridge)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;dsi-&gt;dev;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regulator_enable(tc-&gt;vddio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regulator vddio enable failed, %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regulator_enable(tc-&gt;vdd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regulator vdd enable failed, %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;stby_gpio, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;reset_gpio, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10, 20);<br>
+}<br>
+<br>
+static void tc_bridge_post_disable(struct drm_bridge *bridge)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;dsi-&gt;dev;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;reset_gpio, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10, 20);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(tc-&gt;stby_gpio, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regulator_disable(tc-&gt;vdd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regulator vdd disable failed, %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regulator_disable(tc-&gt;vddio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regulator vddio disable failed, %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(10000, 11000);<br>
+}<br>
+<br>
+static void d2l_read(struct i2c_client *i2c, u16 addr, u32 *val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf_addr[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0put_unaligned_be16(addr, buf_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_send(i2c, buf_addr, sizeof(b=
uf_addr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_recv(i2c, (u8 *)val, sizeof(=
*val));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;d2l: I2C : addr:%04x value:%08x\=
n&quot;, addr, *val);<br>
+<br>
+fail:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;i2c-&gt;dev, &quot;Error %d readin=
g from subaddress 0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, addr);<br>
+}<br>
+<br>
+static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 data[6];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0put_unaligned_be16(addr, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0put_unaligned_le32(val, data + 2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_master_send(i2c, data, ARRAY_SIZE(d=
ata));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;i2c-&g=
t;dev, &quot;Error %d writing to subaddress 0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret, addr);<br>
+}<br>
+<br>
+/* helper function to access bus_formats */<br>
+static struct drm_connector *get_connector(struct drm_encoder *encoder)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D encoder-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(connector, &amp;dev-&gt;mod=
e_config.connector_list, head)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;e=
ncoder =3D=3D encoder)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return connector;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+}<br>
+<br>
+static void tc_bridge_enable(struct drm_bridge *bridge)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hback_porch, hsync_len, hfront_porch, hacti=
ve, htime1, htime2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vback_porch, vsync_len, vfront_porch, vacti=
ve, vtime1, vtime2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdela=
y;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D get_connect=
or(bridge-&gt;encoder);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mode =3D &amp;bridge-&gt;encoder-&gt;crtc-&gt;s=
tate-&gt;adjusted_mode;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hback_porch =3D mode-&gt;htotal - mode-&gt;hsyn=
c_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hsync_len=C2=A0 =3D mode-&gt;hsync_end - mode-&=
gt;hsync_start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vback_porch =3D mode-&gt;vtotal - mode-&gt;vsyn=
c_end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vsync_len=C2=A0 =3D mode-&gt;vsync_end - mode-&=
gt;vsync_start;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0htime1 =3D (hback_porch &lt;&lt; 16) + hsync_le=
n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vtime1 =3D (vback_porch &lt;&lt; 16) + vsync_le=
n;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hfront_porch =3D mode-&gt;hsync_start - mode-&g=
t;hdisplay;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hactive =3D mode-&gt;hdisplay;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vfront_porch =3D mode-&gt;vsync_start - mode-&g=
t;vdisplay;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vactive =3D mode-&gt;vdisplay;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0htime2 =3D (hfront_porch &lt;&lt; 16) + hactive=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vtime2 =3D (vfront_porch &lt;&lt; 16) + vactive=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_read(tc-&gt;i2c, IDREG, &amp;val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(tc-&gt;dev, &quot;DSI2LVDS Chip ID.%02=
x Revision ID. %02x **\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (val &gt;&gt; 8) &=
amp; 0xFF, val &amp; 0xFF);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, SYSRST, SYS_RST_REG | SYS=
_RST_DSIRX | SYS_RST_BM |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYS_RST_LCD =
| SYS_RST_I2CM | SYS_RST_I2CS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(30000, 40000);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_TX_RX_TA, TTA_GET | T=
TA_SURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_LPTXTIMECNT, LPX_PERI=
OD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D0S_CLRSIPOCOUNT, 3);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D1S_CLRSIPOCOUNT, 3);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D2S_CLRSIPOCOUNT, 3);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_D3S_CLRSIPOCOUNT, 3);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D ((L0EN &lt;&lt; tc-&gt;num_dsi_lanes) -=
 L0EN) | DSI_CLEN_BIT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_LANEENABLE, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, DSI_LANEENABLE, val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, PPI_STARTPPI, PPI_START_F=
UNCTION);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, DSI_STARTDSI, DSI_RX_STAR=
T);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;bpc =3D=3D 8)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D TC358775_VP=
CTRL_OPXLFMT(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else /* bpc =3D 6; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D TC358775_VP=
CTRL_MSF(1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsiclk =3D mode-&gt;crtc_clock * 3 * tc-&gt;bpc=
 / tc-&gt;num_dsi_lanes / 1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clkdiv =3D dsiclk / DIVIDE_BY_3 * tc-&gt;lvds_l=
ink;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0byteclk =3D dsiclk / 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t1 =3D hactive * (tc-&gt;bpc * 3 / 8) / tc-&gt;=
num_dsi_lanes;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t2 =3D ((100000 / clkdiv)) * (hactive + hback_p=
orch + hsync_len + hfront_porch) / 1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t3 =3D ((t2 * byteclk) / 100) - (hactive * (tc-=
&gt;bpc * 3 / 8) /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;num_dsi_lane=
s);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vsdelay =3D (clkdiv * (t1 + t3) / byteclk) - hb=
ack_porch - hsync_len - hactive;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_VPCTRL_VSDELAY(vsdelay);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VPCTRL, val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, HTIM1, htime1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VTIM1, vtime1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, HTIM2, htime2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VTIM2, vtime2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VFUEN, VFUEN_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, SYSRST, SYS_RST_LCD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LVPHY0, LV_PHY0_PRBS_ON(4=
) | LV_PHY0_ND(6));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;bus_formats %04x bpc =
%d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;displ=
ay_info.bus_formats[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Default hardware register settings of tc3587=
75 configured<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-=
24 format<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;display_info.bus_formats[0] =
=3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEDIA_BUS_FMT_RGB88=
8_1X7X4_SPWG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* VESA-24 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else { /*=C2=A0 MEDIA_BUS_FMT_RGB666_1X7X3_SP=
WG - JEIDA-18 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0407, LV_MX(LVI_R4, LVI_L0, LVI_R5, LVI_G0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_L0, LVI_L0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX1619, LV_MX(LVI_L0, LVI_L0, LVI_B1, LVI_B2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2=
c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_L0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, VFUEN, VFUEN_EN);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D LVCFG_LVEN_BIT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;lvds_link =3D=3D DUAL_LINK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_L=
VCFG_LVDLINK(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_L=
VCFG_PCLKDIV(DIVIDE_BY_6);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D TC358775_L=
VCFG_PCLKDIV(DIVIDE_BY_3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d2l_write(tc-&gt;i2c, LVCFG, val);<br>
+}<br>
+<br>
+static enum drm_mode_status<br>
+tc_mode_valid(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_i=
nfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_display_m=
ode *mode)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Maximum pixel clock speed 135MHz for single-=
link<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 270MHz for dual-link<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((mode-&gt;clock &gt; 135000 &amp;&amp; tc-&=
gt;lvds_link =3D=3D SINGLE_LINK) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mode-&gt;clock &gt; 270000 &amp;=
&amp; tc-&gt;lvds_link =3D=3D DUAL_LINK))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_CLOCK_H=
IGH;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (info-&gt;bus_formats[0]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGB888 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc =3D 8;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGB666 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bpc =3D 6;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(tc-&gt;dev=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;unsupported LVDS bus format 0x%04x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 info-&gt;bus_formats[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_NOMODE;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
+}<br>
+<br>
+static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *endpoint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *parent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *remote;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct property *prop;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int len =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * To get the data-lanes of dsi, we need to acc=
ess the dsi0_out of port1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 of dsi0 endpoint from bridge port0 of =
d2l_in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(tc-&=
gt;dev-&gt;of_node,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TC358775_DSI_IN, -1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (endpoint) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* dsi0_out node */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent =3D of_graph=
_get_remote_port_parent(endpoint);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoin=
t);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* dsi0 port 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(parent, 1, -1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of_node_put(parent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (endpoint) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D of_find_property(endpoint, &=
quot;data-lanes&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoint);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(t=
c-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;failed to find data lane\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
PROBE_DEFER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;num_dsi_lanes =3D len / sizeof(u32);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;num_dsi_lanes &lt; 1 || tc-&gt;num_d=
si_lanes &gt; 4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;host_node =3D of_graph_get_remote_node(n=
p, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tc-&gt;host_node)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(tc-&gt;host_node);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;lvds_link =3D SINGLE_LINK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0endpoint =3D of_graph_get_endpoint_by_regs(tc-&=
gt;dev-&gt;of_node,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TC358775_LVDS_OUT1, -1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (endpoint) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remote =3D of_graph=
_get_remote_port_parent(endpoint);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(endpoin=
t);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (remote) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (of_device_is_available(remote))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;lvds_link =3D DUAL_LINK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0of_node_put(remote);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;no.of dsi lanes: %d\n=
&quot;, tc-&gt;num_dsi_lanes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(tc-&gt;dev, &quot;operating in %d-link =
mode\n&quot;, tc-&gt;lvds_link);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int tc_bridge_attach(struct drm_bridge *bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0enum drm_bridge_attach_flags flags)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D bridge_to_tc(bridge);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;tc-&gt;i2c-&gt;dev;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_host *host;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct mipi_dsi_device_info info =3D { .t=
ype =3D &quot;tc358775&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channel =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.node =3D NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host =3D of_find_mipi_dsi_host_by_node(tc-&gt;h=
ost_node);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!host) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to find dsi host\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPROBE_DEFE=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D mipi_dsi_device_register_full(host, &am=
p;info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to create dsi device\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(dsi=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dsi_device=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;dsi =3D dsi;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;lanes =3D tc-&gt;num_dsi_lanes;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;format =3D MIPI_DSI_FMT_RGB888;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags =3D MIPI_DSI_MODE_VIDEO;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_attach(dsi);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to attach dsi to host\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dsi_attach=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Attach the panel-bridge to the dsi bridge */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_bridge_attach(bridge-&gt;encoder, tc=
-&gt;panel_bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;tc-&gt;bridge, flags);<br>
+err_dsi_attach:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mipi_dsi_device_unregister(dsi);<br>
+err_dsi_device:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static const struct drm_bridge_funcs tc_bridge_funcs =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.attach =3D tc_bridge_attach,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pre_enable =3D tc_bridge_pre_enable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D tc_bridge_enable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid =3D tc_mode_valid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.post_disable =3D tc_bridge_post_disable,<br>
+};<br>
+<br>
+static int tc_probe(struct i2c_client *client, const struct i2c_device_id =
*id)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;client-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_panel *panel;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc =3D devm_kzalloc(dev, sizeof(*tc), GFP_KERNE=
L);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;dev =3D dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;i2c =3D client;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_of_find_panel_or_bridge(dev-&gt;of_=
node, TC358775_LVDS_OUT0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
 &amp;panel, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!panel)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;panel_bridge =3D devm_drm_panel_bridge_a=
dd(dev, panel);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;panel_bridge))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(tc-&=
gt;panel_bridge);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D tc358775_parse_dt(dev-&gt;of_node, tc);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;vddio =3D devm_regulator_get(dev, &quot;=
vddio-supply&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;vddio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-=
&gt;vddio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
vddio-supply not found\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;vdd =3D devm_regulator_get(dev, &quot;vd=
d-supply&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;vdd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-=
&gt;vddio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
vdd-supply not found\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;stby_gpio =3D devm_gpiod_get(dev, &quot;=
stby&quot;, GPIOD_OUT_HIGH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;stby_gpio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-=
&gt;stby_gpio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
cannot get stby-gpio %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;reset_gpio =3D devm_gpiod_get(dev, &quot=
;reset&quot;, GPIOD_OUT_HIGH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tc-&gt;reset_gpio)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(tc-=
&gt;reset_gpio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
cannot get reset-gpios %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bridge.funcs =3D &amp;tc_bridge_funcs;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;bridge.of_node =3D dev-&gt;of_node;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_bridge_add(&amp;tc-&gt;bridge);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(client, tc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int tc_remove(struct i2c_client *client)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tc_data *tc =3D i2c_get_clientdata(clien=
t);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_bridge_remove(&amp;tc-&gt;bridge);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct i2c_device_id tc358775_i2c_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;tc358775&quot;, 0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
+};<br>
+MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);<br>
+<br>
+static const struct of_device_id tc358775_of_ids[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;toshiba,tc358775&quot;,=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
+};<br>
+MODULE_DEVICE_TABLE(of, tc358775_of_ids);<br>
+<br>
+static struct i2c_driver tc358775_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;tc3=
58775&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 tc358775_of_ids,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table =3D tc358775_i2c_ids,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D tc_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D tc_remove,<br>
+};<br>
+module_i2c_driver(tc358775_driver);<br>
+<br>
+MODULE_AUTHOR(&quot;Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.co=
m" target=3D"_blank">simhavcs@gmail.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;TC358775 DSI/LVDS bridge driver&quot;);<br>
+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
-- <br>
2.1.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--0000000000000f116605ab93bdea--

--===============1417827222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1417827222==--
