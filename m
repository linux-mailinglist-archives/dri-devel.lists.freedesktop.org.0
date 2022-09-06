Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9D5AF13A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B1C10E097;
	Tue,  6 Sep 2022 16:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744910E097
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:54:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70E54615D8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532B9C43142
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662483279;
 bh=dlrLPJ9VW2sLiclVTeLOaDTCcrNnK0V5SGX9NqEZ+bQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mSScNXV5eNPo8Q03hxNBF1E7GxbLAdR4dQrRxWkLjglRTK1xh+T/4rqOjmigwjTY8
 gqSPY7pxM2Ggi0f2szfwrD3iVoWzDhGiGopM1Z0DZ7FgzkuBRRMu/ufwHNQr3lGO7j
 /bkDMZKGzDzt/B1TAdERWfCMAbQS3UYGOsU/xKBZKEhubggqoxorkrPeHBQQKTlyPd
 npaAXKqlrsRd5G9PKa1D94x4RQ6LtShUNfs0BPs3MrpeW0KfYSXtMfF21voGUHmoTV
 bKiCT3FrX8wBWHqftjbcK61d54GS/r0D9M9Z3nC68WpMODqU0FdeTJ6FFOtAEjC9Ln
 IDwSJC/VY+Big==
Received: by mail-lf1-f45.google.com with SMTP id q21so4093282lfo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 09:54:39 -0700 (PDT)
X-Gm-Message-State: ACgBeo1f+nBWKtB5D0Uy4hGae0WkpKFVwZUpEqOZ9QA4r33FdmldekDF
 XctjQV6VfON1uahyXLVHTtdgwzg1fSuXgGXzmWg=
X-Google-Smtp-Source: AA6agR4ZsAa0US91WfUU+IaEHtFS7q8sGZYyOWOHOoq1tpEGuakqhXudOy2kGnEsGzQpN8MaarQDnosu8Aj4ieKBKDQ=
X-Received: by 2002:a05:6512:2294:b0:494:8dc5:10af with SMTP id
 f20-20020a056512229400b004948dc510afmr9295038lfu.426.1662483277282; Tue, 06
 Sep 2022 09:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220806163255.10404-1-markuss.broks@gmail.com>
In-Reply-To: <20220806163255.10404-1-markuss.broks@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 Sep 2022 18:54:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHWWciFcO-ub4U4MB1VDifD_=bxiTVaTcBjTvYXzVTkgQ@mail.gmail.com>
Message-ID: <CAMj1kXHWWciFcO-ub4U4MB1VDifD_=bxiTVaTcBjTvYXzVTkgQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add generic framebuffer support to EFI earlycon
 driver
To: Markuss Broks <markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Wei Ming Chen <jj251510319013@gmail.com>,
 phone-devel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-serial@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 6 Aug 2022 at 18:34, Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Make the EFI earlycon driver be suitable for any linear framebuffers.
> This should be helpful for early porting of boards with no other means of
> output, like smartphones/tablets. There seems to be an issue with early_ioremap
> function on ARM32, but I am unable to find the exact cause. It appears the mappings
> returned by it are somehow incorrect, thus the driver is disabled on ARM. EFI early
> console was disabled on IA64 previously because of missing early_memremap_prot,
> and this is inherited to this driver.
>
> This patch also changes behavior on EFI systems, by selecting the mapping type
> based on if the framebuffer region intersects with system RAM. If it does, it's
> common sense that it should be in RAM as a whole, and so the system RAM mapping is
> used. It was tested to be working on my PC (Intel Z490 platform), as well as several
> ARM64 boards (Samsung Galaxy S9 (Exynos), iPad Air 2, Xiaomi Mi Pad 4, ...).
>
> Markuss Broks (2):
>   drivers: serial: earlycon: Pass device-tree node
>   efi: earlycon: Add support for generic framebuffers and move to fbdev
>     subsystem
>
>
> v1 -> v2:
>
> - a new patch correcting serial/earlycon.c argument name to "offset" instead
>   of "node"
> - move IA64 exclusion from EFI earlycon Kconfig to earlycon driver Kconfig
>   (IA64 has no early_memremap_prot)
> - move driver from fbdev to console subsystem
> - select EFI earlycon by default

Wasn't EFI earlycon already enabled by default?

> - fetch stride manually from device-tree, as on some devices it seems stride
>   doesn't match the horizontal resolution * bpp.
> - use saner format (e.g. 1920x1080x32 instead of 1920,1080,32).
>
>  .../admin-guide/kernel-parameters.txt         |  12 +-
>  MAINTAINERS                                   |   5 +
>  drivers/firmware/efi/Kconfig                  |   6 +-
>  drivers/firmware/efi/Makefile                 |   1 -
>  drivers/firmware/efi/earlycon.c               | 246 --------------
>  drivers/tty/serial/earlycon.c                 |   3 +
>  drivers/video/fbdev/Kconfig                   |  11 +
>  drivers/video/fbdev/Makefile                  |   1 +
>  drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
>  include/linux/serial_core.h                   |   1 +
>  10 files changed, 331 insertions(+), 256 deletions(-)
>  delete mode 100644 drivers/firmware/efi/earlycon.c
>  create mode 100644 drivers/video/fbdev/earlycon.c
>
> --
> 2.37.0
>
