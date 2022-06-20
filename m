Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B21551005
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 08:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0D91131B5;
	Mon, 20 Jun 2022 06:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E61131B8;
 Mon, 20 Jun 2022 06:02:10 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31780ad7535so63329487b3.8; 
 Sun, 19 Jun 2022 23:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xe3VeJwBL8Ebq+C8acPsdxpGtpDiQ/HFobU5cBrv3WU=;
 b=JGXEQN+I0XIHQ+X5Mcx0dO6wWlI7vTAu58RHk2tfY9oeE1RryAubJGzZLv3yuLijUw
 gydtnS0hDUSBpq9r3SsmFRmxKwivL+qEqqG4AeasEJPgKwGUW5ncwS8hDuaBe1by6iLC
 4shKZoFhI0TDayMYjRURjmXduC89qZioy71wZUHaVlgavAIG9rFEBATExIyE2a7s/Lc/
 gNmY5EcMGCyLhl0+wKhutdbW2QJ5Poc9OGfm3v+PoOows2woHUi1qoC2FO9C8S35db6d
 p9G1eS85wqQTc2cRC0ho7twEyZvjDUtmTk7i+PE8vZwGGFv/J/4SsrlLus365LDRYX6v
 rN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xe3VeJwBL8Ebq+C8acPsdxpGtpDiQ/HFobU5cBrv3WU=;
 b=FyqSiPCL3XmQs48qco4oaDnw8DRgpF8gQQfxnbwJPQ9ukoJLGvAqDMCIvsl0B7aDf5
 VGFgjIDTB3Sdu9lpFwGFswff1F1y5xMInpcoSIRKy0fXgBTbcMJoD9JAdsQY+8XrmdV+
 PP8vqyhc3foHHNB9QieeUrVlqopEmrmOB/hHwN1E1IOp15jyVtKuHM4EAP665P6fG105
 gr0+GLU/r0xsbcQHX8ajd+3v4B0PVDvzgAkOl9A955037XW+SdLs+SJfgK/cOYha55m3
 SfUz5F2WTRuhoWg+k1quNzq47o7e78XbDFiHwjp+HoJ7UY/LXlmofzgp3JyjDNcw29zI
 wBuw==
X-Gm-Message-State: AJIora8CabvXBQV9e7K+nv2SoGlfzNx/W1HDDsA/nsaWdmJCYrG7xegc
 8atm1Ad9Brj1ySTQi//Q/qfq8bF0eszJ+eqKNe8=
X-Google-Smtp-Source: AGRyM1tzeukUE0eoUNLmKpkTD0UfGuNi9OAgJD/BPDmnsr6lE4pkLipEhHJgaDKCB2nZwNfM9ZoCJ1FPCdi+Kl69/hM=
X-Received: by 2002:a0d:f8c6:0:b0:2fe:ca9c:f937 with SMTP id
 i189-20020a0df8c6000000b002feca9cf937mr25655114ywf.62.1655704929245; Sun, 19
 Jun 2022 23:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
 <87bkuo898d.fsf@nvdebian.thelocal>
In-Reply-To: <87bkuo898d.fsf@nvdebian.thelocal>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 20 Jun 2022 09:01:42 +0300
Message-ID: <CAFCwf11Lru4rHJ93gkCTMqfsWZ8Hcug4z=_t7B=G07bo7zsaFw@mail.gmail.com>
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

On Mon, Jun 20, 2022 at 3:33 AM Alistair Popple <apopple@nvidia.com> wrote:
>
>
> Oded Gabbay <oded.gabbay@gmail.com> writes:
>
> > On Fri, Jun 17, 2022 at 8:20 PM Sierra Guiza, Alejandro (Alex)
> > <alex.sierra@amd.com> wrote:
> >>
> >>
> >> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
> >> > On 31.05.22 22:00, Alex Sierra wrote:
> >> >> Device memory that is cache coherent from device and CPU point of view.
> >> >> This is used on platforms that have an advanced system bus (like CAPI
> >> >> or CXL). Any page of a process can be migrated to such memory. However,
> >> >> no one should be allowed to pin such memory so that it can always be
> >> >> evicted.
> >> >>
> >> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >> >> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> >> >> [hch: rebased ontop of the refcount changes,
> >> >>        removed is_dev_private_or_coherent_page]
> >> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >> >> ---
> >> >>   include/linux/memremap.h | 19 +++++++++++++++++++
> >> >>   mm/memcontrol.c          |  7 ++++---
> >> >>   mm/memory-failure.c      |  8 ++++++--
> >> >>   mm/memremap.c            | 10 ++++++++++
> >> >>   mm/migrate_device.c      | 16 +++++++---------
> >> >>   mm/rmap.c                |  5 +++--
> >> >>   6 files changed, 49 insertions(+), 16 deletions(-)
> >> >>
> >> >> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >> >> index 8af304f6b504..9f752ebed613 100644
> >> >> --- a/include/linux/memremap.h
> >> >> +++ b/include/linux/memremap.h
> >> >> @@ -41,6 +41,13 @@ struct vmem_altmap {
> >> >>    * A more complete discussion of unaddressable memory may be found in
> >> >>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
> >> >>    *
> >> >> + * MEMORY_DEVICE_COHERENT:
> >> >> + * Device memory that is cache coherent from device and CPU point of view. This
> >> >> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
> >> >> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
> >> >> + * type. Any page of a process can be migrated to such memory. However no one
> >> > Any page might not be right, I'm pretty sure. ... just thinking about special pages
> >> > like vdso, shared zeropage, ... pinned pages ...
> >>
> >> Hi David,
> >>
> >> Yes, I think you're right. This type does not cover all special pages.
> >> I need to correct that on the cover letter.
> >> Pinned pages are allowed as long as they're not long term pinned.
> >>
> >> Regards,
> >> Alex Sierra
> >
> > What if I want to hotplug this device's coherent memory, but I do
> > *not* want the OS
> > to migrate any page to it ?
> > I want to fully-control what resides on this memory, as I can consider
> > this memory
> > "expensive". i.e. I don't have a lot of it, I want to use it for
> > specific purposes and
> > I don't want the OS to start using it when there is some memory pressure in
> > the system.
>
> This is exactly what MEMORY_DEVICE_COHERENT is for. Device coherent
> pages are only allocated by a device driver and exposed to user-space by
> a driver migrating pages to them with migrate_vma. The OS can't just
> start using them due to memory pressure for example.
>
>  - Alistair
Thanks for the explanation.

I guess the commit message confused me a bit, especially these two sentences:

"Any page of a process can be migrated to such memory. However no one should be
allowed to pin such memory so that it can always be evicted."

I read them as if the OS is free to choose which pages are migrated to
this memory,
and anything is eligible for migration to that memory (and that's why
we also don't
allow it to pin memory there).

If we are not allowed to pin anything there, can the device driver
decide to disable
any option for oversubscription of this memory area ?

Let's assume the user uses this memory area for doing p2p with other
CXL devices.
In that case, I wouldn't want the driver/OS to migrate pages in and
out of that memory...

So either I should let the user pin those pages, or prevent him from
doing (accidently or not)
oversubscription in this memory area.

wdyt ?

>
> > Oded
> >
> >>
> >> >
> >> >> + * should be allowed to pin such memory so that it can always be evicted.
> >> >> + *
> >> >>    * MEMORY_DEVICE_FS_DAX:
> >> >>    * Host memory that has similar access semantics as System RAM i.e. DMA
> >> >>    * coherent and supports page pinning. In support of coordinating page
> >> >> @@ -61,6 +68,7 @@ struct vmem_altmap {
> >> >>   enum memory_type {
> >> >>      /* 0 is reserved to catch uninitialized type fields */
> >> >>      MEMORY_DEVICE_PRIVATE = 1,
> >> >> +    MEMORY_DEVICE_COHERENT,
> >> >>      MEMORY_DEVICE_FS_DAX,
> >> >>      MEMORY_DEVICE_GENERIC,
> >> >>      MEMORY_DEVICE_PCI_P2PDMA,
> >> >> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
> >> > In general, this LGTM, and it should be correct with PageAnonExclusive I think.
> >> >
> >> >
> >> > However, where exactly is pinning forbidden?
> >>
> >> Long-term pinning is forbidden since it would interfere with the device
> >> memory manager owning the
> >> device-coherent pages (e.g. evictions in TTM). However, normal pinning
> >> is allowed on this device type.
> >>
> >> Regards,
> >> Alex Sierra
> >>
> >> >
