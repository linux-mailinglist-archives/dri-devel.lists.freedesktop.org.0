Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD35584D08
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E5510E02C;
	Fri, 29 Jul 2022 07:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ED910ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 07:57:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F36261BF0;
 Fri, 29 Jul 2022 07:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEAAC433D6;
 Fri, 29 Jul 2022 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659081450;
 bh=kGpstCAAwPkGYsBYA0Sv1cWBhpQqBl9cZdq6KbVZpIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5ZbaoWIRXMrNQTc535bsP0zIPJb4o4x7G+72avOewl26tmgUH0fnYcLGAm1TRjkG
 wqEuTzdTP5GGSarwRrwLDIPmR7ZtpH/JQSaxOqnbgevhFJYaZFL/c+mM1lO2blfykq
 e/98jXo2dQ75Q6EsD/pRVQ6C38alFpyauc3p8dHA=
Date: Fri, 29 Jul 2022 09:57:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] drivers: serial: earlycon: Pass device-tree node
Message-ID: <YuOS5yUfNlTOtI6U@kroah.com>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-2-markuss.broks@gmail.com>
 <YuKfaVG/ZbYtFjS/@kroah.com>
 <CAHp75Vfz8e1j4qZ6XY6WqMR4E9fKFxrTxj7P6KraXzSLk_NhxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfz8e1j4qZ6XY6WqMR4E9fKFxrTxj7P6KraXzSLk_NhxQ@mail.gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>, Markuss Broks <markuss.broks@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 11:04:24PM +0200, Andy Shevchenko wrote:
> On Thu, Jul 28, 2022 at 4:41 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Thu, Jul 28, 2022 at 05:28:18PM +0300, Markuss Broks wrote:
> > > Pass a pointer to device-tree node in case the driver probed from
> > > OF. This makes early console drivers able to fetch options from
> > > device-tree node properties.
> 
> ...
> 
> > > +     unsigned long node;
> >
> > That should not be an unsigned long, but rather an 'int'.  Something got
> > messed up, of_setup_earlycon() should be changed to reflect this before
> > propagating the error to other places in the kernel.
> 
> It's a pointer, but what puzzles me, why it can't be declared as a such:
> 
>  struct device_node *node;
> 
> ?

It should not be a pointer, trace things backwards, it comes from a call
to of_setup_earlycon() from early_init_dt_scan_chosen_stdout() which has
offset declared as an int, and then does:
	if (of_setup_earlycon(match, offset, options) == 0)

So why would it be a node?

> > And it's not really a "node" but an "offset", right?
> 
> Seems no.

Really?  What am I missing here?

confused,

greg k-h
