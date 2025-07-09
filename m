Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F64AFEED1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8EB10E343;
	Wed,  9 Jul 2025 16:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OH44zrKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DE410E343
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 16:25:37 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2356ce55d33so1028555ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752078337; x=1752683137;
 darn=lists.freedesktop.org; 
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ceX1V+pEYtx5k0rbcDGOFPKwI1VckK/A3ZcmuXkjgsE=;
 b=OH44zrKVuDycoSYAdj/MpZbje/SPamfF/1DKtiw5slQVscX525dDB4p6l8gXJ3Dt/G
 oE95IMmwwJLG0FP9rO6PlP2VmLZ5a0o/gdvMu2Y+Vq0xWawOwUXYplPFbECr43/m36Rz
 DA/D2QInE7W5ppYQxsykxUekEuDICRlCZ7s5M4SzgCrpbcGOcFqzIj6yX40W3srl4iCg
 Wl2CNWBqMgahThq1lgBPkpeiCf2rGUFFm8Bt0/PtNz7+OTV9KVpzIotrxGu5L6tJLU7V
 /QwptuQWlevtg5ESAf/Shp1GZ3Os/hAkQkwpAHUqfk+0+f7BpOsuCkaXmUva67UifAil
 mQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752078337; x=1752683137;
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ceX1V+pEYtx5k0rbcDGOFPKwI1VckK/A3ZcmuXkjgsE=;
 b=pPUOHG7SnMVz6UL2ALy57OCumOR+VzrpfYYtLc2e4uQSMV55fTYLL8uJQdI+Q3/KLO
 7thPaF4oF0dxNnDDQ+P0H/mjhMNeDr2nN+Vsg0YvayZXoeG3ns605s/nqH36wORrflQ+
 ucuHRxZnKlcpgk+10vSf01DH9KdnP5Yc8sYOEPPfGt8ixpz1D6TX5a6uS/Qk4HHrSBlI
 WdhiarZLSkgBreWxkskYcbkVQCXZo3G4D2LCMgiWfXfm8ko5QfS/WX7/0Xj2jgpxe14D
 5TaHmDqSIlHc+DTWsxa6y5ailIJjPiAXefiyzyqOKmiQ98U+pcR1jsTXOtlpiGk8JTHg
 MB+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFBZBfPGFWU/MCs7QZO+djLjOjsQisKU8aq7xDTWRoZjTmn6+/FN6vy/0IKpyX6ZoOmNcOxp9mIwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/55RjStg75pd5OvhC0Dynjka6x2LtJ7Va+W0ueXTpjfjnDAsT
 0Ks+DELVNXPH/GyyjcvZq3Y97FDtA62omz0S6mrobfT73w5v2sTeufBWg2Ch0UrTIsuPZlHmkCd
 efplzFw==
X-Google-Smtp-Source: AGHT+IH+kN8wldNATK8t+RrFuOEfWrywXkePo1LcH5lJU83pzCFc9eEYj+xjtCKl7JjT7Dl07ty9+fMYhsA=
X-Received: from pjyr7.prod.google.com ([2002:a17:90a:e187:b0:314:2a3f:89c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:190d:b0:234:8a16:d62b
 with SMTP id d9443c01a7336-23ddb1a4d34mr50987395ad.12.1752078336689; Wed, 09
 Jul 2025 09:25:36 -0700 (PDT)
Date: Wed, 9 Jul 2025 09:25:35 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
Message-ID: <aG6X__K8MvVYORkr@google.com>
Subject: Re: [PATCH v3 0/8] x86, KVM: Optimize SEV cache flushing
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
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

On Thu, May 22, 2025, Sean Christopherson wrote:
> This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
> flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
> when doing cached maintenance to prevent data corruption due to C-bit aliasing,
> and to reduce the number of cache invalidations by only performing flushes on
> CPUs that have entered the relevant VM since the last cache flush.
> 
> All of the non-KVM patches are frontloaded and based on v6.15-rc7, so that
> they can go through the tip tree (in a stable branch, please :-) ).

Tip tree folks, any feedback/thoughts on this series (patches 1-4 in particular)?
It'd be nice to get this into 6.17, and I'd really like land it by 6.18 at the
latest.

> Kevin Loughlin (2):
>   x86, lib: Add WBNOINVD helper functions
>   KVM: SEV: Prefer WBNOINVD over WBINVD for cache maintenance efficiency
> 
> Sean Christopherson (3):
>   drm/gpu: Remove dead checks on wbinvd_on_all_cpus()'s return value
>   x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
>   KVM: x86: Use wbinvd_on_cpu() instead of an open-coded equivalent
> 
> Zheyun Shen (3):
>   x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
>   KVM: SVM: Remove wbinvd in sev_vm_destroy()
>   KVM: SVM: Flush cache only on CPUs running SEV guest
> 
>  arch/x86/include/asm/smp.h           | 23 +++++++-
>  arch/x86/include/asm/special_insns.h | 32 ++++++++++-
>  arch/x86/kvm/svm/sev.c               | 85 +++++++++++++++++++---------
>  arch/x86/kvm/svm/svm.h               |  1 +
>  arch/x86/kvm/x86.c                   | 11 +---
>  arch/x86/lib/cache-smp.c             | 26 ++++++++-
>  drivers/gpu/drm/drm_cache.c          |  9 +--
>  7 files changed, 140 insertions(+), 47 deletions(-)
> 
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
> -- 
> 2.49.0.1151.ga128411c76-goog
> 
