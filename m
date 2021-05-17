Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DC38269A
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FAF6E8E8;
	Mon, 17 May 2021 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FB96E8E8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:17:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 787E960C3D;
 Mon, 17 May 2021 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621239459;
 bh=BZxAEIkbSW7MbE/cKpN6ELnrkkO5GDgcmYWBCq1E9oE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xe+a+SfspvvC4YFLbvfFGou5Jh4ZaOJhNkVXbtGzQzDaw9YtnD2k5/AYJRH37GLz1
 HarCPEyiCvtPLqqvURKmUeKluy77qdfGcIrJi/isWCrMZQ6A5QP/7rtzd2dmdK2J0A
 3SHQ8E4iKKDOiX1B7oZK1lgB1PjMHYvnVe3bZMP0=
Date: Mon, 17 May 2021 10:17:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] treewide: Remove leading spaces in Kconfig files
Message-ID: <YKImotylLR7D4mQW@kroah.com>
References: <20210516132209.59229-1-juergh@canonical.com>
 <YKIDJIfuufBrTQ4f@kroah.com>
 <CAB2i3ZgszsUVDuK2fkUXtD72tPSgrycnDawM4VAuGGPJiA9+cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB2i3ZgszsUVDuK2fkUXtD72tPSgrycnDawM4VAuGGPJiA9+cA@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, mst@redhat.com, tony@atomide.com,
 jasowang@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, zbr@ioremap.net,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, aaro.koskinen@iki.fi,
 Juerg Haefliger <juergh@canonical.com>, kadlec@netfilter.org,
 lvs-devel@vger.kernel.org, ja@ssi.bg, coreteam@netfilter.org, kuba@kernel.org,
 pablo@netfilter.org, jejb@linux.ibm.com, horms@verge.net.au,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 fw@strlen.de, LKML <linux-kernel@vger.kernel.org>, linux@prisktech.co.nz,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 David Miller <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:07:43AM +0200, Juerg Haefliger wrote:
> On Mon, May 17, 2021 at 7:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, May 16, 2021 at 03:22:09PM +0200, Juerg Haefliger wrote:
> > > There are a few occurences of leading spaces before tabs in a couple of
> > > Kconfig files. Remove them by running the following command:
> > >
> > >   $ find . -name 'Kconfig*' | xargs sed -r -i 's/^[ ]+\t/\t/'
> > >
> > > Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> > > ---
> > >  arch/arm/mach-omap1/Kconfig     | 12 ++++++------
> > >  arch/arm/mach-vt8500/Kconfig    |  6 +++---
> > >  arch/arm/mm/Kconfig             | 10 +++++-----
> > >  drivers/char/hw_random/Kconfig  |  8 ++++----
> > >  drivers/net/usb/Kconfig         | 10 +++++-----
> > >  drivers/net/wan/Kconfig         |  4 ++--
> > >  drivers/scsi/Kconfig            |  2 +-
> > >  drivers/uio/Kconfig             |  2 +-
> > >  drivers/video/backlight/Kconfig | 10 +++++-----
> > >  drivers/virtio/Kconfig          |  2 +-
> > >  drivers/w1/masters/Kconfig      |  6 +++---
> > >  fs/proc/Kconfig                 |  4 ++--
> > >  init/Kconfig                    |  2 +-
> > >  net/netfilter/Kconfig           |  2 +-
> > >  net/netfilter/ipvs/Kconfig      |  2 +-
> > >  15 files changed, 41 insertions(+), 41 deletions(-)
> >
> > Please break this up into one patch per subsystem and resend to the
> > proper maintainers that way.
> 
> Hmm... How is my patch different from other treewide Kconfig cleanup
> patches like:
> a7f7f6248d97 ("treewide: replace '---help---' in Kconfig files with 'help'")
> 8636a1f9677d ("treewide: surround Kconfig file paths with double quotes")
> 83fc61a563cb ("treewide: Fix typos in Kconfig")
> 769a12a9c760 ("treewide: Kconfig: fix wording / spelling")
> f54619f28fb6 ("treewide: Fix typos in Kconfig")

Ok, I'll just ignore this and not try to suggest a way for you to get
your change accepted...

greg k-h
