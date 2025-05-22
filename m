Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C02AC181F
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3DF10E79D;
	Thu, 22 May 2025 23:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2rN5klsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AAC10E782
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:55 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-310a0668968so2192007a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957075; x=1748561875;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=f9Xn4KYWiGCbjLdjL8speXTpf75EGP3mA2cTcsP7kRE=;
 b=2rN5klsb3Plt+8YipUVZqeH6XqVHU9qFA0g1jr2PzzskWFRlhfZp+KcUwY22HkmjPt
 wyu/I23FT/l4auXnECa3CDiqwphDumuzV9TLh2phL+1enCbaWp6PNQ/GyewgLbjRlSDK
 KAI+yLJtoU67M8MA5FhZoXjFrp0z/QrjVCUhOMWnmpubx7wYahtwBHONV9SrOl5y2R9O
 Qa1GAT2wO1KHjRgW/wxMhaYdfi/jN6bWxOvXqYegxWJTayLc9HXCFdrB7eFjWPEaza61
 Aapx7VuGXBGvYHxCTUThgE27GfqtOb5EOxL29AaUBLUU1vpMT0ezI0l+6kroqLTwd4bK
 ILHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957075; x=1748561875;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9Xn4KYWiGCbjLdjL8speXTpf75EGP3mA2cTcsP7kRE=;
 b=FkvvMvgV3sFf8GLVt5FztjMjwI1VfakGjoF7+gYt+jFMZCrATKGfAa6E8l0/GSRh1Q
 Bb49JIVhBcbNqh46lcf0U/2t+K9EECsQ1WdSwkIBPkokN/du4N0hCpg403B0MBRchFcX
 n+3otqbSSwSQMVAndU30SLOlLr+OjBSJ82cZ98QJTf8YgZ8onTUBPcH8XzpDJTFJ18Ei
 YonH8mnrbZM+o5w0l/ILIiCafBE8XM3v5KaXFtCTNihJBLqouU5QWSoSnCAIjInR9sxO
 Oh7+0T2bMDMmPOXh1DaCIY1dKy2/wQ5VsbHp0c0e0X+sDZvdaU2wWVu3lY8r5+4T9V14
 s/yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEWzGA1hlAbJSwTSWx9Sx/CzNfrSdbhtCqsUJrULIbJj5C7W0e4d230tKEOBJN0GJFMHGO7BKIE3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLLus6bcX8a4bDZKDFxEXi/W7a10iLYhvRW2eDU6tAssR9r0l9
 /WYwETWzgssU5ch4waEu97eNBWULUu+pcAa6+KHIyV5XgZzl3d8yDa8pHVobwA4QHJPjasoIb6X
 NQPoxrA==
X-Google-Smtp-Source: AGHT+IF5Lb8CXIC70Vyva66+17O+yrwnyFqJbN7erK3jdHXzkFdxO3FG0VdX++4AGAOrzJkMYErRjBNX2mI=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:2ee:4a90:3d06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f4c:b0:2fe:994d:613b
 with SMTP id 98e67ed59e1d1-30e7d5be445mr37978564a91.35.1747957074752; Thu, 22
 May 2025 16:37:54 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:32 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-9-seanjc@google.com>
Subject: [PATCH v3 8/8] KVM: SVM: Flush cache only on CPUs running SEV guest
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

From: Zheyun Shen <szy0127@sjtu.edu.cn>

On AMD CPUs without ensuring cache consistency, each memory page
reclamation in an SEV guest triggers a call to do WBNOINVD/WBINVD on all
CPUs, thereby affecting the performance of other programs on the host.

Typically, an AMD server may have 128 cores or more, while the SEV guest
might only utilize 8 of these cores. Meanwhile, host can use qemu-affinity
to bind these 8 vCPUs to specific physical CPUs.

Therefore, keeping a record of the physical core numbers each time a vCPU
runs can help avoid flushing the cache for all CPUs every time.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 46 +++++++++++++++++++++++++++++++++++-------
 arch/x86/kvm/svm/svm.h |  1 +
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 2676be2b121d..c3ddcca9fdce 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -446,7 +446,12 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	init_args.probe = false;
 	ret = sev_platform_init(&init_args);
 	if (ret)
-		goto e_free;
+		goto e_free_asid;
+
+	if (!zalloc_cpumask_var(&sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
+		ret = -ENOMEM;
+		goto e_free_asid;
+	}
 
 	/* This needs to happen after SEV/SNP firmware initialization. */
 	if (vm_type == KVM_X86_SNP_VM) {
@@ -464,6 +469,8 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	return 0;
 
 e_free:
+	free_cpumask_var(sev->have_run_cpus);
+e_free_asid:
 	argp->error = init_args.error;
 	sev_asid_free(sev);
 	sev->asid = 0;
@@ -706,16 +713,31 @@ static void sev_clflush_pages(struct page *pages[], unsigned long npages)
 	}
 }
 
-static void sev_writeback_caches(void)
+static void sev_writeback_caches(struct kvm *kvm)
 {
+	/*
+	 * Note, the caller is responsible for ensuring correctness if the mask
+	 * can be modified, e.g. if a CPU could be doing VMRUN.
+	 */
+	if (cpumask_empty(to_kvm_sev_info(kvm)->have_run_cpus))
+		return;
+
 	/*
 	 * Ensure that all dirty guest tagged cache entries are written back
 	 * before releasing the pages back to the system for use.  CLFLUSH will
 	 * not do this without SME_COHERENT, and flushing many cache lines
 	 * individually is slower than blasting WBINVD for large VMs, so issue
-	 * WBNOINVD (or WBINVD if the "no invalidate" variant is unsupported).
+	 * WBNOINVD (or WBINVD if the "no invalidate" variant is unsupported)
+	 * on CPUs that have done VMRUN, i.e. may have dirtied data using the
+	 * VM's ASID.
+	 *
+	 * For simplicity, never remove CPUs from the bitmap.  Ideally, KVM
+	 * would clear the mask when flushing caches, but doing so requires
+	 * serializing multiple calls and having responding CPUs (to the IPI)
+	 * mark themselves as still running if they are running (or about to
+	 * run) a vCPU for the VM.
 	 */
-	wbnoinvd_on_all_cpus();
+	wbnoinvd_on_cpus_mask(to_kvm_sev_info(kvm)->have_run_cpus);
 }
 
 static unsigned long get_num_contig_pages(unsigned long idx,
@@ -2766,7 +2788,7 @@ int sev_mem_enc_unregister_region(struct kvm *kvm,
 		goto failed;
 	}
 
-	sev_writeback_caches();
+	sev_writeback_caches(kvm);
 
 	__unregister_enc_region_locked(kvm, region);
 
@@ -2914,6 +2936,7 @@ void sev_vm_destroy(struct kvm *kvm)
 	}
 
 	sev_asid_free(sev);
+	free_cpumask_var(sev->have_run_cpus);
 }
 
 void __init sev_set_cpu_caps(void)
@@ -3127,7 +3150,7 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
 	return;
 
 do_sev_writeback_caches:
-	sev_writeback_caches();
+	sev_writeback_caches(vcpu->kvm);
 }
 
 void sev_guest_memory_reclaimed(struct kvm *kvm)
@@ -3140,7 +3163,7 @@ void sev_guest_memory_reclaimed(struct kvm *kvm)
 	if (!sev_guest(kvm) || sev_snp_guest(kvm))
 		return;
 
-	sev_writeback_caches();
+	sev_writeback_caches(kvm);
 }
 
 void sev_free_vcpu(struct kvm_vcpu *vcpu)
@@ -3472,6 +3495,15 @@ int pre_sev_run(struct vcpu_svm *svm, int cpu)
 	if (sev_es_guest(kvm) && !VALID_PAGE(svm->vmcb->control.vmsa_pa))
 		return -EINVAL;
 
+	/*
+	 * To optimize cache flushes when memory is reclaimed from an SEV VM,
+	 * track physical CPUs that enter the guest for SEV VMs and thus can
+	 * have encrypted, dirty data in the cache, and flush caches only for
+	 * CPUs that have entered the guest.
+	 */
+	if (!cpumask_test_cpu(cpu, to_kvm_sev_info(kvm)->have_run_cpus))
+		cpumask_set_cpu(cpu, to_kvm_sev_info(kvm)->have_run_cpus);
+
 	/* Assign the asid allocated with this SEV guest */
 	svm->asid = asid;
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index f16b068c4228..45d564c674ef 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -112,6 +112,7 @@ struct kvm_sev_info {
 	void *guest_req_buf;    /* Bounce buffer for SNP Guest Request input */
 	void *guest_resp_buf;   /* Bounce buffer for SNP Guest Request output */
 	struct mutex guest_req_mutex; /* Must acquire before using bounce buffers */
+	cpumask_var_t have_run_cpus; /* CPUs that have done VMRUN for this VM. */
 };
 
 struct kvm_svm {
-- 
2.49.0.1151.ga128411c76-goog

