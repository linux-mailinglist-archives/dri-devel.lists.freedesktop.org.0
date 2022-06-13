Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEA54A184
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 23:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070B010FB3B;
	Mon, 13 Jun 2022 21:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231E910FB43
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 21:31:59 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-30fdbe7467cso11740487b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AzIcFLo40szEo8NB3C26osOjMm8AR4JFYYSSCxGXUzk=;
 b=ShDtYk6H7kkrvQKbFaiZr/GGViq9bAOA5saB3I1LBZp4qhZdW32ELCGywORdkM2mWO
 teE5ojAN4Q/3RgiE+4vnzhZVMpFwV6APbDCXq971wovCl7VaQH8CFG0QmKmpOHKti3TT
 DtO5SSvAocag0HEsWkXcpTk7eq63Ep735cYnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AzIcFLo40szEo8NB3C26osOjMm8AR4JFYYSSCxGXUzk=;
 b=dNMs7MxP4lijrfYL1H1TRq/NEK2F17XECt7GzHwVSvHxUPwBTlvMRhgEAqzfrtIQ6B
 G4n/MZhMeTMjtJz3WkllXyR6LXyu/cJp/pFls7cXhpKTE4VOrLyJoVF9rHl/CY9lOGZk
 2IdKDlGeYuWJ2cSFz+mTmAiLOPrxcpPNivzKzRk17I1/X+pTVHldqmBYi4U0gTzeAfQu
 3Ah5gx75jQhKkP1mns3cJMqAG5J9Qjo7clFr02r/R0aEJLAlDERiH1RwCJsciqisRjRM
 yHPJjxpgw0NvdzPnV33wxU6Zofp/XQ5glu9uSoKth7kxYO11LDoowmUL7etJBOT4bmqt
 MUyA==
X-Gm-Message-State: AJIora87xIfxaH3FSCJs2TUxyZodqrFfOj+2gWr1riO6QcDsTcLEW266
 hfJn+noyvC2c2aSNqjYZMBUwVgwgrIkdOHE1IIohvA==
X-Google-Smtp-Source: AGRyM1vL0X6zp+Csj7ElCzV0tWeqEtHwHFfwLFaToB5K7vj9b8ikJ76sVZ8Lz1Z94W8ZMlFmQyrXFDjWyUpsBFwv9zM=
X-Received: by 2002:a0d:f882:0:b0:2f4:d830:6fd with SMTP id
 i124-20020a0df882000000b002f4d83006fdmr1965406ywf.387.1655155918117; Mon, 13
 Jun 2022 14:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-8-pmalani@chromium.org>
 <20220613205117.aewpbdjolxmys4vy@notapiano>
In-Reply-To: <20220613205117.aewpbdjolxmys4vy@notapiano>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 13 Jun 2022 14:31:47 -0700
Message-ID: <CACeCKafc22gEL5e6pBidNBSh71AAcghaCn=e0U65prPDkp_x=A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi N=C3=ADcolas,

On Mon, Jun 13, 2022 at 1:51 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi Prashant,
>
> On Thu, Jun 09, 2022 at 06:09:46PM +0000, Prashant Malani wrote:
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
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 58 +++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h | 13 +++++
> >  2 files changed, 71 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index d41a21103bd3..2c308d12fab2 100644
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
> > @@ -2582,9 +2583,66 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >  }
> >
> > +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> > +                                       enum typec_orientation orientat=
ion)
> > +{
> > +     if (orientation =3D=3D TYPEC_ORIENTATION_NORMAL) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
0,
> > +                               SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
1,
> > +                               SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> > +     } else if (orientation =3D=3D TYPEC_ORIENTATION_REVERSE) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
0,
> > +                               SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
1,
> > +                               SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> > +     }
> > +}
> > +
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_co=
nnected)
> > +             /* Both ports available, do nothing to retain the current=
 one. */
> > +             return;
> > +     else if (ctx->typec_ports[0].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORM=
AL);
> > +     else if (ctx->typec_ports[1].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVE=
RSE);
> > +}
> > +
> >  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> >                                struct typec_mux_state *state)
> >  {
> > +     struct anx7625_port_data *data =3D typec_mux_get_drvdata(mux);
> > +     struct anx7625_data *ctx =3D data->ctx;
> > +     struct device *dev =3D &ctx->client->dev;
> > +
> > +     bool old_dp_connected =3D (ctx->typec_ports[0].dp_connected ||
> > +                              ctx->typec_ports[1].dp_connected);
>
> Here you're assuming you have 2 switches. Given that this on its own does=
n't do
> anything, just move it after the
>
>         if (ctx->num_typec_switches =3D=3D 1)
>                 return 0;
>
> check.

Sure. I will fix this up in v3. Thanks!

>
> Thanks,
> N=C3=ADcolas
>
> > +     bool new_dp_connected;
> > +
> > +     if (ctx->num_typec_switches =3D=3D 1)
> > +             return 0;
> > +
> > +     dev_dbg(dev, "mux_set dp_connected: c0=3D%d, c1=3D%d\n",
> > +             ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_=
connected);
> > +
> > +     data->dp_connected =3D (state->alt && state->alt->svid =3D=3D USB=
_TYPEC_DP_SID &&
> > +                           state->alt->mode =3D=3D USB_TYPEC_DP_MODE);
> > +
> > +     new_dp_connected =3D (ctx->typec_ports[0].dp_connected ||
> > +                         ctx->typec_ports[1].dp_connected);
> > +
> > +     /* dp on, power on first */
> > +     if (!old_dp_connected && new_dp_connected)
> > +             pm_runtime_get_sync(dev);
> > +
> > +     anx7625_typec_two_ports_update(ctx);
> > +
> > +     /* dp off, power off last */
> > +     if (old_dp_connected && !new_dp_connected)
> > +             pm_runtime_put_sync(dev);
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/dr=
m/bridge/analogix/anx7625.h
> > index 76cfc64f7574..7d6c6fdf9a3a 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -55,6 +55,18 @@
> >  #define HPD_STATUS_CHANGE 0x80
> >  #define HPD_STATUS 0x80
> >
> > +#define TCPC_SWITCH_0 0xB4
> > +#define SW_SEL1_DPTX0_RX2 BIT(0)
> > +#define SW_SEL1_DPTX0_RX1 BIT(1)
> > +#define SW_SEL1_SSRX_RX2 BIT(4)
> > +#define SW_SEL1_SSRX_RX1 BIT(5)
> > +
> > +#define TCPC_SWITCH_1 0xB5
> > +#define SW_SEL2_DPTX1_TX2 BIT(0)
> > +#define SW_SEL2_DPTX1_TX1 BIT(1)
> > +#define SW_SEL2_SSTX_TX2 BIT(4)
> > +#define SW_SEL2_SSTX_TX1 BIT(5)
> > +
> >  /******** END of I2C Address 0x58 ********/
> >
> >  /***************************************************************/
> > @@ -444,6 +456,7 @@ struct anx7625_i2c_client {
> >  };
> >
> >  struct anx7625_port_data {
> > +     bool dp_connected;
> >       struct typec_mux_dev *typec_mux;
> >       struct anx7625_data *ctx;
> >  };
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
