Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A481228D8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583AB6E97E;
	Tue, 17 Dec 2019 10:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBC86E466
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:44:50 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z8so4208024ioh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyt9AGP8R9qNwT464SMtM661TFsq7X2MjwNSpjhezDo=;
 b=f3El6H1u8ne1vZps79V7/JuDry5rAc6C6emgreIw501hMB1c27cRvOBc634SM4Y14o
 T5xqJYJwDuJKQmlfamd2CUJDbDC/ssEQrTw0RnbNNtlfXbv/gCiCg8HArTVcWsY4mAAC
 yQR5iasWbqcSFmfimDY9+u1WZE2zst35xnoQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyt9AGP8R9qNwT464SMtM661TFsq7X2MjwNSpjhezDo=;
 b=IZAiGsAoQPqxn39eJWf6XnFmWIfItezfPqvSy0jwBLhOrmZuXV2Wjn/usveg991XNe
 /aBKd6UwSApdiVxHZvsYA4cKQObIADz3KP9+CGt7UKXaMhpjRe1YDs4iiVDbd4sPZ/be
 gDQmYi9A+gvAVj36Pj3nnv2Y9DJz/88rCYwuAsGFd2GvfaAwrrWSuPxREkZUTUjFF39T
 fikQUJ8jPAR0grOq7FjQYyXvr+kGDcwdN58gvstyf+KkhSSn/zSletakJisedYxP/gCJ
 DnAs21gQoJwL66ATGjPD3OVS1U4PlJ17PcEgZYZSow9MRj0cb8UlR55/2HFrx6AHM+ia
 lq1g==
X-Gm-Message-State: APjAAAXj0owACsOh8ahJ9Q7rCrAZExT7o19qxY3moYmg+Knrd1Q/cJN5
 RBZYEOW2FLbBvK2TBqTlHFhUe4Bsn60LQ8XdUL+8gQ==
X-Google-Smtp-Source: APXvYqzoTvSszt6gxvUcc5nlM0TwsLAqXrLojwKuPq/AdoQRZ88qEaTeqjvFbrn1COtyPfKjrqqg2cfxF4lG6QsCxWA=
X-Received: by 2002:a5d:9c10:: with SMTP id 16mr16757226ioe.150.1576485889482; 
 Mon, 16 Dec 2019 00:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-5-hsinyi@chromium.org>
 <20191213223341.GR4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213223341.GR4860@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 Dec 2019 16:44:23 +0800
Message-ID: <CAJMQK-igdVBk-wg87K9Bn4D9RtSZCHKP4EKMoU+UK6xTycCM8g@mail.gmail.com>
Subject: Re: [PATCH RESEND 4/4] drm: bridge: Generic GPIO mux driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 6:33 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hsin-Yi and Nicolas,
>
> Thank you for the patch.
>
> On Wed, Dec 11, 2019 at 02:19:11PM +0800, Hsin-Yi Wang wrote:
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > This driver supports single input, 2 output display mux (e.g.
> > HDMI mux), that provide its status via a GPIO.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig            |  10 +
> >  drivers/gpu/drm/bridge/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/generic-gpio-mux.c | 306 ++++++++++++++++++++++
> >  3 files changed, 317 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 1f3fc6bec842..4734f6993858 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -54,6 +54,16 @@ config DRM_DUMB_VGA_DAC
> >         Support for non-programmable RGB to VGA DAC bridges, such as ADI
> >         ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
> >
> > +config DRM_GENERIC_GPIO_MUX
> > +     tristate "Generic GPIO-controlled mux"
> > +     depends on OF
> > +     select DRM_KMS_HELPER
> > +     ---help---
> > +       This bridge driver models a GPIO-controlled display mux with one
> > +       input, 2 outputs (e.g. an HDMI mux). The hardware decides which output
> > +       is active, reports it as a GPIO, and the driver redirects calls to the
> > +       appropriate downstream bridge (if any).
>
> My understanding of the issue was that the mux was controllable by a
> GPIO, not that the GPIO would report its status. This changes a few
> things. How is the mux controlled then ?
>
There's a hardware that would control the gpio to active if HDMI is
plugged. The mux driver registered a irq for this gpio, and handle
cases depending on gpio status.
> >  config DRM_LVDS_ENCODER
> >       tristate "Transparent parallel to LVDS encoder support"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 7a1e0ec032e6..1c0c92667ac4 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > +obj-$(CONFIG_DRM_GENERIC_GPIO_MUX) += generic-gpio-mux.o
> >  obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
> >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> >  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> > diff --git a/drivers/gpu/drm/bridge/generic-gpio-mux.c b/drivers/gpu/drm/bridge/generic-gpio-mux.c
> > new file mode 100644
> > index 000000000000..ba08321dcc17
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/generic-gpio-mux.c
> > @@ -0,0 +1,306 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Generic gpio mux bridge driver
> > + *
> > + * Copyright 2016 Google LLC
> > + */
> > +
> > +
>
> One blank line is enough.
>
> > +#include <linux/gpio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_graph.h>
>
> Could you please sort these headers alphabetically ?
>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +struct gpio_display_mux {
> > +     struct device *dev;
> > +
> > +     struct gpio_desc *gpiod_detect;
> > +     int detect_irq;
> > +
> > +     struct drm_bridge bridge;
> > +
> > +     struct drm_bridge *next[2];
> > +};
> > +
> > +static inline struct gpio_display_mux *bridge_to_gpio_display_mux(
> > +             struct drm_bridge *bridge)
> > +{
> > +     return container_of(bridge, struct gpio_display_mux, bridge);
> > +}
> > +
> > +static irqreturn_t gpio_display_mux_det_threaded_handler(int unused, void *data)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux = data;
>
> gpio_display_mux is a long variable name. You can shorten it to mux here
> and below.
>
> > +     int active = gpiod_get_value(gpio_display_mux->gpiod_detect);
> > +
> > +     dev_dbg(gpio_display_mux->dev, "Interrupt %d!\n", active);
> > +
> > +     if (gpio_display_mux->bridge.dev)
> > +             drm_kms_helper_hotplug_event(gpio_display_mux->bridge.dev);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int gpio_display_mux_attach(struct drm_bridge *bridge)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +                     bridge_to_gpio_display_mux(bridge);
> > +     struct drm_bridge *next;
> > +     int i;
>
> i never takes negative values, you can make it an unsigned int.
>
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_display_mux->next); i++) {
> > +             next = gpio_display_mux->next[i];
> > +             if (next)
> > +                     next->encoder = bridge->encoder;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static bool gpio_display_mux_mode_fixup(struct drm_bridge *bridge,
> > +                             const struct drm_display_mode *mode,
> > +                             struct drm_display_mode *adjusted_mode)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     int active;
> > +     struct drm_bridge *next;
> > +
> > +     active = gpiod_get_value(gpio_display_mux->gpiod_detect);
>
> What if the value of the GPIO changes between, let's say, this operation
> and gpio_display_mux_mode_set() ? This doesn't seem very stable to me.
> DRM/KMS hasn't been designed to have the output routing configured
> externally without any control from the drivers.
>
We will fix it to store the gpio status in struct instead of reading
in each bridge functions. Only in irq handler function the gpio status
will be updated.
> > +     next = gpio_display_mux->next[active];
>
> This will crash if gpiod_get_value() returns an error. Same for the
> other functions below.
>
Will add check for this in irq handler function.
> > +
> > +     if (next && next->funcs->mode_fixup)
> > +             return next->funcs->mode_fixup(next, mode, adjusted_mode);
> > +     else
> > +             return true;
> > +}
> > +
> > +static void gpio_display_mux_mode_set(struct drm_bridge *bridge,
> > +                             struct drm_display_mode *mode,
> > +                             struct drm_display_mode *adjusted_mode)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     int active;
> > +     struct drm_bridge *next;
> > +
> > +     active = gpiod_get_value(gpio_display_mux->gpiod_detect);
> > +     next = gpio_display_mux->next[active];
> > +
> > +     if (next && next->funcs->mode_set)
> > +             next->funcs->mode_set(next, mode, adjusted_mode);
> > +}
> > +
> > +/**
>
> This isn't kerneldoc, the comment should start with /*. Same comment
> below.
>
> > + * Since this driver _reacts_ to mux changes, we need to make sure all
> > + * downstream bridges are pre-enabled.
>
> I'm afraid the problem scope seems bigger than I initially anticipated
> :-( We're in the hack territory here, and I think we need to search for
> a proper solution. We need to start with a detailed description of the
> hardware and the use cases.
>
We are considering making this mux driver mt8173 oak board specific,
since it seems that only this board have such design and we only have
this board for testing. If so, we also only need mode_fixup bridge
function. And the endpoint is anx7688 and hdmi connector. What do you
think?
> > + */
> > +static void gpio_display_mux_pre_enable(struct drm_bridge *bridge)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     struct drm_bridge *next;
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_display_mux->next); i++) {
> > +             next = gpio_display_mux->next[i];
> > +             if (next && next->funcs->pre_enable)
> > +                     next->funcs->pre_enable(next);
> > +     }
> > +}
> > +
> > +static void gpio_display_mux_post_disable(struct drm_bridge *bridge)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     struct drm_bridge *next;
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_display_mux->next); i++) {
> > +             next = gpio_display_mux->next[i];
> > +             if (next && next->funcs->post_disable)
> > +                     next->funcs->post_disable(next);
> > +     }
> > +}
> > +
> > +/**
> > + * In an ideal mux driver, only the currently selected bridge should be enabled.
> > + * For the sake of simplicity, we just just enable/disable all downstream
> > + * bridges at the same time.
> > + */
> > +static void gpio_display_mux_enable(struct drm_bridge *bridge)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     struct drm_bridge *next;
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_display_mux->next); i++) {
> > +             next = gpio_display_mux->next[i];
> > +             if (next && next->funcs->enable)
> > +                     next->funcs->enable(next);
> > +     }
> > +}
> > +
> > +static void gpio_display_mux_disable(struct drm_bridge *bridge)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux =
> > +             bridge_to_gpio_display_mux(bridge);
> > +     struct drm_bridge *next;
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(gpio_display_mux->next); i++) {
> > +             next = gpio_display_mux->next[i];
> > +             if (next && next->funcs->disable)
> > +                     next->funcs->disable(next);
> > +     }
> > +}
> > +
> > +static const struct drm_bridge_funcs gpio_display_mux_bridge_funcs = {
> > +     .attach = gpio_display_mux_attach,
> > +     .mode_fixup = gpio_display_mux_mode_fixup,
> > +     .disable = gpio_display_mux_disable,
> > +     .post_disable = gpio_display_mux_post_disable,
> > +     .mode_set = gpio_display_mux_mode_set,
> > +     .pre_enable = gpio_display_mux_pre_enable,
> > +     .enable = gpio_display_mux_enable,
> > +};
> > +
> > +static int gpio_display_mux_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct gpio_display_mux *gpio_display_mux;
> > +     struct device_node *port, *ep, *remote;
> > +     int ret;
> > +     u32 reg;
> > +
> > +     gpio_display_mux = devm_kzalloc(dev, sizeof(*gpio_display_mux),
> > +                                     GFP_KERNEL);
> > +     if (!gpio_display_mux)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, gpio_display_mux);
> > +     gpio_display_mux->dev = &pdev->dev;
> > +
> > +     gpio_display_mux->bridge.of_node = dev->of_node;
> > +
> > +     gpio_display_mux->gpiod_detect =
> > +             devm_gpiod_get(dev, "detect", GPIOD_IN);
> > +     if (IS_ERR(gpio_display_mux->gpiod_detect))
> > +             return PTR_ERR(gpio_display_mux->gpiod_detect);
> > +
> > +     gpio_display_mux->detect_irq =
> > +             gpiod_to_irq(gpio_display_mux->gpiod_detect);
> > +     if (gpio_display_mux->detect_irq < 0) {
> > +             dev_err(dev, "Failed to get output irq %d\n",
> > +                     gpio_display_mux->detect_irq);
> > +             return -ENODEV;
> > +     }
> > +
> > +     port = of_graph_get_port_by_id(dev->of_node, 1);
> > +     if (!port) {
> > +             dev_err(dev, "Missing output port node\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     for_each_child_of_node(port, ep) {
> > +             if (!ep->name || (of_node_cmp(ep->name, "endpoint") != 0)) {
> > +                     of_node_put(ep);
> > +                     continue;
> > +             }
> > +
> > +             if (of_property_read_u32(ep, "reg", &reg) < 0 ||
> > +                             reg >= ARRAY_SIZE(gpio_display_mux->next)) {
> > +                     dev_err(dev,
> > +                         "Missing/invalid reg property for endpoint %s\n",
> > +                             ep->full_name);
> > +                     of_node_put(ep);
> > +                     of_node_put(port);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             remote = of_graph_get_remote_port_parent(ep);
> > +             if (!remote) {
> > +                     dev_err(dev,
> > +                         "Missing connector/bridge node for endpoint %s\n",
> > +                             ep->full_name);
> > +                     of_node_put(ep);
> > +                     of_node_put(port);
> > +                     return -EINVAL;
> > +             }
> > +             of_node_put(ep);
> > +
> > +             if (of_device_is_compatible(remote, "hdmi-connector")) {
> > +                     of_node_put(remote);
> > +                     continue;
> > +             }
>
> This special case makes me think that something is wrong. I believe the
> connector driver from
> https://patchwork.freedesktop.org/patch/344477/?series=63328&rev=59
> could help.
>
Thanks for pointing this, we can remove the special case (hdmi) handling here.
> > +
> > +             gpio_display_mux->next[reg] = of_drm_find_bridge(remote);
>
> What if the connected device is a panel and not a bridge ?
>
If this is oak specific, then we don't need to handle panel case.
> > +             if (!gpio_display_mux->next[reg]) {
> > +                     dev_err(dev, "Waiting for external bridge %s\n",
> > +                             remote->name);
> > +                     of_node_put(remote);
> > +                     of_node_put(port);
> > +                     return -EPROBE_DEFER;
> > +             }
> > +
> > +             of_node_put(remote);
> > +     }
> > +     of_node_put(port);
> > +
> > +     gpio_display_mux->bridge.funcs = &gpio_display_mux_bridge_funcs;
> > +     drm_bridge_add(&gpio_display_mux->bridge);
> > +
> > +     ret = devm_request_threaded_irq(dev, gpio_display_mux->detect_irq,
> > +                             NULL,
> > +                             gpio_display_mux_det_threaded_handler,
> > +                             IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
> > +                                     IRQF_ONESHOT,
> > +                             "gpio-display-mux-det", gpio_display_mux);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to request MUX_DET threaded irq\n");
> > +             goto err_bridge_remove;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_bridge_remove:
> > +     drm_bridge_remove(&gpio_display_mux->bridge);
> > +
> > +     return ret;
> > +}
> > +
> > +static int gpio_display_mux_remove(struct platform_device *pdev)
> > +{
> > +     struct gpio_display_mux *gpio_display_mux = platform_get_drvdata(pdev);
> > +
> > +     drm_bridge_remove(&gpio_display_mux->bridge);
>
> If the GPIO IRQ is triggered here you'll have trouble. You need to
> disable the IRQ, or free it, before removing the bridge.
>
Will fix this. Thanks
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id gpio_display_mux_match[] = {
> > +     { .compatible = "gpio-display-mux", },
> > +     {},
> > +};
> > +
> > +struct platform_driver gpio_display_mux_driver = {
> > +     .probe = gpio_display_mux_probe,
> > +     .remove = gpio_display_mux_remove,
> > +     .driver = {
> > +             .name = "gpio-display-mux",
> > +             .of_match_table = gpio_display_mux_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(gpio_display_mux_driver);
> > +
> > +MODULE_DESCRIPTION("GPIO-controlled display mux");
> > +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> > +MODULE_LICENSE("GPL v2");
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
