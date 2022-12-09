Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A664813F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 12:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B21310E51A;
	Fri,  9 Dec 2022 11:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DF10E51A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 11:01:20 +0000 (UTC)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl [83.9.1.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 500033F27A;
 Fri,  9 Dec 2022 12:01:12 +0100 (CET)
Message-ID: <c81c3fdb-7af7-c9f8-f354-78b2d6ce0d20@somainline.org>
Date: Fri, 9 Dec 2022 12:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
References: <20220930180812.32210-1-konrad.dybcio@somainline.org>
 <20220930180812.32210-2-konrad.dybcio@somainline.org>
 <8a78ab73-443f-a18d-b8ef-4a2d507aa1fb@somainline.org>
 <5dea6c72-1323-f052-a386-887c20e9f8c3@somainline.org>
Content-Language: en-US
In-Reply-To: <5dea6c72-1323-f052-a386-887c20e9f8c3@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Thierry Reding <thierry.reding@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.11.2022 15:55, Konrad Dybcio wrote:
> 
> 
> On 14/10/2022 18:36, Konrad Dybcio wrote:
>>
>>
>> On 30.09.2022 20:08, Konrad Dybcio wrote:
>>> Add support for the Sony TD4353 JDI 2160x1080 display panel used in
>>> some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
>>> of smartphone manufacturing, it is impossible to retrieve a better name
>>> for this panel.
>>>
>>> This revision adds support for the default 60 Hz configuration, however
>>> there could possibly be some room for expansion, as the display panels
>>> used on Sony devices have historically been capable of >2x refresh rate
>>> overclocking.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> ---
>> Gentle bump
>>
>> Konrad
> Yet another one.
> 
> Konrad
Hello? Anybody there? It's been quite a while..

Konrad
>>> Changes since v2:
>>> - "GPL v2" -> "GPL"
>>> - add missing S-o-b (how embarassing)
>>> - move { after sony_td4353_assert_reset_gpios() to a new line
>>>
>>>   drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>>   drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 329 ++++++++++++++++++
>>>   3 files changed, 340 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
>>>
>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>> index a582ddd583c2..6ef1b48169b5 100644
>>> --- a/drivers/gpu/drm/panel/Kconfig
>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>> @@ -637,6 +637,16 @@ config DRM_PANEL_SONY_ACX565AKM
>>>         Say Y here if you want to enable support for the Sony ACX565AKM
>>>         800x600 3.5" panel (found on the Nokia N900).
>>>   +config DRM_PANEL_SONY_TD4353_JDI
>>> +    tristate "Sony TD4353 JDI panel"
>>> +    depends on GPIOLIB && OF
>>> +    depends on DRM_MIPI_DSI
>>> +    depends on BACKLIGHT_CLASS_DEVICE
>>> +    help
>>> +      Say Y here if you want to enable support for the Sony Tama
>>> +      TD4353 JDI command mode panel as found on some Sony Xperia
>>> +      XZ2 and XZ2 Compact smartphones.
>>> +
>>>   config DRM_PANEL_SONY_TULIP_TRULY_NT35521
>>>       tristate "Sony Tulip Truly NT35521 panel"
>>>       depends on GPIOLIB && OF
>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>>> index 8e71aa7581b8..8ef27bc86f94 100644
>>> --- a/drivers/gpu/drm/panel/Makefile
>>> +++ b/drivers/gpu/drm/panel/Makefile
>>> @@ -64,6 +64,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>>>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>>>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
>>>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>>> +obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
>>>   obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
>>>   obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
>>>   obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>>> diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
>>> new file mode 100644
>>> index 000000000000..11db62992b8b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
>>> @@ -0,0 +1,329 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@somainline.org>
>>> + *
>>> + * Generated with linux-mdss-dsi-panel-driver-generator with a
>>> + * substantial amount of manual adjustments.
>>> + *
>>> + * SONY Downstream kernel calls this one:
>>> + * - "JDI ID3" for Akari  (XZ2)
>>> + * - "JDI ID4" for Apollo (XZ2 Compact)
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/regulator/consumer.h>
>>> +
>>> +#include <video/mipi_display.h>
>>> +
>>> +#include <drm/drm_mipi_dsi.h>
>>> +#include <drm/drm_modes.h>
>>> +#include <drm/drm_panel.h>
>>> +
>>> +enum {
>>> +    TYPE_TAMA_60HZ,
>>> +    /*
>>> +     * Leaving room for expansion - SONY very often uses
>>> +     * *truly reliably* overclockable panels on their flagships!
>>> +     */
>>> +};
>>> +
>>> +struct sony_td4353_jdi {
>>> +    struct drm_panel panel;
>>> +    struct mipi_dsi_device *dsi;
>>> +    struct regulator_bulk_data supplies[3];
>>> +    struct gpio_desc *panel_reset_gpio;
>>> +    struct gpio_desc *touch_reset_gpio;
>>> +    bool prepared;
>>> +    int type;
>>> +};
>>> +
>>> +static inline struct sony_td4353_jdi *to_sony_td4353_jdi(struct drm_panel *panel)
>>> +{
>>> +    return container_of(panel, struct sony_td4353_jdi, panel);
>>> +}
>>> +
>>> +static int sony_td4353_jdi_on(struct sony_td4353_jdi *ctx)
>>> +{
>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>> +    struct device *dev = &dsi->dev;
>>> +    int ret;
>>> +
>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>> +
>>> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set column address: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x086f);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set page address: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x0000);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set tear scanline: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
>>> +
>>> +    ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set pixel format: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS,
>>> +              0x00, 0x00, 0x08, 0x6f);
>>> +
>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    msleep(70);
>>> +
>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
>>> +
>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int sony_td4353_jdi_off(struct sony_td4353_jdi *ctx)
>>> +{
>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>> +    struct device *dev = &dsi->dev;
>>> +    int ret;
>>> +
>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>> +
>>> +    ret = mipi_dsi_dcs_set_display_off(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set display off: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    msleep(22);
>>> +
>>> +    ret = mipi_dsi_dcs_set_tear_off(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to set tear off: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    msleep(80);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void sony_td4353_assert_reset_gpios(struct sony_td4353_jdi *ctx, int mode)
>>> +{
>>> +    gpiod_set_value_cansleep(ctx->touch_reset_gpio, mode);
>>> +    gpiod_set_value_cansleep(ctx->panel_reset_gpio, mode);
>>> +    usleep_range(5000, 5100);
>>> +}
>>> +
>>> +static int sony_td4353_jdi_prepare(struct drm_panel *panel)
>>> +{
>>> +    struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
>>> +    struct device *dev = &ctx->dsi->dev;
>>> +    int ret;
>>> +
>>> +    if (ctx->prepared)
>>> +        return 0;
>>> +
>>> +    ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to enable regulators: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    msleep(100);
>>> +
>>> +    sony_td4353_assert_reset_gpios(ctx, 1);
>>> +
>>> +    ret = sony_td4353_jdi_on(ctx);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to power on panel: %d\n", ret);
>>> +        sony_td4353_assert_reset_gpios(ctx, 0);
>>> +        regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ctx->prepared = true;
>>> +    return 0;
>>> +}
>>> +
>>> +static int sony_td4353_jdi_unprepare(struct drm_panel *panel)
>>> +{
>>> +    struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
>>> +    struct device *dev = &ctx->dsi->dev;
>>> +    int ret;
>>> +
>>> +    if (!ctx->prepared)
>>> +        return 0;
>>> +
>>> +    ret = sony_td4353_jdi_off(ctx);
>>> +    if (ret < 0)
>>> +        dev_err(dev, "Failed to power off panel: %d\n", ret);
>>> +
>>> +    sony_td4353_assert_reset_gpios(ctx, 0);
>>> +    regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>> +
>>> +    ctx->prepared = false;
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct drm_display_mode sony_td4353_jdi_mode_tama_60hz = {
>>> +    .clock = (1080 + 4 + 8 + 8) * (2160 + 259 + 8 + 8) * 60 / 1000,
>>> +    .hdisplay = 1080,
>>> +    .hsync_start = 1080 + 4,
>>> +    .hsync_end = 1080 + 4 + 8,
>>> +    .htotal = 1080 + 4 + 8 + 8,
>>> +    .vdisplay = 2160,
>>> +    .vsync_start = 2160 + 259,
>>> +    .vsync_end = 2160 + 259 + 8,
>>> +    .vtotal = 2160 + 259 + 8 + 8,
>>> +    .width_mm = 64,
>>> +    .height_mm = 128,
>>> +};
>>> +
>>> +static int sony_td4353_jdi_get_modes(struct drm_panel *panel,
>>> +                   struct drm_connector *connector)
>>> +{
>>> +    struct sony_td4353_jdi *ctx = to_sony_td4353_jdi(panel);
>>> +    struct drm_display_mode *mode = NULL;
>>> +
>>> +    if (ctx->type == TYPE_TAMA_60HZ)
>>> +        mode = drm_mode_duplicate(connector->dev, &sony_td4353_jdi_mode_tama_60hz);
>>> +    else
>>> +        return -EINVAL;
>>> +
>>> +    if (!mode)
>>> +        return -ENOMEM;
>>> +
>>> +    drm_mode_set_name(mode);
>>> +
>>> +    mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>> +    connector->display_info.width_mm = mode->width_mm;
>>> +    connector->display_info.height_mm = mode->height_mm;
>>> +    drm_mode_probed_add(connector, mode);
>>> +
>>> +    return 1;
>>> +}
>>> +
>>> +static const struct drm_panel_funcs sony_td4353_jdi_panel_funcs = {
>>> +    .prepare = sony_td4353_jdi_prepare,
>>> +    .unprepare = sony_td4353_jdi_unprepare,
>>> +    .get_modes = sony_td4353_jdi_get_modes,
>>> +};
>>> +
>>> +static int sony_td4353_jdi_probe(struct mipi_dsi_device *dsi)
>>> +{
>>> +    struct device *dev = &dsi->dev;
>>> +    struct sony_td4353_jdi *ctx;
>>> +    int ret;
>>> +
>>> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>> +    if (!ctx)
>>> +        return -ENOMEM;
>>> +
>>> +    ctx->type = (uintptr_t)of_device_get_match_data(dev);
>>> +
>>> +    ctx->supplies[0].supply = "vddio";
>>> +    ctx->supplies[1].supply = "vsp";
>>> +    ctx->supplies[2].supply = "vsn";
>>> +    ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
>>> +                      ctx->supplies);
>>> +    if (ret < 0)
>>> +        return dev_err_probe(dev, ret, "Failed to get regulators\n");
>>> +
>>> +    ctx->panel_reset_gpio = devm_gpiod_get(dev, "panel-reset", GPIOD_ASIS);
>>> +    if (IS_ERR(ctx->panel_reset_gpio))
>>> +        return dev_err_probe(dev, PTR_ERR(ctx->panel_reset_gpio),
>>> +                     "Failed to get panel-reset-gpios\n");
>>> +
>>> +    ctx->touch_reset_gpio = devm_gpiod_get(dev, "touch-reset", GPIOD_ASIS);
>>> +    if (IS_ERR(ctx->touch_reset_gpio))
>>> +        return dev_err_probe(dev, PTR_ERR(ctx->touch_reset_gpio),
>>> +                     "Failed to get touch-reset-gpios\n");
>>> +
>>> +    ctx->dsi = dsi;
>>> +    mipi_dsi_set_drvdata(dsi, ctx);
>>> +
>>> +    dsi->lanes = 4;
>>> +    dsi->format = MIPI_DSI_FMT_RGB888;
>>> +    dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>> +
>>> +    drm_panel_init(&ctx->panel, dev, &sony_td4353_jdi_panel_funcs,
>>> +               DRM_MODE_CONNECTOR_DSI);
>>> +
>>> +    ret = drm_panel_of_backlight(&ctx->panel);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "Failed to get backlight\n");
>>> +
>>> +    drm_panel_add(&ctx->panel);
>>> +
>>> +    ret = mipi_dsi_attach(dsi);
>>> +    if (ret < 0) {
>>> +        dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>>> +        drm_panel_remove(&ctx->panel);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void sony_td4353_jdi_remove(struct mipi_dsi_device *dsi)
>>> +{
>>> +    struct sony_td4353_jdi *ctx = mipi_dsi_get_drvdata(dsi);
>>> +    int ret;
>>> +
>>> +    ret = mipi_dsi_detach(dsi);
>>> +    if (ret < 0)
>>> +        dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>>> +
>>> +    drm_panel_remove(&ctx->panel);
>>> +}
>>> +
>>> +static const struct of_device_id sony_td4353_jdi_of_match[] = {
>>> +    { .compatible = "sony,td4353-jdi-tama", .data = (void *)TYPE_TAMA_60HZ },
>>> +    { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, sony_td4353_jdi_of_match);
>>> +
>>> +static struct mipi_dsi_driver sony_td4353_jdi_driver = {
>>> +    .probe = sony_td4353_jdi_probe,
>>> +    .remove = sony_td4353_jdi_remove,
>>> +    .driver = {
>>> +        .name = "panel-sony-td4353-jdi",
>>> +        .of_match_table = sony_td4353_jdi_of_match,
>>> +    },
>>> +};
>>> +module_mipi_dsi_driver(sony_td4353_jdi_driver);
>>> +
>>> +MODULE_AUTHOR("Konrad Dybcio <konrad.dybcio@somainline.org>");
>>> +MODULE_DESCRIPTION("DRM panel driver for SONY Xperia XZ2/XZ2c JDI panel");
>>> +MODULE_LICENSE("GPL");
