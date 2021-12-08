Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D146DAF5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 19:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECBD6EC08;
	Wed,  8 Dec 2021 18:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005506EC08
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 18:23:38 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id l24so6340972uak.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 10:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7XrYi4tTR58dtbzk1bmcm8TwxPajFFkIsyUlKABfow=;
 b=kDX9Mus81LFjqV1AYGRzLH1AKeILAf/3iEqxBIe3BGTg7CZbXV/jHlHe2cWAgeOfBD
 TsYCUlNHJm4blnrfKlEpmWpGrDW0pqA3NYBeG9Q+GPGXsX052kmxrbugHjXpQbQs92yT
 5CqrsHmGi6lwUc0g8GMDmO0M94AbRaWAkfH7TzwOvmoOuFqAwcniV4La8nBs3ed0dU9M
 b8exG8jwzLQjcnSuUpllouxY6nfqIHqwiTiomzkVmH9jh2Flqkf6mJLvGRx5w+waDo+u
 o6OiIXGHNP4I03iyWE8bucWAZLlJP6SQ7Y42NAhDOowvPxIlEgwkOwXa5KrwW2y1kv8i
 llQw==
X-Gm-Message-State: AOAM532upKb7hOLrVb7fQnY/FTV0BqV+Gz5XZlFYPwodHUdJWfOp9s/V
 OC5fTdKYf/TSRyUzefhiQ9ymwvi3jRcYUw==
X-Google-Smtp-Source: ABdhPJztl7OU8/CgyIXIIwtMI4ACn/v9hmjeyKsT9DbyBgeTHJmx0yVAOfkF/e6IuMID2ZPmPo5csg==
X-Received: by 2002:a67:fb41:: with SMTP id e1mr435397vsr.28.1638987817635;
 Wed, 08 Dec 2021 10:23:37 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id f26sm2273617vkl.51.2021.12.08.10.23.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 10:23:37 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id j14so6234997uan.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 10:23:37 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr389275vsg.57.1638987817118; 
 Wed, 08 Dec 2021 10:23:37 -0800 (PST)
MIME-Version: 1.0
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
 <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
In-Reply-To: <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Dec 2021 19:23:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
Message-ID: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 8, 2021 at 7:00 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 08, 2021 at 11:57:21AM +0000, Kieran Bingham wrote:
> > Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > > Use the dev_err_probe() helper, instead of open-coding the same
> > > operation.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> > >         /* DRM/KMS objects */
> > >         ret = rcar_du_modeset_init(rcdu);
> > >         if (ret < 0) {
> > > -               if (ret != -EPROBE_DEFER)
> > > -                       dev_err(&pdev->dev,
> > > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > > +               dev_err_probe(&pdev->dev, ret,
> > > +                             "failed to initialize DRM/KMS\n");
> >
> > I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> > Seems like a nice feature when exploring devices that are still waiting
> > to probe. Is the message still appropriate enough in that case?
>
> It's a very generic message, so it's not ideal. One issue is that
> dev_err_probe() replaces any currently stored probe deferral reason
> message, which means that we'll override any message previously set. We
> don't set any message now, but we should (in rcar_du_encoder_init(),
> there are two main code paths where -EPROBE_DEFER is expected), so this
> patch would then get in the way I'm afraid.

If rcar_du_encoder_init() will handle the printing of errors, there is indeed
no more reason for rcar_du_probe() to do that, so the existing dev_err()
with the fuzzy message can be removed?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
