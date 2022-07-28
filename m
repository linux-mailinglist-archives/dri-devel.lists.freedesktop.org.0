Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E3158440A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 18:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B678B10F996;
	Thu, 28 Jul 2022 16:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 28 Jul 2022 16:17:54 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7560C11226A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 16:17:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mgvev-1npis131e1-00hMkS for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul
 2022 18:12:48 +0200
Received: by mail-wr1-f44.google.com with SMTP id b26so2842135wrc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 09:12:48 -0700 (PDT)
X-Gm-Message-State: AJIora90fj4UyBEpMvYpxZsO0JuuxQvDHIOMyo22Gyooyon+iQHGIteW
 TlJshYQwAf75basLQJ84Qv+qBOwAbsAgj2wGKdw=
X-Google-Smtp-Source: AGRyM1vWuOSQ5jkdH83jWj0RrtQb7QqIeQadUBaSrg3Qh2GudbEb/nqWHTWnFuVbZrtnJIU4rYColKF2SYdmGBop/yk=
X-Received: by 2002:a05:6402:1d4c:b0:43b:c85f:5c95 with SMTP id
 dz12-20020a0564021d4c00b0043bc85f5c95mr28453461edb.213.1659021408962; Thu, 28
 Jul 2022 08:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <CAK8P3a2fZ9O6vSEyxY1KW71pG_Oyvwxp3zTbW2GuaSD6aj+Qfw@mail.gmail.com>
 <8e694cb6-c3dc-74e3-6804-fc532f108523@gmail.com>
In-Reply-To: <8e694cb6-c3dc-74e3-6804-fc532f108523@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 17:16:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2vJFCJmeMj-vuasUhwa2=2P+hAr=ScGhT21TcjQ1Z8Aw@mail.gmail.com>
Message-ID: <CAK8P3a2vJFCJmeMj-vuasUhwa2=2P+hAr=ScGhT21TcjQ1Z8Aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
To: Markuss Broks <markuss.broks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HYly7OND0PRNSx//et9T0b4A22JYfLRgsJNDT5Tocz7dD7niSBo
 MO3gJqWTOZXCN+nw90yv+uYxQb6UQAgKWCIctf1vdSAdPTl1k5Pwk922b8Ga2EOvMF1Wtav
 sNEvzvCAYbn7J0WSmxzL+RP7xKfb7EkSlx45PKg22DLh9PJYgFs4rimvKlc9newTdiQxtsI
 6aLQ1kb+n/6Bby1sIgICQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hRNTA4jB5Ig=:0rm56Gdp08/X+GxIpnge6V
 DvxMinyqo9eFT+59mjC30HPKfIm+fYZixDAQF/xnobF5YS9LCXCBBwjLFIGHL/nrWQcPXVNhO
 YR0VK4FcOj8r3nNrQjQTRT7KHKCphBOvtqeIO6CNcHFbwkNWlaxRz6rwM/DWb6CtJoIwb/Pgt
 VjSKaC+gtZQD0ITF33D/gv5ivKMWmXcOR7YwlO2mb1yd/5yaNMYmwzN4LaMmmyUHHiD74HmE5
 3FmPUeRUZRM/4v0JKAytZKHKA1YBM41Mb8QHuIwuv+IQT4h1xCYy5HuPCPW9DlTGoV7IH9rUt
 9/IWELwp1ZLCqtCZriElhwGsOn1k0ZPjPuKtRk4UigBOEB2tEpRmi1SQCvmijFwHMkX7oa7Ok
 NQXKw7e2ZxowCqMt4uHvqmdNELhr5u3EGX3AO2eZO5Ri+FKgRIsP0Rulk7flhHX5fX+Hr8IMg
 1rkIvhBnYvxQJa869QpK23c2U/ltphBsb3SB8Xfq9gSJ7aIPIP+7EejucR/MYAGrxfHs24KvH
 g9zlUep1Tk6c0tm+X7Ui6rqvR5oVTFEHdrjL3LsnT2fQOIQ717MKTwQsD2xQaWmvyxrHGCCf0
 tXxouOQrBvBgsgymG/Jo+io9+jlba0OfazCIrLkl0r3tBIxfJLc7dQe6byLR7HTCOrPc8SHVm
 hp1XzS7o/0KkCR/vJ0NYKUjEl14UmfhGS39zFBOub11WD6FZq8+GbLjeSN1nLH+mFPWyy7Gb2
 iA95EDxW9zhzbmf6IRz4Y8ijA/iFMw8wp+VrxoUIl8C9VTTTJL3Am9W97Hipm6vr863Vbrban
 rHEIEKPuRCAuKuKcP7ANdnSmUcGDZtqEwKRyNwx8V1fTRWnwSUL+jAqVeLFpDpHGMBic1Npra
 nOQcQJHXYzEArM6TyZoA==
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

On Thu, Jul 28, 2022 at 4:57 PM Markuss Broks <markuss.broks@gmail.com> wrote:
> On 7/28/22 17:48, Arnd Bergmann wrote:
> > On Thu, Jul 28, 2022 at 4:28 PM Markuss Broks <markuss.broks@gmail.com> wrote:
> >>
> >> Add early console support for generic linear framebuffer devices.
> >> This driver supports probing from cmdline early parameters
> >> or from the device-tree using information in simple-framebuffer node.
> >> The EFI functionality should be retained in whole.
> >> The driver was disabled on ARM because of a bug in early_ioremap
> >> implementation on ARM.
> >>
> >> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> >> ---
> >>   .../admin-guide/kernel-parameters.txt         |  12 +-
> >>   MAINTAINERS                                   |   5 +
> >>   drivers/firmware/efi/Kconfig                  |   6 +-
> >>   drivers/firmware/efi/Makefile                 |   1 -
> >>   drivers/firmware/efi/earlycon.c               | 246 --------------
> >>   drivers/video/fbdev/Kconfig                   |  11 +
> >>   drivers/video/fbdev/Makefile                  |   1 +
> >>   drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
> >
> > It looks like this is not actually related to fbdev, and since drivers are
> > moving from fbdev/simplefb towards drm/simpledrm, maybe it would be
> > better to put this into either drivers/gpu/drm/tiny/ or possibly
> > drivers/video/console to let this be used without enabling fbdev?
>
> Ideally this shouldn't depend on anything, because it isn't utilizing
> any of fbdev code and won't be utilizing any of drm/console code. I
> agree that either of those would be a better place for it, but which one
> do you think would suit more for this driver?

I think ideally this would be integrated with simpledrm in the long run,
but I have no idea what that means in terms of future code changes.

Maybe Thomas Zimmermann has an idea here.

        Arnd
