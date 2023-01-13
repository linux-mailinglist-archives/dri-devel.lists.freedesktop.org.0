Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5606690D1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A210E369;
	Fri, 13 Jan 2023 08:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1883110E369
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:28:22 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id g9so3903256qtu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXxq4tFDMaQ+gaSI4+XgAKyMbRpnWTuq4SxaohX01OI=;
 b=MCqvZmzaDaQKM/0NQt4F66Zmd4Gd1T0xFJGBrlactb2g1+pQ8V7FblkjC3EXzTBQ1F
 LfEitvznRwvet3389wb/YqWNnF3hX8eA2Smk+DwTxZsrNMZH6bPcdxiL8DDzPOu2T6Rp
 bfqmr/ACSPNH4cFA4DFOfbwyvZJ2JyXrAC5SBUyAKHYUOL03BkcnWCptt8hCqssb007W
 KNi0n1577tJSL3+cUqQAvc3T95/HXSZ6b6hbyStN9xyKGgEknc2aXJJPoT3pMERrjpl2
 q1mtRK8V460fW1Rhg7+eEV6OHjmgwxFPX1CLwMQfpkV0BWlhjYqHEdP74zLHFwdiEbxp
 psQg==
X-Gm-Message-State: AFqh2kq6/hs/9YojSbH8OTEn4txUfmPkVJejShyJ6YVsDI1QGlUevLgp
 WOZxN1+5dUeBVbl2efkQXZOUCtY/nsyBBA==
X-Google-Smtp-Source: AMrXdXuhkQBnAcBikNKgJHC0+8sYRIHM1ddUtLCSMHUKx7MZrXalhaJSzWp+FJxXYuPG5eL8kTdC3Q==
X-Received: by 2002:ac8:5185:0:b0:3a7:e548:5e89 with SMTP id
 c5-20020ac85185000000b003a7e5485e89mr106347931qtn.49.1673598500969; 
 Fri, 13 Jan 2023 00:28:20 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a258e00b006e07228ed53sm12223374qko.18.2023.01.13.00.28.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:28:19 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-4b6255ce5baso274103467b3.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:28:19 -0800 (PST)
X-Received: by 2002:a0d:fb81:0:b0:480:fa10:459e with SMTP id
 l123-20020a0dfb81000000b00480fa10459emr889474ywf.283.1673598499239; Fri, 13
 Jan 2023 00:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-11-hch@lst.de>
In-Reply-To: <20230113062339.1909087-11-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:28:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Message-ID: <CAMuHMdVLT5G7spdbkB=sx6ZZraXzNFgENxLwg1PMrFnVERn_Tw@mail.gmail.com>
Subject: Re: [PATCH 10/22] input: remove sh_keysc
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
 linux-sh@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
> Now that arch/sh is removed this driver is dead code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/input/keyboard/Kconfig    |  10 -
>  drivers/input/keyboard/Makefile   |   1 -
>  drivers/input/keyboard/sh_keysc.c | 334 ------------------------------
>  3 files changed, 345 deletions(-)
>  delete mode 100644 drivers/input/keyboard/sh_keysc.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 84490915ae4d5a..882ec5fef214ac 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -625,16 +625,6 @@ config KEYBOARD_SUNKBD
>           To compile this driver as a module, choose M here: the
>           module will be called sunkbd.
>
> -config KEYBOARD_SH_KEYSC
> -       tristate "SuperH KEYSC keypad support"
> -       depends on ARCH_SHMOBILE || COMPILE_TEST
> -       help
> -         Say Y here if you want to use a keypad attached to the KEYSC block
> -         on SuperH processors such as sh7722 and sh7343.

FTR, this hardware block is also present on the ARM-based
SH-Mobile AG5, and R-Mobile A1 and APE6 SoCs.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
