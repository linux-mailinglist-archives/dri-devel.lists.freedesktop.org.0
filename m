Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD436690EC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A20610E9A9;
	Fri, 13 Jan 2023 08:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D7110E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:31:01 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id y7so48822qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5kunZU7S+tV+EkJ89PAjAGhUsATazsdxcPmCZjz3Piw=;
 b=I969I1MGMA55WjouzLgkAduohvGIkObyshfs2lZ/NZo3pVfg7KZfvtuxA0QUOFHbBp
 9i0jq0KH3Fz6bhjoJHjjgk3IzgLNrYSW26qORxFrGkRW93xim5m8peUTAfc+akEXhcmT
 EOrnK7ShTthx5TmP9Ii0DEUzdxwYOPP+XAOcqCHcd+H8EcONWNkr3dlLvd2P1sS6WW9G
 YfTUrMxAWBQ84mZmo3OAbjOmX9T+UjAU95/WOWVrU4NEee0jlpq58SNx9ULFKoiw5nAJ
 KtDQThDrsEb7nAm2qIEPxtCyhULhBjfMlbQzzNUFACPnvt0m5ah2mbCkFwgPj9K3DYT4
 4vgQ==
X-Gm-Message-State: AFqh2kr5S9OsoPLkkx3EAELgKBH8z82pTl2DeVnkXAYxE8vYOTp6XEvo
 vu4NhoD7SSewTvcbr/A2DYaPLCB6XQQPAQ==
X-Google-Smtp-Source: AMrXdXv0elmG7qkFGvAR9NL6p3Wvhe1m8SD9iP8lCSO9Eve3XZ9300Inu5WOHtuwqyos4SD1R0hATg==
X-Received: by 2002:ac8:7658:0:b0:3af:7bf6:d1f5 with SMTP id
 i24-20020ac87658000000b003af7bf6d1f5mr16548770qtr.63.1673598660408; 
 Fri, 13 Jan 2023 00:31:00 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 w26-20020a05620a0e9a00b006eeca296c00sm12211396qkm.104.2023.01.13.00.30.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:30:59 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4d59d518505so105753757b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:30:58 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3492728ywb.47.1673598658639; Fri, 13
 Jan 2023 00:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-12-hch@lst.de>
In-Reply-To: <20230113062339.1909087-12-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:30:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Message-ID: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/mtd/nand/raw/Kconfig    |    8 -
>  drivers/mtd/nand/raw/Makefile   |    1 -
>  drivers/mtd/nand/raw/sh_flctl.c | 1234 -------------------------------
>  include/linux/mtd/sh_flctl.h    |  180 -----
>  4 files changed, 1423 deletions(-)
>  delete mode 100644 drivers/mtd/nand/raw/sh_flctl.c
>  delete mode 100644 include/linux/mtd/sh_flctl.h
>
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 98ea1c9e65c8ef..20a4988ea418d5 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -284,14 +284,6 @@ config MTD_NAND_MXC
>           This enables the driver for the NAND flash controller on the
>           MXC processors.
>
> -config MTD_NAND_SH_FLCTL
> -       tristate "Renesas SuperH FLCTL NAND controller"
> -       depends on SUPERH || COMPILE_TEST
> -       depends on HAS_IOMEM
> -       help
> -         Several Renesas SuperH CPU has FLCTL. This option enables support
> -         for NAND Flash using FLCTL.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5 and R-Mobile A1 SoCs.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
