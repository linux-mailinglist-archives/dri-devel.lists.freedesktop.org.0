Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E324201C09
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E99B6E9CC;
	Fri, 19 Jun 2020 20:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1546C6E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592597421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNFVnCF0ZnPwrKnet21C7zXJrmj/IcMRNriOPX8epSE=;
 b=bLS4t+v7SbR3GyaP5sY2hccDWY9Q6T3ObDQNOnJPQo2WhnA4Tw6+RM5k+h3OPi0n+zeDel
 8ufLh9p2lDRjxT2dYqCCOMxn+whiQXy4tXeconVrfAyDIlwC4cuz6UIRu9ztpvQDTVCsdQ
 FkHlwsuY1OwwrflDMfWVEi4qWVKeMgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-OXocr5PeP2CcqCjY-9Fygw-1; Fri, 19 Jun 2020 16:10:17 -0400
X-MC-Unique: OXocr5PeP2CcqCjY-9Fygw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E831005512;
 Fri, 19 Jun 2020 20:10:14 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.rdu2.redhat.com [10.10.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6849210013D7;
 Fri, 19 Jun 2020 20:10:13 +0000 (UTC)
Date: Fri, 19 Jun 2020 16:10:11 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619201011.GB13117@redhat.com>
References: <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619181849.GR6578@ziepe.ca>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Fri, Jun 19, 2020 at 03:18:49PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 02:09:35PM -0400, Jerome Glisse wrote:
> > On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> > > On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> > > =

> > > > The madness is only that device B's mmu notifier might need to wait
> > > > for fence_B so that the dma operation finishes. Which in turn has to
> > > > wait for device A to finish first.
> > > =

> > > So, it sound, fundamentally you've got this graph of operations across
> > > an unknown set of drivers and the kernel cannot insert itself in
> > > dma_fence hand offs to re-validate any of the buffers involved?
> > > Buffers which by definition cannot be touched by the hardware yet.
> > > =

> > > That really is a pretty horrible place to end up..
> > > =

> > > Pinning really is right answer for this kind of work flow. I think
> > > converting pinning to notifers should not be done unless notifier
> > > invalidation is relatively bounded. =

> > > =

> > > I know people like notifiers because they give a bit nicer performance
> > > in some happy cases, but this cripples all the bad cases..
> > > =

> > > If pinning doesn't work for some reason maybe we should address that?
> > =

> > Note that the dma fence is only true for user ptr buffer which predate
> > any HMM work and thus were using mmu notifier already. You need the
> > mmu notifier there because of fork and other corner cases.
> =

> I wonder if we should try to fix the fork case more directly - RDMA
> has this same problem and added MADV_DONTFORK a long time ago as a
> hacky way to deal with it.
>
> Some crazy page pin that resolved COW in a way that always kept the
> physical memory with the mm that initiated the pin?

Just no way to deal with it easily, i thought about forcing the
anon_vma (page->mapping for anonymous page) to the anon_vma that
belongs to the vma against which the GUP was done but it would
break things if page is already in other branch of a fork tree.
Also this forbid fast GUP.

Quite frankly the fork was not the main motivating factor. GPU
can pin potentialy GBytes of memory thus we wanted to be able
to release it but since Michal changes to reclaim code this is
no longer effective.

User buffer should never end up in those weird corner case, iirc
the first usage was for xorg exa texture upload, then generalize
to texture upload in mesa and latter on to more upload cases
(vertices, ...). At least this is what i remember today. So in
those cases we do not expect fork, splice, mremap, mprotect, ...

Maybe we can audit how user ptr buffer are use today and see if
we can define a usage pattern that would allow to cut corner in
kernel. For instance we could use mmu notifier just to block CPU
pte update while we do GUP and thus never wait on dma fence.

Then GPU driver just keep the GUP pin around until they are done
with the page. They can also use the mmu notifier to keep a flag
so that the driver know if it needs to redo a GUP ie:

The notifier path:
   GPU_mmu_notifier_start_callback(range)
        gpu_lock_cpu_pagetable(range)
        for_each_bo_in(bo, range) {
            bo->need_gup =3D true;
        }
        gpu_unlock_cpu_pagetable(range)

   GPU_validate_buffer_pages(bo)
        if (!bo->need_gup)
            return;
        put_pages(bo->pages);
        range =3D bo_vaddr_range(bo)
        gpu_lock_cpu_pagetable(range)
        GUP(bo->pages, range)
        gpu_unlock_cpu_pagetable(range)


Depending on how user_ptr are use today this could work.


> (isn't this broken for O_DIRECT as well anyhow?)

Yes it can in theory, if you have an application that does O_DIRECT
and fork concurrently (ie O_DIRECT in one thread and fork in another).
Note that O_DIRECT after fork is fine, it is an issue only if GUP_fast
was able to lookup a page with write permission before fork had the
chance to update it to read only for COW.

But doing O_DIRECT (or anything that use GUP fast) in one thread and
fork in another is inherently broken ie there is no way to fix it.

See 17839856fd588f4ab6b789f482ed3ffd7c403e1f

> =

> How does mmu_notifiers help the fork case anyhow? Block fork from
> progressing?

It enforce ordering between fork and GUP, if fork is first it blocks
GUP and if forks is last then fork waits on GUP and then user buffer
get invalidated.

> =

> > I probably need to warn AMD folks again that using HMM means that you
> > must be able to update the GPU page table asynchronously without
> > fence wait.
> =

> It is kind of unrelated to HMM, it just shouldn't be using mmu
> notifiers to replace page pinning..

Well my POV is that if you abide by rules HMM defined then you do
not need to pin pages. The rule is asynchronous device page table
update.

Pinning pages is problematic it blocks many core mm features and
it is just bad all around. Also it is inherently broken in front
of fork/mremap/splice/...

Cheers,
J=E9r=F4me

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
