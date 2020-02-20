Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DA1654E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 03:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F886E89E;
	Thu, 20 Feb 2020 02:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2E46E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 02:13:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 18:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="259123005"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2020 18:13:21 -0800
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 18:13:21 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 18:13:20 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.46]) with mapi id 14.03.0439.000;
 Thu, 20 Feb 2020 10:13:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Topic: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Index: AQHV4rTrI5AbOd4/PkCv4vZnvR6EuagZISQAgAAKbYCAAMs9AIAAtW4AgAejUqCAABeQAIAA+IVw
Date: Thu, 20 Feb 2020 02:13:18 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78EEA2@SHSMSX104.ccr.corp.intel.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D724@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7Qa6yzRxB10ufNxu+F5S3_GkwofKCm66aB9H4rdWj8fFQ@mail.gmail.com>
In-Reply-To: <CAPaKu7Qa6yzRxB10ufNxu+F5S3_GkwofKCm66aB9H4rdWj8fFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGQ5MWRhMzUtZWE1Yy00ZWQwLWE1ZTUtMTE0NzcyNGEyMjY1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNzVUQkhobFd5RUtkcDVoM0Job0syNUFCcjh6NG1FdXRpNitlT1RrK0hcLzl6XC9jXC9aYlloM2U2cng3WUZHUWVIMyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, ML
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Chia-I Wu <olvaffe@gmail.com>
> Sent: Thursday, February 20, 2020 3:18 AM
> 
> On Wed, Feb 19, 2020 at 2:00 AM Tian, Kevin <kevin.tian@intel.com> wrote:
> >
> > > From: Chia-I Wu
> > > Sent: Saturday, February 15, 2020 5:15 AM
> > >
> > > On Fri, Feb 14, 2020 at 2:26 AM Paolo Bonzini <pbonzini@redhat.com>
> wrote:
> > > >
> > > > On 13/02/20 23:18, Chia-I Wu wrote:
> > > > >
> > > > > The bug you mentioned was probably this one
> > > > >
> > > > >   https://bugzilla.kernel.org/show_bug.cgi?id=104091
> > > >
> > > > Yes, indeed.
> > > >
> > > > > From what I can tell, the commit allowed the guests to create cached
> > > > > mappings to MMIO regions and caused MCEs.  That is different than
> what
> > > > > I need, which is to allow guests to create uncached mappings to
> system
> > > > > ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has
> > > uncached
> > > > > mappings.  But it is true that this still allows the userspace & guest
> > > > > kernel to create conflicting memory types.
> > > >
> > > > Right, the question is whether the MCEs were tied to MMIO regions
> > > > specifically and if so why.
> > > >
> > > > An interesting remark is in the footnote of table 11-7 in the SDM.
> > > > There, for the MTRR (EPT for us) memory type UC you can read:
> > > >
> > > >   The UC attribute comes from the MTRRs and the processors are not
> > > >   required to snoop their caches since the data could never have
> > > >   been cached. This attribute is preferred for performance reasons.
> > > >
> > > > There are two possibilities:
> > > >
> > > > 1) the footnote doesn't apply to UC mode coming from EPT page tables.
> > > > That would make your change safe.
> > > >
> > > > 2) the footnote also applies when the UC attribute comes from the EPT
> > > > page tables rather than the MTRRs.  In that case, the host should use
> > > > UC as the EPT page attribute if and only if it's consistent with the host
> > > > MTRRs; it would be more or less impossible to honor UC in the guest
> > > MTRRs.
> > > > In that case, something like the patch below would be needed.
> > > >
> > > > It is not clear from the manual why the footnote would not apply to WC;
> > > that
> > > > is, the manual doesn't say explicitly that the processor does not do
> > > snooping
> > > > for accesses to WC memory.  But I guess that must be the case, which is
> > > why I
> > > > used MTRR_TYPE_WRCOMB in the patch below.
> > > >
> > > > Either way, we would have an explanation of why creating cached
> mapping
> > > to
> > > > MMIO regions would, and why in practice we're not seeing MCEs for
> guest
> > > RAM
> > > > (the guest would have set WB for that memory in its MTRRs, not UC).
> > > >
> > > > One thing you didn't say: how would userspace use KVM_MEM_DMA?
> On
> > > which
> > > > regions would it be set?
> > > It will be set for shmems that are mapped WC.
> > >
> > > GPU/DRM drivers allocate shmems as DMA-able gpu buffers and allow
> the
> > > userspace to map them cached or WC (I915_MMAP_WC or
> > > AMDGPU_GEM_CREATE_CPU_GTT_USWC for example).  When a shmem
> is
> > > mapped
> > > WC and is made available to the guest, we would like the ability to
> > > map the region WC in the guest.
> >
> > Curious... How is such slot exposed to the guest? A reserved memory
> > region? Is it static or might be dynamically added?
> The plan is for virtio-gpu device to reserve a huge memory region in
> the guest.  Memslots may be added dynamically or statically to back
> the region.

so the region is marked as E820_RESERVED to prevent guest kernel 
from using it for other purpose and then virtio-gpu device will report
virtio-gpu driver of the exact location of the region through its own
interface?

> 
> Dynamic: the host adds a 16MB GPU allocation as a memslot at a time.
> The guest kernel suballocates from the 16MB pool.
> 
> Static: the host creates a huge PROT_NONE memfd and adds it as a
> memslot.  GPU allocations are mremap()ed into the memfd region to
> provide the real mapping.
> 
> These options are considered because the number of memslots are
> limited: 32 on ARM and 509 on x86.  If the number of memslots could be
> made larger (4096 or more), we would also consider adding each
> individual GPU allocation as a memslot.
> 
> These are actually questions we need feedback.  Besides, GPU
> allocations can be assumed to be kernel dma-bufs in this context.  I
> wonder if it makes sense to have a variation of
> KVM_SET_USER_MEMORY_REGION that takes dma-bufs.

I feel it makes more sense.

Thanks
Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
