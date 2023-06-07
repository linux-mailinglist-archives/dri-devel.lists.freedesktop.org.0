Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4D72586F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AF310E473;
	Wed,  7 Jun 2023 08:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8C210E473
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:48:30 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-568f9caff33so71451067b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686127709; x=1688719709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dsdNCkGUa6qXmdS3+Kos2M1YnKfMadh9WwIme7Xf08U=;
 b=WeDOnixn4DBcEEtAEmx4QVFd8aPWtBU3kRM7uBhYI12LR0qYU8d6DVu7TYHYlwIVY5
 WK1DTGHimTh/9U/hWXDca6w5XBKVM3JFSrveJM+2ya+bEzK7UcUMjoH9rWrhVFg6012n
 iTCQ9E1rbVZ/qEU7Ed9Vp6cD1sRAMHe/Aiv7r/7IXXreRhhWAFyhamRVwn04X3tTmbHA
 20BtPQoJ09BVnmURKqfm2KfBgZgRXkB+jBvMXp8D5Z1WMPeFV/0piziBtsWDivP+4xs1
 ADlbFzYfFoRisOGrbIlviUuLuimUTUR9RTUYOoMsKvlDB5DyXlH3jVEtLqJ/QwSiN3Oc
 XBwQ==
X-Gm-Message-State: AC+VfDxbTsrYzs1V4++lfU40TaSp9yDIXYuPW1G7koTPQaI25O75bdXJ
 ThBHamUlrvQ3p41gKhgrqjnGyrli7S321g==
X-Google-Smtp-Source: ACHHUZ7HQYq2fgYhsxRuOP2xVCTnmy4BdCYzFZ8YIIGtnbTUB8uO94HNyD+b2fCx91s+qYynHokqKw==
X-Received: by 2002:a81:6754:0:b0:55c:67df:6700 with SMTP id
 b81-20020a816754000000b0055c67df6700mr5240479ywc.19.1686127708747; 
 Wed, 07 Jun 2023 01:48:28 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 h66-20020a0dde45000000b00564bc2ddca3sm4633180ywe.25.2023.06.07.01.48.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-56896c77434so71643977b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:48:27 -0700 (PDT)
X-Received: by 2002:a81:7d41:0:b0:561:e2df:c4d1 with SMTP id
 y62-20020a817d41000000b00561e2dfc4d1mr5101826ywc.9.1686127706917; Wed, 07 Jun
 2023 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 10:48:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Message-ID: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for your patch!

On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create a files in devfs or sysfs.
>
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
>
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It

I'd leave out the part about manipulating kernel memory, as that's a
driver bug, if possible.

> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.

Of course disabling ioctls reduces the attack surface, and this is not
limited to fbdev... ;-)

I'm wondering if it would be worthwhile to optionally provide a more
limited userspace API for real fbdev drivers:
  1. No access to MMIO, only to the mapped frame buffer,
  2. No driver-specific ioctls, only the standard ones.

> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>           combination with certain motherboards and monitors are known to
>           suffer from this problem.
>
> +config FB_DEVICE
> +        bool "Provide legacy /dev/fb* device"

Perhaps "default y if !DRM", although that does not help for a
mixed drm/fbdev kernel build?

Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
to be selected by both FB and DRM_FBDEV_EMULATION?
Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

> +        depends on FB
> +        help
> +         Say Y here if you want the legacy /dev/fb* device file. It's
> +         only required if you have userspace programs that depend on
> +         fbdev for graphics output. This does not effect the framebuffer

affect

> +         console.
> +
>  config FB_DDC
>         tristate
>         depends on FB

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
