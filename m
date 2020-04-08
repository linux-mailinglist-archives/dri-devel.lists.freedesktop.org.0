Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED951A1BE5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207F06E953;
	Wed,  8 Apr 2020 06:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF296E953
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:29:06 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k18so3785006oib.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 23:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZyxSe1F9CEekbeEkcnl4DCUrszNmMjMax7bRV4fmFk=;
 b=BPY1i4aO41CjHqhYNp6Kysspkh6kB40LY5EW5XVxQ5MyPyZX+1qrASnfkVeA9rRqaw
 q1Hz4V2pRys4XH37ojeZCiz0hGCxmk0qlfs7Cpe95Ijx4f/U4ndwP2wgujtwwoiFY4Ks
 cIo030IFXCfIGo6buW5r/88/21Be5xTrMBx0rwk6A3SR5ALgm2L7DLA8RXmKlAqAwiho
 Vblat1Pg1IRiJPlrqG6mhMp6U+vnZnQ7Z240Q9+95iBagM9fndW2KCwPn9SlWIi2E8qH
 HLELiLXTQaxysglQALh8marK8jJzoxhnvRXRmG83KEpYpbIalPtj3Yto89vgicXsCD4N
 zFtA==
X-Gm-Message-State: AGi0PuY2y5IfX77JeQ2UssE4ax4OI0TOUEiTvvyJKk//TY8utEqNTk32
 negzfaioLxW6UR3Hi6inV5R4tNqRvqXBq6xJ0og=
X-Google-Smtp-Source: APiQypL2H0+76KoauaUo4b9NNZhymcHNW+vj4EBMTBKwnkZS2xjRBEdU1EaFq/Qm0sL2SKQ6wSNTquXtK4QZ4u2dRx0=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr497636oie.148.1586327345628;
 Tue, 07 Apr 2020 23:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
In-Reply-To: <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2020 08:28:54 +0200
Message-ID: <CAMuHMdUkwy8GkXrud2EjUvu8nWn=y=RDXk3b6YK0=NMkPWgVEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
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

Hi Ben,

On Wed, Apr 8, 2020 at 1:34 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> > Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > > On Tue, 2020-03-31 at 16:30 +1100, Michael Ellerman wrote:
> > > > I have no attachment to 40x, and I'd certainly be happy to have
> > > > less
> > > > code in the tree, we struggle to keep even the modern platforms
> > > > well
> > > > maintained.
> > > >
> > > > At the same time I don't want to render anyone's hardware
> > > > obsolete
> > > > unnecessarily. But if there's really no one using 40x then we
> > > > should
> > > > remove it, it could well be broken already.
> > > >
> > > > So I guess post a series to do the removal and we'll see if
> > > > anyone
> > > > speaks up.
> > >
> > > We shouldn't remove 40x completely. Just remove the Xilinx 405
> > > stuff.
> >
> > Congratulations on becoming the 40x maintainer!
>
> Didn't I give you my last 40x system ? :-) IBM still put 40x cores
> inside POWER chips no ?

Good to know!

Are they still big-endian, or have they been corrupted by the LE frenzy,
too? ;)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
