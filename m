Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E519752A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349689F9F;
	Mon, 30 Mar 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367AB6EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:15:42 +0000 (UTC)
IronPort-SDR: 93xdN2TuMFFz7sVATIO/pZBd6oFxIIheuC5bBi8i3AMCGvZbdFBjw9Kqma3hUbfPKfkbAHEoma
 hejIRdi3Veaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 06:15:41 -0700
IronPort-SDR: XHTT49Zml5OGbcmAOJNZTIDZQS91ZOVq3uN4HpDBmRzC4zWzne4di8SI0Jcxq/yPKD08tI2Guo
 S2MG0L4zVlEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="293928658"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2020 06:15:30 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jHopf-00DQI1-3f; Fri, 27 Mar 2020 15:15:31 +0200
Date: Fri, 27 Mar 2020 15:15:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
Message-ID: <20200327131531.GU1922688@smile.fi.intel.com>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327131026.GT1922688@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
> > On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
> > >
> > > recently we wanted to update xilinx intc driver and we found that function
> > > which we wanted to remove is still wired by ancient Xilinx PowerPC
> > > platforms. Here is the thread about it.
> > > https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
> > >
> > > I have been talking about it internally and there is no interest in these
> > > platforms and it is also orphan for quite a long time. None is really
> > > running/testing these platforms regularly that's why I think it makes sense
> > > to remove them also with drivers which are specific to this platform.
> > >
> > > U-Boot support was removed in 2017 without anybody complain about it
> > > https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
> > >
> > > Based on current ppc/next.
> > >
> > > If anyone has any objection about it, please let me know.
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > This looks reasonable to me as well, in particular as the code only
> > supports the two
> > ppc44x virtex developer boards and no commercial products.
> > 
> > It does raise a follow-up question about ppc40x though: is it time to
> > retire all of it?
> 
> Who knows?
> 
> I have in possession nice WD My Book Live, based on this architecture, and I
> won't it gone from modern kernel support. OTOH I understand that amount of real
> users not too big.

+Cc: Christian Lamparter, whom I owe for that WD box.

> 
> Ah, and I have Amiga board, but that one is being used only for testing, so,
> I don't care much.
> 
> > The other ppc405 machines appear to have seen even fewer updates after the
> > OpenBlockS 600 got added in 2011, so it's possible nobody is using them any more
> > with modern kernels.
> > 
> > I see that OpenWRT removed both ppc40x and ppc44x exactly a year ago after
> > they had not been maintained for years.
> > 
> > However, 44x (in its ppc476 incarnation) is clearly still is used
> > through the fsp2 platform,
> > and can not be deprecated at least until that is known to have stopped
> > getting kernel
> > updates.
> > 
> >         Arnd
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
