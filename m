Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F2365507
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B966E4C9;
	Tue, 20 Apr 2021 09:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0926E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:12:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com ([209.85.218.43]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIxmm-1lEUa531I2-00KU7u for <dri-devel@lists.freedesktop.org>; Tue, 20
 Apr 2021 11:07:43 +0200
Received: by mail-ej1-f43.google.com with SMTP id v6so55845750ejo.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:07:43 -0700 (PDT)
X-Gm-Message-State: AOAM5311Y+3H1yqwMj11CFk3+Y6tn9hxZyAIKZ+pEZdGhCCmM6v6FYpd
 4e9qWz+N0tLrchotxw1NZW9+J32DLxWYd5j3xqM=
X-Google-Smtp-Source: ABdhPJwSiNwlZ27l6d0oeVOJMjBIBpaEf6fV+Kr02yQOCGa6DdHdokE+eIs4+TiyDD+ybgS8jO4hGYikHl0QAhmuRDs=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr19571156wrj.99.1618909652608; 
 Tue, 20 Apr 2021 02:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
 <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
 <YH4VdPNO9cdzc5MD@atmark-techno.com>
In-Reply-To: <YH4VdPNO9cdzc5MD@atmark-techno.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 11:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
Message-ID: <CAK8P3a1GjeHyMCworQYVtp5U0uu2B9VBHmf9y0hGn-o8aKSJZw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
X-Provags-ID: V03:K1:1AMFxWlCfru2gV1vt/8GOQalzBgZcXbu8hWV8i20Cuh9WQyaW1f
 GcKzFJrPaGkrCFsUx/tMdYzWMmvzphLxkSfav6ZYJjrRA+Izzsj9tUBFh6m6BRxIzeoSNDE
 Zb8579Gk6kAwaTIF914yQmra7cpSCQMAbKq+/+OUKPGIx5Ju3jhv/kyf8rWaeV6Ut5iMipF
 ETVaYK+SQbiGfh7zvCfIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uX9o50WlzFM=:3Ukkk15pZakuhf5sHurWOV
 qSPl6dZNTdD9BTNuX5sMDxiePg1Oq87Vg3zJe8gTnjcnL+hauRufkEc12J9uIdJtGO8nDsb7U
 JWVW3ZMoDyADonUGLrG5eHNyn7uJBH38GLDLJoI0VgUWeu4rYtUYPT2+eqMxtl8nnlpsjezs9
 P/CflQzet2Bs6e4Kw/mFrpGzQpPz09oAL97P4oj3l9EO8oZqEjt+5vCntwDfo2xvbBvX9HWhE
 W4o5aU7C5EEkKtKPK15yHlqhOW+pCTrrrQnpo3jLRwVDYh3H4bVNs7ggVNsd1UAoAAMPszG/x
 jP22Q48tL9jTYU3QmZv5bgDT3A8bKbbiKCmnfBa4udtTXUE0ySnpkIeXlOogXr/GZypc7nb2n
 1VnGYAEssGAudwJ5p18EPMahylPuk75y/MQI+klX2NUsOOPepIZ/kLxTWMUugI3JnimF5PI9g
 Dr5G0o3fOLVJigeyoUOYHrM8xOmeYQTgnTUJ8/FqSnyJsYIp1Aekt74ratdCaWk9vnSZ9398s
 MC4rz9r+QbLq0dM2VYA0hmUWdJZeGxfOEG2/vnZleig0A4JuPdqNpVJPd2lokYq4eMRm9A68O
 mFShwc3EjP3yeFaoYFN/+oXUnCL/ut+mFXBww3FIJvxJtIucosvOi68MVHbLe4S6KFtnOPqnQ
 bcNo=
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, aymen.sghaier@nxp.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rafael Wysocki <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Networking <netdev@vger.kernel.org>,
 linux-phy@lists.infradead.org, peter.ujfalusi@gmail.com,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Joerg Roedel <joro@8bytes.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-staging@lists.linux.dev,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Kishon <kishon@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Eduardo Valentin <edubezval@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, Felipe Balbi <balbi@kernel.org>,
 tomba@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 USB list <linux-usb@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Robert Foss <robert.foss@linaro.org>,
 Leo Li <leoyang.li@nxp.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
 dmaengine@vger.kernel.org, Roy Pledge <Roy.Pledge@nxp.com>, jyri.sarha@iki.fi,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 1:44 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Arnd Bergmann wrote on Mon, Apr 19, 2021 at 02:16:36PM +0200:
> > For built-in drivers, load order depends on the initcall level and
> > link order (how things are lined listed in the Makefile hierarchy).
> >
> > For loadable modules, this is up to user space in the end.
> >
> > Which of the drivers in this scenario are loadable modules?
>
> All the drivers involved in my case are built-in (nvmem, soc and final
> soc_device_match consumer e.g. caam_jr that crashes the kernel if soc is
> not identified properly).

Ok, in that case you may have a chance to just adapt the initcall
levels. This is somewhat fragile if someone else already relies
on a particular order, but it's an easy one-line change to change
a driver e.g. from module_init() or device_initcall() to arch_initcall().

> I frankly don't like the idea of moving nvmem/ above soc/ in
> drivers/Makefile as a "solution" to this (especially as there is one
> that seems to care about what soc they run on...), so I'll have a look
> at links first, hopefully that will work out.

Right, that would be way more fragile.

I think the main problem in this case is the caam driver that really
should not look into the particular SoC type or even machine
compatible string. This is something we can do as a last resort
for compatibility with busted devicetree files, but it appears that
this driver does it as the primary method for identifying different
hardware revisions. I would suggest fixing the binding so that
each SoC that includes one of these devices has a soc specific
compatible string associated with the device that the driver can
use as the primary way of identifying the device.

We probably need to keep the old logic around for old dtb files,
but there can at least be a comment next to that table that
discourages people from adding more entries there.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
