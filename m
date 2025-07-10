Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E4B007C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F8410E22A;
	Thu, 10 Jul 2025 15:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D4544RcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62710E22A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 15:55:04 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-311a6b43ed7so1202960a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752162904; x=1752767704;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nV1olJ9SZ90DwgRNYjXjgenr93Qe34BEuVW+pd4gRI8=;
 b=D4544RcEt/6vBAfUIMrcHk2uoPJL3vncn5QJ/6TMLnNp1Plseih3eL7nPjQGb8bfoG
 DdZI5jFqe7qGIK725Rnsc3GUQngZZuYcSlU+w1IrMFGB/Dq/n9ZasOV44yQ5hIX9u9GI
 Lx8sEW+a3Hy5pjiv0tCjXmpTPrwwjkqY8TyD9o0ms/2PTijjow/pwJ10zoQVvN+r4aI/
 smaH8tJ+y3IfWtXwPphuQJARybhAT4+exalut/NmxJ7k4VuSnn+2uLau+JT6+bAcnySv
 CUxkahyQBE+NN2eeYpHyY2fvogvSzV32ztAuZDA1lBxYkLuMiRYTPiLYfSEdb3oV7KkY
 WUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162904; x=1752767704;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nV1olJ9SZ90DwgRNYjXjgenr93Qe34BEuVW+pd4gRI8=;
 b=RFE6LxLZ/PbzKiCU79HfwM4iOSbxkBYlct4m7w0uYfQ9Agp/PNzkzu2D3cS5GAHFfZ
 saA0lOMycy0i7NdLS8CD+nGC7CvGmsPLylXH9fUzylPvf4+vpjOmEI0DrxLurwFfT+Qt
 71B9wgNaMgkiNtiVC0wftcUXT0i9tnB2RlpFoVNlAA66FmFSNPsLXt60WimMvnIJVcIm
 WerG912SI3ZCtLB31/dagJ2cer0LKzqMlKFl1ucaApX7tpKHIiJ9gdXlx53l1cVWDvpf
 ErrQqdkKP/2peU97C+R4lX7jZ6yVksLlwirhoyBZAz8SXAfqkDhl0MwQQWf16gxoVGZf
 s35g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWleHtWCIsg51/ISlUg1a/XSEHcfqYOubC8j+L4hptUSW1LypbdhCmGJsD0s6ppGmFf/VKQMKKcq90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv3NrqsygLY2hl5nwwpkBnmtzsnW1TxNVV8HS4UMhR2du0ccjh
 lvZMUBvmte7Fct6x6yK/bLi7ma/rUUYaBa3ra9qfTvjVilpoaCyPLg6HK1j3ZnDeYcz5qif9JMY
 KLBMSqQ==
X-Google-Smtp-Source: AGHT+IFICyjT9NXq9BtYtyMoFZr6GhrLdcBIWlvwDgWHmErMpo1E4lmn/+/4G6o3U8umnLwC4rTugmVEgfI=
X-Received: from pjb12.prod.google.com ([2002:a17:90b:2f0c:b0:31c:15e1:d04])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d89:b0:311:c1ec:7cfb
 with SMTP id 98e67ed59e1d1-31c4cce03acmr45281a91.21.1752162904337; Thu, 10
 Jul 2025 08:55:04 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:55:02 -0700
In-Reply-To: <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
 <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
 <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
Message-ID: <aG_iVqMkeIUELiTX@google.com>
Subject: Re: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>, 
 Zheyun Shen <szy0127@sjtu.edu.cn>, Mingwei Zhang <mizhang@google.com>, 
 Francesco Lavra <francescolavra.fl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 10, 2025, Peter Zijlstra wrote:
> On Thu, Jul 10, 2025 at 04:37:29PM +0200, Peter Zijlstra wrote:
> > On Thu, Jul 10, 2025 at 01:29:02PM +0200, Borislav Petkov wrote:
> > > On Thu, May 22, 2025 at 04:37:27PM -0700, Sean Christopherson wrote:
> > > > diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> > > > index 079c3f3cd32c..1789db5d8825 100644
> > > > --- a/arch/x86/lib/cache-smp.c
> > > > +++ b/arch/x86/lib/cache-smp.c
> > > > @@ -19,3 +19,14 @@ void wbinvd_on_all_cpus(void)
> > > >  	on_each_cpu(__wbinvd, NULL, 1);
> > > >  }
> > > >  EXPORT_SYMBOL(wbinvd_on_all_cpus);
> > > > +
> > > > +static void __wbnoinvd(void *dummy)
> > > > +{
> > > > +	wbnoinvd();
> > > > +}
> > > > +
> > > > +void wbnoinvd_on_all_cpus(void)
> > > > +{
> > > > +	on_each_cpu(__wbnoinvd, NULL, 1);
> > > > +}
> > > > +EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
> > > 
> > > If there's no particular reason for the non-GPL export besides being
> > > consistent with the rest - yes, I did the change for wbinvd_on_all_cpus() but
> > > that was loooong time ago - I'd simply make this export _GPL.
> > 
> > Uhhhh, how about we use this fancy export to known modules only thing
> > for this?
> > 
> > These are typical things we do *NOT* want people to actually use.
> 
> So kvm-amd is the SEV stuff, AGPGART is the ancient crap nobody cares
> about, CCP is more SEV stuff, DRM actually does CLFLUSH loops, but has a
> WBINVD fallback. i915 is rude and actually does WBINVD. Could they
> pretty please also do CLFLUSH loops?

FWIW, doing CLFLUSH in KVM isn't feasible.  In multiple flows, KVM doesn't have
a valid virtual mapping, and hardware *requires* a WBINVD for at least one of the
SEV paths.

> Anyway, the below seems to survive an allmodconfig.
> 
> ---
> diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
> index c5c60d07308c..ac3cc32a4054 100644
> --- a/arch/x86/lib/cache-smp.c
> +++ b/arch/x86/lib/cache-smp.c
> @@ -12,19 +12,19 @@ void wbinvd_on_cpu(int cpu)
>  {
>  	smp_call_function_single(cpu, __wbinvd, NULL, 1);
>  }
> -EXPORT_SYMBOL(wbinvd_on_cpu);
> +EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_cpu, "kvm-amd,agpgart,ccp,drm,i915");

Patch 5 of this series drops KVM's homebrewed version of WBINVD-on-CPU, so this
one at least would need to export the symbol for "kvm" as well.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1d0e9180148d..d63a2c27e058 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4965,11 +4965,6 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return r;
 }
 
-static void wbinvd_ipi(void *garbage)
-{
-	wbinvd();
-}
-
 static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 {
 	return kvm_arch_has_noncoherent_dma(vcpu->kvm);
@@ -4991,8 +4986,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		if (kvm_x86_call(has_wbinvd_exit)())
 			cpumask_set_cpu(cpu, vcpu->arch.wbinvd_dirty_mask);
 		else if (vcpu->cpu != -1 && vcpu->cpu != cpu)
-			smp_call_function_single(vcpu->cpu,
-					wbinvd_ipi, NULL, 1);
+			wbinvd_on_cpu(vcpu->cpu);
 	}
 
 	kvm_x86_call(vcpu_load)(vcpu, cpu);
-- 

>  
>  void wbinvd_on_all_cpus(void)
>  {
>  	on_each_cpu(__wbinvd, NULL, 1);
>  }
> -EXPORT_SYMBOL(wbinvd_on_all_cpus);
> +EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_all_cpus, "kvm-amd,agpgart,ccp,drm,i915,intel-gtt");
>  
>  void wbinvd_on_cpus_mask(struct cpumask *cpus)
>  {
>  	on_each_cpu_mask(cpus, __wbinvd, NULL, 1);
>  }
> -EXPORT_SYMBOL_GPL(wbinvd_on_cpus_mask);
> +EXPORT_SYMBOL_GPL_FOR_MODULES(wbinvd_on_cpus_mask, "kvm,kvm-amd,agpgart,ccp,drm,i915");
>  
>  static void __wbnoinvd(void *dummy)
>  {
> @@ -35,10 +35,10 @@ void wbnoinvd_on_all_cpus(void)
>  {
>  	on_each_cpu(__wbnoinvd, NULL, 1);
>  }
> -EXPORT_SYMBOL_GPL(wbnoinvd_on_all_cpus);
> +EXPORT_SYMBOL_GPL_FOR_MODULES(wbnoinvd_on_all_cpus, "kvm-amd,agpgart,ccp,drm,i915");
>  
>  void wbnoinvd_on_cpus_mask(struct cpumask *cpus)
>  {
>  	on_each_cpu_mask(cpus, __wbnoinvd, NULL, 1);
>  }
> -EXPORT_SYMBOL_GPL(wbnoinvd_on_cpus_mask);
> +EXPORT_SYMBOL_GPL_FOR_MODULES(wbnoinvd_on_cpus_mask, "kvm-amd,agpgart,ccp,drm,i915");
