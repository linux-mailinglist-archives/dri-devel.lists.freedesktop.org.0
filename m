Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40679C9A4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008A910E3AE;
	Tue, 12 Sep 2023 08:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1407610E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:18:37 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-590685a3be5so51365997b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694506716; x=1695111516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khdzgLGt8t6E0rL7mFhUTkO1q/TxNFHuMsXkANz78Pg=;
 b=MS5TMQS5pD/oPVaKM4ui+/qdHBEiLNRZu6dtvB5auG6aWrLGqSqGyFDq1qTdx1hHxL
 wf3lvAHqiX5CoKvEkUPvXLXm6I6DfIS8b56Fxhi0xt/dSnO9wbUeTrm9uERqu3wLJ5o6
 wLuVGpz27+3h44DlfQRBTMfP2r+YzpgDBHwyvopvH3Js65HSRJmBpBzm2LTtsrDmFcM7
 dEtd3rn2zWFRo94sf+q9MmFOOnz07zRlZs3RGu1crP5zuxFkw5jqBkZYO2v73MDFyyTu
 TQdJIZ/alPwxsYPiiEJkOY6ZP3B2HszGbt76Qdn+B8pPPaymhrb9kZ+0a5J6xCXBS8Nw
 ILEQ==
X-Gm-Message-State: AOJu0Ywt/Us9q+l6bUM8+FBmTnP8YHYdD5vq8R6pvecDHrHJIhmNItEk
 CeC/4/1MANBdrdFn1kPDSBrrplGD+cypEA==
X-Google-Smtp-Source: AGHT+IGVIOCdkcf9P907g+qoCVknD3MPj0NfA3eQeew0k6ykQNxMuvT+g1Z3BcylgcEvO/Q/gfXUDQ==
X-Received: by 2002:a81:b401:0:b0:58b:cea5:947a with SMTP id
 h1-20020a81b401000000b0058bcea5947amr11821371ywi.40.1694506715996; 
 Tue, 12 Sep 2023 01:18:35 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 m5-20020a817105000000b0054bfc94a10dsm2411952ywc.47.2023.09.12.01.18.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:18:35 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d7e741729a2so4949062276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:18:35 -0700 (PDT)
X-Received: by 2002:a25:ac22:0:b0:d80:1604:f6e9 with SMTP id
 w34-20020a25ac22000000b00d801604f6e9mr11644271ybi.44.1694506715264; Tue, 12
 Sep 2023 01:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
In-Reply-To: <637afb25-8ee2-4188-9385-27ee6a97ec59@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Sep 2023 10:18:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
Message-ID: <CAMuHMdW63WjidvAovqRz70bMgbLt4cSkOP1xSh7sEcqdwR3tOw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Sep 12, 2023 at 10:11=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 12.09.23 um 09:14 schrieb Geert Uytterhoeven:
> [...]
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
> >>          bool "Enable legacy fbdev support for your modesetting driver=
"
> >>          depends on DRM
> >>          select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONS=
OLE
> >> -       default y
> >> +       default FB
> >
> > While this is true for existing configs, it is no longer true in genera=
l,
> > as DRM_FBDEV_EMULATION is no longer related to FB.
>
> Would it make sense to make FRAMEBUFFER_CONSOLE an independent option
> and have FBDEV_EMULATION depend on it? Something like this:
>
> FRAMEBUFFER_CONSOLE
>         depends on DRM || FB
>         select FB_CORE
>
> FBDEV_EMULATION
>         depends on DRM
>         depends on FRAMEBUFFER_CONSOLE
>         default y

Oops, now you can no longer have FBDEV_EMULATION without
FRAMEBUFFER_CONSOLE, which is useful to be able to enable
FB_DEVICE...

And what's the point (if DRM is enabled) of having FB_CORE with
FBDEV_EMULATION disabled?

> So if any graphics subsystems are enabled, FRAMEBUFFER_CONSOLE is
> select-able. But for DRM, FBDEV_EMULATION disables the console. That

Huh?

/me looks at his morning coffee, and confirms the cup is empty...

> option remains more for historical reasons than actual usefulness.

> >> --- a/drivers/video/console/Kconfig
> >> +++ b/drivers/video/console/Kconfig
> >> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
> >>   config FRAMEBUFFER_CONSOLE
> >>          bool "Framebuffer Console support"
> >>          depends on FB_CORE && !UML
> >> +       default DRM_FBDEV_EMULATION
> >
> > Sounds good to me, although it looks a bit strange at first sight
> > (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
> > y on emulated fbdev?).
> > So this is the fix for commit a5ae331edb02b ("drm: Drop select
> > FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").
> >
> >>          select VT_HW_CONSOLE_BINDING
> >>          select CRC32
> >>          select FONT_SUPPORT
> >> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/co=
re/Kconfig
> >> index 114cb8aa6c8fd..804c2bec9b43c 100644
> >> --- a/drivers/video/fbdev/core/Kconfig
> >> +++ b/drivers/video/fbdev/core/Kconfig
> >> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
> >>   config FB_DEVICE
> >>          bool "Provide legacy /dev/fb* device"
> >>          depends on FB_CORE
> >> -       default y
> >> +       default FB
> >
> > Changing this means possibly causing regressions on systems running
> > an fbdev userspace.
> >
> >>          help
> >>            Say Y here if you want the legacy /dev/fb* device file and
> >>            interfaces within sysfs anc procfs. It is only required if =
you

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
