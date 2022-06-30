Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853B562258
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 20:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EFA12A830;
	Thu, 30 Jun 2022 18:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3412A830
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 18:51:42 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id g1so2251773qkl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 11:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpYaioDW3jT2hu8uqTSIqgPPXpyurlp09tw76Zsm3gA=;
 b=zljMdjYdN1dt4uyHv5wE6KHNauFScngtREH5sO28IHiKDjtkAGDVPWcgxKgwmA2AMJ
 IK+6poDZQVa6EaOR+3IEh2N93g1dZP733pRP4j5wpWps0iUgE0odBqNqy45kmv9v7R8a
 tsMf8ZIE3T/Wji/JCQppFQxcm8FlsqSLuRjxIBBizEmVSm56MUVWw7DIrtGUPaH5OKSB
 DGkeOMXUBoEB99J1zPOGtu6zgo8FNWC+qPM/5GveSlBlRW0H3f7Ohs0Pc4DeVJ2DA4AD
 oi8gAB06Y1KQya0iH7L9ZQmD1OQoQlaQN8UbLOmRprc8fAC40btI0Qsp+u+st1ArNuXR
 ouuw==
X-Gm-Message-State: AJIora/igmYpxsfM8mlBt2RU6KRlD9s94QgdzpXj76Poir4BQUj0pfvh
 Zna+Kr6qMKPO47kmkgDbZVR7wEGiZU13ag==
X-Google-Smtp-Source: AGRyM1sv+r0GfLCofKBYyX4oGlvRLh69Y+MkyCxJFjwCx1qdh3vmruEOJwudVqHEpeSFsA7f2RbOZQ==
X-Received: by 2002:a05:620a:4053:b0:6af:2d27:e791 with SMTP id
 i19-20020a05620a405300b006af2d27e791mr7398280qko.555.1656615101558; 
 Thu, 30 Jun 2022 11:51:41 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 l26-20020ac848da000000b003177969a48fsm13183485qtr.21.2022.06.30.11.51.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 11:51:41 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2ef5380669cso2114937b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 11:51:41 -0700 (PDT)
X-Received: by 2002:a81:9bcc:0:b0:317:9ff1:5a39 with SMTP id
 s195-20020a819bcc000000b003179ff15a39mr12759976ywg.384.1656615100904; Thu, 30
 Jun 2022 11:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-2-deller@gmx.de>
In-Reply-To: <20220629200024.187187-2-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 20:51:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW-oh_q7zE6riS8o+tgRmcOxxO_93-FVy9CVCcAOakhg@mail.gmail.com>
Message-ID: <CAMuHMdWW-oh_q7zE6riS8o+tgRmcOxxO_93-FVy9CVCcAOakhg@mail.gmail.com>
Subject: Re: [PATCH 1/5] fbcon: Disallow setting font bigger than screen size
To: Helge Deller <deller@gmx.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> Prevent that users set a font size which is bigger than the physical screen.
> It's unlikely this may happen (because screens are usually much larger than the
> fonts and each font char is limited to 32x32 pixels), but it may happen on
> smaller screens/LCD displays.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
>         if (charcount != 256 && charcount != 512)
>                 return -EINVAL;
>
> +       /* font bigger than screen resolution ? */
> +       if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info->var.yres) ||
> +           font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))

Note that we already have local vars w and h, albeit with the wrong
signedness.

> +               return -EINVAL;
> +
>         /* Make sure drawing engine can handle the font */
>         if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
>             !(info->pixmap.blit_y & (1 << (font->height - 1))))

There were already more opportunities for using w and h before...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
