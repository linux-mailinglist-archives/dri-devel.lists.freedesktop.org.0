Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7AF379062
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 16:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C8D6E49A;
	Mon, 10 May 2021 14:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA666E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 14:12:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b17so18913451ede.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5MTXRkvwO6PNkIJZM/XPnfLyx7gPa7Pgx7zx+jwH+LI=;
 b=WAHYWIb9HtBP2yF04hR7cLrtx7p5E0rrmg2ZD58RJh9Bd+MRJeOvqbHcIKwV2y8rF8
 eaTeLncwdbeslDpgWY/68SmTWUTbaI2dQsD2IegK5s9Gx0Mgolf7cZc7Aaoyq3kWbaBB
 BE+KjTtqABw395/bXKIlRVZLJF6TCCTT1643Dvf7hWaL5jcB/0Moy28mBWYfe/hYWiQy
 uwA71CSejIzrXdmdP+IkECfKqhPxxdTsG0ootnX5zhjAQGQ+YDl9XoO3Zta5O9jjsD8L
 YPAo9b4nmOy5oGg7/bpXLu34obXdgeFkAyGZPRZhkKICJIBc6/y7UKmFV+wGAggjoUqu
 M+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5MTXRkvwO6PNkIJZM/XPnfLyx7gPa7Pgx7zx+jwH+LI=;
 b=FD3UhE7Sn34jYQGtHkTeisJDkFz6FGARWtrki1Sa3Har6fSzqRVd2STZmK4VYa3Of6
 jBXV+1AFxF8CFyKyKqrs4o9a+qesmOE4klXMvZl4nuivtE+rdq07E5+Z3yoa94aplVUl
 +rtnG7yUMJthS2+FJ+gXPsIdQVcb8Jb3DZCUURO95Mrd/a3xK2cJgJfhefL6TdlDillP
 iZH06LdKs/EtCNGBwlorNNsuyccG8Z35IMHgJS6PbONv/AKqdpA8YzKvkOYMSyl7XMRU
 VD+jOk6ODyHZVARnonW391xC5kuZuLBiBqE60LlN3GYsCxM6/8um2uEHMHIzzKqAucpB
 1AuA==
X-Gm-Message-State: AOAM533LMAcahOu6OTEyxcM6ZUFIStJ0UkVRWt/Ne7nN/ao5/l3rgZ/4
 q/Fx1Ncun18d/vim3YC7PozpmxpuMszTEaVcgAU=
X-Google-Smtp-Source: ABdhPJyhQjHFidfnf1httbSiesEwi/qmo6XNnr4ZvT/qKOzqmtwvHcIgzuuWSF2alHJZrsfkQoleCxXhVaYTn2LDT8I=
X-Received: by 2002:a05:6402:310a:: with SMTP id
 dc10mr29704071edb.38.1620655952122; 
 Mon, 10 May 2021 07:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005134250.527153-1-marex@denx.de>
 <20201005134250.527153-3-marex@denx.de>
In-Reply-To: <20201005134250.527153-3-marex@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 10 May 2021 09:12:21 -0500
Message-ID: <CAHCN7xJtnYHvLWkawYpi=BYbtfSrvHnNzqp767rOZjOGsAJV=g@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] drm/exynos: Add basic i.MX8MM support code
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
Cc: linux-samsung-soc@vger.kernel.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 8:48 AM Marek Vasut <marex@denx.de> wrote:
>
> This adds basic i.MX8MM glue code for the Samsung DSIM PHY.
> There are still a couple of items which need to be sorted out
> in drivers/gpu/drm/bridge/samsung-dsim.c before this can even
> be merged, specifically:
>
> - The dsi->out_bridge is not populated until samsung_dsim_host_attach()
>   is called, however samsung_dsim_host_attach() is not called until the
>   next bridge attaches and calls mipi_dsi_attach(), and that only happens
>   after the DSIM calls drm_bridge_attach() on that next bridge.
>
> - The samsung_dsim_bridge_mode_fixup() is needed for iMX8MM LCDIF to set
>   the correct sync flags. This likely needs to be done in the glue code.

Since you asked for an RFC, I
I applied Michael's series and this series to 5.12 since we are so
close on having the blk-clk and the power domain stuff working.  I
also tried your patch for the ti-sn65dsi83 and the adv7511 on the
Beacon imx8mm development kit.

In both the HDMI bridge and LVDS bridge, I am able to get the modetest
and drmdevice to return data that looks valid.  The resolution and
refresh look correct, but I am not able to can an actual image to
generate out to either the LVDS or the HDMI.  I am able to get the
image to appear using the NXP kernel with the ADV7511 HDMI bridge, so
that leads me to believe there might be something wrong with either
LCDIF or the Samsung DSIM layer code.  I am guess it's the Samsung
DSIM stuff since the LCDIF has been around for a while.

I am not particularly well versed in the video world, but if you have
something you'd like me to try, i am willing to try it.

adam

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> --
> NOTE: This depends on https://patchwork.kernel.org/project/dri-devel/list=
/?series=3D347439
> ---
>  drivers/gpu/drm/bridge/Kconfig            |   6 +
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/samsung-dsim-imx.c | 161 ++++++++++++++++++++++
>  drivers/gpu/drm/bridge/samsung-dsim.c     |  25 +++-
>  4 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim-imx.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 2d4459f78cdc..f97a8ebfcef1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -129,6 +129,12 @@ config DRM_SAMSUNG_DSIM
>         help
>           Samsung MIPI DSI bridge driver.
>
> +config DRM_SAMSUNG_DSIM_IMX
> +       tristate "Samsung MIPI DSI bridge extras for NXP i.MX"
> +       depends on DRM_SAMSUNG_DSIM
> +       help
> +         Samsung MIPI DSI bridge driver extras for NXP i.MX.
> +
>  config DRM_SIL_SII8620
>         tristate "Silicon Image SII8620 HDMI/MHL bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index f7972d703c5d..61188a0cd052 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_NXP_PTN3460) +=3D nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) +=3D parade-ps8622.o
>  obj-$(CONFIG_DRM_PARADE_PS8640) +=3D parade-ps8640.o
>  obj-$(CONFIG_DRM_SAMSUNG_DSIM) +=3D samsung-dsim.o
> +obj-$(CONFIG_DRM_SAMSUNG_DSIM_IMX) +=3D samsung-dsim-imx.o
>  obj-$(CONFIG_DRM_SIL_SII8620) +=3D sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) +=3D sii902x.o
>  obj-$(CONFIG_DRM_SII9234) +=3D sii9234.o
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim-imx.c b/drivers/gpu/drm/=
bridge/samsung-dsim-imx.c
> new file mode 100644
> index 000000000000..6c7307ce7eaf
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/samsung-dsim-imx.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * NXP i.MX8M SoC MIPI DSI driver
> + *
> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/bridge/samsung-dsim.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +enum {
> +       DSI_PORT_IN,
> +       DSI_PORT_OUT
> +};
> +
> +struct imx_dsim_priv {
> +       struct samsung_dsim *dsi;
> +       struct drm_encoder encoder;
> +};
> +
> +static const unsigned int imx8mm_dsim_reg_values[] =3D {
> +       [RESET_TYPE] =3D DSIM_SWRST,
> +       [PLL_TIMER] =3D 500,
> +       [STOP_STATE_CNT] =3D 0xf,
> +       [PHYCTRL_ULPS_EXIT] =3D 0xaf,
> +       [PHYCTRL_VREG_LP] =3D 0,
> +       [PHYCTRL_SLEW_UP] =3D 0,
> +       [PHYTIMING_LPX] =3D 0x06,
> +       [PHYTIMING_HS_EXIT] =3D 0x0b,
> +       [PHYTIMING_CLK_PREPARE] =3D 0x07,
> +       [PHYTIMING_CLK_ZERO] =3D 0x26,
> +       [PHYTIMING_CLK_POST] =3D 0x0d,
> +       [PHYTIMING_CLK_TRAIL] =3D 0x08,
> +       [PHYTIMING_HS_PREPARE] =3D 0x08,
> +       [PHYTIMING_HS_ZERO] =3D 0x0d,
> +       [PHYTIMING_HS_TRAIL] =3D 0x0b,
> +};
> +
> +static int imx_dsim_host_attach(struct device *dev,
> +                                 struct mipi_dsi_device *device)
> +{
> +       struct imx_dsim_priv *dsi =3D dev_get_drvdata(dev);
> +       struct drm_device *drm =3D dsi->encoder.dev;
> +
> +       if (drm->mode_config.poll_enabled)
> +               drm_kms_helper_hotplug_event(drm);
> +
> +       return 0;
> +}
> +
> +static int imx_dsim_host_detach(struct device *dev,
> +                                 struct mipi_dsi_device *device)
> +{
> +       struct imx_dsim_priv *dsi =3D dev_get_drvdata(dev);
> +       struct drm_device *drm =3D dsi->encoder.dev;
> +
> +       if (drm->mode_config.poll_enabled)
> +               drm_kms_helper_hotplug_event(drm);
> +
> +       return 0;
> +}
> +
> +static const struct samsung_dsim_host_ops imx_dsim_host_ops =3D {
> +       .attach =3D imx_dsim_host_attach,
> +       .detach =3D imx_dsim_host_detach,
> +};
> +
> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data =3D =
{
> +       .reg_ofs =3D EXYNOS5433_REG_OFS,
> +       .plltmr_reg =3D 0xa0,
> +       .has_clklane_stop =3D 1,
> +       .num_clks =3D 2,
> +       .max_freq =3D 2100,
> +       .wait_for_reset =3D 0,
> +       .num_bits_resol =3D 12,
> +       .reg_values =3D imx8mm_dsim_reg_values,
> +       .host_ops =3D &imx_dsim_host_ops,
> +};
> +
> +static const struct of_device_id imx_dsim_of_match[] =3D {
> +       { .compatible =3D "fsl,imx8mm-mipi-dsim",
> +         .data =3D &imx8mm_dsi_driver_data },
> +       { }
> +};
> +
> +static int imx_dsim_probe(struct platform_device *pdev)
> +{
> +       struct imx_dsim_priv *dsi;
> +       struct device *dev =3D &pdev->dev;
> +
> +       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +       if (!dsi)
> +               return -ENOMEM;
> +       platform_set_drvdata(pdev, dsi);
> +
> +       dsi->dsi =3D samsung_dsim_probe(pdev);
> +       if (IS_ERR(dsi->dsi))
> +               return PTR_ERR(dsi->dsi);
> +
> +       pm_runtime_enable(dev);
> +
> +       return 0;
> +}
> +
> +static int imx_dsim_remove(struct platform_device *pdev)
> +{
> +       struct imx_dsim_priv *dsi =3D platform_get_drvdata(pdev);
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       samsung_dsim_remove(dsi->dsi);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx_dsim_suspend(struct device *dev)
> +{
> +       struct imx_dsim_priv *dsi =3D dev_get_drvdata(dev);
> +
> +       return samsung_dsim_suspend(dsi->dsi);
> +}
> +
> +static int __maybe_unused imx_dsim_resume(struct device *dev)
> +{
> +       struct imx_dsim_priv *dsi =3D dev_get_drvdata(dev);
> +
> +       return samsung_dsim_resume(dsi->dsi);
> +}
> +
> +static const struct dev_pm_ops imx_dsim_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(imx_dsim_suspend, imx_dsim_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver imx_dsim_driver =3D {
> +       .probe =3D imx_dsim_probe,
> +       .remove =3D imx_dsim_remove,
> +       .driver =3D {
> +                  .name =3D "imx-dsim-dsi",
> +                  .owner =3D THIS_MODULE,
> +                  .pm =3D &imx_dsim_pm_ops,
> +                  .of_match_table =3D imx_dsim_of_match,
> +       },
> +};
> +
> +module_platform_driver(imx_dsim_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("NXP i.MX8M SoC MIPI DSI");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 42b49546dd00..12aeceb40450 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1388,8 +1389,15 @@ static int samsung_dsim_bridge_attach(struct drm_b=
ridge *bridge,
>  {
>         struct samsung_dsim *dsi =3D bridge->driver_private;
>         struct drm_encoder *encoder =3D bridge->encoder;
> +       struct device *dev =3D dsi->dev;
> +       struct device_node *np =3D dev->of_node;
>         int ret;
>
> +       ret =3D drm_of_find_panel_or_bridge(np, 1, 0,
> +                                         &dsi->panel, &dsi->out_bridge);
> +       if (ret)
> +               return ret;
> +
>         if (!dsi->out_bridge && !dsi->panel)
>                 return -EPROBE_DEFER;
>
> @@ -1398,7 +1406,6 @@ static int samsung_dsim_bridge_attach(struct drm_br=
idge *bridge,
>                                         bridge, flags);
>                 if (ret)
>                         return ret;
> -               list_splice_init(&encoder->bridge_chain, &dsi->bridge_cha=
in);
>         } else {
>                 ret =3D samsung_dsim_create_connector(dsi);
>                 if (ret)
> @@ -1456,18 +1463,31 @@ static void samsung_dsim_bridge_mode_set(struct d=
rm_bridge *bridge,
>         drm_mode_copy(&dsi->mode, adjusted_mode);
>  }
>
> +static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
> +                                          const struct drm_display_mode =
*mode,
> +                                          struct drm_display_mode *adjus=
ted_mode)
> +{
> +       /* At least LCDIF + DSIM needs active low sync */
> +       adjusted_mode->flags |=3D (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_N=
VSYNC);
> +       adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_=
PVSYNC);
> +
> +       return true;
> +}
> +
>  static const struct drm_bridge_funcs samsung_dsim_bridge_funcs =3D {
>         .attach =3D samsung_dsim_bridge_attach,
>         .detach =3D samsung_dsim_bridge_detach,
>         .enable =3D samsung_dsim_bridge_enable,
>         .disable =3D samsung_dsim_bridge_disable,
>         .mode_set =3D samsung_dsim_bridge_mode_set,
> +       .mode_fixup =3D samsung_dsim_bridge_mode_fixup,
>  };
>
>  static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>                                     struct mipi_dsi_device *device)
>  {
>         struct samsung_dsim *dsi =3D host_to_dsi(host);
> +#if 0
>         const struct samsung_dsim_host_ops *ops =3D dsi->driver_data->hos=
t_ops;
>         struct drm_bridge *out_bridge;
>
> @@ -1493,13 +1513,16 @@ static int samsung_dsim_host_attach(struct mipi_d=
si_host *host,
>                 if (ret)
>                         return ret;
>         }
> +#endif
>
>         dsi->lanes =3D device->lanes;
>         dsi->format =3D device->format;
>         dsi->mode_flags =3D device->mode_flags;
>
> +#if 0
>         if (ops && ops->attach)
>                 ops->attach(dsi->dsi_host.dev, device);
> +#endif
>
>         return 0;
>  }
> --
> 2.28.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
