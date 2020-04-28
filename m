Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4F1BC39E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0706E832;
	Tue, 28 Apr 2020 15:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904036E832
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:28:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r26so3364955wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ACsdcmPNJMTTTwskSc7fbtaJNBvyX2gLdzIz5qYW2zI=;
 b=Rhfnc3r5FaP2Y00zFRmq7xAUbbTfePa4pMoR05MEZraJ2x76Bh/5LUDrjGBHsTZMs8
 p0qOlrvzbAGN47ygi9rDG/eOZRIymRjmVEG0EhjhQxeYLKqISYPHY3+Wpn4lo5uBARW9
 EZh0OliUCqfGW7euCmZ2OxALOlvZhOB7kqjg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ACsdcmPNJMTTTwskSc7fbtaJNBvyX2gLdzIz5qYW2zI=;
 b=FyXx+kpZyAtEhiKLu52+TfcWBdeEmiSBAx7BRu3597AQED8Jqjmxhv6wxtIkAhPccs
 h215g5D2wJGWdgjnvI9JBDB9qZhwUDdZKDT1sHeABHhF6HwMR3BWD8bdSA2dgLMtDpIg
 udKY+4nVQk1eKNpDjlWOPlHPBZdlC9z/lDm4eVPZlXvmbT5YqT22Eu4H0LsSqVNhNpAe
 DtV+5LNE39HUwGVn9JO65UtXXijSCkBP+JgCatTFgyjjjw+Q5OIEVKTpOWaqhCMiMBiH
 0QplYXVYQWGBKMrXdPVMWUytx6bbxr0P1JkRyeswNmtfi2pQnj5wv2v+bZHQsRWi6L8t
 8pWg==
X-Gm-Message-State: AGi0PuYR0e9nFtikB4TvSY3VledweYd3QkJqLvXE/CVPUWbkuGGibrGZ
 KHB5bL3K7iyvyQvoLHBdQDvebw==
X-Google-Smtp-Source: APiQypKkFUBOImvy0vcKBraLy3CZowzgYI6G8Q3vVR7LKnxmOBS59476CU/mlDlciMpop0tUymzUJw==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr5720407wmk.68.1588087699047; 
 Tue, 28 Apr 2020 08:28:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b4sm25992132wrv.42.2020.04.28.08.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:28:17 -0700 (PDT)
Date: Tue, 28 Apr 2020 17:28:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH v3 3/4] drm: ipk: Add extensions for DW MIPI DSI Host
 driver
Message-ID: <20200428152815.GX3456981@phenom.ffwll.local>
Mail-Followup-To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
 <24372475c0afe1e88f323efec16300903d1c6294.1587992776.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24372475c0afe1e88f323efec16300903d1c6294.1587992776.git.angelo.ribeiro@synopsys.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: devicetree@vger.kernel.org, Joao Pinto <Joao.Pinto@synopsys.com>,
 David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 04:00:35PM +0200, Angelo Ribeiro wrote:
> Add Synopsys DesignWare IPK specific extensions for Synopsys DesignWare
> MIPI DSI Host driver.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>

I've dumped this on a pile of bridge drivers by now, but I don't think the
dw-mipi-dsi organization makes much sense.

I think what we'd need is:

- drm_encoder is handled by the drm_device driver, not by dw-mipi-dsi
  drm_bridge driver

- the glue code for the various soc specific implementations (like ipk
  here) should be put behind the drm_bridge abstraction. Otherwise I'm not
  really seeing why exactly dw-mipi-dsi is a bridge driver if it doesn't
  work like a bridge driver

- Probably we should put all these files into drm/bridge/dw-mipi-dsi/

- drm_device drivers should get at their bridges with one of the standard
  of helpers we have in drm_bridge, not by directly calling into a bridge
  drivers.

I know that dw-hdmi is using the exact same code pattern, but we got to
stop this eventually or it becomes an unfixable mess.
-Daniel

> ---
> Changes since v3:
>   - Rearranged headers.
> ---
>  drivers/gpu/drm/ipk/Kconfig           |   9 +
>  drivers/gpu/drm/ipk/Makefile          |   2 +
>  drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c | 557 ++++++++++++++++++++++++++++++++++
>  3 files changed, 568 insertions(+)
>  create mode 100644 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> 
> diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
> index 1f87444..49819e5 100644
> --- a/drivers/gpu/drm/ipk/Kconfig
> +++ b/drivers/gpu/drm/ipk/Kconfig
> @@ -11,3 +11,12 @@ config DRM_IPK
>  	  Enable support for the Synopsys DesignWare DRM DSI.
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called ipk-drm.
> +
> +config DRM_IPK_DSI
> +	tristate "Synopsys DesignWare IPK specific extensions for MIPI DSI"
> +	depends on DRM_IPK
> +	select DRM_DW_MIPI_DSI
> +	help
> +	  Choose this option for Synopsys DesignWare IPK MIPI DSI support.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called dw-mipi-dsi-ipk.
> diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
> index 6a1a911..f22d590 100644
> --- a/drivers/gpu/drm/ipk/Makefile
> +++ b/drivers/gpu/drm/ipk/Makefile
> @@ -2,3 +2,5 @@
>  ipk-drm-y := dw-drv.o dw-vpg.o
>  
>  obj-$(CONFIG_DRM_IPK) += ipk-drm.o
> +
> +obj-$(CONFIG_DRM_IPK_DSI) += dw-mipi-dsi-ipk.o
> diff --git a/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> new file mode 100644
> index 0000000..f8ac4ca
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
> @@ -0,0 +1,557 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare MIPI DSI solution driver
> + *
> + * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> + * Author: Luis Oliveira <luis.oliveira@synopsys.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/bridge/dw_mipi_dsi.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_print.h>
> +
> +#define DW_DPHY_LPCLK_CTRL	0x94
> +#define DW_DPHY_RSTZ		0xA0
> +#define DW_DPHY_IF_CFG		0xA4
> +#define DW_DPHY_ULPS_CTRL	0xA8
> +#define DW_DPHY_TX_TRIGGERS	0xAC
> +#define DW_DPHY_STATUS		0xB0
> +#define DW_DPHY_TST_CTRL0	0xB4
> +#define DW_DPHY_TST_CTRL1	0xB8
> +#define DW_GEN3_IF_TESTER	0x3c
> +#define DW_GEN3_IF_SOC_PLL	0x48
> +#define DW_GEN3_IF_SOC_PLL_EN	0x4C
> +
> +#define DW_12BITS_DPHY_RDY_L0	0x507
> +#define DW_12BITS_DPHY_RDY_L1	0x707
> +#define DW_12BITS_DPHY_RDY_L2	0x907
> +#define DW_12BITS_DPHY_RDY_L3	0xB07
> +
> +#define DW_LANE_MIN_KBPS	80000
> +#define DW_LANE_MAX_KBPS	2500000000
> +#define DW_DPHY_DIV_UPPER_LIMIT	8000
> +#define DW_DPHY_DIV_LOWER_LIMIT	2000
> +#define DW_MIN_OUTPUT_FREQ	80
> +#define DW_LPHS_TIM_TRANSIONS	0x40
> +
> +enum dw_glueiftester {
> +	GLUE_LOGIC = 0x4,
> +	RX_PHY = 0x2,
> +	TX_PHY = 0x1,
> +	RESET = 0x0,
> +};
> +
> +struct dw_range_dphy {
> +	u32 freq;
> +	u8 hs_freq_range;
> +	u32 osc_freq_target;
> +} dw_range_gen3[] = {
> +	{ 80, 0x00, 0x3f }, { 90, 0x10, 0x3f }, { 100, 0x20, 0x3f },
> +	{ 110, 0x30, 0x39 }, { 120, 0x01, 0x39 }, { 130, 0x11, 0x39 },
> +	{ 140, 0x21, 0x39 }, { 150, 0x31, 0x39 }, { 160, 0x02, 0x39 },
> +	{ 170, 0x12, 0x2f }, { 180, 0x22, 0x2f }, { 190, 0x32, 0x2f },
> +	{ 205, 0x03, 0x2f }, { 220, 0x13, 0x29 }, { 235, 0x23, 0x29 },
> +	{ 250, 0x33, 0x29 }, { 275, 0x04, 0x29 }, { 300, 0x14, 0x29 },
> +	{ 325, 0x25, 0x29 }, { 350, 0x35, 0x1f }, { 400, 0x05, 0x1f },
> +	{ 450, 0x16, 0x19 }, { 500, 0x26, 0x19 }, { 550, 0x37, 0x19 },
> +	{ 600, 0x07, 0x19 }, { 650, 0x18, 0x19 }, { 700, 0x28, 0x0f },
> +	{ 750, 0x39, 0x0f }, { 800, 0x09, 0x0f }, { 850, 0x19, 0x0f },
> +	{ 900, 0x29, 0x09 }, { 950, 0x3a, 0x09 }, { 1000, 0x0a, 0x09 },
> +	{ 1050, 0x1a, 0x09 }, { 1100, 0x2a, 0x09 }, { 1150, 0x3b, 0x09 },
> +	{ 1200, 0x0b, 0x09 }, { 1250, 0x1b, 0x09 }, { 1300, 0x2b, 0x09 },
> +	{ 1350, 0x3c, 0x03 }, { 1400, 0x0c, 0x03 }, { 1450, 0x1c, 0x03 },
> +	{ 1500, 0x2c, 0x03 }, { 1550, 0x3d, 0x03 }, { 1600, 0x0d, 0x03 },
> +	{ 1650, 0x1d, 0x03 }, { 1700, 0x2e, 0x03 }, { 1750, 0x3e, 0x03 },
> +	{ 1800, 0x0e, 0x03 }, { 1850, 0x1e, 0x03 }, { 1900, 0x2f, 0x03 },
> +	{ 1950, 0x3f, 0x03 }, { 2000, 0x0f, 0x03 }, { 2050, 0x40, 0x03 },
> +	{ 2100, 0x41, 0x03 }, { 2150, 0x42, 0x03 }, { 2200, 0x43, 0x03 },
> +	{ 2250, 0x44, 0x03 }, {  2300, 0x45, 0x01 }, { 2350, 0x46, 0x01 },
> +	{ 2400, 0x47, 0x01 }, {  2450, 0x48, 0x01 }, { 2500, 0x49, 0x01 }
> +};
> +
> +struct dw_dsi_ipk {
> +	void __iomem *base;
> +	void __iomem *base_phy;
> +	struct clk *pllref_clk;
> +	struct dw_mipi_dsi *dsi;
> +	u32 lane_min_kbps;
> +	u32 lane_max_kbps;
> +	int range;
> +	int in_div;
> +	int loop_div;
> +};
> +
> +#define dw_mipi_dsi_to_dw_dsi_ipk(target) \
> +	container_of(target, struct dw_dsi_ipk, dsi)
> +
> +static void dw_dsi_write(struct dw_dsi_ipk *dsi, u32 reg, u32 val)
> +{
> +	writel(val, dsi->base + reg);
> +}
> +
> +static u32 dw_dsi_read(struct dw_dsi_ipk *dsi, u32 reg)
> +{
> +	return readl(dsi->base + reg);
> +}
> +
> +static void dw_phy_write(struct dw_dsi_ipk *dsi, u32 reg, u32 val)
> +{
> +	writel(val, dsi->base_phy + reg);
> +}
> +
> +static void dw_dsi_phy_write_part(struct dw_dsi_ipk *dsi, u32 reg_address,
> +				  u32 data, u8 shift, u8 width)
> +{
> +	u32 temp = dw_dsi_read(dsi, reg_address);
> +	u32 mask = (1 << width) - 1;
> +
> +	temp &= ~(mask << shift);
> +	temp |= (data & mask) << shift;
> +	dw_dsi_write(dsi, reg_address, temp);
> +}
> +
> +static void dw_dsi_phy_test_data_in(struct dw_dsi_ipk *dsi, u8 test_data)
> +{
> +	dw_dsi_phy_write_part(dsi, DW_DPHY_TST_CTRL1, test_data, 0, 8);
> +}
> +
> +static void dw_dsi_phy_test_clock(struct dw_dsi_ipk *dsi, int value)
> +{
> +	dw_dsi_phy_write_part(dsi, DW_DPHY_TST_CTRL0, value, 1, 1);
> +}
> +
> +static void dw_dsi_phy_test_en(struct dw_dsi_ipk *dsi, u8 on_falling_edge)
> +{
> +	dw_dsi_phy_write_part(dsi, DW_DPHY_TST_CTRL1, on_falling_edge, 16, 1);
> +}
> +
> +static void dw_dsi_phy_test_clear(struct dw_dsi_ipk *dsi, int value)
> +{
> +	dw_dsi_phy_write_part(dsi, DW_DPHY_TST_CTRL0, value, 0, 1);
> +}
> +
> +static void dw_dsi_phy_write(struct dw_dsi_ipk *dsi, u16 address,
> +			     u32 value, u8 data_length)
> +{
> +	u8 data[4];
> +	int i;
> +
> +	data[0] = value;
> +
> +	dw_dsi_write(dsi, DW_DPHY_TST_CTRL0, 0);
> +	dw_dsi_write(dsi, DW_DPHY_TST_CTRL1, 0);
> +
> +	dw_dsi_phy_test_en(dsi, 1);
> +	dw_dsi_phy_test_clock(dsi, 1);
> +	dw_dsi_phy_test_data_in(dsi, 0x00);
> +	dw_dsi_phy_test_clock(dsi, 0);
> +	dw_dsi_write(dsi, DW_DPHY_TST_CTRL1, 0);
> +	dw_dsi_write(dsi, DW_DPHY_TST_CTRL1, (u8)(address >> 8));
> +	dw_dsi_phy_test_clock(dsi, 1);
> +	dw_dsi_phy_test_clock(dsi, 0);
> +	dw_dsi_phy_test_en(dsi, 1);
> +	dw_dsi_phy_test_clock(dsi, 1);
> +	dw_dsi_phy_test_data_in(dsi, ((u8)address));
> +	dw_dsi_phy_test_clock(dsi, 0);
> +	dw_dsi_phy_test_en(dsi, 0);
> +
> +	for (i = data_length; i > 0; i--) {
> +		dw_dsi_phy_test_data_in(dsi, ((u8)data[i - 1]));
> +		dw_dsi_phy_test_clock(dsi, 1);
> +		dw_dsi_phy_test_clock(dsi, 0);
> +	}
> +}
> +
> +static void dw_dsi_phy_delay(struct dw_dsi_ipk *dsi, int value)
> +{
> +	u32 data = value << 2;
> +
> +	dw_dsi_phy_write(dsi, DW_12BITS_DPHY_RDY_L0, data, 1);
> +	dw_dsi_phy_write(dsi, DW_12BITS_DPHY_RDY_L1, data, 1);
> +	dw_dsi_phy_write(dsi, DW_12BITS_DPHY_RDY_L2, data, 1);
> +	dw_dsi_phy_write(dsi, DW_12BITS_DPHY_RDY_L3, data, 1);
> +}
> +
> +static int dsi_pll_get_clkout_khz(int clkin_khz, int idf, int ndiv, int odf)
> +{
> +	int divisor = idf * odf;
> +
> +	/* prevent from division by 0 */
> +	if (!divisor)
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST(clkin_khz * ndiv, divisor);
> +}
> +
> +static int dsi_pll_get_params(struct dw_dsi_ipk *dsi, int in_freq,
> +			      int out_freq, int *idf, int *ndiv, int *odf)
> +{
> +	int range, tmp_loop_div, tmp_in_freq, delta, step = 0, flag = 0;
> +	int out_data_rate = out_freq * 2;
> +	int loop_div = 0; /* M */
> +	int out_div; /* VCO */
> +	int in_div; /* N */
> +
> +	/* Find ranges */
> +	for (range = 0; ARRAY_SIZE(dw_range_gen3) &&
> +	     (out_data_rate / 1000) > dw_range_gen3[range].freq; range++)
> +		;
> +
> +	if (range >= ARRAY_SIZE(dw_range_gen3))
> +		return -EINVAL;
> +
> +	if ((dw_range_gen3[range].osc_freq_target >> 4) == 3)
> +		out_div = 8;
> +	else if ((dw_range_gen3[range].osc_freq_target >> 4) == 2)
> +		out_div = 4;
> +	else
> +		out_div = 2;
> +
> +	if (dw_range_gen3[range].freq > 640)
> +		out_div = 1;
> +
> +	out_freq = out_freq * out_div;
> +
> +	loop_div = (out_freq * (in_freq / DW_DPHY_DIV_LOWER_LIMIT)) / in_freq;
> +
> +	/* here delta will account for the rounding */
> +	delta = (loop_div * in_freq) / (in_freq / DW_DPHY_DIV_LOWER_LIMIT) -
> +		out_freq;
> +
> +	for (in_div = 1 + in_freq / DW_DPHY_DIV_UPPER_LIMIT;
> +	     (in_freq / in_div >= DW_DPHY_DIV_LOWER_LIMIT) && !flag; in_div++) {
> +		tmp_loop_div = out_freq * in_div / in_freq;
> +		tmp_in_freq = in_freq / in_div;
> +		if (tmp_loop_div % 2) {
> +			tmp_loop_div += 1;
> +			if (out_freq == tmp_loop_div * tmp_in_freq) {
> +				/* Exact values found */
> +				flag = 1;
> +				loop_div = tmp_loop_div;
> +				delta = tmp_loop_div * tmp_in_freq - out_freq;
> +				in_div--;
> +			} else if (tmp_loop_div * tmp_in_freq - out_freq <
> +				   delta) {
> +				/* Values found with smaller delta */
> +				loop_div = tmp_loop_div;
> +				delta = tmp_loop_div * tmp_in_freq - out_freq;
> +				step = 0;
> +			}
> +		} else if (out_freq == tmp_loop_div * tmp_in_freq) {
> +			/* Exact values found */
> +			flag = 1;
> +			loop_div = tmp_loop_div;
> +			delta = out_freq - tmp_loop_div * tmp_in_freq;
> +			in_div--;
> +		} else if (out_freq - tmp_loop_div * tmp_in_freq < delta) {
> +			/* Values found with smaller delta */
> +			loop_div = tmp_loop_div;
> +			delta = out_freq - tmp_loop_div * tmp_in_freq;
> +			step = 1;
> +		}
> +	}
> +
> +	if (!flag)
> +		in_div = step + loop_div * in_freq / out_freq;
> +
> +	*idf = in_div;
> +	*ndiv = loop_div;
> +	*odf = out_div;
> +
> +	dsi->range = range;
> +	dsi->in_div = in_div;
> +	dsi->loop_div = loop_div;
> +
> +	return 0;
> +}
> +
> +/* DPHY GEN 3 12 bits */
> +static void dw_phy_init_gen3_128(void *priv_data)
> +{
> +	struct dw_dsi_ipk *dsi = priv_data;
> +	int loop_div = dsi->loop_div;
> +	int in_div = dsi->in_div;
> +	int range = dsi->range;
> +	u32 data;
> +
> +	/* hs frequency range [6:0] */
> +	data = dw_range_gen3[range].hs_freq_range;
> +	dw_dsi_phy_write(dsi, 0x02, data, 1);
> +
> +	/* [7:6] reserved | [5] hsfreqrange_ovr_en_rw |
> +	 * [4:1] target_state_rw | [0] force_state_rw
> +	 */
> +	dw_dsi_phy_write(dsi, 0x01, 0x20, 1);
> +
> +	/* PLL Lock Configurations */
> +	dw_dsi_phy_write(dsi, 0x173, 0x02, 1);
> +	dw_dsi_phy_write(dsi, 0x174, 0x00, 1);
> +	dw_dsi_phy_write(dsi, 0x175, 0x60, 1);
> +	dw_dsi_phy_write(dsi, 0x176, 0x03, 1);
> +	dw_dsi_phy_write(dsi, 0x166, 0x01, 1);
> +
> +	/* Charge-pump Programmability */
> +	/* [7] pll_vco_cntrl_ovr_en |
> +	 * [6:1] pll_vco_cntrl_ovr | [0] pll_m_ovr_en
> +	 */
> +	if (dw_range_gen3[range].freq > 640)
> +		data = 1 | (dw_range_gen3[range].osc_freq_target << 1);
> +	else
> +		data = 1 | (1 << 7) |
> +			  (dw_range_gen3[range].osc_freq_target << 1);
> +
> +	dw_dsi_phy_write(dsi, 0x17b, data, 1);
> +	dw_dsi_phy_write(dsi, 0x15e, 0x10, 1);
> +	dw_dsi_phy_write(dsi, 0x162, 0x04, 1);
> +	dw_dsi_phy_write(dsi, 0x16e, 0x0c, 1);
> +
> +	/* Slew-Rate */
> +	dw_dsi_phy_write(dsi, 0x26b, 0x04, 1);
> +
> +	/* pll_n_ovr_en_rw | PLL input divider ratio [6:3] |
> +	 * pll_tstplldig_rw
> +	 */
> +	data = (1 << 7) | (in_div - 1) << 3;
> +	dw_dsi_phy_write(dsi, 0x178, data, 1);
> +
> +	/* PLL loop divider ratio [7:0] */
> +	data = loop_div - 2;
> +	dw_dsi_phy_write(dsi, 0x179, data, 1);
> +
> +	/* PLL loop divider ratio [9:8] */
> +	data = (loop_div - 2) >> 8;
> +	dw_dsi_phy_write(dsi, 0x17a, data, 1);
> +
> +	if (dw_range_gen3[range].freq < 450)
> +		dw_dsi_phy_write(dsi, 0x1ac, 0x1b, 1);
> +	else
> +		dw_dsi_phy_write(dsi, 0x1ac, 0x0b, 1);
> +}
> +
> +static int dw_mipi_dsi_phy_init(void *priv_data)
> +{
> +	struct dw_dsi_ipk *dsi = priv_data;
> +	int range = dsi->range;
> +	unsigned int in_freq;
> +	u32 data;
> +
> +	in_freq = (unsigned int)(clk_get_rate(dsi->pllref_clk) / 1000);
> +
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, RESET);
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, GLUE_LOGIC);
> +	dw_dsi_phy_test_clear(dsi, 1);
> +	dw_dsi_phy_test_clear(dsi, 0);
> +
> +	dw_dsi_phy_write(dsi, 0x30, 0x0f, 1);
> +
> +	data = ((in_freq / 1000) - 17) * 4;
> +	dw_dsi_phy_write(dsi, 0x02, data, 1);
> +
> +	dw_dsi_phy_write(dsi, 0x20, 0x3f, 1);
> +
> +	/* RESET RX */
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, RESET);
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, RX_PHY);
> +	dw_dsi_phy_test_clear(dsi, 1);
> +	dw_dsi_phy_test_clear(dsi, 0);
> +
> +	/* RESET TX */
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, RESET);
> +	dw_phy_write(dsi, DW_GEN3_IF_TESTER, TX_PHY);
> +	dw_dsi_phy_test_clear(dsi, 1);
> +	dw_dsi_phy_test_clear(dsi, 0);
> +
> +	dw_phy_init_gen3_128(priv_data);
> +
> +	if (dw_range_gen3[range].freq > 648)
> +		dw_dsi_phy_delay(dsi, 5);
> +	else
> +		dw_dsi_phy_delay(dsi, 4);
> +
> +	DRM_DEBUG_DRIVER("Phy configured\n");
> +
> +	return 0;
> +}
> +
> +static int
> +dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
> +			  unsigned long mode_flags, u32 lanes, u32 format,
> +			  unsigned int *lane_mbps)
> +{
> +	int idf = 0, ndiv = 0, odf = 0, pll_in_khz, pll_out_khz, ret, bpp;
> +	struct dw_dsi_ipk *dsi = priv_data;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	dsi->lane_min_kbps = (unsigned int)DW_LANE_MIN_KBPS;
> +	dsi->lane_max_kbps = (unsigned int)DW_LANE_MAX_KBPS;
> +
> +	pll_in_khz = (unsigned int)(clk_get_rate(dsi->pllref_clk) / 1000);
> +
> +	/* Compute requested pll out */
> +	bpp = mipi_dsi_pixel_format_to_bpp((enum mipi_dsi_pixel_format)format);
> +	pll_out_khz = ((mode->clock * bpp) / lanes) / 2;
> +
> +	if (pll_out_khz > dsi->lane_max_kbps) {
> +		pll_out_khz = dsi->lane_max_kbps;
> +		DRM_WARN("Warning max phy mbps is used\n");
> +	}
> +
> +	if (pll_out_khz < dsi->lane_min_kbps) {
> +		pll_out_khz = dsi->lane_min_kbps;
> +		DRM_WARN("Warning min phy mbps is used\n");
> +	}
> +
> +	ret = dsi_pll_get_params(dsi, pll_in_khz, pll_out_khz,
> +				 &idf, &ndiv, &odf);
> +	if (ret)
> +		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
> +
> +	/* Get the adjusted pll out value */
> +	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
> +
> +	*lane_mbps = (pll_out_khz / 1000) * 2;
> +
> +	DRM_DEBUG_DRIVER("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> +			 pll_in_khz, pll_out_khz, *lane_mbps);
> +
> +	return ret;
> +}
> +
> +static int
> +dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
> +			   struct dw_mipi_dsi_dphy_timing *timing)
> +{
> +	timing->clk_hs2lp = DW_LPHS_TIM_TRANSIONS;
> +	timing->clk_lp2hs = DW_LPHS_TIM_TRANSIONS;
> +	timing->data_hs2lp = DW_LPHS_TIM_TRANSIONS;
> +	timing->data_lp2hs = DW_LPHS_TIM_TRANSIONS;
> +
> +	return 0;
> +}
> +
> +static const struct dw_mipi_dsi_phy_ops dw_dsi_ipk_phy_ops = {
> +	.init = dw_mipi_dsi_phy_init,
> +	.get_lane_mbps = dw_mipi_dsi_get_lane_mbps,
> +	.get_timing = dw_mipi_dsi_phy_get_timing,
> +};
> +
> +static struct dw_mipi_dsi_plat_data dw_dsi_ipk_plat_data = {
> +	.max_data_lanes = 4,
> +	.phy_ops = &dw_dsi_ipk_phy_ops,
> +};
> +
> +static const struct of_device_id dw_ipk_dt_ids[] = {
> +	{.compatible = "snps,dw-ipk-dsi",
> +	 .data = &dw_dsi_ipk_plat_data,},
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, dw_ipk_dt_ids);
> +
> +static int dw_dsi_ipk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_dsi_ipk *dsi;
> +	struct resource *res;
> +	struct clk *pclk;
> +	int ret;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi");
> +	dsi->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(dsi->base)) {
> +		ret = PTR_ERR(dsi->base);
> +		DRM_ERROR("Unable to get dsi registers %d\n", ret);
> +		return ret;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
> +	dsi->base_phy = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(dsi->base_phy)) {
> +		ret = PTR_ERR(dsi->base_phy);
> +		DRM_ERROR("Unable to get PHY registers %d\n", ret);
> +		return ret;
> +	}
> +
> +	pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(pclk)) {
> +		ret = PTR_ERR(pclk);
> +		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
> +		goto err_dsi_probe;
> +	}
> +
> +	ret = clk_prepare_enable(pclk);
> +	if (ret)
> +		goto err_dsi_probe;
> +
> +	dsi->pllref_clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(dsi->pllref_clk)) {
> +		ret = PTR_ERR(dsi->pllref_clk);
> +		DRM_ERROR("Unable to get pll reference clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(dsi->pllref_clk);
> +	if (ret)
> +		return ret;
> +
> +	dw_dsi_ipk_plat_data.base = dsi->base;
> +	dw_dsi_ipk_plat_data.priv_data = dsi;
> +
> +	platform_set_drvdata(pdev, dsi);
> +
> +	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_dsi_ipk_plat_data);
> +	if (IS_ERR(dsi->dsi)) {
> +		ret = PTR_ERR(dsi->dsi);
> +		DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
> +		goto err_dsi_probe;
> +	}
> +
> +	return ret;
> +
> +err_dsi_probe:
> +	clk_disable_unprepare(dsi->pllref_clk);
> +	return ret;
> +}
> +
> +static int dw_dsi_ipk_remove(struct platform_device *pdev)
> +{
> +	struct dw_dsi_ipk *dsi = platform_get_drvdata(pdev);
> +
> +	dw_mipi_dsi_remove(dsi->dsi);
> +
> +	return 0;
> +}
> +
> +struct platform_driver dw_mipi_dsi_ipk_driver = {
> +	.probe		= dw_dsi_ipk_probe,
> +	.remove		= dw_dsi_ipk_remove,
> +	.driver		= {
> +		.name	= "ipk-dw-mipi-dsi",
> +		.of_match_table = dw_ipk_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(dw_mipi_dsi_ipk_driver);
> +
> +MODULE_AUTHOR("Angelo Ribeiro <angelo.ribeiro@synopsys.com>");
> +MODULE_AUTHOR("Luis Oliveira <luis.oliveira@synopsys.com>");
> +MODULE_DESCRIPTION("Synopsys IPK DW MIPI DSI host controller driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
