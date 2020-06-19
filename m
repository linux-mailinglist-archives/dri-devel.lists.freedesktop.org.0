Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D47201A00
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 20:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260BD6E42B;
	Fri, 19 Jun 2020 18:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF126E197
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592590185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khXjE23/qfT8jkgymY8FGHl3y1nZCObamf5x1h4Z6l4=;
 b=cGDZ1mh6E0dV9NnlDmA90K60bizj4etVppSuTfTXVfWCBgaLwESSUV6/89CODtCTzgIMuM
 25YyfrhYSvAYYSt96IHtbgcXyIr0FFaZYAJ5Q/d70HBrE/Kegjq4lAPSV2h+gjfSz/R0JX
 BApBYiad+R9r/xa0RQNz60J9Ewr638E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-NaeDjSMGMDa8QaLfGotVwQ-1; Fri, 19 Jun 2020 14:09:41 -0400
X-MC-Unique: NaeDjSMGMDa8QaLfGotVwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46A1D464;
 Fri, 19 Jun 2020 18:09:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.rdu2.redhat.com [10.10.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD907C1E8;
 Fri, 19 Jun 2020 18:09:37 +0000 (UTC)
Date: Fri, 19 Jun 2020 14:09:35 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619180935.GA10009@redhat.com>
References: <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca>
 <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619172308.GQ6578@ziepe.ca>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> =

> > The madness is only that device B's mmu notifier might need to wait
> > for fence_B so that the dma operation finishes. Which in turn has to
> > wait for device A to finish first.
> =

> So, it sound, fundamentally you've got this graph of operations across
> an unknown set of drivers and the kernel cannot insert itself in
> dma_fence hand offs to re-validate any of the buffers involved?
> Buffers which by definition cannot be touched by the hardware yet.
> =

> That really is a pretty horrible place to end up..
> =

> Pinning really is right answer for this kind of work flow. I think
> converting pinning to notifers should not be done unless notifier
> invalidation is relatively bounded. =

> =

> I know people like notifiers because they give a bit nicer performance
> in some happy cases, but this cripples all the bad cases..
> =

> If pinning doesn't work for some reason maybe we should address that?

Note that the dma fence is only true for user ptr buffer which predate
any HMM work and thus were using mmu notifier already. You need the
mmu notifier there because of fork and other corner cases.

For nouveau the notifier do not need to wait for anything it can update
the GPU page table right away. Modulo needing to write to GPU memory
using dma engine if the GPU page table is in GPU memory that is not
accessible from the CPU but that's never the case for nouveau so far
(but i expect it will be at one point).


So i see this as 2 different cases, the user ptr case, which does pin
pages by the way, where things are synchronous. Versus the HMM cases
where everything is asynchronous.


I probably need to warn AMD folks again that using HMM means that you
must be able to update the GPU page table asynchronously without
fence wait. The issue for AMD is that they already update their GPU
page table using DMA engine. I believe this is still doable if they
use a kernel only DMA engine context, where only kernel can queue up
jobs so that you do not need to wait for unrelated things and you can
prioritize GPU page table update which should translate in fast GPU
page table update without DMA fence.


> > Full disclosure: We are aware that we've designed ourselves into an
> > impressive corner here, and there's lots of talks going on about
> > untangling the dma synchronization from the memory management
> > completely. But
> =

> I think the documenting is really important: only GPU should be using
> this stuff and driving notifiers this way. Complete NO for any
> totally-not-a-GPU things in drivers/accel for sure.

Yes for user that expect HMM they need to be asynchronous. But it is
hard to revert user ptr has it was done a long time ago.

Cheers,
J=E9r=F4me

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
