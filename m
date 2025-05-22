Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79186AC1815
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9B10E75B;
	Thu, 22 May 2025 23:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PYUb2DXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E72310E196
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:45 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30e7c25aedaso5755492a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957065; x=1748561865;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=bZZENoThSq2WPUG3cA9ljTtD8JyVh5aqU2sA4XXQXGM=;
 b=PYUb2DXrTGjKeUbe/6KaWN+3P0oxCBYeSrMvMoIpisbZ0QDTKb8InuwRHwOrG2ZwCJ
 TCsdVqY7hpGMlv4nDHQQjhJjWv7H9V+AjR11GlU9yBztpJu+1d75PYFxBXo9cI+fx0Up
 jVVrJAp1a7fZ7SEogiTTwr0jbuWFlcDEwFEOvrve/1l3E7zBs//KAmH0cykExZSMWlsP
 EGci0wQhO4t8t9oR4Fnvwa149J0UTeM5ID3gtuKaod7Sn0CR/UaIn47jLGwJkT3Q9uaV
 qXTu92MyRfmQUHaVDX1TfSoh0sKlio/o8K2a9UbstSwS9Wfd/YvvHZnDOQ6MzfQM08bp
 rUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957065; x=1748561865;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bZZENoThSq2WPUG3cA9ljTtD8JyVh5aqU2sA4XXQXGM=;
 b=mCO/yNhzQsk4StA73FxZXqZWY3Hzb9Ji3z7ek9LCpiqxwsJTSc6Y6U5kbHFynE7/po
 li33JH1nRoIMfR9Ky5Ef1P7Ie0zDv9wYM5O1bZjmFzZlIueuNwiH+WWJMggoAE4/aswd
 H1LPW7BAWqrrufQofzIAF3de4yuVmqpp8Sw3jHRabm7UoN420trCMX9vYNH2pGp9VQ/t
 qEKgfBKo6gv9MsDnbByWSQ0DMaKHbMsNNdc8Ghg87ZaUrpRTjLMyz3nnbYwdXnlTG2Kn
 I/5kV7ynRF7A1Y1JDBP3pXGu4138dtAy7ynEDpY0PJBdKQI87l2h/MrBssDdLkvxB+eG
 eH1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH3FMyTcyrRcC6g+26v5UyjAzcLlaa7X2yp0i5tGhNb+ktJNPP8tO+ujK/nshJeRXjzfr0VoqQeTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR6ZtJsFfbjdheDMKeIA2xgCV6bvIHwz0kGjmbkclcGZ0bv2Gc
 +Fvi866Gg6sLDn81JO2IWxviJMFoQX1c6lZ2ooJC/WbIN2y/UUfpWzK3CVfYueUb8yKeSzxevHC
 jE3/ACQ==
X-Google-Smtp-Source: AGHT+IFExGJrdJE3NdFkvdN8xCuUi0nMv/3Dpb1wQbh8E9OJ+IjqmD6ZkqC1r2VP7vreaPIjC/XPdl8z9gU=
X-Received: from pjbok18.prod.google.com ([2002:a17:90b:1d52:b0:30e:7f04:f467])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d44e:b0:2ee:d63f:d8f
 with SMTP id 98e67ed59e1d1-310e96c9598mr1434238a91.13.1747957065045; Thu, 22
 May 2025 16:37:45 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:26 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-3-seanjc@google.com>
Subject: [PATCH v3 2/8] x86,
 lib: Drop the unused return value from wbinvd_on_all_cpus()
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

Drop wbinvd_on_all_cpus()'s return value; both the "real" version and the
stub always return '0', and none of the callers check the return.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/smp.h | 5 ++---
 arch/x86/lib/cache-smp.c   | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 0c1c68039d6f..028f126018c9 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -112,7 +112,7 @@ void __noreturn hlt_play_dead(void);
 void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
-int wbinvd_on_all_cpus(void);
+void wbinvd_on_all_cpus(void);
 
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -148,10 +148,9 @@ static inline struct cpumask *cpu_l2c_shared_mask(int cpu)
 
 #else /* !CONFIG_SMP */
 #define wbinvd_on_cpu(cpu)     wbinvd()
-static inline int wbinvd_on_all_cpus(void)
+static inline void wbinvd_on_all_cpus(void)
 {
 	wbinvd();
-	return 0;
 }
 
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 7af743bd3b13..079c3f3cd32c 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -14,9 +14,8 @@ void wbinvd_on_cpu(int cpu)
 }
 EXPORT_SYMBOL(wbinvd_on_cpu);
 
-int wbinvd_on_all_cpus(void)
+void wbinvd_on_all_cpus(void)
 {
 	on_each_cpu(__wbinvd, NULL, 1);
-	return 0;
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
-- 
2.49.0.1151.ga128411c76-goog

