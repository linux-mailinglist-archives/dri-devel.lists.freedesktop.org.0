Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2B79C7DF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE2E10E03E;
	Tue, 12 Sep 2023 07:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B6110E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:15:08 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-59b9d255037so11814027b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694502907; x=1695107707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQRallN7a7RlN4ob4UzNdS6lCadZKR5S0w4gWNgqx4U=;
 b=LdWPYdIdyckj+iIKqaS45OwLyypvpYZ48PLMA4efo3djOCon/XY+gNn0EwSGbATtpG
 SE1bA0a+KEv7jZRZ6QqNEK26EUFmPb/Tr70FnmydzPKXcOYmIbbVZx9Q5cLOJP5/f4p0
 FItwyc7WhHBwJrm3IeUNpzQ6PJaqlsOUPbd5mhuWAMo32eGULA2KcAoJTJiLSzrOghFj
 tnJAG6itd4c7AOTL+yAcX5oMLE2ncl6Hv2jMXAfhyHPYjXiJfHqqmYoMWwis6kHr9c+V
 mxoyCkXKJUp8FPHC8ueQf1FJPnTFT3GIrVwSqWuGKuDCdUPTa21Czow0YrQevTH2l1WZ
 mlCg==
X-Gm-Message-State: AOJu0YwUezLq5iuQfxt9D9kkggcrLcZfyrhOARhzSDN6AH2L7u/GMP/z
 256hJuHaVblLkYGmIYfZhSx1RULPpKF0lg==
X-Google-Smtp-Source: AGHT+IGei1S4VnArJ9xPaQqLDWaefVjY/J0iImk8zLzVUYqZdGdkANo2BEqaKY6bLxi9I8VNmj6nOg==
X-Received: by 2002:a0d:cbd0:0:b0:589:a9fd:a with SMTP id
 n199-20020a0dcbd0000000b00589a9fd000amr12063540ywd.10.1694502907140; 
 Tue, 12 Sep 2023 00:15:07 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 p63-20020a815b42000000b005837633d9cbsm2386934ywb.64.2023.09.12.00.15.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 00:15:06 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d7ba4c5f581so4604476276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:15:06 -0700 (PDT)
X-Received: by 2002:a25:d695:0:b0:d3c:58ef:ef7b with SMTP id
 n143-20020a25d695000000b00d3c58efef7bmr11682985ybg.6.1694502906112; Tue, 12
 Sep 2023 00:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230911205338.2385278-1-arnd@kernel.org>
In-Reply-To: <20230911205338.2385278-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Sep 2023 09:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
Message-ID: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> As a result of the recent Kconfig reworks, the default settings for the
> framebuffer interfaces changed in unexpected ways:
>
> Configurations that leave CONFIG_FB disabled but use DRM now get
> DRM_FBDEV_EMULATION by default. This also turns on the deprecated /dev/fb
> device nodes for machines that don't actually want it.
>
> In turn, configurations that previously had DRM_FBDEV_EMULATION enabled
> now only get the /dev/fb front-end but not the more useful framebuffer
> console, which is not selected any more.
>
> We had previously decided that any combination of the three frontends
> (FB_DEVICE, FRAMEBUFFER_CONSOLE and LOGO) should be selectable, but the
> new default settings mean that a lot of defconfig files would have to
> get adapted.
>
> Change the defaults back to what they were in Linux 6.5:
>
>  - Leave DRM_FBDEV_EMULATION turned off unless CONFIG_FB
>    is enabled. Previously this was a hard dependency but now the two are
>    independent. However, configurations that enable CONFIG_FB probably
>    also want to keep the emulation for DRM, while those without FB
>    presumably did that intentionally in the past.
>
>  - Leave FB_DEVICE turned off for FB=3Dn. Following the same
>    logic, the deprecated option should not automatically get enabled
>    here, most users that had FB turned off in the past do not want it,
>    even if they want the console
>
>  - Turn the FRAMEBUFFER_CONSOLE option on if
>    DRM_FBDEV_EMULATION is set to avoid having to change defconfig
>    files that relied on it being selected unconditionally in the past.
>    This also makes sense since both LOGO and FB_DEVICE are now disabled
>    by default for builds without CONFIG_FB, but DRM_FBDEV_EMULATION
>    would make no sense if all three are disabled.
>
> Fixes: a5ae331edb02b ("drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV=
_EMULATION")
> Fixes: 701d2054fa317 ("fbdev: Make support for userspace interfaces confi=
gurable")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
>         depends on DRM
>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
> -       default y
> +       default FB

While this is true for existing configs, it is no longer true in general,
as DRM_FBDEV_EMULATION is no longer related to FB.

>         help
>           Choose this option if you have a need for the legacy fbdev
>           support. Note that this support also provides the linux console
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfi=
g
> index b575cf54174af..83c2d7329ca58 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
>  config FRAMEBUFFER_CONSOLE
>         bool "Framebuffer Console support"
>         depends on FB_CORE && !UML
> +       default DRM_FBDEV_EMULATION

Sounds good to me, although it looks a bit strange at first sight
(FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
y on emulated fbdev?).
So this is the fix for commit a5ae331edb02b ("drm: Drop select
FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").

>         select VT_HW_CONSOLE_BINDING
>         select CRC32
>         select FONT_SUPPORT
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/=
Kconfig
> index 114cb8aa6c8fd..804c2bec9b43c 100644
> --- a/drivers/video/fbdev/core/Kconfig
> +++ b/drivers/video/fbdev/core/Kconfig
> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
>  config FB_DEVICE
>         bool "Provide legacy /dev/fb* device"
>         depends on FB_CORE
> -       default y
> +       default FB

Changing this means possibly causing regressions on systems running
an fbdev userspace.

>         help
>           Say Y here if you want the legacy /dev/fb* device file and
>           interfaces within sysfs anc procfs. It is only required if you

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
