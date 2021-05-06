Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C33751C5
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 11:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CA16ECAB;
	Thu,  6 May 2021 09:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF526E516
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 09:45:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z6so4892277wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h6R60XcaAh1RrK3wtgbGD8ArXGn4dEuGm9NQAL2HozA=;
 b=bTfwixARucYHEHcITrZcc0RcJtopahZT1Xx5iPOWqqY1Qx+2CckGcvaQts958al45/
 7TJrw8gtvAo96LCICO7p66kBzjjWrTEusCcQnJwoVmnRQVgHigRcxXW/nGvwudCrkL+g
 KT/LCiMB8z2SI+Z+jPeLbkpEzUNbQRnrckRzo7/LakO9sxlmGDezq5sE/p26dF7yCt+5
 unK1mLRiUaO8PuLUCcQkdz+hheB5nsxkNQg4/Wm6NpTy3Qb/BsIns2VJj/n0MuSIJhzl
 KN9bIH94Qi0Gzdo+CEMz1QppspwMbltGs24zayIavYbqwfs04tN/tKsabGIWDfwJdws3
 9JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h6R60XcaAh1RrK3wtgbGD8ArXGn4dEuGm9NQAL2HozA=;
 b=m1sdJu8dy4EbRV7Sd32ThxPdzT8kdo1xxDp7f/8FzrvGarStuwni2yQ11XNd2EVtAO
 YnKD1NsnVnBi/Aixx0NmaIKiF7j7w0/rXUeZqKBSF7hKPXSpDgdi1FVan3Kx5BDX1nF0
 kMyyRcuIMiel0Mg6skyfl8KWAiyI6hnLRI13TmZku3BGbpHx+GRtYE+/Sc+ZTiuVtnjL
 /QPmuh82/ZIef5azCLR0ocJu5SZeUjhzAHzM4X+NSp1BKH02gHnp+WYxt0yydKlUn/Ee
 4RTbrkWV6VEiK1xogntqPqzbu1ryJw2WxNR9rM1Q7WPKwFrS67SeCjU/07po6WT1WrnK
 GmZA==
X-Gm-Message-State: AOAM532fXUARTLx6TOUK+z7omlSlOsFeNoUMEHDbTInCCvdBhm13TnX9
 AXYAqNPWJ097Xs3FHXRxDHH1tnFQTQmbc7jGgpF82g==
X-Google-Smtp-Source: ABdhPJzbp+Jgl0LH5w6JV1dobr8CVaa5l/SBZU20QUv7j8+EUMQNuMrmVof01DvFRsBh5kS2B6zpAKk69mKMAl0gFeI=
X-Received: by 2002:a5d:544d:: with SMTP id w13mr3847100wrv.273.1620294321968; 
 Thu, 06 May 2021 02:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
In-Reply-To: <20210505100218.108024-2-marex@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 6 May 2021 10:45:05 +0100
Message-ID: <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

I'm taking an interest as there are a number of Raspberry Pi users
trying to get this chip up and running (not there quite yet).
A couple of fairly minor comments

On Wed, 5 May 2021 at 11:03, Marek Vasut <marex@denx.de> wrote:
>
> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
>
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use dev_err_probe()
>     - Set REG_RC_RESET as volatile
>     - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>     - Use ctx->mode =3D *adj instead of *mode in sn65dsi83_mode_set
>     - Add tested DSI84 support in dual-link mode
>     - Correctly set VCOM
>     - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>       datasheets, with that all the reserved bits make far more sense
>       as the DSI83 and DSI84 seems to be reduced version of DSI85
> V3: - Handle the dual-link LVDS with two port panel or bridge
> ---
>  drivers/gpu/drm/bridge/Kconfig        |  10 +
>  drivers/gpu/drm/bridge/Makefile       |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 639 ++++++++++++++++++++++++++
>  3 files changed, 650 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index e83b8ad0d71b..32204c5f25b7 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -278,6 +278,16 @@ config DRM_TI_TFP410
>         help
>           Texas Instruments TFP410 DVI/HDMI Transmitter driver
>
> +config DRM_TI_SN65DSI83
> +       tristate "TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       select REGMAP_I2C
> +       select DRM_PANEL
> +       select DRM_MIPI_DSI
> +       help
> +         Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge dr=
iver
> +
>  config DRM_TI_SN65DSI86
>         tristate "TI SN65DSI86 DSI to eDP bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index b00f3b2ad572..7bb4c9df0415 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) +=3D tc358767.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358768) +=3D tc358768.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358775) +=3D tc358775.o
>  obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
> +obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> new file mode 100644
> index 000000000000..471df09a1c07
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -0,0 +1,639 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI SN65DSI83,84,85 driver
> + *
> + * Currently supported:
> + * - SN65DSI83
> + *   =3D 1x Single-link DSI ~ 1x Single-link LVDS
> + *   - Supported
> + *   - Single-link LVDS mode tested
> + * - SN65DSI84
> + *   =3D 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
> + *   - Supported
> + *   - Dual-link LVDS mode tested
> + *   - 2x Single-link LVDS mode unsupported
> + *     (should be easy to add by someone who has the HW)
> + * - SN65DSI85
> + *   =3D 2x Single-link or 1x Dual-link DSI ~ 2x Single-link or 1x Dual-=
link LVDS
> + *   - Unsupported
> + *     (should be easy to add by someone who has the HW)
> + *
> + * Copyright (C) 2021 Marek Vasut <marex@denx.de>
> + *
> + * Based on previous work of:
> + * Valentin Raevsky <valentin@compulab.co.il>
> + * Philippe Schenker <philippe.schenker@toradex.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +/* ID registers */
> +#define REG_ID(n)                              (0x00 + (n))
> +/* Reset and clock registers */
> +#define REG_RC_RESET                           0x09
> +#define  REG_RC_RESET_SOFT_RESET               BIT(0)
> +#define REG_RC_LVDS_PLL                                0x0a
> +#define  REG_RC_LVDS_PLL_PLL_EN_STAT           BIT(7)
> +#define  REG_RC_LVDS_PLL_LVDS_CLK_RANGE(n)     (((n) & 0x7) << 1)
> +#define  REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY       BIT(0)
> +#define REG_RC_DSI_CLK                         0x0b
> +#define  REG_RC_DSI_CLK_DSI_CLK_DIVIDER(n)     (((n) & 0x1f) << 3)
> +#define  REG_RC_DSI_CLK_REFCLK_MULTIPLIER(n)   ((n) & 0x3)
> +#define REG_RC_PLL_EN                          0x0d
> +#define  REG_RC_PLL_EN_PLL_EN                  BIT(0)
> +/* DSI registers */
> +#define REG_DSI_LANE                           0x10
> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL       BIT(5) /* dual or 2x sing=
le */

The bit name here seems a little odd.
Bits 5&6 are the DSI channel mode on SN65DSI85, not the LVDS link
config (which appears to be reg 0x18 bit 4)
DSI_CHANNEL_MODE
00 =E2=80=93 Dual-channel DSI receiver
01 =E2=80=93 Single channel DSI receiver (default)
10 =E2=80=93 Two single channel DSI receivers
11 =E2=80=93 Reserved
SN65DSI83 and 84 require it to be set to 01. You have that end result,
but using an odd register name that only documents one of the 2 bits.

Is it worth documenting bit 7 as being the '85 Dual DSI link
LEFT_RIGHT_PIXELS flag at the same time? The chip isn't supported in
dual DSI mode at present, but defining all the registers up front
seems reasonable.

> +#define  REG_DSI_LANE_CHA_DSI_LANES(n)         (((n) & 0x3) << 3)
> +#define  REG_DSI_LANE_CHB_DSI_LANES(n)         (((n) & 0x3) << 1)
> +#define  REG_DSI_LANE_SOT_ERR_TOL_DIS          BIT(0)
> +#define REG_DSI_EQ                             0x11
> +#define  REG_DSI_EQ_CHA_DSI_DATA_EQ(n)         (((n) & 0x3) << 6)
> +#define  REG_DSI_EQ_CHA_DSI_CLK_EQ(n)          (((n) & 0x3) << 2)
> +#define REG_DSI_CLK                            0x12
> +#define  REG_DSI_CLK_CHA_DSI_CLK_RANGE(n)      ((n) & 0xff)
> +/* LVDS registers */
> +#define REG_LVDS_FMT                           0x18
> +#define  REG_LVDS_FMT_DE_NEG_POLARITY          BIT(7)
> +#define  REG_LVDS_FMT_HS_NEG_POLARITY          BIT(6)
> +#define  REG_LVDS_FMT_VS_NEG_POLARITY          BIT(5)
> +#define  REG_LVDS_FMT_LVDS_LINK_CFG            BIT(4)  /* 0:AB 1:A-only =
*/
> +#define  REG_LVDS_FMT_CHA_24BPP_MODE           BIT(3)
> +#define  REG_LVDS_FMT_CHB_24BPP_MODE           BIT(2)
> +#define  REG_LVDS_FMT_CHA_24BPP_FORMAT1                BIT(1)
> +#define  REG_LVDS_FMT_CHB_24BPP_FORMAT1                BIT(0)
> +#define REG_LVDS_VCOM                          0x19
> +#define  REG_LVDS_VCOM_CHA_LVDS_VOCM           BIT(6)
> +#define  REG_LVDS_VCOM_CHB_LVDS_VOCM           BIT(4)
> +#define  REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(n)   (((n) & 0x3) << 2)
> +#define  REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(n)   ((n) & 0x3)
> +#define REG_LVDS_LANE                          0x1a
> +#define  REG_LVDS_LANE_EVEN_ODD_SWAP           BIT(6)
> +#define  REG_LVDS_LANE_CHA_REVERSE_LVDS                BIT(5)
> +#define  REG_LVDS_LANE_CHB_REVERSE_LVDS                BIT(4)
> +#define  REG_LVDS_LANE_CHA_LVDS_TERM           BIT(1)
> +#define  REG_LVDS_LANE_CHB_LVDS_TERM           BIT(0)
> +#define REG_LVDS_CM                            0x1b
> +#define  REG_LVDS_CM_CHA_LVDS_CM_ADJUST(n)     (((n) & 0x3) << 4)
> +#define  REG_LVDS_CM_CHB_LVDS_CM_ADJUST(n)     ((n) & 0x3)
> +/* Video registers */
> +#define REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW     0x20
> +#define REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH    0x21
> +#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW  0x24
> +#define REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH 0x25
> +#define REG_VID_CHA_SYNC_DELAY_LOW             0x28
> +#define REG_VID_CHA_SYNC_DELAY_HIGH            0x29
> +#define REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW      0x2c
> +#define REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH     0x2d
> +#define REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW      0x30
> +#define REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH     0x31
> +#define REG_VID_CHA_HORIZONTAL_BACK_PORCH      0x34
> +#define REG_VID_CHA_VERTICAL_BACK_PORCH                0x36
> +#define REG_VID_CHA_HORIZONTAL_FRONT_PORCH     0x38
> +#define REG_VID_CHA_VERTICAL_FRONT_PORCH       0x3a
> +#define REG_VID_CHA_TEST_PATTERN               0x3c
> +/* IRQ registers */
> +#define REG_IRQ_GLOBAL                         0xe0
> +#define  REG_IRQ_GLOBAL_IRQ_EN                 BIT(0)
> +#define REG_IRQ_EN                             0xe1
> +#define  REG_IRQ_EN_CHA_SYNCH_ERR_EN           BIT(7)
> +#define  REG_IRQ_EN_CHA_CRC_ERR_EN             BIT(6)
> +#define  REG_IRQ_EN_CHA_UNC_ECC_ERR_EN         BIT(5)
> +#define  REG_IRQ_EN_CHA_COR_ECC_ERR_EN         BIT(4)
> +#define  REG_IRQ_EN_CHA_LLP_ERR_EN             BIT(3)
> +#define  REG_IRQ_EN_CHA_SOT_BIT_ERR_EN         BIT(2)
> +#define  REG_IRQ_EN_CHA_PLL_UNLOCK_EN          BIT(0)
> +#define REG_IRQ_STAT                           0xe5
> +#define  REG_IRQ_STAT_CHA_SYNCH_ERR            BIT(7)
> +#define  REG_IRQ_STAT_CHA_CRC_ERR              BIT(6)
> +#define  REG_IRQ_STAT_CHA_UNC_ECC_ERR          BIT(5)
> +#define  REG_IRQ_STAT_CHA_COR_ECC_ERR          BIT(4)
> +#define  REG_IRQ_STAT_CHA_LLP_ERR              BIT(3)
> +#define  REG_IRQ_STAT_CHA_SOT_BIT_ERR          BIT(2)
> +#define  REG_IRQ_STAT_CHA_PLL_UNLOCK           BIT(0)
> +
> +enum sn65dsi83_model {
> +       MODEL_SN65DSI83,
> +       MODEL_SN65DSI84,
> +};
> +
> +struct sn65dsi83 {
> +       struct drm_bridge               bridge;
> +       struct drm_display_mode         mode;
> +       struct device                   *dev;
> +       struct regmap                   *regmap;
> +       struct device_node              *host_node;
> +       struct mipi_dsi_device          *dsi;
> +       struct drm_bridge               *panel_bridge;
> +       struct gpio_desc                *enable_gpio;
> +       int                             dsi_lanes;
> +       bool                            lvds_dual_link;
> +       bool                            lvds_dual_link_even_odd_swap;
> +};
> +
> +static const struct regmap_range sn65dsi83_readable_ranges[] =3D {
> +       regmap_reg_range(REG_ID(0), REG_ID(8)),
> +       regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_DSI_CLK),
> +       regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
> +       regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
> +       regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
> +       regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +                        REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +                        REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
> +       regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
> +                        REG_VID_CHA_SYNC_DELAY_HIGH),
> +       regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +                        REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +                        REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +                        REG_VID_CHA_HORIZONTAL_BACK_PORCH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
> +                        REG_VID_CHA_VERTICAL_BACK_PORCH),
> +       regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +                        REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +                        REG_VID_CHA_VERTICAL_FRONT_PORCH),
> +       regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTE=
RN),
> +       regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_readable_table =3D {
> +       .yes_ranges =3D sn65dsi83_readable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_readable_ranges),
> +};
> +
> +static const struct regmap_range sn65dsi83_writeable_ranges[] =3D {
> +       regmap_reg_range(REG_RC_RESET, REG_RC_DSI_CLK),
> +       regmap_reg_range(REG_RC_PLL_EN, REG_RC_PLL_EN),
> +       regmap_reg_range(REG_DSI_LANE, REG_DSI_CLK),
> +       regmap_reg_range(REG_LVDS_FMT, REG_LVDS_CM),
> +       regmap_reg_range(REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
> +                        REG_VID_CHA_ACTIVE_LINE_LENGTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
> +                        REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH),
> +       regmap_reg_range(REG_VID_CHA_SYNC_DELAY_LOW,
> +                        REG_VID_CHA_SYNC_DELAY_HIGH),
> +       regmap_reg_range(REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +                        REG_VID_CHA_HSYNC_PULSE_WIDTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +                        REG_VID_CHA_VSYNC_PULSE_WIDTH_HIGH),
> +       regmap_reg_range(REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +                        REG_VID_CHA_HORIZONTAL_BACK_PORCH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_BACK_PORCH,
> +                        REG_VID_CHA_VERTICAL_BACK_PORCH),
> +       regmap_reg_range(REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +                        REG_VID_CHA_HORIZONTAL_FRONT_PORCH),
> +       regmap_reg_range(REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +                        REG_VID_CHA_VERTICAL_FRONT_PORCH),
> +       regmap_reg_range(REG_VID_CHA_TEST_PATTERN, REG_VID_CHA_TEST_PATTE=
RN),
> +       regmap_reg_range(REG_IRQ_GLOBAL, REG_IRQ_EN),
> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_writeable_table =3D {
> +       .yes_ranges =3D sn65dsi83_writeable_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_writeable_ranges),
> +};
> +
> +static const struct regmap_range sn65dsi83_volatile_ranges[] =3D {
> +       regmap_reg_range(REG_RC_RESET, REG_RC_RESET),
> +       regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_LVDS_PLL),
> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> +};
> +
> +static const struct regmap_access_table sn65dsi83_volatile_table =3D {
> +       .yes_ranges =3D sn65dsi83_volatile_ranges,
> +       .n_yes_ranges =3D ARRAY_SIZE(sn65dsi83_volatile_ranges),
> +};
> +
> +static const struct regmap_config sn65dsi83_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .rd_table =3D &sn65dsi83_readable_table,
> +       .wr_table =3D &sn65dsi83_writeable_table,
> +       .volatile_table =3D &sn65dsi83_volatile_table,
> +       .cache_type =3D REGCACHE_RBTREE,
> +       .max_register =3D REG_IRQ_STAT,
> +};
> +
> +static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct sn65dsi83, bridge);
> +}
> +
> +static int sn65dsi83_attach(struct drm_bridge *bridge,
> +                           enum drm_bridge_attach_flags flags)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +       struct device *dev =3D ctx->dev;
> +       struct mipi_dsi_device *dsi;
> +       struct mipi_dsi_host *host;
> +       int ret =3D 0;
> +
> +       const struct mipi_dsi_device_info info =3D {
> +               .type =3D "sn65dsi83",
> +               .channel =3D 0,
> +               .node =3D NULL,
> +       };
> +
> +       host =3D of_find_mipi_dsi_host_by_node(ctx->host_node);
> +       if (!host) {
> +               dev_err(dev, "failed to find dsi host\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       dsi =3D mipi_dsi_device_register_full(host, &info);
> +       if (IS_ERR(dsi)) {
> +               return dev_err_probe(dev, PTR_ERR(dsi),
> +                                    "failed to create dsi device\n");
> +       }
> +
> +       ctx->dsi =3D dsi;
> +
> +       dsi->lanes =3D ctx->dsi_lanes;
> +       dsi->format =3D MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BUR=
ST;
> +
> +       ret =3D mipi_dsi_attach(dsi);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to attach dsi to host\n");
> +               goto err_dsi_attach;
> +       }
> +
> +       return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> +                                &ctx->bridge, flags);
> +
> +err_dsi_attach:
> +       mipi_dsi_device_unregister(dsi);
> +       return ret;
> +}
> +
> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +       /*
> +        * Reset the chip, pull EN line low for t_reset=3D10ms,
> +        * then high for t_en=3D1ms.
> +        */
> +       regcache_mark_dirty(ctx->regmap);
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +       usleep_range(10000, 11000);
> +       gpiod_set_value(ctx->enable_gpio, 1);
> +       usleep_range(1000, 1100);
> +}

Whilst section 6.6 of the SN65DSI84 datasheet does list t_en as 1ms,
the initialization sequence listed in table 7.2 states
Init seq 3 - Set EN pin to Low
Wait 10 ms
Init seq 4 - Tie EN pin to High
Wait 10 ms

with the note that these are "Minimum recommended delay. It is fine to
exceed these."

Have you had alternate guidance from TI over that delay?

> +
> +static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx)
> +{
> +       /*
> +        * The encoding of the LVDS_CLK_RANGE is as follows:
> +        * 000 - 25 MHz <=3D LVDS_CLK < 37.5 MHz
> +        * 001 - 37.5 MHz <=3D LVDS_CLK < 62.5 MHz
> +        * 010 - 62.5 MHz <=3D LVDS_CLK < 87.5 MHz
> +        * 011 - 87.5 MHz <=3D LVDS_CLK < 112.5 MHz
> +        * 100 - 112.5 MHz <=3D LVDS_CLK < 137.5 MHz
> +        * 101 - 137.5 MHz <=3D LVDS_CLK <=3D 154 MHz
> +        * which is a range of 12.5MHz..162.5MHz in 50MHz steps, except t=
hat
> +        * the ends of the ranges are clamped to the supported range. Sin=
ce
> +        * sn65dsi83_mode_valid() already filters the valid modes and lim=
its
> +        * the clock to 25..154 MHz, the range calculation can be simplif=
ied
> +        * as follows:
> +        */
> +       int mode_clock =3D ctx->mode.clock;
> +
> +       if (ctx->lvds_dual_link)
> +               mode_clock /=3D 2;
> +
> +       return (mode_clock - 12500) / 25000;
> +}
> +
> +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
> +{
> +       /*
> +        * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> +        * 0x00 through 0x07 - Reserved
> +        * 0x08 - 40 <=3D DSI_CLK < 45 MHz
> +        * 0x09 - 45 <=3D DSI_CLK < 50 MHz
> +        * ...
> +        * 0x63 - 495 <=3D DSI_CLK < 500 MHz
> +        * 0x64 - 500 MHz
> +        * 0x65 through 0xFF - Reserved
> +        * which is DSI clock in 5 MHz steps, clamped to 40..500 MHz.
> +        * The DSI clock are calculated as:
> +        *  DSI_CLK =3D mode clock * bpp / dsi_data_lanes / 2
> +        * the 2 is there because the bus is DDR.
> +        */
> +       return DIV_ROUND_UP(clamp((unsigned int)ctx->mode.clock *
> +                           mipi_dsi_pixel_format_to_bpp(ctx->dsi->format=
) /
> +                           ctx->dsi_lanes / 2, 40000U, 500000U), 5000U);
> +}
> +
> +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> +{
> +       /* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> +       unsigned int dsi_div =3D mipi_dsi_pixel_format_to_bpp(ctx->dsi->f=
ormat);
> +
> +       dsi_div /=3D ctx->dsi_lanes;
> +
> +       if (!ctx->lvds_dual_link)
> +               dsi_div /=3D 2;
> +
> +       return dsi_div - 1;
> +}
> +
> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +       unsigned int pval;
> +       u16 val;
> +       int ret;
> +
> +       /* Clear reset, disable PLL */
> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +
> +       /* Reference clock derived from DSI link clock. */
> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(c=
tx)) |
> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);

(Checkpatch whinge for "Alignment should match open parenthesis" on
several lines through this function)

  Dave

> +       regmap_write(ctx->regmap, REG_DSI_CLK,
> +               REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx=
)));
> +       regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> +               REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)=
));
> +
> +       /* Set number of DSI lanes and LVDS link config. */
> +       regmap_write(ctx->regmap, REG_DSI_LANE,
> +               REG_DSI_LANE_LVDS_LINK_CFG_DUAL |
> +               REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
> +               /* CHB is DSI85-only, set to default on DSI83/DSI84 */
> +               REG_DSI_LANE_CHB_DSI_LANES(3));
> +       /* No equalization. */
> +       regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
> +
> +       /* RGB888 is the only format supported so far. */
> +       val =3D (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
> +              REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
> +             (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
> +              REG_LVDS_FMT_VS_NEG_POLARITY : 0) |
> +             REG_LVDS_FMT_CHA_24BPP_MODE;
> +       if (ctx->lvds_dual_link)
> +               val |=3D REG_LVDS_FMT_CHB_24BPP_MODE;
> +       else
> +               val |=3D REG_LVDS_FMT_LVDS_LINK_CFG;
> +
> +       regmap_write(ctx->regmap, REG_LVDS_FMT, val);
> +       regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
> +       regmap_write(ctx->regmap, REG_LVDS_LANE,
> +               (ctx->lvds_dual_link_even_odd_swap ?
> +                REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
> +               REG_LVDS_LANE_CHA_LVDS_TERM |
> +               REG_LVDS_LANE_CHB_LVDS_TERM);
> +       regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
> +
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW=
,
> +                         &ctx->mode.hdisplay, 2);
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_=
LOW,
> +                         &ctx->mode.vdisplay, 2);
> +       val =3D 32 + 1;   /* 32 + 1 pixel clock to ensure proper operatio=
n */
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, =
2);
> +       val =3D ctx->mode.hsync_end - ctx->mode.hsync_start;
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
> +                         &val, 2);
> +       val =3D ctx->mode.vsync_end - ctx->mode.vsync_start;
> +       regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
> +                         &val, 2);
> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> +                    ctx->mode.htotal - ctx->mode.hsync_end);
> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
> +                    ctx->mode.vtotal - ctx->mode.vsync_end);
> +       regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
> +                    ctx->mode.hsync_start - ctx->mode.hdisplay);
> +       regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
> +                    ctx->mode.vsync_start - ctx->mode.vdisplay);
> +       regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
> +
> +       /* Enable PLL */
> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
> +       usleep_range(3000, 4000);
> +       ret =3D regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pv=
al,
> +                                       pval & REG_RC_LVDS_PLL_PLL_EN_STA=
T,
> +                                       1000, 100000);
> +       if (ret) {
> +               dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret);
> +               /* On failure, disable PLL again and exit. */
> +               regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +               return;
> +       }
> +
> +       /* Trigger reset after CSR register update. */
> +       regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
> +
> +       /* Clear all errors that got asserted during initialization. */
> +       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> +       regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> +}
> +
> +static void sn65dsi83_disable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +       /* Clear reset, disable PLL */
> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> +}
> +
> +static void sn65dsi83_post_disable(struct drm_bridge *bridge)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +       /* Put the chip in reset, pull EN line low. */
> +       gpiod_set_value(ctx->enable_gpio, 0);
> +}
> +
> +static enum drm_mode_status
> +sn65dsi83_mode_valid(struct drm_bridge *bridge,
> +                    const struct drm_display_info *info,
> +                    const struct drm_display_mode *mode)
> +{
> +       /* LVDS output clock range 25..154 MHz */
> +       if (mode->clock < 25000)
> +               return MODE_CLOCK_LOW;
> +       if (mode->clock > 154000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static void sn65dsi83_mode_set(struct drm_bridge *bridge,
> +                              const struct drm_display_mode *mode,
> +                              const struct drm_display_mode *adj)
> +{
> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +
> +       ctx->mode =3D *adj;
> +}
> +
> +static const struct drm_bridge_funcs sn65dsi83_funcs =3D {
> +       .attach         =3D sn65dsi83_attach,
> +       .pre_enable     =3D sn65dsi83_pre_enable,
> +       .enable         =3D sn65dsi83_enable,
> +       .disable        =3D sn65dsi83_disable,
> +       .post_disable   =3D sn65dsi83_post_disable,
> +       .mode_valid     =3D sn65dsi83_mode_valid,
> +       .mode_set       =3D sn65dsi83_mode_set,
> +};
> +
> +static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_mode=
l model)
> +{
> +       struct drm_bridge *panel_bridge;
> +       struct device *dev =3D ctx->dev;
> +       struct device_node *endpoint;
> +       struct drm_panel *panel;
> +       int ret;
> +
> +       endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +       ctx->dsi_lanes =3D of_property_count_u32_elems(endpoint, "data-la=
nes");
> +       ctx->host_node =3D of_graph_get_remote_port_parent(endpoint);
> +       of_node_put(endpoint);
> +
> +       if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4)
> +               return -EINVAL;
> +       if (!ctx->host_node)
> +               return -ENODEV;
> +
> +       ctx->lvds_dual_link =3D false;
> +       ctx->lvds_dual_link_even_odd_swap =3D false;
> +       if (model !=3D MODEL_SN65DSI83) {
> +               struct device_node *port2, *port3;
> +               int dual_link;
> +
> +               port2 =3D of_graph_get_port_by_id(dev->of_node, 2);
> +               port3 =3D of_graph_get_port_by_id(dev->of_node, 3);
> +               dual_link =3D drm_of_lvds_get_dual_link_pixel_order(port2=
, port3);
> +               of_node_put(port2);
> +               of_node_put(port3);
> +
> +               if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) =
{
> +                       ctx->lvds_dual_link =3D true;
> +                       /* Odd pixels to LVDS Channel A, even pixels to B=
 */
> +                       ctx->lvds_dual_link_even_odd_swap =3D false;
> +               } else if (dual_link =3D=3D DRM_LVDS_DUAL_LINK_EVEN_ODD_P=
IXELS) {
> +                       ctx->lvds_dual_link =3D true;
> +                       /* Even pixels to LVDS Channel A, odd pixels to B=
 */
> +                       ctx->lvds_dual_link_even_odd_swap =3D true;
> +               }
> +       }
> +
> +       ret =3D drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, &=
panel_bridge);
> +       if (ret < 0)
> +               return ret;
> +       if (panel) {
> +               panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +               if (IS_ERR(panel_bridge))
> +                       return PTR_ERR(panel_bridge);
> +       }
> +
> +       ctx->panel_bridge =3D panel_bridge;
> +
> +       return 0;
> +}
> +
> +static int sn65dsi83_probe(struct i2c_client *client,
> +                          const struct i2c_device_id *id)
> +{
> +       struct device *dev =3D &client->dev;
> +       enum sn65dsi83_model model;
> +       struct sn65dsi83 *ctx;
> +       int ret;
> +
> +       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->dev =3D dev;
> +
> +       if (dev->of_node)
> +               model =3D (enum sn65dsi83_model)of_device_get_match_data(=
dev);
> +       else
> +               model =3D id->driver_data;
> +
> +       ctx->enable_gpio =3D devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT=
_LOW);
> +       if (IS_ERR(ctx->enable_gpio))
> +               return PTR_ERR(ctx->enable_gpio);
> +
> +       ret =3D sn65dsi83_parse_dt(ctx, model);
> +       if (ret)
> +               return ret;
> +
> +       ctx->regmap =3D devm_regmap_init_i2c(client, &sn65dsi83_regmap_co=
nfig);
> +       if (IS_ERR(ctx->regmap))
> +               return PTR_ERR(ctx->regmap);
> +
> +       dev_set_drvdata(dev, ctx);
> +       i2c_set_clientdata(client, ctx);
> +
> +       ctx->bridge.funcs =3D &sn65dsi83_funcs;
> +       ctx->bridge.of_node =3D dev->of_node;
> +       drm_bridge_add(&ctx->bridge);
> +
> +       return 0;
> +}
> +
> +static int sn65dsi83_remove(struct i2c_client *client)
> +{
> +       struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
> +
> +       mipi_dsi_detach(ctx->dsi);
> +       mipi_dsi_device_unregister(ctx->dsi);
> +       drm_bridge_remove(&ctx->bridge);
> +       of_node_put(ctx->host_node);
> +
> +       return 0;
> +}
> +
> +static struct i2c_device_id sn65dsi83_id[] =3D {
> +       { "ti,sn65dsi83", MODEL_SN65DSI83 },
> +       { "ti,sn65dsi84", MODEL_SN65DSI84 },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(i2c, sn65dsi83_id);
> +
> +static const struct of_device_id sn65dsi83_match_table[] =3D {
> +       { .compatible =3D "ti,sn65dsi83", .data =3D (void *)MODEL_SN65DSI=
83 },
> +       { .compatible =3D "ti,sn65dsi84", .data =3D (void *)MODEL_SN65DSI=
84 },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
> +
> +static struct i2c_driver sn65dsi83_driver =3D {
> +       .probe =3D sn65dsi83_probe,
> +       .remove =3D sn65dsi83_remove,
> +       .id_table =3D sn65dsi83_id,
> +       .driver =3D {
> +               .name =3D "sn65dsi83",
> +               .of_match_table =3D sn65dsi83_match_table,
> +       },
> +};
> +module_i2c_driver(sn65dsi83_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("TI SN65DSI83 DSI to LVDS bridge driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
