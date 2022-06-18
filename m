Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB15503A9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 11:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180610E028;
	Sat, 18 Jun 2022 09:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F7310E028;
 Sat, 18 Jun 2022 09:33:10 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3176b6ed923so61223077b3.11; 
 Sat, 18 Jun 2022 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0T2DhVRfdza3u7Hv/gMF8uaCaWYLQxsRMrZYAVQe+E=;
 b=hhOwVI2grUzcFZ0ZVRIzkXvpwrmX74i616R9TXr/QGGLafVdd6PqZPYq8cCpnbAguu
 eobuXZNnjB/K9lF43LKAw5hwh39dVDNxoRIQslaCf2rNMQrrZZpirfugII2o4q9yOtZl
 qmhJeIOfC58MR4YJg10Ph1hBVP9XOCirm4VEGWG+Bf4A/p7flbedOymFWXD8O7Gordti
 c+XD/cLUBMrsaadj8++He3td3LVG+hgJ0zQ/LSEo8aYftTQPolWNol3hNhe7db6lAMpA
 JDd8nfrVBcZ8VElsTPoFEclc4ta4nwZq4jL8bnfaUa4nuktELN+GCS6+9UA8RuMQ63dy
 Sa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0T2DhVRfdza3u7Hv/gMF8uaCaWYLQxsRMrZYAVQe+E=;
 b=YOq9xEgdquTulOdWPhPdfQ2/EAwiydAthGbUa+F62gR6Cjh8oRsldYlkZBLeOMBW/q
 J1LE4LCA3YGRtHacvhamQ1/sZ8xaK8XtcKsg4rbfuWw7jGkVXFSj2MDLUqQVZbDf9Czs
 eV5n/oTzOEYlVksdpfxXVDxFcdjNbPxIf7w9ngxxETHycV6BTvpEIEFAQcgkXB2XXvY9
 CvjLLprgRShm68X+4Ky8fvRHZsdMg1XZ1oW+RySNAYmUrfQ7EY2AIya5Kb94E9j6yM05
 qOSNFljShgrEDf5+Z4ORn8Z/mt2lgzurdY4sJlOLXIF7kRg8Sd7MzCCwIZcwDih53ZiM
 HBJA==
X-Gm-Message-State: AJIora+E3Od+f1zTQUedb+rNjzmjdnFAtfGrTOXtHBjq1rNL/+8XFJb/
 n96eiik4s+PqgenoSNgryW+ckqQK3vues7d16ok=
X-Google-Smtp-Source: AGRyM1vn2cH6zGfArfaosFc+y9vfluuDeE8YyIEY6QF6n7KxHF4JLzJuPADGF0ikBubxdlhb5eiyviROp85UPabBXiQ=
X-Received: by 2002:a81:7c42:0:b0:317:7789:85aa with SMTP id
 x63-20020a817c42000000b00317778985aamr12095755ywc.93.1655544789470; Sat, 18
 Jun 2022 02:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
In-Reply-To: <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sat, 18 Jun 2022 12:32:42 +0300
Message-ID: <CAFCwf11z5Q+2FPS1yPi6EwQuRqoJg_dLB-rYgtVwP-zQEdqjQQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
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
Cc: rcampbell@nvidia.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Hildenbrand <david@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, apopple@nvidia.com,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 8:20 PM Sierra Guiza, Alejandro (Alex)
<alex.sierra@amd.com> wrote:
>
>
> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
> > On 31.05.22 22:00, Alex Sierra wrote:
> >> Device memory that is cache coherent from device and CPU point of view.
> >> This is used on platforms that have an advanced system bus (like CAPI
> >> or CXL). Any page of a process can be migrated to such memory. However,
> >> no one should be allowed to pin such memory so that it can always be
> >> evicted.
> >>
> >> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> >> [hch: rebased ontop of the refcount changes,
> >>        removed is_dev_private_or_coherent_page]
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >> ---
> >>   include/linux/memremap.h | 19 +++++++++++++++++++
> >>   mm/memcontrol.c          |  7 ++++---
> >>   mm/memory-failure.c      |  8 ++++++--
> >>   mm/memremap.c            | 10 ++++++++++
> >>   mm/migrate_device.c      | 16 +++++++---------
> >>   mm/rmap.c                |  5 +++--
> >>   6 files changed, 49 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >> index 8af304f6b504..9f752ebed613 100644
> >> --- a/include/linux/memremap.h
> >> +++ b/include/linux/memremap.h
> >> @@ -41,6 +41,13 @@ struct vmem_altmap {
> >>    * A more complete discussion of unaddressable memory may be found in
> >>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
> >>    *
> >> + * MEMORY_DEVICE_COHERENT:
> >> + * Device memory that is cache coherent from device and CPU point of view. This
> >> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
> >> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
> >> + * type. Any page of a process can be migrated to such memory. However no one
> > Any page might not be right, I'm pretty sure. ... just thinking about special pages
> > like vdso, shared zeropage, ... pinned pages ...
>
> Hi David,
>
> Yes, I think you're right. This type does not cover all special pages.
> I need to correct that on the cover letter.
> Pinned pages are allowed as long as they're not long term pinned.
>
> Regards,
> Alex Sierra

What if I want to hotplug this device's coherent memory, but I do
*not* want the OS
to migrate any page to it ?
I want to fully-control what resides on this memory, as I can consider
this memory
"expensive". i.e. I don't have a lot of it, I want to use it for
specific purposes and
I don't want the OS to start using it when there is some memory pressure in
the system.

Oded

>
> >
> >> + * should be allowed to pin such memory so that it can always be evicted.
> >> + *
> >>    * MEMORY_DEVICE_FS_DAX:
> >>    * Host memory that has similar access semantics as System RAM i.e. DMA
> >>    * coherent and supports page pinning. In support of coordinating page
> >> @@ -61,6 +68,7 @@ struct vmem_altmap {
> >>   enum memory_type {
> >>      /* 0 is reserved to catch uninitialized type fields */
> >>      MEMORY_DEVICE_PRIVATE = 1,
> >> +    MEMORY_DEVICE_COHERENT,
> >>      MEMORY_DEVICE_FS_DAX,
> >>      MEMORY_DEVICE_GENERIC,
> >>      MEMORY_DEVICE_PCI_P2PDMA,
> >> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
> > In general, this LGTM, and it should be correct with PageAnonExclusive I think.
> >
> >
> > However, where exactly is pinning forbidden?
>
> Long-term pinning is forbidden since it would interfere with the device
> memory manager owning the
> device-coherent pages (e.g. evictions in TTM). However, normal pinning
> is allowed on this device type.
>
> Regards,
> Alex Sierra
>
> >
