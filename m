Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B312446A3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 10:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA8C6E2DD;
	Fri, 14 Aug 2020 08:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338716E2DD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:54:03 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z18so7035647otk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 01:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qrkgl+wd+rfLtxQ+IaGBNG9qvFDBZIf0yqGYIVPRz38=;
 b=GtVGyL300R5qGD+BU1uow0Ki5Tce9qCaGe9xfx7REBR8lkSJOaNaKC0FwqJI+3jruW
 aaq1KULsVKeqhzKQJUiekwl+RevwUJsiM6zGERTjTPFBDHRN8NCrUkCTR7YZuQpUlg3F
 KulI/ppYs4/7Uexpl6gvS29Ry4SiDAyq7zGokgoXCGhGA9iRHxl4gia15kJQ1Gk3TkY/
 OFhkYZc4dO8G0Na8zmKn66BqoC8PVqgKsCe4t/yAPgTl5g9KXtAKThMQCkj3xIvhnrRC
 AFUYF6IZOEIZSqEmOxW2GHhJ0pKpSiXrHXyv5I5GWeUMyMn4iAeYLYgx6J9GsNzJa95P
 ouUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrkgl+wd+rfLtxQ+IaGBNG9qvFDBZIf0yqGYIVPRz38=;
 b=QDVUmbARgm/6pLwyMfjNVNQFQplHa0r5GaIrZD+dPtg0aEKpQ8QQN5IqKneodk1iky
 sK5jH1qrkKtjmiSeeP8aB5gBHbpbnQqEU7/3pNCFO3LLp++IEL8o73bpKN6ZXrpymQYj
 lqUGEAmE+H8xT4+teT7TjrDHOewvdcihJMN5Dr9o7luW5xHlQJzbQjemEjp/z6eRbO9z
 Y38/MWeiNc4KqB2kqyhBL0vf7owecFSl977h1R+atHbus2hNPkS3rXEu301WNvYCoOuO
 WiRuHmdYYOqN3oMDLZqRa450E1ULP/W+HgV9EQCry1E6fQz7pralInWuHDWnUluLts7X
 wKsQ==
X-Gm-Message-State: AOAM531qGMQhcIsKn0frCx+binjJ0lHK1DEdVAwqRzR8JoGP+guJi1vy
 0pZ/cehseO0V3nD85RkTajHLtusk5nNNC/ijapsP6Q==
X-Google-Smtp-Source: ABdhPJwpW5JcMXp7mPEMEFThQBECXkKFMl/oD1Gfjjr5Ph/zAS2+gC3R+7XY3fWTX9cIoVdGZp8mASkaTQDXnCI5ngU=
X-Received: by 2002:a9d:748f:: with SMTP id t15mr1195809otk.371.1597395242015; 
 Fri, 14 Aug 2020 01:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200811182107.6515-1-sumit.semwal@linaro.org>
 <20200811182107.6515-3-sumit.semwal@linaro.org>
 <20200813194620.GA806622@ravnborg.org>
In-Reply-To: <20200813194620.GA806622@ravnborg.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 14 Aug 2020 14:23:50 +0530
Message-ID: <CAO_48GG_ZxwgbxQN85XEVYh_h4iwHJjW8cNWrmbTcUqVmnYdzg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm: panel: Add tianma nt36672a panel driver
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Benni Steini <bennisteinir@gmail.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

Thanks very much for the review.
On Fri, 14 Aug 2020 at 01:16, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Sumit.
>
> On Tue, Aug 11, 2020 at 11:51:07PM +0530, Sumit Semwal wrote:
> > Some Poco F1 phones have an LCD panel from Tianma, model nt36672a,
> > with a resolution of 1080x2246 that operates in DSI video mode.
> >
> > Add the drm panel driver for it.
> >
> > During testing, Benni Steini <bennisteinir@gmail.com> helped us fix
> > the reset sequence timing (from 10ms to 20ms), to get the bootanimation
> > to work on Android.
> >
> > With current AOSP, we need to increase it to 200ms - this seems to be a
> > safe high value to avoid a white screen occasionally.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Benni Steini <bennisteinir@gmail.com>
>
> Checkpatch is not happy with this patch.
> Please fix relevant warnings.
>
> My checkpatch options:
> -q --emacs --strict --show-types
>
> A lot of details in the following.
> Sorry for not catching these before.
>
>         Sam
>
> >
> > ---
> > v2: increase reset sequence timing to a safe 200ms
> > v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
> >     vrefresh on demand. Update for it.
> > ---
> >  MAINTAINERS                                   |   7 +
> >  drivers/gpu/drm/panel/Kconfig                 |  11 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 858 ++++++++++++++++++
> >  4 files changed, 877 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f77df02e4121..9e4bc8da9b2d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5611,6 +5611,13 @@ T:     git git://anongit.freedesktop.org/drm/drm-misc
> >  F:   Documentation/devicetree/bindings/display/ste,mcde.txt
> >  F:   drivers/gpu/drm/mcde/
> >
> > +DRM DRIVER FOR TIANMA NT36672A PANELS
> > +M:   Sumit Semwal <sumit.semwal@linaro.org>
> > +S:   Maintained
> > +T:   git git://anongit.freedesktop.org/drm/drm-misc
> > +F:   Documentation/devicetree/bindings/display/panel/tianma,nt36672a-panel.yaml
> > +F:   drivers/gpu/drm/panel/panel-tianma-nt36672a.c
> > +
> >  DRM DRIVER FOR TDFX VIDEO CARDS
> >  S:   Orphan / Obsolete
> >  F:   drivers/gpu/drm/tdfx/
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index de2f2a452be5..8108a682dcb0 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -437,6 +437,17 @@ config DRM_PANEL_TPO_TD043MTEA1
> >         Say Y here if you want to enable support for TPO TD043MTEA1 800x480
> >         4.3" panel (found on the OMAP3 Pandora board).
> >
> > +config DRM_PANEL_TIANMA_FHD_NT36672A
> > +     tristate "TIANMA NT36672A panel"
> > +     depends on OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Say Y here if you want to enable support for the Tianma NT36672A
> > +       panel. It is seen mostly in Xiaomi Poco F1 mobile phone.
> > +       The panel has a 1080x2246 resolution and uses 24 bit RGB per pixel.
> > +       It provides a MIPI DSI interface to the host.
> > +
> >  config DRM_PANEL_TPO_TPG110
> >       tristate "TPO TPG 800x400 panel"
> >       depends on OF && SPI && GPIOLIB
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> > index e45ceac6286f..472ae9ba8788 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -44,6 +44,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
> >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
> >  obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
> > +obj-$(CONFIG_DRM_PANEL_TIANMA_FHD_NT36672A) += panel-tianma-nt36672a.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
> >  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> > diff --git a/drivers/gpu/drm/panel/panel-tianma-nt36672a.c b/drivers/gpu/drm/panel/panel-tianma-nt36672a.c
> > new file mode 100644
> > index 000000000000..2941975e039c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-tianma-nt36672a.c
> > @@ -0,0 +1,858 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2020 Linaro Ltd
> > + * Author: Sumit Semwal <sumit.semwal@linaro.org>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +struct panel_cmd {
> > +     size_t len;
> > +     const char *data;
> > +};
> > +
> > +#define _INIT_CMD(...) { \
> > +     .len = sizeof((char[]){__VA_ARGS__}), \
> > +     .data = (char[]){__VA_ARGS__} }
> > +
> > +static const char * const regulator_names[] = {
> > +     "vddio",
> > +     "vddpos",
> > +     "vddneg",
> > +};
> > +
> > +static unsigned long const regulator_enable_loads[] = {
> > +     62000,
> > +     100000,
> > +     100000
> > +};
> > +
> > +static unsigned long const regulator_disable_loads[] = {
> > +     80,
> > +     100,
> > +     100
> > +};
> > +
> > +struct panel_desc {
> > +     const struct drm_display_mode *display_mode;
> > +     const char *panel_name;
> > +
> > +     unsigned int width_mm;
> > +     unsigned int height_mm;
> > +
> > +     unsigned long mode_flags;
> > +     enum mipi_dsi_pixel_format format;
> > +     unsigned int lanes;
> > +
> > +     const struct panel_cmd *on_cmds_1;
> > +     const struct panel_cmd *on_cmds_2;
> > +
> > +     const struct panel_cmd *off_cmds;
> > +};
> > +
> > +struct panel_info {
> > +     struct drm_panel base;
> > +     struct mipi_dsi_device *link;
> > +     const struct panel_desc *desc;
> > +
> > +     struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> > +
> > +     struct gpio_desc *reset_gpio;
> > +
> > +     struct pinctrl *pinctrl;
> > +     struct pinctrl_state *active;
> > +     struct pinctrl_state *suspend;
> > +
> > +
> > +     bool prepared;
> > +     bool enabled;
> > +};
> Unless this driver is supposed to handle multiple panels connected to
> the same driver IC then there is no need for a panel_info.
>
> If this driver is supposed to handle multiple panels connected to the
> same driver IC the binding should be updated.
> A general compatible for the driver IC and a specific one for the panel.

I had not realised it, but after reading your comment here, I
investigated, and it looks like this is a generic IC driver for
novatek nt36672a, which is used with different panels in many
downstream products. I will update this.
Sorry, the driver has come about without any TRMs or documentation,
only by adapting downstream drivers to drm_panel base one, so I didn't
have a lot of information about the panel or IC itself.
>
> > +
> > +static inline struct panel_info *to_panel_info(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct panel_info, base);
> > +}
> > +
> > +static int send_mipi_cmds(struct drm_panel *panel, const struct panel_cmd *cmds)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +     unsigned int i = 0;
> > +     int err;
> > +
> > +     if (!cmds)
> > +             return -EFAULT;
> > +
> > +     for (i = 0; cmds[i].len != 0; i++) {
> > +             const struct panel_cmd *cmd = &cmds[i];
> > +
> > +             if (cmd->len == 2)
> > +                     err = mipi_dsi_dcs_write(pinfo->link,
> > +                                                 cmd->data[1], NULL, 0);
> > +             else
> > +                     err = mipi_dsi_dcs_write(pinfo->link,
> > +                                                 cmd->data[1], cmd->data + 2,
> > +                                                 cmd->len - 2);
> > +
> > +             if (err < 0)
> > +                     return err;
> > +
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int panel_set_pinctrl_state(struct panel_info *panel, bool enable)
> > +{
> > +     int rc = 0;
> > +     struct pinctrl_state *state;
> > +
> > +     if (enable)
> > +             state = panel->active;
> > +     else
> > +             state = panel->suspend;
> > +
> > +     rc = pinctrl_select_state(panel->pinctrl, state);
> What is the purpose of this function?
> No other panel drivers uses pinctrl_select_state() so I womder why this
> driver need it.
Last I had checked, we needed to do this, otherwise there were some
issues with the suspend-resume path. I will investigate further, but
not having a serial console makes it a bit harder to check these kind
of issues.
>
> > +     if (rc)
> > +             pr_err("[%s] failed to set pin state, rc=%d\n", panel->desc->panel_name,
> > +                     rc);
> 100 char line length is OK, so put rc on the same line here.
>
> Here pr_err() is used - later DRM_DEV_ERROR() is used.
> It would be nice to be consistent.
Agreed on the consistency; and all the pr_err usage is in pinctrl
parts, so if we are able to remove it, this will go automatically.
>
>
> > +     return rc;
> > +}
> > +
> > +static int tianma_panel_disable(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +
> > +     pinfo->enabled = false;
> > +
> > +     return 0;
> > +}
> > +
> > +static int tianma_panel_power_off(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +     int i, ret = 0;
> > +
> > +     gpiod_set_value(pinfo->reset_gpio, 0);
> > +
> > +     ret = panel_set_pinctrl_state(pinfo, false);
> > +     if (ret) {
> > +             pr_err("[%s] failed to set pinctrl, rc=%d\n", pinfo->desc->panel_name, ret);
> > +             return ret;
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> > +             ret = regulator_set_load(pinfo->supplies[i].consumer,
> > +                             regulator_disable_loads[i]);
> > +             if (ret) {
> > +                     DRM_DEV_ERROR(panel->dev,
> > +                             "regulator_set_load failed %d\n", ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                     "regulator_bulk_disable failed %d\n", ret);
> > +     }
> > +     return ret;
> > +}
> > +
> > +static int tianma_panel_unprepare(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +     int ret;
> > +
> > +     if (!pinfo->prepared)
> > +             return 0;
> > +
> > +     /* send off cmds */
> > +     ret = send_mipi_cmds(panel, pinfo->desc->off_cmds);
> > +
> > +     if (ret < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                             "failed to send DCS off cmds: %d\n", ret);
> > +     }
> > +
> > +     ret = mipi_dsi_dcs_set_display_off(pinfo->link);
> > +     if (ret < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                     "set_display_off cmd failed ret = %d\n",
> > +                     ret);
> > +     }
> > +
> > +     /* 120ms delay required here as per DCS spec */
> > +     msleep(120);
> > +
> > +     ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
> > +     if (ret < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                     "enter_sleep cmd failed ret = %d\n", ret);
> > +     }
> > +     /* 0x3C = 60ms delay */
> > +     msleep(60);
> > +
> > +     ret = tianma_panel_power_off(panel);
> > +     if (ret < 0)
> > +             DRM_DEV_ERROR(panel->dev, "power_off failed ret = %d\n", ret);
> > +
> > +     pinfo->prepared = false;
> > +
> > +     return ret;
> > +
> > +}
> > +
> > +static int tianma_panel_power_on(struct panel_info *pinfo)
> > +{
> > +     int ret, i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> > +             ret = regulator_set_load(pinfo->supplies[i].consumer,
> > +                                     regulator_enable_loads[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret = regulator_bulk_enable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = panel_set_pinctrl_state(pinfo, true);
> > +     if (ret) {
> > +             pr_err("[%s] failed to set pinctrl, rc=%d\n", pinfo->desc->panel_name, ret);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * As per downstream kernel, Reset sequence of Tianma nt36672a panel requires the panel to
> > +      * be out of reset for 10ms, followed by being held in reset for 10ms. But for Android
> > +      * AOSP, we needed to bump it upto 200ms otherwise we get white screen sometimes.
> > +      * FIXME: Try to reduce this 200ms to a lesser value.
> > +      */
> > +     gpiod_set_value(pinfo->reset_gpio, 0);
> > +     msleep(200);
> > +     gpiod_set_value(pinfo->reset_gpio, 1);
> > +     msleep(200);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tianma_panel_prepare(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +     int err;
> > +
> > +     if (pinfo->prepared)
> > +             return 0;
> > +
> > +     err = tianma_panel_power_on(pinfo);
> > +     if (err < 0)
> > +             goto poweroff;
> > +
> > +     /* send first part of init cmds */
> > +     err = send_mipi_cmds(panel, pinfo->desc->on_cmds_1);
> > +
> > +     if (err < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                             "failed to send DCS Init 1st Code: %d\n", err);
> > +             goto poweroff;
> > +     }
> > +
> > +     err = mipi_dsi_dcs_set_display_on(pinfo->link);
> > +     if (err < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                             "failed to Set Display ON: %d\n", err);
> > +             goto poweroff;
> > +     }
> > +
> > +     err = mipi_dsi_dcs_exit_sleep_mode(pinfo->link);
> > +     if (err < 0) {
> > +             DRM_DEV_ERROR(panel->dev, "failed to exit sleep mode: %d\n",
> > +                           err);
> > +             goto poweroff;
> > +     }
> > +     /* 0x46 = 70 ms delay */
> > +     msleep(70);
> > +
> > +     /* Send rest of the init cmds */
> > +     err = send_mipi_cmds(panel, pinfo->desc->on_cmds_2);
> > +
> > +     if (err < 0) {
> > +             DRM_DEV_ERROR(panel->dev,
> > +                             "failed to send DCS Init 2nd Code: %d\n", err);
> > +             goto poweroff;
> > +     }
> > +
> > +     msleep(120);
> > +
> > +     pinfo->prepared = true;
> > +
> > +     return 0;
> > +
> > +poweroff:
> > +     gpiod_set_value(pinfo->reset_gpio, 1);
> > +     return err;
> > +}
> > +
> > +
> > +static int tianma_panel_enable(struct drm_panel *panel)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +
> > +     if (pinfo->enabled)
> > +             return 0;
> ->enabled is only used to avoid assignment to ->enabled.
> Looks like code that can be dropped.
>
Ack.
> > +
> > +     pinfo->enabled = true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int tianma_panel_get_modes(struct drm_panel *panel,
> > +                             struct drm_connector *connector)
> > +{
> > +     struct panel_info *pinfo = to_panel_info(panel);
> > +     const struct drm_display_mode *m = pinfo->desc->display_mode;
> > +     struct drm_display_mode *mode;
> > +
> > +     mode = drm_mode_duplicate(connector->dev, m);
> > +     if (!mode) {
> > +             DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%u@%u\n",
> > +                             m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > +             return -ENOMEM;
> > +     }
> > +
> > +     connector->display_info.width_mm = pinfo->desc->width_mm;
> > +     connector->display_info.height_mm = pinfo->desc->height_mm;
> > +
> > +     drm_mode_set_name(mode);
> > +     drm_mode_probed_add(connector, mode);
> > +
> > +     return 1;
> > +}
> > +
> > +static const struct drm_panel_funcs panel_funcs = {
> > +     .disable = tianma_panel_disable,
> > +     .unprepare = tianma_panel_unprepare,
> > +     .prepare = tianma_panel_prepare,
> > +     .enable = tianma_panel_enable,
> > +     .get_modes = tianma_panel_get_modes,
> > +};
> > +
> > +static const struct panel_cmd tianma_nt36672a_on_cmds_1[] = {
> > +     /* skin enhancement mode */
> > +     _INIT_CMD(0x00, 0xFF, 0x22),
> > +     _INIT_CMD(0x00, 0x00, 0x40),
> > +     _INIT_CMD(0x00, 0x01, 0xC0),
> > +     _INIT_CMD(0x00, 0x02, 0x40),
> > +     _INIT_CMD(0x00, 0x03, 0x40),
> > +     _INIT_CMD(0x00, 0x04, 0x40),
> > +     _INIT_CMD(0x00, 0x05, 0x40),
> > +     _INIT_CMD(0x00, 0x06, 0x40),
> > +     _INIT_CMD(0x00, 0x07, 0x40),
> > +     _INIT_CMD(0x00, 0x08, 0x40),
> > +     _INIT_CMD(0x00, 0x09, 0x40),
> > +     _INIT_CMD(0x00, 0x0A, 0x40),
> > +     _INIT_CMD(0x00, 0x0B, 0x40),
> > +     _INIT_CMD(0x00, 0x0C, 0x40),
> > +     _INIT_CMD(0x00, 0x0D, 0x40),
> > +     _INIT_CMD(0x00, 0x0E, 0x40),
> > +     _INIT_CMD(0x00, 0x0F, 0x40),
> > +     _INIT_CMD(0x00, 0x10, 0x40),
> > +     _INIT_CMD(0x00, 0x11, 0x50),
> > +     _INIT_CMD(0x00, 0x12, 0x60),
> > +     _INIT_CMD(0x00, 0x13, 0x70),
> > +     _INIT_CMD(0x00, 0x14, 0x58),
> > +     _INIT_CMD(0x00, 0x15, 0x68),
> > +     _INIT_CMD(0x00, 0x16, 0x78),
> > +     _INIT_CMD(0x00, 0x17, 0x77),
> > +     _INIT_CMD(0x00, 0x18, 0x39),
> > +     _INIT_CMD(0x00, 0x19, 0x2D),
> > +     _INIT_CMD(0x00, 0x1A, 0x2E),
> > +     _INIT_CMD(0x00, 0x1B, 0x32),
> > +     _INIT_CMD(0x00, 0x1C, 0x37),
> > +     _INIT_CMD(0x00, 0x1D, 0x3A),
> > +     _INIT_CMD(0x00, 0x1E, 0x40),
> > +     _INIT_CMD(0x00, 0x1F, 0x40),
> > +     _INIT_CMD(0x00, 0x20, 0x40),
> > +     _INIT_CMD(0x00, 0x21, 0x40),
> > +     _INIT_CMD(0x00, 0x22, 0x40),
> > +     _INIT_CMD(0x00, 0x23, 0x40),
> > +     _INIT_CMD(0x00, 0x24, 0x40),
> > +     _INIT_CMD(0x00, 0x25, 0x40),
> > +     _INIT_CMD(0x00, 0x26, 0x40),
> > +     _INIT_CMD(0x00, 0x27, 0x40),
> > +     _INIT_CMD(0x00, 0x28, 0x40),
> > +     _INIT_CMD(0x00, 0x2D, 0x00),
> > +     _INIT_CMD(0x00, 0x2F, 0x40),
> > +     _INIT_CMD(0x00, 0x30, 0x40),
> > +     _INIT_CMD(0x00, 0x31, 0x40),
> > +     _INIT_CMD(0x00, 0x32, 0x40),
> > +     _INIT_CMD(0x00, 0x33, 0x40),
> > +     _INIT_CMD(0x00, 0x34, 0x40),
> > +     _INIT_CMD(0x00, 0x35, 0x40),
> > +     _INIT_CMD(0x00, 0x36, 0x40),
> > +     _INIT_CMD(0x00, 0x37, 0x40),
> > +     _INIT_CMD(0x00, 0x38, 0x40),
> > +     _INIT_CMD(0x00, 0x39, 0x40),
> > +     _INIT_CMD(0x00, 0x3A, 0x40),
> > +     _INIT_CMD(0x00, 0x3B, 0x40),
> > +     _INIT_CMD(0x00, 0x3D, 0x40),
> > +     _INIT_CMD(0x00, 0x3F, 0x40),
> > +     _INIT_CMD(0x00, 0x40, 0x40),
> > +     _INIT_CMD(0x00, 0x41, 0x40),
> > +     _INIT_CMD(0x00, 0x42, 0x40),
> > +     _INIT_CMD(0x00, 0x43, 0x40),
> > +     _INIT_CMD(0x00, 0x44, 0x40),
> > +     _INIT_CMD(0x00, 0x45, 0x40),
> > +     _INIT_CMD(0x00, 0x46, 0x40),
> > +     _INIT_CMD(0x00, 0x47, 0x40),
> > +     _INIT_CMD(0x00, 0x48, 0x40),
> > +     _INIT_CMD(0x00, 0x49, 0x40),
> > +     _INIT_CMD(0x00, 0x4A, 0x40),
> > +     _INIT_CMD(0x00, 0x4B, 0x40),
> > +     _INIT_CMD(0x00, 0x4C, 0x40),
> > +     _INIT_CMD(0x00, 0x4D, 0x40),
> > +     _INIT_CMD(0x00, 0x4E, 0x40),
> > +     _INIT_CMD(0x00, 0x4F, 0x40),
> > +     _INIT_CMD(0x00, 0x50, 0x40),
> > +     _INIT_CMD(0x00, 0x51, 0x40),
> > +     _INIT_CMD(0x00, 0x52, 0x40),
> > +     _INIT_CMD(0x00, 0x53, 0x01),
> > +     _INIT_CMD(0x00, 0x54, 0x01),
> > +     _INIT_CMD(0x00, 0x55, 0xFE),
> > +     _INIT_CMD(0x00, 0x56, 0x77),
> > +     _INIT_CMD(0x00, 0x58, 0xCD),
> > +     _INIT_CMD(0x00, 0x59, 0xD0),
> > +     _INIT_CMD(0x00, 0x5A, 0xD0),
> > +     _INIT_CMD(0x00, 0x5B, 0x50),
> > +     _INIT_CMD(0x00, 0x5C, 0x50),
> > +     _INIT_CMD(0x00, 0x5D, 0x50),
> > +     _INIT_CMD(0x00, 0x5E, 0x50),
> > +     _INIT_CMD(0x00, 0x5F, 0x50),
> > +     _INIT_CMD(0x00, 0x60, 0x50),
> > +     _INIT_CMD(0x00, 0x61, 0x50),
> > +     _INIT_CMD(0x00, 0x62, 0x50),
> > +     _INIT_CMD(0x00, 0x63, 0x50),
> > +     _INIT_CMD(0x00, 0x64, 0x50),
> > +     _INIT_CMD(0x00, 0x65, 0x50),
> > +     _INIT_CMD(0x00, 0x66, 0x50),
> > +     _INIT_CMD(0x00, 0x67, 0x50),
> > +     _INIT_CMD(0x00, 0x68, 0x50),
> > +     _INIT_CMD(0x00, 0x69, 0x50),
> > +     _INIT_CMD(0x00, 0x6A, 0x50),
> > +     _INIT_CMD(0x00, 0x6B, 0x50),
> > +     _INIT_CMD(0x00, 0x6C, 0x50),
> > +     _INIT_CMD(0x00, 0x6D, 0x50),
> > +     _INIT_CMD(0x00, 0x6E, 0x50),
> > +     _INIT_CMD(0x00, 0x6F, 0x50),
> > +     _INIT_CMD(0x00, 0x70, 0x07),
> > +     _INIT_CMD(0x00, 0x71, 0x00),
> > +     _INIT_CMD(0x00, 0x72, 0x00),
> > +     _INIT_CMD(0x00, 0x73, 0x00),
> > +     _INIT_CMD(0x00, 0x74, 0x06),
> > +     _INIT_CMD(0x00, 0x75, 0x0C),
> > +     _INIT_CMD(0x00, 0x76, 0x03),
> > +     _INIT_CMD(0x00, 0x77, 0x09),
> > +     _INIT_CMD(0x00, 0x78, 0x0F),
> > +     _INIT_CMD(0x00, 0x79, 0x68),
> > +     _INIT_CMD(0x00, 0x7A, 0x88),
> > +     _INIT_CMD(0x00, 0x7C, 0x80),
> > +     _INIT_CMD(0x00, 0x7D, 0x80),
> > +     _INIT_CMD(0x00, 0x7E, 0x80),
> > +     _INIT_CMD(0x00, 0x7F, 0x00),
> > +     _INIT_CMD(0x00, 0x80, 0x00),
> > +     _INIT_CMD(0x00, 0x81, 0x00),
> > +     _INIT_CMD(0x00, 0x83, 0x01),
> > +     _INIT_CMD(0x00, 0x84, 0x00),
> > +     _INIT_CMD(0x00, 0x85, 0x80),
> > +     _INIT_CMD(0x00, 0x86, 0x80),
> > +     _INIT_CMD(0x00, 0x87, 0x80),
> > +     _INIT_CMD(0x00, 0x88, 0x40),
> > +     _INIT_CMD(0x00, 0x89, 0x91),
> > +     _INIT_CMD(0x00, 0x8A, 0x98),
> > +     _INIT_CMD(0x00, 0x8B, 0x80),
> > +     _INIT_CMD(0x00, 0x8C, 0x80),
> > +     _INIT_CMD(0x00, 0x8D, 0x80),
> > +     _INIT_CMD(0x00, 0x8E, 0x80),
> > +     _INIT_CMD(0x00, 0x8F, 0x80),
> > +     _INIT_CMD(0x00, 0x90, 0x80),
> > +     _INIT_CMD(0x00, 0x91, 0x80),
> > +     _INIT_CMD(0x00, 0x92, 0x80),
> > +     _INIT_CMD(0x00, 0x93, 0x80),
> > +     _INIT_CMD(0x00, 0x94, 0x80),
> > +     _INIT_CMD(0x00, 0x95, 0x80),
> > +     _INIT_CMD(0x00, 0x96, 0x80),
> > +     _INIT_CMD(0x00, 0x97, 0x80),
> > +     _INIT_CMD(0x00, 0x98, 0x80),
> > +     _INIT_CMD(0x00, 0x99, 0x80),
> > +     _INIT_CMD(0x00, 0x9A, 0x80),
> > +     _INIT_CMD(0x00, 0x9B, 0x80),
> > +     _INIT_CMD(0x00, 0x9C, 0x80),
> > +     _INIT_CMD(0x00, 0x9D, 0x80),
> > +     _INIT_CMD(0x00, 0x9E, 0x80),
> > +     _INIT_CMD(0x00, 0x9F, 0x80),
> > +     _INIT_CMD(0x00, 0xA0, 0x8A),
> > +     _INIT_CMD(0x00, 0xA2, 0x80),
> > +     _INIT_CMD(0x00, 0xA6, 0x80),
> > +     _INIT_CMD(0x00, 0xA7, 0x80),
> > +     _INIT_CMD(0x00, 0xA9, 0x80),
> > +     _INIT_CMD(0x00, 0xAA, 0x80),
> > +     _INIT_CMD(0x00, 0xAB, 0x80),
> > +     _INIT_CMD(0x00, 0xAC, 0x80),
> > +     _INIT_CMD(0x00, 0xAD, 0x80),
> > +     _INIT_CMD(0x00, 0xAE, 0x80),
> > +     _INIT_CMD(0x00, 0xAF, 0x80),
> > +     _INIT_CMD(0x00, 0xB7, 0x76),
> > +     _INIT_CMD(0x00, 0xB8, 0x76),
> > +     _INIT_CMD(0x00, 0xB9, 0x05),
> > +     _INIT_CMD(0x00, 0xBA, 0x0D),
> > +     _INIT_CMD(0x00, 0xBB, 0x14),
> > +     _INIT_CMD(0x00, 0xBC, 0x0F),
> > +     _INIT_CMD(0x00, 0xBD, 0x18),
> > +     _INIT_CMD(0x00, 0xBE, 0x1F),
> > +     _INIT_CMD(0x00, 0xBF, 0x05),
> > +     _INIT_CMD(0x00, 0xC0, 0x0D),
> > +     _INIT_CMD(0x00, 0xC1, 0x14),
> > +     _INIT_CMD(0x00, 0xC2, 0x03),
> > +     _INIT_CMD(0x00, 0xC3, 0x07),
> > +     _INIT_CMD(0x00, 0xC4, 0x0A),
> > +     _INIT_CMD(0x00, 0xC5, 0xA0),
> > +     _INIT_CMD(0x00, 0xC6, 0x55),
> > +     _INIT_CMD(0x00, 0xC7, 0xFF),
> > +     _INIT_CMD(0x00, 0xC8, 0x39),
> > +     _INIT_CMD(0x00, 0xC9, 0x44),
> > +     _INIT_CMD(0x00, 0xCA, 0x12),
> > +     _INIT_CMD(0x00, 0xCD, 0x80),
> > +     _INIT_CMD(0x00, 0xDB, 0x80),
> > +     _INIT_CMD(0x00, 0xDC, 0x80),
> > +     _INIT_CMD(0x00, 0xDD, 0x80),
> > +     _INIT_CMD(0x00, 0xE0, 0x80),
> > +     _INIT_CMD(0x00, 0xE1, 0x80),
> > +     _INIT_CMD(0x00, 0xE2, 0x80),
> > +     _INIT_CMD(0x00, 0xE3, 0x80),
> > +     _INIT_CMD(0x00, 0xE4, 0x80),
> > +     _INIT_CMD(0x00, 0xE5, 0x40),
> > +     _INIT_CMD(0x00, 0xE6, 0x40),
> > +     _INIT_CMD(0x00, 0xE7, 0x40),
> > +     _INIT_CMD(0x00, 0xE8, 0x40),
> > +     _INIT_CMD(0x00, 0xE9, 0x40),
> > +     _INIT_CMD(0x00, 0xEA, 0x40),
> > +     _INIT_CMD(0x00, 0xEB, 0x40),
> > +     _INIT_CMD(0x00, 0xEC, 0x40),
> > +     _INIT_CMD(0x00, 0xED, 0x40),
> > +     _INIT_CMD(0x00, 0xEE, 0x40),
> > +     _INIT_CMD(0x00, 0xEF, 0x40),
> > +     _INIT_CMD(0x00, 0xF0, 0x40),
> > +     _INIT_CMD(0x00, 0xF1, 0x40),
> > +     _INIT_CMD(0x00, 0xF2, 0x40),
> > +     _INIT_CMD(0x00, 0xF3, 0x40),
> > +     _INIT_CMD(0x00, 0xF4, 0x40),
> > +     _INIT_CMD(0x00, 0xF5, 0x40),
> > +     _INIT_CMD(0x00, 0xF6, 0x40),
> > +     _INIT_CMD(0x00, 0xFB, 0x1),
> > +     _INIT_CMD(0x00, 0xFF, 0x23),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     /* dimming enable */
> > +     _INIT_CMD(0x00, 0x01, 0x84),
> > +     _INIT_CMD(0x00, 0x05, 0x2D),
> > +     _INIT_CMD(0x00, 0x06, 0x00),
> > +      /* resolution 1080*2246 */
> > +     _INIT_CMD(0x00, 0x11, 0x01),
> > +     _INIT_CMD(0x00, 0x12, 0x7B),
> > +     _INIT_CMD(0x00, 0x15, 0x6F),
> > +     _INIT_CMD(0x00, 0x16, 0x0B),
> > +      /* UI mode */
> > +     _INIT_CMD(0x00, 0x29, 0x0A),
> > +     _INIT_CMD(0x00, 0x30, 0xFF),
> > +     _INIT_CMD(0x00, 0x31, 0xFF),
> > +     _INIT_CMD(0x00, 0x32, 0xFF),
> > +     _INIT_CMD(0x00, 0x33, 0xFF),
> > +     _INIT_CMD(0x00, 0x34, 0xFF),
> > +     _INIT_CMD(0x00, 0x35, 0xFF),
> > +     _INIT_CMD(0x00, 0x36, 0xFF),
> > +     _INIT_CMD(0x00, 0x37, 0xFF),
> > +     _INIT_CMD(0x00, 0x38, 0xFC),
> > +     _INIT_CMD(0x00, 0x39, 0xF8),
> > +     _INIT_CMD(0x00, 0x3A, 0xF4),
> > +     _INIT_CMD(0x00, 0x3B, 0xF1),
> > +     _INIT_CMD(0x00, 0x3D, 0xEE),
> > +     _INIT_CMD(0x00, 0x3F, 0xEB),
> > +     _INIT_CMD(0x00, 0x40, 0xE8),
> > +     _INIT_CMD(0x00, 0x41, 0xE5),
> > +      /* STILL mode */
> > +     _INIT_CMD(0x00, 0x2A, 0x13),
> > +     _INIT_CMD(0x00, 0x45, 0xFF),
> > +     _INIT_CMD(0x00, 0x46, 0xFF),
> > +     _INIT_CMD(0x00, 0x47, 0xFF),
> > +     _INIT_CMD(0x00, 0x48, 0xFF),
> > +     _INIT_CMD(0x00, 0x49, 0xFF),
> > +     _INIT_CMD(0x00, 0x4A, 0xFF),
> > +     _INIT_CMD(0x00, 0x4B, 0xFF),
> > +     _INIT_CMD(0x00, 0x4C, 0xFF),
> > +     _INIT_CMD(0x00, 0x4D, 0xED),
> > +     _INIT_CMD(0x00, 0x4E, 0xD5),
> > +     _INIT_CMD(0x00, 0x4F, 0xBF),
> > +     _INIT_CMD(0x00, 0x50, 0xA6),
> > +     _INIT_CMD(0x00, 0x51, 0x96),
> > +     _INIT_CMD(0x00, 0x52, 0x86),
> > +     _INIT_CMD(0x00, 0x53, 0x76),
> > +     _INIT_CMD(0x00, 0x54, 0x66),
> > +      /* MOVING mode */
> > +     _INIT_CMD(0x00, 0x2B, 0x0E),
> > +     _INIT_CMD(0x00, 0x58, 0xFF),
> > +     _INIT_CMD(0x00, 0x59, 0xFF),
> > +     _INIT_CMD(0x00, 0x5A, 0xFF),
> > +     _INIT_CMD(0x00, 0x5B, 0xFF),
> > +     _INIT_CMD(0x00, 0x5C, 0xFF),
> > +     _INIT_CMD(0x00, 0x5D, 0xFF),
> > +     _INIT_CMD(0x00, 0x5E, 0xFF),
> > +     _INIT_CMD(0x00, 0x5F, 0xFF),
> > +     _INIT_CMD(0x00, 0x60, 0xF6),
> > +     _INIT_CMD(0x00, 0x61, 0xEA),
> > +     _INIT_CMD(0x00, 0x62, 0xE1),
> > +     _INIT_CMD(0x00, 0x63, 0xD8),
> > +     _INIT_CMD(0x00, 0x64, 0xCE),
> > +     _INIT_CMD(0x00, 0x65, 0xC3),
> > +     _INIT_CMD(0x00, 0x66, 0xBA),
> > +     _INIT_CMD(0x00, 0x67, 0xB3),
> > +     _INIT_CMD(0x00, 0xFF, 0x25),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     _INIT_CMD(0x00, 0x05, 0x04),
> > +     _INIT_CMD(0x00, 0xFF, 0x26),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     _INIT_CMD(0x00, 0x1C, 0xAF),
> > +     _INIT_CMD(0x00, 0xFF, 0x10),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     _INIT_CMD(0x00, 0x51, 0xFF),
> > +     _INIT_CMD(0x00, 0x53, 0x24),
> > +     _INIT_CMD(0x00, 0x55, 0x00),
> > +
> > +     {},
> > +};
> > +
> > +static const struct panel_cmd tianma_nt36672a_on_cmds_2[] = {
> > +     _INIT_CMD(0x00, 0xFF, 0x24),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     _INIT_CMD(0x00, 0xC3, 0x01),
> > +     _INIT_CMD(0x00, 0xC4, 0x54),
> > +     _INIT_CMD(0x00, 0xFF, 0x10),
> > +
> > +     {},
> > +};
> > +
> > +static const struct panel_cmd tianma_nt36672a_off_cmds[] = {
> > +     _INIT_CMD(0x00, 0xFF, 0x24),
> > +     _INIT_CMD(0x00, 0xFB, 0x01),
> > +     _INIT_CMD(0x00, 0xC3, 0x01),
> > +     _INIT_CMD(0x00, 0xFF, 0x10),
> > +
> > +     {},
> > +};
> > +
> > +static const struct drm_display_mode tianma_panel_default_mode = {
> > +     .clock          = 161331,
> > +
> > +     .hdisplay       = 1080,
> > +     .hsync_start    = 1080 + 40,
> > +     .hsync_end      = 1080 + 40 + 20,
> > +     .htotal         = 1080 + 40 + 20 + 44,
> > +
> > +     .vdisplay       = 2246,
> > +     .vsync_start    = 2246 + 15,
> > +     .vsync_end      = 2246 + 15 + 2,
> > +     .vtotal         = 2246 + 15 + 2 + 8,
> > +
> > +     .type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> > +};
> > +
> > +static const struct panel_desc tianma_panel_desc = {
> > +     .display_mode = &tianma_panel_default_mode,
> > +
> > +     .width_mm = 68,
> > +     .height_mm = 136,
> > +
> > +     .mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
> > +                     | MIPI_DSI_MODE_VIDEO_HSE
> > +                     | MIPI_DSI_CLOCK_NON_CONTINUOUS
> > +                     | MIPI_DSI_MODE_VIDEO_BURST,
> > +     .format = MIPI_DSI_FMT_RGB888,
> > +     .lanes = 4,
> > +     .on_cmds_1 = tianma_nt36672a_on_cmds_1,
> > +     .on_cmds_2 = tianma_nt36672a_on_cmds_2,
> > +     .off_cmds = tianma_nt36672a_off_cmds
> > +};
> > +
> > +
> > +static const struct of_device_id panel_of_match[] = {
> > +     { .compatible = "tianma,nt36672a",
> > +       .data = &tianma_panel_desc
> > +     },
> > +     {
> > +             /* sentinel */
> > +     }
> > +};
> > +MODULE_DEVICE_TABLE(of, panel_of_match);
> > +
> > +
> > +static int panel_pinctrl_init(struct panel_info *panel)
> > +{
> > +     struct device *dev = &panel->link->dev;
> > +     int rc = 0;
> > +
> > +     panel->pinctrl = devm_pinctrl_get(dev);
> > +     if (IS_ERR_OR_NULL(panel->pinctrl)) {
> > +             rc = PTR_ERR(panel->pinctrl);
> > +             pr_err("failed to get pinctrl, rc=%d\n", rc);
> > +             goto error;
> > +     }
> > +
> > +     panel->active = pinctrl_lookup_state(panel->pinctrl,
> > +                                                     "panel_active");
> > +     if (IS_ERR_OR_NULL(panel->active)) {
> > +             rc = PTR_ERR(panel->active);
> > +             pr_err("failed to get pinctrl active state, rc=%d\n", rc);
> > +             goto error;
> > +     }
> > +
> > +     panel->suspend =
> > +             pinctrl_lookup_state(panel->pinctrl, "panel_suspend");
> > +
> > +     if (IS_ERR_OR_NULL(panel->suspend)) {
> > +             rc = PTR_ERR(panel->suspend);
> > +             pr_err("failed to get pinctrl suspend state, rc=%d\n", rc);
> > +             goto error;
> > +     }
> > +
> > +error:
> > +     return rc;
> > +}
> I thought the core would handle pin-trl for us?
> Have I missed something?
Answered above.
>
> > +
> > +static int panel_add(struct panel_info *pinfo)
> > +{
> > +     struct device *dev = &pinfo->link->dev;
> > +     int i, ret;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
> > +             pinfo->supplies[i].supply = regulator_names[i];
> > +
> > +     ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
> > +                                   pinfo->supplies);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +     if (IS_ERR(pinfo->reset_gpio)) {
> > +             DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> > +                     PTR_ERR(pinfo->reset_gpio));
> > +             return PTR_ERR(pinfo->reset_gpio);
> > +     }
> > +
> > +     ret = panel_pinctrl_init(pinfo);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     drm_panel_init(&pinfo->base, dev, &panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +
> > +     ret = drm_panel_add(&pinfo->base);
> drm_panel_add() now returns void - use latest drm-misc-next to catch
> such issues.
Yes, of course. Will do.
>
> > +     if (ret < 0)
> > +             return ret;
> > +     return 0;
> > +}
> > +
> > +static void panel_del(struct panel_info *pinfo)
> > +{
> > +     if (pinfo->base.dev)
> > +             drm_panel_remove(&pinfo->base);
> > +}
> > +
> > +static int panel_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct panel_info *pinfo;
> > +     const struct panel_desc *desc;
> > +     int err;
> > +
> > +     pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
> > +     if (!pinfo)
> > +             return -ENOMEM;
> > +
> > +     desc = of_device_get_match_data(&dsi->dev);
> > +     dsi->mode_flags = desc->mode_flags;
> > +     dsi->format = desc->format;
> > +     dsi->lanes = desc->lanes;
> > +     pinfo->desc = desc;
> > +     pinfo->link = dsi;
> > +
> > +     mipi_dsi_set_drvdata(dsi, pinfo);
> > +
> > +     err = panel_add(pinfo);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     err = mipi_dsi_attach(dsi);
> > +     return err;
>
> Or return mipi_dsi_attach(dsi);
Ack
>
> > +}
> > +
> > +static int panel_remove(struct mipi_dsi_device *dsi)
> > +{
> > +     struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> > +     int err;
> > +
> > +     err = tianma_panel_unprepare(&pinfo->base);
> Use drm_panel_unprepare() here - you may need functionality from
> drm_panel.
Ack
> > +     if (err < 0)
> > +             DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
> > +                             err);
> > +
> > +     err = tianma_panel_disable(&pinfo->base);
> USe drm_panel_disable() here.
Ack
>
> > +     if (err < 0)
> > +             DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
> > +
> > +     err = mipi_dsi_detach(dsi);
> > +     if (err < 0)
> > +             DRM_DEV_ERROR(&dsi->dev, "failed to detach from DSI host: %d\n",
> > +                             err);
> > +
> > +     drm_panel_detach(&pinfo->base);
> > +     panel_del(pinfo);
> Call drm_panel_remove() here - no reason for a helper.
Agreed.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static void panel_shutdown(struct mipi_dsi_device *dsi)
> > +{
> > +     struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
> > +
> > +     tianma_panel_disable(&pinfo->base);
> drm_panel_disable()
Ack
>
> > +     tianma_panel_unprepare(&pinfo->base);
> drm_panel_unprepare()
Ack
>
> > +}
> > +
> > +static struct mipi_dsi_driver panel_driver = {
> > +     .driver = {
> > +             .name = "panel-tianma-nt36672a",
> > +             .of_match_table = panel_of_match,
> > +     },
> > +     .probe = panel_probe,
> > +     .remove = panel_remove,
> > +     .shutdown = panel_shutdown,
> > +};
> > +module_mipi_dsi_driver(panel_driver);
> > +
> > +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> > +MODULE_DESCRIPTION("TIANMA NT36672A MIPI-DSI LCD panel");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.28.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

Best,
Sumit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
