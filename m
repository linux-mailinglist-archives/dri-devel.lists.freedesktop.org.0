Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A3255EE14
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 21:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61C1112A99;
	Tue, 28 Jun 2022 19:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF65112A99
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 19:48:24 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id r3so24042282ybr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHXkpPXpFGHDlkGftgH4HXkL2OlNnjfvXug8uoS7Fl0=;
 b=l0E1A0S5TJAdUvK/62+NNXFIajM3Sz1ign/Kl1cu5JyW6CIaA3WPeq0slPouEW5RQV
 /8p62aOOxBZxOGw6Dv1T6u05mzKkylM378WT8lA141aXNqaarFcQ5Be6fPlHefoVMPO0
 0478dk+Se/fCVhA/h3iNGvq3rRizWBN2g8Pjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHXkpPXpFGHDlkGftgH4HXkL2OlNnjfvXug8uoS7Fl0=;
 b=RCe0XKOQu09CDZnC5ESDir3RRVczX5ezhT/O3grs1wpJ+cwfv4QEN6XYnTwkX9b6ct
 fYXdGPdCu+jMT11fxs4I7n4B17NkmT4mm7FoGESEsWtKWKqOpRAYw5X7vO7z9GVyvWlX
 D/kbeqYFwjdwB8ez9RbsDe1ju9VAsuc3AyB9xRO/7VDC76mOCRIjcZ3iRQ48Jv9Yzwf5
 mlJQvDKNJ84d9Usw4P8dNJiV/+KRYRQLQIyYD6Hhufr5NShvMqjFVj+kaFGA1J0ar0L8
 /S6x3Z1xb73gxl7QpCtxcyUGGfmjKZGc+gqkM/RCcZ9+skC9QDFZwCg7dTy+Nsvws5xg
 0nmA==
X-Gm-Message-State: AJIora8hgSWiFkHx06+4b07wT+WSTiQLnUrKmU2mn+H8msOu7kjpe9g0
 JCvRUgYqtiK7WG+UZVEKAO2l6bAYVWwCUoUxMG/nqA==
X-Google-Smtp-Source: AGRyM1srjCp28XBoQQO/p2NofxTCtxHZShc55UMxj4amOOUEmonQqY88CRzmE+TqGnV1wCssUZZtegMQ3CbuPE4Mbsk=
X-Received: by 2002:a25:bcc:0:b0:66c:b80a:2d5 with SMTP id
 195-20020a250bcc000000b0066cb80a02d5mr15517865ybl.196.1656445703313; 
 Tue, 28 Jun 2022 12:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
In-Reply-To: <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 28 Jun 2022 12:48:11 -0700
Message-ID: <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Stephen Boyd <swboyd@chromium.org>
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 12:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-22 10:34:34)
> > From: Pin-Yen Lin <treapking@chromium.org>
> >
> > Add the callback function when the driver receives state
> > changes of the Type-C port. The callback function configures the
> > crosspoint switch of the anx7625 bridge chip, which can change the
> > output pins of the signals according to the port state.
>
> Can this be combined with the previous two patches? They really don't
> stand alone because the previous two patches are adding stubs that are
> filled out later.

I split it out for ease of reviewing, but sure, I will combine it if
there is a v6.

>
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index bd21f159b973..5992fc8beeeb 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <linux/usb/typec_dp.h>
> >  #include <linux/usb/typec_mux.h>
> >  #include <linux/workqueue.h>
> >
> > @@ -2582,9 +2583,64 @@ static void anx7625_runtime_disable(void *data)
> >         pm_runtime_disable(data);
> >  }
> >
> > +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> > +                                         enum typec_orientation orientation)
> > +{
> > +       if (orientation == TYPEC_ORIENTATION_NORMAL) {
> > +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> > +                                 SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> > +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> > +                                 SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> > +       } else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> > +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> > +                                 SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> > +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> > +                                 SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> > +       }
> > +}
> > +
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +       if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> > +               /* Both ports available, do nothing to retain the current one. */
> > +               return;
> > +       else if (ctx->typec_ports[0].dp_connected)
> > +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> > +       else if (ctx->typec_ports[1].dp_connected)
> > +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> > +}
> > +
> >  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> >                                  struct typec_mux_state *state)
> >  {
> > +       struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
> > +       struct anx7625_data *ctx = data->ctx;
> > +       struct device *dev = &ctx->client->dev;
> > +       bool new_dp_connected, old_dp_connected;
> > +
> > +       if (ctx->num_typec_switches == 1)
>
> How do we handle the case where the usb-c-connector is directly
> connected to the RX1/TX1 and RX2/TX2 pins? This device would be an
> orientation (normal/reverse) and mode switch (usb/dp) in that scenario,
> but this code is written in a way that the orientation switch isn't
> going to flip the crosspoint switch for the different pin assignments.

If all 4 SS lanes are connected to 1 usb-c-connector; there would be
just 1 "typec-switch" node.
In that case, the DT would only specify it as an "orientation-switch"
and register
an orientation-switch with the Type-C framework. The orientation switch would
pretty much do what the mode-switch callback does here (configuring
the crosspoint
switch).
One could also register a "mode-switch" there but it wouldn't do
anything (all 4 lanes are already
connected so there is nothing to re-route in the crosspoint switch).
Hence the above "if" check.

Unfortunately, I don't have hardware which connects all 4 SS lanes
from 1 Type-C port
to the anx7625, so I didn't add the orientation switch handling to the
driver (since I have no way of verifying it).

Regarding DP alt-mode pin assignments : I think anx7625 will only support Pin D
(only 2 lane DP, no 4 lane DP).

BR,

-Prashant
