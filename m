Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA23D548D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBA76E7FE;
	Mon, 26 Jul 2021 07:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED26E7FE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:44:46 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l4so10235380ljq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssUokjsSMJ48EWHlDCE/laISgBgQpXHrgULNy5xmgno=;
 b=SqRyj7wr5bJD3lTR+EcqGiYgyaosN6BCK/eOMZcy51IciGGn5mrL3Mt1GfsV/+4fcM
 hSGtdN1BzLtKLmKrZlLPsc4b84i2075zOJSa3e5GbPBd7X5cr8oe9CXGCiqCxsVlNDVG
 V5fFjF2iZqFRG1+sXcMVo9Vj4gl+rrp1mOr3rdTsv2ou7vloTDwHpmyH6qcEkHHRrYYK
 yDs3T/P8CABLJeGQrSnVihjZawmje2Oo0Myoj08xMvbVOPrIu7QcnzAm48ixAIAsxdrU
 sxEermJR+49zUL/QXMTLpcZgVhucDK/tcXlkiWBEOibZmA+LhIgCv2YkjLa0auY+5rtj
 1i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssUokjsSMJ48EWHlDCE/laISgBgQpXHrgULNy5xmgno=;
 b=cO9Mmz9CmKln0LtMvndBYiem5ccxQivYwSgxxmpQLaFBUW3G63HOqnS5Wc7cK7u016
 3+zT5ZGezIA1fT+oTmSHOR4GOhgpJj6oDqlUi+QT+JRl9vXbC6Rbw/3/zQdPbAjlO3fW
 SwGN+CCmtnozIzHmSqhmV8P5I1uqV1ssazZIOFjbACqIP5+Q3wIKDKrnS3wpagwp7IK1
 GS+SijQTIEVR611WVyTrcqrYTIO99pat7rTpIyPeE/N2e78NLj7or7px2C3ajHZi+g0/
 rLkrNZY7n35n70S5KTVaa+nNnMS7zfxEoBKQHm4IePz4cEzDRfwKareVw/y7IURj494w
 Skwg==
X-Gm-Message-State: AOAM531hk1ha87ij6t+XdAq2/isjHZf6DRIHuO0FeF46QRshSBU++6Ze
 RJHKJEinh7ooEynzNA5fiifM0KvDhlH0xgRb1lW4rA==
X-Google-Smtp-Source: ABdhPJzVrcz+dhjqBgM3sUPzsNVuW+h+bIfdIXiwMlexLR594Z79PEGkWe9DsgvgcJSZ3GUUlEf2RybZa1F7JygAag0=
X-Received: by 2002:a05:651c:169a:: with SMTP id
 bd26mr11378293ljb.368.1627285484464; 
 Mon, 26 Jul 2021 00:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
 <20210725140339.2465677-2-alexeymin@postmarketos.org>
 <YP184rqayPLbWLx4@ravnborg.org>
In-Reply-To: <YP184rqayPLbWLx4@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Jul 2021 09:44:33 +0200
Message-ID: <CACRpkdYbL54XeWWipgn8yiQRuQOL+VkdHumkLZv6DrkUgdCjUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add Samsung S6E3FA2 DSI panel driver
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 On Sun, Jul 25, 2021 at 5:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> This driver supports two different panels:
>
>         S6E3FA2
>         EA8064G
>
> They differ on a lot of the tables and requires different init.
> In other words there is only a little boiler plate code that is in
> common.
>
> I think it would be much cleaner with individual drivers for each panel.

Sometimes Samsung have different *physical* panels connected
to the same display controller, but I don't know what is the case
here. This looks like it could actually be two different display
controllers. (I don't like these opaque binary drops from Samsung,
datasheets would be nice...)

What I think is most intuitive is to have one driver per display controller.
If the two drivers are writing some very similar registers with very
similar values they are probably the same display controller.

If they are not then they are not...

If they are obviously the same display controller I think parameterizing
a display controller driver along the line of panel-novatek-nt35510.c
is the best. If different display controllers, we need different drivers.

> Which brings me to next topic - this is two different panels and the DT
> are supports to describe the HW - so the DT tree should have different
> entries depending on the actual panel. As it is now you try to hide the
> fact that one compatible describes two different panels.

(...)
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID1, &id1);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID2, &id2);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID3, &id3);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     lcd_id = id1 << 16 | id2 << 8 | id3;
> > +
> > +     switch (lcd_id) {
> > +     case LCD_ID_S6E3FA2:
> > +             dev_info(&dsi->dev, "detected S6E3FA2 panel (ID: 0x%x)\n",
> > +                      lcd_id);
> > +             ctx->subtype = PANEL_S6E3FA2;
> > +             ctx->seq_data = &seqdata_s6e3fa2;
> > +             break;
> > +     case LCD_ID_EA8064G:
> > +             dev_info(&dsi->dev, "detected EA8064G panel (ID: 0x%x)\n",
> > +                      lcd_id);
> > +             ctx->subtype = PANEL_EA8064G;
> > +             ctx->seq_data = &seqdata_ea8064g;
> > +             break;
> > +     default:
> > +             dev_warn(&dsi->dev, "unsupported panel ID: 0x%x\n", lcd_id);
> > +             ctx->subtype = PANEL_UNKNOWN;

This does look like two different panels, I'd like to know the MTP
IDs printed (also wrote in different mail). The MTP print I think
should be kept.

Yours,
Linus Walleij
