Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6E81AC86
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 03:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633010E046;
	Thu, 21 Dec 2023 02:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7FF10E046
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 02:12:58 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dbdad99096fso462935276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 18:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703124777; x=1703729577;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qZL4eZ6u9CkNNM8zLim6V4IndhkBqKjZUwKwl+b+dig=;
 b=YKZIsfSMK/szQh81wLM0I9aoRzJewElkb/4rYBrOsK3/jeGNDjvauHgZY+bGbAguG3
 1uf34cCXAR/fCw5lgW7ERoZ/bqzYuTiscdHgehDOyfNZXLz/aY4VaW+8zuKWAVO44fBk
 nly4NmabpnHa8sBaWoD+GV1R8MwIAEFhBnKd38C++ZSb7fiz46dzVcMDQSI5/cYnzaoi
 2qjNdMgD0G9fdxn7e7FaCik9iFK49KqDHshWhTc962RnMeflgELZgXYANDpeRkVRUxwy
 s22mG08QI6iLThtfunASM7GmGHqeGWn1nYfsA/HJbfChcYz2+EoNQxDtogxq1UjnR+Lk
 HM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703124777; x=1703729577;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZL4eZ6u9CkNNM8zLim6V4IndhkBqKjZUwKwl+b+dig=;
 b=dSa7AccDc+Bmw5R+Q50iVfBcU2lXMaaDwuhsuayhLBJTJYTjAuNG2bAzictCT/+E9B
 De0C85HJXz2VdMBsTuLS0TkkIV6wUZDB7JTPH0rIIq1GH5t8Q5UxotqhG25PW8jThLA0
 TER4LHE6FJu4xN0Qmw62S/Fo5fXdGUOhWZY8v5UObz/DPmmwruzr1ztBNfjJbQLM14Wg
 nsqeliGe5f6tSVJ0M45tP2FFVztmF9U1RD1lagE5siwutLODtuhf4Nt0cFMLlXbibsw9
 U5Xs99t1bMWuX1K2vsFup7uqpJDZaJvVH3fhqjGaeoifXrikorw+WhhJZoDqL8cN/L8f
 pjWQ==
X-Gm-Message-State: AOJu0YyLzdP0v8Yg2K8HiQlbDbAC8MhI1/thV/AuR/DHiFd2Bv2hTaCY
 GvlvOS7EBJeY+yjWu/pt5ulvwktXH44=
X-Google-Smtp-Source: AGHT+IHZcmSZfB7sL8/DN2qPbVmszZ2Jby/ac3YVH1l0ZSD4QHL8Y190bGfTeBcn+OFXVpkLGzQYnrzycAs=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:664d:0:b0:dbd:bf0f:6fff with SMTP id
 z13-20020a25664d000000b00dbdbf0f6fffmr260745ybm.1.1703124777494; Wed, 20 Dec
 2023 18:12:57 -0800 (PST)
Date: Wed, 20 Dec 2023 18:12:55 -0800
In-Reply-To: <ZYJOTLwreD+8l4gU@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZXzx1zXfZ6GV9TgI@google.com> <ZYEbhadnn6+clzX9@yzhao56-desk.sh.intel.com>
 <ZYJOTLwreD+8l4gU@yzhao56-desk.sh.intel.com>
Message-ID: <ZYOfJ_QWG01aL8Hl@google.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 Zhenyu Z Wang <zhenyu.z.wang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Yiwei Zhang <zzyiwei@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023, Yan Zhao wrote:
> On Tue, Dec 19, 2023 at 12:26:45PM +0800, Yan Zhao wrote:
> > On Mon, Dec 18, 2023 at 07:08:51AM -0800, Sean Christopherson wrote:
> > > > > Implementation Consideration
> > > > > ===
> > > > > There is a previous series [1] from google to serve the same purpose to
> > > > > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > > > > requires a new memslot flag, and special memslots in user space.
> > > > > 
> > > > > We don't choose to use memslot flag to request honoring guest memory
> > > > > type.
> > > > 
> > > > memslot flag has the potential to restrict the impact e.g. when using
> > > > clflush-before-read in migration?
> > > 
> > > Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
> > > the host kernel, then the memslot flag will allow for a much more targeted
> > > operation.
> > > 
> > > > Of course the implication is to honor guest type only for the selected slot
> > > > in KVM instead of applying to the entire guest memory as in previous series
> > > > (which selects this way because vmx_get_mt_mask() is in perf-critical path
> > > > hence not good to check memslot flag?)
> > > 
> > > Checking a memslot flag won't impact performance.  KVM already has the memslot
> > > when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
> > > access to the memslot.
> > > 
> > > That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
> > > to retrieve the associated PFN, update write-tracking for shadow pages, etc.
> > > 
> > Hi Sean,
> > Do you prefer to introduce a memslot flag KVM_MEM_DMA or KVM_MEM_WC?
> > For KVM_MEM_DMA, KVM needs to
> > (a) search VMA for vma->vm_page_prot and convert it to page cache mode (with
> >     pgprot2cachemode()? ), or
> > (b) look up memtype of the PFN, by calling lookup_memtype(), similar to that in
> >     pat_pfn_immune_to_uc_mtrr().
> > 
> > But pgprot2cachemode() and lookup_memtype() are not exported by x86 code now.
> > 
> > For KVM_MEM_WC, it requires user to ensure the memory is actually mapped
> > to WC, right?
> > 
> > Then, vmx_get_mt_mask() just ignores guest PAT and programs host PAT as EPT type
> > for the special memslot only, as below.
> > Is this understanding correct?
> > 
> > static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> > {
> >         if (is_mmio)                                                                           
> >                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;                          
> >                                                                                                
> >         if (gfn_in_dma_slot(vcpu->kvm, gfn)) {                                                 
> >                 u8 type = MTRR_TYPE_WRCOMB;                                      
> >                 //u8 type = pat_pfn_memtype(pfn);                                
> >                 return (type << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;       
> >         }                                                                                      
> >                                                                                                
> >         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))                            
> >                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;         
> >                                                                                                
> >         if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {                                             
> >                 if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))               
> >                         return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;                      
> >                 else                                                                           
> >                         return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) | 
> >                                 VMX_EPT_IPAT_BIT;                                
> >         }                                                                        
> >                                                                                  
> >         return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
> > }
> > 
> > BTW, since the special memslot must be exposed to guest as virtio GPU BAR in
> > order to prevent other guest drivers from access, I wonder if it's better to
> > include some keyword like VIRTIO_GPU_BAR in memslot flag name.
> Another choice is to add a memslot flag KVM_MEM_HONOR_GUEST_PAT, then user
> (e.g. QEMU) does special treatment to this kind of memslots (e.g. skipping
> reading/writing to them in general paths).
> 
> @@ -7589,26 +7589,29 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
>         if (is_mmio)
>                 return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;
> 
> +       if (in_slot_honor_guest_pat(vcpu->kvm, gfn))
> +               return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;

This is more along the lines of what I was thinking, though the name should be
something like KVM_MEM_NON_COHERENT_DMA, i.e. not x86 specific and not contradictory
for AMD (which already honors guest PAT).

I also vote to deliberately ignore MTRRs, i.e. start us on the path of ripping
those out.  This is a new feature, so we have the luxury of defining KVM's ABI
for that feature, i.e. can state that on x86 it honors guest PAT, but not MTRRs.

Like so?

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d21f55f323ea..ed527acb2bd3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7575,7 +7575,8 @@ static int vmx_vm_init(struct kvm *kvm)
        return 0;
 }
 
-static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
+static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio,
+                         struct kvm_memory_slot *slot)
 {
        /* We wanted to honor guest CD/MTRR/PAT, but doing so could result in
         * memory aliases with conflicting memory types and sometimes MCEs.
@@ -7598,6 +7599,9 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
        if (is_mmio)
                return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;
 
+       if (kvm_memslot_has_non_coherent_dma(slot))
+               return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
+
        if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
                return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;

I like the idea of pulling the memtype from the host, but if we can make that
work then I don't see the need for a special memslot flag, i.e. just do it for
*all* SPTEs on VMX.  I don't think we need a VMA for that, e.g. we should be able
to get the memtype from the host PTEs, just like we do the page size.

KVM_MEM_WC is a hard "no" for me.  It's far too x86 centric, and as you alluded
to, it requires coordination from the guest, i.e. is effectively limited to
paravirt scenarios.

> +
>         if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
>                 return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;
> 
>         if (kvm_read_cr0_bits(vcpu, X86_CR0_CD)) {
>                 if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
>                         return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
>                 else
>                         return (MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT) |
>                                 VMX_EPT_IPAT_BIT;
>         }
> 
>         return kvm_mtrr_get_guest_memory_type(vcpu, gfn) << VMX_EPT_MT_EPTE_SHIFT;
>  }
