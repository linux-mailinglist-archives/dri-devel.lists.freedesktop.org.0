Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B184550917E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B73D10E355;
	Wed, 20 Apr 2022 20:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0110E355
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:41:39 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f18982c255so31563357b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+UsRV+Bwz/rQUSkFtexSYo6l5H0YOeAYtjDiVD/Ajo=;
 b=MmRjdwU2TIc2Wf5IWw4+XQULmFR9hb4gq5Qad9uCE0SHvHXc/uuyKSZmLRbuJhtcjL
 xWwpSAvJwZSRiRqpKTt8MB4TMkI7DdZBtmYagzbHs3WY/JpqdYS8DGWTIjDCVM83vggm
 wpOUVKavpBIknAuIa4sv6LMWqtnDn1nmu2ckf1uf/dz+F8KwmDam1MidCWGfTu5cJ3zf
 8Hj31oaXgzLhnPRZOXwzqBAGWOTSdRXoqnXEd98jDosQZu4QmpsvO/v4pGN2aVt/4+pG
 VyLh79gDSSOrs5Ah39pHdyAgVXx9Ee4cpLdpvXxscB3fZqM429dPU1ys5w7GmF7m7oEB
 6+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+UsRV+Bwz/rQUSkFtexSYo6l5H0YOeAYtjDiVD/Ajo=;
 b=Kg5RIvbJnBS7HdHxVbp0iwYQDIUnUVYz27tSmGh/x9nlD3VIOS9aj98ZNbTtXQiY7L
 cG8D0vMJxts0aLzEDNZbbX9C2XQ437bMRiVmkMGLAvl0MKjPA5evrCkZmhDCCuJztv+V
 VRVL5Otn+JLX4MMFhiRUsHut0yOVUo0i6oy8CHinqiRYk6w4KOtF0WJ2DlIUodqb40Cx
 Ievr65WAjHMkc+qZI6KJQzZ9vs74NAq7k8MP/gq68jT1Rt8jlSBGYstHdImz1OcqCfvN
 jjn0VX7ztRnYCvx4scc2S6KDpzKLf+QwGU5ooI5d3L5xwrf/EFNy7rCufFnT4Ge/bvmC
 FOzQ==
X-Gm-Message-State: AOAM532RtT8Oi53J4XMVDDtVX200lxsBKN7zf0El5TQIVMP4R8lNyKnP
 Eh6D9XKW6Og4OoMjFk+8nyINcPHpryK4tjkb4ztbifPcbOA5oA==
X-Google-Smtp-Source: ABdhPJxIdDLYdsVvK/ed+dSc5p/hhoLi3vaZ3K/89Vux1eEDgP9b5NMfAmcu6HJE2jZFxWn0QkNDXlfjkYyCTJhf9FM=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr24565285ywh.140.1650487298900; Wed, 20
 Apr 2022 13:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220414081916.11766-1-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20220414081916.11766-1-xiazhengqiao@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Apr 2022 22:41:27 +0200
Message-ID: <CACRpkdYRbPtir7a3rv4VhKTwSU2O7Em1CGFDfQ68M0r0T7QjwA@mail.gmail.com>
Subject: Re: [RESEND v2 1/2] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel
 driver
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 10:19 AM xiazhengqiao
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:

> Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
>
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

OK cool... Do you know the name of the display controller
used in this panel? We tend to name the implementation, Kconfig
symbols etc after the display controller such as panel-ilitek-*
panel-truly-* panel-novatek-* etc. This would be panel-innolux-xyznnnn.c
in that case. We already have:
panel-innolux-ej030na.c
panel-innolux-p079zca.c

> +struct panel_desc {

Name it after the panel. struct inx_config to reflect other code
in this subsystem.

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

This seems a bit overdesigned, why not just put these two unsigned in the
strict as is without an anonymous struct in the struct?

> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       const struct panel_init_cmd *init_cmds;

OK so a sequence of commands per panel type I get it.

> +       unsigned int lanes;
> +       bool discharge_on_disable;
> +};
> +
> +struct inx_panel {
> +       struct drm_panel base;
> +       struct mipi_dsi_device *dsi;
> +
> +       const struct panel_desc *desc;
> +
> +       enum drm_panel_orientation orientation;
> +       struct regulator *pp1800;
> +       struct regulator *avee;
> +       struct regulator *avdd;

These match the pin names on the chip? (Just checking.)

> +       struct gpio_desc *enable_gpio;
> +
> +       bool prepared;
> +};
> +
> +enum dsi_cmd_type {
> +       INIT_DCS_CMD,
> +       DELAY_CMD,
> +};

I've seen this comand/delay sequencing before. Maybe something
we should generalize as it keeps popping up?

> +struct panel_init_cmd {
> +       enum dsi_cmd_type type;
> +       size_t len;
> +       const char *data;
> +};
> +
> +#define _INIT_DCS_CMD(...) { \
> +       .type = INIT_DCS_CMD, \
> +       .len = sizeof((char[]){__VA_ARGS__}), \
> +       .data = (char[]){__VA_ARGS__} }
> +
> +#define _INIT_DELAY_CMD(...) { \
> +       .type = DELAY_CMD,\
> +       .len = sizeof((char[]){__VA_ARGS__}), \
> +       .data = (char[]){__VA_ARGS__} }

These defines are massive overkill, especially .len, if you look
below it is clear that all of them have ... len = 2 and two that have
len = 1.

If these macros are just for this driver ... drop them, just do something
like:

struct inx_init_tuple {
    u8 cmd;
    u8 val;
};

static const struct inx_tuple inx_init_seq[] = {
    { .cmd = ..., .val = ...}
   ...
};

Then iterate over this array of structs until you reach
ARRAY_SIZE(inx_init_seq).

Just hardcode the delays etc in the end.

> +static const struct panel_init_cmd starry_qfh032011_53g_init_cmd[] = {
> +       _INIT_DCS_CMD(0xB0, 0x01),

All of these opaque 0xB0 etc, create a proper #define for that parameter
using the name in the datasheet. It's especially helpful if the datasheet is
not public which is usually the case, but I think that you have it?
It's really hard for the next system using this to alter things if they have no
idea what the different parameters are.

> +       _INIT_DCS_CMD(0xC3, 0x4F),
> +       _INIT_DCS_CMD(0xC4, 0x40),
> +       _INIT_DCS_CMD(0xC5, 0x40),
> +       _INIT_DCS_CMD(0xC6, 0x40),
> +       _INIT_DCS_CMD(0xC7, 0x40),
> +       _INIT_DCS_CMD(0xC8, 0x4D),
> +       _INIT_DCS_CMD(0xC9, 0x52),
> +       _INIT_DCS_CMD(0xCA, 0x51),
> +       _INIT_DCS_CMD(0xCD, 0x5D),
> +       _INIT_DCS_CMD(0xCE, 0x5B),
> +       _INIT_DCS_CMD(0xCF, 0x4B),
> +       _INIT_DCS_CMD(0xD0, 0x49),
> +       _INIT_DCS_CMD(0xD1, 0x47),
> +       _INIT_DCS_CMD(0xD2, 0x45),
> +       _INIT_DCS_CMD(0xD3, 0x41),
> +       _INIT_DCS_CMD(0xD7, 0x50),
> +       _INIT_DCS_CMD(0xD8, 0x40),
> +       _INIT_DCS_CMD(0xD9, 0x40),
> +       _INIT_DCS_CMD(0xDA, 0x40),
> +       _INIT_DCS_CMD(0xDB, 0x40),
> +       _INIT_DCS_CMD(0xDC, 0x4E),
> +       _INIT_DCS_CMD(0xDD, 0x52),
> +       _INIT_DCS_CMD(0xDE, 0x51),
> +       _INIT_DCS_CMD(0xE1, 0x5E),
> +       _INIT_DCS_CMD(0xE2, 0x5C),
> +       _INIT_DCS_CMD(0xE3, 0x4C),
> +       _INIT_DCS_CMD(0xE4, 0x4A),
> +       _INIT_DCS_CMD(0xE5, 0x48),
> +       _INIT_DCS_CMD(0xE6, 0x46),
> +       _INIT_DCS_CMD(0xE7, 0x42),
> +       _INIT_DCS_CMD(0xB0, 0x03),
> +       _INIT_DCS_CMD(0xBE, 0x03),
> +       _INIT_DCS_CMD(0xCC, 0x44),
> +       _INIT_DCS_CMD(0xC8, 0x07),
> +       _INIT_DCS_CMD(0xC9, 0x05),
> +       _INIT_DCS_CMD(0xCA, 0x42),
> +       _INIT_DCS_CMD(0xCD, 0x3E),
> +       _INIT_DCS_CMD(0xCF, 0x60),
> +       _INIT_DCS_CMD(0xD2, 0x04),
> +       _INIT_DCS_CMD(0xD3, 0x04),
> +       _INIT_DCS_CMD(0xD4, 0x01),
> +       _INIT_DCS_CMD(0xD5, 0x00),
> +       _INIT_DCS_CMD(0xD6, 0x03),
> +       _INIT_DCS_CMD(0xD7, 0x04),
> +       _INIT_DCS_CMD(0xD9, 0x01),
> +       _INIT_DCS_CMD(0xDB, 0x01),
> +       _INIT_DCS_CMD(0xE4, 0xF0),
> +       _INIT_DCS_CMD(0xE5, 0x0A),
> +       _INIT_DCS_CMD(0xB0, 0x00),
> +       _INIT_DCS_CMD(0xCC, 0x08),
> +       _INIT_DCS_CMD(0xC2, 0x08),
> +       _INIT_DCS_CMD(0xC4, 0x10),
> +       _INIT_DCS_CMD(0xB0, 0x02),
> +       _INIT_DCS_CMD(0xC0, 0x00),
> +       _INIT_DCS_CMD(0xC1, 0x0A),
> +       _INIT_DCS_CMD(0xC2, 0x20),
> +       _INIT_DCS_CMD(0xC3, 0x24),
> +       _INIT_DCS_CMD(0xC4, 0x23),
> +       _INIT_DCS_CMD(0xC5, 0x29),
> +       _INIT_DCS_CMD(0xC6, 0x23),
> +       _INIT_DCS_CMD(0xC7, 0x1C),
> +       _INIT_DCS_CMD(0xC8, 0x19),
> +       _INIT_DCS_CMD(0xC9, 0x17),
> +       _INIT_DCS_CMD(0xCA, 0x17),
> +       _INIT_DCS_CMD(0xCB, 0x18),
> +       _INIT_DCS_CMD(0xCC, 0x1A),
> +       _INIT_DCS_CMD(0xCD, 0x1E),
> +       _INIT_DCS_CMD(0xCE, 0x20),
> +       _INIT_DCS_CMD(0xCF, 0x23),
> +       _INIT_DCS_CMD(0xD0, 0x07),
> +       _INIT_DCS_CMD(0xD1, 0x00),
> +       _INIT_DCS_CMD(0xD2, 0x00),
> +       _INIT_DCS_CMD(0xD3, 0x0A),
> +       _INIT_DCS_CMD(0xD4, 0x13),
> +       _INIT_DCS_CMD(0xD5, 0x1C),
> +       _INIT_DCS_CMD(0xD6, 0x1A),
> +       _INIT_DCS_CMD(0xD7, 0x13),
> +       _INIT_DCS_CMD(0xD8, 0x17),
> +       _INIT_DCS_CMD(0xD9, 0x1C),
> +       _INIT_DCS_CMD(0xDA, 0x19),
> +       _INIT_DCS_CMD(0xDB, 0x17),
> +       _INIT_DCS_CMD(0xDC, 0x17),
> +       _INIT_DCS_CMD(0xDD, 0x18),
> +       _INIT_DCS_CMD(0xDE, 0x1A),
> +       _INIT_DCS_CMD(0xDF, 0x1E),
> +       _INIT_DCS_CMD(0xE0, 0x20),
> +       _INIT_DCS_CMD(0xE1, 0x23),
> +       _INIT_DCS_CMD(0xE2, 0x07),

So make all of this use that struct then hardcode the rest.

> +       _INIT_DCS_CMD(0X11),

Just call mipi_dsi_dcs_exit_sleep_mode(dsi) which sends exactly
this command over DSI.

> +       _INIT_DELAY_CMD(120),

Just harcode this.

> +       _INIT_DCS_CMD(0X29),

This command is a bit weird since it means
MIPI_DSI_GENERIC_LONG_WRITE and it is strange to have
this and nothing else at the end. At least use the define
from <video/mipi_display.h>

> +       _INIT_DELAY_CMD(80),

Just hardcode this.

> +static int inx_panel_enter_sleep_mode(struct inx_panel *inx)
> +{
> +       struct mipi_dsi_device *dsi = inx->dsi;
> +       int ret;
> +
> +       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +       ret = mipi_dsi_dcs_set_display_off(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}

This looks good.

> +static int inx_panel_prepare(struct drm_panel *panel)
> +{
> +       struct inx_panel *inx = to_inx_panel(panel);
> +       int ret;
> +
> +       if (inx->prepared)
> +               return 0;

This is unnecessary. Trust the framework to keep track of
this and drop that prepared member of inx.

> +       gpiod_set_value(inx->enable_gpio, 0);
> +       usleep_range(1000, 1500);
> +
> +       ret = regulator_enable(inx->pp1800);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(3000, 5000);
> +
> +       ret = regulator_enable(inx->avdd);> +
> +static struct mipi_dsi_driver inx_panel_driver = {
> +       .driver = {
> +               .name = "panel-innolux-himax8279d",
> +               .of_match_table = inx_of_match,
> +       },
> +       .probe = inx_panel_probe,
> +       .remove = inx_panel_remove,
> +       .shutdown = inx_panel_shutdown,
> +};
> +module_mipi_dsi_driver(inx_panel_driver);
> +
> +MODULE_AUTHOR("Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>");
> +MODULE_DESCRIPTION("INNOLUX HIMAX8279D 1200x1920 video mode panel driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1

> +       if (ret < 0)
> +               goto poweroff1v8;
> +       ret = regulator_enable(inx->avee);
> +       if (ret < 0)
> +               goto poweroffavdd;
> +
> +       usleep_range(5000, 10000);
> +
> +       gpiod_set_value(inx->enable_gpio, 1);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(inx->enable_gpio, 0);
> +       usleep_range(1000, 2000);
> +       gpiod_set_value(inx->enable_gpio, 1);
> +       usleep_range(6000, 10000);

Care to explain what is happening here? Add a comment
about this wire shake. Honestly this looks more like
a RESET_N signal (active low reset) than an enable, so
in that case rename it reset_gpiod?

If this is an active low reset, invert the values and tag the
reset line with GPIO_ACTIVE_LOW in the device tree and
mention this in the DT bindings.

> +static int inx_panel_enable(struct drm_panel *panel)
> +{
> +       msleep(130);
> +       return 0;
> +}

This looks pretty pointless. Can't you just stick this msleep(130)
and the end of .prepare() and skip this?

> +       inx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);

Suspect this is reset_gpio and should be flagged active low
in the device tree and requested GPIOD_OUT_HIGH instead.

> +       if (IS_ERR(inx->enable_gpio)) {
> +               dev_err(dev, "cannot get reset-gpios %ld\n",

You even say it  is reset-gpios ... :P> +
> +static struct mipi_dsi_driver inx_panel_driver = {
> +       .driver = {
> +               .name = "panel-innolux-himax8279d",
> +               .of_match_table = inx_of_match,
> +       },
> +       .probe = inx_panel_probe,
> +       .remove = inx_panel_remove,
> +       .shutdown = inx_panel_shutdown,
> +};
> +module_mipi_dsi_driver(inx_panel_driver);
> +
> +MODULE_AUTHOR("Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>");
> +MODULE_DESCRIPTION("INNOLUX HIMAX8279D 1200x1920 video mode panel driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1

> +static const struct of_device_id inx_of_match[] = {
> +       { .compatible = "starry,2081101qfh032011-53g",
> +         .data = &starry_qfh032011_53g_desc
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, inx_of_match);

It's really nice that you make it possible to use more displays with the
same display controller!

Yours,
Linus Walleij
