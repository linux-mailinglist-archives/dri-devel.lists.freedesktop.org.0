Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D590AE2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547BF10E3A0;
	Mon, 17 Jun 2024 12:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CC210E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:49:33 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-632597a42b4so21578357b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718628571; x=1719233371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MInDILVs50Qu8wliYXAyjIL0mV2etkuFS+an8Yk00+w=;
 b=WS9l2ElORo9M+2ROlgkEhqnZvhngeoackXc3ZjRkoixlLYmfvmaCub0nCiVcc7cel4
 HvutpbrX2qdlDeCuALQiX0T1m2oicUy1qd030X2jdZ9+jE5aFJJ1BxmUo8lTYT92Go4Q
 8mK2EbzayDoBqf6I6NPIN88Sk40+05g58B0ADRUgGB40FsLTCtyMgGLu/dADtUzpMDwr
 LDbaIAUU3ZtEBLDEvuqs/F2aWRxoUq9CAlBZ6yBUX7PzTF/2rGCuaDQoEuLThCpTgXA3
 KYgUvSNZup7YZA5e6RgCIoTrwJ57TcsactmbmKfAXdqPZKzoZvqCfb8yva4apnGeRoTk
 FdRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMx2hf5Fy9TddjrwdxOu3WPAWNUbTGGBBD2zh8yYwwdNz1gejGV/bKDr2kbwhbbJ/gqqWypWqk960tn9Um3mYlBHbLG3fH6nTeEQq/LqcC
X-Gm-Message-State: AOJu0YwoEPQ+R9svQot5FZsOsGUbEh83soVDIwLzOZwbxmEKIL3qBo3j
 wU8lZyFlZpoofT445xALF1MWhW0AxwX8gBG/A6BQrVaGbBmgMPcHsmXASJoN
X-Google-Smtp-Source: AGHT+IEJAATJC1zem9JgzSUyvXs9P7Zkdi90GbxfBpYxEOwVdZnXWTiVhQQYtFOamx6D7gYRsh4/Nw==
X-Received: by 2002:a81:920d:0:b0:632:b001:cd49 with SMTP id
 00721157ae682-632b001cf08mr51601467b3.19.1718628570742; 
 Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-631183d80b8sm14161337b3.7.2024.06.17.05.49.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-632597a42b4so21577917b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtlQoK+wZ3AhLxIZ672Nibu0iYD1BLfvIaSHMJGHBWcFX7oan47edBWTyb6xPqDAilF8kGLbxesUsyk50ca1kknU21G+23B8tdtbM6bJyP
X-Received: by 2002:a81:920d:0:b0:632:b001:cd49 with SMTP id
 00721157ae682-632b001cf08mr51601307b3.19.1718628570046; Mon, 17 Jun 2024
 05:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
 <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
In-Reply-To: <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:49:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Message-ID: <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

On Mon, Jun 17, 2024 at 11:59=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> > Re-use the existing support for boot-up logos to draw a monochrome
> > graphical logo in the DRM panic handler.  When no suitable graphical
> > logo is available, the code falls back to the ASCII art penguin logo.
> >
> > Note that all graphical boot-up logos are freed during late kernel
> > initialization, hence a copy must be made for later use.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/drm_panic.c
> > +++ b/drivers/gpu/drm/drm_panic.c

> >       PANIC_LINE(" \\___)=3D(___/"),
> >   };
> >
> > +#ifdef CONFIG_LOGO
> > +static const struct linux_logo *logo_mono;
> > +
> > +static int drm_panic_setup_logo(void)
> > +{
> > +     const struct linux_logo *logo =3D fb_find_logo(1);
> > +     const unsigned char *logo_data;
> > +     struct linux_logo *logo_dup;
> > +
> > +     if (!logo || logo->type !=3D LINUX_LOGO_MONO)
> > +             return 0;
> > +
> > +     /* The logo is __init, so we must make a copy for later use */
> > +     logo_data =3D kmemdup(logo->data,
> > +                         size_mul(DIV_ROUND_UP(logo->width, BITS_PER_B=
YTE), logo->height),
> > +                         GFP_KERNEL);
> > +     if (!logo_data)
> > +             return -ENOMEM;
> > +
> > +     logo_dup =3D kmemdup(logo, sizeof(*logo), GFP_KERNEL);
> > +     if (!logo_dup) {
> > +             kfree(logo_data);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     logo_dup->data =3D logo_data;
> > +     logo_mono =3D logo_dup;
> > +
> > +     return 0;
> > +}
> > +
> > +device_initcall(drm_panic_setup_logo);
> > +#else
> > +#define logo_mono    ((const struct linux_logo *)NULL)
> > +#endif
>
> I didn't notice that the first time, but the core drm can be built as a
> module.
> That means this will leak memory each time the module is removed.

While I hadn't considered a modular DRM core, there is no memory leak:
after the logos are freed (from late_initcall_sync()), fb_find_logo()
returns NULL. This does mean there won't be a graphical logo on panic,
though.

> But to solve the circular dependency between drm_kms_helper and
> drm_panic, one solution is to depends on drm core to be built-in.
> In this case there won't be a leak.
> So depending on how we solve the circular dependency, it can be acceptabl=
e.

So far there is no reason to select DRM_KMS_HELPER, right?

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
