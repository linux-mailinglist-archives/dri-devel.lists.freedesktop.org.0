Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587038ABA00
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 08:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B7C10FAF6;
	Sat, 20 Apr 2024 06:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0FsGL3L3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A010FAF6
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 06:36:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D973D602DC;
 Sat, 20 Apr 2024 06:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFCAC072AA;
 Sat, 20 Apr 2024 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713595001;
 bh=4ZTtTXI4g9M/agNAvTBYKN6n6HilBTuHVmnqwooqBfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0FsGL3L3LeROXc734pyxXG2RCzM8GIMTdZqalBjsuAwWZi6SJsD3JhFih9MygA9bE
 D67SPQ3KyoYcSoyKTfpl+yYe+OZe30YTkQTOP91tBSxltbxZq+xB6qjQGkTp4IOQwk
 Y7xQ2ue8J76g2LIpRiDBWca/BWuJfFcunV0dCSwo=
Date: Sat, 20 Apr 2024 08:36:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Pascal FONTAIN <Pascal.FONTAIN@bachmann.info>,
 linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 afd@ti.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/2] misc: sram: Add DMA-BUF Heap exporting of SRAM
 areas
Message-ID: <2024042043-joyride-parish-3d3b@gregkh>
References: <20240409120605.4138472-1-Pascal.FONTAIN@bachmann.info>
 <20240409120605.4138472-3-Pascal.FONTAIN@bachmann.info>
 <2024040944-flashcard-tribune-6a8e@gregkh>
 <CAH9NwWezn1A=n9_NqY_Lp9VzYwzAd0dAjQPD9wBB3_ragddZWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH9NwWezn1A=n9_NqY_Lp9VzYwzAd0dAjQPD9wBB3_ragddZWg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 19, 2024 at 06:57:47PM +0200, Christian Gmeiner wrote:
> Am Di., 9. Apr. 2024 um 14:14 Uhr schrieb Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>:
> >
> > On Tue, Apr 09, 2024 at 02:06:05PM +0200, Pascal FONTAIN wrote:
> > > From: Andrew Davis <afd@ti.com>
> > >
> > > This new export type exposes to userspace the SRAM area as a DMA-BUF
> > > Heap,
> > > this allows for allocations of DMA-BUFs that can be consumed by various
> > > DMA-BUF supporting devices.
> > >
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > Tested-by: Pascal Fontain <pascal.fontain@bachmann.info>
> >
> > When sending on a patch from someone else, you too must sign off on it
> > as per our documenation.  Please read it and understand what you are
> > agreeing to when you do that for a new version please.
> >
> > > ---
> > >  drivers/misc/Kconfig         |   7 +
> > >  drivers/misc/Makefile        |   1 +
> > >  drivers/misc/sram-dma-heap.c | 246 +++++++++++++++++++++++++++++++++++
> > >  drivers/misc/sram.c          |   6 +
> > >  drivers/misc/sram.h          |  16 +++
> > >  5 files changed, 276 insertions(+)
> > >  create mode 100644 drivers/misc/sram-dma-heap.c
> > >
> > > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > > index 9e4ad4d61f06..e6674e913168 100644
> > > --- a/drivers/misc/Kconfig
> > > +++ b/drivers/misc/Kconfig
> > > @@ -448,6 +448,13 @@ config SRAM
> > >  config SRAM_EXEC
> > >       bool
> > >
> > > +config SRAM_DMA_HEAP
> > > +     bool "Export on-chip SRAM pools using DMA-Heaps"
> > > +     depends on DMABUF_HEAPS && SRAM
> > > +     help
> > > +       This driver allows the export of on-chip SRAM marked as both pool
> > > +       and exportable to userspace using the DMA-Heaps interface.
> >
> > What will use this in userspace?
> >
> 
> I could imagine a way it might be used.

This implies it is not needed because no one actually has actually used
it for anything, so why make this change?

> Imagine a SoC like TI's AM64x series, where some cores (A53) run Linux
> and others (R5F) are managed by remoteproc to
> execute a RTOS. When it comes to efficiently exchanging large data
> sets, the conventional method involves using rpmsg,
> which has limitations due to message size and could potentially slow
> down data transfer. However, an alternative
> approach could be to allocate a sizable chunk of SRAM memory in
> userspace. By utilizing memcpy() to copy data into
> this memory, followed by a single rpmsg signal to notify the RTOS that
> the data is ready, we can leverage the faster access
> speed of SRAM compared to DDR from the remoteproc.

Why is virtio not used instead?

thanks,

greg k-h
