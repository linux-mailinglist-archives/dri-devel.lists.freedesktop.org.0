Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE2AC8998
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 10:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9803D10E7F6;
	Fri, 30 May 2025 08:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657BF10E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 08:00:00 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-86fea8329cdso1133082241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 01:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748591997; x=1749196797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BIa/rhWcGznumQSCSgsw8TY1J6vFHoHTI/oacCPJn4s=;
 b=oFER28/0Ght77cbVzoz0uL9wzY4fxr0BDjbthhs7UI8VRRwy+mHpIa5Ymouf81gwMo
 Zo50cEkeNsJpBOkWxySNfqgPCexf6wTac+LIIGCNh0zuXTKRE8y2+D6H3EE2u+23Nm7c
 QcpG4KMEEKXpW5ohECEbY87E5WQ/qX2cQ+gIr0xEP9UKf3itFdAS34qrix8izpZ1EGwR
 px25OJaIit/mwKJ/mVzHLzyFSUOoyiSgFIolfXkhmbLXnaF+DWPpyIXoPz5dxRdJLYcz
 s9RVMskKsOoofjmtY9L4nTixnEgtNrnJtoXGA+rzsHXRApCP6mq6BFDLnvHP4mQEaRBr
 rxUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH9/cbUhco9Qq9doYRXbzgOwU7FTsarGDvwzB0K5YDi2NP6NHIC7cezh75G/4ZMHnBoP3lgVAoJqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxws1MD89I4vXXALiHMgwPzqVglz8hf7R1Oghh1hCpNbxfZ1qyQ
 lVPPU8dpgE7kdrMq0rD0vqaQBPosh3WywMDZwKFI9725pgm4oSECGivvJFHRKVgO
X-Gm-Gg: ASbGnctj30DYBjqLoaRE5cWomSZVdxSmGl7ws/k8y0n8rEnf0e1JKmqwY6mZMLY6aSu
 HXV7ekZZPbhxC4ydxYl1O9fPTLzIaj4GOGCPb3kUSG9Y78wBtuiQ7PJ+gIimQUkGOrgdStQppgk
 19OZCq3KFHZKBYBIyKi0kTwAyBYzmE/kLE69jXHXz7YEhs27dQO2Bedq8m6tavA6nsNI8KuC38f
 M2vTfPP0kWHcO7JW+sdFYa/PZJCgiRGpdEpRQ/cgHGSA7LIEXX5/MUPP58+v4M6eZdGHUQthgpX
 K9T2DHA+ByiInkU33HEc6REIuC0j0mfqooLgGL+y/kdG5vFeY6RA3xJUQWJ5+0nJjeidYGHyrBj
 z4pGjenG5KzuBPw==
X-Google-Smtp-Source: AGHT+IGXBUmnqGCQ80xHBi0wPyVozHKD1AlBmufShWqHmNc3EXBtWQ/USx1KQHceXknzISTr5XEnTQ==
X-Received: by 2002:a05:6102:418d:b0:4e5:a309:85e8 with SMTP id
 ada2fe7eead31-4e6e40f692bmr2460665137.7.1748591996966; 
 Fri, 30 May 2025 00:59:56 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e64e9c008asm2377806137.23.2025.05.30.00.59.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 00:59:56 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-87de47585acso1219158241.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 00:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQxIfnCvyIRByvId2rStArQCF7YfFWLhvtTNIaIO69Fsz0cDn0FsxXxIoPNkrBeTLt/8WQ01uPlGI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c8a:b0:4df:9635:210d with SMTP id
 ada2fe7eead31-4e6e41db7c6mr2389073137.23.1748591995453; Fri, 30 May 2025
 00:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
 <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
 <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
 <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
 <72078ec9-25a0-42d5-b7da-b0a974033f86@helsinkinet.fi>
 <CAMuHMdXDdrMewGgeghr3cwtaBvieguYOC4GZ-EXZmA+w5S4bpw@mail.gmail.com>
 <65b78057-c490-46a3-92a7-350d314d604e@helsinkinet.fi>
In-Reply-To: <65b78057-c490-46a3-92a7-350d314d604e@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:59:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhTpcG7uhdoEcSs3qqgtJVtjzXtdp1Xfa-oaKxqGW=QQ@mail.gmail.com>
X-Gm-Features: AX0GCFv1GzlJ2sUyuto4TXy46hiWuy0VbvhpeBdPo_tDmf1ec2QxgJlCcbpqdEI
Message-ID: <CAMuHMdVhTpcG7uhdoEcSs3qqgtJVtjzXtdp1Xfa-oaKxqGW=QQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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

Hi Eero,

On Thu, 29 May 2025 at 02:06, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 28.5.2025 11.57, Geert Uytterhoeven wrote:
> > On Wed, 28 May 2025 at 00:47, Eero Tamminen <oak@helsinkinet.fi> wrote:
> >> I did boot testing on Hatari emulator with a minimal kernel config
> >> having atari_drm enabled, atafb disabled, FB & boot logo enabled.
> >>
> >> Under Falcon emulation:
> >> - RGB/VGA => works fine
> >> - Mono monitor => panic
> >>     "Kernel panic - not syncing: can't set default video mode"
>  >>
> >> Under TT emulation:
> >> - RGB/VGA => boots, but console is black[1] (palette issue?)
> >> - Mono monitor => looks OKish[2], but has constant warnings:
> >> -----------------------------------
> >> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_atomic_helper.c:1720
> >> drm_atomic_helper_wait_for_vblanks+0x1a0/0x1ee
> >> [CRTC:35:crtc-0] vblank wait timed out
> >
> > I am not sure this is a bug in atari-drm, or just an issue when using
> > DRM on slow machines.
>
> This does not trigger with -Os built "atafb" kernel, but happens even
> with -O2 built "atari-drm" kernel.  Something related to the higher (71)
> HZ of the mono monitors?
>
> (I don't think it relates to TT mono monitor's larger 1280x960
> resolution, because it happens also with ST mono monitor 640x400 one.)

DRM vblank handling is part of DRM, so it is not applicable to atafb.

> > Are these regression in atari-drm, or do they happen with atafb, too?
>
> Only the "can't set default video" issue in Falcon mono mode happens
> also with "atafb".
>
> It has neither the above vblank timeout issue in mono mode, nor
> black-on-black color issue in color mode (on TT and 030 ST).

Unless I made a mistake, color handling should be the same for
atari-drm and atafb. Unfortunately I am no Atari hardware expert.

> >> However, -O2 build has the downside that the resulting kernel Oopses
> >> once it reaches user-space, if 030 data cache emulation is enabled:
> >> ----------------------------------------------------------------
> >> Run /init as init process
> >> ...
> >> Instruction fault at 0x0041a256
> >> BAD KERNEL BUSERR
> >
> > Interesting...
>
> There were some extra config differences between my builds for 6.15
> "atafb" and your "atari-drm-wip-rebasing" branch.
>
> After removing the ones I could:
> --------------------------------
> $ diff -ub .config.old .config | grep '^[-+]C'
> -CONFIG_I2C_HELPER_AUTO=y
> -CONFIG_LOGO=y
> -CONFIG_LOGO_LINUX_MONO=y
> -CONFIG_LOGO_LINUX_VGA16=y
> -------------------------------
>
> Bus error issue went away.
>
> => Could there be some issue with how logo and "atari-drm" code
> interact, which could manifest when reaching user-space?
>
> Note: I haven't tried enabling logo with "atafb" + -O2 build. I could
> try that later on.

Logo shouldn't matter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
