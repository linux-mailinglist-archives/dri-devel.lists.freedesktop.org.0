Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C70CFD355
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 11:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C72210E0D7;
	Wed,  7 Jan 2026 10:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E63B10E0D7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 10:37:09 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id
 a1e0cc1a2514c-93f523bba52so516373241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 02:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767782228; x=1768387028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvR5DRwy1DSGr/ekGfe0RQqbV4Hkmy/mYDx8B3sEcoo=;
 b=frRbkmud8fK75fBAcNtJBG/YE/DIHIye6Q6Rkhyhl+9GpMZLmyjSYMWJ3WLThlyN3j
 pET9KPnefZVTFaTAcUTQJ6rw/hx5ZUiu9g640Lz9lNI5cUvygqpY/sZVAw36idlWiAAh
 h0wujYF2KNBA6TaYMJszy/EnCA412Jx4VdFZcSAVYkJYXHqjONt6hmLI6m4x+GSNUaVL
 qgsdn9GzmfOFHrfQtPekFKD4Kifc0FOXvgX4foyyK7JuyGI+2WC0n0wqbBfMnKY+iXBM
 IepwPaQVdPCGKDAPoFcm+OMb4FAcINIF5cFTkgerDlHQvFRxRw4GEK4zoCWKCbvW1yB7
 yU4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEZMxNCVKWsLLfelmO5ODmmADj3xri1479suX/nNdAIpKiTC4Cu1de4nTNLxCS/GZrm/eled/XJYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbP8j61nLfkKSaS6v+O8VJZXggCKbbB60A8ZytGKBOYOzsxl7d
 81h1B3WKR95jxHr7j7jxrZkw4tZDSsrF2LJlxUM+zGahf9+PHn+g+CkoWdqbDumU
X-Gm-Gg: AY/fxX4UR7ZrhSCyytj+5QOgkTJjUjm5RzMoC9gH6/u6afcTcum2r61y0oRUFRz2rxh
 9q1/5dmZPh6rOmnm0YFHyXDF20VXi4EDt/3crdtfu0MbORewyhPhDxFs1CIdujEMnKvPSPyR+sM
 dOruoIU7vD7vSuiNh15gX5qWzSZam9gQ4eydrUzvYfSRfl2BV4uSr+wxrzQsNj9kVw3ELsmyv+o
 Yhu6ZAeYn7ctffTlRfTsAESyihArB8tZV0i/7unpQbNQyAsxTV1JCKahMaYWQCi/GpO+Ka1JKwh
 FASldqaPn8hUL0URz6R+rExC4cIqvVZDSORsTcO/tKoTb/kLgm0xAFOvSj5jR6f2UGDZ1ZaSJKZ
 0ESLcEIFmwq5nVst/4EBsxGXWmiPyfEgdHxE0T+axPu4sMRCdp7RdxuJTjhhnG7ulN09t9Raio5
 PvME9+WSn+kZa9LsVjge0BUZccHAD9XvKfgbNuKygir2fAxjn6VpO/2/HbnOimxgo=
X-Google-Smtp-Source: AGHT+IHtcoDVLmWqopu5WGmfzAnwiH7FyeZosNs4H1kBwzosFiRLA5+WwNWM1bPibPfNijUrUYsZAQ==
X-Received: by 2002:a05:6102:30b0:b0:5ed:ab0:e5d1 with SMTP id
 ada2fe7eead31-5ed0ab0f29amr165068137.15.1767782228277; 
 Wed, 07 Jan 2026 02:37:08 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944124c452asm2266748241.13.2026.01.07.02.37.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 02:37:07 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-55b4dafb425so405580e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 02:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUK2ETfs2TkishDrMt8ancXhP5VDDb0Wvc2UYc3qBLPnjBK5P4Hwo29iNe7BsKOOvSlsoyRAYFJj9Q=@lists.freedesktop.org
X-Received: by 2002:ac5:ccaf:0:b0:54a:8deb:21a7 with SMTP id
 71dfb90a1353d-56339dbf03dmr1504773e0c.4.1767782226762; Wed, 07 Jan 2026
 02:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
 <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
 <dda4052e-b843-43fa-850c-a1bb20e4a8e3@kernel.org>
In-Reply-To: <dda4052e-b843-43fa-850c-a1bb20e4a8e3@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 11:36:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
X-Gm-Features: AQt7F2pWk5T5DK2Ps7GBdxmwjo6y5zM4oGY-k4cbzlgDPgVvKEzWy8YEHXjK3cA
Message-ID: <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
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

On Tue, 6 Jan 2026 at 21:10, Vincent Mailhol <mailhol@kernel.org> wrote:
> On 06/01/2026 at 12:48, Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit bd710b3da7308cb1
> > ("video/logo: move logo selection logic to Kconfig") in fbdev/for-next.
> >
> > On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrote:
> >> Now that the path to the logo file can be directly entered in Kbuild,
> >> there is no more need to handle all the logo file selection in the
> >> Makefile and the C files.
> >
> > This may do the wrong thing when booting a multi-platform kernel.
> >
> >>
> >> The only exception is the logo_spe_clut224 which is only used by the
> >> Cell processor (found for example in the Playstation 3) [1]. This
> >> extra logo uses its own different image which shows up on a separate
> >> line just below the normal logo. Because the extra logo uses a
> >> different image, it can not be factorized under the custom logo logic.
> >>
> >> Move all the logo file selection logic to Kbuild (except from the
> >> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
> >> one entry for each logo type (monochrome, 16-colors and 224-colors).
> >>
> >> [1] Cell SPE logos
> >> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/
> >>
> >> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> >
> >> --- a/drivers/video/logo/Kconfig
> >> +++ b/drivers/video/logo/Kconfig
> >
> >> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
> >>  config LOGO_LINUX_CLUT224_FILE
> >>         string "224-color logo .ppm file"
> >>         depends on LOGO_LINUX_CLUT224
> >> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
> >> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC
> >
> > E.g. an m68k multi-platform kernel including Mac support will scare
> > non-Mac users into thinking their machine was assimilated by the
> > Apple Empire...
> >
> >> +       default "drivers/video/logo/logo_parisc_clut224.ppm" if PARISC
> >> +       default "drivers/video/logo/logo_sgi_clut224.ppm" if SGI_IP22 || SGI_IP27 || SGI_IP32
> >> +       default "drivers/video/logo/logo_sun_clut224.ppm" if SPARC
> >> +       default "drivers/video/logo/logo_superh_clut224.ppm" if SUPERH
> >>         default "drivers/video/logo/logo_linux_clut224.ppm"
> >>         help
> >>           Takes a path to a 224-color logo in the portable pixmap file
> >
> >> --- a/drivers/video/logo/logo.c
> >> +++ b/drivers/video/logo/logo.c
> >> @@ -48,59 +48,21 @@ const struct linux_logo * __ref fb_find_logo(int depth)
> >>         if (nologo || logos_freed)
> >>                 return NULL;
> >>
> >> -       if (depth >= 1) {
> >>  #ifdef CONFIG_LOGO_LINUX_MONO
> >> -               /* Generic Linux logo */
> >> +       if (depth >= 1)
> >>                 logo = &logo_linux_mono;
> >>  #endif
> >> -#ifdef CONFIG_LOGO_SUPERH_MONO
> >> -               /* SuperH Linux logo */
> >> -               logo = &logo_superh_mono;
> >> -#endif
> >> -       }
> >>
> >> -       if (depth >= 4) {
> >>  #ifdef CONFIG_LOGO_LINUX_VGA16
> >> -               /* Generic Linux logo */
> >> +       if (depth >= 4)
> >>                 logo = &logo_linux_vga16;
> >>  #endif
> >> -#ifdef CONFIG_LOGO_SUPERH_VGA16
> >> -               /* SuperH Linux logo */
> >> -               logo = &logo_superh_vga16;
> >> -#endif
> >> -       }
> >>
> >> -       if (depth >= 8) {
> >>  #ifdef CONFIG_LOGO_LINUX_CLUT224
> >> -               /* Generic Linux logo */
> >> +       if (depth >= 8)
> >>                 logo = &logo_linux_clut224;
> >>  #endif
> >> -#ifdef CONFIG_LOGO_DEC_CLUT224
> >> -               /* DEC Linux logo on MIPS/MIPS64 or ALPHA */
> >> -               logo = &logo_dec_clut224;
> >> -#endif
> >> -#ifdef CONFIG_LOGO_MAC_CLUT224
> >> -               /* Macintosh Linux logo on m68k */
> >> -               if (MACH_IS_MAC)
> >
> > MACH_IS_MAC can be a runtime check.
>
> OK. I missed this.
>
> I think there are two options to fix this:
>
>   1. Keep CONFIG_LOGO_MAC_CLUT224 untouched
>   2. Remove logo_mac_clut224.ppm
>
> The first option is less controversial but I would like to ask you what
> you think about removing the logo_mac_clut224 file.
>
> Here, we are speaking of the Macintosh 68k which ended sales in 1995,
> right? So the user base should be rather small, I guess.

Yes, the user base is small.

BTW, the only reason you don't have this issue with MACH_DECSTATION and
the various SGI_IP* options is that MIPS does not support multi-platform
kernels.

> And people who still want the custom MAC logo would still be able to add
>
>   CONFIG_LOGO_MAC_CLUT224="path/to/logo_mac_clut224.ppm"

LOGO_LINUX_CLUT224_FILE ;-)

> to their config to restore the old behaviour anyway.
>
> My choice would go more toward the removal option but what do you think?

I am not too attached to keeping the dynamic behavior for the Mac logo,
I just wanted to point out the impact.
I expect most people who care about logos (in products) just have their
own custom out-of-tree code.  As fb_find_logo() and the underlying
infrastructure still exists, I don't expect them to have too much
trouble forward porting that to newer kernels.

What do other people think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
