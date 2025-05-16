Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E858ABA528
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF210EB9A;
	Fri, 16 May 2025 21:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ivhn1ehH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4439710EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:13 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-b16b35ea570so2329523a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431013; x=1748035813;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=vApJs4VkDB5QlNVHwT4ZvbZJAzsc+75w07odne9W4Q4=;
 b=ivhn1ehH70LgheYJvwNWEIAKDuKMmiISfxttjDgIQXJMQWKhqBKiC1U+RWNJfXztW8
 cGRZ7xX41q6LGvvey1QzXtM8QSOHLBoumePYgr0miKesrljRBYiSOYr5fFN1Q8WWOD54
 fHNB2ERs2grpVfLwnTkeJTmI/E2tnj6dIXGxubFKacNPw7P55pbLvr7A7FsGLlvGvf5m
 XdAHWoRN5ep+UB005v9BRgGPyA6v0itq8K/NssGbtruMty3yc9LwNeTMZyVAFYPX3sVU
 PsGouf/uEk5HiME2kdabYy6C/m1MLIRrTpVo8m7RgY8DdUonKJMAQFuADtCWusyYNJ8b
 Kx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431013; x=1748035813;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vApJs4VkDB5QlNVHwT4ZvbZJAzsc+75w07odne9W4Q4=;
 b=QTRs8O7KqsKEtgqOD6sAbws6q76DqVJ6ZCLJWaMDsppJ1J9ufcvxdtDsUAtp8Ixdko
 bREcPMuje9dYCxwA+jDlW7d1OOG+u//scMhZsQem6z0tgzRn1M0EkLHL+EOMLOBwXpPJ
 oSBvcdXjzaLSB+8+A2z3tsh3ozl/DnJJs0r7Aty2wrL+3XOYFk5XscEJwNyfklkCxMz/
 AsfP67xgt3e8WyjEjnNZOOHGXBClctAAvnCfLxoJZAiOUJEogwJ+KrJKC9cZYDSPFG1o
 +uuC1mJP1M7/uSquXsmlhCdn6k/N44C6ev9+x+8De8xqwDebz3PUO0jPa2PqevuOW2UD
 NTSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdlyrMDPz42oUwpvIhDgBksjHyODY9PWx9mMM1U+ynZnZgyn9+FMO4oSQmrfcl2MpmNoszmXBP27o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3AmBbzKNA5K4++UIkZcKg3avoxuaK3gbejoTm5PupY574QuSO
 Zw5veRu9awW1nJ4lyQROSkVRzcf4YXYd31qTIUO/A1bigNiLhaJ2OE7jwWaRha5si9M/PJDYAZh
 C0faWLQ==
X-Google-Smtp-Source: AGHT+IGb68toJP8qmeSh29S453pBC6YH3dAmwTf87WeOmAYT6NO/sBgl0udqJdDz9JEtnHFNAAvfH+MPaDk=
X-Received: from pjyp5.prod.google.com ([2002:a17:90a:e705:b0:2f4:465d:5c61])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a12a:b0:215:e08d:7953
 with SMTP id adf61e73a8af0-2162192b844mr7618494637.24.1747431012754; Fri, 16
 May 2025 14:30:12 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:30 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-6-seanjc@google.com>
Subject: [PATCH v2 5/8] KVM: SEV: Prefer WBNOINVD over WBINVD for cache
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
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>, 
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index e9fd3bcec37a..9dcdeea954d3 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -116,6 +116,7 @@ static int sev_flush_asids(unsigned int min_asid, unsigned int max_asid)
 	 */
 	down_write(&sev_deactivate_lock);
 
+	/* SNP firmware requires use of WBINVD for ASID recycling. */
 	wbinvd_on_all_cpus();
 
 	if (sev_snp_enabled)
@@ -707,6 +708,18 @@ static void sev_clflush_pages(struct page *pages[], unsigned long npages)
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
@@ -2757,12 +2770,7 @@ int sev_mem_enc_unregister_region(struct kvm *kvm,
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
 
@@ -3114,30 +3122,29 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
 
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
@@ -3901,7 +3908,7 @@ void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	 * From this point forward, the VMSA will always be a guest-mapped page
 	 * rather than the initial one allocated by KVM in svm->sev_es.vmsa. In
 	 * theory, svm->sev_es.vmsa could be free'd and cleaned up here, but
-	 * that involves cleanups like wbinvd_on_all_cpus() which would ideally
+	 * that involves cleanups like flushing caches, which would ideally be
 	 * be handled during teardown rather than guest boot.  Deferring that
 	 * also allows the existing logic for SEV-ES VMSAs to be re-used with
 	 * minimal SNP-specific changes.
@@ -4899,7 +4906,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 
 		/*
 		 * SEV-ES avoids host/guest cache coherency issues through
-		 * WBINVD hooks issued via MMU notifiers during run-time, and
+		 * WBNOINVD hooks issued via MMU notifiers during run-time, and
 		 * KVM's VM destroy path at shutdown. Those MMU notifier events
 		 * don't cover gmem since there is no requirement to map pages
 		 * to a HVA in order to use them for a running guest. While the
-- 
2.49.0.1112.g889b7c5bd8-goog

