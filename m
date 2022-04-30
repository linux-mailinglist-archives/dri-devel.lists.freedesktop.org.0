Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51649515B4A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 10:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7D10E211;
	Sat, 30 Apr 2022 08:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A8710E211
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 08:05:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MlNl5-1o7thE1B6L-00lkq7 for <dri-devel@lists.freedesktop.org>; Sat, 30
 Apr 2022 10:05:05 +0200
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f7d621d1caso105604367b3.11
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 01:05:04 -0700 (PDT)
X-Gm-Message-State: AOAM531hMiGVVgqPbQiaaY+fe/OhN8RJC4MRpLMnvW60d1MNUUjMJFIf
 Nx/rcegOAWoCfSd15eCWTrjSCWrHxiVflZkbkas=
X-Google-Smtp-Source: ABdhPJxIMDnLMjNypqGxsmgcfR7ZUL75Dsm3yzSBDwMin5TKOLRH68mEJhbPriu8EYo0bqonSau57unAkS8+mfbVn7s=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr3009265ywf.347.1651305903889; Sat, 30
 Apr 2022 01:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
 <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
In-Reply-To: <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 30 Apr 2022 10:04:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
Message-ID: <CAK8P3a05vFdBnXXAMPVS82xX29+uinvWPcWxAgvj0TfoOk+1kg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sWQIKyiy50us/H8VFbuhSgpvU0ks5MLTdLDS0DqLGft4zrn9Ccm
 CejAEIouyIhtcJHjKG0txInYWecb6Cl+FawVxss5YPU5MpWTHTN8beZelBLpn70ExJ0I/IW
 oDj7CFNgbn9Z5LiZAf+asZsg6ciwxYFHEmGLjXTVw77MAGxRLJXTF3Sdw2Qs2j+EPNVHLay
 6KKum/tGpmM1JwrCvgO1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xc61ZH+JtjM=:PrmMN+anGGJxyh0T7IkEZJ
 MstXlYRJZm56V5NsVy0KvOy+j98z+Qooh1w/5YhJWGyUq25UmjMftzcioivIEkcDso2O5ylgd
 HC/GchtNyONB2WhbECYoUowKMjiKwv+SCNgclCtlJJBRnxyJy75M1jTL7fDwdDV9T8pnEVdS1
 7ahbCrtbpeAlMn/nvIDFqh7vXjhjYWWO3u5hR3DaI45soOjtItVJqiAfSp8Fj9d6gfLPReQqK
 WYvFUCSG7iMSuwG0l/hJa0Z9EYkcCQ0t+19qHHdg5JRTkIIns3pE+igqu/BdD487HMdqEARKn
 Ja/CTDTQJ8Rikwys/USK0PepoyIk2RU242j2e78WZbEXhfg+QSfscvriku86kLYLXFymVoAEr
 rTaxAKlTo/77T3i+DXMDvLmjHEpDZyXzjk6+OxpKu/bOGE8vPEN1/yOA6lCLeAlk/sl/NT5Is
 tI1dqUDgeQXtINhWNdz3jp/LW58QiJwshT5oMf+cBYha2w92ozq+dBG8jFFenk3jK6qJ2N5K6
 TxX2lslitr0qxtrwVowitaasoJm4e3nrA/SYChagOc1XTccew5di08dV9/TiT6/2/ZNWAciBL
 8QCjTnbJvYG7GJR/dR5YuSkBaYOkEw+DHd5y7U12WR11qQOjpzMu2UlkYHfKOaIejJXZf0UjZ
 Jj4m7vQye3J8CF27ivIJSXd6QG1fnungh3ab+VO1ElZ756X2OYWma1a8zLiLb5JWZFZbnBXkv
 Jiw8oJtAZ/pld+AYJ7e+XGDGewmIjk+8MajYtnA3fbm/NBoMpOGpSidKscSXO/L2NM0rJcJpc
 g2+KLxxHB59sEtdr1zorfSJyriX/MS8TDEcqVC6t8kkLahsvns=
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
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Sat, Apr 30, 2022 at 1:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/29/22 14:46, Arnd Bergmann wrote:
> > On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 4/29/22 10:48, Guenter Roeck wrote:
> >>>
> >>> I tried the pxa-multiplatform-5.18 branch. Its failures match
> >>> those in v5.18-rc1.
> >>>
> >>
> >> Uuh, wait, the build wasn't complete. There are still some
> >> failures. I'll report later.
> >
> > Sorry about the breakage, I got a few more reports about minor build errors
> > and warnings, the newly uploaded branches should address all of the ones
> > I got reports for.
> >
>
> Unless I am missing something the failures are the same as before. See
> https://kerneltests.org/builders/qemu-arm-testing/builds/74/steps/qemubuildcommand/logs/stdio
>
> This is with v5.18-rc1-49-ge8ab9a9a2745 which is the tip of
> soc/pxa-multiplatform-5.18.
>
> Should I check a different branch ?

I only addressed the pcmcia probe failure that you reported for the
final pxa patch, which
previously caused a NULL pointer reference here:

[    1.405319] PC is at pcmcia_init_one+0xf8/0x27c
[    1.405476] LR is at devres_add+0x40/0x6c
[    1.405611] pc : [<c04bdea0>]    lr : [<c044d808>]    psr: a0000113
[    1.405846] sp : c48a5d00  ip : c15f4220  fp : 60000113
[    1.406026] r10: 00000000  r9 : c48b000e  r8 : c48b0000
[    1.406195] r7 : feeb0000  r6 : feeb000e  r5 : c15ec090  r4 : c15ec020
[    1.406395] r3 : 00000002  r2 : 00000000  r1 : c15f4200  r0 : feeb000e

This now seems to work:

[    1.435846] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card
inserted into slot 1
[    1.456350] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card
inserted into slot 0
[    1.457489] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 217)
[    1.460275] pata_pcmcia: probe of 0.0 failed with error -12

So it sounds like there are additional bugs that I have to look at. I
probably won't
be able to do that in time for the merge window. The logs contain a number of
warnings, but I have no idea which ones of those are preexisting issue. I had
a look at

[    0.689982] pxa-dma pxa-dma.0: error -ENXIO: IRQ index 1 not found

and concluded that it must have done this for a long time. In my own qemu
instance, I see a crash from iWMMXt, but that works fine on your machine.
OTOH, your failed instances all look like they either time out or
failed to find a
rootfs. I tried passing an MMC device as root, and that works here.

         Arnd
