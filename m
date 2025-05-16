Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D126ABA522
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08AE10EB94;
	Fri, 16 May 2025 21:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oNhKalo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A952410EB94
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:09 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-231e76f6eafso7835315ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431009; x=1748035809;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=NqEHUZ2TPYAtGToYJi37fXESd2ZGwlNQjgbzr/1LJdY=;
 b=oNhKalo/2+CjTj/Q2n8GnKpatNARaEmruWB6WmZ74KyQ0CqjXdOfGbuUnnGIgo67q1
 f1fDTz59lCE0D1/Jq8TFlK1SIwJgSKIn/ZKjYaqllK5l7Yfjj65AQNxw0g3zGNolXfZn
 2wV3FGkhR2uJb1orSEzxrK0wmbzbTI51mKAkdV1qi1ObQYG0rZEZTb3s7GXOrA5vKxhv
 S4TbkehGNSAF69O80lvVqtLRgLI2/tEjoa+hQHctR+GwpKnJYvAoK3PxcrPrPjoHF/C6
 IFk/hnukpwMBIBoNoBbQCFUL9pb7A/9XWxHuZh0JwTeF44afGk4mgQDolunDWx41lsWa
 dCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431009; x=1748035809;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqEHUZ2TPYAtGToYJi37fXESd2ZGwlNQjgbzr/1LJdY=;
 b=bLuj3T93G7oAbByDH0gUcgPIvOAb8yiGecBPcmukdM/BxP4ocn/dtX5CFi4go+P0un
 CMaZJdqz4t2jf0mi4Brt1XwoeWmv0BzmmdG0hRqkQywmuix/yllxGiqEqvhGMvwsNVqB
 5vIr/UP1zp5yLoMdKXz4WVc676/lxjixf+A7qYM6ShpyKoJu156HMnInXTY612nh78eK
 JISoI6pwXxZIspnjFy0flP1iuDqVYTmRXaRFMyGJJ7EXxJMFEQbegryHzWnOeAh4GJLD
 LPeGF0Nx+EOH9K5ORzlVuhNegaeON0bH+YWphxt8Mk3w7/wCjG3xvCa9Xo28lxZPhztO
 8foA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3AfI+x1l/VOz7ocKIKCN8HyRau90h69Q18sWHIZMxajtn9dOKD/VQiMrsjKPC1jTnh8MqPs06Cz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY0tpUTbHt3VRee07N7P4ZN0Karh0w1WjCgb1S8+r4Nb1p+S5N
 JxhQlKdlXcg7i9GtaXMNjbDfUGWCYBLTpceB6mBDrtW3OenLRcEkakwi3nV33bxGbTrBXfhMbdb
 W3jshRA==
X-Google-Smtp-Source: AGHT+IHTq80VcqezatgmWlMunNaSOj4mkdrzwcQ+8bhQSnlwEViznyKrv/5A/SubVqL2ubXidQVjO6bdruo=
X-Received: from plbp12.prod.google.com ([2002:a17:903:174c:b0:223:52c5:17f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c5:b0:223:faf5:c82
 with SMTP id d9443c01a7336-231de2e6c76mr46558255ad.8.1747431008643; Fri, 16
 May 2025 14:30:08 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:28 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-4-seanjc@google.com>
Subject: [PATCH v2 3/8] x86,
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
2.49.0.1112.g889b7c5bd8-goog

