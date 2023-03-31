Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB56D19A1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FFB10E300;
	Fri, 31 Mar 2023 08:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCB010E300
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:18:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h11so11150278ild.11
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680250707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15rDcrIff0PTvVCq0tQDwJDEOeJZgLwD9Ed2/S9KM9c=;
 b=CsrdmNsZwi1KGRE7i+x82HeVKBUi7m/OpmIM3Th+keNveYpbwuAO0CD177mDO3OcgC
 EnvFU72NaWpiWT94z3NnDqBNGQpW0p9cWPMIWbcZCHP7vD5/iSZEAjyI+3X4oo4zYzRU
 GtHGkepUcXXaaYU0H2SO0r8Xou2lVWX0vr668=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680250707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15rDcrIff0PTvVCq0tQDwJDEOeJZgLwD9Ed2/S9KM9c=;
 b=50pZ0FYPkjGi9iDIYPIXarsyR4FFUorco35OU2hOHxRPJLorIcHF+hzbVdUUDAf60s
 02Ws84nwBvXpPmjuHVkVe8ejkroIRsQyu23V7MzWLt9PpRAncdGqF+LH0iC0yQi/a3wt
 2TrnMKRNMJBY8L4ERrt0cpIf7MaBCWJdD+CAOXfq8ERCSWFNHeebCOv6xZCaIyBp0ug8
 Ue2naRkVGEOBpGlUnbJCy/taIRYPp8oH2dC+KZZkKY6Za0MWCwK1x7DoHUG2usbZdXSM
 N8pGZZDO26Gt2v857QDqplIlmuEUS5wnpl1yk71W2DC2/LdKE/QZoeWD+Q8o16otB/0u
 jfeA==
X-Gm-Message-State: AAQBX9cRdhufbgxHS/OwnOxEMxQQ3kg2BMd4ym+XJb1eVtdPyadPUkgV
 j/vLZItm6jaqAyz8o1aMPFFSMJbvV9DXYzd6QRhtew==
X-Google-Smtp-Source: AKy350Z3p01NgJ4vdkP75NR5+P4+C3oTh8ECvyef/jQWRCRu0D9MDV65Ai5oehSlp4QQBqxR3znKFnqONmw9lPWNA8Y=
X-Received: by 2002:a92:c54b:0:b0:316:f93f:6f83 with SMTP id
 a11-20020a92c54b000000b00316f93f6f83mr13750083ilj.6.1680250707090; Fri, 31
 Mar 2023 01:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-8-treapking@chromium.org>
 <ZBrjZj0VL20y1MUC@smile.fi.intel.com>
In-Reply-To: <ZBrjZj0VL20y1MUC@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 31 Mar 2023 17:18:16 +0900
Message-ID: <CAEXTbpd1kQWbJazRSvLabH26teiWvo75+rKOTL0A9Jm3eXeACQ@mail.gmail.com>
Subject: Re: [PATCH v14 07/10] drm/bridge: anx7625: Register Type C mode
 switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Wed, Mar 22, 2023 at 8:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 22, 2023 at 06:46:36PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant ports are available in Device Tree. Configure the crosspoint
> > switch based on the entered alternate mode for a specific Type-C
> > connector.
> >
> > Crosspoint switch can also be used for switching the output signal for
> > different orientations of a single USB Type-C connector, but the
> > orientation switch is not implemented yet. A TODO is added for this.
>
> ...
>
> > +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> > +                              struct typec_mux_state *state)
> > +{
> > +     struct drm_dp_typec_port_data *port =3D typec_mux_get_drvdata(mux=
);
> > +     struct anx7625_data *ctx =3D port->data;
> > +     struct device *dev =3D ctx->dev;
> > +     struct drm_dp_typec_switch_desc switch_desc =3D ctx->switch_desc;
> > +     bool new_dp_connected, old_dp_connected;
> > +
> > +     if (switch_desc.num_typec_switches =3D=3D 1)
> > +             return 0;
>
> > +     wait_for_completion(&ctx->mux_register);
>
> How do we guarantee this won't become an infinite waiting?
> Perhaps a comment explaining that?
>
> > +     old_dp_connected =3D ctx->port_data[0].dp_connected ||
> > +                        ctx->port_data[1].dp_connected;
> > +
> > +     ctx->port_data[port->port_num].dp_connected =3D
> > +             state->alt &&
> > +             state->alt->svid =3D=3D USB_TYPEC_DP_SID &&
> > +             state->alt->mode =3D=3D USB_TYPEC_DP_MODE;
> > +
> > +     dev_dbg(dev, "mux_set dp_connected: c0=3D%d, c1=3D%d\n",
> > +             ctx->port_data[0].dp_connected, ctx->port_data[1].dp_conn=
ected);
> > +
> > +     new_dp_connected =3D ctx->port_data[0].dp_connected ||
> > +                        ctx->port_data[1].dp_connected;
> > +
> > +     /* DP on, power on first */
> > +     if (!old_dp_connected && new_dp_connected)
> > +             pm_runtime_get_sync(dev);
> > +
> > +     anx7625_typec_two_ports_update(ctx);
> > +
> > +     /* DP off, power off last */
> > +     if (old_dp_connected && !new_dp_connected)
> > +             pm_runtime_put_sync(dev);
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     struct device_node *port_node =3D of_graph_get_port_by_id(dev->of=
_node, 1);
>
> You use fwnode below, so why not fwnode_graph_...(dev_fwnode(dev), ...) ?

There is no existing helper like `fwnode_graph_get_port_by_id`, so
using of_graph variant is easier here. Should I add a
`fwnode_graph_get_port_by_id` helper for this?
>
> > +     struct drm_dp_typec_switch_desc *switch_desc =3D &ctx->switch_des=
c;
> > +     int ret;
> > +     u32 dp_lanes[4];
> > +     unsigned int i, num_lanes;
> > +
> > +     /*
> > +      * Currently, only mode switch is implemented.
> > +      * TODO: Implement Type-C orientation switch for anx7625.
> > +      */
> > +     ret =3D drm_dp_register_typec_switches(dev, &port_node->fwnode,
> > +                                          &ctx->switch_desc, ctx,
> > +                                          anx7625_typec_mux_set);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctx->port_data =3D devm_kcalloc(dev, switch_desc->num_typec_switc=
hes,
> > +                                   sizeof(struct anx7625_typec_port_da=
ta),
>
>                                       sizeof(*ctx->port_data),
>
> ?
>
> > +                                   GFP_KERNEL);
> > +     if (!ctx->port_data) {
> > +             ret =3D -ENOMEM;
> > +             goto unregister_mux;
> > +     }
>
> ...
>
> > +struct anx7625_typec_port_data {
> > +     bool dp_connected;
> > +     enum typec_orientation orientation;
>
> Most likely enum will be 32-bit and bool 8-bit. Which means that the data=
 type
> size become 8 bytes for no reason. Can you swap the lines and perhaps che=
ck this
> with `pahole` tool?
>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best regards,
Pin-yen
