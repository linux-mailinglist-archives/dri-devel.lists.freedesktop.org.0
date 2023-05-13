Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB33701BFA
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 08:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2210E05D;
	Sun, 14 May 2023 06:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2813710E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 06:33:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9046F60AC4;
 Sun, 14 May 2023 06:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C435C433EF;
 Sun, 14 May 2023 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1684045980;
 bh=1dZ7d937g3cEehK4Bk2L/HX89vq34GtVVpU+t+w4bes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YR+Cf42wmgwUAKpVoPu7zi/HZsELdI7vnMIwpriO5yuT2WZb0z8wbgLyNfDEu7Xqf
 8Yabcdp8jdKn4jvlVbZggOodgMhjV2nFOzalYBcvgbfhh38YMKt8KEzh0wUKzMjzn8
 an+gOaOOS9yOngVUTSsyoY/GIUOMV/UmprUY7Z74=
Date: Sun, 14 May 2023 00:07:28 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Message-ID: <2023051414-headroom-maimed-553c@gregkh>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
 <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
 <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
 <CAC1cPGzznK8zoLaT1gBjpHP1eKFvTKKi+SW6xuXF3B8aHN27=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC1cPGzznK8zoLaT1gBjpHP1eKFvTKKi+SW6xuXF3B8aHN27=g@mail.gmail.com>
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
 Simon Horman <simon.horman@corigine.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jonas Jensen <jonas.jensen@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 13, 2023 at 09:43:39AM -0400, Richard Fontana wrote:
> On Sat, May 13, 2023 at 6:53 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On 5/12/23 19:46, Richard Fontana wrote:
> > > On Fri, May 12, 2023 at 6:07 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > >
> > >
> > >> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> > >> index 504be461f992a9..822bf8905bf3ce 100644
> > >> --- a/drivers/watchdog/sb_wdog.c
> > >> +++ b/drivers/watchdog/sb_wdog.c
> > >> @@ -1,3 +1,4 @@
> > >> +// SPDX-License-Identifier: GPL-1.0+
> > >>  /*
> > >>   * Watchdog driver for SiByte SB1 SoCs
> > >>   *
> > >> @@ -38,10 +39,6 @@
> > >>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
> > >>   *                                             All Rights Reserved.
> > >>   *
> > >> - *     This program is free software; you can redistribute it and/or
> > >> - *     modify it under the terms of the GNU General Public License
> > >> - *     version 1 or 2 as published by the Free Software Foundation.
> > >
> > > Shouldn't this be
> > > // SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
> > > (or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?
> > >
> >
> > Nope, as it will fail spdxcheck.py. Also, SPDX specification [1]
> > doesn't have negation operator (NOT), thus the licensing requirement
> > on the above notice can't be expressed reliably in SPDX here.
> >
> > [1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/
> 
> The GPL identifiers in recent versions of SPDX include an `-only` and
> an `-or-later` variant.

But Linux does not use the newer versions of SPDX given that we started
the conversion before the "-only" variant came out.  Let's stick with
the original one please before worrying about converting to a newer
version of SPDX and mixing things up.

thanks,

greg k-h
