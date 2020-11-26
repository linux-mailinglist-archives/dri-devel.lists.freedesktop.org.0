Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A72C506A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5387B6E81F;
	Thu, 26 Nov 2020 08:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9166E6E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 08:29:55 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id f8so236384oou.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 00:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/vBBElAksTvt4HjurCYnxT73LNYVZ5qmRqRKKnCoNw=;
 b=k6o8tll0yI7dPDLeD5ajQpqTTM2hVLL+mgKVVtNgABXk1eFgcnPHHgpqGsTrMRQDng
 Se7vuJKDHUuty4OyhqKTc5bfawCnNXzkeuyCEAOZ6EKXHBnX7lv1cM4h6mW48UAJ/50l
 ONFV9keNvMRf/WUSTRUJn0+arCwjMJjxgNeQYoxjzJOouZPdLAZsaT3ezAb6de/J3wul
 YpLNC/O1ZMQgSHzKCkQU4EzUcKsymGeZEAtH7IJoI85zyQsC4R/Pej7vde8LoJ+UCqfN
 SDGB/4heFUfqDHv57wM77Qd1NZvIjXafsL1bXHXWpSu7rNrb5ldNPAHVwFqfb8qmMOgu
 G/nQ==
X-Gm-Message-State: AOAM533Er0PsOH6iKkTLl4UTr6tHokPexiw3A53JpTKdp/k4p8Q3mFvM
 +wx1EZKQEupVqI2bHYWOz2karyr6Ah5/OsQw96Q=
X-Google-Smtp-Source: ABdhPJwPulrHQWSHcYoomf4Z7RDCXvKABZRXcws/8ZD9MXQyBQxa3HrEjaME+FqCdHcKa4kGkfEeLCOXS4eDYfiorh4=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr1291425oon.1.1606379394915;
 Thu, 26 Nov 2020 00:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20201126003957.19604-1-rdunlap@infradead.org>
In-Reply-To: <20201126003957.19604-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2020 09:29:43 +0100
Message-ID: <CAMuHMdVpcLc9enskSBJobmHXy3GU5ULdt78ArAr522VXRmty5w@mail.gmail.com>
Subject: Re: [PATCH] fbdev: aty: SPARC64 requires FB_ATY_CT
To: Randy Dunlap <rdunlap@infradead.org>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Thu, Nov 26, 2020 at 1:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> It looks like SPARC64 requires FB_ATY_CT to build without errors,
> so adjust the Kconfig entry of FB_ATY_CT so that it is always 'y'
> for SPARC64 && PCI by disabling the prompt for SPARC64 && PCI.
>
> As it currently is, FB_ATY_CT can be disabled, resulting in build
> errors:
>
> ERROR: modpost: "aty_postdividers" [drivers/video/fbdev/aty/atyfb.ko] undefined!
> ERROR: modpost: "aty_ld_pll_ct" [drivers/video/fbdev/aty/atyfb.ko] undefined!
>
> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- linux-next-20201124.orig/drivers/video/fbdev/Kconfig
> +++ linux-next-20201124/drivers/video/fbdev/Kconfig
> @@ -1277,7 +1277,7 @@ config FB_ATY
>           module will be called atyfb.
>
>  config FB_ATY_CT
> -       bool "Mach64 CT/VT/GT/LT (incl. 3D RAGE) support"
> +       bool "Mach64 CT/VT/GT/LT (incl. 3D RAGE) support" if !(SPARC64 && PCI)
>         depends on PCI && FB_ATY
>         default y if SPARC64 && PCI
>         help

What about letting FB_ATY select FB_ATY_CT if SPARC64 && PCI, and
dropping the "default y"-line, instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
