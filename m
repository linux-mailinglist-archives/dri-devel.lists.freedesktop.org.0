Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21D66919D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558BB10E9B8;
	Fri, 13 Jan 2023 08:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6025B10E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:50:38 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id d13so14407691qvj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awQakUOIwVvp4xWgkhRGNM/c58rzqkM16qYt20+qNyU=;
 b=GEIBwnMONY2r3V7N5C2yTKGaGw0YCJQtd+VHhKRaHrZUqzPyK7OmBwmpHlwoaHx6vS
 jhF98L+z/36ndU8ecwF/29LajDbLFlbJXbhlQHyivjinKt4eGFZjgt4INEzi49bTaFGs
 6LoCiefuhLVXAu/+JFIvWCIYqeb7ZZ/cJvwswIUPX1FtF1iPwGXKsfDqTMAZ16YiVkAi
 pW1r2ZjCIR1al2Gw9mgXAHrYrsJ+Qge9EQKSh0TIBHv77zmJVaTDHH8QoyNGHy8yaPBh
 OvYy5ZLFxJDV4j6VuvMozWe3We8345mQRVVvQQHh4oJ1uODovi6dBAETfYGhoL5UIJ2k
 91Ow==
X-Gm-Message-State: AFqh2kr0TswbbUBosiKgCow8cMvOpkYEFLJODl72jstZ54JNrM59pd9v
 QZFYcC4tiMad7BpHHVJNAVqKVxj7HxcUeA==
X-Google-Smtp-Source: AMrXdXugPQJ6Rb7gLg6KsfdS5raZLK3IaUGY+G/aa61+0MthXpA6Q4mPHjigICb9/8DLBPNsLan82g==
X-Received: by 2002:a0c:d792:0:b0:4c7:971e:3c05 with SMTP id
 z18-20020a0cd792000000b004c7971e3c05mr101515506qvi.36.1673599836922; 
 Fri, 13 Jan 2023 00:50:36 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a280900b006fcaa1eab0esm12470788qkp.123.2023.01.13.00.50.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:50:36 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4b6255ce5baso274712967b3.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:50:36 -0800 (PST)
X-Received: by 2002:a81:578e:0:b0:4d9:3858:392 with SMTP id
 l136-20020a81578e000000b004d938580392mr551266ywb.502.1673599835999; Fri, 13
 Jan 2023 00:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-17-hch@lst.de>
In-Reply-To: <20230113062339.1909087-17-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:50:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Message-ID: <CAMuHMdU2vaVaCrcKom5YQYD9GLoeerX8HAQav36uFGUksOFc9w@mail.gmail.com>
Subject: Re: [PATCH 16/22] spi: remove spi-sh-sci
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
>  drivers/spi/Kconfig      |   7 --
>  drivers/spi/Makefile     |   1 -
>  drivers/spi/spi-sh-sci.c | 197 ---------------------------------------
>  3 files changed, 205 deletions(-)
>  delete mode 100644 drivers/spi/spi-sh-sci.c
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 7508dcef909c78..76f3bc6f8c81fc 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -882,13 +882,6 @@ config SPI_SH_MSIOF
>         help
>           SPI driver for SuperH and SH Mobile MSIOF blocks.
>
> -config SPI_SH_SCI
> -       tristate "SuperH SCI SPI controller"
> -       depends on SUPERH
> -       select SPI_BITBANG
> -       help
> -         SPI driver for SuperH SCI blocks.

This driver uses the Serial Communications Interface (SCI, cfr.
drivers/tty/serial/sh-sci.c) in SPI mode. Hence in theory it could be
used on a variety of Renesas ARM SoCs, and even on RZ/Five.
Again, no DT support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
