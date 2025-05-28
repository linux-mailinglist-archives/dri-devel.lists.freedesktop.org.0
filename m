Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2CAC64EE
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1710E1C8;
	Wed, 28 May 2025 08:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BA010E57B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:57:47 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-52ee2242b24so912336e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748422666; x=1749027466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Y6S2fpn88Y+LADx1uQi1HOUbcr69I8wgFh69LrgIRc=;
 b=ueClRGbt3kV9Hnszh3PMgULpndtsUKIZjWekTWe9TdtrzKwCZHjR9u8fR1WUKcI0C1
 waXGr8Kw/tZbBstoPVBpZK4TY5M1ZqnkFfvZbEbXytZLQmMbBd0WdFr/YXfLMYGAssze
 eYTTkKEH/+yaViKU+LNQWUN++DZKz1IMfjEubMyfF+Ziq4VkFqdsNFN4/zVo3uj0Oq+N
 EW/LnOZm3AC+uTtXk+34HEZTK5sj7ZdFenX5H6Z5/6b9KmuFysivpxCiOeUGn35iHvON
 FjpYav3/PeD22FNZytl1jJEuTT7pWmiMfoiURChdt4MP/3fkN/wqUXjLicVt18h9x4SV
 12GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvlE4a9bKTAkYn4K2uaxKs9TJfaHN5QcGXIFWBG1SO3HvluEpeRl6TjSufHa7OwDpMyOnq73R/Pgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT50uQLJQ/b69jpLWKzrI4kTNSG6Q9tn62B5WL4rCgJyLg89MK
 uZ2C9fkb5yOcxqVGXbUCI/gibWM7q+i3CvisO8WlhjcgaRZQDFhZGHo4g7AauHgt
X-Gm-Gg: ASbGncsa+6fdN3A5xVsTH99MuIquIGgu99dRz0AFhfPMLTtFPJe9+66wXGyqCn7qNtk
 yKI4f0IUAa8QM2FxHlaeGqluSD/5vuP78h/RM1oRB259X+CytxAV2EzDi49Yvu2Awh7IeWWXhvi
 S3yD+RYUqfQDG2qvlOC+NO7p3fFZ133zhqKElaYq8VAP0+vMgn86qU/MRfhB0nVcNeTXrTTi3JM
 sio8tp2eol9p1P3rSwbV1rMHaqK3w2J+Dxznc8C7FEdp6PbT6dlcVLi++aIE//IH53fwfxCVa7R
 d3FPXeRxoIGTUOckmQJjnAbMP1rWL00yMk0Il6Zqx7RJDGAUe8LAu6AvlrR/ouPE1UxYtqWAiwr
 GRNaxe3E+FQTw+w==
X-Google-Smtp-Source: AGHT+IGLwQdqUXq9tcQWpto1PkH8BhnsN4G1sQvjKoA75GZ/yaKrdQSEYY33wUCMEBEUZxzaFhuteA==
X-Received: by 2002:a05:6122:3d06:b0:52a:ee1d:f7fd with SMTP id
 71dfb90a1353d-530669b69a0mr468924e0c.8.1748422666114; 
 Wed, 28 May 2025 01:57:46 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53066885015sm593823e0c.24.2025.05.28.01.57.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 01:57:45 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-87def66dbceso1260031241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 01:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9uWHKoNZilG9Bn+W+whHMZAFoXDYAmrmu+w5vibuvENbRX0o2qy7UHRcFSRADpzs4xXbNYNI5sj4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6c6:b0:4e5:5c14:5935 with SMTP id
 ada2fe7eead31-4e59ed21195mr675818137.2.1748422665738; Wed, 28 May 2025
 01:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
 <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
 <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
 <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
 <72078ec9-25a0-42d5-b7da-b0a974033f86@helsinkinet.fi>
In-Reply-To: <72078ec9-25a0-42d5-b7da-b0a974033f86@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 10:57:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDdrMewGgeghr3cwtaBvieguYOC4GZ-EXZmA+w5S4bpw@mail.gmail.com>
X-Gm-Features: AX0GCFvEQkwp2oID6KSffEq9L6LrcoEy6JF-dSlC7UnCWkDvCuPecuCzc1Xha6A
Message-ID: <CAMuHMdXDdrMewGgeghr3cwtaBvieguYOC4GZ-EXZmA+w5S4bpw@mail.gmail.com>
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

On Wed, 28 May 2025 at 00:47, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 25.5.2025 15.05, Geert Uytterhoeven wrote:
> > On Thu, 22 May 2025 at 00:56, Eero Tamminen <oak@helsinkinet.fi> wrote:
> >> On 21.5.2025 10.06, Geert Uytterhoeven wrote:
> >>> I do keep it up-to-date locally, so I could provide these changes,
> >>> if you are interested.
> >>
> >> Yes, please!   (see below)
> >
> > Sorry for taking so long:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=atari-drm-wip-rebasing
>
> Thanks!
>
> I did boot testing on Hatari emulator with a minimal kernel config
> having atari_drm enabled, atafb disabled, FB & boot logo enabled.
>
> Under Falcon emulation:
> - RGB/VGA => works fine
> - Mono monitor => panic
>    "Kernel panic - not syncing: can't set default video mode"
> Under TT emulation:
> - RGB/VGA => boots, but console is black[1] (palette issue?)
> - Mono monitor => looks OKish[2], but has constant warnings:
> -----------------------------------
> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_atomic_helper.c:1720
> drm_atomic_helper_wait_for_vblanks+0x1a0/0x1ee
> [CRTC:35:crtc-0] vblank wait timed out

I am not sure this is a bug in atari-drm, or just an issue when using
DRM on slow machines.

> -----------------------------------
>
> Under 030 ST/STe emulation:
> - RGB/VGA => boots, but console is black (palette issue?)
> - Mono monitor => looks OK, but has constant slowpath warnings with:
>    "[CRTC:35:crtc-0] vblank wait timed out"
>
> => Any advice on the issues?

Are these regression in atari-drm, or do they happen with atafb, too?

> PS. I also profiled where most of time goes from "atari-drm" probing,
> until boot reaches user space.  On a minimal -Os built kernel, running
> on (emulated) 32Mhz 030 Falcon, in the default 640x480@4 resolution:
> ----------------------------------------------------------------
> Time spent in profile = 15.29712s.
> ...
> Used cycles:
>    22.37%  22.42%  25.35%   _transp
>    19.15%  19.19%  46.82%   atari_drm_fb_blit_rect.isra.0
>     8.09%   8.09%  13.80%   sys_copyarea
>     3.94%   3.95%   6.23%   sys_imageblit
>     3.69%   3.69%   3.69%   fb_copy_offset.isra.0
>     2.12%   2.13%   2.41%   atari_scsi_falcon_reg_read
>     2.03%   2.03%   2.03%   fb_address_forward
>     1.85%   1.85%  17.98%   fbcon_redraw_blit.constprop.0
>     1.81%   1.81%   2.04%   atari_keyb_init
>     1.78%   1.78%   1.98%   fb_reverse_long
>     1.58%   1.58%   1.90%   arch_cpu_idle
>     1.05%                   memcpy
>     0.95%                   memset
> ...
> ----------------------------------------------------------------
>
> => atari-drm blitting takes half the time during boot.

Yeah, conversion from chunky to planar is expensive.
Would be great to have a text console that operates directly on the
buffer used by the hardware...

> Building kernel with -O2, changes above rather radically, both
> time-wise, and where that time goes:
> ----------------------------------------------------------------
> Time spent in profile = 6.54049s.
> ...
> Used cycles:
>    17.61%  17.61%  17.61%   sys_copyarea
>    11.18%  11.18%  13.11%   arch_cpu_idle
>     7.53%   7.55%   8.45%   atari_drm_fb_blit_rect.isra.0
>     4.26%   4.27%   4.76%   atari_keyb_init
>     2.70%   2.70%   2.93%   atari_scsi_falcon_reg_read
>     2.45%   2.45%  23.81%   fbcon_redraw_blit.constprop.0
>     2.35%   2.35%   2.48%   sys_imageblit
>     2.12%   2.12%   5.89%   atari_floppy_init
>     1.97%                   memset
>     1.31%                   memcpy
> ...
> Instruction cache misses:
>    27.14%  27.14%  27.14%   sys_copyarea
>     3.77%   3.77%   4.05%   atari_scsi_falcon_reg_read
> ...
> Data cache hits:
>    63.55%  63.55%  63.67%   atari_keyb_init
>     7.61%   7.62%   7.84%   atari_drm_fb_blit_rect.isra.0
>     3.86%   3.86%   3.86%   sys_copyarea <= not much hits for copying
> ...
> ----------------------------------------------------------------

So it would be worthwhile to factor out the code that is most
performance-critical into its own file, and use CFLAGS_foo.o += -O2
(or even -O3? or other options?) in the Makefile to build it with a
better optimization level.

> However, -O2 build has the downside that the resulting kernel Oopses
> once it reaches user-space, if 030 data cache emulation is enabled:
> ----------------------------------------------------------------
> Run /init as init process
> ...
> Instruction fault at 0x0041a256
> BAD KERNEL BUSERR

Interesting...

Thanks a lot for testing, and for your analysis!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
