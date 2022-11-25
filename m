Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A5638433
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 07:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7096A10E6FF;
	Fri, 25 Nov 2022 06:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E210E6FF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 06:59:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bj12so8197797ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 22:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hoX4Z40MQwuszANnlGBImjuiii34Bm6IVdSkNEROGlk=;
 b=DYIALqhs5m9PNMHPE8yqYIxFmhgXWCNuD1nJkRncSHnTb9KsT2SEjTxLyCLcf07SND
 BuT1B67WTp6kKWo3FOST5wFfrrVouCr3lzbeI1KGFJ8ZBam/NFoSzrxJ91QWhGAFY65h
 a9xen1l7WE8m+vLpAI2NRR5TH2Q/wtYpx+7Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hoX4Z40MQwuszANnlGBImjuiii34Bm6IVdSkNEROGlk=;
 b=b/5is+0j7cUY+cSebTwKno/dkT4k1KUl7UzjKiEYRbqRvv+y81gaVXvU+o0vAPklq1
 k6HS/fI/ix+986BrNXexNVUZgK4UVnic0EUBJDutf24P6TtEcASPtHF9KDUQOeNtgI+F
 CXXqEvicv+D6PA+caKOnC53mCCMqBi3OlOBtG0P3/huLCjYSfl098aNvVKwh9zrSjGEO
 KiVSa0/NZqubd4YbwOToXpwquvQtLntN049K3OHN692aPG06gJHnozy/jo1AuG8xQFje
 /pZbi3JppaR2BScqtOVlTiEtJS7BUaFM7bAYqcUsZ40qGZ8HLrCFl5GIbs16jVdi3x35
 pYjw==
X-Gm-Message-State: ANoB5pnz1HLWaGiBlFYoZuAFWUC4pJbx8ot/oXxvri2baEVo09aeJ6nB
 lFOQlJRKIPJXEvCU8APO6e15QpUSzk69G09R4HI03Q==
X-Google-Smtp-Source: AA0mqf61omTI/URQcHXxO27ayXnv2S/Msse51DzkeZiQ+oIxOTmaxkcc1G6pL7lsFhNXP8G7IxSxXZbVbQkqQ2kKVNQ=
X-Received: by 2002:a17:906:b1c6:b0:7ad:e82b:b66b with SMTP id
 bv6-20020a170906b1c600b007ade82bb66bmr14937894ejb.453.1669359549666; Thu, 24
 Nov 2022 22:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-6-treapking@chromium.org>
 <Y39g/OBLW3pt9qdy@smile.fi.intel.com>
In-Reply-To: <Y39g/OBLW3pt9qdy@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 14:58:58 +0800
Message-ID: <CAEXTbpeX7cfzBhvFvhCtP42LYDZ9OZQhDJ805VacQOE=-EVv0g@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] drm/bridge: anx7625: Register Type C mode switches
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
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
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
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for reviewing the patch.

On Thu, Nov 24, 2022 at 8:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:20:54PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant port are available in Device Tree. Configure the crosspoint
> > switch based on the entered alternate mode for a specific Type-C
> > connector.
>
> ...
>
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> > +             /* Both ports available, do nothing to retain the current one. */
> > +             return;
>
> > +     else if (ctx->typec_ports[0].dp_connected)
>
> This 'else' is redundant. I would rewrite above as
>
>         /* Check if both ports available and do nothing to retain the current one */
>         if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
>                 return;
>
>         if (ctx->typec_ports[0].dp_connected)
>
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> > +     else if (ctx->typec_ports[1].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> > +}

Thanks for the detailed suggestion. I'll adapt this in v7.
>
> ...
>
> > +     data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> > +                           state->alt->mode == USB_TYPEC_DP_MODE);
>
> Parentheses are not needed.

Will fix this in v7.
>
> ...
>
> > +     /*
> > +      * <0 1> refers to SSRX1/SSTX1, and <2 3> refers to SSRX2/SSTX2.
> > +      */
> > +     for (i = 0; i < num_lanes; i++) {
>
> > +             if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> > +                     dev_err(dev, "Invalid data lane numbers\n");
> > +                     return -EINVAL;
> > +             }
>
> According to Rob Linux must not validate device tree. If you need it, use
> proper YAML schema.
>
> > +             port_num = dp_lanes[i] / 2;
> > +     }
>

I'll remove this from the driver in v7.

> ...
>
> > +     if (!ctx->num_typec_switches) {
> > +             dev_warn(dev, "No Type-C switches node found\n");
>
> > +             return ret;
>
> Why not to return 0 explicitly?

Will update to just "return 0" in v7.

>
> > +     }
>
> ...
>
> > +     ctx->typec_ports = devm_kcalloc(
>
> Broken indentation.

Will fix in v7
>
> > +             dev, ctx->num_typec_switches, sizeof(struct anx7625_port_data),
> > +             GFP_KERNEL);
> > +     if (!ctx->typec_ports)
> > +             return -ENOMEM;
>
> ...
>
> > +struct anx7625_port_data {
>
> > +     bool dp_connected;
>
> You can save some bytes on some architectures if move this to be last field.

Thanks for the suggestion. I'll do so in v7
>
> > +     struct typec_mux_dev *typec_mux;
> > +     struct anx7625_data *ctx;
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
