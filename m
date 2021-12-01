Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5AC464BD9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 11:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDA56EC5C;
	Wed,  1 Dec 2021 10:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137E36EC5C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 10:42:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r25so34315304edq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 02:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLIl29iU9jX4OOY2mL8eUzrO/SQMUtUmDmIPusCglEE=;
 b=PRtqF6G4/cJKKBhzs+wOIKzGibsPOwGPC60+AkikP2887PNtWiZSKGRipmxn73IWuR
 ZQTYHrZsIDwqf8o8Oqp4SHiRNLnxCAsEAjZEDCD0xAtAfT1oSbIh/HljTqi76u3D8Qqs
 D+nHplx2oMkPVBkaKoqb1UQo9WMGBeRhZIGgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLIl29iU9jX4OOY2mL8eUzrO/SQMUtUmDmIPusCglEE=;
 b=eKe0SsyL9yhXerdtmmgOe0VPOXGZODA7Dqg1Y0Pfsyit8slVAnDtx5gOJ21hWuXxkl
 GmmRClg2fEOfEz8M009eYHCWch14bJJVY2bBL2L6AlIa239fSnTaure8pI63aSkyph0I
 D3XJ6F1wzOWpxLaH+L1NKYjrzMInxUeyGOffpj7vIJy4Ph4LSN/cOl19ZcwueeSe6642
 Ik5T1wZZWq9N+DLtQaiAuSvD2Xg9ezug01wd4Bftp+AaGsWhX2zcGXazW96FDs+Wpg3Z
 8uSxn+i9CvUjIbJILDMhZZDEk7jBMhUhD3gB5mJZWfvvjaUOUaTjWjimLvY6tmbwibSf
 nqxA==
X-Gm-Message-State: AOAM531f90XlCYDEwg9+vzleICZN6bOw7aSLVzKBh/xKpNCmzTf/HalK
 lRN8PCz8ivXqQiebViSbokuxgBmrYhEP6Zg2Z+OfIw==
X-Google-Smtp-Source: ABdhPJw7PoNOYAxPv6FXRCLmxm/7w4JfkhALXSfPz/nFmTesTatsSIShSqv3r4kwt0JrRco5VWq48n7r4AvaeUS328Q=
X-Received: by 2002:a05:6402:254b:: with SMTP id
 l11mr7408639edb.225.1638355370286; 
 Wed, 01 Dec 2021 02:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20211201052406.13074-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 1 Dec 2021 16:12:39 +0530
Message-ID: <CAMty3ZBV6QGXc35UaK6oziiiZpRCeoM6ewB=YODxHYnHP1X2qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm: rcar-du: Add R-Car DSI driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 1, 2021 at 10:54 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
> SoC. It currently supports DSI mode only.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v2:
>
> - Support probing of child DSI devices
> - Use devm_drm_of_get_bridge() helper
>
> Changes since v1:
>
> - Use U suffix for unsigned constants
> - Fix indentation in Makefile
> - Select DRM_MIPI_DSI
> - Report correct fout frequency in debug message
> - Move dsi_setup_info.err to local variable
> ---
>  drivers/gpu/drm/rcar-du/Kconfig              |   7 +
>  drivers/gpu/drm/rcar-du/Makefile             |   1 +
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 817 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h | 172 ++++
>  4 files changed, 997 insertions(+)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
>
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 3e588ddba245..1675df21d91f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -45,6 +45,13 @@ config DRM_RCAR_LVDS
>         select OF_FLATTREE
>         select OF_OVERLAY
>
> +config DRM_RCAR_MIPI_DSI
> +       tristate "R-Car DU MIPI DSI Encoder Support"
> +       depends on DRM && DRM_BRIDGE && OF
> +       select DRM_MIPI_DSI
> +       help
> +         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> +
>  config DRM_RCAR_VSP
>         bool "R-Car DU VSP Compositor Support" if ARM
>         default y if ARM64
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 4d1187ccc3e5..286bc81b3e7c 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_RCAR_CMM)            += rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)              += rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)         += rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)            += rcar_lvds.o
> +obj-$(CONFIG_DRM_RCAR_MIPI_DSI)                += rcar_mipi_dsi.o
>
>  # 'remote-endpoint' is fixed up at run-time
>  DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> new file mode 100644
> index 000000000000..fcaec3308d68
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -0,0 +1,817 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_mipi_dsi.c  --  R-Car MIPI DSI Encoder
> + *
> + * Copyright (C) 2020 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rcar_mipi_dsi_regs.h"
> +
> +struct rcar_mipi_dsi {
> +       struct device *dev;
> +       const struct rcar_mipi_dsi_device_info *info;
> +       struct reset_control *rstc;
> +
> +       struct mipi_dsi_host host;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct drm_connector connector;
> +
> +       void __iomem *mmio;
> +       struct {
> +               struct clk *mod;
> +               struct clk *pll;
> +               struct clk *dsi;
> +       } clocks;
> +
> +       struct drm_display_mode display_mode;
> +       enum mipi_dsi_pixel_format format;
> +       unsigned int num_data_lanes;
> +       unsigned int lanes;
> +};
> +
> +static inline struct rcar_mipi_dsi *
> +bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct rcar_mipi_dsi, bridge);
> +}
> +
> +static inline struct rcar_mipi_dsi *
> +host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
> +{
> +       return container_of(host, struct rcar_mipi_dsi, host);
> +}
> +
> +static const u32 phtw[] = {
> +       0x01020114, 0x01600115, /* General testing */
> +       0x01030116, 0x0102011d, /* General testing */
> +       0x011101a4, 0x018601a4, /* 1Gbps testing */
> +       0x014201a0, 0x010001a3, /* 1Gbps testing */
> +       0x0101011f,             /* 1Gbps testing */
> +};
> +
> +static const u32 phtw2[] = {
> +       0x010c0130, 0x010c0140, /* General testing */
> +       0x010c0150, 0x010c0180, /* General testing */
> +       0x010c0190,
> +       0x010a0160, 0x010a0170,
> +       0x01800164, 0x01800174, /* 1Gbps testing */
> +};
> +
> +static const u32 hsfreqrange_table[][2] = {
> +       { 80000000U,   0x00 }, { 90000000U,   0x10 }, { 100000000U,  0x20 },
> +       { 110000000U,  0x30 }, { 120000000U,  0x01 }, { 130000000U,  0x11 },
> +       { 140000000U,  0x21 }, { 150000000U,  0x31 }, { 160000000U,  0x02 },
> +       { 170000000U,  0x12 }, { 180000000U,  0x22 }, { 190000000U,  0x32 },
> +       { 205000000U,  0x03 }, { 220000000U,  0x13 }, { 235000000U,  0x23 },
> +       { 250000000U,  0x33 }, { 275000000U,  0x04 }, { 300000000U,  0x14 },
> +       { 325000000U,  0x25 }, { 350000000U,  0x35 }, { 400000000U,  0x05 },
> +       { 450000000U,  0x16 }, { 500000000U,  0x26 }, { 550000000U,  0x37 },
> +       { 600000000U,  0x07 }, { 650000000U,  0x18 }, { 700000000U,  0x28 },
> +       { 750000000U,  0x39 }, { 800000000U,  0x09 }, { 850000000U,  0x19 },
> +       { 900000000U,  0x29 }, { 950000000U,  0x3a }, { 1000000000U, 0x0a },
> +       { 1050000000U, 0x1a }, { 1100000000U, 0x2a }, { 1150000000U, 0x3b },
> +       { 1200000000U, 0x0b }, { 1250000000U, 0x1b }, { 1300000000U, 0x2b },
> +       { 1350000000U, 0x3c }, { 1400000000U, 0x0c }, { 1450000000U, 0x1c },
> +       { 1500000000U, 0x2c }, { 1550000000U, 0x3d }, { 1600000000U, 0x0d },
> +       { 1650000000U, 0x1d }, { 1700000000U, 0x2e }, { 1750000000U, 0x3e },
> +       { 1800000000U, 0x0e }, { 1850000000U, 0x1e }, { 1900000000U, 0x2f },
> +       { 1950000000U, 0x3f }, { 2000000000U, 0x0f }, { 2050000000U, 0x40 },
> +       { 2100000000U, 0x41 }, { 2150000000U, 0x42 }, { 2200000000U, 0x43 },
> +       { 2250000000U, 0x44 }, { 2300000000U, 0x45 }, { 2350000000U, 0x46 },
> +       { 2400000000U, 0x47 }, { 2450000000U, 0x48 }, { 2500000000U, 0x49 },
> +       { /* sentinel */ },
> +};
> +
> +struct vco_cntrl_value {
> +       u32 min_freq;
> +       u32 max_freq;
> +       u16 value;
> +};
> +
> +static const struct vco_cntrl_value vco_cntrl_table[] = {
> +       { .min_freq = 40000000U,   .max_freq = 55000000U,   .value = 0x3f },
> +       { .min_freq = 52500000U,   .max_freq = 80000000U,   .value = 0x39 },
> +       { .min_freq = 80000000U,   .max_freq = 110000000U,  .value = 0x2f },
> +       { .min_freq = 105000000U,  .max_freq = 160000000U,  .value = 0x29 },
> +       { .min_freq = 160000000U,  .max_freq = 220000000U,  .value = 0x1f },
> +       { .min_freq = 210000000U,  .max_freq = 320000000U,  .value = 0x19 },
> +       { .min_freq = 320000000U,  .max_freq = 440000000U,  .value = 0x0f },
> +       { .min_freq = 420000000U,  .max_freq = 660000000U,  .value = 0x09 },
> +       { .min_freq = 630000000U,  .max_freq = 1149000000U, .value = 0x03 },
> +       { .min_freq = 1100000000U, .max_freq = 1152000000U, .value = 0x01 },
> +       { .min_freq = 1150000000U, .max_freq = 1250000000U, .value = 0x01 },
> +       { /* sentinel */ },
> +};
> +
> +static void rcar_mipi_dsi_write(struct rcar_mipi_dsi *dsi, u32 reg, u32 data)
> +{
> +       iowrite32(data, dsi->mmio + reg);
> +}
> +
> +static u32 rcar_mipi_dsi_read(struct rcar_mipi_dsi *dsi, u32 reg)
> +{
> +       return ioread32(dsi->mmio + reg);
> +}
> +
> +static void rcar_mipi_dsi_clr(struct rcar_mipi_dsi *dsi, u32 reg, u32 clr)
> +{
> +       rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) & ~clr);
> +}
> +
> +static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 set)
> +{
> +       rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) | set);
> +}
> +
> +static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
> +{
> +       u32 status;
> +       int ret;
> +
> +       rcar_mipi_dsi_write(dsi, PHTW, phtw);
> +
> +       ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               !(status & (PHTW_DWEN | PHTW_CWEN)),
> +                               2000, 10000, false, dsi, PHTW);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "PHY test interface write timeout (0x%08x)\n",
> +                       phtw);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Hardware Setup
> + */
> +
> +struct dsi_setup_info {
> +       unsigned long fout;
> +       u16 vco_cntrl;
> +       u16 prop_cntrl;
> +       u16 hsfreqrange;
> +       u16 div;
> +       unsigned int m;
> +       unsigned int n;
> +};
> +
> +static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
> +                                         struct clk *clk, unsigned long target,
> +                                         struct dsi_setup_info *setup_info)
> +{
> +
> +       const struct vco_cntrl_value *vco_cntrl;
> +       unsigned long fout_target;
> +       unsigned long fin, fout;
> +       unsigned long hsfreq;
> +       unsigned int best_err = -1;
> +       unsigned int divider;
> +       unsigned int n;
> +       unsigned int i;
> +       unsigned int err;
> +
> +       /*
> +        * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> +        * The range out Fout is [40 - 1250] Mhz
> +        */
> +       fout_target = target * mipi_dsi_pixel_format_to_bpp(dsi->format)
> +                   / (2 * dsi->lanes);
> +       if (fout_target < 40000000 || fout_target > 1250000000)
> +               return;
> +
> +       /* Find vco_cntrl */
> +       for (vco_cntrl = vco_cntrl_table; vco_cntrl->min_freq != 0; vco_cntrl++) {
> +               if (fout_target > vco_cntrl->min_freq &&
> +                   fout_target <= vco_cntrl->max_freq) {
> +                       setup_info->vco_cntrl = vco_cntrl->value;
> +                       if (fout_target >= 1150000000)
> +                               setup_info->prop_cntrl = 0x0c;
> +                       else
> +                               setup_info->prop_cntrl = 0x0b;
> +                       break;
> +               }
> +       }
> +
> +       /* Add divider */
> +       setup_info->div = (setup_info->vco_cntrl & 0x30) >> 4;
> +
> +       /* Find hsfreqrange */
> +       hsfreq = fout_target * 2;
> +       for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
> +               if (hsfreq > hsfreqrange_table[i][0] &&
> +                       hsfreq <= hsfreqrange_table[i+1][0]) {
> +                       setup_info->hsfreqrange = hsfreqrange_table[i+1][1];
> +                       break;
> +               }
> +       }
> +
> +       /*
> +        * Calculate n and m for PLL clock
> +        * Following the HW manual the ranges of n and m are
> +        * n = [3-8] and m = [64-625]
> +        */
> +       fin = clk_get_rate(clk);
> +       divider = 1 << setup_info->div;
> +       for (n = 3; n < 9; n++) {
> +               unsigned long fpfd;
> +               unsigned int m;
> +
> +               fpfd = fin / n;
> +
> +               for (m = 64; m < 626; m++) {
> +                       fout = fpfd * m / divider;
> +                       err = abs((long)(fout - fout_target) * 10000 /
> +                                 (long)fout_target);
> +                       if (err < best_err) {
> +                               setup_info->m = m - 2;
> +                               setup_info->n = n - 1;
> +                               setup_info->fout = fout;
> +                               best_err = err;
> +                               if (err == 0)
> +                                       goto done;
> +                       }
> +               }
> +       }
> +
> +done:
> +       dev_dbg(dsi->dev,
> +               "%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
> +               clk, fin, setup_info->fout, fout_target, best_err / 100,
> +               best_err % 100, setup_info->m, setup_info->n, setup_info->div);
> +       dev_dbg(dsi->dev,
> +               "vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
> +               setup_info->vco_cntrl, setup_info->prop_cntrl,
> +               setup_info->hsfreqrange);
> +}
> +
> +static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi)
> +{
> +       struct drm_display_mode *mode = &dsi->display_mode;
> +       u32 setr;
> +       u32 vprmset0r;
> +       u32 vprmset1r;
> +       u32 vprmset2r;
> +       u32 vprmset3r;
> +       u32 vprmset4r;
> +
> +       /* Configuration for Pixel Stream and Packet Header */
> +       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> +       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> +       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
> +       else {
> +               dev_warn(dsi->dev, "unsupported format");
> +               return;
> +       }
> +
> +       /* Configuration for Blanking sequence and Input Pixel */
> +       setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
> +            | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
> +            | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
> +       rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
> +
> +       /* Configuration for Video Parameters */
> +       vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
> +                    TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
> +                 | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
> +                    TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
> +                 | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
> +
> +       vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
> +                 | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
> +
> +       vprmset2r = TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdisplay)
> +                 | TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
> +
> +       vprmset3r = TXVMVPRMSET3R_HACTIVE(mode->hdisplay)
> +                 | TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start);
> +
> +       vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay)
> +                 | TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
> +
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET0R, vprmset0r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET1R, vprmset1r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET2R, vprmset2r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET3R, vprmset3r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET4R, vprmset4r);
> +}
> +
> +static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
> +{
> +       struct drm_display_mode *mode = &dsi->display_mode;
> +       struct dsi_setup_info setup_info = {};
> +       unsigned int timeout;
> +       int ret, i;
> +       int dsi_format;
> +       u32 phy_setup;
> +       u32 clockset2, clockset3;
> +       u32 ppisetr;
> +       u32 vclkset;
> +
> +       /* Checking valid format */
> +       dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +       if (dsi_format < 0) {
> +               dev_warn(dsi->dev, "invalid format");
> +               return -EINVAL;
> +       }
> +
> +       /* Parameters Calculation */
> +       rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
> +                                     mode->clock * 1000, &setup_info);
> +
> +       /* LPCLK enable */
> +       rcar_mipi_dsi_set(dsi, LPCLKSET, LPCLKSET_CKEN);
> +
> +       /* CFGCLK enabled */
> +       rcar_mipi_dsi_set(dsi, CFGCLKSET, CFGCLKSET_CKEN);
> +
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +
> +       rcar_mipi_dsi_set(dsi, PHTC, PHTC_TESTCLR);
> +       rcar_mipi_dsi_clr(dsi, PHTC, PHTC_TESTCLR);
> +
> +       /* PHY setting */
> +       phy_setup = rcar_mipi_dsi_read(dsi, PHYSETUP);
> +       phy_setup &= ~PHYSETUP_HSFREQRANGE_MASK;
> +       phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
> +       rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
> +
> +       for (i = 0; i < ARRAY_SIZE(phtw); i++) {
> +               ret = rcar_mipi_dsi_phtw_test(dsi, phtw[i]);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       /* PLL Clock Setting */
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +       rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +
> +       clockset2 = CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.n)
> +                 | CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
> +       clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl)
> +                 | CLOCKSET3_INT_CNTRL(0)
> +                 | CLOCKSET3_CPBIAS_CNTRL(0x10)
> +                 | CLOCKSET3_GMP_CNTRL(1);
> +       rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
> +       rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
> +
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +       rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +       udelay(10);
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +
> +       ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
> +       rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
> +
> +       rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +       rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       usleep_range(400, 500);
> +
> +       /* Checking PPI clock status register */
> +       for (timeout = 10; timeout > 0; --timeout) {
> +               if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
> +                   (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
> +                   (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
> +                       break;
> +
> +               usleep_range(1000, 2000);
> +       }
> +
> +       if (!timeout) {
> +               dev_err(dsi->dev, "failed to enable PPI clock\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(phtw2); i++) {
> +               ret = rcar_mipi_dsi_phtw_test(dsi, phtw2[i]);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       /* Enable DOT clock */
> +       vclkset = VCLKSET_CKEN;
> +       rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +
> +       if (dsi_format == 24)
> +               vclkset |= VCLKSET_BPP_24;
> +       else if (dsi_format == 18)
> +               vclkset |= VCLKSET_BPP_18;
> +       else if (dsi_format == 16)
> +               vclkset |= VCLKSET_BPP_16;
> +       else {
> +               dev_warn(dsi->dev, "unsupported format");
> +               return -EINVAL;
> +       }
> +       vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
> +               |  VCLKSET_LANE(dsi->lanes - 1);
> +
> +       rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +
> +       /* After setting VCLKSET register, enable VCLKEN */
> +       rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
> +
> +       dev_dbg(dsi->dev, "DSI device is started\n");
> +
> +       return 0;
> +}
> +
> +static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
> +{
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +
> +       dev_dbg(dsi->dev, "DSI device is shutdown\n");
> +}
> +
> +static int rcar_mipi_dsi_clk_enable(struct rcar_mipi_dsi *dsi)
> +{
> +       int ret;
> +
> +       reset_control_deassert(dsi->rstc);
> +
> +       ret = clk_prepare_enable(dsi->clocks.mod);
> +       if (ret < 0)
> +               goto err_reset;
> +
> +       ret = clk_prepare_enable(dsi->clocks.dsi);
> +       if (ret < 0)
> +               goto err_clock;
> +
> +       return 0;
> +
> +err_clock:
> +       clk_disable_unprepare(dsi->clocks.mod);
> +err_reset:
> +       reset_control_assert(dsi->rstc);
> +       return ret;
> +}
> +
> +static void rcar_mipi_dsi_clk_disable(struct rcar_mipi_dsi *dsi)
> +{
> +       clk_disable_unprepare(dsi->clocks.dsi);
> +       clk_disable_unprepare(dsi->clocks.mod);
> +
> +       reset_control_assert(dsi->rstc);
> +}
> +
> +static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
> +{
> +       /*
> +        * In HW manual, we need to check TxDDRClkHS-Q Stable? but it dont
> +        * write how to check. So we skip this check in this patch
> +        */
> +       u32 status;
> +       int ret;
> +
> +       /* Start HS clock. */
> +       rcar_mipi_dsi_set(dsi, PPICLCR, PPICLCR_TXREQHS);
> +
> +       ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & PPICLSR_TOHS,
> +                               2000, 10000, false, dsi, PPICLSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable HS clock\n");
> +               return ret;
> +       }
> +
> +       rcar_mipi_dsi_set(dsi, PPICLSCR, PPICLSCR_TOHS);
> +
> +       return 0;
> +}
> +
> +static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
> +{
> +       u32 status;
> +       int ret;
> +
> +       /* Wait for the link to be ready. */
> +       ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               !(status & (LINKSR_LPBUSY | LINKSR_HSBUSY)),
> +                               2000, 10000, false, dsi, LINKSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Link failed to become ready\n");
> +               return ret;
> +       }
> +
> +       /* De-assert video FIFO clear. */
> +       rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
> +
> +       ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & TXVMSR_VFRDY,
> +                               2000, 10000, false, dsi, TXVMSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Failed to de-assert video FIFO clear\n");
> +               return ret;
> +       }
> +
> +       /* Enable transmission in video mode. */
> +       rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_EN_VIDEO);
> +
> +       ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & TXVMSR_RDY,
> +                               2000, 10000, false, dsi, TXVMSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Failed to enable video transmission\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
> +static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
> +                                flags);
> +}
> +
> +static void rcar_mipi_dsi_mode_set(struct drm_bridge *bridge,
> +                                  const struct drm_display_mode *mode,
> +                                  const struct drm_display_mode *adjusted_mode)
> +{
> +       struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +       dsi->display_mode = *adjusted_mode;
> +}
> +
> +static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
> +{
> +       struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +       int ret;
> +
> +       ret = rcar_mipi_dsi_clk_enable(dsi);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable DSI clocks\n");
> +               return;
> +       }
> +
> +       ret = rcar_mipi_dsi_startup(dsi);
> +       if (ret < 0)
> +               goto err_dsi_startup;
> +
> +       rcar_mipi_dsi_set_display_timing(dsi);
> +
> +       ret = rcar_mipi_dsi_start_hs_clock(dsi);
> +       if (ret < 0)
> +               goto err_dsi_start_hs;
> +
> +       rcar_mipi_dsi_start_video(dsi);
> +
> +       return;
> +
> +err_dsi_start_hs:
> +       rcar_mipi_dsi_shutdown(dsi);
> +err_dsi_startup:
> +       rcar_mipi_dsi_clk_disable(dsi);
> +}
> +
> +static void rcar_mipi_dsi_disable(struct drm_bridge *bridge)
> +{
> +       struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +       rcar_mipi_dsi_shutdown(dsi);
> +       rcar_mipi_dsi_clk_disable(dsi);
> +}
> +
> +static enum drm_mode_status
> +rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +                               const struct drm_display_info *info,
> +                               const struct drm_display_mode *mode)
> +{
> +       if (mode->clock > 297000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
> +       .attach = rcar_mipi_dsi_attach,
> +       .mode_set = rcar_mipi_dsi_mode_set,
> +       .enable = rcar_mipi_dsi_enable,
> +       .disable = rcar_mipi_dsi_disable,

Can the new bridge drivers start using atomic function calls?

Jagan.
