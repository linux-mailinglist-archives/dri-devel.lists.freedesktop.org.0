Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0C51E6F8
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 14:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CC7113151;
	Sat,  7 May 2022 12:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8E11314F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 12:37:32 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id s30so17207429ybi.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
 b=KCyiITVKgMi69PaUxMUe8kgt1g0I/YT1BNqXQ8g8jDYzoI10RIuW4XJdIAw+WABgPz
 sIoqAXB0wg2Fv4K4xa+UIk01I93aMUAh5zwWez9Y9woJgUGlFSInLIx46fZ5Gg1s601e
 a5i4HOw7TQkJg5Maw+WvNt0vTtgrsC6dMYDUfidiIqwE2Susa4bkzpuGE1IWxOsZTINs
 CB1T7vFcyxbamcJuoqj4cYj6aPJPj79FjZ60m16yN0qOI1to8EcKMqSlW8ohYQOIT3XX
 Y47JhHbhAM6byKlmpEHLlDWi3VANQBbeKYdvgbjI2HE4GR8wATeJNEQhXZFHSEQQgNal
 1RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
 b=rIDUmZ850kugyKNpTfg3WhHOOc2HOvFk5x2Oz6g6/QxQMOdj0xHb420m7kyMcwejmR
 z3KGmXwlYrVa+LeXAKBa1LiE82f6FUWdn4t2KrESCFMHjBostOHywQCQB/51xg5iEVsJ
 gqRhfmzuKm2E+xSu0pMCWyLZg0xzeQ7WEvXXTqgJFrNlSLDjz1X9anPbYlfZ2q1zEzKL
 q+nrrQilpRDJAz+OLNxLMqgQ96+D4pWsSnqlbgg03FREayen5+kMWFEKmOX7ralq4ph1
 IXvFude+SUIHd4b2sUl/KTZljm3crHbgY/LL18w5j6XdQDN++KVliJGfyKBEZOSXKBI7
 M1KA==
X-Gm-Message-State: AOAM5330nxaY6TcYV2HMNP3Nnt/nBGTgqTob39D/kggRgRwq22aycARj
 N0qfv/Y5IOBpJxCUYMbBGtdaoO/w0sz85h7Z23hyHw==
X-Google-Smtp-Source: ABdhPJzwJpXEUtAZEUc6bZUPoenoZ5sebSG72if0MOZ/TMe4dt5l953VkaeLr4GysoaOw6EpMxKFJUOEIy1GTdxXArc=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr6256768ybh.369.1651927052069; Sat, 07
 May 2022 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-41-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-41-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 May 2022 14:37:20 +0200
Message-ID: <CACRpkdbHGXfAKiN1sNTrLzRd5Qk-jerhcfvDo8FG=Zq94Dv19g@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 robert.jarzmik@free.fr, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 6:44 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The battery driver uses a lot of GPIO lines, hardcoded from a
> machine header file.
>
> Change it to use a gpiod lookup table instead.
>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, I've been iterating a patch for the Tosa charging code
going down in MFD ans ASoC and all:
https://lore.kernel.org/linux-arm-kernel/20220125003741.492954-1-linus.walleij@linaro.org/

I just rebased this on v5.18-rc1 and resent with collected ACKs.

Please take a look at it, and see if you rather take that patch,
at some point I realized I had to go pretty deep around the
legacy code in different subsystems because the MFD device
us spawning a GPIO chip...

Yours,
Linus Walleij
