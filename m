Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A94C16AD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA66A10E5C8;
	Wed, 23 Feb 2022 15:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7498C10E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:25:31 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id f12so12376098vkl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Cn+wxnwG+x1ZuZPJ+giKqY8MK8qE2mjCSyZYm6OCxQ=;
 b=IaVfAt4+8g2TOjuPQfHBcju0C4jqE9uOgxfwCffrIyu/Y+ILVikovvoV2tC/vlwUex
 hClNHoXrTesrzCM+o3i51udK6JUfd+MZCVXftru1bi4ZLAfB5K2VH1uFL/gZTGfE+21z
 m3NhSoiYE0KG482lJtCwtM3Myii3NKl2ArQvQEo4DyYAveg0JEQMQuWa5dQX8HORbzW2
 wAQykoHZlLDMf1jOZXPds/GDopnynxlE+KbTcY21ul73gbjMNnh++k+Gs/tW7Fxnbg/1
 F1afK2EwOxFxsod/iEe2DoYcFcyE36ovWCj63fwTqhKVexLmewF02MIbPQyz4DcC5Nms
 kGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Cn+wxnwG+x1ZuZPJ+giKqY8MK8qE2mjCSyZYm6OCxQ=;
 b=txPpHDRyH4p6FnLreZjP1rqrhLunKMZ4HNP/oVTudfE9tXP2fstMU85wm4K90/UgQV
 zCexQV12IAgrVAPGfe0WzQ1maInpNHsApUzgraV+y5SpCLdy53EV3IhCiZmnD75TeaSh
 v0MNy+DS264PO1E5VKERddcWSBfDevxza/lX6ZP290aedp9sV6Yg4whzHab86zQLDhaN
 f15SsOyEAEMFaRMDkkYeB9ulh2fShRqbXjst3MgKcAzWfv1npI8H/e4nTUO5Qa1EbO+s
 WIBQRYSKGRjaOE5a97c5BEEgcFHzk07rT05M2fcMqCYPxiYHI0t9ckMFKfxyzLoxY6FJ
 /vFA==
X-Gm-Message-State: AOAM530NchohBPf+Ew8NiKg8SoFGarWvVVwYtEaTJ8LsdwuBcpWhSkrV
 gQPrlVRnmVnp9Ja+MYUXDK65TnHtx1xObk8/uTo=
X-Google-Smtp-Source: ABdhPJzPPWiCaIIIPFvOA9i1cFq1K6UQX9nyiVxRDSei0f9VGgj8So2xJ02gxGlDoBeTh82jBfG4cTKJyo9QMhUggcI=
X-Received: by 2002:a1f:ac56:0:b0:332:1193:5226 with SMTP id
 v83-20020a1fac56000000b0033211935226mr23833vke.9.1645629930539; Wed, 23 Feb
 2022 07:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
In-Reply-To: <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 23 Feb 2022 16:25:19 +0100
Message-ID: <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
To: Marek Vasut <marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, DenysDrozdov <denys.drozdov@toradex.com>,
 Maxime Ripard <maxime@cerno.tech>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal here is to set the element bus_format in the struct
panel_desc. This is an enum with the possible values defined in
include/uapi/linux/media-bus-format.h.

The enum values are not constructed in a way that you could calculate
the value from color channel width/shift/mapping/whatever. You rather
would have to check if the combination of color channel
width/shift/mapping/whatever maps to an existing value and otherwise
EINVAL out.

I don't see the value in having yet another way of how this
information can be specified and then having to write a more
complicated parser which maps the dt data to bus_format.

On Wed, Feb 23, 2022 at 2:45 PM Marek Vasut <marex@denx.de> wrote:
>
> On 2/23/22 14:41, Maxime Ripard wrote:
> > Hi,
> >
> > On Tue, Feb 22, 2022 at 09:47:23AM +0100, Max Krummenacher wrote:
> >> Use the new property bus-format to set the enum bus_format and bpc.
> >> Completes: commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")
> >>
> >> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >>
> >> ---
> >>
> >>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
> >>   1 file changed, 32 insertions(+)
> >>
> >> Relates to the discussion: https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
> >>
> >> Max
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> >> index c5f133667a2d..5c07260de71c 100644
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
> >>      struct panel_desc *desc;
> >>      unsigned int bus_flags;
> >>      struct videomode vm;
> >> +    const char *format = "";
> >>      int ret;
> >>
> >>      np = dev->of_node;
> >> @@ -477,6 +478,37 @@ static int panel_dpi_probe(struct device *dev,
> >>      of_property_read_u32(np, "width-mm", &desc->size.width);
> >>      of_property_read_u32(np, "height-mm", &desc->size.height);
> >>
> >> +    of_property_read_string(np, "bus-format", &format);
> >> +    if (!strcmp(format, "BGR888_1X24")) {
> >> +            desc->bpc = 8;
> >> +            desc->bus_format = MEDIA_BUS_FMT_BGR888_1X24;
> >> +    } else if (!strcmp(format, "GBR888_1X24")) {
> >> +            desc->bpc = 8;
> >> +            desc->bus_format = MEDIA_BUS_FMT_GBR888_1X24;
> >> +    } else if (!strcmp(format, "RBG888_1X24")) {
> >> +            desc->bpc = 8;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RBG888_1X24;
> >> +    } else if (!strcmp(format, "RGB444_1X12")) {
> >> +            desc->bpc = 6;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RGB444_1X12;
> >> +    } else if (!strcmp(format, "RGB565_1X16")) {
> >> +            desc->bpc = 6;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> >> +    } else if (!strcmp(format, "RGB666_1X18")) {
> >> +            desc->bpc = 6;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> >> +    } else if (!strcmp(format, "RGB666_1X24_CPADHI")) {
> >> +            desc->bpc = 6;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> >> +    } else if (!strcmp(format, "RGB888_1X24")) {
> >> +            desc->bpc = 8;
> >> +            desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> >> +    } else {
> >> +            dev_err(dev, "%pOF: missing or unknown bus-format property\n",
> >> +                    np);
> >> +            return -EINVAL;
> >> +    }
> >> +
> >
> > It doesn't seem right, really. We can't the bus format / bpc be inferred
> > from the compatible? I'd expect two panels that don't have the same bus
> > format to not be claimed as compatible.
>
> Which compatible ?
>
> Note that this is for panel-dpi compatible, i.e. the panel which has
> timings specified in DT (and needs bus format specified there too).
>
> I agree this doesn't look right however, some more generic color channel
> width/shift/mapping might be better.
