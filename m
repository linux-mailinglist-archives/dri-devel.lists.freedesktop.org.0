Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452DAC181A
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B00710E793;
	Thu, 22 May 2025 23:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DFVHpesd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF78F10E77B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:51 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-30e9e81d4b0so8163894a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957071; x=1748561871;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=33x8wnTKFUGsCYrD9G+PbnP8XxuzA6yDnz1QlzvR1XE=;
 b=DFVHpesd59fuEkGnir14v+qkGPvPCBfvBkP4YZ+cQwqq6liuOmibfps9qmvKCFVgOd
 No3+NPnJvIKn232nYVeN6yAR4s4LuvGZnC7mEsgqAvKe+7zMX1EoF1OK5vIohU+iN4gm
 LuRluRRWnzstPyn1M0bk+s1TnzZK/ylCEfR+7kwf7iDFnrgjHUAV1U2uUFmgx92ac4Mk
 DzP7SnsTMEwSmSxS8IIIZcfz5Cibd6olJ62n64ygy09HOeseTwRMfgEX+aV4/ZCgE956
 ++5XQEpX8U0Ih/Vwf6sjXwcOkh6KLLC9FUiq7+SMFE5TgocYMXMegjUU3JCen+T+RkkD
 EZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957071; x=1748561871;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33x8wnTKFUGsCYrD9G+PbnP8XxuzA6yDnz1QlzvR1XE=;
 b=IUWsCvzNp5MmaecesBo4r3wZePLD9sR2Hfc9ALGlNmNYicwOnU6fDecIcURyLrb6bU
 TiVZ93gwDy1qPjdBkfaj9DtbNkM5hGGfsAAZ3mOvfcaNYwlsazPdMH5+cz63fJNcVk06
 H+bYKywoJZ3qf1+fhDzKdkT7R1dQscHckFbcnHKSOlBV12fXaypv3HsSyK9FvsuXqnKs
 x6H39z63FncIgNRl78MAn3YNbXl63Lo7dxySMsZ52KL+0no+NFI+Kfn7HUtZ/Of6QQVE
 RWgspA2vdsyYzJC6yugKQfF438/w5FsMdiCma8otGEf+Mv6AJCRKFB8gnApvCg5A3ohx
 KHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq6vdz+ziDAGPf8O5CQIjZ+HuVtECBys+fEe53TJTQkq7euBy8S4eMXnN+ykh+mzIWU/kqDSIkgPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmHCS4/hSYAY5tDiagpvWdvoGP464XqR0WlEQXrhbr22UrloRP
 i+YUGkocukkMbLe8YAtSxRvx/ifyOd7jBGkQ1WYanLE55+d5gPEAoHKDDxYeCA7HbMDbcWezGQW
 5uxIRIg==
X-Google-Smtp-Source: AGHT+IErYR2fX0uqEW1Jt/hDr6m5ozY/eqMBmYEYZGX5WIbNApF2YfAu30cVJqx2+qm/KLiZMSEgVzM0R+8=
X-Received: from pjp15.prod.google.com ([2002:a17:90b:55cf:b0:2ea:5084:5297])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1dd1:b0:2ff:6167:e92d
 with SMTP id 98e67ed59e1d1-30e8323ee6emr34142590a91.32.1747957071505; Thu, 22
 May 2025 16:37:51 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:30 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-7-seanjc@google.com>
Subject: [PATCH v3 6/8] KVM: SVM: Remove wbinvd in sev_vm_destroy()
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

Before sev_vm_destroy() is called, kvm_arch_guest_memory_reclaimed()
has been called for SEV and SEV-ES and kvm_arch_gmem_invalidate()
has been called for SEV-SNP. These functions have already handled
flushing the memory. Therefore, this wbinvd_on_all_cpus() can
simply be dropped.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a7a7dc507336..be70c8401c9b 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2879,12 +2879,6 @@ void sev_vm_destroy(struct kvm *kvm)
 		return;
 	}
 
-	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
-	 */
-	wbinvd_on_all_cpus();
 
 	/*
 	 * if userspace was terminated before unregistering the memory regions
-- 
2.49.0.1151.ga128411c76-goog

