Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71A71946A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D2D10E219;
	Thu,  1 Jun 2023 07:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7799A10E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:23:04 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53fdae76f3aso260016a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524983; x=1688116983; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pn5rXqZ1w5lMliHxta/tP09w4LiH2IfzNw3va88hoqY=;
 b=Ossa9Ucu4K/M3ONSLld7mhXENb+sgyFPZSjOrY833ThYb2bd1J/wUnqbNv1sHbVY5E
 y3WvD1pMfOd422zRf+5ZQAGXrYrLDHIum0dLkK/HjJyrVS0R2bboLvStJSCvW0W37Rfc
 WpGdpFOrmIDAf78MCyiGvdWGHVRqcacLztvYZU0Zw9wLXDwxm41haLdaZWy/OJg/T7GT
 qSmZCLWXXpXEQ7SQK2F4ayiXJtqfBx06SAXHjwKBXwmDYlLlAT83MBCfoB2ez5zx34le
 s0Bsd2vlQJ39L6rxMitI+qLX40iK8Ilez1rzfZX9oT4RKUPPaxZhEiBvFu50rbem/UbD
 EbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524983; x=1688116983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pn5rXqZ1w5lMliHxta/tP09w4LiH2IfzNw3va88hoqY=;
 b=gOJ7EpEEO0Pn+dyfcVA4IWZPIvjdgw0hYIVaNpMccJ7XtYy/vmiMuHeN3fP+lpEt3m
 c+HvI0r+yvRF9Ho1EpIXW+E1T/+OHiCaWHBdTYzXaxFnJLXPcUZAE5wspU4yMoVyIX8s
 MvDFD9l5rp/M479zHRsza8NVpFymls8TrYuDpRThMPsWGtYwenHUm7z1Oho0oN+SFy4S
 ph0/I1bR5XNPLTkkkaZuBocbswo4Y21MooPWdbqUUub/85lBdyOUC3vv1RhP3xgvo9A9
 bEXNUAzWhdl7g1KKcZdXVEFCCHD+/XCOwzplXFb0DVx5IdVNxIq26l+pNeW9XWMJCsy0
 H5OQ==
X-Gm-Message-State: AC+VfDwW0AXXffX6m++u9XVCQfbzXIUq7Cz+EkDY1Z/NECGfB5CA5kxo
 107TUXLT3VSJmB9iCderTyHLeY7PFlX48KnY6KVJ0w==
X-Google-Smtp-Source: ACHHUZ58nErDCXFCMYCp3VnU2Fsi6haIlz9OCcSgfPllm/bYrvnEiV5k/B61xOLzx8yFi1C1VoZRN+TcGXYfBsU6Atw=
X-Received: by 2002:a17:903:190:b0:1b0:276f:b26c with SMTP id
 z16-20020a170903019000b001b0276fb26cmr5336328plg.56.1685524983554; Wed, 31
 May 2023 02:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-12-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-12-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:22:42 +0200
Message-ID: <CAJZgTGHJ9ANAfB2G+PUxdXpDjvt75g=2OX2eYmqaqNq5Y6yRDQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jun 2023 07:37:12 +0000
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mar. 30 mai 2023 =C3=A0 09:38, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver
> (ver 1.21a), with a custom glue managing the IP resets, clock and data
> inputs similar to the DW-HDMI Glue on other Amlogic SoCs.
>
> This adds support for the Glue managing the transceiver, mimicing the ini=
t
> flow provided by Amlogic to setup the ENCL encoder, the glue, the transce=
iver,
> the digital D-PHY and the Analog PHY in the proper way.
>
> An optional "MEAS" clock can be enabled to measure the delay between each
> vsync feeding the DW-MIPI-DSI transceiver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/Kconfig             |   7 +
>  drivers/gpu/drm/meson/Makefile            |   1 +
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 352 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++++++
>  4 files changed, 520 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfi=
g
> index 823909da87db..615fdd0ce41b 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
>         default y if DRM_MESON
>         select DRM_DW_HDMI
>         imply DRM_DW_HDMI_I2S_AUDIO
> +
> +config DRM_MESON_DW_MIPI_DSI
> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson =
Display"
> +       depends on DRM_MESON
> +       default y if DRM_MESON
> +       select DRM_DW_MIPI_DSI
> +       select GENERIC_PHY_MIPI_DPHY
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makef=
ile
> index 833e18c20603..43071bdbd4b9 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -6,3 +6,4 @@ meson-drm-y +=3D meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) +=3D meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) +=3D meson_dw_hdmi.o
> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) +=3D meson_dw_mipi_dsi.o
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/=
meson/meson_dw_mipi_dsi.c
> new file mode 100644
> index 000000000000..dd505ac37976
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -0,0 +1,352 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/reset.h>
> +#include <linux/phy/phy.h>
> +#include <linux/bitfield.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/bridge/dw_mipi_dsi.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "meson_drv.h"
> +#include "meson_dw_mipi_dsi.h"
> +#include "meson_registers.h"
> +#include "meson_venc.h"
> +
> +#define DRIVER_NAME "meson-dw-mipi-dsi"
> +#define DRIVER_DESC "Amlogic Meson MIPI-DSI DRM driver"
> +
> +struct meson_dw_mipi_dsi {
> +       struct meson_drm *priv;
> +       struct device *dev;
> +       void __iomem *base;
> +       struct phy *phy;
> +       union phy_configure_opts phy_opts;
> +       struct dw_mipi_dsi *dmd;
> +       struct dw_mipi_dsi_plat_data pdata;
> +       struct mipi_dsi_device *dsi_device;
> +       const struct drm_display_mode *mode;
> +       struct clk *bit_clk;
> +       struct clk *px_clk;
> +       struct reset_control *top_rst;
> +};
> +
> +#define encoder_to_meson_dw_mipi_dsi(x) \
> +       container_of(x, struct meson_dw_mipi_dsi, encoder)
> +
> +static void meson_dw_mipi_dsi_hw_init(struct meson_dw_mipi_dsi *mipi_dsi=
)
> +{
> +       /* Software reset */
> +       writel_bits_relaxed(MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_R=
ESET_INTR |
> +                           MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_R=
ESET_TIMING,
> +                           MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_R=
ESET_INTR |
> +                           MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_R=
ESET_TIMING,
> +                           mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
> +       writel_bits_relaxed(MIPI_DSI_TOP_SW_RESET_DWC | MIPI_DSI_TOP_SW_R=
ESET_INTR |
> +                           MIPI_DSI_TOP_SW_RESET_DPI | MIPI_DSI_TOP_SW_R=
ESET_TIMING,
> +                           0, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
> +
> +       /* Enable clocks */
> +       writel_bits_relaxed(MIPI_DSI_TOP_CLK_SYSCLK_EN | MIPI_DSI_TOP_CLK=
_PIXCLK_EN,
> +                           MIPI_DSI_TOP_CLK_SYSCLK_EN | MIPI_DSI_TOP_CLK=
_PIXCLK_EN,
> +                           mipi_dsi->base + MIPI_DSI_TOP_CLK_CNTL);
> +
> +       /* Take memory out of power down */
> +       writel_relaxed(0, mipi_dsi->base + MIPI_DSI_TOP_MEM_PD);
> +}
> +
> +static int dw_mipi_dsi_phy_init(void *priv_data)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +       unsigned int dpi_data_format, venc_data_width;
> +       int ret;
> +
> +       /* Set the bit clock rate to hs_clk_rate */
> +       ret =3D clk_set_rate(mipi_dsi->bit_clk,
> +                          mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate);
> +       if (ret) {
> +               dev_err(mipi_dsi->dev, "Failed to set DSI Bit clock rate =
%lu (ret %d)\n",
> +                       mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, ret);
> +               return ret;
> +       }
> +
> +       /* Make sure the rate of the bit clock is not modified by someone=
 else */
> +       ret =3D clk_rate_exclusive_get(mipi_dsi->bit_clk);
> +       if (ret) {
> +               dev_err(mipi_dsi->dev,
> +                       "Failed to set the exclusivity on the bit clock r=
ate (ret %d)\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 10=
00);
> +
> +       if (ret) {
> +               dev_err(mipi_dsi->dev, "Failed to set DSI Pixel clock rat=
e %u (%d)\n",
> +                       mipi_dsi->mode->clock * 1000, ret);
> +               return ret;
> +       }
> +
> +       switch (mipi_dsi->dsi_device->format) {
> +       case MIPI_DSI_FMT_RGB888:
> +               dpi_data_format =3D DPI_COLOR_24BIT;
> +               venc_data_width =3D VENC_IN_COLOR_24B;
> +               break;
> +       case MIPI_DSI_FMT_RGB666:
> +               dpi_data_format =3D DPI_COLOR_18BIT_CFG_2;
> +               venc_data_width =3D VENC_IN_COLOR_18B;
> +               break;
> +       case MIPI_DSI_FMT_RGB666_PACKED:
> +       case MIPI_DSI_FMT_RGB565:
> +               return -EINVAL;
> +       };
> +
> +       /* Configure color format for DPI register */
> +       writel_relaxed(FIELD_PREP(MIPI_DSI_TOP_DPI_COLOR_MODE, dpi_data_f=
ormat) |
> +                      FIELD_PREP(MIPI_DSI_TOP_IN_COLOR_MODE, venc_data_w=
idth) |
> +                      FIELD_PREP(MIPI_DSI_TOP_COMP2_SEL, 2) |
> +                      FIELD_PREP(MIPI_DSI_TOP_COMP1_SEL, 1) |
> +                      FIELD_PREP(MIPI_DSI_TOP_COMP0_SEL, 0),
> +                       mipi_dsi->base + MIPI_DSI_TOP_CNTL);
> +
> +       return phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
> +}
> +
> +static void dw_mipi_dsi_phy_power_on(void *priv_data)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +
> +       if (phy_power_on(mipi_dsi->phy))
> +               dev_warn(mipi_dsi->dev, "Failed to power on PHY\n");
> +}
> +
> +static void dw_mipi_dsi_phy_power_off(void *priv_data)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +
> +       if (phy_power_off(mipi_dsi->phy))
> +               dev_warn(mipi_dsi->dev, "Failed to power off PHY\n");
> +
> +       /* Remove the exclusivity on the bit clock rate */
> +       clk_rate_exclusive_put(mipi_dsi->bit_clk);
> +}
> +
> +static int
> +dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode=
 *mode,
> +                         unsigned long mode_flags, u32 lanes, u32 format=
,
> +                         unsigned int *lane_mbps)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +       int bpp;
> +
> +       mipi_dsi->mode =3D mode;
> +
> +       bpp =3D mipi_dsi_pixel_format_to_bpp(mipi_dsi->dsi_device->format=
);
> +
> +       phy_mipi_dphy_get_default_config(mode->clock * 1000,
> +                                        bpp, mipi_dsi->dsi_device->lanes=
,
> +                                        &mipi_dsi->phy_opts.mipi_dphy);
> +
> +       *lane_mbps =3D DIV_ROUND_UP(mipi_dsi->phy_opts.mipi_dphy.hs_clk_r=
ate, USEC_PER_SEC);
> +
> +       return 0;
> +}
> +
> +static int
> +dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
> +                          struct dw_mipi_dsi_dphy_timing *timing)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +
> +       switch (mipi_dsi->mode->hdisplay) {
> +       case 240:
> +       case 768:
> +       case 1920:
> +       case 2560:
> +               timing->clk_lp2hs =3D 23;
> +               timing->clk_hs2lp =3D 38;
> +               timing->data_lp2hs =3D 15;
> +               timing->data_hs2lp =3D 9;
> +               break;
> +
> +       default:
> +               timing->clk_lp2hs =3D 37;
> +               timing->clk_hs2lp =3D 135;
> +               timing->data_lp2hs =3D 50;
> +               timing->data_hs2lp =3D 3;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +dw_mipi_dsi_get_esc_clk_rate(void *priv_data, unsigned int *esc_clk_rate=
)
> +{
> +       *esc_clk_rate =3D 4; /* Mhz */
> +
> +       return 0;
> +}
> +
> +static const struct dw_mipi_dsi_phy_ops meson_dw_mipi_dsi_phy_ops =3D {
> +       .init =3D dw_mipi_dsi_phy_init,
> +       .power_on =3D dw_mipi_dsi_phy_power_on,
> +       .power_off =3D dw_mipi_dsi_phy_power_off,
> +       .get_lane_mbps =3D dw_mipi_dsi_get_lane_mbps,
> +       .get_timing =3D dw_mipi_dsi_phy_get_timing,
> +       .get_esc_clk_rate =3D dw_mipi_dsi_get_esc_clk_rate,
> +};
> +
> +static int meson_dw_mipi_dsi_host_attach(void *priv_data,
> +                                        struct mipi_dsi_device *device)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +       int ret;
> +
> +       mipi_dsi->dsi_device =3D device;
> +
> +       switch (device->format) {
> +       case MIPI_DSI_FMT_RGB888:
> +               break;
> +       case MIPI_DSI_FMT_RGB666:
> +               break;
> +       case MIPI_DSI_FMT_RGB666_PACKED:
> +       case MIPI_DSI_FMT_RGB565:
> +               dev_err(mipi_dsi->dev, "invalid pixel format %d\n", devic=
e->format);
> +               return -EINVAL;
> +       };
> +
> +       ret =3D phy_init(mipi_dsi->phy);
> +       if (ret)
> +               return ret;
> +
> +       meson_dw_mipi_dsi_hw_init(mipi_dsi);
> +
> +       return 0;
> +}
> +
> +static int meson_dw_mipi_dsi_host_detach(void *priv_data,
> +                                        struct mipi_dsi_device *device)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D priv_data;
> +
> +       if (device =3D=3D mipi_dsi->dsi_device)
> +               mipi_dsi->dsi_device =3D NULL;
> +       else
> +               return -EINVAL;
> +
> +       return phy_exit(mipi_dsi->phy);
> +}
> +
> +static const struct dw_mipi_dsi_host_ops meson_dw_mipi_dsi_host_ops =3D =
{
> +       .attach =3D meson_dw_mipi_dsi_host_attach,
> +       .detach =3D meson_dw_mipi_dsi_host_detach,
> +};
> +
> +static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi;
> +       struct device *dev =3D &pdev->dev;
> +
> +       mipi_dsi =3D devm_kzalloc(dev, sizeof(*mipi_dsi), GFP_KERNEL);
> +       if (!mipi_dsi)
> +               return -ENOMEM;
> +
> +       mipi_dsi->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(mipi_dsi->base))
> +               return PTR_ERR(mipi_dsi->base);
> +
> +       mipi_dsi->phy =3D devm_phy_get(dev, "dphy");
> +       if (IS_ERR(mipi_dsi->phy))
> +               return dev_err_probe(dev, PTR_ERR(mipi_dsi->phy),
> +                                    "failed to get mipi dphy\n");
> +
> +       mipi_dsi->bit_clk =3D devm_clk_get_enabled(dev, "bit");
> +       if (IS_ERR(mipi_dsi->bit_clk)) {
> +               int ret =3D PTR_ERR(mipi_dsi->bit_clk);
> +
> +               /* TOFIX GP0 on some platforms fails to lock in early boo=
t, defer probe */
> +               if (ret =3D=3D -EIO)
> +                       ret =3D -EPROBE_DEFER;
> +
> +               return dev_err_probe(dev, ret, "Unable to get enabled bit=
_clk\n");
> +       }
> +
> +       mipi_dsi->px_clk =3D devm_clk_get_enabled(dev, "px");
> +       if (IS_ERR(mipi_dsi->px_clk))
> +               return dev_err_probe(dev, PTR_ERR(mipi_dsi->px_clk),
> +                                    "Unable to get enabled px_clk\n");
> +
> +       /*
> +        * We use a TOP reset signal because the APB reset signal
> +        * is handled by the TOP control registers.
> +        */
> +       mipi_dsi->top_rst =3D devm_reset_control_get_exclusive(dev, "top"=
);
> +       if (IS_ERR(mipi_dsi->top_rst))
> +               return dev_err_probe(dev, PTR_ERR(mipi_dsi->top_rst),
> +                                    "Unable to get reset control\n");
> +
> +       reset_control_assert(mipi_dsi->top_rst);
> +       usleep_range(10, 20);
> +       reset_control_deassert(mipi_dsi->top_rst);
> +
> +       /* MIPI DSI Controller */
> +
> +       mipi_dsi->dev =3D dev;
> +       mipi_dsi->pdata.base =3D mipi_dsi->base;
> +       mipi_dsi->pdata.max_data_lanes =3D 4;
> +       mipi_dsi->pdata.phy_ops =3D &meson_dw_mipi_dsi_phy_ops;
> +       mipi_dsi->pdata.host_ops =3D &meson_dw_mipi_dsi_host_ops;
> +       mipi_dsi->pdata.priv_data =3D mipi_dsi;
> +       platform_set_drvdata(pdev, mipi_dsi);
> +
> +       mipi_dsi->dmd =3D dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
> +       if (IS_ERR(mipi_dsi->dmd))
> +               return dev_err_probe(dev, PTR_ERR(mipi_dsi->dmd),
> +                                    "Failed to probe dw_mipi_dsi\n");
> +
> +       return 0;
> +}
> +
> +static int meson_dw_mipi_dsi_remove(struct platform_device *pdev)
> +{
> +       struct meson_dw_mipi_dsi *mipi_dsi =3D platform_get_drvdata(pdev)=
;
> +
> +       dw_mipi_dsi_remove(mipi_dsi->dmd);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id meson_dw_mipi_dsi_of_table[] =3D {
> +       { .compatible =3D "amlogic,meson-g12a-dw-mipi-dsi", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, meson_dw_mipi_dsi_of_table);
> +
> +static struct platform_driver meson_dw_mipi_dsi_platform_driver =3D {
> +       .probe          =3D meson_dw_mipi_dsi_probe,
> +       .remove         =3D meson_dw_mipi_dsi_remove,
> +       .driver         =3D {
> +               .name           =3D DRIVER_NAME,
> +               .of_match_table =3D meson_dw_mipi_dsi_of_table,
> +       },
> +};
> +module_platform_driver(meson_dw_mipi_dsi_platform_driver);
> +
> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.h b/drivers/gpu/drm/=
meson/meson_dw_mipi_dsi.h
> new file mode 100644
> index 000000000000..e1bd6b85d6a3
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
> @@ -0,0 +1,160 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2020 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2018 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __MESON_DW_MIPI_DSI_H
> +#define __MESON_DW_MIPI_DSI_H
> +
> +/* Top-level registers */
> +/* [31: 4]    Reserved.     Default 0.
> + *     [3] RW timing_rst_n: Default 1.
> + *             1=3DAssert SW reset of timing feature.   0=3DRelease rese=
t.
> + *     [2] RW dpi_rst_n: Default 1.
> + *             1=3DAssert SW reset on mipi_dsi_host_dpi block.   0=3DRel=
ease reset.
> + *     [1] RW intr_rst_n: Default 1.
> + *             1=3DAssert SW reset on mipi_dsi_host_intr block.  0=3DRel=
ease reset.
> + *     [0] RW dwc_rst_n:  Default 1.
> + *             1=3DAssert SW reset on IP core.   0=3DRelease reset.
> + */
> +#define MIPI_DSI_TOP_SW_RESET                      0x3c0
> +
> +#define MIPI_DSI_TOP_SW_RESET_DWC      BIT(0)
> +#define MIPI_DSI_TOP_SW_RESET_INTR     BIT(1)
> +#define MIPI_DSI_TOP_SW_RESET_DPI      BIT(2)
> +#define MIPI_DSI_TOP_SW_RESET_TIMING   BIT(3)
> +
> +/* [31: 5] Reserved.   Default 0.
> + *     [4] RW manual_edpihalt: Default 0.
> + *             1=3DManual suspend VencL; 0=3Ddo not suspend VencL.
> + *     [3] RW auto_edpihalt_en: Default 0.
> + *             1=3DEnable IP's edpihalt signal to suspend VencL;
> + *             0=3DIP's edpihalt signal does not affect VencL.
> + *     [2] RW clock_freerun: Apply to auto-clock gate only. Default 0.
> + *             0=3DDefault, use auto-clock gating to save power;
> + *             1=3Duse free-run clock, disable auto-clock gating, for de=
bug mode.
> + *     [1] RW enable_pixclk: A manual clock gate option, due to DWC IP d=
oes not
> + *             have auto-clock gating. 1=3DEnable pixclk.      Default 0=
.
> + *     [0] RW enable_sysclk: A manual clock gate option, due to DWC IP d=
oes not
> + *             have auto-clock gating. 1=3DEnable sysclk.      Default 0=
.
> + */
> +#define MIPI_DSI_TOP_CLK_CNTL                      0x3c4
> +
> +#define MIPI_DSI_TOP_CLK_SYSCLK_EN     BIT(0)
> +#define MIPI_DSI_TOP_CLK_PIXCLK_EN     BIT(1)
> +
> +/* [31:24]    Reserved. Default 0.
> + * [23:20] RW dpi_color_mode: Define DPI pixel format. Default 0.
> + *             0=3D16-bit RGB565 config 1;
> + *             1=3D16-bit RGB565 config 2;
> + *             2=3D16-bit RGB565 config 3;
> + *             3=3D18-bit RGB666 config 1;
> + *             4=3D18-bit RGB666 config 2;
> + *             5=3D24-bit RGB888;
> + *             6=3D20-bit YCbCr 4:2:2;
> + *             7=3D24-bit YCbCr 4:2:2;
> + *             8=3D16-bit YCbCr 4:2:2;
> + *             9=3D30-bit RGB;
> + *             10=3D36-bit RGB;
> + *             11=3D12-bit YCbCr 4:2:0.
> + *    [19] Reserved. Default 0.
> + * [18:16] RW in_color_mode:  Define VENC data width. Default 0.
> + *             0=3D30-bit pixel;
> + *             1=3D24-bit pixel;
> + *             2=3D18-bit pixel, RGB666;
> + *             3=3D16-bit pixel, RGB565.
> + * [15:14] RW chroma_subsample: Define method of chroma subsampling. Def=
ault 0.
> + *             Applicable to YUV422 or YUV420 only.
> + *             0=3DUse even pixel's chroma;
> + *             1=3DUse odd pixel's chroma;
> + *             2=3DUse averaged value between even and odd pair.
> + * [13:12] RW comp2_sel:  Select which component to be Cr or B: Default =
2.
> + *             0=3Dcomp0; 1=3Dcomp1; 2=3Dcomp2.
> + * [11:10] RW comp1_sel:  Select which component to be Cb or G: Default =
1.
> + *             0=3Dcomp0; 1=3Dcomp1; 2=3Dcomp2.
> + *  [9: 8] RW comp0_sel:  Select which component to be Y  or R: Default =
0.
> + *             0=3Dcomp0; 1=3Dcomp1; 2=3Dcomp2.
> + *     [7]    Reserved. Default 0.
> + *     [6] RW de_pol:  Default 0.
> + *             If DE input is active low, set to 1 to invert to active h=
igh.
> + *     [5] RW hsync_pol: Default 0.
> + *             If HS input is active low, set to 1 to invert to active h=
igh.
> + *     [4] RW vsync_pol: Default 0.
> + *             If VS input is active low, set to 1 to invert to active h=
igh.
> + *     [3] RW dpicolorm: Signal to IP.   Default 0.
> + *     [2] RW dpishutdn: Signal to IP.   Default 0.
> + *     [1]    Reserved.  Default 0.
> + *     [0]    Reserved.  Default 0.
> + */
> +#define MIPI_DSI_TOP_CNTL                          0x3c8
> +
> +/* VENC data width */
> +#define VENC_IN_COLOR_30B   0x0
> +#define VENC_IN_COLOR_24B   0x1
> +#define VENC_IN_COLOR_18B   0x2
> +#define VENC_IN_COLOR_16B   0x3
> +
> +/* DPI pixel format */
> +#define DPI_COLOR_16BIT_CFG_1          0
> +#define DPI_COLOR_16BIT_CFG_2          1
> +#define DPI_COLOR_16BIT_CFG_3          2
> +#define DPI_COLOR_18BIT_CFG_1          3
> +#define DPI_COLOR_18BIT_CFG_2          4
> +#define DPI_COLOR_24BIT                        5
> +#define DPI_COLOR_20BIT_YCBCR_422      6
> +#define DPI_COLOR_24BIT_YCBCR_422      7
> +#define DPI_COLOR_16BIT_YCBCR_422      8
> +#define DPI_COLOR_30BIT                        9
> +#define DPI_COLOR_36BIT                        10
> +#define DPI_COLOR_12BIT_YCBCR_420      11
> +
> +#define MIPI_DSI_TOP_DPI_COLOR_MODE    GENMASK(23, 20)
> +#define MIPI_DSI_TOP_IN_COLOR_MODE     GENMASK(18, 16)
> +#define MIPI_DSI_TOP_CHROMA_SUBSAMPLE  GENMASK(15, 14)
> +#define MIPI_DSI_TOP_COMP2_SEL         GENMASK(13, 12)
> +#define MIPI_DSI_TOP_COMP1_SEL         GENMASK(11, 10)
> +#define MIPI_DSI_TOP_COMP0_SEL         GENMASK(9, 8)
> +#define MIPI_DSI_TOP_DE_INVERT         BIT(6)
> +#define MIPI_DSI_TOP_HSYNC_INVERT      BIT(5)
> +#define MIPI_DSI_TOP_VSYNC_INVERT      BIT(4)
> +#define MIPI_DSI_TOP_DPICOLORM         BIT(3)
> +#define MIPI_DSI_TOP_DPISHUTDN         BIT(2)
> +
> +#define MIPI_DSI_TOP_SUSPEND_CNTL                  0x3cc
> +#define MIPI_DSI_TOP_SUSPEND_LINE                  0x3d0
> +#define MIPI_DSI_TOP_SUSPEND_PIX                   0x3d4
> +#define MIPI_DSI_TOP_MEAS_CNTL                     0x3d8
> +/* [0] R  stat_edpihalt:  edpihalt signal from IP.    Default 0. */
> +#define MIPI_DSI_TOP_STAT                          0x3dc
> +#define MIPI_DSI_TOP_MEAS_STAT_TE0                 0x3e0
> +#define MIPI_DSI_TOP_MEAS_STAT_TE1                 0x3e4
> +#define MIPI_DSI_TOP_MEAS_STAT_VS0                 0x3e8
> +#define MIPI_DSI_TOP_MEAS_STAT_VS1                 0x3ec
> +/* [31:16] RW intr_stat/clr. Default 0.
> + *             For each bit, read as this interrupt level status,
> + *             write 1 to clear.
> + * [31:22] Reserved
> + * [   21] stat/clr of eof interrupt
> + * [   21] vde_fall interrupt
> + * [   19] stat/clr of de_rise interrupt
> + * [   18] stat/clr of vs_fall interrupt
> + * [   17] stat/clr of vs_rise interrupt
> + * [   16] stat/clr of dwc_edpite interrupt
> + * [15: 0] RW intr_enable. Default 0.
> + *             For each bit, 1=3Denable this interrupt, 0=3Ddisable.
> + *     [15: 6] Reserved
> + *     [    5] eof interrupt
> + *     [    4] de_fall interrupt
> + *     [    3] de_rise interrupt
> + *     [    2] vs_fall interrupt
> + *     [    1] vs_rise interrupt
> + *     [    0] dwc_edpite interrupt
> + */
> +#define MIPI_DSI_TOP_INTR_CNTL_STAT                0x3f0
> +// 31: 2    Reserved.   Default 0.
> +//  1: 0 RW mem_pd.     Default 3.
> +#define MIPI_DSI_TOP_MEM_PD                        0x3f4
> +
> +#endif /* __MESON_DW_MIPI_DSI_H */
>
> --
> 2.34.1
>
Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
Tested-by: Nicolas Belin <nbelin@baylibre.com> # on Khadas VIM3 + TS050 Pan=
el

Thanks,
Nicolas
