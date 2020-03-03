Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19F176F57
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 07:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273CF6E07F;
	Tue,  3 Mar 2020 06:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7F46E07F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 06:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583216685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0uDbQSrL5bY0m8ESxsGOghE60Coq5rSinBwFrYLBRO8=;
 b=bzMmFJk2+8M6f8kNRzz4LrCt22eKSKpUvDPvobtt5v7rEDHLQICLkSYCnZ5ABnHdl47HsQ
 pu4Tv4wIR8/QZqJKqvQJFNUl+cgBB+52QWUqV37fKlp9qAweGouUTHV4ppXHZqvWSFm7sD
 YBXgpqFTJOq0iXZg2PFWDr4BGz2vh7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-2eioPBa8MCibtDp9ku-Nuw-1; Tue, 03 Mar 2020 01:24:40 -0500
X-MC-Unique: 2eioPBa8MCibtDp9ku-Nuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514041005510;
 Tue,  3 Mar 2020 06:24:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 632E360C05;
 Tue,  3 Mar 2020 06:24:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4BCC17535; Tue,  3 Mar 2020 07:24:37 +0100 (CET)
Date: Tue, 3 Mar 2020 07:24:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
Message-ID: <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
 <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 02:14:02PM -0800, Alistair Francis wrote:
> On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > > The QEMU model for the Bochs display has no VGA memory section at offset
> > > 0x400 [1]. By writing to this register Linux can create a write to
> > > unassigned memory which depending on machine and architecture can result
> > > in a store fault.
> > >
> > > I don't see any reference to this address at OSDev [2] or in the Bochs
> > > source code.
> > >
> > > Removing this write still allows graphics to work inside QEMU with
> > > the bochs-display.
> >
> > It's not that simple.  The driver also handles the qemu stdvga (-device
> > VGA, -device secondary-vga) which *does* need the vga port write.
> > There is no way for the guest to figure whenever the device is
> > secondary-vga or bochs-display.
> >
> > So how about fixing things on the host side?  Does qemu patch below
> > help?
> 
> That patch looks like it will fix the problem, but it doesn't seem
> like the correct fix. I would rather avoid adding a large chunk of
> dummy I/O to handle the two devices.

It's just a single handler for the parent mmio region, so we have a
defined default action instead of undefined behavior.

Patch just posted to qemu-devel, lets see what others think ...

> > Maybe another possible approach is to enable/disable vga access per
> > arch.  On x86 this doesn't cause any problems.  I guess you are on
> > risc-v?
> 
> I would prefer this option. I do see this on RISC-V, but I suspect the
> issue will appear on other architectures (although how they handle I/O
> failures in QEMU is a different story).
> 
> Can I just do the VGA write if x86?

I know ppc needs it too.  Not sure about other architectures.  I'd
suggest to do it the other way around: blacklist known-problematic
archs.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
