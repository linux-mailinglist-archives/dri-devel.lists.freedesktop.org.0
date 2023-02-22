Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4B69EE1F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3D010E1B3;
	Wed, 22 Feb 2023 05:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0E10E1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 05:05:25 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f14so324423iow.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 21:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fnu1EJD881ilgzbXP/u2M6qiohAhxhnaJqCCnJN+Tk8=;
 b=FubYbTKjUQHr3cEQiX3cMJOQw4FfCE/OMOouqh/l8wKE33FVwKwsXJcZPCVlJOgruk
 TwqXvfjx8dAxXtopRpr/7I3tGJw6wGnLplPO44Jf7qPfUZiBkStTGzavNICWu6K4/ijQ
 t56/tUtwbEDOBpuFgeHcQRqgq9PseVi3JLl2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fnu1EJD881ilgzbXP/u2M6qiohAhxhnaJqCCnJN+Tk8=;
 b=iUwfilQ/2KRZApmVPTQBJM4IZr6RNHNMSlOLTbsxt6YY/GTGpTPvV1yi/zdRdRqyg1
 eqMVzbdwi8G/sAwS0E0nQnI2LGOPIMbFvRqWIBpjTVnKTK4EPuNk3Cv7lM/xhqelICK3
 CtipakcUFTXkU0V60WLGSadI+ecOoNe5sJS7/VHZmPS6Twf6dPSVBA4Oa/iJ/1NaYvWI
 apOC9mlZspppXM1pWlUiE7LzwczvEr2sBsrpEGfWXshLWPlRhwyI8Af5aJMWNFxgxG5V
 /TFhywG9kDF7PqErkru9aM5va8U6C4fdv1dAzRZ72B9xwj6vyzGJkYvt8ObT0bUJijir
 dmZQ==
X-Gm-Message-State: AO0yUKXiDy1UzV5W2q7Jdq0U6VdpqM4ls8orxOrpwoceLYkaadbJk3Fa
 0AeM11GLG83b2YPgD+O699IB0k8n6pKDEHQU8HXg6g==
X-Google-Smtp-Source: AK7set9WiTsncAk01hPHPcRR1sXgR4N/+7kuisg+5cf5ZRp0qNCei8CeQdAbEZCvfHwnyW5W1nH1RQwFgy87puMdlp0=
X-Received: by 2002:a5d:80da:0:b0:71a:5a1f:544c with SMTP id
 h26-20020a5d80da000000b0071a5a1f544cmr4719763ior.5.1677042324712; Tue, 21 Feb
 2023 21:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-8-treapking@chromium.org>
 <Y/SstDfugez4/Qx4@smile.fi.intel.com>
In-Reply-To: <Y/SstDfugez4/Qx4@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 22 Feb 2023 13:05:13 +0800
Message-ID: <CAEXTbpeObyd1uKd3Qp9c3A9z9BX8R_SiH7okVrgmV+fMfaRaYQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/10] drm/bridge: anx7625: Register Type C mode
 switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benson Leung <bleung@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Tue, Feb 21, 2023 at 7:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 05:50:51PM +0800, Pin-yen Lin wrote:
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
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     int i;
>
> unsigned?
>
> + Blank line.
>
> > +     /* Check if both ports available and do nothing to retain the current one */
> > +     if (ctx->port_data[0].dp_connected && ctx->port_data[1].dp_connected)
> > +             return;
> > +
> > +     for (i = 0; i < 2; i++) {
> > +             if (ctx->port_data[i].dp_connected)
> > +                     anx7625_set_crosspoint_switch(ctx,
> > +                                                   ctx->port_data[i].orientation);
> > +     }
> > +}
>
> ...
>
> > +     ctx->port_data[port->port_num].dp_connected =
> > +             state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
>
> I would move the first parameter of && to the separate line for slightly better
> readability.
>
> > +             state->alt->mode == USB_TYPEC_DP_MODE;
>
> ...
>
> > +     for (i = 0; i < switch_desc->num_typec_switches; i++) {
> > +             struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
> > +             struct fwnode_handle *fwnode = port->fwnode;
> > +
> > +             num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");
>
> > +
>
> Redundant blank line.
>
> > +             if (num_lanes < 0) {
> > +                     dev_err(dev,
> > +                             "Error on getting data lanes count from %pfwP: %d\n",
> > +                             fwnode, num_lanes);
>
> > +                     ret = num_lanes;
>
> Can be written differently:
>
> > +                     goto unregister_mux;
> > +             }
>
>                 ret = ...
>                 if (ret < 0) {
>                         ...
>                 }
>                 num_lanes = ret;
>
>
> What if it's 0?

The binding does not allow that, so I don't think we should check it here.

I'll address other comments in the next version.

Regards,
Pin-yen
>
> > +             ret = fwnode_property_read_u32_array(fwnode, "data-lanes",
> > +                                                  dp_lanes, num_lanes);
> > +             if (ret) {
> > +                     dev_err(dev,
> > +                             "Failed to read the data-lanes variable: %d\n",
> > +                             ret);
> > +                     goto unregister_mux;
> > +             }
> > +
> > +             ctx->port_data[i].orientation = (dp_lanes[0] / 2 == 0) ?
> > +                     TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NORMAL;
> > +             ctx->port_data[i].dp_connected = false;
> > +     }
> > +     complete_all(&ctx->mux_register);
> > +
> > +     return 0;
> > +
> > +unregister_mux:
> > +     complete_all(&ctx->mux_register);
> > +     anx7625_unregister_typec_switches(ctx);
> > +     return ret;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
