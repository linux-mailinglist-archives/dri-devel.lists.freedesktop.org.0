Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17108513587
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E495210E247;
	Thu, 28 Apr 2022 13:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88CC10E60D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:45:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHVWT-1nfxqb2g2T-00DZu3 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr
 2022 15:45:04 +0200
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2f16645872fso53520187b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 06:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM533JNDNJzo99XV65oTiJp84JyYtlWok6i+4NUpGWZRWRuO+wKsY3
 rDkf+RGczNx2i7BVtm1hGUmSiifmKbuALZ7Xp60=
X-Google-Smtp-Source: ABdhPJzhKdbLezBOw+onlWys2HjSNrb5hSb6f6j0ogYNPd9ax1npbHyo1Y6CrpuYIOWED3Pgr1SGQ4YvAKDaJmP/tmM=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr33063062ywf.347.1651153503029; Thu, 28
 Apr 2022 06:45:03 -0700 (PDT)
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
In-Reply-To: <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 15:44:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
Message-ID: <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2PNkDQKKq81fxDQiew4Be1grHaQbo2Sj+NF4QzoEZI3GbikbvU+
 40rbzRJYZXLl4OIe1wCoQ+CogQNGJQJgZcc8yT0YL70+Kg9wrIzvEwAmNcYQZI63Jkz67uq
 A/iApCkz5Dfo4epzGHfR9bwlQ/t9M8b/tln0fq9F6gx9NVR02LbEO+dn1IUaG0gFt2lDFiy
 A6BFw3EiNj7g8c5GjjxrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dzDKBX8j6ck=:xwfRMemtDH+TA+5Ng+HJ/t
 QYBAtm7t0oI+JPC9XURkY1ZJ7lQY3+IDW7kLEj29kIAxWmKZZlJHrpI0T9V4Na7fmGuqPB08/
 q9ngO0d8EXOAmBm1kP9ucqfcVh334WlFG0XoewlEbyzBWF+9wmheu3jRs/zDE9eMcBPhC8Cxu
 dEzN+w5EmOwIBjyHHeN0LeQYB9yG2TvesGK/IG3AhT/plUZIfJ9Nfi1FxiU3KXLDJ5Z64QnXY
 smU4NzWObC/Xp921myER+26db7FjckDKng+hep6dVNjK5Iq5tbfngnRXtxsoMVN7GDLdAILSZ
 jj/wUuV0hHlxiM3wE6voJGoPxUJvRSWm8SdAR+axZhWCWoaN/jWICoL6hkDNYHwlwvW49bj+B
 B1phD7I/MGpuV62HQed5qEKn2/PrW0jPUle396iGCIy1REOMLtawrz13GSVlWa23pAXtijr0l
 MyeikaCzOUEI2cYMe4lcQJa3dDCixsyeX27F7lJdESIgiwuGBiS81GYxJB69Ft1Ni/fnRqgcK
 gYuHYoZcRK7Z74ecwAtPBnarsgiPxQuXaNoRKQP00qaJDwBdLI16uibPsZBgxZVdrcN9hGscU
 K17PCgjAcR14hsSFCmqElo4JV/xDlcV/y4KBHSnsJkz89iF3gJvoOco9nqBk8eufL+rmMvKV8
 gyv9dMqMhWhwv5CfKdit5t09pon53GVK+xc7ndQgyXW2vfSpfkwu+wC5qpDfYkFtomD7aGQEI
 K2T6nHk8fZbSu7WmeZreC+y6xFe1+dr5QOPiuNIR465xCRZolrQOgczpatRpad7FPfZn/4ouc
 H74KygOM82RGoRGs3ITqnCtHJtXGtOkWrEgPodZdHGe1RHswto=
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

On Sun, Apr 24, 2022 at 8:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/24/22 01:52, Arnd Bergmann wrote:
> > > On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > into the defconfig file, otherwise the multiplatform target defaults to
> > > an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> > > you also need to enable CONFIG_ARCH_MULTI_V4T.
> > >
> > > This is slightly unfortunate, but I don't see any way to avoid it, and the
> > > modified defconfig will still work fine with older kernel trees.
> > >
> >
> > Yes, that works. I changed it in my configuration.
>
> Ok, great!. I managed to boot the z2 machine with PCMCIA support
> and it gets around the issue with my patch, correctly detecting the
> CF card.

Hi Guenter,

I have now sent out a fix that I'm happy with, and applied it to the
pxa-multiplatform-5.18 branch of the soc tree as well as the
combined arm/multiplatform tree.

I have not merged this new version into the for-next branch
since I would like to see if there are any other regressions first.

Can you run your boot tests on the arm/multiplatform branch
and let me know if that fixes everything you found? If that
takes a lot of manual steps on your side, I'd just wait for the
build bots and merge it after all there are no new compile-time
issues.

       Arnd
