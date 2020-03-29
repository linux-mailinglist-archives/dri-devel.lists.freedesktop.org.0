Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E827B196D43
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 14:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A386E118;
	Sun, 29 Mar 2020 12:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3F66E118
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 12:22:53 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c21so6521451pfo.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UClIPWeDMQPAzXntBk2QoHfbWj9MDU21yOBf0GHeHw=;
 b=jdUOwg337Wg8hPuF5NdV1z+1iXNGjwb+YDUmS97pf9xkU/BWMOmRa8gpqg/wHMmz2a
 h58yHx1+HaoLmCL6hnIeTPqm+2YMk9XzXIgi8Vgh9+ZM41zzixi1r10H3tUGl6hbw2fa
 +/SCEv5PddejDs3d49ieJ06lzLGUMqG9GyxGvtAAn6VGkc3VIzvQFeTpteUPogXC2Pzf
 Nck2ZgMO6TY1u9JXPbiayQdMPaVsYZN0gYMyxOTiZ2uHnfym+nSJ5RCtbfwJVF5O2hRj
 FXgxRY9UmwUvEuFr258gE1lMF0n3PSTtd9BUt9ycNv+7B5vOzdWySiaKBoIv9i+HiGuE
 66Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UClIPWeDMQPAzXntBk2QoHfbWj9MDU21yOBf0GHeHw=;
 b=sgJjcgTZr9FHeWQimE4m8tI0gMsHHRvIVk3ciAWAyqa+oxBnDrP09x0IMys3teSZ+/
 MwLQcoDX2mFKyiabsMfRTR4Xr3iFaKCnOXtPVhE6hJHksQOjOo3OTBui6NqxGrDyKLnl
 NrEsdxjBFH/JPtzpsGCOvT1mk/obB1J/jTQ5vUZMUbHHyedHm0t/xIzR4zuwqB+OdL9q
 16YtC0lSwLlgxuGAz2OR8Yirm8dsYERH5xSVemcYoQMSJA6NMEgqSr4RXqbtM15DO0TX
 tTVQ5t/Mek9yvGElM0SAa++Hi5YOR7Y/Jpt9wULrMz1+qlpuSv6WZ8T2qXKiuDgLDlji
 ZJnQ==
X-Gm-Message-State: ANhLgQ26mCMG1J8Qo/t9eF8F0XhMwx15zWwxM+Zt+GXe2nEjQ9NAbscW
 xsr8fNwnxJ7lckUc44S5S1hb8f1BYGdpWwuyPaI=
X-Google-Smtp-Source: ADFU+vtdWfniuNTMK9Zagqw0FyohZmWEmZi+NzvusNKnAyqgygrL2tuE+ttN/w5nkf3Xdl0gmeaKUfp8hzr43IbRckI=
X-Received: by 2002:a63:798a:: with SMTP id u132mr8699746pgc.203.1585484573149; 
 Sun, 29 Mar 2020 05:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200329092204.770405-1-jbwyatt4@gmail.com>
 <alpine.DEB.2.21.2003291127230.2990@hadrien>
 <2fccf96c3754e6319797a10856e438e023f734a7.camel@gmail.com>
 <alpine.DEB.2.21.2003291144460.2990@hadrien>
 <CAMS7mKBEhqFat8fWi=QiFwfLV9+skwi1hE-swg=XxU48zk=_tQ@mail.gmail.com>
 <alpine.DEB.2.21.2003291235590.2990@hadrien>
 <ab06bc216dc07b2b070bc2635aaabb1942c6089c.camel@gmail.com>
In-Reply-To: <ab06bc216dc07b2b070bc2635aaabb1942c6089c.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Mar 2020 15:22:41 +0300
Message-ID: <CAHp75VeyV5t3rMw5Za8yFoKmrFLwxDqbLLdDyOr+pezAC+Lv7w@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: fbtft: Replace udelay with
 preferred usleep_range
To: Sam Muhammed <jane.pnx9@gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 John Wyatt <jbwyatt4@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, outreachy-kernel@googlegroups.com,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>,
 Soumyajit Deb <debsoumyajit100@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 29, 2020 at 2:23 PM Sam Muhammed <jane.pnx9@gmail.com> wrote:
> On Sun, 2020-03-29 at 12:37 +0200, Julia Lawall wrote:
> > On Sun, 29 Mar 2020, Soumyajit Deb wrote:
> >

First of all, let's stop topposting.

> > > I had the same doubt the other day about the replacement of udelay() with
> > > usleep_range(). The corresponding range for the single argument value of
> > > udelay() is quite confusing as I couldn't decide the range. But as much as I
> > > noticed checkpatch.pl gives warning for replacing udelay() with
> > > usleep_range() by checking the argument value of udelay(). In the
> > > documentation, it is written udelay() should be used for a sleep time of at
> > > most 10 microseconds but between 10 microseconds and 20 milliseconds,
> > > usleep_range() should be used.
> > > I think the range is code specific and will depend on what range is
> > > acceptable and doesn't break the code.
> > >  Please correct me if I am wrong.
> >
> > The range depends on the associated hardware.  Just because checkpatch
> > suggests something doesn't mean that it is easy to address the problem.

> Hi all, i think when it comes to a significant change in the code, we
> should at least be familiar with the driver or be able to test the
> change.
>
> In the very beginning of the Documentation/timers/timers-howto.rst
> there is the question:
> "Is my code in an atomic context?"
> It's not just about the range, it's more of at which context this code
> runs, for atomic-context -> udelay must be used.
> for non-atomic context -> usleep-range is better for power-management.
>
> unless we are familiar with the driver we wouldn't really know in what
> context this code is run at.
>
> This thread though had the same conversation about this change, for the
> same driver.
> https://patchwork.kernel.org/patch/11137125/

While it's a good discussion it reminds me that this entire function,
i.e. reset(), repeats the on provided by fbtft core.
Yes, the only question if it's atomic or not. IIRC ->reset() is being
called only in non-atomic contexts and keeping reset signal longer is
fine (but better to check with datasheet).

So, I would rather to drop the function completely in order to use
fbtft's core one.

--
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
