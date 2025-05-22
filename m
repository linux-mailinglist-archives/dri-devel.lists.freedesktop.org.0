Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F439AC181B
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE9610E79A;
	Thu, 22 May 2025 23:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1I88vjWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7A10E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:53 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2320d1cb313so54964055ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957073; x=1748561873;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=seZN2EGAtTjhEaK9XXu9a0BU/Kezpabke/BGyffe3tE=;
 b=1I88vjWmZPbNNiRnGZW+C0Rtb1ul7eozwX2vOAE8DSNSN1nBe26ORUCgxiYZm+eYwl
 4nx0AMcoB6lhWezgFhNQj2UTmDhp+qVHiWapp0Sc0i5pubRHysfuDw1gOmgQb8l+2a8Y
 vi9CLy6L63a217cIQHEVoJHzm9mz1G2I6RxXeUmGZTq+kHZNWJ/D+i/ZyuTj3y9YxGRv
 7SxrVQGdeyWRUConeV/5DdI9weREWs0SB/hnBTCyhaSdo3TdMDo3i1qjU4OMnE0Lgn3l
 zymAjVXF16QbzR49viDtIPN1P1HGXCNWQUo0NEA7eaS+F8edaEvIQnkE6bWdKezXI2nc
 CvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957073; x=1748561873;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=seZN2EGAtTjhEaK9XXu9a0BU/Kezpabke/BGyffe3tE=;
 b=f4na+YzWU3CDbRTXoYEApIaTSf/L3H0Bw7Au0Y0LobgeV4TQkbKskXQcGR6RxmYrel
 OO/93pdRkHV64lCRk+VhawReSDuGlwE/x5Z4tU0gY7f6zeHY/9A6Prpe4Xe/W9GW6ayV
 Cjj14bhz+zs+fgErteMI12FJIEFn74u7z4JFtTa9QAqxK+VEyW6Svy/jCMobX2rNlu9p
 nPNPp5sOidmPNwBlC+Y9Yzy5LVjjLVhpPyjgzbQ/qkcm5iBIfaLYUHVq0v48VqMXIt/+
 mRWEKmqpHowhjnp52TPNkYqynOuMxB6tltJJHMqlI7HjpFc+QvzUmCTYXymMHHi+J/R7
 lSzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmTllSW2g6RyIMq5dfx7X4MUagbOhjDxtk/AQ6h/i3YBtLWffYRBa2RrbGcKwtrtUG9Qz2Ey1paM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmShsL/2YfIGAPr2rHNn/iN41QtRfdhaZgIOVuhy5efz1q7uqy
 uRax86iOe2RasKHYb7fvYW3iY425CPOWXjE0Xf1JK6JgVoiAgb39VrS5Am/L1YNiyfc4Z5Gp0TY
 Pll2YOw==
X-Google-Smtp-Source: AGHT+IFOOrwLLJCq1Z+4dRHMqtaDLThdmKHgmx1QXHqioZeimXXjRObTtkWDRHa0hE0Qmb1cyO8UAcflGvE=
X-Received: from pjbso5.prod.google.com ([2002:a17:90b:1f85:b0:2fa:1481:81f5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec89:b0:231:b1c8:3591
 with SMTP id d9443c01a7336-231de36bb99mr418195725ad.24.1747957073118; Thu, 22
 May 2025 16:37:53 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:31 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-8-seanjc@google.com>
Subject: [PATCH v3 7/8] KVM: SEV: Prefer WBNOINVD over WBINVD for cache
 maintenance efficiency
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

From: Kevin Loughlin <kevinloughlin@google.com>

AMD CPUs currently execute WBINVD in the host when unregistering SEV
guest memory or when deactivating SEV guests. Such cache maintenance is
performed to prevent data corruption, wherein the encrypted (C=1)
version of a dirty cache line might otherwise only be written back
after the memory is written in a different context (ex: C=0), yielding
corruption. However, WBINVD is performance-costly, especially because
it invalidates processor caches.

Strictly-speaking, unless the SEV ASID is being recycled (meaning the
SNP firmware requires the use of WBINVD prior to DF_FLUSH), the cache
invalidation triggered by WBINVD is unnecessary; only the writeback is
needed to prevent data corruption in remaining scenarios.

To improve performance in these scenarios, use WBNOINVD when available
instead of WBINVD. WBNOINVD still writes back all dirty lines
(preventing host data corruption by SEV guests) but does *not*
invalidate processor caches. Note that the implementation of wbnoinvd()
ensures fall back to WBINVD if WBNOINVD is unavailable.

In anticipation of forthcoming optimizations to limit the WBNOINVD only
to physical CPUs that have executed SEV guests, place the call to
wbnoinvd_on_all_cpus() in a wrapper function sev_writeback_caches().

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
Reviewed-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://lore.kernel.org/r/20250201000259.3289143-3-kevinloughlin@google.com
[sean: tweak comment regarding CLFUSH]
Cc: Francesco Lavra <francescolavra.fl@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 45 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index be70c8401c9b..2676be2b121d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -116,6 +116,7 @@ static int sev_flush_asids(unsigned int min_asid, unsigned int max_asid)
 	 */
 	down_write(&sev_deactivate_lock);
 
+	/* SNP firmware requires use of WBINVD for ASID recycling. */
 	wbinvd_on_all_cpus();
 
 	if (sev_snp_enabled)
@@ -705,6 +706,18 @@ static void sev_clflush_pages(struct page *pages[], unsigned long npages)
 	}
 }
 
+static void sev_writeback_caches(void)
+{
+	/*
+	 * Ensure that all dirty guest tagged cache entries are written back
+	 * before releasing the pages back to the system for use.  CLFLUSH will
+	 * not do this without SME_COHERENT, and flushing many cache lines
+	 * individually is slower than blasting WBINVD for large VMs, so issue
+	 * WBNOINVD (or WBINVD if the "no invalidate" variant is unsupported).
+	 */
+	wbnoinvd_on_all_cpus();
+}
+
 static unsigned long get_num_contig_pages(unsigned long idx,
 				struct page **inpages, unsigned long npages)
 {
@@ -2753,12 +2766,7 @@ int sev_mem_enc_unregister_region(struct kvm *kvm,
 		goto failed;
 	}
 
-	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
-	 */
-	wbinvd_on_all_cpus();
+	sev_writeback_caches();
 
 	__unregister_enc_region_locked(kvm, region);
 
@@ -3110,30 +3118,29 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
 
 	/*
 	 * VM Page Flush takes a host virtual address and a guest ASID.  Fall
-	 * back to WBINVD if this faults so as not to make any problems worse
-	 * by leaving stale encrypted data in the cache.
+	 * back to full writeback of caches if this faults so as not to make
+	 * any problems worse by leaving stale encrypted data in the cache.
 	 */
 	if (WARN_ON_ONCE(wrmsrl_safe(MSR_AMD64_VM_PAGE_FLUSH, addr | asid)))
-		goto do_wbinvd;
+		goto do_sev_writeback_caches;
 
 	return;
 
-do_wbinvd:
-	wbinvd_on_all_cpus();
+do_sev_writeback_caches:
+	sev_writeback_caches();
 }
 
 void sev_guest_memory_reclaimed(struct kvm *kvm)
 {
 	/*
 	 * With SNP+gmem, private/encrypted memory is unreachable via the
-	 * hva-based mmu notifiers, so these events are only actually
-	 * pertaining to shared pages where there is no need to perform
-	 * the WBINVD to flush associated caches.
+	 * hva-based mmu notifiers, i.e. these events are explicitly scoped to
+	 * shared pages, where there's no need to flush caches.
 	 */
 	if (!sev_guest(kvm) || sev_snp_guest(kvm))
 		return;
 
-	wbinvd_on_all_cpus();
+	sev_writeback_caches();
 }
 
 void sev_free_vcpu(struct kvm_vcpu *vcpu)
@@ -3897,9 +3904,9 @@ void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	 * From this point forward, the VMSA will always be a guest-mapped page
 	 * rather than the initial one allocated by KVM in svm->sev_es.vmsa. In
 	 * theory, svm->sev_es.vmsa could be free'd and cleaned up here, but
-	 * that involves cleanups like wbinvd_on_all_cpus() which would ideally
-	 * be handled during teardown rather than guest boot.  Deferring that
-	 * also allows the existing logic for SEV-ES VMSAs to be re-used with
+	 * that involves cleanups like flushing caches, which would ideally be
+	 * handled during teardown rather than guest boot.  Deferring that also
+	 * allows the existing logic for SEV-ES VMSAs to be re-used with
 	 * minimal SNP-specific changes.
 	 */
 	svm->sev_es.snp_has_guest_vmsa = true;
@@ -4892,7 +4899,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 
 		/*
 		 * SEV-ES avoids host/guest cache coherency issues through
-		 * WBINVD hooks issued via MMU notifiers during run-time, and
+		 * WBNOINVD hooks issued via MMU notifiers during run-time, and
 		 * KVM's VM destroy path at shutdown. Those MMU notifier events
 		 * don't cover gmem since there is no requirement to map pages
 		 * to a HVA in order to use them for a running guest. While the
-- 
2.49.0.1151.ga128411c76-goog

