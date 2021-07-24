Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173D3D48FF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 20:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16370734D3;
	Sat, 24 Jul 2021 18:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF49734D3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 18:02:05 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id f4so1106066vkb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 11:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFAXOYswwIGflCWWx9fpDZl57pj1QpRpAZ3Zwc4ZdWQ=;
 b=tH4DrQoHXbvbWmYeLsSgpl3EFn1xxlVutzGZnh8QROGfUczwzzQc4tiQ4DNmM8DOY2
 OKNI27L73V2TamxcddbdMEb2iwRm+Y114sSionH5c++AK2hKUmistwaMu8cwT3ymG6vU
 D5+y5MkfjcU1MPaQhzScr+V29PBIvU+iAVHxjghgXYA7ToV/aUyWbxdfJ0vQd9kKd2sv
 1W6tvdUyAq0YUOpl2MRFOJwrqZOXZAhnvPtZLfY8aM/ak9PhcEHjaJG5QgkT1YuBRq43
 6uon9IYjXTzIwyqEgMfkPQpCGsHwPxq4MMSXruObrJ2z25X0M5+BlF+MGlvGYXwQ2gjB
 i4pg==
X-Gm-Message-State: AOAM5321WKyIzzSyzIkrM79JskZXYL7B5F5V2TqsdoXmu/iDtqNHceg7
 nN+JcMFyu+wNcfJ+dr8LOMlKYx5nY9iE9RuLiY0=
X-Google-Smtp-Source: ABdhPJznGi7hzvA1p2VsWdfv9lBV4MVLJwhvR4BKSFCYB+5JUdtBAWgTUa81Xuz+HTQ+Zc8W97HV8XtBugNdFeb48jQ=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr7348420vkn.1.1627149724368; 
 Sat, 24 Jul 2021 11:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-4-len.baker@gmx.com>
In-Reply-To: <20210724151411.9531-4-len.baker@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 24 Jul 2021 20:01:53 +0200
Message-ID: <CAMuHMdX6PUr0irndogg=Aa+AFDdiDJMeMWM74mLBkuLrW+zWng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging/fbtft: Fix braces coding style
To: Len Baker <len.baker@gmx.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Len,

On Sat, Jul 24, 2021 at 7:44 PM Len Baker <len.baker@gmx.com> wrote:
> Add braces to the "for" loop and remove braces from the "if" statement.
> This way the kernel coding style is followed.
>
> Signed-off-by: Len Baker <len.baker@gmx.com>

Thanks for your patch!

> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c

> @@ -1016,10 +1018,9 @@ int fbtft_init_display(struct fbtft_par *par)
>
>         i = 0;
>         while (i < FBTFT_MAX_INIT_SEQUENCE) {
> -               if (par->init_sequence[i] == -3) {
> -                       /* done */
> -                       return 0;
> -               }

These braces should not be removed, due to the presence of
the comment.

> +               if (par->init_sequence[i] == -3)
> +                       return 0; /* done */
> +
>                 if (par->init_sequence[i] >= 0) {
>                         dev_err(par->info->device,
>                                 "missing delimiter at position %d\n", i);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
