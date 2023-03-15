Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9C6BAD7B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 11:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817A510E99A;
	Wed, 15 Mar 2023 10:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165E10E99A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678875624; x=1710411624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AZu0G5MJgXhilc9n2aaLZyeOdNLiwJBTw+hEvyBlZ5c=;
 b=MSy3i8X0DV4HmnuZZcXL/yPyNk7J9LandFkQXdl/+dbNiNx6qiUSI/2o
 t962slGhe+HfyjF+a+te2UUN/1MJM+WVt2MIUhZAsQo73xWvm/K5fnZa2
 uIcD5PfYDBR/36idZ1lna83yatn5ZVrJ1e+kual1IgttaYDZ9cuWL9ujx
 f54fYj53hqvWmsS7QOyGPNoDwKD4r0DE0Bxxh9br/OOaweprcbAsH4IMa
 S7bgo2tSJALhmIj+NSr1OZx6DdJqBQpXwSu89I1mpX6GNWMAsFu4Su5Au
 UhgGKKnMBVQxx5Xa7/GCsWettaA21W2mTgsfGsasUGcbmc5X8P9Ez54nS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400246115"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="400246115"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672684150"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="672684150"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 15 Mar 2023 03:19:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Mar 2023 12:19:48 +0200
Date: Wed, 15 Mar 2023 12:19:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 35/38] video: handle HAS_IOPORT dependencies
Message-ID: <ZBGbxDWEhqr8hhgU@intel.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
 <20230314121216.413434-36-schnelle@linux.ibm.com>
 <CAMuHMdW4f8GJ-kFDPg6Ao=g3ZAXq79u9nUZ_dW1LonHu+vxk8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW4f8GJ-kFDPg6Ao=g3ZAXq79u9nUZ_dW1LonHu+vxk8Q@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 09:16:50AM +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Mar 14, 2023 at 1:13 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > not being declared. We thus need to add HAS_IOPORT as dependency for
> > those drivers using them and guard inline code in headers.
> >
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> 
> > @@ -1284,7 +1285,7 @@ config FB_ATY128_BACKLIGHT
> >
> >  config FB_ATY
> >         tristate "ATI Mach64 display support" if PCI || ATARI
> > -       depends on FB && !SPARC32
> > +       depends on FB && HAS_IOPORT && !SPARC32
> 
> On Atari, this works without ATARI_ROM_ISA, hence it must not depend
> on HAS_IOPORT.
> The only call to inb() is inside a section protected by #ifdef
> CONFIG_PCI. So:

That piece of code is a nop anyway. We immediately overwrite
clk_wr_offset with a hardcoded selection after the register reads.
So if you nuke that nop code then no IOPORT dependency required
at all.

> 
>     depends on FB && !SPARC32
>     depends on ATARI || HAS_IOPORT
> 
> >         select FB_CFB_FILLRECT
> >         select FB_CFB_COPYAREA
> >         select FB_CFB_IMAGEBLIT
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Ville Syrjälä
Intel
