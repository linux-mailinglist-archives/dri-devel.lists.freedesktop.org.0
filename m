Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E950A451
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 17:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25E610E023;
	Thu, 21 Apr 2022 15:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 21 Apr 2022 15:34:25 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3C410E023
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:34:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3KgE-1nqwhB3rsI-010HgC for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr
 2022 17:29:19 +0200
Received: by mail-wr1-f54.google.com with SMTP id p18so7215178wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:29:19 -0700 (PDT)
X-Gm-Message-State: AOAM533fvBav15kebUyH4Mtm7Cb0lRM6i0O01dPOXIzfavuagvQeqQoY
 NxrxJoXnJHKPojVgdtFuedwNCWi3G6/iAKlW2Zw=
X-Google-Smtp-Source: ABdhPJxKpospiPlAgrLUewrHWmh0snRbQc7E1OFrJMr7NkFWoVWNdjC/+qxZuhyVxJOjyOGXkiqrvZW6ZgPa03gRamE=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr199757wrz.219.1650554959163; Thu, 21 Apr
 2022 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Apr 2022 17:29:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O/gock85P058jRxx/FUVb89jKEWanqsA1VsznfRSO1pQBM06hW9
 P8RKHI529o8xpM896EIwaxYm0l1Uzq7q2TjuVcJEoBYXW3L/kFpRXKIDxbUMMEmzFJeGKYn
 YPgwKn6SR/TtQ9k/pqgUySAHhPt7f0Nn+QfDuOW0GUsBP7jHccSYo1b24NgdfTrM8VHtZTj
 M9jPFkMsOgQJdjwzQEiLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6JAa1WR0m5E=:wcgr+EN72jh2g1mJpzTGyC
 E+q2JPnuQG+n9XU8c9qQxjRGhwZqTQ1BvMr6q+pHV+IihxUhJ76WTzsX95nuMTQ874yQVNc8C
 0zVYh6dN6OvqmiuIb3fmPnj8KxvhXX0M+PS7ia/Za5mQXWdrAvCRTDruZvMPYzvyeXNsXbGCg
 78QjOZcHuF/jdHLWKxgdLXgdyD0NVNFvXSVupiADd3QrDLGQHQ5Vm/vwOkrzrx8lRz7hOIdPP
 cIVl2M96nwGohNT4JJaiwOGGpTj6xDVc7L3yyOQv0NslSL8XDBnL22aHy85sSoT253DgF86DE
 LBqrqwCfAySiJ1axIELoRqu4L18TaelnaASVpN7OouD5rJ2KI69QGgn+fzLC5HJX86YiIdSSn
 SvlO+r8SE+baTJ0yMDCuQq1RYMXouUznPhmcrKtSnohDDRIm0ss1TkDFrmjFzfZygXH3FPPG3
 12gcTo9snqbWAFDJRT2OFxwLyxWEdARstexqE11yjdO3sojwGlrn1t+t/QcfSuGlgjkXoZjYg
 s4BEJIWZgVGA5j/c35qf7uP2Dji2uw//RlU2l8h4KNLS6HImS6zG3XmeWHsFNPWXmXUqv43Nc
 zql1Teqyd3X6PrWYayvVaLTiYXdXIK0F/qEw6oIxYSwzSVbQGZ7V6K8Rhnd+qvUXX914EQauy
 HCXLWl7XceSUdc38BF1EuWEqj7VAGmW2ygouLrAOVK5JT8X5i/U/FnxH+//T4TdYdfCQVE0zj
 YbkgobuyuBp9DOyVJqCxKqrIaVk7Hk2upqUS+uj680+ZMR9muiUzMt91GsIS17opwMdwSscIc
 8l0vPEb40tlqRxMeQ68uYNcAaJ8Zh1tSoMJUMf7h0M8Tj37R06TDCeV/WmkDUEfKXZmD9GM6f
 pBW2l0LSm+d+slSUls+bc1DspX/ngf7a16uVauSBfbhEV3c4Q5Xt+7/p7SjHS5
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 6:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This revisits a series I sent a few years ago:
>
> https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/
>
> All the other ARMv5 conversions are under way now, with
> OMAP1 being the only one still not in linux-next yet,
> and PXA completing the set.
>
> Most of the patches are unchanged from before, furtunately
> the PXA code is fairly stable. I addressed Robert's comments,
> pulled in two patches from Dmitry, and added the last a the
> final four patches to finish off the multiplatform conversion.
>
> I hope someone is left to test these on PXA: if this works,
> I'd like to merge it for 5.19. A git tree with these is available
> for testing at
>
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18

I have updated the branch based on the feedback I got, and
done a preliminary merge into the for-next branch, so this work
should show up in linux-next. I expect to rebase this particular
branch before the merge window, to add further Acks or
fix regressions in place. (I don't do this for the other branches).

Let me know if there are any show-stoppers or patches that need
more work. I realize that this is a lot to review and that there is
limited reviewer bandwidth as most of the original developers
have moved on from PXA a long time ago.

       Arnd
