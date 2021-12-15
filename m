Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681434756DD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3604910E1CE;
	Wed, 15 Dec 2021 10:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86D10E227
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:48:43 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id y22so4217334uap.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cg7yOGJDlU0Mni4Xc1kCqSOclmAWUL4qQtedj2y8EoU=;
 b=wus/o/3mqPkQY3s7j5pzsWbwWbKeIZgVyAUhC35FE12ywIVZK3zsgkawxo+72FLRmQ
 muKL3IB4Cs3GirL9Vy5OwHqFpZh+g1Yx3yrBS8J1GUXjgdeLpShgzFCi1tsQRZkK674S
 lDDIKcfvg0BgOt+7W08iee35ULdOErIhecTqLkJEaVc6rUSSDJzJqarfY+EKxL7IoicS
 5YpL0lgq10CDUktgmhkxoIo5oca2+wH+9GZ6smGvle0smOMVNmVVLkagVqCvKy/gIbNp
 ztKDE8b5+TXRX1D4zllXnoxdlKYkJlwT0U9fwVvzWPd5pctqZ9HyzFhKiGVfwsXqpC3a
 LQdw==
X-Gm-Message-State: AOAM531oTvK0FHoouNP9gq/jZCQ3x/Fm3fKt7UF4NC/C89cv9/JtJpRz
 BER9h2d7prbsuBRVFdhhhz+i2mnRxS6lpw==
X-Google-Smtp-Source: ABdhPJzMV6YiZ3Sir04n/HSr6UKghAdxCAYLU1eT4AAqYCRLVGcaptKkvFnTeAY3OMp4GRZiv7nRYQ==
X-Received: by 2002:ab0:7784:: with SMTP id x4mr9211964uar.143.1639565322581; 
 Wed, 15 Dec 2021 02:48:42 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id k91sm334733uak.5.2021.12.15.02.48.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:48:42 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 30so40141207uag.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 02:48:41 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr9023652uai.89.1639565321818;
 Wed, 15 Dec 2021 02:48:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639559338.git.geert+renesas@glider.be>
 <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
 <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
In-Reply-To: <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:48:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUo2DNexnyWG-r-=8Pg_4fPjtM14rH1WzuFgQXgYeE0Gw@mail.gmail.com>
Message-ID: <CAMuHMdUo2DNexnyWG-r-=8Pg_4fPjtM14rH1WzuFgQXgYeE0Gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: DRM_RCAR_DW_HDMI should depend on
 ARCH_RENESAS
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 15, 2021 at 11:24 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 15, 2021 at 10:27:45AM +0100, Geert Uytterhoeven wrote:
> > The Renesas R-Car Gen3 and RZ/G2 internal HDMI encoder is only present
> > on Renesas R-Car Gen3 and RZ/G2 SoCs.  Hence add a dependency on
> > ARCH_RENESAS, to prevent asking the user about this driver when
> > configuring a kernel without Renesas SoC support.
> >
> > Fixes: 40d0fa7095d06c73 ("drm: rcar-du: Add Gen3 HDMI encoder support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> Let's move this entry first to keep alphabetical order.

I tend to keep the "hard" and "soft" dependencies separate, with the
"hard" dependencies listed first.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
