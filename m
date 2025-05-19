Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4345ABC36D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111AC10E0CF;
	Mon, 19 May 2025 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZUAyiSj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1629110E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:03:01 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30ebf91d150so2550166a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747670580; x=1748275380;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ebJzx1LorPbf1NWqtTpnidvsrFRDAcdzNorkYWG1GY4=;
 b=ZUAyiSj48xNDiZ9cfNBcfBnyDY3Kiy1lztnQtnFbjAMIZqM4FiOexl+un2l8fSideI
 KQBdqI4P4y9QiXqXBGoYm4Lurw73A7/0m+xl0h7XB8vfKPtdEgPy2x8DEsewTpGOyEs7
 d6tXu510XowtAy57GlHWgyqcVqwhY7OFeEq+jMCqCxblbmEIiGYwGbp2qb4dcPK5ZcaQ
 IoFLObXVADUWiWnxapKNpYrJSpF/MXtIXqaSZ6ZEPZh6j8wDm58mlrMG+ntTC/he/2Lb
 +wlbqexxEmSggTCQM3f12x9LXdacR1uKLdxJ3fSbMU94TF5Rf7jgcz446vUbFTxQAeOW
 Lvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670580; x=1748275380;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ebJzx1LorPbf1NWqtTpnidvsrFRDAcdzNorkYWG1GY4=;
 b=DKuUxkM3kz4g0M9j6G+2fFr0Ss1asXbaX0YTIJff44XFYpB8z8QNXCqA3o1ckG7dl5
 uxLQFxyqzFs6UfQHl9JwwcYnya+UGYa3VBMGXm2ZtqtIyELSWyGWqnMat8ZJt829s1d+
 PBwec/NPK4h1XNm+7a0D2FhouHV73weqKwy68yWQCEgPWqyt8KYH5OdWxbTlmMS6yZUm
 cXDfTke4JL9eAzd50sJipeOnnJsNp7F4RTjS6kX5UFQksTOSbzvg35/t4zoCFzJp5iik
 Y0S6cD2iABJA10ItoytjURWBVauTlDhs66Vr3EL3Ic3OPSVXJ1iUNwOWPccJ7DyyjfwA
 SJZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUVeJZ69gYOV7rKV2d56pvlPCQOh3MD8fg60ia7s6/cQEEJmmJfbJha2xaVaR76PwEbYeCU90S53Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpPwixGupTa5nIrPT6W63zoi/OGOUFwjsBdq6HBW9dkqHwJyaf
 nZcvm8H1tOA0WM2A9LPOEwCvIixyP4CebX/PrXaluTuSbdkCTK2orkcqUqmbA32YVTzY7zJkbX/
 yVvL1DA==
X-Google-Smtp-Source: AGHT+IGgPwGOMBLaCWE5KFajgM1k5GAAtbgHFzAkvoKLZILtRQoRL0lrXZ29F1zNrZz+oqAiBi5JJlM1Uas=
X-Received: from pja16.prod.google.com ([2002:a17:90b:5490:b0:30a:3021:c1af])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d888:b0:30e:823f:ef3c
 with SMTP id 98e67ed59e1d1-30e823ff09dmr21512162a91.25.1747670580528; Mon, 19
 May 2025 09:03:00 -0700 (PDT)
Date: Mon, 19 May 2025 09:02:59 -0700
In-Reply-To: <aCg0Xc9fEB2Qn5Th@gmail.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-8-seanjc@google.com>
 <aCg0Xc9fEB2Qn5Th@gmail.com>
Message-ID: <aCtWM63FyQKMJzqE@google.com>
Subject: Re: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to
 target multiple CPUs
From: Sean Christopherson <seanjc@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Zheyun Shen <szy0127@sjtu.edu.cn>, Tom Lendacky <thomas.lendacky@amd.com>, 
 Kevin Loughlin <kevinloughlin@google.com>, Kai Huang <kai.huang@intel.com>, 
 Mingwei Zhang <mizhang@google.com>
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

On Sat, May 17, 2025, Ingo Molnar wrote:
> 
> * Sean Christopherson <seanjc@google.com> wrote:
> 
> > From: Zheyun Shen <szy0127@sjtu.edu.cn>
> > 
> > Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
> > common library helpers for both WBINVD and WBNOINVD (KVM will use both).
> > Put the onus on the caller to check for a non-empty mask to simplify the
> > SMP=n implementation, e.g. so that it doesn't need to check that the one
> > and only CPU in the system is present in the mask.
> > 
> > Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
> > [sean: move to lib, add SMP=n helpers, clarify usage]
> > Acked-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/smp.h | 12 ++++++++++++
> >  arch/x86/kvm/x86.c         |  8 +-------
> >  arch/x86/lib/cache-smp.c   | 12 ++++++++++++
> >  3 files changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index e08f1ae25401..fe98e021f7f8 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -113,7 +113,9 @@ void native_play_dead(void);
> >  void play_dead_common(void);
> >  void wbinvd_on_cpu(int cpu);
> >  void wbinvd_on_all_cpus(void);
> > +void wbinvd_on_many_cpus(struct cpumask *cpus);
> >  void wbnoinvd_on_all_cpus(void);
> > +void wbnoinvd_on_many_cpus(struct cpumask *cpus);
> 
> Let's go with the _on_cpumask() suffix:
> 
>     void wbinvd_on_cpu(int cpu);
>    +void wbinvd_on_cpumask(struct cpumask *cpus);
>     void wbinvd_on_all_cpus(void);
> 
> And the wb*invd_all_cpus() methods should probably be inlined wrappers 
> with -1 as the cpumask, or so - not two separate functions?

Using two separate functions allows _on_all_cpus() to defer the mask generation
to on_each_cpu(), i.e. avoids having to duplicate the passing of cpu_online_mask.
IMO, duplicating passing __wbinvd is preferable to duplicating the use of
cpu_online_mask.
 
> In fact it would be nice to have the DRM preparatory patch and all the 
> x86 patches at the beginning of the next version of the series, so 
> those 4 patches can be applied to the x86 tree. Can make it a separate 
> permanent branch based on v6.15-rc6/rc7.

Can do, assuming there's no lurking dependency I'm missing.
