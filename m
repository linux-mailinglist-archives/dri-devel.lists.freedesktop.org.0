Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB841C2C8F
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 14:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C76E1B4;
	Sun,  3 May 2020 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E466E0DE
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 10:09:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t12so9207036edw.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 May 2020 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yBAdidlq9v0UPAagbjNIpjiepAaLmvYHIKE5up4yFGY=;
 b=NxtG9FYQw5KsKJDNIcoBcQKjknhtkhCSHak9b/9O3NzzcjVt7o8cQnC/iOP32gVM5Q
 1RONzYX/s59gcwfxlTSRGz0DQilpncIkZX6WiussKB6qP0gEwQz9ZkBmUWdLdsBDEI31
 MBpHJnOWRk5xkWScjwBGljltrmfaeC0+4E+aLHAtv72pq8UUJfjNNkWSXCC4m9HJyBjh
 jyS9PLRUxH+2nCdYTYNSDC4F29miPCDq6sjigJBFvFF6zK8nVBxsicwXbWv+5dDcRo2v
 ptrvoAHt0CjVp8vI24kOTBnoQ5JcMkHLZrOoga0vKZorO18lEXPVYyamJheiXBiSUIp9
 Rb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yBAdidlq9v0UPAagbjNIpjiepAaLmvYHIKE5up4yFGY=;
 b=R/4pF+4ra4OFNKFFkB5SyH5zLVU+qRBt65RSJF0svXjfp+28nPSkqvnk3SSQPkilda
 zb1ZD8Cb+76IaEChIICUZ2SrXjWoW1LFBcgldUobF9hDA0dO8RhoBHZP1/DsNbeAh4W4
 MaVLJGc75x6ZD0niUziQuHUMMFY55T2KpunmkS9PWF7htqvWAONI4ffzzDPgDx1vGvjt
 YpF4UWl2t4V97lYadKOnfZ2LwWRQ/oMnuCdCqxCB/clf8vSuwQAuU/BWF3vh8KYeWKhu
 yOVB0PlWWqKU1acK50B3/5D4ADUZz+K5Lc4p0X2cxQboq/D+0+eBGIV7CN1wYf0nuEKZ
 ladQ==
X-Gm-Message-State: AGi0PuaA0C5CCJv/IfdW2mIUjeg05ra0UVkR3rgrf2cD+b9yYYKHaZef
 J92FgWOH8vavRPvArja7xs+7+EX7eBwjpVy8/WuRxQ==
X-Google-Smtp-Source: APiQypIpBpmuBk2snTwwMKTU30yIpEtQjl6nRZmO9rQKhBPPI8LJuj2FPzzVqLNlwSNeyltecXc7rCdiS1RHOSCK4GA=
X-Received: by 2002:a50:bb6b:: with SMTP id y98mr6698447ede.296.1588414198250; 
 Sat, 02 May 2020 03:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200501204825.146424-1-konradybcio@gmail.com>
 <20200501204825.146424-2-konradybcio@gmail.com>
 <20200502070531.GA11754@ravnborg.org>
In-Reply-To: <20200502070531.GA11754@ravnborg.org>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Sat, 2 May 2020 12:09:45 +0200
Message-ID: <CAMS8qEU7kX8Ts=hJkNNdgV_eOGXv3qG6iDWgjHRNXq3f7qoRuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: drm: panel: Add TM5P5 NT35596 panel driver
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Sun, 03 May 2020 12:54:36 +0000
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: multipart/mixed; boundary="===============1023590858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1023590858==
Content-Type: multipart/alternative; boundary="0000000000000afea805a4a780bb"

--0000000000000afea805a4a780bb
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your review. I'll send a v2 soon, however we need to solve the
compat string issue first.

How should I document tm5p5? I think it's rather some kind of a model no.
along with the nt35596 IC than a vendor name.. Or should we call it
something like "unknown,tm5p5-nt35596", perhaps "asus,z00t-tm5p5-n35596"
[1]?

[1] Z00T is the model number of the smartphone that uses this panel

Konrad

On Sat, May 2, 2020, 09:05 Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Konrad.
>
> On Fri, May 01, 2020 at 10:48:22PM +0200, Konrad Dybcio wrote:
> > This adds support for TMP5P5 NT35596 1080x1920 video
> > mode panel that can be found on some Asus Zenfone 2
> > Laser (Z00T) devices.
>
> Very well-writen driver. Only a few small things in the following.
>
>         Sam
>
> >
> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig               |   9 +
> >  drivers/gpu/drm/panel/Makefile              |   1 +
> >  drivers/gpu/drm/panel/panel-tm5p5-nt35596.c | 366 ++++++++++++++++++++
> >  3 files changed, 376 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig
> b/drivers/gpu/drm/panel/Kconfig
> > index a1723c1b5fbf8..6ff892334ac4b 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -401,6 +401,15 @@ config DRM_PANEL_SONY_ACX565AKM
> >         Say Y here if you want to enable support for the Sony ACX565AKM
> >         800x600 3.5" panel (found on the Nokia N900).
> >
> > +config DRM_PANEL_TM5P5_NT35596
> > +     tristate "TM5P5 NT35596 panel"
> > +     depends on GPIOLIB && OF
> > +     depends on DRM_MIPI_DSI
> > +     help
> > +       Say Y here if you want to enable support for the TMP5P5
> > +       NT35596 1080x1920 video mode panel as found in some Asus
> > +       Zenfone 2 Laser Z00T devices.
> > +
> >  config DRM_PANEL_TPO_TD028TTEC1
> >       tristate "Toppoly (TPO) TD028TTEC1 panel driver"
> >       depends on OF && SPI
> > diff --git a/drivers/gpu/drm/panel/Makefile
> b/drivers/gpu/drm/panel/Makefile
> > index 96a883cd66305..4fc7e00b18502 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) +=
> panel-sitronix-st7701.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> > +obj-$(CONFIG_DRM_PANEL_TM5P5_NT35596) += panel-tm5p5-nt35596.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> > diff --git a/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> > new file mode 100644
> > index 0000000000000..c361ab76812b8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> > @@ -0,0 +1,366 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +
> > +struct tm5p5_nt35596 {
> > +     struct drm_panel panel;
> > +     struct mipi_dsi_device *dsi;
> > +     struct regulator_bulk_data supplies[2];
> > +     struct gpio_desc *reset_gpio;
> > +     bool prepared;
> > +};
> > +
> > +static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel
> *panel)
> > +{
> > +     return container_of(panel, struct tm5p5_nt35596, panel);
> > +}
> > +
> > +#define dsi_generic_write_seq(dsi, seq...) do {
>       \
> > +             static const u8 d[] = { seq };                          \
> > +             int ret;                                                \
> > +             ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));    \
> > +             if (ret < 0)                                            \
> > +                     return ret;                                     \
> > +     } while (0)
> > +
> > +#define dsi_dcs_write_seq(dsi, seq...) do {                          \
> > +             static const u8 d[] = { seq };                          \
> > +             int ret;                                                \
> > +             ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> > +             if (ret < 0)                                            \
> > +                     return ret;                                     \
> > +     } while (0)
> > +
> > +static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
> > +{
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     usleep_range(1000, 2000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     usleep_range(1000, 2000);
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +     usleep_range(15000, 16000);
> > +}
> > +
> > +static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
> > +{
> > +     struct mipi_dsi_device *dsi = ctx->dsi;
>
> Do you have any idea of what happens in the following?
> I recall 0xff is explained in a few other drivers for example.
>
> If you get an idea it would be nice with a few headlines.
> > +
> > +     dsi_generic_write_seq(dsi, 0xff, 0x05);
> > +     dsi_generic_write_seq(dsi, 0xfb, 0x01);
> > +     dsi_generic_write_seq(dsi, 0xc5, 0x31);
> > +     dsi_generic_write_seq(dsi, 0xff, 0x04);
> > +     dsi_generic_write_seq(dsi, 0x01, 0x84);
> > +     dsi_generic_write_seq(dsi, 0x05, 0x25);
> > +     dsi_generic_write_seq(dsi, 0x06, 0x01);
> > +     dsi_generic_write_seq(dsi, 0x07, 0x20);
> > +     dsi_generic_write_seq(dsi, 0x08, 0x06);
> > +     dsi_generic_write_seq(dsi, 0x09, 0x08);
> > +     dsi_generic_write_seq(dsi, 0x0a, 0x10);
> > +     dsi_generic_write_seq(dsi, 0x0b, 0x10);
> > +     dsi_generic_write_seq(dsi, 0x0c, 0x10);
> > +     dsi_generic_write_seq(dsi, 0x0d, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x0e, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x0f, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x10, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x11, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x12, 0x14);
> > +     dsi_generic_write_seq(dsi, 0x17, 0xf3);
> > +     dsi_generic_write_seq(dsi, 0x18, 0xc0);
> > +     dsi_generic_write_seq(dsi, 0x19, 0xc0);
> > +     dsi_generic_write_seq(dsi, 0x1a, 0xc0);
> > +     dsi_generic_write_seq(dsi, 0x1b, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0x1c, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0x1d, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0x1e, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0x1f, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0x20, 0xb3);
> > +     dsi_generic_write_seq(dsi, 0xfb, 0x01);
> > +     dsi_generic_write_seq(dsi, 0xff, 0x00);
> > +     dsi_generic_write_seq(dsi, 0xfb, 0x01);
> > +     dsi_generic_write_seq(dsi, 0x35, 0x01);
> > +     dsi_generic_write_seq(dsi, 0xd3, 0x06);
> > +     dsi_generic_write_seq(dsi, 0xd4, 0x04);
> > +     dsi_generic_write_seq(dsi, 0x5e, 0x0d);
> > +     dsi_generic_write_seq(dsi, 0x11, 0x00);
> > +     msleep(100);
> > +     dsi_generic_write_seq(dsi, 0x29, 0x00);
> > +     dsi_generic_write_seq(dsi, 0x53, 0x24);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
> > +{
> > +     struct mipi_dsi_device *dsi = ctx->dsi;
> > +     struct device *dev = &dsi->dev;
> > +     int ret;
> > +
> > +     ret = mipi_dsi_dcs_set_display_off(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set display off: %d\n", ret);
> > +             return ret;
> > +     }
> > +     msleep(60);
> > +
> > +     ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> > +             return ret;
> > +     }
>
> I wonder why the panel do not need a:
> mipi_dsi_dcs_exit_sleep_mode()
> and
> mipi_dsi_dcs_set_display_on()
>
> in the tm5p5_nt35596_on() function.
>
> Usually the prepare and unprepare steps are
> somehow symmetrical.
>
> > +
> > +     dsi_dcs_write_seq(dsi, 0x4f, 0x01);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tm5p5_nt35596_prepare(struct drm_panel *panel)
> > +{
> > +     struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> > +     struct device *dev = &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     if (ctx->prepared)
> > +             return 0;
> > +
> > +     ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
> ctx->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     tm5p5_nt35596_reset(ctx);
> > +
> > +     ret = tm5p5_nt35596_on(ctx);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > +             gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +             regulator_bulk_disable(ARRAY_SIZE(ctx->supplies),
> ctx->supplies);
> Line too long.
>
> > +             return ret;
> > +     }
> > +
> > +     ctx->prepared = true;
> > +     return 0;
> > +}
> > +
> > +static int tm5p5_nt35596_unprepare(struct drm_panel *panel)
> > +{
> > +     struct tm5p5_nt35596 *ctx = to_tm5p5_nt35596(panel);
> > +     struct device *dev = &ctx->dsi->dev;
> > +     int ret;
> > +
> > +     if (!ctx->prepared)
> > +             return 0;
> > +
> > +     ret = tm5p5_nt35596_off(ctx);
> > +     if (ret < 0)
> > +             dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> > +
> > +     gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > +     regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > +
> > +     ctx->prepared = false;
> > +     return 0;
> > +}
> > +
> > +static const struct drm_display_mode tm5p5_nt35596_mode = {
> > +     .clock = (1080 + 100 + 8 + 16) * (1920 + 4 + 2 + 4) * 60 / 1000,
> > +     .hdisplay = 1080,
> > +     .hsync_start = 1080 + 100,
> > +     .hsync_end = 1080 + 100 + 8,
> > +     .htotal = 1080 + 100 + 8 + 16,
> > +     .vdisplay = 1920,
> > +     .vsync_start = 1920 + 4,
> > +     .vsync_end = 1920 + 4 + 2,
> > +     .vtotal = 1920 + 4 + 2 + 4,
> > +     .vrefresh = 60,
> > +     .width_mm = 68,
> > +     .height_mm = 121,
> > +};
> We have patches pending to remove vrefresh, which I thought
> was already applied. Anyway, keep it here.
> We will eaither remove it later or if the patches crosses
> I will do it when applying this patch.
>
> > +
> > +static int tm5p5_nt35596_get_modes(struct drm_panel *panel,
> > +                                struct drm_connector *connector)
> > +{
> > +     struct drm_display_mode *mode;
> > +
> > +     mode = drm_mode_duplicate(connector->dev, &tm5p5_nt35596_mode);
> > +     if (!mode)
> > +             return -ENOMEM;
> > +
> > +     drm_mode_set_name(mode);
> > +
> > +     mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> > +     connector->display_info.width_mm = mode->width_mm;
> > +     connector->display_info.height_mm = mode->height_mm;
> > +     drm_mode_probed_add(connector, mode);
> > +
> > +     return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
> > +     .prepare = tm5p5_nt35596_prepare,
> > +     .unprepare = tm5p5_nt35596_unprepare,
> > +     .get_modes = tm5p5_nt35596_get_modes,
> > +};
> > +
> > +static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi = bl_get_data(bl);
> > +     u16 brightness = bl->props.brightness;
> > +     int ret;
> > +
> > +     if (bl->props.power != FB_BLANK_UNBLANK ||
> > +         bl->props.fb_blank != FB_BLANK_UNBLANK ||
> > +         bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> > +             brightness = 0;
> > +
> > +     dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > +
> > +     return 0;
> > +}
> > +
> > +// TODO: Check if /sys/class/backlight/.../actual_brightness actually
> returns
> > +// correct values. If not, remove this function.
> Please resolve this TODO
>
> > +static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi = bl_get_data(bl);
> > +     u16 brightness = bl->props.brightness;
> > +     int ret;
> > +
> > +     dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> > +
> > +     ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> > +
> > +     return brightness & 0xff;
> > +}
> > +
> > +static const struct backlight_ops tm5p5_nt35596_bl_ops = {
> > +     .update_status = tm5p5_nt35596_bl_update_status,
> > +     .get_brightness = tm5p5_nt35596_bl_get_brightness,
> > +};
> > +
> > +static struct backlight_device *
> > +tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev = &dsi->dev;
> > +     struct backlight_properties props = {
> > +             .type = BACKLIGHT_RAW,
> > +             .brightness = 255,
> > +             .max_brightness = 255,
> > +     };
> Make props const.
>
> > +
> > +     return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> > +                                           &tm5p5_nt35596_bl_ops,
> &props);
> > +}
> > +
> > +static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev = &dsi->dev;
> > +     struct tm5p5_nt35596 *ctx;
> > +     int ret;
> > +
> > +     ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +     if (!ctx)
> > +             return -ENOMEM;
> > +
> > +     ctx->supplies[0].supply = "vdd";
> > +     ctx->supplies[1].supply = "vddio";
> > +     ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> > +                                   ctx->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to get regulators: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +     if (IS_ERR(ctx->reset_gpio)) {
> > +             ret = PTR_ERR(ctx->reset_gpio);
> > +             dev_err(dev, "Failed to get reset-gpios: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ctx->dsi = dsi;
> > +     mipi_dsi_set_drvdata(dsi, ctx);
> > +
> > +     dsi->lanes = 4;
> > +     dsi->format = MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +                       MIPI_DSI_MODE_VIDEO_HSE |
> MIPI_DSI_MODE_EOT_PACKET |
> > +                       MIPI_DSI_CLOCK_NON_CONTINUOUS |
> MIPI_DSI_MODE_LPM;
> > +
> > +     drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +
> > +     ctx->panel.backlight = tm5p5_nt35596_create_backlight(dsi);
> > +     if (IS_ERR(ctx->panel.backlight)) {
> > +             ret = PTR_ERR(ctx->panel.backlight);
> > +             dev_err(dev, "Failed to create backlight: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = drm_panel_add(&ctx->panel);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to add panel: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = mipi_dsi_attach(dsi);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int tm5p5_nt35596_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct tm5p5_nt35596 *ctx = mipi_dsi_get_drvdata(dsi);
> > +     int ret;
> > +
> > +     ret = mipi_dsi_detach(dsi);
> > +     if (ret < 0)
> > +             dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n",
> ret);
> Line too long I think
>
> > +
> > +     drm_panel_remove(&ctx->panel);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id tm5p5_nt35596_of_match[] = {
> > +     { .compatible = "tm5p5,nt35596" },
> vendor tm5p5 is not documented.
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, tm5p5_nt35596_of_match);
> > +
> > +static struct mipi_dsi_driver tm5p5_nt35596_driver = {
> > +     .probe = tm5p5_nt35596_probe,
> > +     .remove = tm5p5_nt35596_remove,
> > +     .driver = {
> > +             .name = "panel-tm5p5-nt35596",
> > +             .of_match_table = tm5p5_nt35596_of_match,
> > +     },
> > +};
> > +module_mipi_dsi_driver(tm5p5_nt35596_driver);
> > +
> > +MODULE_AUTHOR("Konrad Dybcio <konradybcio@gmail.com>");
> > +MODULE_DESCRIPTION("DRM driver for tm5p5 nt35596 1080p video mode dsi
> panel");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.26.1
>

--0000000000000afea805a4a780bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks f=
or your review. I&#39;ll send a v2 soon, however we need to solve the compa=
t string issue first.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ho=
w should I document tm5p5? I think it&#39;s rather some kind of a model no.=
 along with the nt35596 IC than a vendor name.. Or should we call it someth=
ing like &quot;unknown,tm5p5-nt35596&quot;, perhaps &quot;asus,z00t-tm5p5-n=
35596&quot; [1]?</div><div dir=3D"auto"><br></div><div dir=3D"auto">[1] Z<s=
pan style=3D"font-family:sans-serif">00T is the model number of the smartph=
one that uses this panel</span></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Konrad</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, May 2, 2020, 09:05 Sam Ravnborg &lt;<a href=
=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Konrad.<br>
<br>
On Fri, May 01, 2020 at 10:48:22PM +0200, Konrad Dybcio wrote:<br>
&gt; This adds support for TMP5P5 NT35596 1080x1920 video<br>
&gt; mode panel that can be found on some Asus Zenfone 2<br>
&gt; Laser (Z00T) devices.<br>
<br>
Very well-writen driver. Only a few small things in the following.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
&gt; <br>
&gt; Signed-off-by: Konrad Dybcio &lt;<a href=3D"mailto:konradybcio@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">konradybcio@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c | 366 ++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 376 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c<b=
r>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kco=
nfig<br>
&gt; index a1723c1b5fbf8..6ff892334ac4b 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/panel/Kconfig<br>
&gt; @@ -401,6 +401,15 @@ config DRM_PANEL_SONY_ACX565AKM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable supp=
ort for the Sony ACX565AKM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0800x600 3.5&quot; panel (found on the=
 Nokia N900).<br>
&gt;=C2=A0 <br>
&gt; +config DRM_PANEL_TM5P5_NT35596<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;TM5P5 NT35596 panel&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on GPIOLIB &amp;&amp; OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable support f=
or the TMP5P5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NT35596 1080x1920 video mode panel as foun=
d in some Asus<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Zenfone 2 Laser Z00T devices.<br>
&gt; +<br>
&gt;=C2=A0 config DRM_PANEL_TPO_TD028TTEC1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Toppoly (TPO) TD028TTEC1 pane=
l driver&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF &amp;&amp; SPI<br>
&gt; diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Ma=
kefile<br>
&gt; index 96a883cd66305..4fc7e00b18502 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Makefile<br>
&gt; +++ b/drivers/gpu/drm/panel/Makefile<br>
&gt; @@ -42,6 +42,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) +=3D panel-s=
itronix-st7701.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7=
789v.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) +=3D panel-sony-acx424akp=
.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) +=3D panel-sony-acx565akm=
.o<br>
&gt; +obj-$(CONFIG_DRM_PANEL_TM5P5_NT35596) +=3D panel-tm5p5-nt35596.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) +=3D panel-tpo-td028ttec1=
.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) +=3D panel-tpo-td043mtea1=
.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) +=3D panel-tpo-tpg110.o<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c b/drivers/gpu=
/drm/panel/panel-tm5p5-nt35596.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000..c361ab76812b8<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-tm5p5-nt35596.c<br>
&gt; @@ -0,0 +1,366 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-only<br>
&gt; +<br>
&gt; +#include &lt;linux/backlight.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/regulator/consumer.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_mipi_dsi.h&gt;<br>
&gt; +#include &lt;drm/drm_modes.h&gt;<br>
&gt; +#include &lt;drm/drm_panel.h&gt;<br>
&gt; +<br>
&gt; +struct tm5p5_nt35596 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel panel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator_bulk_data supplies[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *reset_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool prepared;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel=
 *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(panel, struct tm5p5_nt35596, =
panel);<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define dsi_generic_write_seq(dsi, seq...) do {=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const u8 d[] =
=3D { seq };=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, d, ARRAY_SIZE(d));=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt; +<br>
&gt; +#define dsi_dcs_write_seq(dsi, seq...) do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const u8 d[] =
=3D { seq };=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
write_buffer(dsi, d, ARRAY_SIZE(d)); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} while (0)<br>
&gt; +<br>
&gt; +static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 1);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 0);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 1);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(15000, 16000);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D ctx-&gt;dsi;<br>
<br>
Do you have any idea of what happens in the following?<br>
I recall 0xff is explained in a few other drivers for example.<br>
<br>
If you get an idea it would be nice with a few headlines.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xff, 0x05);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xfb, 0x01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xc5, 0x31);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xff, 0x04);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x01, 0x84);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x05, 0x25);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x06, 0x01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x07, 0x20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x08, 0x06);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x09, 0x08);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0a, 0x10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0b, 0x10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0c, 0x10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0d, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0e, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x0f, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x10, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x11, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x12, 0x14);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x17, 0xf3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x18, 0xc0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x19, 0xc0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1a, 0xc0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1b, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1c, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1d, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1e, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x1f, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x20, 0xb3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xfb, 0x01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xff, 0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xfb, 0x01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x35, 0x01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xd3, 0x06);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0xd4, 0x04);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x5e, 0x0d);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x11, 0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x29, 0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_generic_write_seq(dsi, 0x53, 0x24);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D ctx-&gt;dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_display_off(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to set display off: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(60);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to enter sleep mode: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
I wonder why the panel do not need a:<br>
mipi_dsi_dcs_exit_sleep_mode()<br>
and<br>
mipi_dsi_dcs_set_display_on()<br>
<br>
in the tm5p5_nt35596_on() function.<br>
<br>
Usually the prepare and unprepare steps are<br>
somehow symmetrical.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi_dcs_write_seq(dsi, 0x4f, 0x01);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_prepare(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tm5p5_nt35596 *ctx =3D to_tm5p5_nt35596(pa=
nel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;ctx-&gt;dsi-&gt;dev;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;prepared)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx-&gt;=
supplies), ctx-&gt;supplies);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to enable regulators: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tm5p5_nt35596_reset(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D tm5p5_nt35596_on(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to initialize panel: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansl=
eep(ctx-&gt;reset_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_bulk_disabl=
e(ARRAY_SIZE(ctx-&gt;supplies), ctx-&gt;supplies);<br>
Line too long.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;prepared =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_unprepare(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tm5p5_nt35596 *ctx =3D to_tm5p5_nt35596(pa=
nel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;ctx-&gt;dsi-&gt;dev;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;prepared)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D tm5p5_nt35596_off(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to un-initialize panel: %d\n&quot;, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 0);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0regulator_bulk_disable(ARRAY_SIZE(ctx-&gt;supplie=
s), ctx-&gt;supplies);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;prepared =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_display_mode tm5p5_nt35596_mode =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.clock =3D (1080 + 100 + 8 + 16) * (1920 + 4 + 2 =
+ 4) * 60 / 1000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hdisplay =3D 1080,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_start =3D 1080 + 100,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hsync_end =3D 1080 + 100 + 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.htotal =3D 1080 + 100 + 8 + 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vdisplay =3D 1920,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_start =3D 1920 + 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vsync_end =3D 1920 + 4 + 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vtotal =3D 1920 + 4 + 2 + 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.vrefresh =3D 60,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.width_mm =3D 68,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.height_mm =3D 121,<br>
&gt; +};<br>
We have patches pending to remove vrefresh, which I thought<br>
was already applied. Anyway, keep it here.<br>
We will eaither remove it later or if the patches crosses<br>
I will do it when applying this patch.<br>
<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_get_modes(struct drm_panel *panel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_connector *connector)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode =3D drm_mode_duplicate(connector-&gt;dev, &a=
mp;tm5p5_nt35596_mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_set_name(mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mode-&gt;type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE=
_TYPE_PREFERRED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0connector-&gt;display_info.width_mm =3D mode-&gt;=
width_mm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0connector-&gt;display_info.height_mm =3D mode-&gt=
;height_mm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_probed_add(connector, mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0.prepare =3D tm5p5_nt35596_prepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unprepare =3D tm5p5_nt35596_unprepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_modes =3D tm5p5_nt35596_get_modes,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D bl_get_data(bl);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 brightness =3D bl-&gt;props.brightness;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (bl-&gt;props.power !=3D FB_BLANK_UNBLANK ||<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bl-&gt;props.fb_blank !=3D FB_BLANK=
_UNBLANK ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bl-&gt;props.state &amp; (BL_CORE_S=
USPENDED | BL_CORE_FBBLANK))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0brightness =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags &amp;=3D ~MIPI_DSI_MODE_LPM;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_display_brightness(dsi, =
brightness);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE_LPM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +// TODO: Check if /sys/class/backlight/.../actual_brightness actually=
 returns<br>
&gt; +// correct values. If not, remove this function.<br>
Please resolve this TODO<br>
<br>
&gt; +static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *b=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D bl_get_data(bl);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 brightness =3D bl-&gt;props.brightness;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags &amp;=3D ~MIPI_DSI_MODE_LPM;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_get_display_brightness(dsi, =
&amp;brightness);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE_LPM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return brightness &amp; 0xff;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct backlight_ops tm5p5_nt35596_bl_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.update_status =3D tm5p5_nt35596_bl_update_status=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_brightness =3D tm5p5_nt35596_bl_get_brightne=
ss,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct backlight_device *<br>
&gt; +tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct backlight_properties props =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D BACKLIGHT_R=
AW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.brightness =3D 255,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_brightness =3D 2=
55,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
Make props const.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return devm_backlight_device_register(dev, dev_na=
me(dev), dev, dsi,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;tm5p5_nt35596_bl_ops, &amp;props);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tm5p5_nt35596 *ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNE=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;supplies[0].supply =3D &quot;vdd&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;supplies[1].supply =3D &quot;vddio&quot;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(c=
tx-&gt;supplies),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;supplies);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to get regulators: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_gpio =3D devm_gpiod_get(dev, &quot;=
reset&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(ctx-&=
gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to get reset-gpios: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;dsi =3D dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_set_drvdata(dsi, ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;lanes =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;format =3D MIPI_DSI_FMT_RGB888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI=
_DSI_MODE_VIDEO_BURST |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_EOT_PACKET |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_init(&amp;ctx-&gt;panel, dev, &amp;tm5p=
5_nt35596_panel_funcs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 DRM_MODE_CONNECTOR_DSI);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;panel.backlight =3D tm5p5_nt35596_create_=
backlight(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ctx-&gt;panel.backlight)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(ctx-&=
gt;panel.backlight);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to create backlight: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_panel_add(&amp;ctx-&gt;panel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to add panel: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_attach(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Fa=
iled to attach to DSI host: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int tm5p5_nt35596_remove(struct mipi_dsi_device *dsi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tm5p5_nt35596 *ctx =3D mipi_dsi_get_drvdat=
a(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_detach(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;dsi-&gt;=
dev, &quot;Failed to detach from DSI host: %d\n&quot;, ret);<br>
Line too long I think<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_panel_remove(&amp;ctx-&gt;panel);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id tm5p5_nt35596_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;tm5p5,nt35596&quot; },<br=
>
vendor tm5p5 is not documented.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, tm5p5_nt35596_of_match);<br>
&gt; +<br>
&gt; +static struct mipi_dsi_driver tm5p5_nt35596_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D tm5p5_nt35596_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D tm5p5_nt35596_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;panel=
-tm5p5-nt35596&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D t=
m5p5_nt35596_of_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_mipi_dsi_driver(tm5p5_nt35596_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Konrad Dybcio &lt;<a href=3D"mailto:konradybcio@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">konradybcio@gmail.com</a>&gt=
;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;DRM driver for tm5p5 nt35596 1080p video mod=
e dsi panel&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; -- <br>
&gt; 2.26.1<br>
</blockquote></div>

--0000000000000afea805a4a780bb--

--===============1023590858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1023590858==--
