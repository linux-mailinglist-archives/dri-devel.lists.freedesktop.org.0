Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81667641886
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 20:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38EB10E046;
	Sat,  3 Dec 2022 19:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCACD10E046
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 19:01:56 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so9054373fac.8
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 11:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oBz8aAlIFE523Wl96pS75VCti7mPLH+4FVInpxV4BbM=;
 b=HyPdeDLYepnjmZjo0dWp/lACeLV0P6xNLE7ta5eU+MG61eEYxppXlZW+Bk+TIBuZka
 GnNX91ONUjpRJk6gC/BhVbEHmFc7gnB4xSTL2N7tzYEJW47WQFtorbzyD9u51trJHjg0
 2jR8FpN/jswExrEkRp4u8lMVJmgpygyqfEry5tiQc9sP8KkXU4wVlsTxPnXsNjUAZqjs
 Rpcb6FIc1GmSOEcT091Oa2FE86GMnKDt4AD3/guCRaupmfK3N/pT0PcRLzlmbnvXPmRj
 ahjTEX+VnWC5strpgxYxJrHir/TTgRJzvlb9aAhl17suPLsewuftGMwM27CCBHKtt7Yt
 aTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBz8aAlIFE523Wl96pS75VCti7mPLH+4FVInpxV4BbM=;
 b=LRuIF2A4RBvtyXE9TjskrpRMzqwBmaGQgYgIlIMrY3VgJO0WgQz9M33vFhIWt4yXBR
 zX/S77domaV3sOEBZxrtvjl9MItdTooapulWLoFqMFn6GDIN3jr6dWMSqSoXiAH4dd5u
 dINND1m/L5WRqFdhPZV8KjnyGg63bGMIYabanr0+I5FFAk6uRKOBp+8yxHMubL/UCfoG
 hWPCgf0ct0eJsNz4R7SpgE4Ps47JqrjE4mza+bFWK+3KOPCYPeSzN/d3CPBWbqN3YQuK
 3rZJGvjBQL2vLnygKrcb5FDu8UnbbSDMJU1bK6kYiTBb263Zc7bPzWL33xtcwCMzksZs
 J3Qg==
X-Gm-Message-State: ANoB5pm7slLPcyxQ50Te62fXbUUWLUbjXituMMt0EXsK7ZzUIdqnhPmc
 wq1krwh+a+9KVAG17gIaXsw=
X-Google-Smtp-Source: AA0mqf575OceW2yq/LGw8uuGbWp4C/UT2fGSJfsho1DcVcGCMZsYWvIVUjQA39jwV3Fv33flRcYqfw==
X-Received: by 2002:a05:6870:65a7:b0:143:9967:7e81 with SMTP id
 fp39-20020a05687065a700b0014399677e81mr18962929oab.31.1670094115846; 
 Sat, 03 Dec 2022 11:01:55 -0800 (PST)
Received: from wintermute. (76-244-6-13.lightspeed.rcsntx.sbcglobal.net.
 [76.244.6.13]) by smtp.gmail.com with ESMTPSA id
 j2-20020a4a9442000000b0049f0671a23asm4327799ooi.9.2022.12.03.11.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 11:01:55 -0800 (PST)
Message-ID: <638b9d23.4a0a0220.37bf5.143c@mx.google.com>
X-Google-Original-Message-ID: <20221203190152.GA20895@wintermute.>
Date: Sat, 3 Dec 2022 13:01:52 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 2/3] drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD
 panel
References: <20221129172912.9576-1-macroalpha82@gmail.com>
 <20221129172912.9576-3-macroalpha82@gmail.com>
 <CACRpkdZK9=Z1i3Uv=fwS=t=NXHJkucg9FYOCfog_qhomf9GV=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZK9=Z1i3Uv=fwS=t=NXHJkucg9FYOCfog_qhomf9GV=w@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 03, 2022 at 10:03:42AM +0100, Linus Walleij wrote:
> Hi Chris,
> 
> thanks for your patch!
> 
> overall this looks very good. Just some nitpicks.
> 
> On Tue, Nov 29, 2022 at 6:29 PM Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Support Samsung AMS495QA01 panel as found on the Anbernic RG503. Note
> > This panel receives video signals via DSI, however it receives
> > commands via 3-wire SPI.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> > +config DRM_PANEL_SAMSUNG_AMS495QA01
> > +       tristate "Samsung AMS495QA01 DSI panel"
> 
> I am always a bit careful with these "Samsung" panels. Well the
> panel is surely Samsungs and usually it has that name, but very often
> it is mainly a display controller, made by someone else, then a physical
> panel slapped on and then the actual display controller is obscured.
> 
> Typical example:
> panel-novatek-nt35560.c handing Samsung ACX424AKP.
> 
> If you know the actual display controller, then the driver should be
> renamed after that, but keeping the compatible and DT bindings
> as is. The reason being that tomorrow there is an LG panel
> using the same display controller and then we don't get duplicate
> code.
> 
> It feels like this is a Novatek controller. Just a feeling I have.
> Mostly from the way it does brightness using ELVSS and
> gamma. But who knows.
> 

Will do. I'll make the changes and resubmit. For what it's worth the
documentation says this one is a Samsung AMS495QA01 panel on a
Magnachip D53E6EA8966 controller IC.

> > +       depends on OF && SPI
> > +       depends on DRM_MIPI_DSI
> > +       select DRM_MIPI_DBI
> 
> Nice that you use these helpers!
> 
> > +#include <linux/media-bus-format.h>
> (...)
> > +#include <linux/of_graph.h>
> 
> Hm. We get to this.

*gulp*

> 
> > +       /** @prepared: value tracking panel prepare status */
> > +       bool prepared;
> 
> Drop this and associated code. The framework keeps track of this.
> 

Will do.

> > +       /* Set gamma change */
> > +       mipi_dbi_command(dbi, 0xf9, 0x00);
> 
> For cases like this where you know what the command does,
> please add:
> 
> #define MCS_SET_GAMMA 0xf9
> 
> (MCS = Manufacturer Command Set, cf
> drivers/gpu/drm/panel/panel-samsung-s6e63m0.h)
> 
> and collect them somewhere, then you can drop the comment
> because it is self-evident what is going on.
> 

Gotcha, will do.

> > +       /* Undocumented command */
> > +       mipi_dbi_command(dbi, 0x26, 0x00);
> > +       /* Set ELVSS value */
> > +       mipi_dbi_command(dbi, 0xb2, ams495qa01_elvss[tmp]);
> 
> Same.
> 
> > +static int ams495qa01_prepare(struct drm_panel *panel)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       struct mipi_dbi *dbi = &db->dbi;
> > +       int ret;
> > +
> > +       if (db->prepared)
> > +               return 0;
> 
> As mentioned skip this.
> 
> > +       /* Power up */
> > +       ret = regulator_enable(db->reg_vdd);
> > +       if (ret) {
> > +               dev_err(db->dev, "failed to enable vdd regulator: %d\n", ret);
> > +               return ret;
> > +       }
> > +       if (db->reg_elvdd) {
> 
> Do you really need to if() this? I thought the regulator
> framework would just ignore the calls for an optional
> regulator.

I don't know for sure, but I'll make the change if you request it. I
think other drivers had an if in this scenario which is why I did it.

> 
> > +       /* Password to start command sequence */
> > +       mipi_dbi_command(dbi, 0xf0, 0x5a, 0x5a);
> > +       mipi_dbi_command(dbi, 0xf1, 0x5a, 0x5a);
> 
> Use the #defines from:
> drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
> I'm pretty sure they mean the same thing:
> 
> #define MCS_LEVEL_2_KEY         0xf0
> #define MCS_MTP_KEY             0xf1
> 
> > +       /* Analog Power condition set */
> > +       mipi_dbi_command(dbi, 0xf4, 0x33, 0x42, 0x00, 0x08);
> > +       mipi_dbi_command(dbi, 0xf5, 0x00, 0x06, 0x26, 0x35, 0x03);
> 
> Define MCS_ commands.
> 
> > +       /* GTCON set */
> > +       mipi_dbi_command(dbi, 0xf7, 0x20);
> > +
> > +       /* TEMP_SWIRE set */
> > +       mipi_dbi_command(dbi, 0xb2, 0x06, 0x06, 0x06, 0x06);
> > +
> > +       /* ELVSS_CON set */
> > +       mipi_dbi_command(dbi, 0xb1, 0x07, 0x00, 0x10);
> > +
> > +       /* Gateless signal set */
> > +       mipi_dbi_command(dbi, 0xf8, 0x7f, 0x7a, 0x89, 0x67, 0x26, 0x38,
> > +                        0x00, 0x00, 0x09, 0x67, 0x70, 0x88, 0x7a,
> > +                        0x76, 0x05, 0x09, 0x23, 0x23, 0x23);
> 
> Dito
> 
> > +       db->prepared = true;
> 
> Drop.
> 
> > +static int ams495qa01_unprepare(struct drm_panel *panel)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       struct mipi_dbi *dbi = &db->dbi;
> > +
> > +       if (!db->prepared)
> > +               return 0;
> 
> Drop.
> 
> > +static int ams495qa01_get_modes(struct drm_panel *panel,
> > +                               struct drm_connector *connector)
> > +{
> > +       struct ams495qa01 *db = to_ams495qa01(panel);
> > +       const struct ams495qa01_panel_info *panel_info = db->panel_info;
> > +       struct drm_display_mode *mode;
> > +       static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < panel_info->num_modes; i++) {
> > +               mode = drm_mode_duplicate(connector->dev,
> > +                                         &panel_info->display_modes[i]);
> > +               if (!mode)
> > +                       return -ENOMEM;
> > +
> > +               drm_mode_set_name(mode);
> > +
> > +               mode->type = DRM_MODE_TYPE_DRIVER;
> > +               if (panel_info->num_modes == 1)
> > +                       mode->type |= DRM_MODE_TYPE_PREFERRED;
> 
> I think you should probably set the preferred mode even
> if there are several of them? But maybe just on the first
> or something. (A bit unsure here, Sam?)
> 

I'll keep 60hz as the preferred. 50hz was added at the request of some
userspace folks for running PAL based emulators and stuff.

> > +static int ams495qa01_probe(struct spi_device *spi)
> > +{
> > +       struct device *dev = &spi->dev;
> > +       struct device_node *endpoint, *dsi_host_node;
> (...)
> > +       db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> 
> I would request this GPIOD_OUT_HIGH so reset is asserted on probe.
> 

Will do.

> > +       db->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> 
> And this GPIOD_OUT_LOW so panel is disabled after probe.
> 

Will do.

> > +       /*
> > +        * Get the DSI controller that is supplying data for this display
> > +        * which is controlled via SPI 3-wire.
> > +        */
> > +       endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> > +       if (!endpoint) {
> > +               dev_err(dev, "failed to get endpoint\n");
> > +               return -ENODEV;
> > +       }
> > +       dsi_host_node = of_graph_get_remote_port_parent(endpoint);
> > +       if (!dsi_host_node) {
> > +               dev_err(dev, "failed to get remote port parent\n");
> > +               goto put_endpoint;
> > +       }
> > +       dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> > +       if (!dsi_host) {
> > +               dev_err(dev, "failed to find dsi host\n");
> > +               goto put_host;
> > +       }
> > +       info.node = of_graph_get_remote_port(endpoint);
> > +       if (!info.node) {
> > +               dev_err(dev, "failed to get remote port node\n");
> > +               ret = -ENODEV;
> > +               goto put_host;
> > +       }
> > +
> > +       db->dsi_dev = devm_mipi_dsi_device_register_full(dev, dsi_host, &info);
> 
> I don't get this part.
> 
> Why do you have to go through all this trouble when no other panel
> drivers, not even the other SPI DBI panel drivers, does this?
> 
> drm_of_find_panel_or_bridge() should typically result in the core
> doing all the lookup and connecting for you from the host side
> should it not?
> 
> At the very least this requires a big comment about what is
> going on and why and what makes this necessary.
> 
> I can only guess the following:
> 

This is the path that "works", but I'll happily change to something
else.

> > +       db->dsi_dev->lanes = 2;
> > +       db->dsi_dev->format = MIPI_DSI_FMT_RGB888;
> > +       db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> > +                         MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> > +
> > +       drm_panel_init(&db->panel, dev, &ams495qa01_drm_funcs,
> > +                      DRM_MODE_CONNECTOR_DSI);
> 
> Pixel data passes to the display using DSI but all display control
> is done over SPI, and the core will not help with this.
> 
> So from the display controller POV this is a DSI display
> and from the display POV this is an SPI-controlled display.
> So it sits on two buses. Data path is on DSI, control path
> is on SPI.
> 
> This would be kind of odd actually, normally DSI displays
> do the display control over DSI as well. SPI control is usually
> used on DPI displays. But I'm not surprised.
> 
> If this is necessary, isn't this something we need to teach the
> core to handle instead of adding quirks like this to all drivers that
> have this characteristic?
> 

You are correct, this panel is controlled via 3-wire SPI in my example.
The panel can be controlled either by 3-wire SPI or DSI commands
depending on whether or not pin 15 is driven high or low. Unfortunately
in my case it's hardwired high, so I am forced to do it via 3-wire SPI.
I have no way of testing it with pure DSI but that would simplify
things quite a bit. Pixel data is transmitted soley through DSI.

The way I have it implemented currently is to put the panel on the SPI
bus as a DBI panel; traverse through the DT bindings to find the
associated DSI controller, then attach it as a DSI device so the DSI
bus can transmit the pixel data.

I'm absolutely cool with making those functions part of the core and
not just specific to this panel, only I might need a bit of help on
that part to make sure I do it the right way. I just wasn't sure how
often that would be needed since this is the only panel I've ever seen
driven this way, especially since it seems like any sane person would
just want to do the whole control data/pixel data over DSI to keep
things simple.

> Yours,
> Linus Walleij

Thank you for your input.
