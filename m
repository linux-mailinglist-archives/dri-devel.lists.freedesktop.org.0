Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4511A32B5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 12:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B616E0D6;
	Thu,  9 Apr 2020 10:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C056E0D6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 10:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A50B3FB03;
 Thu,  9 Apr 2020 12:43:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sei8b7OkUWkc; Thu,  9 Apr 2020 12:43:14 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B1D57400E9; Thu,  9 Apr 2020 12:43:14 +0200 (CEST)
Date: Thu, 9 Apr 2020 12:43:14 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 2/2] drm/bridge: Add NWL MIPI DSI host controller
 support
Message-ID: <20200409104314.GB104945@bogon.m.sigxcpu.org>
References: <cover.1584730033.git.agx@sigxcpu.org>
 <22f34fb7cf7ee4262cf63372aee90bc8e5ae3f35.1584730033.git.agx@sigxcpu.org>
 <20200408175252.GB24828@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408175252.GB24828@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
Thanks for having a look! Comments below:

On Wed, Apr 08, 2020 at 07:52:52PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Fri, Mar 20, 2020 at 07:49:10PM +0100, Guido G=FCnther wrote:
> > This adds initial support for the NWL MIPI DSI Host controller found on
> > i.MX8 SoCs.
> > =

> > It adds support for the i.MX8MQ but the same IP can be found on
> > e.g. the i.MX8QXP.
> > =

> > It has been tested on the Librem 5 devkit using mxsfb.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > Co-developed-by: Robert Chiras <robert.chiras@nxp.com>
> > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > Tested-by: Robert Chiras <robert.chiras@nxp.com>
> > Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> =

> I took an extra look at the driver (procastinating).
> checkpatch (--strict):
> -:511: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
> #511: FILE: drivers/gpu/drm/bridge/nwl-dsi.c:442:
> +			DRM_DEV_ERROR(
> =

> -:671: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "msg=
->rx_buf"
> #671: FILE: drivers/gpu/drm/bridge/nwl-dsi.c:602:
> +	    msg->rx_len > 0 && msg->rx_buf !=3D NULL)
> =

> -:868: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
> #868: FILE: drivers/gpu/drm/bridge/nwl-dsi.c:799:
> +	ret =3D phy_mipi_dphy_get_default_config(
> =

> -:1021: WARNING:RETURN_VOID: void function return statements are not gene=
rally useful
> #1021: FILE: drivers/gpu/drm/bridge/nwl-dsi.c:952:
> +	return;
> +}
> =

> -:1067: CHECK:LINE_SPACING: Please don't use multiple blank lines
> #1067: FILE: drivers/gpu/drm/bridge/nwl-dsi.c:998:
> +
> +

All fixed.

> =

> A few more details below.
> =

> 	Sam
> =

> =

> > ---
> >  drivers/gpu/drm/bridge/Kconfig   |   16 +
> >  drivers/gpu/drm/bridge/Makefile  |    1 +
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 1218 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/nwl-dsi.h |  144 ++++
> >  4 files changed, 1379 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.c
> >  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.h
> > =

> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index aaed2347ace9..6ec945f837b8 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -58,6 +58,22 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
> >  	  to DP++. This is used with the i.MX6 imx-ldb
> >  	  driver. You are likely to say N here.
> >  =

> > +config DRM_NWL_MIPI_DSI
> > +	tristate "Northwest Logic MIPI DSI Host controller"
> > +	depends on DRM
> > +	depends on COMMON_CLK
> > +	depends on OF && HAS_IOMEM
> > +	select DRM_KMS_HELPER
> > +	select DRM_MIPI_DSI
> > +	select DRM_PANEL_BRIDGE
> > +	select GENERIC_PHY_MIPI_DPHY
> > +	select MFD_SYSCON
> > +	select MULTIPLEXER
> > +	select REGMAP_MMIO
> > +	help
> > +	  This enables the Northwest Logic MIPI DSI Host controller as
> > +	  for example found on NXP's i.MX8 Processors.
> > +
> >  config DRM_NXP_PTN3460
> >  	tristate "NXP PTN3460 DP/LVDS bridge"
> >  	depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/M=
akefile
> > index 6fb062b5b0f0..b04ac2dfa22c 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
> >  obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
> >  obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
> >  obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
> > +obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
> >  =

> >  obj-y +=3D analogix/
> >  obj-y +=3D synopsys/
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/=
nwl-dsi.c
> > new file mode 100644
> > index 000000000000..12d1c5548e2d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -0,0 +1,1218 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * i.MX8 NWL MIPI DSI host driver
> > + *
> > + * Copyright (C) 2017 NXP
> > + * Copyright (C) 2020 Purism SPC
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/irq.h>
> > +#include <linux/math64.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/mux/consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +#include <linux/sys_soc.h>
> > +#include <linux/time64.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> Header file is not used - drop
> =

> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> =

> > +#include <drm/drm_probe_helper.h>
> Header file is not used - drop
> > +
> > +#include <video/mipi_display.h>
> =

> > +#include <video/videomode.h>
> Header file not used

All dropped. Thanks!

> =

> > +
> > +#include "nwl-dsi.h"
> > +
> > +#define DRV_NAME "nwl-dsi"
> > +
> > +/* i.MX8 NWL quirks */
> > +/* i.MX8MQ errata E11418 */
> > +#define E11418_HS_MODE_QUIRK	BIT(0)
> > +
> > +#define NWL_DSI_MIPI_FIFO_TIMEOUT msecs_to_jiffies(500)
> Should the defines be moved to the header file?

I've used this rules: register layout (that is chip properties)
go to the header file while defines specific to this very driver
go into the .c file. Hope that makes sense.

> > +
> > +enum transfer_direction {
> > +	DSI_PACKET_SEND,
> > +	DSI_PACKET_RECEIVE,
> > +};
> > +
> > +#define NWL_DSI_ENDPOINT_LCDIF 0
> > +#define NWL_DSI_ENDPOINT_DCSS 1
> > +
> > +struct nwl_dsi_plat_clk_config {
> > +	const char *id;
> > +	struct clk *clk;
> > +	bool present;
> > +};
> > +
> > +struct nwl_dsi_transfer {
> > +	const struct mipi_dsi_msg *msg;
> > +	struct mipi_dsi_packet packet;
> > +	struct completion completed;
> > +
> > +	int status; /* status of transmission */
> > +	enum transfer_direction direction;
> > +	bool need_bta;
> > +	u8 cmd;
> > +	u16 rx_word_count;
> > +	size_t tx_len; /* in bytes */
> > +	size_t rx_len; /* in bytes */
> > +};
> > +
> > +struct nwl_dsi {
> > +	struct drm_bridge bridge;
> > +	struct mipi_dsi_host dsi_host;
> > +	struct drm_bridge *panel_bridge;
> > +	struct device *dev;
> > +	struct phy *phy;
> > +	union phy_configure_opts phy_cfg;
> > +	unsigned int quirks;
> > +
> > +	struct regmap *regmap;
> > +	int irq;
> > +	/*
> > +	 * The DSI host controller needs this reset sequence according to NWL:
> > +	 * 1. Deassert pclk reset to get access to DSI regs
> > +	 * 2. Configure DSI Host and DPHY and enable DPHY
> > +	 * 3. Deassert ESC and BYTE resets to allow host TX operations)
> > +	 * 4. Send DSI cmds to configure peripheral (handled by panel drv)
> > +	 * 5. Deassert DPI reset so DPI receives pixels and starts sending
> > +	 *    DSI data
> > +	 *
> > +	 * TODO: Since panel_bridges do their DSI setup in enable we
> > +	 * currently have 4. and 5. swapped.
> > +	 */
> > +	struct reset_control *rst_byte;
> > +	struct reset_control *rst_esc;
> > +	struct reset_control *rst_dpi;
> > +	struct reset_control *rst_pclk;
> > +	struct mux_control *mux;
> > +
> > +	/* DSI clocks */
> > +	struct clk *phy_ref_clk;
> > +	struct clk *rx_esc_clk;
> > +	struct clk *tx_esc_clk;
> > +	struct clk *core_clk;
> > +	/*
> > +	 * hardware bug: the i.MX8MQ needs this clock on during reset
> > +	 * even when not using LCDIF.
> > +	 */
> > +	struct clk *lcdif_clk;
> > +
> > +	/* dsi lanes */
> > +	u32 lanes;
> > +	enum mipi_dsi_pixel_format format;
> > +	struct drm_display_mode mode;
> > +	unsigned long dsi_mode_flags;
> > +	int error;
> > +
> > +	struct nwl_dsi_transfer *xfer;
> > +};
> > +
> > +static const struct regmap_config nwl_dsi_regmap_config =3D {
> > +	.reg_bits =3D 16,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +	.max_register =3D NWL_DSI_IRQ_MASK2,
> > +	.name =3D DRV_NAME,
> > +};
> > +
> > +static inline struct nwl_dsi *bridge_to_dsi(struct drm_bridge *bridge)
> > +{
> > +	return container_of(bridge, struct nwl_dsi, bridge);
> > +}
> > +
> > +static int nwl_dsi_clear_error(struct nwl_dsi *dsi)
> > +{
> > +	int ret =3D dsi->error;
> > +
> > +	dsi->error =3D 0;
> > +	return ret;
> > +}
> > +
> > +static void nwl_dsi_write(struct nwl_dsi *dsi, unsigned int reg, u32 v=
al)
> > +{
> > +	int ret;
> > +
> > +	if (dsi->error)
> > +		return;
> > +
> > +	ret =3D regmap_write(dsi->regmap, reg, val);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev,
> > +			      "Failed to write NWL DSI reg 0x%x: %d\n", reg,
> > +			      ret);
> > +		dsi->error =3D ret;
> > +	}
> > +}
> > +
> > +static u32 nwl_dsi_read(struct nwl_dsi *dsi, u32 reg)
> > +{
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	if (dsi->error)
> > +		return 0;
> > +
> > +	ret =3D regmap_read(dsi->regmap, reg, &val);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to read NWL DSI reg 0x%x: %d\n",
> > +			      reg, ret);
> > +		dsi->error =3D ret;
> > +	}
> > +	return val;
> > +}
> > +
> > +static int nwl_dsi_get_dpi_pixel_format(enum mipi_dsi_pixel_format for=
mat)
> > +{
> > +	switch (format) {
> > +	case MIPI_DSI_FMT_RGB565:
> > +		return NWL_DSI_PIXEL_FORMAT_16;
> > +	case MIPI_DSI_FMT_RGB666:
> > +		return NWL_DSI_PIXEL_FORMAT_18L;
> > +	case MIPI_DSI_FMT_RGB666_PACKED:
> > +		return NWL_DSI_PIXEL_FORMAT_18;
> > +	case MIPI_DSI_FMT_RGB888:
> > +		return NWL_DSI_PIXEL_FORMAT_24;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +/*
> > + * ps2bc - Picoseconds to byte clock cycles
> > + */
> > +static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
> > +{
> > +	u32 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +	return DIV64_U64_ROUND_UP(ps * dsi->mode.clock * bpp,
> > +				  dsi->lanes * 8 * NSEC_PER_SEC);
> > +}
> > +
> > +/*
> > + * ui2bc - UI time periods to byte clock cycles
> > + */
> > +static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
> > +{
> > +	u32 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
> > +				  dsi->mode.clock * 1000 * bpp);
> > +}
> > +
> > +/*
> > + * us2bc - micro seconds to lp clock cycles
> > + */
> > +static u32 us2lp(u32 lp_clk_rate, unsigned long us)
> > +{
> > +	return DIV_ROUND_UP(us * lp_clk_rate, USEC_PER_SEC);
> > +}
> > +
> > +static int nwl_dsi_config_host(struct nwl_dsi *dsi)
> > +{
> > +	u32 cycles;
> > +	struct phy_configure_opts_mipi_dphy *cfg =3D &dsi->phy_cfg.mipi_dphy;
> > +
> > +	if (dsi->lanes < 1 || dsi->lanes > 4)
> > +		return -EINVAL;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "DSI Lanes %d\n", dsi->lanes);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_NUM_LANES, dsi->lanes - 1);
> > +
> > +	if (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> > +		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x01);
> > +		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x01);
> > +	} else {
> > +		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x00);
> > +		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x00);
> > +	}
> > +
> > +	/* values in byte clock cycles */
> > +	cycles =3D ui2bc(dsi, cfg->clk_pre);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_pre: 0x%x\n", cycles);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_T_PRE, cycles);
> > +	cycles =3D ps2bc(dsi, cfg->lpx + cfg->clk_prepare + cfg->clk_zero);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap (pre): 0x%x\n", cycles);
> > +	cycles +=3D ui2bc(dsi, cfg->clk_pre);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_post: 0x%x\n", cycles);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_T_POST, cycles);
> > +	cycles =3D ps2bc(dsi, cfg->hs_exit);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap: 0x%x\n", cycles);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_TX_GAP, cycles);
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_EXTRA_CMDS_AFTER_EOTP, 0x01);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_HTX_TO_COUNT, 0x00);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_LRX_H_TO_COUNT, 0x00);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_BTA_H_TO_COUNT, 0x00);
> > +	/* In LP clock cycles */
> > +	cycles =3D us2lp(cfg->lp_clk_rate, cfg->wakeup);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_twakeup: 0x%x\n", cycles);
> > +	nwl_dsi_write(dsi, NWL_DSI_CFG_TWAKEUP, cycles);
> > +
> > +	return nwl_dsi_clear_error(dsi);
> > +}
> > +
> > +static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
> > +{
> > +	u32 mode;
> > +	int color_format;
> > +	bool burst_mode;
> > +	int hfront_porch, hback_porch, vfront_porch, vback_porch;
> > +	int hsync_len, vsync_len;
> > +
> > +	hfront_porch =3D dsi->mode.hsync_start - dsi->mode.hdisplay;
> > +	hsync_len =3D dsi->mode.hsync_end - dsi->mode.hsync_start;
> > +	hback_porch =3D dsi->mode.htotal - dsi->mode.hsync_end;
> > +
> > +	vfront_porch =3D dsi->mode.vsync_start - dsi->mode.vdisplay;
> > +	vsync_len =3D dsi->mode.vsync_end - dsi->mode.vsync_start;
> > +	vback_porch =3D dsi->mode.vtotal - dsi->mode.vsync_end;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hfront_porch =3D %d\n", hfront_porch);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hback_porch =3D %d\n", hback_porch);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hsync_len =3D %d\n", hsync_len);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hdisplay =3D %d\n", dsi->mode.hdispla=
y);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vfront_porch =3D %d\n", vfront_porch);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vback_porch =3D %d\n", vback_porch);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vsync_len =3D %d\n", vsync_len);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "vactive =3D %d\n", dsi->mode.vdisplay=
);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "clock =3D %d kHz\n", dsi->mode.clock);
> > +
> > +	color_format =3D nwl_dsi_get_dpi_pixel_format(dsi->format);
> > +	if (color_format < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Invalid color format 0x%x\n",
> > +			      dsi->format);
> > +		return color_format;
> > +	}
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "pixel fmt =3D %d\n", dsi->format);
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT=
);
> > +	nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
> > +	/*
> > +	 * Adjusting input polarity based on the video mode results in
> > +	 * a black screen so always pick active low:
> > +	 */
> > +	nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
> > +		      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
> > +	nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
> > +		      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
> > +
> > +	burst_mode =3D (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
> > +		     !(dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE);
> > +
> > +	if (burst_mode) {
> > +		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, NWL_DSI_VM_BURST_MODE);
> > +		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL, 256);
> > +	} else {
> > +		mode =3D ((dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) ?
> > +				NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES :
> > +				NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS);
> > +		nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, mode);
> > +		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL,
> > +			      dsi->mode.hdisplay);
> > +	}
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
> > +	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
> > +	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
> > +	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);
> > +	nwl_dsi_write(dsi, NWL_DSI_USE_NULL_PKT_BLLP, 0x0);
> > +	nwl_dsi_write(dsi, NWL_DSI_VC, 0x0);
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_PIXEL_PAYLOAD_SIZE, dsi->mode.hdisplay);
> > +	nwl_dsi_write(dsi, NWL_DSI_VACTIVE, dsi->mode.vdisplay - 1);
> > +	nwl_dsi_write(dsi, NWL_DSI_VBP, vback_porch);
> > +	nwl_dsi_write(dsi, NWL_DSI_VFP, vfront_porch);
> > +
> > +	return nwl_dsi_clear_error(dsi);
> > +}
> > +
> > +static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
> > +{
> > +	u32 irq_enable;
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, 0xffffffff);
> > +	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
> > +
> > +	irq_enable =3D ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
> > +			    NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> > +			    NWL_DSI_TX_FIFO_OVFLW_MASK |
> > +			    NWL_DSI_HS_TX_TIMEOUT_MASK);
> > +
> > +	nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, irq_enable);
> > +
> > +	return nwl_dsi_clear_error(dsi);
> > +}
> > +
> > +static int nwl_dsi_host_attach(struct mipi_dsi_host *dsi_host,
> > +			       struct mipi_dsi_device *device)
> > +{
> > +	struct nwl_dsi *dsi =3D container_of(dsi_host, struct nwl_dsi, dsi_ho=
st);
> > +	struct device *dev =3D dsi->dev;
> > +
> > +	DRM_DEV_INFO(dev, "lanes=3D%u, format=3D0x%x flags=3D0x%lx\n", device=
->lanes,
> > +		     device->format, device->mode_flags);
> > +
> > +	if (device->lanes < 1 || device->lanes > 4)
> > +		return -EINVAL;
> > +
> > +	dsi->lanes =3D device->lanes;
> > +	dsi->format =3D device->format;
> > +	dsi->dsi_mode_flags =3D device->mode_flags;
> > +
> > +	return 0;
> > +}
> > +
> > +static bool nwl_dsi_read_packet(struct nwl_dsi *dsi, u32 status)
> > +{
> > +	struct device *dev =3D dsi->dev;
> > +	struct nwl_dsi_transfer *xfer =3D dsi->xfer;
> > +	int err;
> > +	u8 *payload =3D xfer->msg->rx_buf;
> > +	u32 val;
> > +	u16 word_count;
> > +	u8 channel;
> > +	u8 data_type;
> > +
> > +	xfer->status =3D 0;
> > +
> > +	if (xfer->rx_word_count =3D=3D 0) {
> > +		if (!(status & NWL_DSI_RX_PKT_HDR_RCVD))
> > +			return false;
> > +		/* Get the RX header and parse it */
> > +		val =3D nwl_dsi_read(dsi, NWL_DSI_RX_PKT_HEADER);
> > +		err =3D nwl_dsi_clear_error(dsi);
> > +		if (err)
> > +			xfer->status =3D err;
> > +		word_count =3D NWL_DSI_WC(val);
> > +		channel =3D NWL_DSI_RX_VC(val);
> > +		data_type =3D NWL_DSI_RX_DT(val);
> > +
> > +		if (channel !=3D xfer->msg->channel) {
> > +			DRM_DEV_ERROR(dev,
> > +				      "[%02X] Channel mismatch (%u !=3D %u)\n",
> > +				      xfer->cmd, channel, xfer->msg->channel);
> > +			xfer->status =3D -EINVAL;
> > +			return true;
> > +		}
> > +
> > +		switch (data_type) {
> > +		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
> > +			fallthrough;
> > +		case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
> > +			if (xfer->msg->rx_len > 1) {
> > +				/* read second byte */
> > +				payload[1] =3D word_count >> 8;
> > +				++xfer->rx_len;
> > +			}
> > +			fallthrough;
> > +		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
> > +			fallthrough;
> > +		case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
> > +			if (xfer->msg->rx_len > 0) {
> > +				/* read first byte */
> > +				payload[0] =3D word_count & 0xff;
> > +				++xfer->rx_len;
> > +			}
> > +			xfer->status =3D xfer->rx_len;
> > +			return true;
> > +		case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
> > +			word_count &=3D 0xff;
> > +			DRM_DEV_ERROR(dev, "[%02X] DSI error report: 0x%02x\n",
> > +				      xfer->cmd, word_count);
> > +			xfer->status =3D -EPROTO;
> > +			return true;
> > +		}
> > +
> > +		if (word_count > xfer->msg->rx_len) {
> > +			DRM_DEV_ERROR(
> > +				dev,
> > +				"[%02X] Receive buffer too small: %zu (< %u)\n",
> > +				xfer->cmd, xfer->msg->rx_len, word_count);
> > +			xfer->status =3D -EINVAL;
> > +			return true;
> > +		}
> > +
> > +		xfer->rx_word_count =3D word_count;
> > +	} else {
> > +		/* Set word_count from previous header read */
> > +		word_count =3D xfer->rx_word_count;
> > +	}
> > +
> > +	/* If RX payload is not yet received, wait for it */
> > +	if (!(status & NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD))
> > +		return false;
> > +
> > +	/* Read the RX payload */
> > +	while (word_count >=3D 4) {
> > +		val =3D nwl_dsi_read(dsi, NWL_DSI_RX_PAYLOAD);
> > +		payload[0] =3D (val >> 0) & 0xff;
> > +		payload[1] =3D (val >> 8) & 0xff;
> > +		payload[2] =3D (val >> 16) & 0xff;
> > +		payload[3] =3D (val >> 24) & 0xff;
> > +		payload +=3D 4;
> > +		xfer->rx_len +=3D 4;
> > +		word_count -=3D 4;
> > +	}
> > +
> > +	if (word_count > 0) {
> > +		val =3D nwl_dsi_read(dsi, NWL_DSI_RX_PAYLOAD);
> > +		switch (word_count) {
> > +		case 3:
> > +			payload[2] =3D (val >> 16) & 0xff;
> > +			++xfer->rx_len;
> > +			fallthrough;
> > +		case 2:
> > +			payload[1] =3D (val >> 8) & 0xff;
> > +			++xfer->rx_len;
> > +			fallthrough;
> > +		case 1:
> > +			payload[0] =3D (val >> 0) & 0xff;
> > +			++xfer->rx_len;
> > +			break;
> > +		}
> > +	}
> > +
> > +	xfer->status =3D xfer->rx_len;
> > +	err =3D nwl_dsi_clear_error(dsi);
> > +	if (err)
> > +		xfer->status =3D err;
> > +
> > +	return true;
> > +}
> > +
> > +static void nwl_dsi_finish_transmission(struct nwl_dsi *dsi, u32 statu=
s)
> > +{
> > +	struct nwl_dsi_transfer *xfer =3D dsi->xfer;
> > +	bool end_packet =3D false;
> > +
> > +	if (!xfer)
> > +		return;
> > +
> > +	if (xfer->direction =3D=3D DSI_PACKET_SEND &&
> > +	    status & NWL_DSI_TX_PKT_DONE) {
> > +		xfer->status =3D xfer->tx_len;
> > +		end_packet =3D true;
> > +	} else if (status & NWL_DSI_DPHY_DIRECTION &&
> > +		   ((status & (NWL_DSI_RX_PKT_HDR_RCVD |
> > +			       NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD)))) {
> > +		end_packet =3D nwl_dsi_read_packet(dsi, status);
> > +	}
> > +
> > +	if (end_packet)
> > +		complete(&xfer->completed);
> > +}
> > +
> > +static void nwl_dsi_begin_transmission(struct nwl_dsi *dsi)
> > +{
> > +	struct nwl_dsi_transfer *xfer =3D dsi->xfer;
> > +	struct mipi_dsi_packet *pkt =3D &xfer->packet;
> > +	const u8 *payload;
> > +	size_t length;
> > +	u16 word_count;
> > +	u8 hs_mode;
> > +	u32 val;
> > +	u32 hs_workaround =3D 0;
> > +
> > +	/* Send the payload, if any */
> > +	length =3D pkt->payload_length;
> > +	payload =3D pkt->payload;
> > +
> > +	while (length >=3D 4) {
> > +		val =3D *(u32 *)payload;
> > +		hs_workaround |=3D !(val & 0xFFFF00);
> > +		nwl_dsi_write(dsi, NWL_DSI_TX_PAYLOAD, val);
> > +		payload +=3D 4;
> > +		length -=3D 4;
> > +	}
> > +	/* Send the rest of the payload */
> > +	val =3D 0;
> > +	switch (length) {
> > +	case 3:
> > +		val |=3D payload[2] << 16;
> > +		fallthrough;
> > +	case 2:
> > +		val |=3D payload[1] << 8;
> > +		hs_workaround |=3D !(val & 0xFFFF00);
> > +		fallthrough;
> > +	case 1:
> > +		val |=3D payload[0];
> > +		nwl_dsi_write(dsi, NWL_DSI_TX_PAYLOAD, val);
> > +		break;
> > +	}
> > +	xfer->tx_len =3D pkt->payload_length;
> > +
> > +	/*
> > +	 * Send the header
> > +	 * header[0] =3D Virtual Channel + Data Type
> > +	 * header[1] =3D Word Count LSB (LP) or first param (SP)
> > +	 * header[2] =3D Word Count MSB (LP) or second param (SP)
> > +	 */
> > +	word_count =3D pkt->header[1] | (pkt->header[2] << 8);
> > +	if (hs_workaround && (dsi->quirks & E11418_HS_MODE_QUIRK)) {
> > +		DRM_DEV_DEBUG_DRIVER(dsi->dev,
> > +				     "Using hs mode workaround for cmd 0x%x\n",
> > +				     xfer->cmd);
> > +		hs_mode =3D 1;
> > +	} else {
> > +		hs_mode =3D (xfer->msg->flags & MIPI_DSI_MSG_USE_LPM) ? 0 : 1;
> > +	}
> > +	val =3D NWL_DSI_WC(word_count) | NWL_DSI_TX_VC(xfer->msg->channel) |
> > +	      NWL_DSI_TX_DT(xfer->msg->type) | NWL_DSI_HS_SEL(hs_mode) |
> > +	      NWL_DSI_BTA_TX(xfer->need_bta);
> > +	nwl_dsi_write(dsi, NWL_DSI_PKT_CONTROL, val);
> > +
> > +	/* Send packet command */
> > +	nwl_dsi_write(dsi, NWL_DSI_SEND_PACKET, 0x1);
> > +}
> > +
> > +static ssize_t nwl_dsi_host_transfer(struct mipi_dsi_host *dsi_host,
> > +				     const struct mipi_dsi_msg *msg)
> > +{
> > +	struct nwl_dsi *dsi =3D container_of(dsi_host, struct nwl_dsi, dsi_ho=
st);
> > +	struct nwl_dsi_transfer xfer;
> > +	ssize_t ret =3D 0;
> > +
> > +	/* Create packet to be sent */
> > +	dsi->xfer =3D &xfer;
> > +	ret =3D mipi_dsi_create_packet(&xfer.packet, msg);
> > +	if (ret < 0) {
> > +		dsi->xfer =3D NULL;
> > +		return ret;
> > +	}
> > +
> > +	if ((msg->type & MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM ||
> > +	     msg->type & MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM ||
> > +	     msg->type & MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM ||
> > +	     msg->type & MIPI_DSI_DCS_READ) &&
> > +	    msg->rx_len > 0 && msg->rx_buf !=3D NULL)
> > +		xfer.direction =3D DSI_PACKET_RECEIVE;
> > +	else
> > +		xfer.direction =3D DSI_PACKET_SEND;
> > +
> > +	xfer.need_bta =3D (xfer.direction =3D=3D DSI_PACKET_RECEIVE);
> > +	xfer.need_bta |=3D (msg->flags & MIPI_DSI_MSG_REQ_ACK) ? 1 : 0;
> > +	xfer.msg =3D msg;
> > +	xfer.status =3D -ETIMEDOUT;
> > +	xfer.rx_word_count =3D 0;
> > +	xfer.rx_len =3D 0;
> > +	xfer.cmd =3D 0x00;
> > +	if (msg->tx_len > 0)
> > +		xfer.cmd =3D ((u8 *)(msg->tx_buf))[0];
> > +	init_completion(&xfer.completed);
> > +
> > +	ret =3D clk_prepare_enable(dsi->rx_esc_clk);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to enable rx_esc clk: %zd\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Enabled rx_esc clk @%lu Hz\n",
> > +			     clk_get_rate(dsi->rx_esc_clk));
> > +
> > +	/* Initiate the DSI packet transmision */
> > +	nwl_dsi_begin_transmission(dsi);
> > +
> > +	if (!wait_for_completion_timeout(&xfer.completed,
> > +					 NWL_DSI_MIPI_FIFO_TIMEOUT)) {
> > +		DRM_DEV_ERROR(dsi_host->dev, "[%02X] DSI transfer timed out\n",
> > +			      xfer.cmd);
> > +		ret =3D -ETIMEDOUT;
> > +	} else {
> > +		ret =3D xfer.status;
> > +	}
> > +
> > +	clk_disable_unprepare(dsi->rx_esc_clk);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops nwl_dsi_host_ops =3D {
> > +	.attach =3D nwl_dsi_host_attach,
> > +	.transfer =3D nwl_dsi_host_transfer,
> > +};
> > +
> > +static irqreturn_t nwl_dsi_irq_handler(int irq, void *data)
> > +{
> > +	u32 irq_status;
> > +	struct nwl_dsi *dsi =3D data;
> > +
> > +	irq_status =3D nwl_dsi_read(dsi, NWL_DSI_IRQ_STATUS);
> > +
> > +	if (irq_status & NWL_DSI_TX_FIFO_OVFLW)
> > +		DRM_DEV_ERROR_RATELIMITED(dsi->dev, "tx fifo overflow\n");
> > +
> > +	if (irq_status & NWL_DSI_HS_TX_TIMEOUT)
> > +		DRM_DEV_ERROR_RATELIMITED(dsi->dev, "HS tx timeout\n");
> > +
> > +	if (irq_status & NWL_DSI_TX_PKT_DONE ||
> > +	    irq_status & NWL_DSI_RX_PKT_HDR_RCVD ||
> > +	    irq_status & NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD)
> > +		nwl_dsi_finish_transmission(dsi, irq_status);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int nwl_dsi_enable(struct nwl_dsi *dsi)
> > +{
> > +	struct device *dev =3D dsi->dev;
> > +	union phy_configure_opts *phy_cfg =3D &dsi->phy_cfg;
> > +	int ret;
> > +
> > +	if (!dsi->lanes) {
> > +		DRM_DEV_ERROR(dev, "Need DSI lanes: %d\n", dsi->lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D phy_init(dsi->phy);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to init DSI phy: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D phy_configure(dsi->phy, phy_cfg);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", ret);
> > +		goto uninit_phy;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(dsi->tx_esc_clk);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to enable tx_esc clk: %d\n",
> > +			      ret);
> > +		goto uninit_phy;
> > +	}
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Enabled tx_esc clk @%lu Hz\n",
> > +			     clk_get_rate(dsi->tx_esc_clk));
> > +
> > +	ret =3D nwl_dsi_config_host(dsi);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to set up DSI: %d", ret);
> > +		goto disable_clock;
> > +	}
> > +
> > +	ret =3D nwl_dsi_config_dpi(dsi);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to set up DPI: %d", ret);
> > +		goto disable_clock;
> > +	}
> > +
> > +	ret =3D phy_power_on(dsi->phy);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to power on DPHY (%d)\n", ret);
> > +		goto disable_clock;
> > +	}
> > +
> > +	ret =3D nwl_dsi_init_interrupts(dsi);
> > +	if (ret < 0)
> > +		goto power_off_phy;
> > +
> > +	return ret;
> > +
> > +power_off_phy:
> > +	phy_power_off(dsi->phy);
> > +disable_clock:
> > +	clk_disable_unprepare(dsi->tx_esc_clk);
> > +uninit_phy:
> > +	phy_exit(dsi->phy);
> > +
> > +	return ret;
> > +}
> > +
> > +static int nwl_dsi_disable(struct nwl_dsi *dsi)
> > +{
> > +	struct device *dev =3D dsi->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "Disabling clocks and phy\n");
> > +
> > +	phy_power_off(dsi->phy);
> > +	phy_exit(dsi->phy);
> > +
> > +	/* Disabling the clock before the phy breaks enabling dsi again */
> > +	clk_disable_unprepare(dsi->tx_esc_clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	nwl_dsi_disable(dsi);
> > +
> > +	ret =3D reset_control_assert(dsi->rst_dpi);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to assert DPI: %d\n", ret);
> > +		return;
> > +	}
> > +	ret =3D reset_control_assert(dsi->rst_byte);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to assert ESC: %d\n", ret);
> > +		return;
> > +	}
> > +	ret =3D reset_control_assert(dsi->rst_esc);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to assert BYTE: %d\n", ret);
> > +		return;
> > +	}
> > +	ret =3D reset_control_assert(dsi->rst_pclk);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to assert PCLK: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	clk_disable_unprepare(dsi->core_clk);
> > +	clk_disable_unprepare(dsi->lcdif_clk);
> > +
> > +	pm_runtime_put(dsi->dev);
> > +}
> > +
> > +static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi,
> > +				   const struct drm_display_mode *mode,
> > +				   union phy_configure_opts *phy_opts)
> > +{
> > +	unsigned long rate;
> > +	int ret;
> > +
> > +	if (dsi->lanes < 1 || dsi->lanes > 4)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * So far the DPHY spec minimal timings work for both mixel
> > +	 * dphy and nwl dsi host
> > +	 */
> > +	ret =3D phy_mipi_dphy_get_default_config(
> > +		mode->clock * 1000,
> > +		mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes,
> > +		&phy_opts->mipi_dphy);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	rate =3D clk_get_rate(dsi->tx_esc_clk);
> > +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "LP clk is @%lu Hz\n", rate);
> > +	phy_opts->mipi_dphy.lp_clk_rate =3D rate;
> > +
> > +	return 0;
> > +}
> > +
> > +static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
> > +				      const struct drm_display_mode *mode,
> > +				      struct drm_display_mode *adjusted_mode)
> > +{
> > +	/* At least LCDIF + NWL needs active high sync */
> > +	adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYN=
C);
> > +	adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSY=
NC);
> > +
> > +	return true;
> > +}
> > +
> > +static enum drm_mode_status
> > +nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > +			  const struct drm_display_mode *mode)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +
> > +	if (mode->clock * bpp > 15000000 * dsi->lanes)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode->clock * bpp < 80000 * dsi->lanes)
> > +		return MODE_CLOCK_LOW;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static void
> > +nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
> > +			const struct drm_display_mode *mode,
> > +			const struct drm_display_mode *adjusted_mode)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	struct device *dev =3D dsi->dev;
> > +	union phy_configure_opts new_cfg;
> > +	unsigned long phy_ref_rate;
> > +	int ret;
> > +
> > +	ret =3D nwl_dsi_get_dphy_params(dsi, adjusted_mode, &new_cfg);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	/*
> > +	 * If hs clock is unchanged, we're all good - all parameters are
> > +	 * derived from it atm.
> > +	 */
> > +	if (new_cfg.mipi_dphy.hs_clk_rate =3D=3D dsi->phy_cfg.mipi_dphy.hs_cl=
k_rate)
> > +		return;
> > +
> > +	phy_ref_rate =3D clk_get_rate(dsi->phy_ref_clk);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "PHY at ref rate: %lu\n", phy_ref_rate);
> > +	/* Save the new desired phy config */
> > +	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
> > +
> > +	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
> > +	drm_mode_debug_printmodeline(adjusted_mode);
> > +}
> > +
> > +static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	pm_runtime_get_sync(dsi->dev);
> > +
> > +	if (clk_prepare_enable(dsi->lcdif_clk) < 0)
> > +		return;
> > +	if (clk_prepare_enable(dsi->core_clk) < 0)
> > +		return;
> > +
> > +	/* Step 1 from DSI reset-out instructions */
> > +	ret =3D reset_control_deassert(dsi->rst_pclk);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to deassert PCLK: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	/* Step 2 from DSI reset-out instructions */
> > +	nwl_dsi_enable(dsi);
> > +
> > +	/* Step 3 from DSI reset-out instructions */
> > +	ret =3D reset_control_deassert(dsi->rst_esc);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to deassert ESC: %d\n", ret);
> > +		return;
> > +	}
> > +	ret =3D reset_control_deassert(dsi->rst_byte);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to deassert BYTE: %d\n", ret);
> > +		return;
> > +	}
> > +}
> > +
> > +static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	/* Step 5 from DSI reset-out instructions */
> > +	ret =3D reset_control_deassert(dsi->rst_dpi);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to deassert DPI: %d\n", ret);
> > +}
> > +
> > +static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
> > +				 enum drm_bridge_attach_flags flags)
> > +{
> > +	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +	struct drm_bridge *panel_bridge;
> > +	struct drm_panel *panel;
> > +	int ret;
> > +
> > +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> > +		return -EINVAL;
> =

> Any chance this driver could be fixed to make connection optional?
> Also, other drivers are more friednly and print something if the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set.

Supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR is one of the reasons why i'd
be nice to have the driver in tree since this involves modifying the
display controller driver (mxsfb) as well and we could have both in the
same series. I've added a DEV_ERR().
Cheers,
 -- Guido

> =

> 	Sam
> =

> > +
> > +	ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> > +					  &panel_bridge);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (panel) {
> > +		panel_bridge =3D drm_panel_bridge_add(panel);
> > +		if (IS_ERR(panel_bridge))
> > +			return PTR_ERR(panel_bridge);
> > +	}
> > +	dsi->panel_bridge =3D panel_bridge;
> > +
> > +	if (!dsi->panel_bridge)
> > +		return -EPROBE_DEFER;
> > +
> > +	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
> > +				 flags);
> > +}
> > +
> > +static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
> > +{	struct nwl_dsi *dsi =3D bridge_to_dsi(bridge);
> > +
> > +	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
> > +	return;
> > +}
> > +
> > +static const struct drm_bridge_funcs nwl_dsi_bridge_funcs =3D {
> > +	.pre_enable =3D nwl_dsi_bridge_pre_enable,
> > +	.enable     =3D nwl_dsi_bridge_enable,
> > +	.disable    =3D nwl_dsi_bridge_disable,
> > +	.mode_fixup =3D nwl_dsi_bridge_mode_fixup,
> > +	.mode_set   =3D nwl_dsi_bridge_mode_set,
> > +	.mode_valid =3D nwl_dsi_bridge_mode_valid,
> > +	.attach	    =3D nwl_dsi_bridge_attach,
> > +	.detach	    =3D nwl_dsi_bridge_detach,
> > +};
> > +
> > +static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
> > +{
> > +	struct platform_device *pdev =3D to_platform_device(dsi->dev);
> > +	struct clk *clk;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	dsi->phy =3D devm_phy_get(dsi->dev, "dphy");
> > +	if (IS_ERR(dsi->phy)) {
> > +		ret =3D PTR_ERR(dsi->phy);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dsi->dev, "Could not get PHY: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	clk =3D devm_clk_get(dsi->dev, "lcdif");
> > +	if (IS_ERR(clk)) {
> > +		ret =3D PTR_ERR(clk);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get lcdif clock: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	dsi->lcdif_clk =3D clk;
> > +
> > +	clk =3D devm_clk_get(dsi->dev, "core");
> > +	if (IS_ERR(clk)) {
> > +		ret =3D PTR_ERR(clk);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get core clock: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	dsi->core_clk =3D clk;
> > +
> > +
> > +	clk =3D devm_clk_get(dsi->dev, "phy_ref");
> > +	if (IS_ERR(clk)) {
> > +		ret =3D PTR_ERR(clk);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get phy_ref clock: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	dsi->phy_ref_clk =3D clk;
> > +
> > +	clk =3D devm_clk_get(dsi->dev, "rx_esc");
> > +	if (IS_ERR(clk)) {
> > +		ret =3D PTR_ERR(clk);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get rx_esc clock: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	dsi->rx_esc_clk =3D clk;
> > +
> > +	clk =3D devm_clk_get(dsi->dev, "tx_esc");
> > +	if (IS_ERR(clk)) {
> > +		ret =3D PTR_ERR(clk);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get tx_esc clock: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +	dsi->tx_esc_clk =3D clk;
> > +
> > +	dsi->mux =3D devm_mux_control_get(dsi->dev, NULL);
> > +	if (IS_ERR(dsi->mux)) {
> > +		ret =3D PTR_ERR(dsi->mux);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dsi->dev, "Failed to get mux: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	dsi->regmap =3D
> > +		devm_regmap_init_mmio(dsi->dev, base, &nwl_dsi_regmap_config);
> > +	if (IS_ERR(dsi->regmap)) {
> > +		ret =3D PTR_ERR(dsi->regmap);
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to create NWL DSI regmap: %d\n",
> > +			      ret);
> > +		return ret;
> > +	}
> > +
> > +	dsi->irq =3D platform_get_irq(pdev, 0);
> > +	if (dsi->irq < 0) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get device IRQ: %d\n",
> > +			      dsi->irq);
> > +		return dsi->irq;
> > +	}
> > +
> > +	dsi->rst_pclk =3D devm_reset_control_get_exclusive(dsi->dev, "pclk");
> > +	if (IS_ERR(dsi->rst_pclk)) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get pclk reset: %ld\n",
> > +			      PTR_ERR(dsi->rst_pclk));
> > +		return PTR_ERR(dsi->rst_pclk);
> > +	}
> > +	dsi->rst_byte =3D devm_reset_control_get_exclusive(dsi->dev, "byte");
> > +	if (IS_ERR(dsi->rst_byte)) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get byte reset: %ld\n",
> > +			      PTR_ERR(dsi->rst_byte));
> > +		return PTR_ERR(dsi->rst_byte);
> > +	}
> > +	dsi->rst_esc =3D devm_reset_control_get_exclusive(dsi->dev, "esc");
> > +	if (IS_ERR(dsi->rst_esc)) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get esc reset: %ld\n",
> > +			      PTR_ERR(dsi->rst_esc));
> > +		return PTR_ERR(dsi->rst_esc);
> > +	}
> > +	dsi->rst_dpi =3D devm_reset_control_get_exclusive(dsi->dev, "dpi");
> > +	if (IS_ERR(dsi->rst_dpi)) {
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to get dpi reset: %ld\n",
> > +			      PTR_ERR(dsi->rst_dpi));
> > +		return PTR_ERR(dsi->rst_dpi);
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int nwl_dsi_select_input(struct nwl_dsi *dsi)
> > +{
> > +	struct device_node *remote;
> > +	u32 use_dcss =3D 1;
> > +	int ret;
> > +
> > +	remote =3D of_graph_get_remote_node(dsi->dev->of_node, 0,
> > +					  NWL_DSI_ENDPOINT_LCDIF);
> > +	if (remote) {
> > +		use_dcss =3D 0;
> > +	} else {
> > +		remote =3D of_graph_get_remote_node(dsi->dev->of_node, 0,
> > +						  NWL_DSI_ENDPOINT_DCSS);
> > +		if (!remote) {
> > +			DRM_DEV_ERROR(dsi->dev,
> > +				      "No valid input endpoint found\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	DRM_DEV_INFO(dsi->dev, "Using %s as input source\n",
> > +		     (use_dcss) ? "DCSS" : "LCDIF");
> > +	ret =3D mux_control_try_select(dsi->mux, use_dcss);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to select input: %d\n", ret);
> > +
> > +	of_node_put(remote);
> > +	return ret;
> > +}
> > +
> > +static int nwl_dsi_deselect_input(struct nwl_dsi *dsi)
> > +{
> > +	int ret;
> > +
> > +	ret =3D mux_control_deselect(dsi->mux);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dsi->dev, "Failed to deselect input: %d\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct drm_bridge_timings nwl_dsi_timings =3D {
> > +	.input_bus_flags =3D DRM_BUS_FLAG_DE_LOW,
> > +};
> > +
> > +static const struct of_device_id nwl_dsi_dt_ids[] =3D {
> > +	{ .compatible =3D "fsl,imx8mq-nwl-dsi", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, nwl_dsi_dt_ids);
> > +
> > +static const struct soc_device_attribute nwl_dsi_quirks_match[] =3D {
> > +	{ .soc_id =3D "i.MX8MQ", .revision =3D "2.0",
> > +	  .data =3D (void *)E11418_HS_MODE_QUIRK },
> > +	{ /* sentinel. */ },
> > +};
> > +
> > +static int nwl_dsi_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	const struct soc_device_attribute *attr;
> > +	struct nwl_dsi *dsi;
> > +	int ret;
> > +
> > +	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > +	if (!dsi)
> > +		return -ENOMEM;
> > +
> > +	dsi->dev =3D dev;
> > +
> > +	ret =3D nwl_dsi_parse_dt(dsi);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_request_irq(dev, dsi->irq, nwl_dsi_irq_handler, 0,
> > +			       dev_name(dev), dsi);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to request IRQ %d: %d\n", dsi->irq,
> > +			      ret);
> > +		return ret;
> > +	}
> > +
> > +	dsi->dsi_host.ops =3D &nwl_dsi_host_ops;
> > +	dsi->dsi_host.dev =3D dev;
> > +	ret =3D mipi_dsi_host_register(&dsi->dsi_host);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "Failed to register MIPI host: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	attr =3D soc_device_match(nwl_dsi_quirks_match);
> > +	if (attr)
> > +		dsi->quirks =3D (uintptr_t)attr->data;
> > +
> > +	dsi->bridge.driver_private =3D dsi;
> > +	dsi->bridge.funcs =3D &nwl_dsi_bridge_funcs;
> > +	dsi->bridge.of_node =3D dev->of_node;
> > +	dsi->bridge.timings =3D &nwl_dsi_timings;
> > +
> > +	dev_set_drvdata(dev, dsi);
> > +	pm_runtime_enable(dev);
> > +
> > +	ret =3D nwl_dsi_select_input(dsi);
> > +	if (ret < 0) {
> > +		mipi_dsi_host_unregister(&dsi->dsi_host);
> > +		return ret;
> > +	}
> > +
> > +	drm_bridge_add(&dsi->bridge);
> > +	return 0;
> > +}
> > +
> > +static int nwl_dsi_remove(struct platform_device *pdev)
> > +{
> > +	struct nwl_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +	nwl_dsi_deselect_input(dsi);
> > +	mipi_dsi_host_unregister(&dsi->dsi_host);
> > +	drm_bridge_remove(&dsi->bridge);
> > +	pm_runtime_disable(&pdev->dev);
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver nwl_dsi_driver =3D {
> > +	.probe		=3D nwl_dsi_probe,
> > +	.remove		=3D nwl_dsi_remove,
> > +	.driver		=3D {
> > +		.of_match_table =3D nwl_dsi_dt_ids,
> > +		.name	=3D DRV_NAME,
> > +	},
> > +};
> > +
> > +module_platform_driver(nwl_dsi_driver);
> > +
> > +MODULE_AUTHOR("NXP Semiconductor");
> > +MODULE_AUTHOR("Purism SPC");
> > +MODULE_DESCRIPTION("Northwest Logic MIPI-DSI driver");
> > +MODULE_LICENSE("GPL"); /* GPLv2 or later */
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.h b/drivers/gpu/drm/bridge/=
nwl-dsi.h
> > new file mode 100644
> > index 000000000000..a247a8a11c7c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.h
> > @@ -0,0 +1,144 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * NWL MIPI DSI host driver
> > + *
> > + * Copyright (C) 2017 NXP
> > + * Copyright (C) 2019 Purism SPC
> > + */
> > +#ifndef __NWL_DSI_H__
> > +#define __NWL_DSI_H__
> > +
> > +/* DSI HOST registers */
> > +#define NWL_DSI_CFG_NUM_LANES			0x0
> > +#define NWL_DSI_CFG_NONCONTINUOUS_CLK		0x4
> > +#define NWL_DSI_CFG_T_PRE			0x8
> > +#define NWL_DSI_CFG_T_POST			0xc
> > +#define NWL_DSI_CFG_TX_GAP			0x10
> > +#define NWL_DSI_CFG_AUTOINSERT_EOTP		0x14
> > +#define NWL_DSI_CFG_EXTRA_CMDS_AFTER_EOTP	0x18
> > +#define NWL_DSI_CFG_HTX_TO_COUNT		0x1c
> > +#define NWL_DSI_CFG_LRX_H_TO_COUNT		0x20
> > +#define NWL_DSI_CFG_BTA_H_TO_COUNT		0x24
> > +#define NWL_DSI_CFG_TWAKEUP			0x28
> > +#define NWL_DSI_CFG_STATUS_OUT			0x2c
> > +#define NWL_DSI_RX_ERROR_STATUS			0x30
> > +
> > +/* DSI DPI registers */
> > +#define NWL_DSI_PIXEL_PAYLOAD_SIZE		0x200
> > +#define NWL_DSI_PIXEL_FIFO_SEND_LEVEL		0x204
> > +#define NWL_DSI_INTERFACE_COLOR_CODING		0x208
> > +#define NWL_DSI_PIXEL_FORMAT			0x20c
> > +#define NWL_DSI_VSYNC_POLARITY			0x210
> > +#define NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW	0
> > +#define NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> > +
> > +#define NWL_DSI_HSYNC_POLARITY			0x214
> > +#define NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW	0
> > +#define NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH	BIT(1)
> > +
> > +#define NWL_DSI_VIDEO_MODE			0x218
> > +#define NWL_DSI_HFP				0x21c
> > +#define NWL_DSI_HBP				0x220
> > +#define NWL_DSI_HSA				0x224
> > +#define NWL_DSI_ENABLE_MULT_PKTS		0x228
> > +#define NWL_DSI_VBP				0x22c
> > +#define NWL_DSI_VFP				0x230
> > +#define NWL_DSI_BLLP_MODE			0x234
> > +#define NWL_DSI_USE_NULL_PKT_BLLP		0x238
> > +#define NWL_DSI_VACTIVE				0x23c
> > +#define NWL_DSI_VC				0x240
> > +
> > +/* DSI APB PKT control */
> > +#define NWL_DSI_TX_PAYLOAD			0x280
> > +#define NWL_DSI_PKT_CONTROL			0x284
> > +#define NWL_DSI_SEND_PACKET			0x288
> > +#define NWL_DSI_PKT_STATUS			0x28c
> > +#define NWL_DSI_PKT_FIFO_WR_LEVEL		0x290
> > +#define NWL_DSI_PKT_FIFO_RD_LEVEL		0x294
> > +#define NWL_DSI_RX_PAYLOAD			0x298
> > +#define NWL_DSI_RX_PKT_HEADER			0x29c
> > +
> > +/* DSI IRQ handling */
> > +#define NWL_DSI_IRQ_STATUS			0x2a0
> > +#define NWL_DSI_SM_NOT_IDLE			BIT(0)
> > +#define NWL_DSI_TX_PKT_DONE			BIT(1)
> > +#define NWL_DSI_DPHY_DIRECTION			BIT(2)
> > +#define NWL_DSI_TX_FIFO_OVFLW			BIT(3)
> > +#define NWL_DSI_TX_FIFO_UDFLW			BIT(4)
> > +#define NWL_DSI_RX_FIFO_OVFLW			BIT(5)
> > +#define NWL_DSI_RX_FIFO_UDFLW			BIT(6)
> > +#define NWL_DSI_RX_PKT_HDR_RCVD			BIT(7)
> > +#define NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD	BIT(8)
> > +#define NWL_DSI_BTA_TIMEOUT			BIT(29)
> > +#define NWL_DSI_LP_RX_TIMEOUT			BIT(30)
> > +#define NWL_DSI_HS_TX_TIMEOUT			BIT(31)
> > +
> > +#define NWL_DSI_IRQ_STATUS2			0x2a4
> > +#define NWL_DSI_SINGLE_BIT_ECC_ERR		BIT(0)
> > +#define NWL_DSI_MULTI_BIT_ECC_ERR		BIT(1)
> > +#define NWL_DSI_CRC_ERR				BIT(2)
> > +
> > +#define NWL_DSI_IRQ_MASK			0x2a8
> > +#define NWL_DSI_SM_NOT_IDLE_MASK		BIT(0)
> > +#define NWL_DSI_TX_PKT_DONE_MASK		BIT(1)
> > +#define NWL_DSI_DPHY_DIRECTION_MASK		BIT(2)
> > +#define NWL_DSI_TX_FIFO_OVFLW_MASK		BIT(3)
> > +#define NWL_DSI_TX_FIFO_UDFLW_MASK		BIT(4)
> > +#define NWL_DSI_RX_FIFO_OVFLW_MASK		BIT(5)
> > +#define NWL_DSI_RX_FIFO_UDFLW_MASK		BIT(6)
> > +#define NWL_DSI_RX_PKT_HDR_RCVD_MASK		BIT(7)
> > +#define NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD_MASK	BIT(8)
> > +#define NWL_DSI_BTA_TIMEOUT_MASK		BIT(29)
> > +#define NWL_DSI_LP_RX_TIMEOUT_MASK		BIT(30)
> > +#define NWL_DSI_HS_TX_TIMEOUT_MASK		BIT(31)
> > +
> > +#define NWL_DSI_IRQ_MASK2			0x2ac
> > +#define NWL_DSI_SINGLE_BIT_ECC_ERR_MASK		BIT(0)
> > +#define NWL_DSI_MULTI_BIT_ECC_ERR_MASK		BIT(1)
> > +#define NWL_DSI_CRC_ERR_MASK			BIT(2)
> > +
> > +/*
> > + * PKT_CONTROL format:
> > + * [15: 0] - word count
> > + * [17:16] - virtual channel
> > + * [23:18] - data type
> > + * [24]	   - LP or HS select (0 - LP, 1 - HS)
> > + * [25]	   - perform BTA after packet is sent
> > + * [26]	   - perform BTA only, no packet tx
> > + */
> > +#define NWL_DSI_WC(x)		FIELD_PREP(GENMASK(15, 0), (x))
> > +#define NWL_DSI_TX_VC(x)	FIELD_PREP(GENMASK(17, 16), (x))
> > +#define NWL_DSI_TX_DT(x)	FIELD_PREP(GENMASK(23, 18), (x))
> > +#define NWL_DSI_HS_SEL(x)	FIELD_PREP(GENMASK(24, 24), (x))
> > +#define NWL_DSI_BTA_TX(x)	FIELD_PREP(GENMASK(25, 25), (x))
> > +#define NWL_DSI_BTA_NO_TX(x)	FIELD_PREP(GENMASK(26, 26), (x))
> > +
> > +/*
> > + * RX_PKT_HEADER format:
> > + * [15: 0] - word count
> > + * [21:16] - data type
> > + * [23:22] - virtual channel
> > + */
> > +#define NWL_DSI_RX_DT(x)	FIELD_GET(GENMASK(21, 16), (x))
> > +#define NWL_DSI_RX_VC(x)	FIELD_GET(GENMASK(23, 22), (x))
> > +
> > +/* DSI Video mode */
> > +#define NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES		0
> > +#define NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS	BIT(0)
> > +#define NWL_DSI_VM_BURST_MODE				BIT(1)
> > +
> > +/* * DPI color coding */
> > +#define NWL_DSI_DPI_16_BIT_565_PACKED	0
> > +#define NWL_DSI_DPI_16_BIT_565_ALIGNED	1
> > +#define NWL_DSI_DPI_16_BIT_565_SHIFTED	2
> > +#define NWL_DSI_DPI_18_BIT_PACKED	3
> > +#define NWL_DSI_DPI_18_BIT_ALIGNED	4
> > +#define NWL_DSI_DPI_24_BIT		5
> > +
> > +/* * DPI Pixel format */
> > +#define NWL_DSI_PIXEL_FORMAT_16  0
> > +#define NWL_DSI_PIXEL_FORMAT_18  BIT(0)
> > +#define NWL_DSI_PIXEL_FORMAT_18L BIT(1)
> > +#define NWL_DSI_PIXEL_FORMAT_24  (BIT(0) | BIT(1))
> > +
> > +#endif /* __NWL_DSI_H__ */
> > -- =

> > 2.23.0
> > =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
