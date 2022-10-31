Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAC6139DF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 16:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8810E2FD;
	Mon, 31 Oct 2022 15:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014310E276
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:18:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2521C612B9;
 Mon, 31 Oct 2022 15:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B25EC433C1;
 Mon, 31 Oct 2022 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667229490;
 bh=fZQmE3ZoLyvvFn4DphHE7oXQ3j9AI9iK/6owWdIRsas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJ+6M32c1NzKowboPOTlB8AjQ6s07iNwFn6R0waqYwLB63R+1+vqwRWCBFirJxe6k
 Gt/cYH3BTnDAp0fJ3l/bOSeEYjjQAR1XAH6HOXmT59zDOFpLJ12UddsWOELBUSmMxA
 R2yxrso2Vp2w0UDcSvijat+eS5aG+RdZQKXmLHiw4euF7z+rvfbGN6fa7m9H0hNizi
 oAhgIPLoO/wGcA5MrxrRdkImiY5S60bQT5WV+bOZh9/Mx67HCp7Jh8I8Z9lSG+NSSJ
 fNzfD4bcJhAm9kSwgFF/PedYUobZ/Hw9dQE31LYyJzxguFzoKkfV35LzKH5htLRlIP
 RklF91F9P9Wyw==
Date: Mon, 31 Oct 2022 15:18:03 +0000
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 02/11] ARM: sa1100: remove unused board files
Message-ID: <Y1/nK0kLURkyel2n@google.com>
References: <20221021155000.4108406-1-arnd@kernel.org>
 <20221021155000.4108406-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221021155000.4108406-3-arnd@kernel.org>
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
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
 linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Peter Chubb <peter.chubb@unsw.edu.au>,
 Alan Stern <stern@rowland.harvard.edu>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Cerf, H3100, Badge4, Hackkit, LART, NanoEngine, PLEB, Shannon and
> Simpad machines were all marked as unused as there are no known users
> left. Remove all of these, along with references to them in defconfig
> files and drivers.
> 
> Four machines remain now: Assabet, Collie (Zaurus SL5500), iPAQ H3600
> and Jornada 720, each of which had one person still using them, with
> Collie also being supported in Qemu.
> 
> Cc: Peter Chubb <peter.chubb@unsw.edu.au>
> Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  MAINTAINERS                                   |  11 -
>  arch/arm/Kconfig                              |   6 -
>  arch/arm/boot/compressed/head-sa1100.S        |   4 -
>  arch/arm/configs/badge4_defconfig             | 105 -----
>  arch/arm/configs/cerfcube_defconfig           |  73 ---
>  arch/arm/configs/hackkit_defconfig            |  48 --
>  arch/arm/configs/lart_defconfig               |  64 ---
>  arch/arm/configs/pleb_defconfig               |  53 ---
>  arch/arm/configs/shannon_defconfig            |  45 --
>  arch/arm/configs/simpad_defconfig             | 100 -----
>  arch/arm/mach-sa1100/Kconfig                  | 111 -----
>  arch/arm/mach-sa1100/Makefile                 |  21 -
>  arch/arm/mach-sa1100/badge4.c                 | 338 --------------
>  arch/arm/mach-sa1100/cerf.c                   | 181 --------
>  arch/arm/mach-sa1100/h3100.c                  | 140 ------
>  arch/arm/mach-sa1100/hackkit.c                | 184 --------
>  arch/arm/mach-sa1100/include/mach/badge4.h    |  71 ---
>  arch/arm/mach-sa1100/include/mach/cerf.h      |  20 -
>  .../arm/mach-sa1100/include/mach/nanoengine.h |  48 --
>  arch/arm/mach-sa1100/include/mach/shannon.h   |  40 --
>  arch/arm/mach-sa1100/include/mach/simpad.h    | 159 -------
>  arch/arm/mach-sa1100/lart.c                   | 177 --------
>  arch/arm/mach-sa1100/nanoengine.c             | 136 ------
>  arch/arm/mach-sa1100/pci-nanoengine.c         | 191 --------
>  arch/arm/mach-sa1100/pleb.c                   | 148 ------
>  arch/arm/mach-sa1100/shannon.c                | 157 -------
>  arch/arm/mach-sa1100/simpad.c                 | 423 ------------------
>  drivers/cpufreq/sa1110-cpufreq.c              |   6 -
>  drivers/mfd/Kconfig                           |   2 +-

Acked-by: Lee Jones <lee@kernel.org>

>  drivers/pcmcia/sa1100_generic.c               |   5 +-
>  drivers/pcmcia/sa1100_h3600.c                 |   2 +-
>  drivers/pcmcia/sa1111_generic.c               |   4 -
>  drivers/usb/host/ohci-sa1111.c                |   5 +-
>  drivers/video/fbdev/sa1100fb.c                |   1 -
>  34 files changed, 4 insertions(+), 3075 deletions(-)
>  delete mode 100644 arch/arm/configs/badge4_defconfig
>  delete mode 100644 arch/arm/configs/cerfcube_defconfig
>  delete mode 100644 arch/arm/configs/hackkit_defconfig
>  delete mode 100644 arch/arm/configs/lart_defconfig
>  delete mode 100644 arch/arm/configs/pleb_defconfig
>  delete mode 100644 arch/arm/configs/shannon_defconfig
>  delete mode 100644 arch/arm/configs/simpad_defconfig
>  delete mode 100644 arch/arm/mach-sa1100/badge4.c
>  delete mode 100644 arch/arm/mach-sa1100/cerf.c
>  delete mode 100644 arch/arm/mach-sa1100/h3100.c
>  delete mode 100644 arch/arm/mach-sa1100/hackkit.c
>  delete mode 100644 arch/arm/mach-sa1100/include/mach/badge4.h
>  delete mode 100644 arch/arm/mach-sa1100/include/mach/cerf.h
>  delete mode 100644 arch/arm/mach-sa1100/include/mach/nanoengine.h
>  delete mode 100644 arch/arm/mach-sa1100/include/mach/shannon.h
>  delete mode 100644 arch/arm/mach-sa1100/include/mach/simpad.h
>  delete mode 100644 arch/arm/mach-sa1100/lart.c
>  delete mode 100644 arch/arm/mach-sa1100/nanoengine.c
>  delete mode 100644 arch/arm/mach-sa1100/pci-nanoengine.c
>  delete mode 100644 arch/arm/mach-sa1100/pleb.c
>  delete mode 100644 arch/arm/mach-sa1100/shannon.c
>  delete mode 100644 arch/arm/mach-sa1100/simpad.c

-- 
Lee Jones [李琼斯]
