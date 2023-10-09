Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0E37BEBDC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ED610E07B;
	Mon,  9 Oct 2023 20:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8D310E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:44:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so123885e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696884273; x=1697489073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=So3zorxtANU8OzKxE2ER7LHOhZl9oNALCmi3NgfHsEI=;
 b=Y4a6OpCHT/PKQGbdi57xgslRn+PPZeYzv/I6b3wnwizOjJhxrVtYTVo1DNj8WoV9P5
 wQEaPRZhWA8u4/nf+KUlQ58kZ1SpiLShAtZGR5zto6TmENBZ1d85CZHij/s+mZWXdp4Z
 NIVCTkrvSPMsmtqHKW2BVTzHrIN1l37JxA1a4MCquDp4sTzbtlWLsMCBRghbSqVfRMzw
 2vBNev6c2kEdS+N+zhA2iJsZU1fAHxBIONqsewMYRu89fvv3NuSbGt4koLkfeo/UIq19
 YXVaR9GrOznITu3Z+0YW7ZBbnv5sjDkcNltY+SRRf6sPjW9p9bATttOPpEvKRxOvRy7M
 lC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696884273; x=1697489073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=So3zorxtANU8OzKxE2ER7LHOhZl9oNALCmi3NgfHsEI=;
 b=b7PD6VPUnXOzUtHATIxYyJsICQQ16TVBM2w21HJmmpQw4l1htp4ewRZInd7qyXJOfI
 Yvl7CbxMvnZdFWNCq0DliFb627rHz8O2QgBU1mg6gkOfnyh/0o0WigjqwOxo1kkR97oo
 sWy9uVthfS1HWCNM7MxS13g4X94SpUti0MJj/768ISwRVWLRZ95dZlOY649I9TZxB3dW
 9fhuu006cIRz1dVNdppdmiwt33HEbAcc7HWUc74un5WkiESauASGyrwUad4Nilo3YP1P
 JpOsGWWzrOt1hk3/i4xH6Kb2Lbxr8pVimDLjCvT56mRJWfJq0xnPZzJhh8/DW2xJcZBQ
 eI5Q==
X-Gm-Message-State: AOJu0Yz2kIpX9wildJyY5r8kfHcABDtt23AXjpDIDTFxreUpc3isDh6v
 I2OXqmb6rySuCmNAFUgkBBBQn9Zxs37NWFUL6OuNfQ==
X-Google-Smtp-Source: AGHT+IF6+CbEh44YHtbevygHF5Wg609h3b9qF0xM3OARYcg+b7rNC+W0RT49cSyKZGVltPjoscGTi2X+CV8cYuQQmaE=
X-Received: by 2002:a05:600c:2182:b0:404:7462:1f87 with SMTP id
 e2-20020a05600c218200b0040474621f87mr381092wme.6.1696884273298; Mon, 09 Oct
 2023 13:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231007060639.725350-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Oct 2023 13:44:18 -0700
Message-ID: <CAD=FV=Ucpkvt_pjpRtG-6Yrwps7n=BncjWa0uSMsfraHYuK-ug@mail.gmail.com>
Subject: Re: [v1 1/2] drm/panel: ili9882t: Break out as separate driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 6, 2023 at 11:07=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> From: Linus Walleij <linus.walleij@linaro.org>
>
> The Starry ILI9882t-based panel should never have been part of the boe
> tv101wum driver, it is clearly based on the Ilitek ILI9882t display
> controller and if you look at the custom command sequences for the
> panel these clearly contain the signature Ilitek page switch (0xff)
> commands. The hardware has nothing in common with the other panels
> supported by this driver.
>
> Break this out into a separate driver and config symbol instead.
>
> If the placement here is out of convenience for using similar code,
> we should consider creating a helper library instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 752 ++++++++++++++++++
>  4 files changed, 762 insertions(+), 371 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfi=
g
> index ecb22ea326cb..99e14dc212ec 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -203,6 +203,15 @@ config DRM_PANEL_ILITEK_ILI9881C
>           Say Y if you want to enable support for panels based on the
>           Ilitek ILI9881c controller.
>
> +config DRM_PANEL_ILITEK_ILI9882T
> +       tristate "Ilitek ILI9882t-based panels"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         Say Y if you want to enable support for panels based on the
> +         Ilitek ILI9882t controller.

We'll of course run into the same problem we always run into when
Kconfig symbols get renamed or broken apart: people will have to know
to update their configs to include this. Not much we can do about it,
though. :-/ optional: I guess you could theoretically also include an
extra patch in your series to 'arch/arm64/configs/defconfig' enabling
this new config, since the old panel was enabled there...


> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> new file mode 100644
> index 000000000000..bbfcffe65623
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -0,0 +1,752 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panels based on the Ilitek ILI9882T display controller.
> + */
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +/*
> + * Use this descriptor struct to describe different panels using the
> + * Ilitek ILI9882T display controller.
> + */
> +struct panel_desc {
> +       const struct drm_display_mode *modes;
> +       unsigned int bpc;
> +
> +       /**
> +        * @width_mm: width of the panel's active display area
> +        * @height_mm: height of the panel's active display area
> +        */
> +       struct {
> +               unsigned int width_mm;
> +               unsigned int height_mm;
> +       } size;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       const struct panel_init_cmd *init_cmds;
> +       unsigned int init_cmd_length;

Why do you need 'init_cmd_length'? It seems like an arbitrary
difference between the two drivers. Your 'panel_init_cmd' in the new
driver still ends with a 0-length command so just use that so you
don't need to store the length.


> +/* ILI9882-specific commands, add new commands as you decode them */
> +#define ILI9882T_DCS_SWITCH_PAGE       0xFF
> +
> +static const struct panel_init_cmd starry_ili9882t_init_cmd[] =3D {
> +       _INIT_DELAY_CMD(5),
> +       _INIT_DCS_CMD(ILI9882T_DCS_SWITCH_PAGE, 0x98, 0x82, 0x01),

Slightly cleaner, can you do:

#define _INIT_SWITCH_PAGE_CMD(page) \
  _INIT_DCS_CMD(ILI9882T_DCS_SWITCH_PAGE, 0x98, 0x82, (page))

Then in your array you can use stuff like

_INIT_SWITCH_PAGE_CMD(0x01);


> +static int ili9882t_prepare(struct drm_panel *panel)
> +{
> +       struct ili9882t *ili =3D to_ili9882t(panel);
> +       struct mipi_dsi_device *dsi =3D ili->dsi;
> +       int i, ret;
> +
> +       gpiod_set_value(ili->enable_gpio, 0);
> +       usleep_range(1000, 1500);
> +
> +       ret =3D regulator_enable(ili->pp3300);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D regulator_enable(ili->pp1800);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(3000, 5000);
> +
> +       ret =3D regulator_enable(ili->avdd);
> +       if (ret < 0)
> +               goto poweroff1v8;
> +       ret =3D regulator_enable(ili->avee);
> +       if (ret < 0)
> +               goto poweroffavdd;
> +
> +       usleep_range(10000, 11000);
> +
> +       // MIPI needs to keep the LP11 state before the lcm_reset pin is =
pulled high
> +       mipi_dsi_dcs_nop(ili->dsi);
> +       usleep_range(1000, 2000);
> +
> +       gpiod_set_value(ili->enable_gpio, 1);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ili->enable_gpio, 0);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(ili->enable_gpio, 1);
> +       usleep_range(6000, 10000);
> +
> +       for(i =3D 0; i < ili->desc->init_cmd_length; i++) {
> +               const struct panel_init_cmd *cmd =3D &ili->desc->init_cmd=
s[i];
> +               switch (cmd->type) {
> +               case DELAY_CMD:
> +                       msleep(cmd->data[0]);
> +                       ret =3D 0;
> +                       break;
> +
> +               case INIT_DCS_CMD:
> +                       ret =3D mipi_dsi_dcs_write(dsi, cmd->data[0],
> +                                                       cmd->len <=3D 1 ?=
 NULL :
> +                                                       &cmd->data[1],
> +                                                       cmd->len - 1);
> +                       break;
> +
> +               default:
> +                       ret =3D -EINVAL;
> +               }
> +
> +               if (ret < 0) {
> +                       dev_err(panel->dev,
> +                               "failed to write command %u\n", i);
> +                  goto poweroff;
> +               }
> +       }

In the boe driver the above is in a sub-function
boe_panel_init_dcs_cmd(). Can you create a similar sub-function for
the ili9882t driver? It seems like a nice logical thing to break out
and nice not to have arbitrary differences between the two drivers
since they're so similar...


> +static const struct panel_desc starry_ili9882t_desc =3D {
> +       .modes =3D &starry_ili9882t_default_mode,
> +       .bpc =3D 8,
> +       .size =3D {
> +               .width_mm =3D 141,
> +               .height_mm =3D 226,
> +       },
> +       .lanes =3D 4,
> +       .format =3D MIPI_DSI_FMT_RGB888,
> +       .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PU=
LSE |
> +                         MIPI_DSI_MODE_LPM,

nit: please fix indentation of the line above.


> +       .init_cmds =3D starry_ili9882t_init_cmd,
> +       .init_cmd_length =3D ARRAY_SIZE(starry_ili9882t_init_cmd),
> +};
> +
> +static int ili9882t_get_modes(struct drm_panel *panel,
> +                                  struct drm_connector *connector)

nit: please fix indentation of the line above.


> +static int ili9882t_add(struct ili9882t *ili)
> +{
> +       struct device *dev =3D &ili->dsi->dev;
> +       int err;
> +
> +       ili->avdd =3D devm_regulator_get(dev, "avdd");
> +       if (IS_ERR(ili->avdd))
> +               return PTR_ERR(ili->avdd);
> +
> +       ili->avee =3D devm_regulator_get(dev, "avee");
> +       if (IS_ERR(ili->avee))
> +               return PTR_ERR(ili->avee);
> +
> +       ili->pp3300 =3D devm_regulator_get(dev, "pp3300");
> +       if (IS_ERR(ili->pp3300))
> +               return PTR_ERR(ili->pp3300);
> +
> +       ili->pp1800 =3D devm_regulator_get(dev, "pp1800");
> +       if (IS_ERR(ili->pp1800))
> +               return PTR_ERR(ili->pp1800);
> +
> +       ili->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW)=
;
> +       if (IS_ERR(ili->enable_gpio)) {
> +               dev_err(dev, "cannot get reset-gpios %ld\n",
> +                       PTR_ERR(ili->enable_gpio));
> +               return PTR_ERR(ili->enable_gpio);
> +       }
> +
> +       gpiod_set_value(ili->enable_gpio, 0);
> +
> +       drm_panel_init(&ili->base, dev, &ili9882t_funcs,
> +                          DRM_MODE_CONNECTOR_DSI);

nit: the indentation of the above line isn't quite right. Just put the
whole drm_panel_init() on one line even if it's slightly over 80
characters long.


> +static void ili9882t_shutdown(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> +
> +       drm_panel_disable(&ili->base);
> +       drm_panel_unprepare(&ili->base);
> +}

Please remove the "shutdown()" function. The above two calls to
drm_panel_disable() and drm_panel_unprepare() require that the panel
driver is tracking the "prepared" / "enabled" state and will trigger
warnings if you try shutting down while the panel was off.

We shouldn't need the shutdown functionality because all of the DRM
drivers that this panel is used together with should properly call
drm_atomic_helper_shutdown(). For details, see the long discussion in
reply to my patch at:

https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f8=
9613b5cec0f14@changeid


> +static void ili9882t_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> +       int ret;
> +
> +       ili9882t_shutdown(dsi);
> +
> +       ret =3D mipi_dsi_detach(dsi);
> +       if (ret < 0)
> +               dev_err(&dsi->dev, "failed to detach from DSI host: %d\n"=
, ret);
> +
> +       if (ili->base.dev)
> +               drm_panel_remove(&ili->base);
> +}
> +
> +static const struct of_device_id ili9882t_of_match[] =3D {
> +       { .compatible =3D "starry,ili9882t",
> +         .data =3D &starry_ili9882t_desc
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9882t_of_match);
> +
> +static struct mipi_dsi_driver ili9882t_driver =3D {
> +       .driver =3D {
> +               .name =3D "panel-ili9882t",
> +               .of_match_table =3D ili9882t_of_match,
> +       },
> +       .probe =3D ili9882t_probe,
> +       .remove =3D ili9882t_remove,
> +       .shutdown =3D ili9882t_shutdown,
> +};
> +module_mipi_dsi_driver(ili9882t_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Ilitek ILI9882T-based panels driver");
> +MODULE_LICENSE("GPL");
> \ No newline at end of file

Please make sure there's a newline at the end of the file so you don't
have the "No newline at end of file".
