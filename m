Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95238E3FC
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 12:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4C889970;
	Mon, 24 May 2021 10:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4C189970
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 10:24:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33641610FA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621851884;
 bh=5wBiRHHSXJ69cFUjecB+aszzqhwYw/MhJXDMzSU3aiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pK5GXFlN+YCuMLzRkryTFyUpVJAEwnP0vbi3xwjP6jH9zyZMvzC+0XT1/9n95bQrX
 77LPElvDmRwpEyjQ+Vt2rM4mAftSlCmR3oAMqfvsLQcddtFOpEfI+5OzLlommq+unm
 c1z9WKpYVrqqyRfaU1taNHEmXE5BpBfWetH1DWWfEW/q/4tSC9ActrMFlHWvRG91xV
 Iqt+xObwQDaIb1/6PpcojSSUO5P/HgU3bRs4B/TiDYp2fpqk0zZEpP1wralYzG9VK/
 2jMz7BaHTQs3BvgixAc5+Jfiil5oTbuXt0An5RS7g5NDy1QAwgsgxn7CU3wRk9FYs+
 Fyx6wyS0qENIw==
Received: by mail-oo1-f46.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so6233313oop.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 03:24:44 -0700 (PDT)
X-Gm-Message-State: AOAM533xI6v2I/b5Um/WoCKcj0kkR5CKtbJfE8CDravDsXmfQGv1t0y7
 WWB18S3WPxcEUiNcWcb+hUhXh41v9osk1T+hKzs=
X-Google-Smtp-Source: ABdhPJxuRHMn0Kx2Oweu4bILN4JMFbNf9fmAY08NovL1123TdXfK6IfWv4QLAq1YGWdjz8Wx+wrSdvtwgHP/dZgbZHc=
X-Received: by 2002:a4a:b202:: with SMTP id d2mr17739259ooo.13.1621851883493; 
 Mon, 24 May 2021 03:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210521192907.3040644-1-javierm@redhat.com>
In-Reply-To: <20210521192907.3040644-1-javierm@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 May 2021 12:24:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Message-ID: <CAMj1kXGrDm5yN5eRZJ0YAjCde=0Xw7hobC9Oz5CNovo0sWuM+g@mail.gmail.com>
Subject: Re: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: x86@kernel.org, linux-efi@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Hans de Goede <hdegoede@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Robinson <pbrobinson@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier,

On Fri, 21 May 2021 at 21:29, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> support, that register a system frambuffer platform devices. It either
> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> VGA/EFI FB devices for the vgafb/efifb drivers.
>
> Besides this, the EFI initialization code used by other architectures such
> as aarch64 and riscv, has similar logic but only register an EFI FB device.
>
> The sysfb is generic enough to be reused by other architectures and can be
> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> logic used by non-x86 architectures to be folded into sysfb as well.
>
> Patch #1 in this series do the former while patch #2 the latter. This has
> been tested on x86_64 and aarch64 machines using the efifb, simplefb and
> simpledrm drivers. But more testing will be highly appreciated, to make
> sure that no regressions are being introduced by these changes.
>
> Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
> don't know how it should be merged. But I didn't find a way to split these.
>

We could merge this via the EFI tree without too much risk of
conflicts, I think.

However, I'd like to see a better explanation of why this is an improvement.
The diffstat does not show a huge net win, and it does not enable
anything we didn't already have before, right?


>
> Javier Martinez Canillas (2):
>   drivers/firmware: move x86 Generic System Framebuffers support
>   drivers/firmware: consolidate EFI framebuffer setup for all arches
>
>  arch/arm/Kconfig                              |  1 +
>  arch/arm/include/asm/efi.h                    |  5 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/efi.h                  |  5 +-
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/include/asm/efi.h                  |  5 +-
>  arch/x86/Kconfig                              | 27 +-----
>  arch/x86/kernel/Makefile                      |  3 -
>  drivers/firmware/Kconfig                      | 30 +++++++
>  drivers/firmware/Makefile                     |  2 +
>  drivers/firmware/efi/Makefile                 |  2 +
>  drivers/firmware/efi/efi-init.c               | 90 -------------------
>  .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
>  {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
>  .../firmware}/sysfb_simplefb.c                | 31 ++++---
>  .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
>  16 files changed, 182 insertions(+), 176 deletions(-)
>  rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
>  rename {arch/x86/kernel => drivers/firmware}/sysfb.c (70%)
>  rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (82%)
>  rename {arch/x86/include/asm => include/linux}/sysfb.h (68%)
>
> --
> 2.31.1
>
