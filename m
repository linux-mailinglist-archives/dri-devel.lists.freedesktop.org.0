Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA254B6F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC4211293A;
	Tue, 14 Jun 2022 16:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA34611293D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:57:41 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id k2so16176496ybj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F6g97R91sjtVG6ei6JULqw4mFypOAKmb8KKUSEZQlEM=;
 b=OhorWc2mjBDno2pDG8ZqawT9/vJ1MCCttW7q1lpoz7gdDgLYrJO6STISprKObl3IED
 V3HLrokuHjWh5byp4w9ZoEsXDb/AF69KJt0nEdSktT7jcbnUUmVYFVjf4E92yn15pJLR
 bncnJl6LfB4Py3RYJgpdu03zYHSoBIp1zBwT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F6g97R91sjtVG6ei6JULqw4mFypOAKmb8KKUSEZQlEM=;
 b=sQSrfI7u4S93qixMact1k8NmAx2RTcE0lqsfhHhMRI44mZDM64pEuJhfWyLXiog9Qg
 czKGwU6hc+ywdjM+P9svVNsmQ7OWSLQtqAnKQTPbwu9/l8UG4/NgE++PBda4swhqqNE2
 4+1o5lPDM9zYIQNzgj5s1Tifxmnlzfn8uV8go6A6WGzX2MNqA0w0Wu8a5ssxMZErQ4+Z
 mNdpCCrfAjio38EF1yBB42jVG5uyhskAYhBJI8ckQZK+MYwemNmnAMIdSrV8pQVJSmQ8
 egRvp2+Jkz0J0mjwVJNlb+u50DyjuE2Up1RWjSfFRaT+/Q35+kosPDh0gr0/1xHco8Rc
 laIA==
X-Gm-Message-State: AJIora9zEF4SnsgJnlrjDTbWLA3bTv2I8xGtcPR+sjyAVAYT7OLCTgpd
 +8VftzkIpv/ezMVoZNV1oJReulFm9ebJc613eHgYFQ==
X-Google-Smtp-Source: AGRyM1tBFSQKwmiU3taZuWEgZ831zxUtkuGEWQfjxumQkpHwHDXWgjfEd+gTnhSaXwdtdDj3Em9Aee5szsA1eFQ4c8U=
X-Received: by 2002:a25:67c2:0:b0:65d:555b:8f59 with SMTP id
 b185-20020a2567c2000000b0065d555b8f59mr5855580ybc.240.1655225860885; Tue, 14
 Jun 2022 09:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-7-pmalani@chromium.org>
 <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
In-Reply-To: <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 14 Jun 2022 09:57:29 -0700
Message-ID: <CACeCKaexczFCja_ndndb_A58yZYQ98rTtgY4vHMknENTLxBPPA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/bridge: anx7625: Register Type-C mode switches
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 1:18 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/06/22 20:09, Prashant Malani ha scritto:
> > When the DT node has "switches" available, register a Type-C mode-switch
> > for each listed "switch". This allows the driver to receive state
> > information about what operating mode a Type-C port and its connected
> > peripherals are in, as well as status information (like VDOs) related to
> > that state.
> >
> > The callback function is currently a stub, but subsequent patches will
> > implement the required functionality.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v2:
> > - No changes.
> >
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++++++++++++++++
> >   drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
> >   2 files changed, 79 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 07ed44c6b839..d41a21103bd3 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> > +#include <linux/usb/typec_mux.h>
> >   #include <linux/workqueue.h>
> >
> >   #include <linux/of_gpio.h>
> > @@ -2581,9 +2582,59 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >   }
> >
> > +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> > +                              struct typec_mux_state *state)
> > +{
> > +     return 0;
> > +}
> > +
> > +static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
> > +                                     struct anx7625_data *ctx)
> > +{
> > +     struct anx7625_port_data *port_data;
> > +     struct typec_mux_desc mux_desc = {};
> > +     char name[32];
> > +     u32 port_num;
> > +     int ret;
> > +
> > +     ret = of_property_read_u32(node, "reg", &port_num);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (port_num >= ctx->num_typec_switches) {
> > +             dev_err(dev, "Invalid port number specified: %d\n", port_num);
> > +             return -EINVAL;
> > +     }
> > +
> > +     port_data = &ctx->typec_ports[port_num];
> > +     port_data->ctx = ctx;
> > +     mux_desc.fwnode = &node->fwnode;
> > +     mux_desc.drvdata = port_data;
> > +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> > +     mux_desc.name = name;
> > +     mux_desc.set = anx7625_typec_mux_set;
> > +
> > +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret = PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
> > +     }
>
> Please return 0 at the end of this function.
>
>         if (IS_ERR(....)) {
>                 ......code......
>                 return ret;
>         }
>
>         return 0;
> }

May I ask why? We're not missing any return paths. I would rather we
keep it as is (which has the valid return value).

>
> > +
> > +     return ret;
> > +}
> > +
> > +static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < ctx->num_typec_switches; i++)
> > +             typec_mux_unregister(ctx->typec_ports[i].typec_mux);
> > +}
> > +
> >   static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
> >   {
> >       struct device_node *of = NULL;
> > +     struct device_node *sw;
> >       int ret = 0;
> >
> >       of = of_get_child_by_name(device->of_node, "switches");
> > @@ -2594,6 +2645,26 @@ static int anx7625_register_typec_switches(struct device *device, struct anx7625
> >       if (ctx->num_typec_switches <= 0)
> >               return -ENODEV;
> >
> > +     ctx->typec_ports = devm_kzalloc(device,
> > +                                     ctx->num_typec_switches * sizeof(struct anx7625_port_data),
> > +                                     GFP_KERNEL);
> > +     if (!ctx->typec_ports)
> > +             return -ENOMEM;
> > +
> > +     /* Register switches for each connector. */
> > +     for_each_available_child_of_node(of, sw) {
> > +             if (!of_property_read_bool(sw, "mode-switch"))
> > +                     continue;
> > +             ret = anx7625_register_mode_switch(device, sw, ctx);
> > +             if (ret) {
> > +                     dev_err(device, "Failed to register mode switch: %d\n", ret);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (ret)
> > +             anx7625_unregister_typec_switches(ctx);
> > +
> >       return ret;
> >   }
> >
> > @@ -2759,6 +2830,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> >
> >       drm_bridge_remove(&platform->bridge);
> >
> > +     anx7625_unregister_typec_switches(platform);
> > +
> >       if (platform->pdata.intp_irq)
> >               destroy_workqueue(platform->workqueue);
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index d5cbca708842..76cfc64f7574 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -443,6 +443,11 @@ struct anx7625_i2c_client {
> >       struct i2c_client *tcpc_client;
> >   };
> >
> > +struct anx7625_port_data {
> > +     struct typec_mux_dev *typec_mux;
> > +     struct anx7625_data *ctx;
> > +};
> > +
> >   struct anx7625_data {
> >       struct anx7625_platform_data pdata;
> >       struct platform_device *audio_pdev;
> > @@ -474,6 +479,7 @@ struct anx7625_data {
> >       struct mipi_dsi_device *dsi;
> >       struct drm_dp_aux aux;
> >       int num_typec_switches;
> > +     struct anx7625_port_data *typec_ports;
> >   };
> >
> >   #endif  /* __ANX7625_H__ */
>
