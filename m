Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD416411A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D296E55E;
	Wed, 19 Feb 2020 10:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8656E55E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:00:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 02:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,459,1574150400"; d="scan'208";a="283068554"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2020 02:00:58 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 02:00:57 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 02:00:57 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.158]) with mapi id 14.03.0439.000;
 Wed, 19 Feb 2020 18:00:55 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Topic: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Index: AQHV4rTrI5AbOd4/PkCv4vZnvR6EuagZISQAgAAKbYCAAMs9AIAAtW4AgAejUqA=
Date: Wed, 19 Feb 2020 10:00:54 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78D724@SHSMSX104.ccr.corp.intel.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
In-Reply-To: <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjdlMmMwYzAtMDE2Yi00MjMzLWJmMDgtNzM3MTQ2NTRhNmE3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZmI0YklaRVZUdFdFa3AzOHdMcjE2RlVZRWtFQ1VLcGlhWTA0a2hScDBtTVwvUE9adDlGZEU5d1ZZVllobEF4a2oifQ==
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
 "joro@8bytes.org" <joro@8bytes.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>, Gerd
 Hoffmann <kraxel@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Chia-I Wu
> Sent: Saturday, February 15, 2020 5:15 AM
> 
> On Fri, Feb 14, 2020 at 2:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 13/02/20 23:18, Chia-I Wu wrote:
> > >
> > > The bug you mentioned was probably this one
> > >
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=104091
> >
> > Yes, indeed.
> >
> > > From what I can tell, the commit allowed the guests to create cached
> > > mappings to MMIO regions and caused MCEs.  That is different than what
> > > I need, which is to allow guests to create uncached mappings to system
> > > ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has
> uncached
> > > mappings.  But it is true that this still allows the userspace & guest
> > > kernel to create conflicting memory types.
> >
> > Right, the question is whether the MCEs were tied to MMIO regions
> > specifically and if so why.
> >
> > An interesting remark is in the footnote of table 11-7 in the SDM.
> > There, for the MTRR (EPT for us) memory type UC you can read:
> >
> >   The UC attribute comes from the MTRRs and the processors are not
> >   required to snoop their caches since the data could never have
> >   been cached. This attribute is preferred for performance reasons.
> >
> > There are two possibilities:
> >
> > 1) the footnote doesn't apply to UC mode coming from EPT page tables.
> > That would make your change safe.
> >
> > 2) the footnote also applies when the UC attribute comes from the EPT
> > page tables rather than the MTRRs.  In that case, the host should use
> > UC as the EPT page attribute if and only if it's consistent with the host
> > MTRRs; it would be more or less impossible to honor UC in the guest
> MTRRs.
> > In that case, something like the patch below would be needed.
> >
> > It is not clear from the manual why the footnote would not apply to WC;
> that
> > is, the manual doesn't say explicitly that the processor does not do
> snooping
> > for accesses to WC memory.  But I guess that must be the case, which is
> why I
> > used MTRR_TYPE_WRCOMB in the patch below.
> >
> > Either way, we would have an explanation of why creating cached mapping
> to
> > MMIO regions would, and why in practice we're not seeing MCEs for guest
> RAM
> > (the guest would have set WB for that memory in its MTRRs, not UC).
> >
> > One thing you didn't say: how would userspace use KVM_MEM_DMA?  On
> which
> > regions would it be set?
> It will be set for shmems that are mapped WC.
> 
> GPU/DRM drivers allocate shmems as DMA-able gpu buffers and allow the
> userspace to map them cached or WC (I915_MMAP_WC or
> AMDGPU_GEM_CREATE_CPU_GTT_USWC for example).  When a shmem is
> mapped
> WC and is made available to the guest, we would like the ability to
> map the region WC in the guest.

Curious... How is such slot exposed to the guest? A reserved memory
region? Is it static or might be dynamically added?

Thanks
Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
