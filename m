Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98254ACE9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 11:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA1B10FC0D;
	Tue, 14 Jun 2022 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F30B10FC0D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:08:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id e5so4298405wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhvvxqBDc4O6cqtxNWaREqrfN92rGnha8HhGfNJEYIY=;
 b=douVYUlsdf+Xh3MuzIfeY0X8Ce+uwGOB4VX1fszrw5WlSXQfxYVaK7H0LCFX+l06al
 G5Pt7vxmjI/oNJX86GkWkmt9jVl9oIs5040FZFsPravjzgf3NF8nQgvJXGT86lajFlGA
 a5M9bPfdwTcVtYWDnAAyvWPcyA0DlWZOO4P5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhvvxqBDc4O6cqtxNWaREqrfN92rGnha8HhGfNJEYIY=;
 b=et8kEDHLE7YzN234IkqMRMptJtbb5NgTyZilUoyxU6UShXLkxpsrJdbjNujdXeGbv1
 rTP7GxoJ+bFrd7cJ9d5nwN/hRay/X/r1OfVbQridnQn401L+kW9ajDOGna3LwSRkjckB
 G9WcGq9+f/yQwmVrwbdrVn835SJPn/0jt32Tigudp+3/jO4egg78eu7AI7oGRdcbn4jM
 s/DGgbbBWMO9+TDq99IYoAq/vFm9JWGFrgHIVeuO+Z5HBFK1AEBIsJk7W03nWgBvgDPL
 4F96zgeou1ZrnBawZVCTtS4ijX0tg/8mJOjIUA+42NFImlzmhkFMAugO5e7vXgDdp6FN
 gyqw==
X-Gm-Message-State: AOAM530R+6ocph47Wxk4Mtiqw2zqGIti6ujvRYgsC1seDX2sBDsiP/Sa
 4qqHZtd/Ggb8nPtRgmSqK2Gt+FF7rljUNaVH4IJQ0Q==
X-Google-Smtp-Source: ABdhPJzczygOemileGdbX/PhVogBffmdzEt2dLPD4YNk/wLgn4+GD2v0/Oo2U5JXPZWuJzgBaJNoBRQP9hjSU6+IahI=
X-Received: by 2002:a05:600c:3cd:b0:39c:880e:dc7b with SMTP id
 z13-20020a05600c03cd00b0039c880edc7bmr2968699wmd.168.1655197691993; Tue, 14
 Jun 2022 02:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-8-pmalani@chromium.org>
 <1191703c-efa5-7fe6-7dd0-e3e786b58411@collabora.com>
In-Reply-To: <1191703c-efa5-7fe6-7dd0-e3e786b58411@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 14 Jun 2022 17:08:00 +0800
Message-ID: <CAEXTbpfh3aKS8DZ9T0KPNLfWJ4EsLxcJpP8aLYU-iQYC1N4sRQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
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
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,


On Tue, Jun 14, 2022 at 4:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/06/22 20:09, Prashant Malani ha scritto:
> > From: Pin-Yen Lin <treapking@chromium.org>
> >
> > Add the callback function when the driver receives state
> > changes of the Type-C port. The callback function configures the
> > crosspoint switch of the anx7625 bridge chip, which can change the
> > output pins of the signals according to the port state.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v2:
> > - No changes.
> >
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 58 +++++++++++++++++++++++
> >   drivers/gpu/drm/bridge/analogix/anx7625.h | 13 +++++
> >   2 files changed, 71 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index d41a21103bd3..2c308d12fab2 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> > +#include <linux/usb/typec_dp.h>
> >   #include <linux/usb/typec_mux.h>
> >   #include <linux/workqueue.h>
> >
> > @@ -2582,9 +2583,66 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >   }
> >
> > +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> > +                                       enum typec_orientation orientation)
> > +{
> > +     if (orientation == TYPEC_ORIENTATION_NORMAL) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> > +                               SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> > +                               SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> > +     } else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> > +                               SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> > +                               SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> > +     }
> > +}
> > +
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> > +             /* Both ports available, do nothing to retain the current one. */
> > +             return;
> > +     else if (ctx->typec_ports[0].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> > +     else if (ctx->typec_ports[1].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> > +}
> > +
> >   static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> >                                struct typec_mux_state *state)
> >   {
> > +     struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
> > +     struct anx7625_data *ctx = data->ctx;
> > +     struct device *dev = &ctx->client->dev;
> > +
> > +     bool old_dp_connected = (ctx->typec_ports[0].dp_connected ||
> > +                              ctx->typec_ports[1].dp_connected);
>
> So the old connection state is "either port0 or port1 are currently connected"...
>
> > +     bool new_dp_connected;
> > +
> > +     if (ctx->num_typec_switches == 1)
> > +             return 0;
> > +
> > +     dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
> > +             ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_connected);
> > +
> > +     data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> > +                           state->alt->mode == USB_TYPEC_DP_MODE);
> > + > + new_dp_connected = (ctx->typec_ports[0].dp_connected ||
> > +                         ctx->typec_ports[1].dp_connected);
>
> ...and the new connection state is the same as the old one, because I don't see
> anything that could ever modify it in this function's flow, until reaching this
> assignment.

The typec mux driver data (`struct anx7625_port_data *data =
typec_mux_get_drvdata(mux)`) is set to one of the
`ctx->typec_ports[*]` in `anx7625_register_mode_switch` (see patch 6
of this series).

So, the `data->dp_connected = ...` assignment may change the new
connection state.

Best regards,
Pin-yen

>
> > +
> > +     /* dp on, power on first */
> > +     if (!old_dp_connected && new_dp_connected)
> > +             pm_runtime_get_sync(dev);
>
> ...so that will never happen...
>
> > +
> > +     anx7625_typec_two_ports_update(ctx);
> > +
> > +     /* dp off, power off last */
> > +     if (old_dp_connected && !new_dp_connected)
> > +             pm_runtime_put_sync(dev);
>
> ...and same here.
>
> Regards,
> Angelo
