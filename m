Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85432ABECC2
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F910E687;
	Wed, 21 May 2025 07:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951D10E6A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:06:49 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-52dc1eec86bso3113933e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 00:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747811207; x=1748416007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDdm/gMDJHRRO5S7yUdMVawXFqKo60gp6vNx+WKlT2U=;
 b=WGxDXLVk2zhMepg4RkcZZXmzc9UXpDSLGYoLIKmdbyxMP9Qf8SG6t9v6DwgRaxvWny
 +zgEIjROPQp2GP/4YBTS865CgU4C6grBG0hwjuwnw/5kopIm1vWVQDl5XQNXj6L7N5nR
 DMXbrfmAoGqNSQuCZBe+7DNdmm0bqpKXxCvSNiztpH6X6GGz/g+6gBSXkpGBHjkr37np
 pFIsumx7MNe9g10eutjSVAGpyWsY1u8IoDeTY3428XPL2IP57vmQor1YnzkV4IZ9zfTW
 0YxPEIHqdtfOGPmJSLiyg9eoPA8cNN7lQyqyfd2PT8ITwcN2DBuRE3dXgq9Qrd6cnZpI
 6Ifw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyzyWVMxbSc+aPHxf7OYVKkelFzo25N99mVb/lelW9ARmTD4rex46YvSU/5J4uyfQSM8uHcGsnR+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2ZGFAiyHrnJ/ilxSjKAF1dRVmf64yIiwUlvAmpgBJMMNvplGv
 CTuwXnvXquEfeXzukzpKZm8+aP/c7xMhCQBXLV23Nlci8HAdWmrf4VvdddWzTQ52
X-Gm-Gg: ASbGncsv0Ef0nvP0Pt23SOmwuUNUjiofSBvCBS93RWCQJW5+kv2WrodfBRto9KL6hkl
 6FhdXYATN+WPNt25IZG57+ohGRsZoKrr3cz/2S13Rd1akDB7Jc2YAyxZWAwafe/08J6+iBiwsKu
 9Oh01pH4gx523Z2cXjtmgyudzFe6sElNl8K4SRASNiyCTJExrUt5VjIayq1zcTsWU/mycfplU9D
 95iIql+mxpccOyYD1Jm6jTqKTn9xbQGZwY8EktZW3xF10qdffMy1WzEh82X/6TcLaheA/NSKO4q
 u+3lmzpkACGkuRLiY2der4o+j6uRT20+Srol1wyDtYIaT/o6GeyMCMNfUbE3RP92hfZCWgq6jyf
 6WNgeH9951EWjAw==
X-Google-Smtp-Source: AGHT+IFLS+ShPonn+nsUCrCW0nhqoA5Y12LuJGF+KBPImedWJzEKiOBBR5rW5KwJV5LAIWE2+0qGOg==
X-Received: by 2002:a05:6122:2690:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52dbb2a0a7bmr19150881e0c.0.1747811206836; 
 Wed, 21 May 2025 00:06:46 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dbab6b42esm9700846e0c.40.2025.05.21.00.06.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:06:46 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4e2adabc828so875563137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 00:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMvzlraBsW8hhhPaB77pDurAbWz4QtbTDI1zPiNplztKOl+H01d/KK+DYKum9qiWAC3CcRsjXc8kM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3052:b0:4e1:ec70:536 with SMTP id
 ada2fe7eead31-4e1ec700665mr10616805137.4.1747811205821; Wed, 21 May 2025
 00:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
In-Reply-To: <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 May 2025 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
X-Gm-Features: AX0GCFuB4vJFSfv66iragTQL4KWajIPLPkZDuxM0m5SK06eB8kBWY6AhcxxTf3o
Message-ID: <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
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

On Wed, 21 May 2025 at 01:59, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 23.1.2023 17.10, Geert Uytterhoeven wrote:
> > On Mon, Jan 23, 2023 at 4:09 PM John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> >> On 11/25/22 21:31, Geert Uytterhoeven wrote:
> >>> This RFC patch series adds a DRM driver for the good old Atari
> >>> ST/TT/Falcon hardware.  It was developed and tested (only) on the ARAnyM
> >>> emulator.
> >>
> >> I just remembered this WIP driver. Has there been any progress?
> >
> > So far no further progress.
>
> I tried your "atari-drm-wip-v1" branch commits on top of 6.14.

Thanks for testing!

> After some minor changes those applied. Getting it to build required
> adding "&shadow_plane_state->fmtcnv_state" (struct drm_format_conv_state
> *) argument to *_blit() functions in atari_drm.c, and changing:
>         drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> in its probe function to:
>         struct drm_format_info *format = NULL;
>          drm_client_setup(dev, format);

I do keep it up-to-date locally, so I could provide these changes,
if you are interested.

> However, the result is not working very well yet.
>
> Driver gets initialized fine under Hatari TT emulation:
> -------------------------
> atafb atafb: phys_screen_base 511000 screen_len 311296
> atafb atafb: Determined 1280x960, depth 1
> atafb atafb:    virtual 1280x1945
> Console: switching to mono frame buffer device 160x60
> fb0: frame buffer device, using 304K of video memory
> ...
> atari_drm atari_drm: phys_screen_base 55d000 screen_len 311296
> atari_drm atari_drm: Determined 1280x960, depth 1
> atari_drm atari_drm:    virtual 1280x1945
> [drm] Initialized atari_drm 1.0.0 for atari_drm on minor 0
> atari_drm atari_drm: Atari DRM, using 304K of video memory
> -------------------------
>
> However, once screen switches from "atafb" to "atari_drm" driver, Linux
> boot logo & texts disappear, and (emulated) screen is either all white
> (on mono monitor) or all black (on VGA & RGGB monitors).

So you have both atafb and atari_drm enabled? Please don't do that.

> And while "atafb" works fine also under Falcon emulation with RGB (50Hz)
> or VGA (60Hz) monitor, "atari_drm" probing fails:
> -------------------------
> genirq: Flags mismatch irq 4. 00200000 (framebuffer:modeswitch) vs.
> 00200000 (framebuffer:modeswitch)

That's also a sign of two drivers requesting the same IRQ unexpectedly.

> atari_drm atari_drm: probe with driver atari_drm failed with error -16

i.e. -EBUSY.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
