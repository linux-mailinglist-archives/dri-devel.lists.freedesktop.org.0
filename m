Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D2B016D0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B0B10E9CE;
	Fri, 11 Jul 2025 08:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hBcmZVSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B9A10E9CE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:51:10 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso1126148f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752223869; x=1752828669; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLc+yAyLpgSsVL0DY27MbVKG7PMR2I1NMPg5UEUaSYE=;
 b=hBcmZVSq46/d+62VmauCrquq5PbDCxAQ3EgNJgHKYyUxf/dozHAzXTVLAONX75tGs4
 SfXk+IRj1ePf7qKkRrZh1RFWIp5VzqjrFFvUwwnXo31PzG3t728OQTI38xkcGTgCuMCN
 qOFQEsdo072pAVsUtcKkKv/g+lV9J71hh6wbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752223869; x=1752828669;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wLc+yAyLpgSsVL0DY27MbVKG7PMR2I1NMPg5UEUaSYE=;
 b=joXLA2M3Dgye3QefaBbH/QWKFy07LFvoVn7NE3v4YpgDtxlx5fegbujSeaja2jC8nh
 Gfe7mC9iIya4vJ5rT5KbVTNA672cb7QJVX87bsjj9haYr3YgjtZUvUuWGy9a2agClCgn
 fqEuDDFITS7OcnBredIyEViS78c4q3rQXbKcnxO3vG5Z+/YlpaWEPiIKwD6JqgEA1Gj0
 1mpYJl2rA1h8TnsgGv+Hz5K2pC5gfDWaXCfQgQJKa9AIZK+fzL/mYfY6vmFNOk9iL+JX
 uxyD+1+ea2Q98V3cujKM9LiP4tMhnfUzDnB1r9StREgbYGNKMbS9GgnYJao6nBZfEOTd
 1w6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZePp9jmZdzOvUOIX1BfhA92kIBqt3SRv+zmd5VdWsiOhu3phwKB3dRveZZflnuZTLgmvqwi4zG4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSBX0jEwmIE8McCcsIMNfQ6JDcoBz/Equ5V+adEoBZXqXcGtQU
 27tut+jIdWmHv9C7NXGsAb8aHiRtK7fH+BouxzBoh6JvjSZrZPL48fxw8xg2DCkN+XA=
X-Gm-Gg: ASbGncvAfGkp+2tBbpNhaK/XC37FeqnIKNeRDGY7YVmf+s7znljNCred8WZsSets/d3
 C0VPIW2UduupyWIeiw4NvPDZtMDe4W0zn8MS/3P2WxNOhlQT3SeBgmzPygtQff+1Ws8xYHscMch
 hPA/33nwsjGvVbUO1Nrk+hI+aaKmpNiYimL0xA5jA/3I7QjherioKrYzntHIY0zwXAdFNlxlhLO
 8+nZh6ER3iJeJiBJX0bz6VZMsKEVac0O0fEMid65tnWYVRL+XjVT9fudPhYQhgoM5pIidqvdI4K
 gVba6zx0rMIVTBb/M16WEg3hwx2M187LHVSHw8GzrxN8ZYWm1VAVvQdyeZYuP3DI67/DMlD16eT
 4Et9tqqKELcIIJc5S8r8w+xemSVrf922SOw==
X-Google-Smtp-Source: AGHT+IF/p5JseJYyVQuyUwqnGmfxYrQbso5K+hNI8FrIUfZsi1LkIHNT8yNbMfG/FKzdOjwH5E48Pg==
X-Received: by 2002:adf:9c84:0:b0:3a5:1f2:68f3 with SMTP id
 ffacd0b85a97d-3b5f18d2e76mr2229476f8f.46.1752223868625; 
 Fri, 11 Jul 2025 01:51:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2087sm3957272f8f.30.2025.07.11.01.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 01:51:08 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:51:06 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Zheyun Shen <szy0127@sjtu.edu.cn>, Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
Message-ID: <aHDQersZPA9D8fJb@phenom.ffwll.local>
Mail-Followup-To: Peter Zijlstra <peterz@infradead.org>,
 Borislav Petkov <bp@alien8.de>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kevin Loughlin <kevinloughlin@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kai Huang <kai.huang@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Zheyun Shen <szy0127@sjtu.edu.cn>,
 Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
References: <20250522233733.3176144-1-seanjc@google.com>
 <20250522233733.3176144-4-seanjc@google.com>
 <20250710112902.GCaG-j_l-K6LYRzZsb@fat_crate.local>
 <20250710143729.GL1613200@noisy.programming.kicks-ass.net>
 <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710154704.GJ1613633@noisy.programming.kicks-ass.net>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 05:47:04PM +0200, Peter Zijlstra wrote:
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

There's some ancient pentium M where clflush is a no-op (or at least not
getting stuff flushed enough for the gpu to see it), but we still need to
ensure cache coherency with the non-coherent gpu, and wbinvd does the job.
I figured this out with sheer desperation over a decade ago myself,
it's pain.

There shouldn't be any other reason for i915 to wbinvd.
-Sima

> 
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

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
