Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A3CFE157
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A31C10E5DC;
	Wed,  7 Jan 2026 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305910E5DC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:53:21 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id
 a1e0cc1a2514c-940c539de8fso1228514241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 05:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767794000; x=1768398800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vycy5U/9AuJWYCD1lBGFTu2izKl734E+hv0jo2cmLag=;
 b=p8ZCDj+niOQNvgrHpZtjxXXdOxxaaRjoQjojMpi7GGrm815g7il955p9wMGtxiDL+g
 PxmdFUhcCCG0vcV9XGa7Oap1KVvDgTbNb1kUMhkbZXJib9gddf932xZwGfz2ju1dBHKi
 YBcdCdsxdgndFtUVU+L3Ht74V+UNcYorp+XizcVqPWQGDJAIFlxBI3SZ/8KZQc45xQ+s
 9ZBxhe7SBp/GuE13UhJuPKNyhJJvd/COTB9R8S5RhfR/TUQ9jaD/2zUFlM4t/PqdE+47
 Ro+QJy5XNTOp7UHyVpKp0rpJ4Z/v9UgbdBotjx2iKnym40S618xrrwPkoDQySTrwK93e
 H5ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB1vHmcqkcMqYrLJTeg5hAM/bxocSE0G+y6Ec+dCRTnmniCiQztFVwFygTEkaCB/Y0ykDYuENUwEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+J0ZqY0R5LluU+de7pbN9Fq2+Czzu1xiNrJIVLWVfCTF5UBaH
 vTh4E139IXa51KuyteF8niH4TLKoFeI/lwGVdCy455bWFLTW8lnO1EmDRtxlvtl0
X-Gm-Gg: AY/fxX7eC7QCcyJUts4X+7wOt2RpYML1pY4ccfMbZJBAlTXhZZdibbgdGzy/VwrS6eR
 U4dfDZAcLD+CAN0U23IUsWtHAhOOZ73eyTpRTdQDzvT5dyLY0nTZ8HjnR6vS+U7PApDWpzZ8pJN
 ZJnanCQN3sggbGceay7TVckAOWsyZIrsKC0e9tc/4ygciqalhfbiU+NTL2ZFGu4u5iIJv2FJLVL
 y7qGQiInP+dwhRfvpuTXuySHPuKo+ZMZhKamtOrQ6bJB2ZKEbF7gWooAluZdMccfHJlhgWGshNa
 a5uAdFmHyJa7K86R7EaftRSJlhZC+ETvoQWTRoZxZWUt+9TVRfoAwJvWL/08fiwKU171at0HLkl
 PYqyS7PQVKr6co3UGGxfb/PecZQXKx2W//qNrIrPeo7SZSYbSrBvtlR8aMTopxSMOI79FFGxmzV
 8CSQx4niFuKacioQkNvRyq31T6S5gqDiVJvVKjvJ7c6ivsFjokHe9aYnI8Gu0=
X-Google-Smtp-Source: AGHT+IGM6R/uR7zr6bkVkbadaDZg/fw6LwNSqFSq8azEtnMVtQZ1ksjF7C5xESwsSgSBrJoBT/kc3Q==
X-Received: by 2002:a05:6102:162b:b0:5e8:1d93:9214 with SMTP id
 ada2fe7eead31-5ecb68dc102mr946130137.26.1767793999015; 
 Wed, 07 Jan 2026 05:53:19 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec7702f001sm2948438137.5.2026.01.07.05.53.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 05:53:18 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-93f69720a7cso1285332241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 05:53:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXp03mAW4IkYuB1Pdb6Aa+0ynJfd5YFKAKIdApaO0qL6AfCbC4ZLz2KCjZf8g+c7j1Wu+kVb3aScQw=@lists.freedesktop.org
X-Received: by 2002:a05:6102:548b:b0:5db:cec7:810b with SMTP id
 ada2fe7eead31-5ecb6904d1cmr977705137.29.1767793997513; Wed, 07 Jan 2026
 05:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
 <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
 <dda4052e-b843-43fa-850c-a1bb20e4a8e3@kernel.org>
 <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
 <487ac672-3a2e-4897-aaba-7ae44bcf341a@gmx.de>
In-Reply-To: <487ac672-3a2e-4897-aaba-7ae44bcf341a@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 14:53:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqHUrg6XwqXCSwv-3TwiYUOfbBMpMiuS89d1uwChBYaQ@mail.gmail.com>
X-Gm-Features: AQt7F2r20-H4V61D0OQVUYmKrX0oHF-Wf_klXq13jKUBCAwI3lTwG7W_lz7xlEY
Message-ID: <CAMuHMdUqHUrg6XwqXCSwv-3TwiYUOfbBMpMiuS89d1uwChBYaQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Helge Deller <deller@gmx.de>
Cc: Vincent Mailhol <mailhol@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>
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

Hi Helge,

On Wed, 7 Jan 2026 at 13:21, Helge Deller <deller@gmx.de> wrote:
> On 1/7/26 11:36, Geert Uytterhoeven wrote:
> > On Tue, 6 Jan 2026 at 21:10, Vincent Mailhol <mailhol@kernel.org> wrote:
> >> On 06/01/2026 at 12:48, Geert Uytterhoeven wrote:
> >>> Thanks for your patch, which is now commit bd710b3da7308cb1
> >>> ("video/logo: move logo selection logic to Kconfig") in fbdev/for-next.
> >>>
> >>> On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrote:
> >>>> Now that the path to the logo file can be directly entered in Kbuild,
> >>>> there is no more need to handle all the logo file selection in the
> >>>> Makefile and the C files.
> >>>
> >>> This may do the wrong thing when booting a multi-platform kernel.
> >>>
> >>>>
> >>>> The only exception is the logo_spe_clut224 which is only used by the
> >>>> Cell processor (found for example in the Playstation 3) [1]. This
> >>>> extra logo uses its own different image which shows up on a separate
> >>>> line just below the normal logo. Because the extra logo uses a
> >>>> different image, it can not be factorized under the custom logo logic.
> >>>>
> >>>> Move all the logo file selection logic to Kbuild (except from the
> >>>> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
> >>>> one entry for each logo type (monochrome, 16-colors and 224-colors).
> >>>>
> >>>> [1] Cell SPE logos
> >>>> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/
> >>>>
> >>>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> >>>
> >>>> --- a/drivers/video/logo/Kconfig
> >>>> +++ b/drivers/video/logo/Kconfig
> >>>
> >>>> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
> >>>>   config LOGO_LINUX_CLUT224_FILE
> >>>>          string "224-color logo .ppm file"
> >>>>          depends on LOGO_LINUX_CLUT224
> >>>> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
> >>>> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC
> >>>
> >>> E.g. an m68k multi-platform kernel including Mac support will scare
> >>> non-Mac users into thinking their machine was assimilated by the
> >>> Apple Empire...

> >>>> --- a/drivers/video/logo/logo.c
> >>>> +++ b/drivers/video/logo/logo.c

> >>>> -#ifdef CONFIG_LOGO_MAC_CLUT224
> >>>> -               /* Macintosh Linux logo on m68k */
> >>>> -               if (MACH_IS_MAC)
> >>>
> >>> MACH_IS_MAC can be a runtime check.
> >>
> >> OK. I missed this.
> >>
> >> I think there are two options to fix this:
> >>
> >>    1. Keep CONFIG_LOGO_MAC_CLUT224 untouched
> >>    2. Remove logo_mac_clut224.ppm
> >>
> >> The first option is less controversial but I would like to ask you what
> >> you think about removing the logo_mac_clut224 file.
> >>
> >> Here, we are speaking of the Macintosh 68k which ended sales in 1995,
> >> right? So the user base should be rather small, I guess.
> >
> > Yes, the user base is small.
> >
> > BTW, the only reason you don't have this issue with MACH_DECSTATION and
> > the various SGI_IP* options is that MIPS does not support multi-platform
> > kernels.
> >
> >> And people who still want the custom MAC logo would still be able to add
> >>
> >>    CONFIG_LOGO_MAC_CLUT224="path/to/logo_mac_clut224.ppm"
> >
> > LOGO_LINUX_CLUT224_FILE ;-)
> >
> >> to their config to restore the old behaviour anyway.
> >>
> >> My choice would go more toward the removal option but what do you think?
> >
> > I am not too attached to keeping the dynamic behavior for the Mac logo,
> > I just wanted to point out the impact.
> > I expect most people who care about logos (in products) just have their
> > own custom out-of-tree code.  As fb_find_logo() and the underlying
> > infrastructure still exists, I don't expect them to have too much
> > trouble forward porting that to newer kernels.
> >
> > What do other people think?
>
> This is about a small visible icon. It's not some relevant feature.
> So, I think it's unfortunate that the patch then drops the specific mac logo.
> But adding additional coding and complexity to simply make this logo
> visible for such a small user base IMHO does not justify the effort.

This patch does not drop the specific Mac logo.
Instead, it prioritizes the Mac logo over the generic logo when Mac
support is enabled in a multi-platform kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
