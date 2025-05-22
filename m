Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB46AC181E
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65610E782;
	Thu, 22 May 2025 23:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Q1qkcG01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916810E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:48 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30ec5cc994eso4767390a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957068; x=1748561868;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=He1Fb8XWIhOrf7jG2epQVScv14uLcqGVLp5FewijIAc=;
 b=Q1qkcG01XaFYftxJkYIsDLvM6MhbRL0EMASzIA4cyaHAMdtfKCjiJbXdVUA+0SrJ94
 XcrWQ3DNeWgP0lEzX9VUdhrWXi93Wdyo4mxFIkBrVdrTNS6oHtrVTIx7EenXaRyBg7x9
 hafc5m8g3C8dhKtEWpSt34ttRNqWUk2Ty9rWyJVB1PtdkMKstRUlhjOvqNlYaiR4ca4g
 HUyKkiGAZCogFoNO6ZWjSN76QXmENCHI38rGNGdbyhQqk4aN5RHTedXMWmmnwo1KNn/q
 YoXlClasH1kxuVfHdlqGxyCMvpeevgaLyEpA3qX0Vbpdbhaeflk5rYxXoXxhVVsuhls6
 zDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957068; x=1748561868;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=He1Fb8XWIhOrf7jG2epQVScv14uLcqGVLp5FewijIAc=;
 b=tUJPtx16K6HV/cd9p2WpsfNqrV3Vt6729M4hzLmTqqrJxjKnokQ1j/sgtN4F11BAhE
 LGDWikt+hgLEtESUPfdFF592LZGsmtTkaOJHJ9IKo+AyLO/Op9Ci/ZqAr5bnPtp2uZb2
 1RN0T1dGnOoHgnouJ6/0VT1jF8K8BwKDIzJXo2AgKMM1LLySlZuzEhy+u4RzSKfuUlHL
 fgnknjVq5W5+Gu39McBehzQ1k8PP44TqJg7G5Gj3TpuArYHmMDAxpTIcPikfdO+dE7TC
 tIpV4/5r3t5RyOUZnZG+1+D7+86rpjMTpVUbLmQ//R98B98FKcqMVQ0W8f5lJY9dCoko
 B/8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDTHKD7kJ16GvJY7yvVjQxiNd7T6vmfowT6wjkcrlxw49tIZq+ptrj3jTeTWehdiSv/vvDuYuYNPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7I/cTQ4dTFRAh2dNqBGp9d46WOuI0k4J1SSpt1Obm+3BQeeq+
 j8B2Q7jN7qQ8/LnRP54Hgq0AGinFsuqw7r8MjAfvqlnn/8TB3p7T6qePJgnVqZEYmlqn4GYJhe3
 GVjNBBw==
X-Google-Smtp-Source: AGHT+IEY13ev1fFg8g1+XuY0Q3OScdgExPi1jAv5crcNvfE+k43onG6hdR5YtXe6pz4sFc3h4oa0wS9XN+4=
X-Received: from pjbdj5.prod.google.com ([2002:a17:90a:d2c5:b0:310:89bf:401])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5750:b0:30e:3737:7c71
 with SMTP id 98e67ed59e1d1-30e7d57e4e6mr38834925a91.20.1747957068219; Thu, 22
 May 2025 16:37:48 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:28 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-5-seanjc@google.com>
Subject: [PATCH v3 4/8] x86, lib: Add wbinvd and wbnoinvd helpers to target
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
 arch/x86/kvm/x86.c         |  3 +--
 arch/x86/lib/cache-smp.c   | 12 ++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index e08f1ae25401..22bfebe6776d 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -113,7 +113,9 @@ void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
 void wbinvd_on_all_cpus(void);
+void wbinvd_on_cpus_mask(struct cpumask *cpus);
 void wbnoinvd_on_all_cpus(void);
+void wbnoinvd_on_cpus_mask(struct cpumask *cpus);
 
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -154,11 +156,21 @@ static inline void wbinvd_on_all_cpus(void)
 	wbinvd();
 }
 
+static inline void wbinvd_on_cpus_mask(struct cpumask *cpus)
+{
+	wbinvd();
+}
+
 static inline void wbnoinvd_on_all_cpus(void)
 {
 	wbnoinvd();
 }
 
+static inline void wbnoinvd_on_cpus_mask(struct cpumask *cpus)
+{
+	wbnoinvd();
+}
+
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
 {
 	return (struct cpumask *)cpumask_of(0);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index be7bb6d20129..1d0e9180148d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8245,8 +8245,7 @@ static int kvm_emulate_wbinvd_noskip(struct kvm_vcpu *vcpu)
 		int cpu = get_cpu();
 
 		cpumask_set_cpu(cpu, vcpu->arch.wbinvd_dirty_mask);
-		on_each_cpu_mask(vcpu->arch.wbinvd_dirty_mask,
-				wbinvd_ipi, NULL, 1);
+		wbinvd_on_cpus_mask(vcpu->arch.wbinvd_dirty_mask);
 		put_cpu();
 		cpumask_clear(vcpu->arch.wbinvd_dirty_mask);
 	} else
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 1789db5d8825..b45e8baa69bb 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -20,6 +20,12 @@ void wbinvd_on_all_cpus(void)
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
 
+void wbinvd_on_cpus_mask(struct cpumask *cpus)
+{
+	on_each_cpu_mask(cpus, __wbinvd, NULL, 1);
+}
+EXPORT_SYMBOL_GPL(wbinvd_on_cpus_mask);
+
 static void __wbnoinvd(void *dummy)
 {
 	wbnoinvd();
@@ -30,3 +36,9 @@ void wbnoinvd_on_all_cpus(void)
 	on_each_cpu(__wbnoinvd, NULL, 1);
 }
 EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
+
+void wbnoinvd_on_cpus_mask(struct cpumask *cpus)
+{
+	on_each_cpu_mask(cpus, __wbnoinvd, NULL, 1);
+}
+EXPORT_SYMBOL_GPL(wbnoinvd_on_cpus_mask);
-- 
2.49.0.1151.ga128411c76-goog

