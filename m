Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09132490575
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9806510E8BD;
	Mon, 17 Jan 2022 09:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69E110E83E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:53:52 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 128so9748796pfe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SSKpSccu4Y2OeCwNQpvwH730qVEYdzqCSA1kZfB/E0k=;
 b=Z/oa2KQAYfXsS4J9e4b6KXwyOY7ten1L2Z12NyuDUTq349ZYoJh9sjPcbo+uDDfU+Y
 OF5OwAYE8Gfki9IXLFKbGUI2ItHW2hokCCaAv2Wf6kP3l0fxpu5UQ3YKtbiAEXzrOFLR
 ma6gKbnOnMCcfTbKAqpZejOmE+j+GOv1qUMDItxhLJ2fEeXFabWvEIGMnq3UvJQ78qq4
 dVn+2l/7sCdZByGfUFJSi552X49ffLYD1NijhGCKpqhhjajA8GOJGDjkiFsHaYIyCUeG
 9P86hNFiW+h7bF+vHp0hi5mkCcVeXDNMVmUnJwY4B9mZknaxDOf3VXmrrH+jYOj1xLvw
 UswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SSKpSccu4Y2OeCwNQpvwH730qVEYdzqCSA1kZfB/E0k=;
 b=g/sAb3YvAmHgnzHNDiZI3h9QosVABC2/e/NkEMpGUazB7kMCwDFKRsvGtTZ7SHKOmE
 CrY1NlsPwH+TG8SWlWNGgXjqRH9w35gg2YPeRs+xKIYXGlYdyQX9eMp/UZFWCkAqbTVX
 XwyDMksGPLLi4DYGw8Dt2f+PZwKs+p4wld4VQHyocqurjMOrLk8CtR8Ge6iXlxoC1Qse
 L+Dp6O0DqNf3AU5rJmm9se8NA7R1V+/SQMDFXW9+duadYj4KvjR2SDj9xWFoXe1fZTW8
 O5OF9sNCXZwtkwWR9z8iNbJplCACZlCNUalGSYyQfomtcReYFAGTV80+PfufEKby1hrL
 KvCw==
X-Gm-Message-State: AOAM532Crm7vX10vP0UPInx/YzmC5yiHE0RCzXJwvATBPaPzljs1JOBb
 vA3gJfoUU5mZ3aOcZv53f5vPFAxctbqhYSWuKfDTo2ZocpX3cQ==
X-Google-Smtp-Source: ABdhPJwyDSIAjd9Ty7kY9D2ZyQi3gixt1DtnSw//W3lF+q90TnDCGlOA0UhKNEMVPjivfSydE7jyz35pQ/+/c5v+iyc=
X-Received: by 2002:a63:86c1:: with SMTP id
 x184mr17545851pgd.324.1642413232295; 
 Mon, 17 Jan 2022 01:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
In-Reply-To: <20220113144305.1074389-1-narmstrong@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 10:53:41 +0100
Message-ID: <CAG3jFyuckF_QC80PCfvjdmmUbxmXXRh8zNFE_V880EaaqY631g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Neil,

On Thu, 13 Jan 2022 at 15:43, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds support for DRM_BRIDGE_ATTACH_NO_CONNECTOR by adding the
> bridge get_edid() and detect() callbacks after refactoring the connector
> get_modes() and connector_detect() callbacks.
>
> In order to keep the bridge working, extra code in get_modes() has been
> moved to more logical places.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 129 ++++++++++++++++++++++++-------
>  1 file changed, 99 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 89558e581530..65549fbfdc87 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -166,10 +166,12 @@ struct sii902x {
>         struct i2c_client *i2c;
>         struct regmap *regmap;
>         struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
>         struct drm_connector connector;
>         struct gpio_desc *reset_gpio;
>         struct i2c_mux_core *i2cmux;
>         struct regulator_bulk_data supplies[2];
> +       bool sink_is_hdmi;
>         /*
>          * Mutex protects audio and video functions from interfering
>          * each other, by keeping their i2c command sequences atomic.
> @@ -245,10 +247,8 @@ static void sii902x_reset(struct sii902x *sii902x)
>         gpiod_set_value(sii902x->reset_gpio, 0);
>  }
>
> -static enum drm_connector_status
> -sii902x_connector_detect(struct drm_connector *connector, bool force)
> +static enum drm_connector_status sii902x_detect(struct sii902x *sii902x)
>  {
> -       struct sii902x *sii902x = connector_to_sii902x(connector);
>         unsigned int status;
>
>         mutex_lock(&sii902x->mutex);
> @@ -261,6 +261,14 @@ sii902x_connector_detect(struct drm_connector *connector, bool force)
>                connector_status_connected : connector_status_disconnected;
>  }
>
> +static enum drm_connector_status
> +sii902x_connector_detect(struct drm_connector *connector, bool force)
> +{
> +       struct sii902x *sii902x = connector_to_sii902x(connector);
> +
> +       return sii902x_detect(sii902x);
> +}
> +
>  static const struct drm_connector_funcs sii902x_connector_funcs = {
>         .detect = sii902x_connector_detect,
>         .fill_modes = drm_helper_probe_single_connector_modes,
> @@ -270,42 +278,40 @@ static const struct drm_connector_funcs sii902x_connector_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static int sii902x_get_modes(struct drm_connector *connector)
> +static struct edid *sii902x_get_edid(struct sii902x *sii902x,
> +                                    struct drm_connector *connector)
>  {
> -       struct sii902x *sii902x = connector_to_sii902x(connector);
> -       u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> -       u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
>         struct edid *edid;
> -       int num = 0, ret;
>
>         mutex_lock(&sii902x->mutex);
>
>         edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
> -       drm_connector_update_edid_property(connector, edid);
>         if (edid) {
>                 if (drm_detect_hdmi_monitor(edid))
> -                       output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
> -
> -               num = drm_add_edid_modes(connector, edid);
> -               kfree(edid);
> +                       sii902x->sink_is_hdmi = true;
> +               else
> +                       sii902x->sink_is_hdmi = false;
>         }
>
> -       ret = drm_display_info_set_bus_formats(&connector->display_info,
> -                                              &bus_format, 1);
> -       if (ret)
> -               goto error_out;
> +       mutex_unlock(&sii902x->mutex);
>
> -       ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
> -                                SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
> -       if (ret)
> -               goto error_out;
> +       return edid;
> +}
>
> -       ret = num;
> +static int sii902x_get_modes(struct drm_connector *connector)
> +{
> +       struct sii902x *sii902x = connector_to_sii902x(connector);
> +       struct edid *edid;
> +       int num = 0;
>
> -error_out:
> -       mutex_unlock(&sii902x->mutex);
> +       edid = sii902x_get_edid(sii902x, connector);
> +       drm_connector_update_edid_property(connector, edid);
> +       if (edid) {
> +               num = drm_add_edid_modes(connector, edid);
> +               kfree(edid);
> +       }
>
> -       return ret;
> +       return num;
>  }
>
>  static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
> @@ -354,12 +360,16 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
>                                     const struct drm_display_mode *adj)
>  {
>         struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +       u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
>         struct regmap *regmap = sii902x->regmap;
>         u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
>         struct hdmi_avi_infoframe frame;
>         u16 pixel_clock_10kHz = adj->clock / 10;
>         int ret;
>
> +       if (sii902x->sink_is_hdmi)
> +               output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
> +
>         buf[0] = pixel_clock_10kHz & 0xff;
>         buf[1] = pixel_clock_10kHz >> 8;
>         buf[2] = drm_mode_vrefresh(adj);
> @@ -375,6 +385,11 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
>
>         mutex_lock(&sii902x->mutex);
>
> +       ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
> +                                SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
> +       if (ret)
> +               goto out;
> +
>         ret = regmap_bulk_write(regmap, SII902X_TPI_VIDEO_DATA, buf, 10);
>         if (ret)
>                 goto out;
> @@ -405,13 +420,13 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
>                                  enum drm_bridge_attach_flags flags)
>  {
>         struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +       u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>         struct drm_device *drm = bridge->dev;
>         int ret;
>
> -       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -               DRM_ERROR("Fix bridge driver to make connector optional!");
> -               return -EINVAL;
> -       }
> +       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +               return drm_bridge_attach(bridge->encoder, sii902x->next_bridge,
> +                                        bridge, flags);
>
>         drm_connector_helper_add(&sii902x->connector,
>                                  &sii902x_connector_helper_funcs);
> @@ -433,16 +448,38 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
>         else
>                 sii902x->connector.polled = DRM_CONNECTOR_POLL_CONNECT;
>
> +       ret = drm_display_info_set_bus_formats(&sii902x->connector.display_info,
> +                                              &bus_format, 1);
> +       if (ret)
> +               return ret;
> +
>         drm_connector_attach_encoder(&sii902x->connector, bridge->encoder);
>
>         return 0;
>  }
>
> +static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +
> +       return sii902x_detect(sii902x);
> +}
> +
> +static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
> +                                           struct drm_connector *connector)
> +{
> +       struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +
> +       return sii902x_get_edid(sii902x, connector);
> +}
> +
>  static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>         .attach = sii902x_bridge_attach,
>         .mode_set = sii902x_bridge_mode_set,
>         .disable = sii902x_bridge_disable,
>         .enable = sii902x_bridge_enable,
> +       .detect = sii902x_bridge_detect,
> +       .get_edid = sii902x_bridge_get_edid,
>  };
>
>  static int sii902x_mute(struct sii902x *sii902x, bool mute)
> @@ -829,8 +866,12 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
>
>         mutex_unlock(&sii902x->mutex);
>
> -       if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
> +       if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev) {
>                 drm_helper_hpd_irq_event(sii902x->bridge.dev);
> +               drm_bridge_hpd_notify(&sii902x->bridge, (status & SII902X_PLUGGED_STATUS)
> +                                                               ? connector_status_connected
> +                                                               : connector_status_disconnected);
> +       }
>
>         return IRQ_HANDLED;
>  }
> @@ -1001,6 +1042,11 @@ static int sii902x_init(struct sii902x *sii902x)
>         sii902x->bridge.funcs = &sii902x_bridge_funcs;
>         sii902x->bridge.of_node = dev->of_node;
>         sii902x->bridge.timings = &default_sii902x_timings;
> +       sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +
> +       if (sii902x->i2c->irq > 0)
> +               sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
>         drm_bridge_add(&sii902x->bridge);
>
>         sii902x_audio_codec_init(sii902x, dev);
> @@ -1022,6 +1068,7 @@ static int sii902x_probe(struct i2c_client *client,
>                          const struct i2c_device_id *id)
>  {
>         struct device *dev = &client->dev;
> +       struct device_node *endpoint;
>         struct sii902x *sii902x;
>         int ret;
>
> @@ -1049,6 +1096,28 @@ static int sii902x_probe(struct i2c_client *client,
>                 return PTR_ERR(sii902x->reset_gpio);
>         }
>
> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> +       if (endpoint) {
> +               struct device_node *remote = of_graph_get_remote_port_parent(endpoint);
> +
> +               of_node_put(endpoint);
> +               if (!remote) {
> +                       dev_err(dev, "Endpoint in port@1 unconnected\n");
> +                       return -ENODEV;
> +               }
> +
> +               if (!of_device_is_available(remote)) {
> +                       dev_err(dev, "port@1 remote device is disabled\n");
> +                       of_node_put(remote);
> +                       return -ENODEV;
> +               }
> +
> +               sii902x->next_bridge = of_drm_find_bridge(remote);
> +               of_node_put(remote);
> +               if (!sii902x->next_bridge)
> +                       return -EPROBE_DEFER;
> +       }
> +
>         mutex_init(&sii902x->mutex);
>
>         sii902x->supplies[0].supply = "iovcc";

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
