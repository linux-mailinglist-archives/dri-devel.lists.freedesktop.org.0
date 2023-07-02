Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A5744CDD
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 11:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B730710E0EE;
	Sun,  2 Jul 2023 09:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064110E0EE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 09:08:06 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5701810884aso35861547b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 02:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688288885; x=1690880885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OBtu7Z4+GE6q0l8ikA7nuhp09YCEyCrOF7iEJtpDP4=;
 b=JzgbBblbfuX34QPFjvltZOKXaS/UCUBdwtYpnDIjcvEGuESSmbx2qkMu+am9ZZK/om
 G344hUn8RLwBBqJq0w9Elx8Qex4EvuIkcV/rrju4GTwV9eAuh51gRGJtEdEf+ZXObVEp
 hFpC5AfvfHRY9TlSCse1ddOnIa5Nw8as8V5HX5vcdpDSjUpss+3jG9l04XN3ZKeW0l9T
 T1r1ObE5FndR+xxp0GrwTmKGUoQpSffQaypZ3ozt/6UdQVeKh84W2QdJOP3FsJM73dsT
 rTDR2+leAC0iv3HOPQ3BZ1/IRzJLR0VgN6MQFll7f8cJKduVSaB9Ro9O9J6IYBo4cJab
 mUIA==
X-Gm-Message-State: ABy/qLaG/w3Bt3SYk40vjvnlQO7yP6lW0HZruKEtLEVgIuy3BNGfObkn
 8Yvp3G9ufaD7t+Ory4qkUGiP+86u4Vfcj9jZ
X-Google-Smtp-Source: APBJJlEZX/fm2VQE4DNJLuM3TgNUV9u47h/OGJQjbUviqU3Z9XYsDVyRX6CUT5Zjuk1VvND3bxu01A==
X-Received: by 2002:a0d:df86:0:b0:579:ec06:eb3d with SMTP id
 i128-20020a0ddf86000000b00579ec06eb3dmr2263595ywe.21.1688288885385; 
 Sun, 02 Jul 2023 02:08:05 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 m1-20020a0de301000000b00570362e1caasm4439802ywe.93.2023.07.02.02.08.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 02:08:05 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-c4dd264359cso411716276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 02:08:05 -0700 (PDT)
X-Received: by 2002:a25:26c4:0:b0:c40:f090:98bf with SMTP id
 m187-20020a2526c4000000b00c40f09098bfmr6398754ybm.28.1688288884964; Sun, 02
 Jul 2023 02:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
 <393ca142-5226-4779-a963-c34fb0464c59@app.fastmail.com>
In-Reply-To: <393ca142-5226-4779-a963-c34fb0464c59@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Jul 2023 11:07:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLRBePox24kBHBMhzKWZX2ncXCD_8JBZrWcbwo0eBZ1Q@mail.gmail.com>
Message-ID: <CAMuHMdWLRBePox24kBHBMhzKWZX2ncXCD_8JBZrWcbwo0eBZ1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Sun, Jul 2, 2023 at 12:25=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Sat, Jul 1, 2023, at 23:44, Javier Martinez Canillas wrote:
> > Currently the CONFIG_FB option has to be enabled even if no legacy fbde=
v
> > drivers are needed (e.g: only to have support for framebuffer consoles)=
.
> >
> > The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
> > and so it can only be enabled if that dependency is enabled as well.
> >
> > That means fbdev drivers have to be explicitly disabled if users want t=
o
> > enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation laye=
r.
> >
> > This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
> > enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION=
,
> > allowing CONFIG_FB to be disabled (and automatically disabling all the
> > fbdev drivers).
> >
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> > @@ -59,7 +69,7 @@ config FIRMWARE_EDID
> >
> >  config FB_DEVICE
> >       bool "Provide legacy /dev/fb* device"
> > -     depends on FB
> > +     select FB_CORE
> >       default y
> >       help
> >         Say Y here if you want the legacy /dev/fb* device file and
>
> These are now the only user visible sub-options when CONFIG_FB is
> disabled. I missed FIRMWARE_EDID earlier, but this also looks like
> it can clearly be left as depending on FB since nothing else calls
> fb_firmware_edid. In fact, it looks like all of fbmon.c could be
> left out since none of its exported symbols are needed for DRM.
>
> That would leave CONFIG_FB_DEVICE as the only user visible option
> for DRM-only configs, which is slightly odd for the menuconfig,
> so I still wonder if that could be done differently.
>
> Is there actually a point in configurations for kernels with FB=3Dy,
> DRM=3Dn and FB_DEVICE=3Dn? If we don't expect that to be a useful
> configuration, an easier way would be to have CONFIG_FB turn it
> on implicitly and instead have a user-visible Kconfig option
> below CONFIG_DRM_FBDEV_EMULATION that allows controlling the
> creation of /dev/fb*.

Such a combination would allow the user to still have a text console
on a legacy fbdev, while not having to worry about possible security
ramifications of providing fbdev userspace access.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
