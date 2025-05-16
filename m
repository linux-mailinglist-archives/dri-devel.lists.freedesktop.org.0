Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B341ABA527
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643D410EB99;
	Fri, 16 May 2025 21:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="s5YGDWV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7A410EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:17 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30e8fc03575so530161a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431017; x=1748035817;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=VVF3vRzj16BIxVOrDVzAz6hJgiBEUt5vcCXrSP3D1EE=;
 b=s5YGDWV7QfAjkn9qs4p4cGTMiXoOmCnCUd3rajW4K7eeZ9PzStIU2kvP2iw2QZl+yv
 a097F11RNnTFzZPy+UZeE02QXpa/30Qgs4YDFASR2CkUXG/paDNcPtyZx0TvPhEVLMmU
 JoI1crGZEMwB4NESOSX9FHTivr0J0brHP6y/W6FccNKBQg2BF90ZunLdQ0Jh/ujGRuRj
 rmx1L5KW4ym2F3YM8Y6cJkGEbv5or+g7lCBcTbQX9JgXVMSEkTG+A2UydSb+2vU7EzNq
 APXnWkknKdN59kkPODBEG9nYeX3s/OxpANtHsc7h8ypeadeXd0I59INUmSx8VMMssVOk
 c3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431017; x=1748035817;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVF3vRzj16BIxVOrDVzAz6hJgiBEUt5vcCXrSP3D1EE=;
 b=ECoaAOx1znVXaJwIcfnZZ/0wAzcp/607QFMolw4TQ7X40ZxXWKe8WVjW91f7N1GWKV
 qGdX+TX/dOwQbpAZogsZCdkfVHlNiyl26W57rQTApnnKof1UKyhP2WnRS8nw0qRc2mq4
 iml5Mkk2OEhocE2JHhV70Dg8h8HSnuWPjfPEXiD6ck5HVqXHPpHrM+7O9J/jhfkFX4FO
 LA1UrkNHVMgS/TsPgyte14SdZRlSqCuzU31uEKG5KrxhnHHcnautZLREX1m1Y0WAfzYs
 tJwUtvcrfqKmFjGW0oYCHeO70Kd4sEj4iXNvjaqT1I5JcH9hssvBZuK0DtEmJ068PX2M
 bkQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKfVBcdyuaixEiOeq6+UCB1aCvLDEiqvqsTE4b/ECBbIPZJEpO3wMuGN85U8QyDwm8DzraGjgNCFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVkDcKA6qyCc77XB5af2foRMhxs6zI93ncEjADQ7qK9u3krMM3
 ocnvwW2biyn2nsJsPchG/FgBTNnRupEBILuA+ncJRGQcBR+pDIaCnMMjUgPD66Iyw9Dg16nFG8d
 72Ss+4Q==
X-Google-Smtp-Source: AGHT+IHkPYaluTndmSlfUiXGyyaJLXx4X+SBO5Q/4uaYOgx+OJqKuWd6RzYI5mr8azAci2LMYsf58XYaMmI=
X-Received: from pjbtb8.prod.google.com ([2002:a17:90b:53c8:b0:309:f831:28e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56cc:b0:2fe:a8b1:7d8
 with SMTP id 98e67ed59e1d1-30e7d5acb07mr7192751a91.25.1747431016716; Fri, 16
 May 2025 14:30:16 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:32 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-8-seanjc@google.com>
Subject: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to target
 multiple CPUs
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

From: Zheyun Shen <szy0127@sjtu.edu.cn>

Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
common library helpers for both WBINVD and WBNOINVD (KVM will use both).
Put the onus on the caller to check for a non-empty mask to simplify the
SMP=n implementation, e.g. so that it doesn't need to check that the one
and only CPU in the system is present in the mask.

Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
[sean: move to lib, add SMP=n helpers, clarify usage]
Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/smp.h | 12 ++++++++++++
 arch/x86/kvm/x86.c         |  8 +-------
 arch/x86/lib/cache-smp.c   | 12 ++++++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index e08f1ae25401..fe98e021f7f8 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -113,7 +113,9 @@ void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
 void wbinvd_on_all_cpus(void);
+void wbinvd_on_many_cpus(struct cpumask *cpus);
 void wbnoinvd_on_all_cpus(void);
+void wbnoinvd_on_many_cpus(struct cpumask *cpus);
 
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -154,11 +156,21 @@ static inline void wbinvd_on_all_cpus(void)
 	wbinvd();
 }
 
+static inline void wbinvd_on_many_cpus(struct cpumask *cpus)
+{
+	wbinvd();
+}
+
 static inline void wbnoinvd_on_all_cpus(void)
 {
 	wbnoinvd();
 }
 
+static inline void wbnoinvd_on_many_cpus(struct cpumask *cpus)
+{
+	wbnoinvd();
+}
+
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
 {
 	return (struct cpumask *)cpumask_of(0);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b8b72e8dac6e..e00a4b3a0e8c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4981,11 +4981,6 @@ long kvm_arch_dev_ioctl(struct file *filp,
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
@@ -8286,8 +8281,7 @@ static int kvm_emulate_wbinvd_noskip(struct kvm_vcpu *vcpu)
 		int cpu = get_cpu();
 
 		cpumask_set_cpu(cpu, vcpu->arch.wbinvd_dirty_mask);
-		on_each_cpu_mask(vcpu->arch.wbinvd_dirty_mask,
-				wbinvd_ipi, NULL, 1);
+		wbinvd_on_many_cpus(vcpu->arch.wbinvd_dirty_mask);
 		put_cpu();
 		cpumask_clear(vcpu->arch.wbinvd_dirty_mask);
 	} else
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 1789db5d8825..ebbc91b3ac67 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -20,6 +20,12 @@ void wbinvd_on_all_cpus(void)
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
 
+void wbinvd_on_many_cpus(struct cpumask *cpus)
+{
+	on_each_cpu_mask(cpus, __wbinvd, NULL, 1);
+}
+EXPORT_SYMBOL_GPL(wbinvd_on_many_cpus);
+
 static void __wbnoinvd(void *dummy)
 {
 	wbnoinvd();
@@ -30,3 +36,9 @@ void wbnoinvd_on_all_cpus(void)
 	on_each_cpu(__wbnoinvd, NULL, 1);
 }
 EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
+
+void wbnoinvd_on_many_cpus(struct cpumask *cpus)
+{
+	on_each_cpu_mask(cpus, __wbnoinvd, NULL, 1);
+}
+EXPORT_SYMBOL_GPL(wbnoinvd_on_many_cpus);
-- 
2.49.0.1112.g889b7c5bd8-goog

