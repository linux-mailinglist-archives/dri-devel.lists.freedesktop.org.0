Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE8AC181C
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62810E790;
	Thu, 22 May 2025 23:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vyex9yW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC8210E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:50 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30e9338430eso5370983a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957070; x=1748561870;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=DbY8RCgDJTqdxQLDkHfni+7ks/LJfloWj75h6P2Hb4U=;
 b=vyex9yW5DRavFteXpgpYeqrIDL56kglPVTiIdiH8xn6j86w4p2BkC8IFle8TNgv2Su
 OvrHurvSjkFuKcDrmJTmDjZlTU7qU7VaYJQH74kkd5X2cVmyRh15qPm7KMuUxKxmyCPX
 pWp/1Vie4kF6qMghplL0/HI54gVxANa2DrWTNAOwzpVbOuNDvyOB5iRZ5tnQW07lmLz5
 P91JmM7JBV+EEQWzbtMd/1TqB1xxd6gAWcs5/TYUwVMX7uf1LctpMvKN4eQBDWkZSU1I
 7PhN9ARBd2qutvP7tDLhSwDhWMDIIW8nIkkQpeJTKP8Iyy/u0J1NB659w/gtX7Hcu1zI
 MyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957070; x=1748561870;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbY8RCgDJTqdxQLDkHfni+7ks/LJfloWj75h6P2Hb4U=;
 b=Fyos5vg74C4xiP+KPSLJwro4JXxlNUiDsPU0ulO2LUQV/OzrXR17cDpHOMB6SwqTwI
 e7eH4q1JpUNSN4y13i7qH9ENDXy6XETN0xHzcuYjwO+lSb6QvcXulRGCZ34YkvAVlNTz
 yG5kXZ3ocwZF7TcfMaelbzXVmJi42RDBe1AVsoCqjELOLCF9agNBMSW7/eRlfX7iECQx
 J0pIkT3yYNjOOOQzIXwjrbimant59/GEqVz+Xgdo0/o8Od4uf28ohXxguFUb3vL/PE1j
 a0nUjN47Lr6hqDZulHl5wGsuS75tMVepPbHIf8yGye488A0lCUDkw2OCciHDl0GraL6e
 AtPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT/zfTfLYf/SVry3A4sJMs9PAj8hhJ61VhZ2wBCab6RKKnT2IC8ELxlmOhf+UynQooJrkLo/Rd8I4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqCRdcphnetdwFy2zdnFQ7PVgkswRsnonmmC0W6MZwlh7HG4ou
 FTssOb7TI8HBvv/npbX7MKe99ybJie32h4WOgPhLWsd6CMMG3GKIRURL0bz8tBw3jyODUhUSE4f
 h7L2nDQ==
X-Google-Smtp-Source: AGHT+IGjzBQd6j4J8ysyd/Avsyzv8cw/ixuwdZ+zXrYI9Hkoyaw+vaTqL9WLjC62S+SSSB53dg47wGK8xzs=
X-Received: from pjbpt3.prod.google.com ([2002:a17:90b:3d03:b0:2ff:852c:ceb8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4f4e:b0:310:8d9a:eb1c
 with SMTP id 98e67ed59e1d1-3108d9aeb4fmr12062419a91.21.1747957069850; Thu, 22
 May 2025 16:37:49 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:29 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-6-seanjc@google.com>
Subject: [PATCH v3 5/8] KVM: x86: Use wbinvd_on_cpu() instead of an open-coded
 equivalent
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, Kai Huang <kai.huang@intel.com>, 
 Ingo Molnar <mingo@kernel.org>, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Mingwei Zhang <mizhang@google.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use wbinvd_on_cpu() to target a single CPU instead of open-coding an
equivalent, and drop KVM's wbinvd_ipi() now that all users have switched
to x86 library versions.

No functional change intended.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

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
2.49.0.1151.ga128411c76-goog

