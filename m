Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5B5518C5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7710E095;
	Mon, 20 Jun 2022 12:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F98D10E11B;
 Mon, 20 Jun 2022 12:24:27 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id r3so18668587ybr.6;
 Mon, 20 Jun 2022 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5JxyhKk/uMc2fQhNdOt2zyaowNO+vOl5nRe37m7DAA=;
 b=PE6NpoyZLTwUcLsqzDbtJnrnxAIyaVdtaXAicCknBnBwh8ZdqPc+LdCbBV9G0aYWTp
 OH08dpop/cUwHHDAwRoOZn8NuJbm7em0mCvXsUn5KrkE2uLBzx4qEpmZlCmJ1JT+Dfo2
 L2g+1N68ykc71e7QB9eNTR6L/SfFYKD49pmyUm+IL+kgwtlzsAFOFxYmtVjO901MBCa0
 FXrtKRIwLIRyoFGhr+u6OUEnyG6aXt9C5BbkXb3gIq/00R90GPJyncy94IdAi1QYzzKR
 vgiDWLdFFfvrAAZFOdl0BFPX5q6CTFy21BUmyoGXj99JPg6vLckZ2H/SPEJs5BrMF/te
 qm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5JxyhKk/uMc2fQhNdOt2zyaowNO+vOl5nRe37m7DAA=;
 b=zHK+DpUsQEJ4DhD78rsZDwga3XpaxkXUWoJ8LBTG/1j6rsDIzKsmclV5y9QTBjY6IC
 xL2/tiE//4fXVqOHGlLhDcMhYO86BQeXZOyelmsP9vh78ZObMAyCtGjCB2vvz/YQ+XwJ
 vb8WViq/64EYgB3L7Nd8p9qQnJk0BVho98MaE+nxKhwaPyAa2a1egu/wqMctsR73mEhP
 WXBRHGQTwRnzwfdpnqxS1TSShY++7zXaEvKmUBfXo+FzzUxUYCg/0gWlPTMjpP9Rjd4z
 b78ssDAfJEEuxUP0p5f9bjqm93mczfupbv4g0NCli7jjEhTZWWU7k2IZo+KzHYQAuKpB
 N74w==
X-Gm-Message-State: AJIora/VyF6oLlk179Xq2U3kh+D4ovuw6SnbhzUYXi7llNrDpLnGAZ4k
 ZlZ+DWXx1XXie9Kt7h3VwncSViLO2Lrnkm13/G0=
X-Google-Smtp-Source: AGRyM1vMxS63SWLYtulgVh/kvFZnhALPPWNXYa9hXtgHK5dVSCko6xQfAiztdTyivXeoAx7i5Qb7kZtG3NdmkeicRKE=
X-Received: by 2002:a25:c08f:0:b0:668:fcfc:1b2a with SMTP id
 c137-20020a25c08f000000b00668fcfc1b2amr6724569ybf.242.1655727866015; Mon, 20
 Jun 2022 05:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
 <87bkuo898d.fsf@nvdebian.thelocal>
 <CAFCwf11Lru4rHJ93gkCTMqfsWZ8Hcug4z=_t7B=G07bo7zsaFw@mail.gmail.com>
 <877d5b90sp.fsf@nvdebian.thelocal>
In-Reply-To: <877d5b90sp.fsf@nvdebian.thelocal>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 20 Jun 2022 15:23:59 +0300
Message-ID: <CAFCwf11CCmx9xtNqGeALqmVn-1_eBOiqAXDSWczieNdL1QdazA@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
To: Alistair Popple <apopple@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>,
 rcampbell@nvidia.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Hildenbrand <david@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 11:50 AM Alistair Popple <apopple@nvidia.com> wrote:
>
>
> Oded Gabbay <oded.gabbay@gmail.com> writes:
>
> > On Mon, Jun 20, 2022 at 3:33 AM Alistair Popple <apopple@nvidia.com> wrote:
> >>
> >>
> >> Oded Gabbay <oded.gabbay@gmail.com> writes:
> >>
> >> > On Fri, Jun 17, 2022 at 8:20 PM Sierra Guiza, Alejandro (Alex)
> >> > <alex.sierra@amd.com> wrote:
> >> >>
> >> >>
> >> >> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
> >> >> > On 31.05.22 22:00, Alex Sierra wrote:
> >> >> >> Device memory that is cache coherent from device and CPU point of view.
> >> >> >> This is used on platforms that have an advanced system bus (like CAPI
> >> >> >> or CXL). Any page of a process can be migrated to such memory. However,
> >> >> >> no one should be allowed to pin such memory so that it can always be
> >> >> >> evicted.
> >> >> >>
> >> >> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >> >> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >> >> >> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> >> >> >> [hch: rebased ontop of the refcount changes,
> >> >> >>        removed is_dev_private_or_coherent_page]
> >> >> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >> >> >> ---
> >> >> >>   include/linux/memremap.h | 19 +++++++++++++++++++
> >> >> >>   mm/memcontrol.c          |  7 ++++---
> >> >> >>   mm/memory-failure.c      |  8 ++++++--
> >> >> >>   mm/memremap.c            | 10 ++++++++++
> >> >> >>   mm/migrate_device.c      | 16 +++++++---------
> >> >> >>   mm/rmap.c                |  5 +++--
> >> >> >>   6 files changed, 49 insertions(+), 16 deletions(-)
> >> >> >>
> >> >> >> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >> >> >> index 8af304f6b504..9f752ebed613 100644
> >> >> >> --- a/include/linux/memremap.h
> >> >> >> +++ b/include/linux/memremap.h
> >> >> >> @@ -41,6 +41,13 @@ struct vmem_altmap {
> >> >> >>    * A more complete discussion of unaddressable memory may be found in
> >> >> >>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
> >> >> >>    *
> >> >> >> + * MEMORY_DEVICE_COHERENT:
> >> >> >> + * Device memory that is cache coherent from device and CPU point of view. This
> >> >> >> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
> >> >> >> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
> >> >> >> + * type. Any page of a process can be migrated to such memory. However no one
> >> >> > Any page might not be right, I'm pretty sure. ... just thinking about special pages
> >> >> > like vdso, shared zeropage, ... pinned pages ...
> >> >>
> >> >> Hi David,
> >> >>
> >> >> Yes, I think you're right. This type does not cover all special pages.
> >> >> I need to correct that on the cover letter.
> >> >> Pinned pages are allowed as long as they're not long term pinned.
> >> >>
> >> >> Regards,
> >> >> Alex Sierra
> >> >
> >> > What if I want to hotplug this device's coherent memory, but I do
> >> > *not* want the OS
> >> > to migrate any page to it ?
> >> > I want to fully-control what resides on this memory, as I can consider
> >> > this memory
> >> > "expensive". i.e. I don't have a lot of it, I want to use it for
> >> > specific purposes and
> >> > I don't want the OS to start using it when there is some memory pressure in
> >> > the system.
> >>
> >> This is exactly what MEMORY_DEVICE_COHERENT is for. Device coherent
> >> pages are only allocated by a device driver and exposed to user-space by
> >> a driver migrating pages to them with migrate_vma. The OS can't just
> >> start using them due to memory pressure for example.
> >>
> >>  - Alistair
> > Thanks for the explanation.
> >
> > I guess the commit message confused me a bit, especially these two sentences:
> >
> > "Any page of a process can be migrated to such memory. However no one should be
> > allowed to pin such memory so that it can always be evicted."
> >
> > I read them as if the OS is free to choose which pages are migrated to
> > this memory,
> > and anything is eligible for migration to that memory (and that's why
> > we also don't
> > allow it to pin memory there).
> >
> > If we are not allowed to pin anything there, can the device driver
> > decide to disable
> > any option for oversubscription of this memory area ?
>
> I'm not sure I follow your thinking on how oversubscription would work
> here, however all allocations are controlled by the driver. So if a
> device's coherent memory is full a driver would be unable to migrate
> pages to that device until pages are freed by the OS due to being
> unmapped or the driver evicts pages by migrating them back to normal CPU
> memory.
>
> Pinning of pages is allowed, and could prevent such migrations. However
> this patch series prevents device coherent pages from being pinned
> longterm (ie. with FOLL_LONGTERM), so it should always be able to evict
> pages eventually.
>
> > Let's assume the user uses this memory area for doing p2p with other
> > CXL devices.
> > In that case, I wouldn't want the driver/OS to migrate pages in and
> > out of that memory...
>
> The OS will not migrate pages in or out (although it may free them if no
> longer required), but a driver might choose to. So at the moment it's
> really up to the driver to implement what you want in this regards.

I see.
In other words, we don't want to allow long-term pinning but
the driver can decide it doesn't want to evict pages out
of that memory, until they are freed.

Thanks,
Oded
>
> > So either I should let the user pin those pages, or prevent him from
> > doing (accidently or not)
> > oversubscription in this memory area.
>
> As noted above pages can be pinned, but not long-term.
>
>  - Alistair
>
> > wdyt ?
> >
> >>
> >> > Oded
> >> >
> >> >>
> >> >> >
> >> >> >> + * should be allowed to pin such memory so that it can always be evicted.
> >> >> >> + *
> >> >> >>    * MEMORY_DEVICE_FS_DAX:
> >> >> >>    * Host memory that has similar access semantics as System RAM i.e. DMA
> >> >> >>    * coherent and supports page pinning. In support of coordinating page
> >> >> >> @@ -61,6 +68,7 @@ struct vmem_altmap {
> >> >> >>   enum memory_type {
> >> >> >>      /* 0 is reserved to catch uninitialized type fields */
> >> >> >>      MEMORY_DEVICE_PRIVATE = 1,
> >> >> >> +    MEMORY_DEVICE_COHERENT,
> >> >> >>      MEMORY_DEVICE_FS_DAX,
> >> >> >>      MEMORY_DEVICE_GENERIC,
> >> >> >>      MEMORY_DEVICE_PCI_P2PDMA,
> >> >> >> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
> >> >> > In general, this LGTM, and it should be correct with PageAnonExclusive I think.
> >> >> >
> >> >> >
> >> >> > However, where exactly is pinning forbidden?
> >> >>
> >> >> Long-term pinning is forbidden since it would interfere with the device
> >> >> memory manager owning the
> >> >> device-coherent pages (e.g. evictions in TTM). However, normal pinning
> >> >> is allowed on this device type.
> >> >>
> >> >> Regards,
> >> >> Alex Sierra
> >> >>
> >> >> >
