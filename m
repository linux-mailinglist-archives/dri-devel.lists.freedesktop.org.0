Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526FABA524
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5FC10EB97;
	Fri, 16 May 2025 21:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KEW2WLS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
 [209.85.215.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D110EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:11 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-af9564001cbso1637804a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431011; x=1748035811;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=XXHpJVmCrSZ9FxACIyOchlyq3sCWnKzqZMy4NYSrXEo=;
 b=KEW2WLS3o2aP+v19kM2bPhPB+04ZycrlrZd3iD2lB5RAZdZbzF5j072+q2b4OKQZdA
 og0SciyVUk7U7bs52j+12Q4sWy+Ew9hgsP5IKlyk58ZrG43StlM/dcStIkvhDVm5xbRg
 MoeVfS3HwkINDaqPheVy+n8VAYAr5RoZ5KtRCqm8y5of7MqlfEWFYsY+YDucefHxf/IB
 1OsnvOuBcM/EKKC/+MUAUE84fKMkX0hU6bMFyjTNVYb8MXBdsLZouPUaPhFLbjxfvDQy
 WQl7Mxx9Si/LGOP0jx6H9nWs9JTbmmHV5zfzEXHsRgvedsYQjib96/WJfk3gvanlbWzy
 L0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431011; x=1748035811;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XXHpJVmCrSZ9FxACIyOchlyq3sCWnKzqZMy4NYSrXEo=;
 b=iIncWI7ovu32RX9GES43SIy+UsNN9F7WAF86ImlUpI0Fc/96T1dZaKwaoONyUE1vdd
 q0d1bJ7TE3Zf3p3FeCI6hjWKjLReZwxm1ZH5SLfnm5emOvFbd8MLOdfG3v82TeQfQMgP
 C1QbPHkzp4D9INZbllahEmf57A3SSb3GhyQC3S0e8RNJv7Zte3mikh/0bsqRQqXGJ5f2
 YbVTo4zSmYC/3N+HVfWXIMqY+NQI3j41uRugnqLYn5cZYSbJfyX1glR4nNTMo3hGHoLs
 uV11or8AgC5pGC3o8Ex56XAmv0eLyVpQ9nDSzlMN0PxLMfXCwVZ9Y8RsKYOOlF0WLuvJ
 vL9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI1amnjhVX/AB1eaOFsQK2FQzJcQMVVNax/rx3u/8xBvXHk4VeQE9PLxQka9Gmp5oQxeOAcjzWMp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqYUU3hwf+2Su+tyFziENtQ5sIlcW899cEGxtSHj8iYUhwPKoz
 6hYCSu6wr5LHEa+WI79iHeX92MCd1HtN7+hyD1BjZuP3XLy2q2UsT1q4+DJKaslNLWSPCyHJmDQ
 CTV1YQg==
X-Google-Smtp-Source: AGHT+IEeTLUSaLphMvwH3ICiNx6NcrDzw6LvXIQfL11JWb1+SBH0kSl8HCWC4BRH4JIZt1VlaecUPLeiPHQ=
X-Received: from pjb12.prod.google.com ([2002:a17:90b:2f0c:b0:30a:a05c:6e7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2644:b0:309:e195:59d4
 with SMTP id 98e67ed59e1d1-30e7d52b166mr9407454a91.12.1747431010844; Fri, 16
 May 2025 14:30:10 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:29 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-5-seanjc@google.com>
Subject: [PATCH v2 4/8] x86, lib: Add WBNOINVD helper functions
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

In line with WBINVD usage, add WBONINVD helper functions.  Fall back to
WBINVD (via alternative()) if WBNOINVD isn't supported, as WBINVD provides
a superset of functionality, just more slowly.

Note, alternative() ensures compatibility with early boot code as needed.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
[sean: massage changelog and comments, use ASM_WBNOINVD and _ASM_BYTES]
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/smp.h           |  6 ++++++
 arch/x86/include/asm/special_insns.h | 19 ++++++++++++++++++-
 arch/x86/lib/cache-smp.c             | 11 +++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 028f126018c9..e08f1ae25401 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -113,6 +113,7 @@ void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
 void wbinvd_on_all_cpus(void);
+void wbnoinvd_on_all_cpus(void);
 
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -153,6 +154,11 @@ static inline void wbinvd_on_all_cpus(void)
 	wbinvd();
 }
 
+static inline void wbnoinvd_on_all_cpus(void)
+{
+	wbnoinvd();
+}
+
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
 {
 	return (struct cpumask *)cpumask_of(0);
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index 6266d6b9e0b8..46b3961e3e4b 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -117,7 +117,24 @@ static inline void wrpkru(u32 pkru)
 
 static __always_inline void wbinvd(void)
 {
-	asm volatile("wbinvd": : :"memory");
+	asm volatile("wbinvd" : : : "memory");
+}
+
+/* Instruction encoding provided for binutils backwards compatibility. */
+#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
+
+/*
+ * Cheaper version of wbinvd(). Call when caches need to be written back but
+ * not invalidated.
+ */
+static __always_inline void wbnoinvd(void)
+{
+	/*
+	 * If WBNOINVD is unavailable, fall back to the compatible but
+	 * more destructive WBINVD (which still writes the caches back
+	 * but also invalidates them).
+	 */
+	alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
 }
 
 static inline unsigned long __read_cr4(void)
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 079c3f3cd32c..1789db5d8825 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -19,3 +19,14 @@ void wbinvd_on_all_cpus(void)
 	on_each_cpu(__wbinvd, NULL, 1);
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
+
+static void __wbnoinvd(void *dummy)
+{
+	wbnoinvd();
+}
+
+void wbnoinvd_on_all_cpus(void)
+{
+	on_each_cpu(__wbnoinvd, NULL, 1);
+}
+EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
-- 
2.49.0.1112.g889b7c5bd8-goog

