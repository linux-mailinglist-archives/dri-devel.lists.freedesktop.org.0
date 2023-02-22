Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3469F0BB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243FB10E426;
	Wed, 22 Feb 2023 08:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C477A10E426
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:53:53 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id i202so3019015ioa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WhYDKiCMl5Zg3kFJ82aJeKZFheHJkDNcW1JK/FBeLIU=;
 b=S46TMnd79hmJMjHu6YHoyiQ+If7OYb6jqppE2/V2/h32wVWi6nWdac/dC+ud2JAX82
 ngXeec568GkKEt7Pym7Jw3Ur53NqHZxEiqsqSgImaIuxbIIedIDCislExEzkuJ8FGR8w
 BLGw0ITffNiuHi9XD817RG27FpP7nMDzxmEb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WhYDKiCMl5Zg3kFJ82aJeKZFheHJkDNcW1JK/FBeLIU=;
 b=GyFLZsOJ6nBGNPSZ49i43Bqbv+UrsSIqCRYFUnmklYd/9gg7qCjtW7Is+YuGtgsZ0w
 fpgZbXVHgEz8z/vNblNgj+Q5+SVjfLU3uHQ/V89zKaNErKyomwghLTOm5gzN8bB2OzUh
 fQs9S8vW6wKoGe5LBmpAE3XV3L7Q0k7G2p3CHngvPutipHC8kH2K5bN+HwVHv2BggOOs
 sQ2bKJTy7jJg0XfpPB0lfTnSbuyj4JU2H/f3DzkkN+9DIeyvo5Tv0BpNZ5A+jKKLWGIk
 GkjAi2rphpqxq0Pc2Vmi4J3fZ65LsKN0aKDA7CAAAA8QxMqKU+Cqlx4ueEhEwXpuiCm6
 o1Rg==
X-Gm-Message-State: AO0yUKXWizz8MRx2sdqi/50qyOeHcLMk3m3t7eF8Hg0NQDJ0tvQ8Z1bP
 wYd6jMfDXwNJXJvNfCOvUTZtDwM52IKTtzzLfQ+AJQ==
X-Google-Smtp-Source: AK7set95UIcEr36Pn+YUoHAt17RL/o3ns/Gdh3WG/t/+JidyKPagtbyfa6npb7tZMS4Qzo8ChxlIppfGbWczTO72XBY=
X-Received: by 2002:a5d:80da:0:b0:71a:5a1f:544c with SMTP id
 h26-20020a5d80da000000b0071a5a1f544cmr4867722ior.5.1677056033042; Wed, 22 Feb
 2023 00:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-4-treapking@chromium.org>
 <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
In-Reply-To: <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 22 Feb 2023 16:53:41 +0800
Message-ID: <CAEXTbpcOA06Cf-niurjM4_3Rx6xa9Pi+fuJHUQCKmwaJL2ibmA@mail.gmail.com>
Subject: Re: [PATCH v12 03/10] drm/display: Add Type-C switch helpers
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
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Benson Leung <bleung@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Tue, Feb 21, 2023 at 7:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 05:50:47PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ...
>
> > +     fwnode_for_each_typec_mode_switch(port, sw)
> > +             switch_desc->num_typec_switches++;
> > +
> > +     if (!switch_desc->num_typec_switches) {
> > +             dev_dbg(dev, "No Type-C switches node found\n");
> > +             return 0;
> > +     }
>
> What about
>
> static inline unsigned int typec_mode_switch_node_count(... *port)
> {
>         ... *sw;
>         unsigned int count = 0;
>
>         for_each_typec_mode_switch_node(port, sw)
>                 count++;
>
>         return count;
> }
>
>
> And then it seems something like
>
>         unsigned int count;
>
>         count = typec_mode_switch_node_count(port);
>         if (!count) {
>                 ...
>         }
>
>         _switches = count;
>
> ...
>
> > +     switch_desc->typec_ports = devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
>
> Strange indentation.
>
> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
>
> > +
>
> Redundant blank line.
>
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> ...
>
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
> > +{
> > +     int i;
>
> unsigned?
>
> > +     for (i = 0; i < switch_desc->num_typec_switches; i++)
> > +             typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
> > +}
>
> ...
>
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/usb/typec_mux.h>
>
> I don't see users of this.
> But a few forward declarations are missing.

I can put a `struct typec_mux_dev;` here, but there is also a usage of
typec_mux_set_fn_t.

Should I add the typedef into this header file as well?

Regards,
Pin-yen
>
> >  #include <drm/display/drm_dp.h>
> >  #include <drm/drm_connector.h>
>
> ...
>
> > +#define fwnode_for_each_typec_mode_switch(port, sw)  \
> > +     fwnode_for_each_child_node((port), (sw))        \
> > +             for_each_if(fwnode_property_present((sw), "mode-switch"))
>
> Please don't use fwnode namespace (see above), something like
>
> #define for_each_typec_mode_switch_node(port, sw)       \
>         ...
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
