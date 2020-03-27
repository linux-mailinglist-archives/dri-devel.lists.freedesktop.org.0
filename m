Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181281957E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 14:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772226EA2A;
	Fri, 27 Mar 2020 13:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07376EA2A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:23:18 +0000 (UTC)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIMKq-1j3Sxb0BT2-00EK5U for <dri-devel@lists.freedesktop.org>; Fri, 27
 Mar 2020 14:23:15 +0100
Received: by mail-qt1-f179.google.com with SMTP id i3so8436945qtv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 06:23:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2gXbucvfItonKw5BTiqePxYPzOlZL1eV70EFB/w06M/3ZNNvli
 vHZFScicIb8Pn2soIxFbcML8mdX2neIfpmyfyP8=
X-Google-Smtp-Source: ADFU+vulNA+7BxZ8KynFjYc9GnYqAH2MuhhxSGrAnAMTyGPWxL6I9KWAa8nLPHSfN4FBnPkXk6FuMsvBVm3MWAXJwGU=
X-Received: by 2002:a37:6455:: with SMTP id y82mr14033725qkb.286.1585315392272; 
 Fri, 27 Mar 2020 06:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
In-Reply-To: <20200327131531.GU1922688@smile.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 27 Mar 2020 14:22:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:GqQRKTR+HN1cbA+l8C4AvO7HZ2O21koPI/9tl3BKi/Xlc5am0f6
 SQV+se9R/a2i4vHzO8NKr0wsbReCzAK4uls9PYUwXmKnGV5YqCl1ASJXwvKLn4pRiX+k3kg
 nNtNoqDl48g5BtjHDGjGssJn9cUHvBM7FL+Jikx0S/f/6sselE9Q6LnE64bmmNTpbtE6y4C
 56feE+NKgcxcvv56XWLBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RBDKM/td7eA=:j5ecbpeTjDClfxjgyUuIcr
 rVqBznDo0FU3OkBdzLGefBHLqk5AmQwn9OomHb8hEsQj66+biXYB+FLtlYC6OtRjKIqB0rY2p
 7jhh19KXOpAzGtnq39a46wiYEegSUhClCxvTd0nqWFWz7NITbYEAFco1avtk9QbHJ+ap5/8zG
 BUwEOAJ4vadqrEqCHeXTcJTV8YIYvcKmD67MPBbgJhEss4hyXwkTlTDmrqmXylD1b8eJiE73r
 +pzxyMm1OxzFbO6j6RLWcK5Ol4eQ/BvK2MmPqjvjqfGfQHHBu+gpyQL9UhhnTe8xAt7loe1Ik
 bu0TtMIxpBAuaqf2Ski1bSt3vcvVktL+VcerMUc7k0rLHvKjT7PsghwiOQQJZLVGsdrUS38wI
 mwVAMgc4yRxvr1hf3SUcdEF9zEfO9gTq+Gtk8C5im9u4oCewDnGKx1e7umTaJzBCmw7QtdIOX
 CNd7CekJzsWzUaDKHHvnIav4epwjzkZ5JlIYfn5yNkOapFpAIhSj3mRiA6Hne84rnOYqeA6it
 Sy31WV4Sn8YPK9K3/Z374cQRK7xN6lhTlBv64hmkKDueqAnRxFA97MwE4Yy9SR4m8htYSJe2q
 lPsUQhttfWv4xXzf/MsbXshxrHA7h1ltCv/zO/7WMJDc7QE6VrwzQHWX29iESS+WasIHR/dqG
 9iZJXRK4TMT/tlzqH++v2Zd1+lxHEF7c0JeHa8fVOHSLVubYsOa30kMIkxs7NnMz091XSAILZ
 iQClLRO2upjOOP5dlAfSmn/8BJK6rfKfTtGXPtnfVcHCoznWJqDsa3bY83V20kt3RJvXyRnCO
 70EM7uHFU9qriK6xbklGWeccSrbMvyqNR8LBDZBQ5yAIv/QfFQ=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
> > > On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
> > > >
> > > > recently we wanted to update xilinx intc driver and we found that function
> > > > which we wanted to remove is still wired by ancient Xilinx PowerPC
> > > > platforms. Here is the thread about it.
> > > > https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
> > > >
> > > > I have been talking about it internally and there is no interest in these
> > > > platforms and it is also orphan for quite a long time. None is really
> > > > running/testing these platforms regularly that's why I think it makes sense
> > > > to remove them also with drivers which are specific to this platform.
> > > >
> > > > U-Boot support was removed in 2017 without anybody complain about it
> > > > https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
> > > >
> > > > Based on current ppc/next.
> > > >
> > > > If anyone has any objection about it, please let me know.
> > >
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This looks reasonable to me as well, in particular as the code only
> > > supports the two
> > > ppc44x virtex developer boards and no commercial products.
> > >
> > > It does raise a follow-up question about ppc40x though: is it time to
> > > retire all of it?
> >
> > Who knows?
> >
> > I have in possession nice WD My Book Live, based on this architecture, and I
> > won't it gone from modern kernel support. OTOH I understand that amount of real
> > users not too big.
>
> +Cc: Christian Lamparter, whom I owe for that WD box.

According to https://openwrt.org/toh/wd/mybooklive, that one is based on
APM82181/ppc464, so it is about several generations newer than what I
asked about (ppc40x).

> > Ah, and I have Amiga board, but that one is being used only for testing, so,
> > I don't care much.

I think there are a couple of ppc440 based Amiga boards, but again, not 405
to my knowledge.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
