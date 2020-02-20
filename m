Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810C165524
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 03:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78496ECD0;
	Thu, 20 Feb 2020 02:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2426ECD0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 02:38:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 18:38:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,462,1574150400"; d="scan'208";a="269414196"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2020 18:38:07 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Feb 2020 18:38:06 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.158]) with mapi id 14.03.0439.000;
 Thu, 20 Feb 2020 10:38:04 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Topic: [RFC PATCH 0/3] KVM: x86: honor guest memory type
Thread-Index: AQHV4rTrI5AbOd4/PkCv4vZnvR6EuagZISQAgAAKbYCAAMs9AIAAnj+AgAAgCACAAAK0AIAAAeyAgAXrxoCAAaZGgIAAIIsAgADkwxCAABT4UA==
Date: Thu, 20 Feb 2020 02:38:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78EF58@SHSMSX104.ccr.corp.intel.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
 <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
 <20200214220341.GJ20690@linux.intel.com>
 <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGI4Yzk2N2ItZDY1OS00Mjk1LThmNmItZmE0NzY3YzE4ZjdjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT2huajlkdHd6eUd4UmFzbm5BTmZiQVwvNjBBR0VkY1dpQW1WNmpaNGlwQ2h4aFVUYzRibjBQRGhGS0ZYNEJvcEcifQ==
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, kvm
 list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Tian, Kevin
> Sent: Thursday, February 20, 2020 10:05 AM
> 
> > From: Chia-I Wu <olvaffe@gmail.com>
> > Sent: Thursday, February 20, 2020 3:37 AM
> >
> > On Wed, Feb 19, 2020 at 1:52 AM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Paolo Bonzini
> > > > Sent: Wednesday, February 19, 2020 12:29 AM
> > > >
> > > > On 14/02/20 23:03, Sean Christopherson wrote:
> > > > >> On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu <olvaffe@gmail.com>
> wrote:
> > > > >>> AFAICT, it is currently allowed on ARM (verified) and AMD (not
> > > > >>> verified, but svm_get_mt_mask returns 0 which supposedly means
> > the
> > > > NPT
> > > > >>> does not restrict what the guest PAT can do).  This diff would do the
> > > > >>> trick for Intel without needing any uapi change:
> > > > >> I would be concerned about Intel CPU errata such as SKX40 and
> SKX59.
> > > > > The part KVM cares about, #MC, is already addressed by forcing UC
> for
> > > > MMIO.
> > > > > The data corruption issue is on the guest kernel to correctly use WC
> > > > > and/or non-temporal writes.
> > > >
> > > > What about coherency across live migration?  The userspace process
> > would
> > > > use cached accesses, and also a WBINVD could potentially corrupt guest
> > > > memory.
> > > >
> > >
> > > In such case the userspace process possibly should conservatively use
> > > UC mapping, as if for MMIO regions on a passthrough device. However
> > > there remains a problem. the definition of KVM_MEM_DMA implies
> > > favoring guest setting, which could be whatever type in concept. Then
> > > assuming UC is also problematic. I'm not sure whether inventing another
> > > interface to query effective memory type from KVM is a good idea. There
> > > is no guarantee that the guest will use same type for every page in the
> > > same slot, then such interface might be messy. Alternatively, maybe
> > > we could just have an interface for KVM userspace to force memory type
> > > for a given slot, if it is mainly used in para-virtualized scenarios (e.g.
> > > virtio-gpu) where the guest is enlightened to use a forced type (e.g. WC)?
> > KVM forcing the memory type for a given slot should work too.  But the
> > ignore-guest-pat bit seems to be Intel-specific.  We will need to
> > define how the second-level page attributes combine with the guest
> > page attributes somehow.
> 
> oh, I'm not aware of that difference. without an ipat-equivalent
> capability, I'm not sure how to forcing random type here. If you look at
> table 11-7 in Intel SDM, none of MTRR (EPT) memory type can lead to
> consistent effective type when combining with random PAT value. So
>  it is definitely a dead end.
> 
> >
> > KVM should in theory be able to tell that the userspace region is
> > mapped with a certain memory type and can force the same memory type
> > onto the guest.  The userspace does not need to be involved.  But that
> > sounds very slow?  This may be a dumb question, but would it help to
> > add KVM_SET_DMA_BUF and let KVM negotiate the memory type with the
> > in-kernel GPU drivers?
> >
> >
> 
> KVM_SET_DMA_BUF looks more reasonable. But I guess we don't need
> KVM to be aware of such negotiation. We can continue your original
> proposal to have KVM simply favor guest memory type (maybe still call
> KVM_MEM_DMA). On the other hand, Qemu should just mmap on the
> fd handle of the dmabuf passed from the virtio-gpu device backend,  e.g.
> to conduct migration. That way the mmap request is finally served by
> DRM and underlying GPU drivers, with proper type enforced automatically.
> 

Thinking more possibly we don't need introduce new interface to KVM.
As long as Qemu uses dmabuf interface to mmap the specific region,
KVM can simply check memory type in host page table given hva of a 
memslot. If the type is UC or WC, it implies that userspace wants a 
non-coherent mapping which should be reflected in the guest side too.
In such case, KVM can go to non-cohenrent DMA path and favor guest 
memory type automatically. 

Thanks
Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
