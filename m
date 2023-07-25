Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1F761E61
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE310E15C;
	Tue, 25 Jul 2023 16:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96F10E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:23:29 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d0fc1d97716so2756287276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690302208; x=1690907008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWDVJ0AjoNsrk9M4DPO9gyxQKQ5zdHdLwPZslQUT8gk=;
 b=EcMED4Qkv1zVueH4plf1RgBHC5KGN3cfPr9lrnO4zzabaYlorG++/8NIzv8gE++g+q
 Zn7LSbb3QqIahJblTHOGK+Lwbp/5FmgJOqsVlTpwODnV1rhg2JdqeMM2fT5M5Mh2avc/
 hstMSUvX0nAT1qImEHdUcmheBzQ9OrkXhYdiYQlwTfJMd9VZISKU2t3eupMBG0bOoQ7Q
 WDwz8p5F/0RUXG/eJwVR3mOmz1jRBbhvj6LQUq8MoJKa0WJbIIAkaZjmZv4IDOMcxF/4
 rC2FvczqPi48PGbWnibG48hDmynT0rTDCcjW5Qnkm7hcdS9XQTZ+rMl3RAzzhE1Z2Hti
 ypCw==
X-Gm-Message-State: ABy/qLbX9frynKJig2M3+cq5Ty9nJ3Zu9LsajB9UDJVoaNZfs/dFDFeI
 p3uOvO80SaRFxZv9SDS2yck6lKrB2E8dqQ==
X-Google-Smtp-Source: APBJJlEBbJeXeT86HSSOHce6rNKVJSmTKxLvjbICXg1FZLyTqoGMycjvvz0hDHI7gHMVI4bASIlA4w==
X-Received: by 2002:a25:dc47:0:b0:d0f:e86c:1607 with SMTP id
 y68-20020a25dc47000000b00d0fe86c1607mr6109282ybe.22.1690302208482; 
 Tue, 25 Jul 2023 09:23:28 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 l11-20020a25cc0b000000b00cad44e2417esm1947461ybf.64.2023.07.25.09.23.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 09:23:28 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d0548cf861aso4742906276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:23:27 -0700 (PDT)
X-Received: by 2002:a25:9d01:0:b0:d09:d53:ce41 with SMTP id
 i1-20020a259d01000000b00d090d53ce41mr7792077ybp.55.1690302207767; Tue, 25 Jul
 2023 09:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 18:23:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
Message-ID: <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jul 25, 2023 at 6:07=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > If CONFIG_FB_CORE=3Dy but CONFIG_FB=3Dn, the frame buffer bootup logos =
can
> > no longer be enabled.  Fix this by making CONFIG_LOGO depend on
> > CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for the
> > logo code to depend on the presence of real frame buffer device drivers=
.
>
> Indeed.
>
> > Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and F=
B_CORE symbols")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/video/Kconfig      | 2 +-
> >  drivers/video/logo/Kconfig | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> > index e5b1cc54cafa10d5..b694d7669d3200b1 100644
> > --- a/drivers/video/Kconfig
> > +++ b/drivers/video/Kconfig
> > @@ -63,7 +63,7 @@ if VT
> >       source "drivers/video/console/Kconfig"
> >  endif
> >
> > -if FB || SGI_NEWPORT_CONSOLE
> > +if FB_CORE || SGI_NEWPORT_CONSOLE
> >       source "drivers/video/logo/Kconfig"
> >
> >  endif
> > diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
> > index 6d6f8c08792dc897..b7d94d1dd1585a84 100644
> > --- a/drivers/video/logo/Kconfig
> > +++ b/drivers/video/logo/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  menuconfig LOGO
> >       bool "Bootup logo"
> > -     depends on FB || SGI_NEWPORT_CONSOLE
> > +     depends on FB_CORE || SGI_NEWPORT_CONSOLE
> >       help
> >         Enable and select frame buffer bootup logos.
>
> Should then move this option to drivers/video/fbdev/core/Kconfig ?

No, all logo options are in their own file.

> Regardless, could be done as a follow-up and the fix looks good to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

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
