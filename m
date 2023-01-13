Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687B6691F7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B817A10E9C9;
	Fri, 13 Jan 2023 08:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47F910E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:59:15 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id fa5so13205715qtb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIx/98EgJxXRPw6eabRyCtMqFo85a6og6EquEgJiRDY=;
 b=Pc/7r70b6Ac3AHhwE4SYoLAT3aFpQqujnimyt7+9BrjZt9gu/f23tJfKV3QPSzUIDp
 NnnxXvMrvAxHQEwAERNrb7R9jL0FDNcL4JELVgQVGa5HDyL2Zi1DTlsg9Q/2mqcEBCZz
 OSBoG2E4OfRTSsafy9yIb/lxjfj5UrFYkuKMeFMZNSF3QBGjCwhj3L4hqRpk9hQLVQWd
 bYSTNb4p/J8pFCg9otxejPyn5o1Q3Cst9SwSXe+PZZjNYE7Nt2fpaFI47Vt2RsDNPiCx
 Pa+WVt/VqLLzt50sfKor2l9J2hHvlp/zjJqzqKXNhRVKqSn9qKYftUChDX5pf24+GmCv
 xN4A==
X-Gm-Message-State: AFqh2krgLDb6MrM+FjY+ekxHrDEPL+S0CWgLWj240A4saZHgloJL4kxC
 ZQpjdS/7tdDmblOP63JL2VaHezr6NxIiew==
X-Google-Smtp-Source: AMrXdXsV7lUimN0OuuH84hKN/dvjnF3HskoLBQbSt+o5wfGys/+fIieRHqncgWYYIN8+dXX2Quu6zw==
X-Received: by 2002:ac8:5045:0:b0:3ad:7ac:ce61 with SMTP id
 h5-20020ac85045000000b003ad07acce61mr19430928qtm.64.1673600354385; 
 Fri, 13 Jan 2023 00:59:14 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 c11-20020ac853cb000000b00397b1c60780sm10221630qtq.61.2023.01.13.00.59.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:59:13 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id c124so21593318ybb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:59:13 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id
 7-20020a250007000000b007c1b2e97e71mr838217yba.604.1673600353257; 
 Fri, 13 Jan 2023 00:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-3-hch@lst.de>
In-Reply-To: <20230113062339.1909087-3-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:59:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Message-ID: <CAMuHMdVM3BpvVD3c4gp1OidnwF5zFd4MJecij7zWBnahzNaSNw@mail.gmail.com>
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
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

Hi Christoph,

On Fri, Jan 13, 2023 at 7:23 AM Christoph Hellwig <hch@lst.de> wrote:
> USB_OHCI_SH is a dummy option that never builds any code, remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!
Nice catch!

> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
>
>           If unsure, say N.
>
> -config USB_OHCI_SH
> -       bool "OHCI support for SuperH USB controller (DEPRECATED)"
> -       depends on SUPERH || COMPILE_TEST
> -       select USB_OHCI_HCD_PLATFORM
> -       help
> -         This option is deprecated now and the driver was removed, use
> -         USB_OHCI_HCD_PLATFORM instead.
> -
> -         Enables support for the on-chip OHCI controller on the SuperH.
> -         If you use the PCI OHCI controller, this option is not necessary.
> -

At this point in the series, there are still selects and enablements of
USB_OHCI_SH in arch/sh/Kconfig and arch/sh/configs/sh7757lcr_defconfig.
I think it would be good to replace them by USB_OHCI_HCD_PLATFORM first,
to decouple the fate of this patch from the rest of the series.

>  config USB_OHCI_EXYNOS
>         tristate "OHCI support for Samsung S5P/Exynos SoC Series"
>         depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
