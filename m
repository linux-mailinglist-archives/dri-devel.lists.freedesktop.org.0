Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66302ABA525
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FA510EB98;
	Fri, 16 May 2025 21:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cBA0phnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D3410EB9A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:15 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-742b01ad1a5so1232810b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431015; x=1748035815;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=7Dga/slcZZ6fKTxbenqYjayajDYVeAnUirYr9Z43Kqg=;
 b=cBA0phnM+frO1U6Pl8SwKqeN/X1BkrM+k/UK/Lahy2Nel2R/d9LLso04y1iChbZNff
 4a8Yx+2h0wgaiNFbKI86HfRA8mv5Bw4GD3k7qsMPnloZOt+n18Y8XZmeK5HEgzecSMf2
 ZtPpgXycsCGpdTABx6CQQavBWStNllZLVo4CnLMWHlMZlTeKNn6kVxqZBbNw0HZO7kng
 6FiQxS22vZPMHQ9eb91br6iikat8uHavixME16ny8F6yZqyyxApV9rfu8IsdAQV0trqJ
 jalYja108Zk9NFvrC0SAPdh9fEuHzVZCPQYcFroI+IH6a+GBVCBPf5fH0l298CzeDiuy
 t/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431015; x=1748035815;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Dga/slcZZ6fKTxbenqYjayajDYVeAnUirYr9Z43Kqg=;
 b=IGQWm1See3nFElBKvBFHX6ByX05EGnjziu3hsZd+RdODTiru4g0CBkAqZQNiDlbZ1Y
 jhyuGaAweLEg8UYA/gNXmB59G1eHFG9NwN1VHdPxZHrSEQaNclMpqza0mnqp/tgkKDJp
 NAAaMvuf16zAajCLchrEAQD9Dbw8jBV0uaMvfq/WitOko34NAsktqHrIgKbD1dvARigd
 G5JlpH4ek+BBP4RYRzMh6ql+9QNYwvXj2GL9yDii/tj11cFGT8ZEOyPLhy3e9hgDoOMI
 HKXR4ol5NolEmlafQxHNwHZ+CKqFhcROYn60Z8hKTGqrRyw1PKzjR3JBgiYOefVyCAxr
 byAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ9YeHBkb6FFNLEzSyWVs/O346dd/tlmsHCahKCmVns8Daiw3zDur50fMV2ubNFWgbWRgp5ZT79CI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDziMaA+les1CboLVBNfCKC675cAjPA/jd5toiulqogkO8mR9u
 tlInLGd3XLj1alfd19MS4bTZO7AxfQLmeG3tCn/IHms0f1GfxtmfIeGrLTDB92YpB4sxvWrhH0j
 DSl1+/Q==
X-Google-Smtp-Source: AGHT+IEmIT1oJ5BehpO/x/61kMltmH/PXqlkOkfjC0VyUyY4O6dvRDZ3QTMaLlJYbCRtNBQEKJ+Vu2+xC7I=
X-Received: from pjbpv17.prod.google.com ([2002:a17:90b:3c91:b0:30c:4b1f:78ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3409:b0:214:f8b1:e385
 with SMTP id adf61e73a8af0-216fb192726mr7093001637.2.1747431015121; Fri, 16
 May 2025 14:30:15 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:31 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-7-seanjc@google.com>
Subject: [PATCH v2 6/8] KVM: x86: Use wbinvd_on_cpu() instead of an open-coded
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

Use wbinvd_on_cpu() to target a single CPU instead of open-coding an
equivalent.  In addition to deduplicating code, this will allow removing
KVM's wbinvd_ipi() once the other usage is gone.

No functional change intended.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f9f798f286ce..b8b72e8dac6e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5009,8 +5009,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		if (kvm_x86_call(has_wbinvd_exit)())
 			cpumask_set_cpu(cpu, vcpu->arch.wbinvd_dirty_mask);
 		else if (vcpu->cpu != -1 && vcpu->cpu != cpu)
-			smp_call_function_single(vcpu->cpu,
-					wbinvd_ipi, NULL, 1);
+			wbinvd_on_cpu(vcpu->cpu);
 	}
 
 	kvm_x86_call(vcpu_load)(vcpu, cpu);
-- 
2.49.0.1112.g889b7c5bd8-goog

