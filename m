Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7523DAC1814
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F62510E196;
	Thu, 22 May 2025 23:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dtLhPVBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3B10E196
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:46 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30e8425926eso9442605a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957066; x=1748561866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yvw3d371CPvGh9bouzujsmuFtM9ubEnaNp4RJbDym00=;
 b=dtLhPVBVIravjFjWYEJTIiiDTQ3jlbCNsbkDPbbyWtZ3LrfbnpnkdBv+2zQMlouxDy
 WDdwP9PrU8eH+R3h6uDwDOhqVJce1xuTf5j6UXmn18RMo0eERoQo01PGE+jU/YOz5Usr
 D76LOfpH1Jxb13YmXg2dJYJOvwECP7XoKVM1hatnwgcg8XSC4qTDdsJUx/LKAcLViM6U
 CI+bsfr8+DosOg+oOBiMwXh+U42re5cuqzaazBmoldeT600zr3bUhf6/he3WRppBhT1Z
 fU2o1aqsnKdd9hOeVqpgX70Zx53YUrQWBW992QcFB2bc8w2etetZa8cTLwFI7tVW535q
 Q4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957066; x=1748561866;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Yvw3d371CPvGh9bouzujsmuFtM9ubEnaNp4RJbDym00=;
 b=Vl8F0eMW9buDLINj81FYq0O5OjlZDEm0RhF/EBDNLRiWfxwOrCapcTZDqqRtUjck1j
 f32WobU9UGggdeIJ7k7sCFWCn4PCl17iTDS/Ri23jDqSZBc8oy4hbz3UOK8o5jhep0Mi
 gn19Zmj68az39dyX3GJo1HRPkIDjt/Az2xvJJX1fMR7o8sIGIqzg00J70VjoOBvUmDfx
 HIbglLL+/l0SeprcRbHaSY7HuQD3tgZOcmn1vv5e+KWT+nJ/RnLtD8yVTnKmZ8RNyM+u
 9oGC9TtOvuG8jOWZtu4RNTnW2TJP0UOIFgG4lNlFh25+oeaL+fgr2xCkeXv0Bi5xdMqd
 Xtgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxj/ZS269nNZy8VFfxbZWDVgDWcHL6hW+TTsQ8RKafmBhzc1ayAOLoA7lFWquHHWJmWwtc16FU2gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxU5JTLTvKAG9PZw3uf5z6G0Y3R/h4Tg3B98xX5w7h8LXGry0H
 xq9IecGYTY/okxtSzTTVxZ89Os8yOAILKpx9e3YvGv4rxNcX6sHT2GOmRYrXkIH7/+yM9YtWjn3
 lw/AtQA==
X-Google-Smtp-Source: AGHT+IGuDScws7kpg/friq+b634gqXx+BwD3tk0suRuGvu3JjtUiXgJphwYoBlYj4PDUcCLFI+H5bjTOQbU=
X-Received: from pjbsp5.prod.google.com ([2002:a17:90b:52c5:b0:2ff:5516:6add])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d44:b0:30e:7d09:2a7
 with SMTP id 98e67ed59e1d1-30e83107ed7mr42352428a91.14.1747957066514; Thu, 22
 May 2025 16:37:46 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:27 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-4-seanjc@google.com>
Subject: [PATCH v3 3/8] x86, lib: Add WBNOINVD helper functions
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
Content-Transfer-Encoding: quoted-printable
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

In line with WBINVD usage, add WBONINVD helper functions.  Explicitly fall
back to WBINVD (via alternative()) if WBNOINVD isn't supported even though
the instruction itself is backwards compatible (WBNOINVD is WBINVD with an
ignored REP prefix), so that disabling X86_FEATURE_WBNOINVD behaves as one
would expect, e.g. in case there's a hardware issue that affects WBNOINVD.

Opportunsitically add comments explaining the architectural behavior of
WBINVD and WBNOINVD, and to provide hints and pointers to uarch-specific
behavior.

Note, alternative() ensures compatibility with early boot code as needed.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Ingo Molnar <mingo@kernel.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/smp.h           |  6 ++++++
 arch/x86/include/asm/special_insns.h | 32 +++++++++++++++++++++++++++-
 arch/x86/lib/cache-smp.c             | 11 ++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 028f126018c9..e08f1ae25401 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -113,6 +113,7 @@ void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
 void wbinvd_on_all_cpus(void);
+void wbnoinvd_on_all_cpus(void);
=20
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -153,6 +154,11 @@ static inline void wbinvd_on_all_cpus(void)
 	wbinvd();
 }
=20
+static inline void wbnoinvd_on_all_cpus(void)
+{
+	wbnoinvd();
+}
+
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
 {
 	return (struct cpumask *)cpumask_of(0);
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/sp=
ecial_insns.h
index 6266d6b9e0b8..f2240c4ac0ea 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -115,9 +115,39 @@ static inline void wrpkru(u32 pkru)
 }
 #endif
=20
+/*
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, and then invalidate all caches.  Depe=
nding
+ * on the micro-architecture, WBINVD (and WBNOINVD below) may or may not a=
ffect
+ * lower level caches associated with another logical processor that share=
s any
+ * level of this processor=E2=80=99s cache hierarchy.
+ *
+ * Note, AMD CPUs enumerate the behavior or WB{NO}{INVD} with respect to o=
ther
+ * logical, non-originating processors in CPUID 0x8000001D.EAX[N:0].
+ */
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
+ * Write back all modified lines in all levels of cache associated with th=
is
+ * logical processor to main memory, but do NOT explicitly invalidate cach=
es,
+ * i.e. leave all/most cache lines in the hierarchy in non-modified state.
+ */
+static __always_inline void wbnoinvd(void)
+{
+	/*
+	 * Explicitly encode WBINVD if X86_FEATURE_WBNOINVD is unavailable even
+	 * though WBNOINVD is backwards compatible (it's simply WBINVD with an
+	 * ignored REP prefix), to guarantee that WBNOINVD isn't used if it
+	 * needs to be avoided for any reason.  For all supported usage in the
+	 * kernel, WBINVD is functionally a superset of WBNOINVD.
+	 */
+	alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
 }
=20
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
--=20
2.49.0.1151.ga128411c76-goog

