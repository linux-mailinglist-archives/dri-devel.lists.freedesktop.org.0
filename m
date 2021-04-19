Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15836415E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9EF6E2D7;
	Mon, 19 Apr 2021 12:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6836E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:17:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com ([209.85.167.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTiHd-1l4ORu2yMv-00TyS9 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr
 2021 14:17:03 +0200
Received: by mail-lf1-f49.google.com with SMTP id g8so55627082lfv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 05:17:03 -0700 (PDT)
X-Gm-Message-State: AOAM531UvOvCSYr2jwSBtEhniWtp/0DtYtaBqUpAsAT0euoxjBW80bOs
 IJpK3qbFRHeXEnEoIqEpIzFaWUftNOSTjr5BpG8=
X-Google-Smtp-Source: ABdhPJw4F20QerTwfst1rAMwc6NWiXDSUWeUkZ8E4j2sezaYrIv6atAni45jIwUzsYws7AyLO9D3pu8QFGIGztgXd7o=
X-Received: by 2002:a05:6000:1843:: with SMTP id
 c3mr14679907wri.361.1618834612186; 
 Mon, 19 Apr 2021 05:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
 <YH1OeFy+SepIYYG0@atmark-techno.com>
In-Reply-To: <YH1OeFy+SepIYYG0@atmark-techno.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 14:16:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
Message-ID: <CAK8P3a1Mu2F0irDDCL-50HiHth29iYFL5b7WHZ=UX6W7zzoxAg@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
X-Provags-ID: V03:K1:zSjFi8aUot0zGcMBxFIpQUNsqtkeBaQH1g5pc3FS7S3z9qDcpar
 +B20CfVGpZ98ECl+uY9vce6dxdlc+byrRs8ruhML69JWusTI1bxhxyO1Unw+drF0kTNtqL0
 6v9znrR6YhGBTf0J0hFLcRrilPFhZ5IIjQLBoIDu+d2Glb23F37dQPpUx27ztPhz6+Eo76V
 vddC4t52daB0zFcOoTl+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lF711O/l5Pw=:CJNvJ5JaP81eP5Eo7K1YTf
 jpGwA3vX2I60wUDb8XtNvV+KrCZT51LDY2Fy/WWoSaZOuT9f5JHgcMXrcXzVh6JchwfbtJOKx
 CgA8DrfrPATETdbWfYJG12dQbpBEOiXOPcRMzdo1GkF9/GZOJ9EyXq3ebetqRsL9xfrFrqeVE
 euU7ReDBOITEhXoAe69DGF+KXAIr5cII0A2BJK8d4go7ckIAJx39ldCrKEyHayb65WuukjN9f
 KIUQmApnO5vzMhpx3gFtCh3uJkC8rREp2llxS0BLA7CXA/+IdHHuHFBgQiZV+wD8+wK0/JR1f
 U/5YYzgyZ0LbbzxnK6H8eiqhSRORrgIPoVwIKEhilx9kodIEI2jB2B/JdOvmlygj//cH5qI0e
 NC3VYRJK+A3vydBB9kQj+BzkMi4xsR/dL6liRHUp+lkcKLBm8aC01rMlFFDILApipHoNaHIJT
 17i4c2RR1m/GK4ut54Mvw+j0UuypJVL3NmanMyxLjd4PNdfnxUWO8Td4qJu1aXJurloJ5B+O0
 KU3Ruib2/qt9RQuDIjoqwcj5lGbvmd7DsOjV8hjYfvLx1ON+lF3kqPvU3ZF9ie1Kx/YPapL7K
 PJVLMT+HgCn/tmwYG69+SMfIRgZUe0jinH2psmEroVoAuHOWWsmARJEdElhwRwc7yPbTaRwbw
 U3Ss=
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

On Mon, Apr 19, 2021 at 11:33 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
>
> > soc_device_match() should only be used as a last resort, to identify
> > systems that cannot be identified otherwise.  Typically this is used for
> > quirks, which should only be enabled on a very specific subset of
> > systems.  IMHO such systems should make sure soc_device_match()
> > is available early, by registering their SoC device early.
>
> I definitely agree there, my suggestion to defer was only because I know
> of no other way to influence the ordering of drivers loading reliably
> and gave up on soc being init'd early.

In some cases, you can use the device_link infrastructure to deal
with dependencies between devices. Not sure if this would help
in your case, but have a look at device_link_add() etc in drivers/base/core.c

> In this particular case the problem is that since 7d981405d0fd ("soc:
> imx8m: change to use platform driver") the soc probe tries to use the
> nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
> So soc loading gets pushed back to the end of the list because it gets
> defered and other drivers relying on soc_device_match get confused
> because they wrongly think a device doesn't match a quirk when it
> actually does.
>
> If there is a way to ensure the nvmem driver gets loaded before the soc,
> that would also solve the problem nicely, and avoid the need to mess
> with all the ~50 drivers which use it.
>
> Is there a way to control in what order drivers get loaded? Something in
> the dtb perhaps?

For built-in drivers, load order depends on the initcall level and
link order (how things are lined listed in the Makefile hierarchy).

For loadable modules, this is up to user space in the end.

Which of the drivers in this scenario are loadable modules?

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
