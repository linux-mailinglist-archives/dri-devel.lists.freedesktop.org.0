Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFB331AC06
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 15:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8346E83C;
	Sat, 13 Feb 2021 14:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3406E83C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 14:06:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c6so3202485ede.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nSj7M48zNK1Z1vNMM4HWJ6hbASnzVASRR7Uo24G9Nus=;
 b=cNTv+fSQAGJ+Pg3+uvrVkuz5bo1bdLl+jv9hAyEDw+9giYpAt1zQ92sQu5m2JhZM29
 4c9dm5uZ1+Qdev/2ty32LqQBZ7Jo9Y4cUoKxWiAG8Njc0b1LfI+aBcOkFrvrQmLp2La4
 IXNmc8mgaVhxahYzAyXLUkqZW/ShmFQV0Oa6m9CElIlbmQcKwTUkwG5AD5besRJjyuAT
 eU/pzxY8Xu4jaobaGluzqIcWYe7+MXpaxQkL0eWh7G4jQKTmpGlN1IdxorYmEHXVtNx1
 Ur2gKPF28r7pzyfxrOd3tTHTSh8hPKjC/YPkCO7LNiqQOs99nANJ5LDzsTvvWTEhD//j
 alCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSj7M48zNK1Z1vNMM4HWJ6hbASnzVASRR7Uo24G9Nus=;
 b=OPpGbiMF3Rma/oZXOlCA+rojzTUDq50ljwObUtjaqGJzAC1bIalZ/l//BtvNnhVKqb
 qIkrl41rO/qJu9qKwJMbYgtsNNQRKW2W2h5lwpf7BwhEP6CcUS9YMTQLuuq1r7/Q8K0j
 z0zYk8g/tQk2wafp4pN3RkfPgVK3a6BJmTgYdWZQBx1+YEr/jVAITrU4GTt9AOVi8aZJ
 z3d9vzjBU2BJHYhv4dGv8THspYEc9fNDNoGI67RZWDMXHTJxoiIRMWGgl2D38Y/8Pn+U
 KWB86ULGih8jkmA2iKAgVOVEXOMBqgwEvFFOk+N87SVcNbq5M35VirOAeyHserlQT58S
 uLBQ==
X-Gm-Message-State: AOAM533kkGsBgbfxJrSmFsxoUGurkXE3dOiZzoXH5HBfIcplZ1b5LrsN
 6B4vfeRfkj+RsxgBPDMpL2dJC5rZ1vb55kIaX9WX2g==
X-Google-Smtp-Source: ABdhPJxuwKQU4C3iC9/7cpfyqtlxnZqHwXnRn63KNiSGoVEeTSEuZ8swUlwPFevYkF/o8NwwEebEPoB0KVKmGHxnLJo=
X-Received: by 2002:aa7:c58e:: with SMTP id g14mr7832661edq.362.1613225176686; 
 Sat, 13 Feb 2021 06:06:16 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR06MB53424F1D31DCA0F038842EB7A58B9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <CAAEAJfBXg6R_P9wskFf2eh+jqHT8EJdUXJdub1yd-oqCHfg6qA@mail.gmail.com>
In-Reply-To: <CAAEAJfBXg6R_P9wskFf2eh+jqHT8EJdUXJdub1yd-oqCHfg6qA@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 13 Feb 2021 11:06:05 -0300
Message-ID: <CAAEAJfBXgU1GKKHKxH3F3M_K5HqP6drfQ_BWJH795qU318fT2w@mail.gmail.com>
Subject: Re: Odroid GO Advance display in mainline (Re: [PATCH 1/2] drm/panel:
 add rotation support for Elida KD35T133 panels)
To: Chris Morgan <macromorgan@hotmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Now with Heiko's address fixed)

On Sat, 13 Feb 2021 at 10:53, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Chris,
>
> I'm hijacking this discussion a bit.
>
> I recently tried to boot maline on my Odroid GOA, which I managed to do,
> except the display wasn't displaying anything :-)
>
> Everything looks good on a quick look, the Inno PHY driver is here,
> and there's a DRM card registered with the right mode 320x240 and
> connected status (which I suppose doesn't mean much in this case).
> Also, the backlight is on.
>
> Looks like this is working for you, so I was wondering if maybe
> this would ring a bell, or perhaps you're aware of any patches
> we are missing in v5.11-rc7 (which is what I'm basing on).
> Or maybe I'm missing some config?...
>
> Any ideas would be welcome!
>
> Ezequiel
>
> On Fri, 12 Feb 2021 at 12:51, Chris Morgan <macromorgan@hotmail.com> wrote:
> >
> > Update the panel to allow setting the rotation value in device tree.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > index bc36aa3c1123..d8534406d1ef 100644
> > --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > @@ -42,6 +42,7 @@ struct kd35t133 {
> >         struct gpio_desc *reset_gpio;
> >         struct regulator *vdd;
> >         struct regulator *iovcc;
> > +       enum drm_panel_orientation orientation;
> >         bool prepared;
> >  };
> >
> > @@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
> >         connector->display_info.width_mm = mode->width_mm;
> >         connector->display_info.height_mm = mode->height_mm;
> >         drm_mode_probed_add(connector, mode);
> > +       drm_connector_set_panel_orientation(connector, ctx->orientation);
> >
> >         return 1;
> >  }
> > @@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
> >                 return ret;
> >         }
> >
> > +       ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> > +       if (ret < 0) {
> > +               dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> > +               return ret;
> > +       }
> > +
> >         mipi_dsi_set_drvdata(dsi, ctx);
> >
> >         ctx->dev = dev;
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
