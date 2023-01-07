Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E30660D29
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 10:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0810E189;
	Sat,  7 Jan 2023 09:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BAC10E189
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 09:16:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id c20so2187556ilj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RW3tgbxJ4a2R6Lr3hH31QiBztWxbB+zFWSFDhcB5PzA=;
 b=KKfAvH6c6JEgsJOT6JY3oShOZFTY6igTfAUjUAfOvO3ZTBJILFDvW/q3p4JG0BSbDr
 K+YbSwq/zOnsJrBIbou5SGfbimt6dioyluqbq/pPcOoA+YAVcadHQdaZXpG9VwkfjrXq
 p0GnhAoCy+/LFON2ea16s1HP+P1sjTyceRnXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RW3tgbxJ4a2R6Lr3hH31QiBztWxbB+zFWSFDhcB5PzA=;
 b=caD3RBUP04jJYzAkVeu0+1do/eT9Llz3JL2Qb/DjfNNAP5wuq+rSiXMZDIN6NYKCSv
 Wjaw3tC0k5nHj0pLulfo/CnxiGYq51pBTJUlOnHJ02FXsJmhE1F9ZkztKxpiXf3WZt3v
 YIgcOgeUQqI1e68r3c+kDsecvDVonpU6eHjPp1x/puwXmb+6DNwpUKGTZGvmWwoxPNPi
 hM2q3ZlxT524rXqukdMICpOEFxr/WEYMEdA0SDX9tALaKp9YefClEq8upvuSX+/fsste
 ak01pbfRjsIPkcUulKwXRetdqJiKKAIgO/9kLGtZNEQl3wtxynlGUpTiRIRKYO4DOrPl
 qwxQ==
X-Gm-Message-State: AFqh2krvHhSwNcJMw0/7nx+x7QvrgMiLhaQhKj37KTUhXbD8uVeZulGH
 2mql5owcSqawElpM4Hj70Dqs3YpCm5b6IBqjlmXYvA==
X-Google-Smtp-Source: AMrXdXtBMzB4lO1Yn6qSZ1CSDd89k7nZTSy0I48BAfgZ30l48dPrz+xuh/08ZScwMOp5MGwUZ1rNJl0wH1TYIiXt25E=
X-Received: by 2002:a05:6e02:2141:b0:30d:8aeb:9b11 with SMTP id
 d1-20020a056e02214100b0030d8aeb9b11mr588524ilv.293.1673083006788; Sat, 07 Jan
 2023 01:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-4-treapking@chromium.org>
 <Y7bvnOLcuJvvp/v1@smile.fi.intel.com>
In-Reply-To: <Y7bvnOLcuJvvp/v1@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Sat, 7 Jan 2023 17:16:35 +0800
Message-ID: <CAEXTbpdg9C5pFVXo7fKSc_vWAczv_OthjbRA7DZVnENuNfwQfA@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] drm/display: Add Type-C switch helpers
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Thu, Jan 5, 2023 at 11:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 05, 2023 at 09:24:51PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "data-lanes" properties are available in Device Tree.
>
> ...
>
> > +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret = PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d\n",
> > +                     port_num, ret);
> > +     }
> > +
> > +     return ret;
>
> ...
>
> > +     struct device_node *sw;
>
> > +     int ret = 0;
>
> It's easy to break things if you squeeze more code in the future in this
> function, so I recommend to split assignment to be closer to its first user
> (see below).
>
> > +     for_each_child_of_node(port, sw) {
> > +             if (of_property_read_bool(sw, "mode-switch"))
> > +                     switch_desc->num_typec_switches++;
> > +     }
> > +
> > +     if (!switch_desc->num_typec_switches) {
> > +             dev_warn(dev, "No Type-C switches node found\n");
>
> > +             return ret;
>
> return 0;

Thanks for the suggestion. I'll update this in v8.
>
> > +     }
> > +
> > +     switch_desc->typec_ports = devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> > +
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> > +     /* Register switches for each connector. */
> > +     for_each_child_of_node(port, sw) {
> > +             if (!of_property_read_bool(sw, "mode-switch"))
> > +                     continue;
> > +             ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to register mode switch: %d\n", ret);
> > +                     of_node_put(sw);
> > +                     break;
> > +             }
> > +     }
>
> > +     if (ret)
> > +             drm_dp_unregister_typec_switches(switch_desc);
> > +
> > +     return ret;
>
> Why not adding a goto label?

I didn't know that goto label is preferred even when there are no
duplicated code blocks in the function.

I'll update this accordingly in v8.
>
>                 ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
>                 if (ret)
>                         goto err_unregister_typec_switches;
>
>         return 0;
>
> err_unregister_typec_switches:
>         of_node_put(sw);
>         drm_dp_unregister_typec_switches(switch_desc);
>         dev_err(dev, "Failed to register mode switch: %d\n", ret);
>         return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
