Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8497CA44E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289210E176;
	Mon, 16 Oct 2023 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ACC10E176
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:37:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98E5DCE1362
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FF1C433B9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697449017;
 bh=qdzj79GxjVduoH+bIxug5yDVSUjAmrZeZCOqoyqgZog=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=im9z2JeKqvu9gxxz3VEu7F+QlSZETu0KvyIg1A0IxbDhn1/l3iAkJbwTZfZB6OUyr
 mi9rMZtZBwVFWrFKWQ8Z+fc8ewSeh+J5U+SlWdnPVxWkKELcHuClKWHKHT3DRocRzz
 1ptWKvuSVLjIAYGGsGKX9giq9NyicvS6mPY79pCZeCAYL1Ga+H5E2C8VzlQt1d6jtK
 gDO798CcNJ+LjBR1i/y3Zo3UyWqXzkWXGRLj2RRObYYM+9bcKB1I7AVslze0jsMzyL
 DAu96z+QcCiV54SisjEUSZRwSI/htvFalyKmGJUZBwp0wEwXyckpHdB/8KGH4AidXe
 xuDeAf554Fwyg==
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-27d153c7f00so2647277a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:36:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YzMjfLrcamDuwqftZ1ixayHRUx2h43ABmkxpsziXOQSmJkzK8sm
 MIGrifz4yoZTZUnBXL7BpmbhDgex+8elAj7X9GdAmQ==
X-Google-Smtp-Source: AGHT+IEVGNqs2alsqliELarTsHzR+3eTyqUkJPoEpbXihnRt0MVrYX/x1WugI9Rvmg/dKriX4dGYn2YIpMcx+SLnm+I=
X-Received: by 2002:a17:90b:118a:b0:27d:19ef:fa2c with SMTP id
 gk10-20020a17090b118a00b0027d19effa2cmr9509834pjb.14.1697449016748; Mon, 16
 Oct 2023 02:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230821034008.3876938-1-victor.liu@nxp.com>
 <20230821034008.3876938-10-victor.liu@nxp.com>
In-Reply-To: <20230821034008.3876938-10-victor.liu@nxp.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 11:36:45 +0200
X-Gmail-Original-Message-ID: <CAN6tsi73J16xHNC704s8TX8ytNY5=os6CjYrTUSLAr64inR4RA@mail.gmail.com>
Message-ID: <CAN6tsi73J16xHNC704s8TX8ytNY5=os6CjYrTUSLAr64inR4RA@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
To: Liu Ying <victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, zyw@rock-chips.com, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 yannick.fertre@foss.st.com, hjc@rock-chips.com, philippe.cornu@foss.st.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 5:38=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> controller and a Synopsys Designware MIPI DPHY.  Some configurations
> and extensions to them are controlled by i.MX93 media blk-ctrl.
>
> Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Select GENERIC_PHY to fix Kconfig warning for GENERIC_PHY_MIPI_DPHY
>   dependency.
>
> v1->v2:
> * Use dev_err_probe() to replace DRM_DEV_ERROR().  (Sam and Alexander)
> * Use dev_*() to replace DRM_*().  (Sam)
> * Fix build for arm architecture.
>   (Reported-by: kernel test robot <lkp@intel.com>)
> * Improve error messages for imx93_dsi_phy_init().
>
>  drivers/gpu/drm/bridge/imx/Kconfig          |  11 +
>  drivers/gpu/drm/bridge/imx/Makefile         |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 917 ++++++++++++++++++++
>  3 files changed, 929 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 9fae28db6aa7..5a4f3d58501e 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -49,4 +49,15 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>           Choose this to enable pixel link to display pixel interface(PXL=
2DPI)
>           found in Freescale i.MX8qxp processor.
>
> +config DRM_IMX93_MIPI_DSI
> +       tristate "Freescale i.MX93 specific extensions for Synopsys DW MI=
PI DSI"
> +       depends on OF
> +       depends on COMMON_CLK
> +       select DRM_DW_MIPI_DSI
> +       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
> +       help
> +         Choose this to enable MIPI DSI controller found in Freescale i.=
MX93
> +         processor.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index 8e2ebf3399a1..2b0c2e44aa1b 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_IMX8QXP_LDB) +=3D imx8qxp-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> +obj-$(CONFIG_DRM_IMX93_MIPI_DSI) +=3D imx93-mipi-dsi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/imx/imx93-mipi-dsi.c
> new file mode 100644
> index 000000000000..3ff30ce80c5b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -0,0 +1,917 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2022,2023 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/math.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/dw_mipi_dsi.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +
> +/* DPHY PLL configuration registers */
> +#define DSI_REG                                0x4c
> +#define  CFGCLKFREQRANGE_MASK          GENMASK(5, 0)
> +#define  CFGCLKFREQRANGE(x)            FIELD_PREP(CFGCLKFREQRANGE_MASK, =
(x))
> +#define  CLKSEL_MASK                   GENMASK(7, 6)
> +#define  CLKSEL_STOP                   FIELD_PREP(CLKSEL_MASK, 0)
> +#define  CLKSEL_GEN                    FIELD_PREP(CLKSEL_MASK, 1)
> +#define  CLKSEL_EXT                    FIELD_PREP(CLKSEL_MASK, 2)
> +#define  HSFREQRANGE_MASK              GENMASK(14, 8)
> +#define  HSFREQRANGE(x)                        FIELD_PREP(HSFREQRANGE_MA=
SK, (x))
> +#define  UPDATE_PLL                    BIT(17)
> +#define  SHADOW_CLR                    BIT(18)
> +#define  CLK_EXT                       BIT(19)
> +
> +#define DSI_WRITE_REG0                 0x50
> +#define  M_MASK                                GENMASK(9, 0)
> +#define  M(x)                          FIELD_PREP(M_MASK, ((x) - 2))
> +#define  N_MASK                                GENMASK(13, 10)
> +#define  N(x)                          FIELD_PREP(N_MASK, ((x) - 1))
> +#define  VCO_CTRL_MASK                 GENMASK(19, 14)
> +#define  VCO_CTRL(x)                   FIELD_PREP(VCO_CTRL_MASK, (x))
> +#define  PROP_CTRL_MASK                        GENMASK(25, 20)
> +#define  PROP_CTRL(x)                  FIELD_PREP(PROP_CTRL_MASK, (x))
> +#define  INT_CTRL_MASK                 GENMASK(31, 26)
> +#define  INT_CTRL(x)                   FIELD_PREP(INT_CTRL_MASK, (x))
> +
> +#define DSI_WRITE_REG1                 0x54
> +#define  GMP_CTRL_MASK                 GENMASK(1, 0)
> +#define  GMP_CTRL(x)                   FIELD_PREP(GMP_CTRL_MASK, (x))
> +#define  CPBIAS_CTRL_MASK              GENMASK(8, 2)
> +#define  CPBIAS_CTRL(x)                        FIELD_PREP(CPBIAS_CTRL_MA=
SK, (x))
> +#define  PLL_SHADOW_CTRL               BIT(9)
> +
> +/* display mux control register */
> +#define DISPLAY_MUX                    0x60
> +#define  MIPI_DSI_RGB666_MAP_CFG       GENMASK(7, 6)
> +#define  RGB666_CONFIG1                        FIELD_PREP(MIPI_DSI_RGB66=
6_MAP_CFG, 0)
> +#define  RGB666_CONFIG2                        FIELD_PREP(MIPI_DSI_RGB66=
6_MAP_CFG, 1)
> +#define  MIPI_DSI_RGB565_MAP_CFG       GENMASK(5, 4)
> +#define  RGB565_CONFIG1                        FIELD_PREP(MIPI_DSI_RGB56=
5_MAP_CFG, 0)
> +#define  RGB565_CONFIG2                        FIELD_PREP(MIPI_DSI_RGB56=
5_MAP_CFG, 1)
> +#define  RGB565_CONFIG3                        FIELD_PREP(MIPI_DSI_RGB56=
5_MAP_CFG, 2)
> +#define  LCDIF_CROSS_LINE_PATTERN      GENMASK(3, 0)
> +#define  RGB888_TO_RGB888              FIELD_PREP(LCDIF_CROSS_LINE_PATTE=
RN, 0)
> +#define  RGB888_TO_RGB666              FIELD_PREP(LCDIF_CROSS_LINE_PATTE=
RN, 6)
> +#define  RGB565_TO_RGB565              FIELD_PREP(LCDIF_CROSS_LINE_PATTE=
RN, 7)
> +
> +#define MHZ(x)                         ((x) * 1000000UL)
> +
> +#define REF_CLK_RATE_MAX               MHZ(64)
> +#define REF_CLK_RATE_MIN               MHZ(2)
> +#define FOUT_MAX                       MHZ(1250)
> +#define FOUT_MIN                       MHZ(40)
> +#define FVCO_DIV_FACTOR                        MHZ(80)
> +
> +#define MBPS(x)                                ((x) * 1000000UL)
> +
> +#define DATA_RATE_MAX_SPEED            MBPS(2500)
> +#define DATA_RATE_MIN_SPEED            MBPS(80)
> +
> +#define M_MAX                          625UL
> +#define M_MIN                          64UL
> +
> +#define N_MAX                          16U
> +#define N_MIN                          1U
> +
> +struct imx93_dsi {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       struct clk *clk_pixel;
> +       struct clk *clk_ref;
> +       struct clk *clk_cfg;
> +       struct dw_mipi_dsi *dmd;
> +       struct dw_mipi_dsi_plat_data pdata;
> +       union phy_configure_opts phy_cfg;
> +       unsigned long ref_clk_rate;
> +       u32 format;
> +};
> +
> +struct dphy_pll_cfg {
> +       u32 m;  /* PLL Feedback Multiplication Ratio */
> +       u32 n;  /* PLL Input Frequency Division Ratio */
> +};
> +
> +struct dphy_pll_vco_prop {
> +       unsigned long max_fout;
> +       u8 vco_cntl;
> +       u8 prop_cntl;
> +};
> +
> +struct dphy_pll_hsfreqrange {
> +       unsigned long max_mbps;
> +       u8 hsfreqrange;
> +};
> +
> +/* DPHY Databook Table 3-13 Charge-pump Programmability */
> +static const struct dphy_pll_vco_prop vco_prop_map[] =3D {
> +       {   55, 0x3f, 0x0d },
> +       {   82, 0x37, 0x0d },
> +       {  110, 0x2f, 0x0d },
> +       {  165, 0x27, 0x0d },
> +       {  220, 0x1f, 0x0d },
> +       {  330, 0x17, 0x0d },
> +       {  440, 0x0f, 0x0d },
> +       {  660, 0x07, 0x0d },
> +       { 1149, 0x03, 0x0d },
> +       { 1152, 0x01, 0x0d },
> +       { 1250, 0x01, 0x0e },
> +};
> +
> +/* DPHY Databook Table 5-7 Frequency Ranges and Defaults */
> +static const struct dphy_pll_hsfreqrange hsfreqrange_map[] =3D {
> +       {   89, 0x00 },
> +       {   99, 0x10 },
> +       {  109, 0x20 },
> +       {  119, 0x30 },
> +       {  129, 0x01 },
> +       {  139, 0x11 },
> +       {  149, 0x21 },
> +       {  159, 0x31 },
> +       {  169, 0x02 },
> +       {  179, 0x12 },
> +       {  189, 0x22 },
> +       {  204, 0x32 },
> +       {  219, 0x03 },
> +       {  234, 0x13 },
> +       {  249, 0x23 },
> +       {  274, 0x33 },
> +       {  299, 0x04 },
> +       {  324, 0x14 },
> +       {  349, 0x25 },
> +       {  399, 0x35 },
> +       {  449, 0x05 },
> +       {  499, 0x16 },
> +       {  549, 0x26 },
> +       {  599, 0x37 },
> +       {  649, 0x07 },
> +       {  699, 0x18 },
> +       {  749, 0x28 },
> +       {  799, 0x39 },
> +       {  849, 0x09 },
> +       {  899, 0x19 },
> +       {  949, 0x29 },
> +       {  999, 0x3a },
> +       { 1049, 0x0a },
> +       { 1099, 0x1a },
> +       { 1149, 0x2a },
> +       { 1199, 0x3b },
> +       { 1249, 0x0b },
> +       { 1299, 0x1b },
> +       { 1349, 0x2b },
> +       { 1399, 0x3c },
> +       { 1449, 0x0c },
> +       { 1499, 0x1c },
> +       { 1549, 0x2c },
> +       { 1599, 0x3d },
> +       { 1649, 0x0d },
> +       { 1699, 0x1d },
> +       { 1749, 0x2e },
> +       { 1799, 0x3e },
> +       { 1849, 0x0e },
> +       { 1899, 0x1e },
> +       { 1949, 0x2f },
> +       { 1999, 0x3f },
> +       { 2049, 0x0f },
> +       { 2099, 0x40 },
> +       { 2149, 0x41 },
> +       { 2199, 0x42 },
> +       { 2249, 0x43 },
> +       { 2299, 0x44 },
> +       { 2349, 0x45 },
> +       { 2399, 0x46 },
> +       { 2449, 0x47 },
> +       { 2499, 0x48 },
> +       { 2500, 0x49 },
> +};
> +
> +static void dphy_pll_write(struct imx93_dsi *dsi, unsigned int reg, u32 =
value)
> +{
> +       int ret;
> +
> +       ret =3D regmap_write(dsi->regmap, reg, value);
> +       if (ret < 0)
> +               dev_err(dsi->dev, "failed to write 0x%08x to pll reg 0x%x=
: %d\n",
> +                       value, reg, ret);
> +}
> +
> +static inline unsigned long data_rate_to_fout(unsigned long data_rate)
> +{
> +       /* Fout is half of data rate */
> +       return data_rate / 2;
> +}
> +
> +static int
> +dphy_pll_get_configure_from_opts(struct imx93_dsi *dsi,
> +                                struct phy_configure_opts_mipi_dphy *dph=
y_opts,
> +                                struct dphy_pll_cfg *cfg)
> +{
> +       struct device *dev =3D dsi->dev;
> +       unsigned long fin =3D dsi->ref_clk_rate;
> +       unsigned long fout;
> +       unsigned long best_fout =3D 0;
> +       unsigned int fvco_div;
> +       unsigned int min_n, max_n, n, best_n;
> +       unsigned long m, best_m;
> +       unsigned long min_delta =3D ULONG_MAX;
> +       unsigned long delta;
> +       u64 tmp;
> +
> +       if (dphy_opts->hs_clk_rate < DATA_RATE_MIN_SPEED ||
> +           dphy_opts->hs_clk_rate > DATA_RATE_MAX_SPEED) {
> +               dev_dbg(dev, "invalid data rate per lane: %lu\n",
> +                       dphy_opts->hs_clk_rate);
> +               return -EINVAL;
> +       }
> +
> +       fout =3D data_rate_to_fout(dphy_opts->hs_clk_rate);
> +
> +       /* DPHY Databook 3.3.6.1 Output Frequency */
> +       /* Fout =3D Fvco / Fvco_div =3D (Fin * M) / (Fvco_div * N) */
> +       /* Fvco_div could be 1/2/4/8 according to Fout range. */
> +       fvco_div =3D 8UL / min(DIV_ROUND_UP(fout, FVCO_DIV_FACTOR), 8UL);
> +
> +       /* limitation: 2MHz <=3D Fin / N <=3D 8MHz */
> +       min_n =3D DIV_ROUND_UP_ULL((u64)fin, MHZ(8));
> +       max_n =3D DIV_ROUND_DOWN_ULL((u64)fin, MHZ(2));
> +
> +       /* clamp possible N(s) */
> +       min_n =3D clamp(min_n, N_MIN, N_MAX);
> +       max_n =3D clamp(max_n, N_MIN, N_MAX);
> +
> +       dev_dbg(dev, "Fout =3D %lu, Fvco_div =3D %u, n_range =3D [%u, %u]=
\n",
> +               fout, fvco_div, min_n, max_n);
> +
> +       for (n =3D min_n; n <=3D max_n; n++) {
> +               /* M =3D (Fout * N * Fvco_div) / Fin */
> +               m =3D DIV_ROUND_CLOSEST(fout * n * fvco_div, fin);
> +
> +               /* check M range */
> +               if (m < M_MIN || m > M_MAX)
> +                       continue;
> +
> +               /* calculate temporary Fout */
> +               tmp =3D m * fin;
> +               do_div(tmp, n * fvco_div);
> +               if (tmp < FOUT_MIN || tmp > FOUT_MAX)
> +                       continue;
> +
> +               delta =3D abs(fout - tmp);
> +               if (delta < min_delta) {
> +                       best_n =3D n;
> +                       best_m =3D m;
> +                       min_delta =3D delta;
> +                       best_fout =3D tmp;
> +               }
> +       }
> +
> +       if (best_fout) {
> +               cfg->m =3D best_m;
> +               cfg->n =3D best_n;
> +               dev_dbg(dev, "best Fout =3D %lu, m =3D %u, n =3D %u\n",
> +                       best_fout, cfg->m, cfg->n);
> +       } else {
> +               dev_dbg(dev, "failed to find best Fout\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void dphy_pll_clear_shadow(struct imx93_dsi *dsi)
> +{
> +       /* Reference DPHY Databook Figure 3-3 Initialization Timing Diagr=
am. */
> +       /* Select clock generation first. */
> +       dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
> +
> +       /* Clear shadow after clock selection is done a while. */
> +       fsleep(1);
> +       dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN | SHADOW_CLR);
> +
> +       /* A minimum pulse of 5ns on shadow_clear signal. */
> +       fsleep(1);
> +       dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
> +}
> +
> +static unsigned long dphy_pll_get_cfgclkrange(struct imx93_dsi *dsi)
> +{
> +       /*
> +        * DPHY Databook Table 4-4 System Control Signals mentions an equ=
ation
> +        * for cfgclkfreqrange[5:0].
> +        */
> +       return (clk_get_rate(dsi->clk_cfg) / MHZ(1) - 17) * 4;
> +}
> +
> +static u8
> +dphy_pll_get_hsfreqrange(struct phy_configure_opts_mipi_dphy *dphy_opts)
> +{
> +       unsigned long mbps =3D dphy_opts->hs_clk_rate / MHZ(1);
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hsfreqrange_map); i++)
> +               if (mbps <=3D hsfreqrange_map[i].max_mbps)
> +                       return hsfreqrange_map[i].hsfreqrange;
> +
> +       return 0;
> +}
> +
> +static u8 dphy_pll_get_vco(struct phy_configure_opts_mipi_dphy *dphy_opt=
s)
> +{
> +       unsigned long fout =3D data_rate_to_fout(dphy_opts->hs_clk_rate) =
/ MHZ(1);
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(vco_prop_map); i++)
> +               if (fout <=3D vco_prop_map[i].max_fout)
> +                       return vco_prop_map[i].vco_cntl;
> +
> +       return 0;
> +}
> +
> +static u8 dphy_pll_get_prop(struct phy_configure_opts_mipi_dphy *dphy_op=
ts)
> +{
> +       unsigned long fout =3D data_rate_to_fout(dphy_opts->hs_clk_rate) =
/ MHZ(1);
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(vco_prop_map); i++)
> +               if (fout <=3D vco_prop_map[i].max_fout)
> +                       return vco_prop_map[i].prop_cntl;
> +
> +       return 0;
> +}
> +
> +static int dphy_pll_update(struct imx93_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret =3D regmap_update_bits(dsi->regmap, DSI_REG, UPDATE_PLL, UPDA=
TE_PLL);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to set UPDATE_PLL: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * The updatepll signal should be asserted for a minimum of four =
clkin
> +        * cycles, according to DPHY Databook Figure 3-3 Initialization T=
iming
> +        * Diagram.
> +        */
> +       fsleep(10);
> +
> +       ret =3D regmap_update_bits(dsi->regmap, DSI_REG, UPDATE_PLL, 0);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to clear UPDATE_PLL: %d\n", ret=
);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure=
_opts *opts)
> +{
> +       struct dphy_pll_cfg cfg =3D { 0 };
> +       u32 val;
> +       int ret;
> +
> +       ret =3D dphy_pll_get_configure_from_opts(dsi, &opts->mipi_dphy, &=
cfg);
> +       if (ret) {
> +               dev_err(dsi->dev, "failed to get phy pll cfg %d\n", ret);
> +               return ret;
> +       }
> +
> +       dphy_pll_clear_shadow(dsi);
> +
> +       /* DSI_REG */
> +       val =3D CLKSEL_GEN |
> +             CFGCLKFREQRANGE(dphy_pll_get_cfgclkrange(dsi)) |
> +             HSFREQRANGE(dphy_pll_get_hsfreqrange(&opts->mipi_dphy));
> +       dphy_pll_write(dsi, DSI_REG, val);
> +
> +       /* DSI_WRITE_REG0 */
> +       val =3D M(cfg.m) | N(cfg.n) | INT_CTRL(0) |
> +             VCO_CTRL(dphy_pll_get_vco(&opts->mipi_dphy)) |
> +             PROP_CTRL(dphy_pll_get_prop(&opts->mipi_dphy));
> +       dphy_pll_write(dsi, DSI_WRITE_REG0, val);
> +
> +       /* DSI_WRITE_REG1 */
> +       dphy_pll_write(dsi, DSI_WRITE_REG1, GMP_CTRL(1) | CPBIAS_CTRL(0x1=
0));
> +
> +       ret =3D clk_prepare_enable(dsi->clk_ref);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable ref clock: %d\n", ret=
);
> +               return ret;
> +       }
> +
> +       /*
> +        * At least 10 refclk cycles are required before updatePLL assert=
ion,
> +        * according to DPHY Databook Figure 3-3 Initialization Timing Di=
agram.
> +        */
> +       fsleep(10);
> +
> +       ret =3D dphy_pll_update(dsi);
> +       if (ret < 0) {
> +               clk_disable_unprepare(dsi->clk_ref);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void dphy_pll_clear_reg(struct imx93_dsi *dsi)
> +{
> +       dphy_pll_write(dsi, DSI_REG, 0);
> +       dphy_pll_write(dsi, DSI_WRITE_REG0, 0);
> +       dphy_pll_write(dsi, DSI_WRITE_REG1, 0);
> +}
> +
> +static int dphy_pll_init(struct imx93_dsi *dsi)
> +{
> +       int ret;
> +
> +       ret =3D clk_prepare_enable(dsi->clk_cfg);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable config clock: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       dphy_pll_clear_reg(dsi);
> +
> +       return 0;
> +}
> +
> +static void dphy_pll_uninit(struct imx93_dsi *dsi)
> +{
> +       dphy_pll_clear_reg(dsi);
> +       clk_disable_unprepare(dsi->clk_cfg);
> +}
> +
> +static void dphy_pll_power_off(struct imx93_dsi *dsi)
> +{
> +       dphy_pll_clear_reg(dsi);
> +       clk_disable_unprepare(dsi->clk_ref);
> +}
> +
> +static int imx93_dsi_get_phy_configure_opts(struct imx93_dsi *dsi,
> +                                           const struct drm_display_mode=
 *mode,
> +                                           union phy_configure_opts *phy=
_cfg,
> +                                           u32 lanes, u32 format)
> +{
> +       struct device *dev =3D dsi->dev;
> +       int bpp;
> +       int ret;
> +
> +       bpp =3D mipi_dsi_pixel_format_to_bpp(format);
> +       if (bpp < 0) {
> +               dev_dbg(dev, "failed to get bpp for pixel format %d\n", f=
ormat);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D phy_mipi_dphy_get_default_config(mode->clock * MSEC_PER_S=
EC, bpp,
> +                                              lanes, &phy_cfg->mipi_dphy=
);
> +       if (ret < 0) {
> +               dev_dbg(dev, "failed to get default phy cfg %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static enum drm_mode_status
> +imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_=
mode *mode)
> +{
> +       struct drm_bridge *bridge =3D dw_mipi_dsi_get_bridge(dsi->dmd);
> +
> +       /* Get the last bridge */
> +       while (drm_bridge_get_next_bridge(bridge))
> +               bridge =3D drm_bridge_get_next_bridge(bridge);
> +
> +       if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
> +           (bridge->ops & DRM_BRIDGE_OP_EDID)) {
> +               unsigned long pixel_clock_rate =3D mode->clock * 1000;
> +               unsigned long rounded_rate;
> +
> +               /* Allow +/-0.5% pixel clock rate deviation */
> +               rounded_rate =3D clk_round_rate(dsi->clk_pixel, pixel_clo=
ck_rate);
> +               if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
> +                   rounded_rate > pixel_clock_rate * 1005 / 1000) {
> +                       dev_dbg(dsi->dev, "failed to round clock for mode=
 " DRM_MODE_FMT "\n",
> +                               DRM_MODE_ARG(mode));
> +                       return MODE_NOCLOCK;
> +               }
> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static enum drm_mode_status
> +imx93_dsi_validate_phy(struct imx93_dsi *dsi, const struct drm_display_m=
ode *mode,
> +                      unsigned long mode_flags, u32 lanes, u32 format)
> +{
> +       union phy_configure_opts phy_cfg;
> +       struct dphy_pll_cfg cfg =3D { 0 };
> +       struct device *dev =3D dsi->dev;
> +       int ret;
> +
> +       ret =3D imx93_dsi_get_phy_configure_opts(dsi, mode, &phy_cfg, lan=
es,
> +                                              format);
> +       if (ret < 0) {
> +               dev_dbg(dev, "failed to get phy cfg opts %d\n", ret);
> +               return MODE_ERROR;
> +       }
> +
> +       ret =3D dphy_pll_get_configure_from_opts(dsi, &phy_cfg.mipi_dphy,=
 &cfg);
> +       if (ret < 0) {
> +               dev_dbg(dev, "failed to get phy pll cfg %d\n", ret);
> +               return MODE_NOCLOCK;
> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static enum drm_mode_status
> +imx93_dsi_mode_valid(void *priv_data, const struct drm_display_mode *mod=
e,
> +                    unsigned long mode_flags, u32 lanes, u32 format)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +       struct device *dev =3D dsi->dev;
> +       enum drm_mode_status ret;
> +
> +       ret =3D imx93_dsi_validate_mode(dsi, mode);
> +       if (ret !=3D MODE_OK) {
> +               dev_dbg(dev, "failed to validate mode " DRM_MODE_FMT "\n"=
,
> +                       DRM_MODE_ARG(mode));
> +               return ret;
> +       }
> +
> +       ret =3D imx93_dsi_validate_phy(dsi, mode, mode_flags, lanes, form=
at);
> +       if (ret !=3D MODE_OK) {
> +               dev_dbg(dev, "failed to validate phy for mode " DRM_MODE_=
FMT "\n",
> +                       DRM_MODE_ARG(mode));
> +               return ret;
> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static bool imx93_dsi_mode_fixup(void *priv_data,
> +                                const struct drm_display_mode *mode,
> +                                struct drm_display_mode *adjusted_mode)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +       unsigned long pixel_clock_rate;
> +       unsigned long rounded_rate;
> +
> +       pixel_clock_rate =3D mode->clock * 1000;
> +       rounded_rate =3D clk_round_rate(dsi->clk_pixel, pixel_clock_rate)=
;
> +
> +       memcpy(adjusted_mode, mode, sizeof(*mode));
> +       adjusted_mode->clock =3D rounded_rate / 1000;
> +
> +       dev_dbg(dsi->dev, "adj clock %d for mode " DRM_MODE_FMT "\n",
> +               adjusted_mode->clock, DRM_MODE_ARG(mode));
> +
> +       return true;
> +}
> +
> +static u32 *imx93_dsi_get_input_bus_fmts(void *priv_data,
> +                                        struct drm_bridge *bridge,
> +                                        struct drm_bridge_state *bridge_=
state,
> +                                        struct drm_crtc_state *crtc_stat=
e,
> +                                        struct drm_connector_state *conn=
_state,
> +                                        u32 output_fmt,
> +                                        unsigned int *num_input_fmts)
> +{
> +       u32 *input_fmts, input_fmt;
> +
> +       *num_input_fmts =3D 0;
> +
> +       switch (output_fmt) {
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_RGB666_1X18:
> +       case MEDIA_BUS_FMT_FIXED:
> +               input_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;
> +               break;
> +       case MEDIA_BUS_FMT_RGB565_1X16:
> +               input_fmt =3D output_fmt;
> +               break;
> +       default:
> +               return NULL;
> +       }
> +
> +       input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +       input_fmts[0] =3D input_fmt;
> +       *num_input_fmts =3D 1;
> +
> +       return input_fmts;
> +}
> +
> +static int imx93_dsi_phy_init(void *priv_data)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +       unsigned int fmt =3D 0;
> +       int ret;
> +
> +       switch (dsi->format) {
> +       case MIPI_DSI_FMT_RGB888:
> +               fmt =3D RGB888_TO_RGB888;
> +               break;
> +       case MIPI_DSI_FMT_RGB666:
> +               fmt =3D RGB888_TO_RGB666;
> +               regmap_update_bits(dsi->regmap, DISPLAY_MUX,
> +                                  MIPI_DSI_RGB666_MAP_CFG, RGB666_CONFIG=
2);
> +               break;
> +       case MIPI_DSI_FMT_RGB666_PACKED:
> +               fmt =3D RGB888_TO_RGB666;
> +               regmap_update_bits(dsi->regmap, DISPLAY_MUX,
> +                                  MIPI_DSI_RGB666_MAP_CFG, RGB666_CONFIG=
1);
> +               break;
> +       case MIPI_DSI_FMT_RGB565:
> +               fmt =3D RGB565_TO_RGB565;
> +               regmap_update_bits(dsi->regmap, DISPLAY_MUX,
> +                                  MIPI_DSI_RGB565_MAP_CFG, RGB565_CONFIG=
1);
> +               break;
> +       }
> +
> +       regmap_update_bits(dsi->regmap, DISPLAY_MUX, LCDIF_CROSS_LINE_PAT=
TERN, fmt);
> +
> +       ret =3D dphy_pll_init(dsi);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to init phy pll: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D dphy_pll_configure(dsi, &dsi->phy_cfg);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to configure phy pll: %d\n", re=
t);
> +               dphy_pll_uninit(dsi);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void imx93_dsi_phy_power_off(void *priv_data)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +
> +       dphy_pll_power_off(dsi);
> +       dphy_pll_uninit(dsi);
> +}
> +
> +static int
> +imx93_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *=
mode,
> +                       unsigned long mode_flags, u32 lanes, u32 format,
> +                       unsigned int *lane_mbps)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +       union phy_configure_opts phy_cfg;
> +       struct device *dev =3D dsi->dev;
> +       int ret;
> +
> +       ret =3D imx93_dsi_get_phy_configure_opts(dsi, mode, &phy_cfg, lan=
es,
> +                                              format);
> +       if (ret < 0) {
> +               dev_dbg(dev, "failed to get phy cfg opts %d\n", ret);
> +               return ret;
> +       }
> +
> +       *lane_mbps =3D DIV_ROUND_UP(phy_cfg.mipi_dphy.hs_clk_rate, USEC_P=
ER_SEC);
> +
> +       memcpy(&dsi->phy_cfg, &phy_cfg, sizeof(phy_cfg));
> +
> +       dev_dbg(dev, "get lane_mbps %u for mode " DRM_MODE_FMT "\n",
> +               *lane_mbps, DRM_MODE_ARG(mode));
> +
> +       return 0;
> +}
> +
> +/* High-Speed Transition Times */
> +struct hstt {
> +       unsigned int maxfreq;
> +       struct dw_mipi_dsi_dphy_timing timing;
> +};
> +
> +#define HSTT(_maxfreq, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp) \
> +{                                                              \
> +       .maxfreq =3D (_maxfreq),                                  \
> +       .timing =3D {                                             \
> +               .clk_lp2hs =3D (_c_lp2hs),                        \
> +               .clk_hs2lp =3D (_c_hs2lp),                        \
> +               .data_lp2hs =3D (_d_lp2hs),                       \
> +               .data_hs2lp =3D (_d_hs2lp),                       \
> +       }                                                       \
> +}
> +
> +/* DPHY Databook Table A-4 High-Speed Transition Times */
> +static const struct hstt hstt_table[] =3D {
> +       HSTT(80,    21,  17,  15, 10),
> +       HSTT(90,    23,  17,  16, 10),
> +       HSTT(100,   22,  17,  16, 10),
> +       HSTT(110,   25,  18,  17, 11),
> +       HSTT(120,   26,  20,  18, 11),
> +       HSTT(130,   27,  19,  19, 11),
> +       HSTT(140,   27,  19,  19, 11),
> +       HSTT(150,   28,  20,  20, 12),
> +       HSTT(160,   30,  21,  22, 13),
> +       HSTT(170,   30,  21,  23, 13),
> +       HSTT(180,   31,  21,  23, 13),
> +       HSTT(190,   32,  22,  24, 13),
> +       HSTT(205,   35,  22,  25, 13),
> +       HSTT(220,   37,  26,  27, 15),
> +       HSTT(235,   38,  28,  27, 16),
> +       HSTT(250,   41,  29,  30, 17),
> +       HSTT(275,   43,  29,  32, 18),
> +       HSTT(300,   45,  32,  35, 19),
> +       HSTT(325,   48,  33,  36, 18),
> +       HSTT(350,   51,  35,  40, 20),
> +       HSTT(400,   59,  37,  44, 21),
> +       HSTT(450,   65,  40,  49, 23),
> +       HSTT(500,   71,  41,  54, 24),
> +       HSTT(550,   77,  44,  57, 26),
> +       HSTT(600,   82,  46,  64, 27),
> +       HSTT(650,   87,  48,  67, 28),
> +       HSTT(700,   94,  52,  71, 29),
> +       HSTT(750,   99,  52,  75, 31),
> +       HSTT(800,  105,  55,  82, 32),
> +       HSTT(850,  110,  58,  85, 32),
> +       HSTT(900,  115,  58,  88, 35),
> +       HSTT(950,  120,  62,  93, 36),
> +       HSTT(1000, 128,  63,  99, 38),
> +       HSTT(1050, 132,  65, 102, 38),
> +       HSTT(1100, 138,  67, 106, 39),
> +       HSTT(1150, 146,  69, 112, 42),
> +       HSTT(1200, 151,  71, 117, 43),
> +       HSTT(1250, 153,  74, 120, 45),
> +       HSTT(1300, 160,  73, 124, 46),
> +       HSTT(1350, 165,  76, 130, 47),
> +       HSTT(1400, 172,  78, 134, 49),
> +       HSTT(1450, 177,  80, 138, 49),
> +       HSTT(1500, 183,  81, 143, 52),
> +       HSTT(1550, 191,  84, 147, 52),
> +       HSTT(1600, 194,  85, 152, 52),
> +       HSTT(1650, 201,  86, 155, 53),
> +       HSTT(1700, 208,  88, 161, 53),
> +       HSTT(1750, 212,  89, 165, 53),
> +       HSTT(1800, 220,  90, 171, 54),
> +       HSTT(1850, 223,  92, 175, 54),
> +       HSTT(1900, 231,  91, 180, 55),
> +       HSTT(1950, 236,  95, 185, 56),
> +       HSTT(2000, 243,  97, 190, 56),
> +       HSTT(2050, 248,  99, 194, 58),
> +       HSTT(2100, 252, 100, 199, 59),
> +       HSTT(2150, 259, 102, 204, 61),
> +       HSTT(2200, 266, 105, 210, 62),
> +       HSTT(2250, 269, 109, 213, 63),
> +       HSTT(2300, 272, 109, 217, 65),
> +       HSTT(2350, 281, 112, 225, 66),
> +       HSTT(2400, 283, 115, 226, 66),
> +       HSTT(2450, 282, 115, 226, 67),
> +       HSTT(2500, 281, 118, 227, 67),
> +};
> +
> +static int imx93_dsi_phy_get_timing(void *priv_data, unsigned int lane_m=
bps,
> +                                   struct dw_mipi_dsi_dphy_timing *timin=
g)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +       struct device *dev =3D dsi->dev;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(hstt_table); i++)
> +               if (lane_mbps <=3D hstt_table[i].maxfreq)
> +                       break;
> +
> +       if (i =3D=3D ARRAY_SIZE(hstt_table)) {
> +               dev_err(dev, "failed to get phy timing for lane_mbps %u\n=
",
> +                       lane_mbps);
> +               return -EINVAL;
> +       }
> +
> +       *timing =3D hstt_table[i].timing;
> +
> +       dev_dbg(dev, "get phy timing for %u <=3D %u (lane_mbps)\n",
> +               lane_mbps, hstt_table[i].maxfreq);
> +
> +       return 0;
> +}
> +
> +static const struct dw_mipi_dsi_phy_ops imx93_dsi_phy_ops =3D {
> +       .init =3D imx93_dsi_phy_init,
> +       .power_off =3D imx93_dsi_phy_power_off,
> +       .get_lane_mbps =3D imx93_dsi_get_lane_mbps,
> +       .get_timing =3D imx93_dsi_phy_get_timing,
> +};
> +
> +static int imx93_dsi_host_attach(void *priv_data, struct mipi_dsi_device=
 *device)
> +{
> +       struct imx93_dsi *dsi =3D priv_data;
> +
> +       dsi->format =3D device->format;
> +
> +       return 0;
> +}
> +
> +static const struct dw_mipi_dsi_host_ops imx93_dsi_host_ops =3D {
> +       .attach =3D imx93_dsi_host_attach,
> +};
> +
> +static int imx93_dsi_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct imx93_dsi *dsi;
> +       int ret;
> +
> +       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +       if (!dsi)
> +               return -ENOMEM;
> +
> +       dsi->regmap =3D syscon_regmap_lookup_by_phandle(np, "fsl,media-bl=
k-ctrl");
> +       if (IS_ERR(dsi->regmap)) {
> +               ret =3D PTR_ERR(dsi->regmap);
> +               dev_err(dev, "failed to get block ctrl regmap: %d\n", ret=
);
> +               return ret;
> +       }
> +
> +       dsi->clk_pixel =3D devm_clk_get(dev, "pix");
> +       if (IS_ERR(dsi->clk_pixel))
> +               return dev_err_probe(dev, PTR_ERR(dsi->clk_pixel),
> +                                    "failed to get pixel clock\n");
> +
> +       dsi->clk_cfg =3D devm_clk_get(dev, "phy_cfg");
> +       if (IS_ERR(dsi->clk_cfg))
> +               return dev_err_probe(dev, PTR_ERR(dsi->clk_cfg),
> +                                    "failed to get phy cfg clock\n");
> +
> +       dsi->clk_ref =3D devm_clk_get(dev, "phy_ref");
> +       if (IS_ERR(dsi->clk_ref))
> +               return dev_err_probe(dev, PTR_ERR(dsi->clk_ref),
> +                                    "failed to get phy ref clock\n");
> +
> +       dsi->ref_clk_rate =3D clk_get_rate(dsi->clk_ref);
> +       if (dsi->ref_clk_rate < REF_CLK_RATE_MIN ||
> +           dsi->ref_clk_rate > REF_CLK_RATE_MAX) {
> +               dev_err(dev, "invalid phy ref clock rate %lu\n",
> +                       dsi->ref_clk_rate);
> +               return -EINVAL;
> +       }
> +       dev_dbg(dev, "phy ref clock rate: %lu\n", dsi->ref_clk_rate);
> +
> +       dsi->dev =3D dev;
> +       dsi->pdata.max_data_lanes =3D 4;
> +       dsi->pdata.mode_valid =3D imx93_dsi_mode_valid;
> +       dsi->pdata.mode_fixup =3D imx93_dsi_mode_fixup;
> +       dsi->pdata.get_input_bus_fmts =3D imx93_dsi_get_input_bus_fmts;
> +       dsi->pdata.phy_ops =3D &imx93_dsi_phy_ops;
> +       dsi->pdata.host_ops =3D &imx93_dsi_host_ops;
> +       dsi->pdata.priv_data =3D dsi;
> +       platform_set_drvdata(pdev, dsi);
> +
> +       dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
> +       if (IS_ERR(dsi->dmd))
> +               return dev_err_probe(dev, PTR_ERR(dsi->dmd),
> +                                    "failed to probe dw_mipi_dsi\n");
> +
> +       return 0;
> +}
> +
> +static void imx93_dsi_remove(struct platform_device *pdev)
> +{
> +       struct imx93_dsi *dsi =3D platform_get_drvdata(pdev);
> +
> +       dw_mipi_dsi_remove(dsi->dmd);
> +}
> +
> +static const struct of_device_id imx93_dsi_dt_ids[] =3D {
> +       { .compatible =3D "fsl,imx93-mipi-dsi", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
> +
> +static struct platform_driver imx93_dsi_driver =3D {
> +       .probe  =3D imx93_dsi_probe,
> +       .remove_new =3D imx93_dsi_remove,
> +       .driver =3D {
> +               .of_match_table =3D imx93_dsi_dt_ids,
> +               .name =3D "imx93_mipi_dsi",
> +       },
> +};
> +module_platform_driver(imx93_dsi_driver);
> +
> +MODULE_DESCRIPTION("Freescale i.MX93 MIPI DSI driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.37.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
