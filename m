Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1015F88E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 22:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2A6E87B;
	Fri, 14 Feb 2020 21:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1596E87B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 21:15:40 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x2so420899ila.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FXJ1JTNgU2E22b70yRrhJ6SPMIz5n/Z3sdORI4L9ty8=;
 b=jsrXdiHvNW2zQOd8aBV3t87/27otvjgZjd6NJ/B5m8BAwkxiejNryiAOp38AwF17a0
 PvyZh1E+koXs6hGBdR+rjPQQ2yOj6W3kLJl1xZ/zNYp3wgP1WDr8USFeN5+D+kwwfyLf
 KtLQZRiBzI0Nz3ZuaqMWBMOu9DLWMAEAPLMbxIPsa2F65EsutkvcVahd1+r76vDJEeAx
 C38KY20+aHbktRhYavj3Wyefm/4xJOCaoTvkFcAGz+0o+eKV2pHWunW/McOVcTZyXgF7
 F5Cx5KHHVB8R5DfETIV46Oa6IzhmTLAp6eQaJoL7ZMyd04IDhdcEsT3I3iZKGlIlTeGB
 p1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FXJ1JTNgU2E22b70yRrhJ6SPMIz5n/Z3sdORI4L9ty8=;
 b=W8uhrPyw6M0hOOCijeI5mQkktpUn23OdiDRhMkU7ek3cMkp2934Hrf+ZQPMrZWaCO+
 qky5PaLsagKJy932H+ulw5tVXe9vThr+26ZSqQEf7BJGRBHb1OMfzH6B5+mzTYsqChNt
 1M4h6+KlMkXrON+lDiEHqGgiEIk69+Msbz4GL0dZF2bJDjsUz/ARRCAE1zTEYiy34uS7
 u7WkaUc4b+xjhfm5ZY0ssPgbhygukbY/W84Lnu99CnJLgCWlBG08m8a42oSQxlG99Mhy
 A6MBzoB7Xz+KN0M0s2KAIKxjswAHsEtnaCcQtQeIPjdsiCh+eimrpSYPtN1XpLV7cne+
 5i9w==
X-Gm-Message-State: APjAAAUbg0X9iCrpZejIBoGxXWNH1RYea2oFJCx0QoHENvR174a1yyca
 Wk6VB/Crn2fyxBlk2YewH8iH2EZQFzb8AWcZv38=
X-Google-Smtp-Source: APXvYqzQv0LLRRQ9ByBo7rV529L/iNIzaHjKCB6cgQtzDcXP6c42xPOa2yhHz978lz9Y+yhh+Wvkf03ZpP/XWK5tlp4=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr5105396ilk.139.1581714939721; 
 Fri, 14 Feb 2020 13:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
In-Reply-To: <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 14 Feb 2020 13:15:28 -0800
Message-ID: <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, joro@8bytes.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, vkuznets@redhat.com, jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 2:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/02/20 23:18, Chia-I Wu wrote:
> >
> > The bug you mentioned was probably this one
> >
> >   https://bugzilla.kernel.org/show_bug.cgi?id=104091
>
> Yes, indeed.
>
> > From what I can tell, the commit allowed the guests to create cached
> > mappings to MMIO regions and caused MCEs.  That is different than what
> > I need, which is to allow guests to create uncached mappings to system
> > ram (i.e., !kvm_is_mmio_pfn) when the host userspace also has uncached
> > mappings.  But it is true that this still allows the userspace & guest
> > kernel to create conflicting memory types.
>
> Right, the question is whether the MCEs were tied to MMIO regions
> specifically and if so why.
>
> An interesting remark is in the footnote of table 11-7 in the SDM.
> There, for the MTRR (EPT for us) memory type UC you can read:
>
>   The UC attribute comes from the MTRRs and the processors are not
>   required to snoop their caches since the data could never have
>   been cached. This attribute is preferred for performance reasons.
>
> There are two possibilities:
>
> 1) the footnote doesn't apply to UC mode coming from EPT page tables.
> That would make your change safe.
>
> 2) the footnote also applies when the UC attribute comes from the EPT
> page tables rather than the MTRRs.  In that case, the host should use
> UC as the EPT page attribute if and only if it's consistent with the host
> MTRRs; it would be more or less impossible to honor UC in the guest MTRRs.
> In that case, something like the patch below would be needed.
>
> It is not clear from the manual why the footnote would not apply to WC; that
> is, the manual doesn't say explicitly that the processor does not do snooping
> for accesses to WC memory.  But I guess that must be the case, which is why I
> used MTRR_TYPE_WRCOMB in the patch below.
>
> Either way, we would have an explanation of why creating cached mapping to
> MMIO regions would, and why in practice we're not seeing MCEs for guest RAM
> (the guest would have set WB for that memory in its MTRRs, not UC).
>
> One thing you didn't say: how would userspace use KVM_MEM_DMA?  On which
> regions would it be set?
It will be set for shmems that are mapped WC.

GPU/DRM drivers allocate shmems as DMA-able gpu buffers and allow the
userspace to map them cached or WC (I915_MMAP_WC or
AMDGPU_GEM_CREATE_CPU_GTT_USWC for example).  When a shmem is mapped
WC and is made available to the guest, we would like the ability to
map the region WC in the guest.


> Thanks,
>
> Paolo
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index dc331fb06495..2be6f7effa1d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6920,8 +6920,16 @@ static u64 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
>         }
>
>         cache = kvm_mtrr_get_guest_memory_type(vcpu, gfn);
> -
>  exit:
> +       if (cache == MTRR_TYPE_UNCACHABLE && !is_mmio) {
> +               /*
> +                * We cannot set UC in the EPT page tables as it can cause
> +                * machine check exceptions (??).  Hopefully the guest is
> +                * using PAT.
> +                */
> +               cache = MTRR_TYPE_WRCOMB;
> +       }
> +
>         return (cache << VMX_EPT_MT_EPTE_SHIFT) | ipat;
>  }
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
