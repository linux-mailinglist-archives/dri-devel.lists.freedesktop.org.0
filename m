Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B7CF8235
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD12710E0E5;
	Tue,  6 Jan 2026 11:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8310E0E5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:48:24 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id
 71dfb90a1353d-560227999d2so279762e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767700103; x=1768304903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eme3GKSVVTwekk5ahSqs0LbJRLjiKfIn3cO6kiKk5PI=;
 b=vv7CEJyM6mtEzQSoC5FwFwpsI5ZJ/NN5SOxZvslICtsW+7ArWcfMxHKEuTpJNrJ+pl
 OoAK5IU803MPny5k0nxkuKwRrAWV7dlVOkxiBch1YyMgCZLNXVLVJVLh6Jb2sFRuuEt5
 AL73Khhw8GFQuprvRF8xMxLcLNdwDrOZW0ND5GFAkIKYcXRrvS+MPnSH7mF2g4+qUfha
 zCp/BCPGycdvvMSeO7GEmwhwKnR96cD+BhgTddRXh3e3O/WTIAs/HiLjIi+63h9uTP5L
 lP64LL5i/0M1MsnpoSEdCDrzdCLZGYoqeCCGKQij7BysJ09eaRtACjyfb6RMv3wIxkPX
 cimw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKohXVbJCLIBCxOQYPHIJCJuxOksn89RLcteLkWljdYOFtC9goyqE/xy/K7hLkKimCNKkwNEo4ZN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQzISyuvy5iAz6zq2xsbkpbehMYbdhACdOmzdAZbqh5XeC1X/m
 YCgTRhCojsRdHKssnP5TGmGH3KHzLRSlmKJ6jpmG3tgn6QOzvuZ74fLguB3r/Xvk
X-Gm-Gg: AY/fxX6VFY8X7mmFGJgeH4q5y16/PH5bcbbQI0zg0WI3cpy8h56vhtEXT+evGATViEg
 en11xhAsLHnicYEty4pamBOPT+FvO+U3zHNZgJLv+nuy6fwm5mg0pUB57CAWD1BfzNJogo6A6kM
 fQIOdzkCsFOlyMMyxR8k937tMTncyo5spMr06zRrefuZq9HHYGUgVnsOJ/o4YZuVMtkfCD8qFpt
 omJIMTMo9p3EPlRTEHWcIOE/Zr2O/RSS3QI5WPXvD6DhFcNblU4Ju/vNWfln7+pWuCn0pMbz1XX
 EysnCd/4YcDbi26AWps2Ik5i+RVjgIG27GH/j3hCg9gcBUuVF+YfumHatrULlkH7c+OvlVLDGx9
 ctK7bHGw+am9j+m2VrdNulA309T4K0CmgEe29VfBxyqsef2D1xI2d/XXJMECJ9YhKdMDA1uGjIO
 3MTWgUk08eAZq9Z+BeVFZM2UDAlB8elJVN4vywVo+hQxKcrUIn
X-Google-Smtp-Source: AGHT+IFPt1nNymToyIchcI4dl34/fKMT9BIQ37YZ7s0AraVTAIwR1D9zy8Kxv0WLiJPZfFqVgutryQ==
X-Received: by 2002:a05:6102:3912:b0:5df:b5d4:e477 with SMTP id
 ada2fe7eead31-5ec7455fc35mr684504137.40.1767700103212; 
 Tue, 06 Jan 2026 03:48:23 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944124a34acsm594391241.10.2026.01.06.03.48.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 03:48:22 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-9412512e9f3so250263241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcUwQWfBy+mYJeE3WNTujmduZCiG5zZrPaLGADkfSbSjQ3TOoIWNyXPnH4xOPBRsbjmHP24EWfF+Y=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3588:b0:5db:d411:20cd with SMTP id
 ada2fe7eead31-5ec744a8304mr863867137.28.1767700102655; Tue, 06 Jan 2026
 03:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
In-Reply-To: <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 12:48:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
X-Gm-Features: AQt7F2oMgVPDZ6yIPBL4v-hrcVUiy-32V0b_EbYL6M5HBMZvyW9vi5iymuHAylg
Message-ID: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vincent,

CC linux-m68k

Thanks for your patch, which is now commit bd710b3da7308cb1
("video/logo: move logo selection logic to Kconfig") in fbdev/for-next.

On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrote:
> Now that the path to the logo file can be directly entered in Kbuild,
> there is no more need to handle all the logo file selection in the
> Makefile and the C files.

This may do the wrong thing when booting a multi-platform kernel.

>
> The only exception is the logo_spe_clut224 which is only used by the
> Cell processor (found for example in the Playstation 3) [1]. This
> extra logo uses its own different image which shows up on a separate
> line just below the normal logo. Because the extra logo uses a
> different image, it can not be factorized under the custom logo logic.
>
> Move all the logo file selection logic to Kbuild (except from the
> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
> one entry for each logo type (monochrome, 16-colors and 224-colors).
>
> [1] Cell SPE logos
> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig

> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
>  config LOGO_LINUX_CLUT224_FILE
>         string "224-color logo .ppm file"
>         depends on LOGO_LINUX_CLUT224
> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC

E.g. an m68k multi-platform kernel including Mac support will scare
non-Mac users into thinking their machine was assimilated by the
Apple Empire...

> +       default "drivers/video/logo/logo_parisc_clut224.ppm" if PARISC
> +       default "drivers/video/logo/logo_sgi_clut224.ppm" if SGI_IP22 || SGI_IP27 || SGI_IP32
> +       default "drivers/video/logo/logo_sun_clut224.ppm" if SPARC
> +       default "drivers/video/logo/logo_superh_clut224.ppm" if SUPERH
>         default "drivers/video/logo/logo_linux_clut224.ppm"
>         help
>           Takes a path to a 224-color logo in the portable pixmap file

> --- a/drivers/video/logo/logo.c
> +++ b/drivers/video/logo/logo.c
> @@ -48,59 +48,21 @@ const struct linux_logo * __ref fb_find_logo(int depth)
>         if (nologo || logos_freed)
>                 return NULL;
>
> -       if (depth >= 1) {
>  #ifdef CONFIG_LOGO_LINUX_MONO
> -               /* Generic Linux logo */
> +       if (depth >= 1)
>                 logo = &logo_linux_mono;
>  #endif
> -#ifdef CONFIG_LOGO_SUPERH_MONO
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_mono;
> -#endif
> -       }
>
> -       if (depth >= 4) {
>  #ifdef CONFIG_LOGO_LINUX_VGA16
> -               /* Generic Linux logo */
> +       if (depth >= 4)
>                 logo = &logo_linux_vga16;
>  #endif
> -#ifdef CONFIG_LOGO_SUPERH_VGA16
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_vga16;
> -#endif
> -       }
>
> -       if (depth >= 8) {
>  #ifdef CONFIG_LOGO_LINUX_CLUT224
> -               /* Generic Linux logo */
> +       if (depth >= 8)
>                 logo = &logo_linux_clut224;
>  #endif
> -#ifdef CONFIG_LOGO_DEC_CLUT224
> -               /* DEC Linux logo on MIPS/MIPS64 or ALPHA */
> -               logo = &logo_dec_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_MAC_CLUT224
> -               /* Macintosh Linux logo on m68k */
> -               if (MACH_IS_MAC)

MACH_IS_MAC can be a runtime check.

> -                       logo = &logo_mac_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_PARISC_CLUT224
> -               /* PA-RISC Linux logo */
> -               logo = &logo_parisc_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SGI_CLUT224
> -               /* SGI Linux logo on MIPS/MIPS64 */
> -               logo = &logo_sgi_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SUN_CLUT224
> -               /* Sun Linux logo */
> -               logo = &logo_sun_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SUPERH_CLUT224
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_clut224;
> -#endif
> -       }
> +
>         return logo;
>  }
>  EXPORT_SYMBOL_GPL(fb_find_logo);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
