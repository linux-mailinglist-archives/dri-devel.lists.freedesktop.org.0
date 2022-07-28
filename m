Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A558424A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC910F81C;
	Thu, 28 Jul 2022 14:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 28 Jul 2022 14:53:57 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933DA10F81C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:53:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com ([209.85.218.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0X0U-1nVjQF45SO-00wR3J for <dri-devel@lists.freedesktop.org>; Thu, 28
 Jul 2022 16:48:52 +0200
Received: by mail-ej1-f45.google.com with SMTP id bp15so3559136ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:48:51 -0700 (PDT)
X-Gm-Message-State: AJIora+ixtxU3nhHka7HeeSA1RghEwmqmGSNrwuo3ZsNMhddEUDJMlP9
 aTuGIbo/DI3o/LeW/yPCW6Cz/PJIERYAPFqZnPQ=
X-Google-Smtp-Source: AGRyM1voWFsned5bc+ZOEVWI6Tk3nmMi4UyCDiV3OuIb+yKzChXoAAi57A5zk3bEc9tox3U8iz+5WVxVjrqfdY0QZtc=
X-Received: by 2002:a17:907:d0f:b0:72e:db1f:9b91 with SMTP id
 gn15-20020a1709070d0f00b0072edb1f9b91mr21730608ejc.470.1659019731647; Thu, 28
 Jul 2022 07:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
In-Reply-To: <20220728142824.3836-3-markuss.broks@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 16:48:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2fZ9O6vSEyxY1KW71pG_Oyvwxp3zTbW2GuaSD6aj+Qfw@mail.gmail.com>
Message-ID: <CAK8P3a2fZ9O6vSEyxY1KW71pG_Oyvwxp3zTbW2GuaSD6aj+Qfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
To: Markuss Broks <markuss.broks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6MJrO5nAqDWzJwAmuYfuzZhujDx07hF+7cFaOWUvpluk7fz08yt
 uhq1M8jLRE72TDJ4Wa+ZJGetKiwqfHU01CeJwzBXzpf8Q+Dg4nJ2o3k2xsFVQFj3IpaOzf/
 TFmDvUNY25wJj9vTzXclbKWw7vPevYeUCQkqC9qVs0Bpnw7notNRJYUG6lYeWiGz+c+OJ9M
 9rzVXAiaCH8FWKO0vSvPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dqiiiSPax5M=:O1/eiQMNkPteWQ62cjYHDQ
 I0GU39ae6l/p8Zh59ZjvgklVAOmu5THmDl1H/1Y0QxUurWnsz94bUmNnWYtRCGQFQQuvFz73i
 isX/euAuYzKzxl20pUY8de6BVCF/1Nn7FYx1C+i4nHbS2pWuo6gaqXr4y7UDNTQ4V9w6EtEhb
 dyQNotN6DNEXlQjLYzQxYla3C3xrYwQ/C6FQNI9lIwyRpujfXDi3OmZEvmIWf3c3Yqpg+Wt/+
 2iXaUm35tS0w02clYtYeVl7jYbWNDwO+z4pgHhKhqu83y7AxnAq4Q4DE++B3wWDgugSq3R5ue
 6VXbG1sh8tWtKSXUhyK+LB6ob/bo9Chi2b36UQyaDfZcw7ct+ofP+h8pZGDA5YJlNNYPvcMiW
 qKIMbLAc7Us3PpHFdzUSlLjgc9WfcCXWtdq6jULIdvYnyi8YU7rP+PqvcsMbvZiF6ZtuHc97T
 lhtm+DKuRmBL6ZLjPbtCGXfUH0tEFaDkKvdmxofUQbEr3z0b5hQbOuz2Yjjfr8CX0ru1xMF9A
 +Y+Ls8rZFKESm8OIfrujhh7U8MItqZ8w8yapDduSZzUpPlfQV1YC6ecrILxXlfMGYG7fMFA5L
 nniymUAHndhOcPZn/qSczWRHkKMljBrCyapw7Dpd9POJ1sJMfbK8FZomlpSnaeGmjXtBqwGTP
 /0oYEszHGZJg+fhzS8I6APHeT9gaam7R9Iki4X1y71exGFbJDUHpH5Xlyk0zkVZG1jjBrhZvq
 OLPmc1vweB5Cped/qQTr/RZAXB60Z/r+/EhDzw==
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 4:28 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>
> Add early console support for generic linear framebuffer devices.
> This driver supports probing from cmdline early parameters
> or from the device-tree using information in simple-framebuffer node.
> The EFI functionality should be retained in whole.
> The driver was disabled on ARM because of a bug in early_ioremap
> implementation on ARM.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  12 +-
>  MAINTAINERS                                   |   5 +
>  drivers/firmware/efi/Kconfig                  |   6 +-
>  drivers/firmware/efi/Makefile                 |   1 -
>  drivers/firmware/efi/earlycon.c               | 246 --------------
>  drivers/video/fbdev/Kconfig                   |  11 +
>  drivers/video/fbdev/Makefile                  |   1 +
>  drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++

It looks like this is not actually related to fbdev, and since drivers are
moving from fbdev/simplefb towards drm/simpledrm, maybe it would be
better to put this into either drivers/gpu/drm/tiny/ or possibly
drivers/video/console to let this be used without enabling fbdev?

        Arnd
