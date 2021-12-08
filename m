Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348446D340
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 13:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27776FDC8;
	Wed,  8 Dec 2021 12:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675ED6FDC1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 12:25:56 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id u68so1421125vke.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 04:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8jEZuxyTH0INbolsiPEAQffoHG2ckrzZgo9Hq7QWaxk=;
 b=GuKIEBQmKinFJmGg95El8SSjbGmEJNsOK2sTL2LLLmBIf+791YlYXzgL2N2b4nFxV3
 tAA19svpUoTR3z1I6605kjWoY8s0n1i5lj//2hq0Fis913/57QC9hb19VVHXOWFe3fQd
 AdhxJlvKnaXxP4W1IVwqGmlALmmoNnUwo4IWxw4Xr1wjZlau8zUyTYkfDHBlRk/dEwWF
 ezgv0/HA7V+CwgqO893ZDIyjmI4iDytojBuIUGUtqlWxYXcVX63J+/aVBVdlNwWn2o5b
 Zs6Mjf73R1R54rT3mNkB+hSF+gkJWN/nARMbiZQdQ8AssFvqm6vNQTBW/RZsbxUCVqhk
 GF7w==
X-Gm-Message-State: AOAM532b/CjNABaePC8Zdhl1OkoqCulJvNj+gyFgf0uVC90JlCu/Xf4l
 epUJCKghtgtLU7HeaSZndGVXBvAEKy7+vw==
X-Google-Smtp-Source: ABdhPJxaOZO8bJVrocJ4qV+Z0o7eZQtqV652evMDMQydkwMZjWx/6zgTXXGgbn4oCyVgLBrvM9/iqQ==
X-Received: by 2002:a05:6122:889:: with SMTP id
 9mr61789061vkf.21.1638966355345; 
 Wed, 08 Dec 2021 04:25:55 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id a5sm1657567uaj.17.2021.12.08.04.25.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 04:25:55 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id p2so4300491uad.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 04:25:54 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr8228271uae.122.1638966354316; 
 Wed, 08 Dec 2021 04:25:54 -0800 (PST)
MIME-Version: 1.0
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
In-Reply-To: <163896464129.995700.3492964836875185548@Monstersaurus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Dec 2021 13:25:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8=ZftyH2_WVxQ6_=X81UniF3q+uGveHAv+nz2QYtjrQ@mail.gmail.com>
Message-ID: <CAMuHMdX8=ZftyH2_WVxQ6_=X81UniF3q+uGveHAv+nz2QYtjrQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Wed, Dec 8, 2021 at 12:57 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > Use the dev_err_probe() helper, instead of open-coding the same
> > operation.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> >         /* DRM/KMS objects */
> >         ret = rcar_du_modeset_init(rcdu);
> >         if (ret < 0) {
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev,
> > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > +               dev_err_probe(&pdev->dev, ret,
> > +                             "failed to initialize DRM/KMS\n");
>
> I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> Seems like a nice feature when exploring devices that are still waiting
> to probe. Is the message still appropriate enough in that case?
>
> I think it's probably fine, so

I have no idea why it could fail. So if you think the message is
fine, it must be fine ;-)

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
