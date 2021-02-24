Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21432474B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 00:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D4289F06;
	Wed, 24 Feb 2021 23:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97AF6E0AF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 22:07:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v5so5377039lft.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 14:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCdoHCVRW6Uw+htUzuKdKcryTZrIcnlOlaF3QBuNtPI=;
 b=pnfdAvL37lGRaGRydf12E8mxjbnYckr76o9iZqqwKGNIYqAxxNGTM2JCpBpoBS//2K
 BMsPbSlUCyBzB3Rob93WRFdo4i3ks0QUBkLGtf7oZ7SPl7eU/YHpQjSVZeSsc7ZYNStM
 23Wr6q1e4LcQQ4mONp2zzbsjODwEsL+LFrJWuLQQRW7x/d03v6bEe8CJvP0T3HuaUysm
 zCxzjoF2LdHmtzHjKpEuWY5sxmnhqDSORb8iZ3Mm9bO9jXNrjBTffIUjCiW1e0qO3Rkf
 lHF+n6QAknb+Z59FZvhdxmuHMZ0khMOf9GFzp68cPvCSxb1pPeoyalzTPVeXJN0e+wH0
 /Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCdoHCVRW6Uw+htUzuKdKcryTZrIcnlOlaF3QBuNtPI=;
 b=o24ml+tLzCLjNkjbtaYp/3m9Y4v6e1i5mOFHCrsrP78iL08xrCa5qxTmnfjqmDuXdi
 pLZE2eAFeBaOnp0CAMTTzzCUSvLf38yZi3zpnpQKkmWAe1VgwsHTSPt/FV9/qEx3BjY6
 PakWPPSpWudpVna0KxK6oHj5PYV3Xv0YG4R2M9A1SW+VxH5VZMy7iziJ0FbDmw8Wz8qQ
 oyap0tA4Btdyn3wa/wLfuZ9ui8U5qTSWWZ6OkBPPvtInkx5CqtEXTlLWiIisvJN6H+F1
 ucgFPg0POdIsPgDHNjWQB0Uwud7NoDelGcWlBXQhzMjHvs6m77RGfyaYnB0W8Kk6+Naq
 wKRQ==
X-Gm-Message-State: AOAM533k0o5MyxhM12NeQW9JAlQDalSgAe4PXQiJjC5auARK6an4fqJJ
 tPnz9k/+YJ4E68Xka5C7ZJ7ctgs0NwGGIhGmyjiGQw==
X-Google-Smtp-Source: ABdhPJz4YqzngUtUWoxP68nx2sq4pyb8wRaKvHohcg8WvubxikscM+3Aju23zh4SaSvsKF9losKLM8y7MOnikkOAKIY=
X-Received: by 2002:ac2:515c:: with SMTP id q28mr33504lfd.297.1614204454807;
 Wed, 24 Feb 2021 14:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20210224215528.822-1-rdunlap@infradead.org>
In-Reply-To: <20210224215528.822-1-rdunlap@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 24 Feb 2021 14:07:23 -0800
Message-ID: <CAKwvOdn5mF4UQ9F1h-ZSRKUk3Yq8QS4AExV6kCFY88W3KsK72g@mail.gmail.com>
Subject: Re: [PATCH -next] fbdev: atyfb: always declare aty_{ld,st}_lcd()
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Wed, 24 Feb 2021 23:03:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> The previously added stubs for aty_{ld,}st_lcd() make it
> so that these functions are used regardless of the config
> options that were guarding them, so remove the #ifdef/#endif
> lines and make their declarations always visible.
> This fixes build warnings that were reported by clang:

Yes, though I think GCC would warn similarly with W=1 builds as well,
which was set for the 0day bot report.

>
>    drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype for function 'aty_st_lcd' [-Wmissing-prototypes]
>    void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>         ^
>    drivers/video/fbdev/aty/atyfb_base.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>
>    drivers/video/fbdev/aty/atyfb_base.c:183:5: warning: no previous prototype for function 'aty_ld_lcd' [-Wmissing-prototypes]
>    u32 aty_ld_lcd(int index, const struct atyfb_par *par)
>        ^
>    drivers/video/fbdev/aty/atyfb_base.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    u32 aty_ld_lcd(int index, const struct atyfb_par *par)
>
> They should not be marked as static since they are used in
> mach64_ct.c.

Probably don't need to be marked extern either (since that's the
implicit default), but I don't feel strongly about it.

Thanks for sending a cleanup for this.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: bfa5782b9caa ("fbdev: atyfb: add stubs for aty_{ld,st}_lcd()")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/video/fbdev/aty/atyfb.h |    3 ---
>  1 file changed, 3 deletions(-)
>
> --- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb.h
> +++ linux-next-20210219/drivers/video/fbdev/aty/atyfb.h
> @@ -287,11 +287,8 @@ static inline void aty_st_8(int regindex
>  #endif
>  }
>
> -#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
> -defined (CONFIG_FB_ATY_BACKLIGHT)
>  extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
>  extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
> -#endif
>
>      /*
>       *  DAC operations



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
