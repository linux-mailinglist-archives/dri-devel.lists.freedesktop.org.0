Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F055EDCD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 21:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AF0112A9B;
	Tue, 28 Jun 2022 19:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1238A112A9B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 19:25:41 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id l81so18557141oif.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 12:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+10FmmpqDQ0iNQ5Hk+84+aEcJCyKp/8SCF4Ixa+q6vY=;
 b=iWoHl7bZvWLVEdyAkVHFeVQz5J5DMUAU7JZsWGv75MVdaQTPO4PjFEa73jbyeZ0a7T
 xYdBhRWVXlgotRQhwz40G1SjZEJIh0jhxk77xoO/+75mFRYfwlh72OamED42p/y7jKds
 eSCzvfYTzsMBJbT6sDnsmjSTUrcXfo223xgGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+10FmmpqDQ0iNQ5Hk+84+aEcJCyKp/8SCF4Ixa+q6vY=;
 b=Z8pgQK+lTUwAW1HE6+CsQJjcFJ6or8x31v5AoxCK0sVuw7zBzcpK/+NoLD8d1GwJjz
 hEPnltoJHYGJSxvraRaGigSG5A9Yy3PxI2J2g26GCFsAYsdA6qb/TPmd43JJa7aY9PSS
 67viPPtUPN5BdVUoxGetv9bHEpGkEQfiCy9N42GOEqwjvO2U/VAqVAmAAXZkgs5zTI4o
 YNjClepUO5eu1DBjyfWMuJJk3ut0W4qHaIhz3g8RV2qqLAcnez2qDcNcvmn/McwgvlZb
 1kMTyXmg6B0vxq87sORo+OyFi5noiw03yPBWooD++NwzuJ1tI8+RQ3dFbX6/XxS2Clm7
 YSMg==
X-Gm-Message-State: AJIora/Ms4v43GPdTiK6Ve3lUWrqS3e6/bCOIH4p64pBL6SE217Jwbdb
 qm7QgZiAbLWpevIIF54SaS5BiBCdQU6huwNHaMVAKg==
X-Google-Smtp-Source: AGRyM1uK9sCuCgSQeIp27nBgEZ2sQNBvuCqqCtZe9EH/XnmRvoODP7KKek4LsMwjVWsoM1WCvJ7STbiQ7QLirJs4Wok=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr822636oib.63.1656444340248; Tue, 28
 Jun 2022 12:25:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jun 2022 14:25:39 -0500
MIME-Version: 1.0
In-Reply-To: <20220622173605.1168416-6-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 28 Jun 2022 14:25:39 -0500
Message-ID: <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-22 10:34:34)
> From: Pin-Yen Lin <treapking@chromium.org>
>
> Add the callback function when the driver receives state
> changes of the Type-C port. The callback function configures the
> crosspoint switch of the anx7625 bridge chip, which can change the
> output pins of the signals according to the port state.

Can this be combined with the previous two patches? They really don't
stand alone because the previous two patches are adding stubs that are
filled out later.

> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index bd21f159b973..5992fc8beeeb 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/workqueue.h>
>
> @@ -2582,9 +2583,64 @@ static void anx7625_runtime_disable(void *data)
>         pm_runtime_disable(data);
>  }
>
> +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> +                                         enum typec_orientation orientation)
> +{
> +       if (orientation == TYPEC_ORIENTATION_NORMAL) {
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +                                 SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +                                 SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> +       } else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +                                 SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +                                 SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> +       }
> +}
> +
> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +       if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> +               /* Both ports available, do nothing to retain the current one. */
> +               return;
> +       else if (ctx->typec_ports[0].dp_connected)
> +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> +       else if (ctx->typec_ports[1].dp_connected)
> +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> +}
> +
>  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
>                                  struct typec_mux_state *state)
>  {
> +       struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
> +       struct anx7625_data *ctx = data->ctx;
> +       struct device *dev = &ctx->client->dev;
> +       bool new_dp_connected, old_dp_connected;
> +
> +       if (ctx->num_typec_switches == 1)

How do we handle the case where the usb-c-connector is directly
connected to the RX1/TX1 and RX2/TX2 pins? This device would be an
orientation (normal/reverse) and mode switch (usb/dp) in that scenario,
but this code is written in a way that the orientation switch isn't
going to flip the crosspoint switch for the different pin assignments.
