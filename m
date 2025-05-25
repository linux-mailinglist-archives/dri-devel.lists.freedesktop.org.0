Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CCAC3456
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 14:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CC210E09E;
	Sun, 25 May 2025 12:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFE810E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 12:06:03 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c560c55bc1so154926085a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 05:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748174761; x=1748779561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcNmR9Oh3gKmhm4mVv3+Bc2mhBpOXuGq3s3rGdk5N+k=;
 b=B9ktsgAH/F43BjhGMMTxRV2RpEytPLXv1+6nbrJ5KdYEzXD7JGc8rZ7famDEGXybE8
 iV8W1ZkxVi1K6d4+6z4m4iZZwZn5mk/jzL64y5e45PIqk1msEtm3J56wnp5+DYyab1q0
 FdxXJgkHFVM/fQEqnY/lbVmQJOO/SeVQbv72oPJjREPSeZRFSDwbXYT+R/6WuJxpwanf
 2j+aWqnciIrU19HX+7kU3V4Je0L1XToSwqwxGJX6lf3hPY644k/+a+X8Rwxw0wHAIVBV
 WD0lxqzSbczEHCe7jAD0s9JLqX9hMOiZW6HXQKAxxQIRDJW3ddwiXy4X2r+e3tFBuKcw
 7NiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ovfHkf3ekzSKb7tK+d7AXaWtYmp/JAR5N01tpTsQUThsmWZpsBYoKWwzCPat9y4CbpC9n5Z6oxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrB3amIw/qr9lkSztXamo4omMFeMSD7k0nHVIz9vrLA6aOCdla
 iyHuPQ/dqg7uIBNb/vjkZljxkVQMEak80fpfyam0YYX6QPF5qeWZWPnYUlS2cXEx
X-Gm-Gg: ASbGncsEODlxdd9mOXScl0qa7QQ1BKN6OLEabN66xVmOlIJnOAwmDFD+C6wUTXgVEb4
 J/U+7sdiBspZvTate0fT8WJStIl9x6eMRY5MObm9sWQQjXVgafMDlPaJ8F3Ir6f8qLNPlseFGEb
 EvgqZtBHwxxgfOjFOTYH+6aHwl59mwTq6K+9hBK4zT59uwCR7hAGV9ZHTZOVMlpq8a5ZHPR1iuG
 pcqXivlBkUatLz8EhkBCUmifeYiFUR3is44w7AxI45leJCiI/kNa+LuqeJvznEtCcSK7oUfGnwA
 UkgL0Qvox36OuK2v3l/xhHZ3fUqrxYfGvU8a9PGRb4Yn7USvDkxtZoz3184mi2+Om8HB4unAF9s
 OqRNgbjwAwadYxtkTug==
X-Google-Smtp-Source: AGHT+IGeTfUWzRpJeU6y0EXrJVuKKmXDNmemJvHY/bMk9KI7fM3srNkQMjnN84MyA2UsOnZT9PBxfw==
X-Received: by 2002:a05:620a:bce:b0:7c7:70dc:e921 with SMTP id
 af79cd13be357-7ceecc0b826mr830838285a.36.1748174761468; 
 Sun, 25 May 2025 05:06:01 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467da041sm1443645085a.45.2025.05.25.05.06.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 05:06:01 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c560c55bc1so154923885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 05:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVA+OffCm1lbKaXlvTH5iEY/8seEhINRg1nMPtAYgCt0iFkFj8N8aZeYMrex+bjn5DZ5spJY60PeN0=@lists.freedesktop.org
X-Received: by 2002:a05:620a:6183:b0:7c7:a5e1:f204 with SMTP id
 af79cd13be357-7ceecc299d8mr920946385a.56.1748174760848; Sun, 25 May 2025
 05:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
 <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
 <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
In-Reply-To: <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 May 2025 14:05:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
X-Gm-Features: AX0GCFsstb-MFo59PFz_9P24KO-yVVLC9wRdn1-wDiAWRZRayXjN0xIbl4qIHFs
Message-ID: <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
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

On Thu, 22 May 2025 at 00:56, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 21.5.2025 10.06, Geert Uytterhoeven wrote:
> > On Wed, 21 May 2025 at 01:59, Eero Tamminen <oak@helsinkinet.fi> wrote:
> >> I tried your "atari-drm-wip-v1" branch commits on top of 6.14.
> >
> > Thanks for testing!
> >
> >> After some minor changes those applied. Getting it to build required
> >> adding "&shadow_plane_state->fmtcnv_state" (struct drm_format_conv_state
> >> *) argument to *_blit() functions in atari_drm.c, and changing:
> >>          drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> >> in its probe function to:
> >>          struct drm_format_info *format = NULL;
> >>           drm_client_setup(dev, format);
> >
> > I do keep it up-to-date locally, so I could provide these changes,
> > if you are interested.
>
> Yes, please!   (see below)

Sorry for taking so long:
https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=atari-drm-wip-rebasing

Enjoy!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
