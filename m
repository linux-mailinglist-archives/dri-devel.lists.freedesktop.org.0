Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D9AC1816
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0910E73C;
	Thu, 22 May 2025 23:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Es8oFlKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5E10E196
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:37:42 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30e810d6901so5616212a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747957062; x=1748561862;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/GMxUFWnxczBclfWAPbx8KCz76D46/EtIUMIe5GBKE=;
 b=Es8oFlKBB1jIAJrjbq/bOEcD29Sd4VEPzai0/zDwmazcQrAYNsJubAxSqt5MZl3dwV
 xlPp9bCFZCnQrnjwc8GiNaOq0vuoBxMN/RZ0E14kUGX8jS52ssKq4F/pVWMBDWxdXEp2
 0gMBakRbMJvBqQEFya0m8JbhV23LNNF7wmR6GfeQP7GVXTijBOfDSExl6yscL8ab2Vqz
 R84rHkzOaI2S0hZajNW5DH3uSspqJzOqWpYE9qcTDFlbbff4mY/54hNRFVQMBAkZcq61
 hEN+zdYmUwdbZfW6ci8k52IkepXp7sWy4zlUj/9TBsk7AmKY3RdKQuldXFABQfmvMBl5
 M/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747957062; x=1748561862;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/GMxUFWnxczBclfWAPbx8KCz76D46/EtIUMIe5GBKE=;
 b=DPxd2hylvCJTczC6mu9vLCDyyN3Imyp6oHKNPnmM9ZdNDbgII31DlAHuGIBTULHthv
 IHu8Da2UHJNv2woxinfs1GjidThe6PtoM5SKPZUjlTepAloYJcIgcU1FTjIarml9opjw
 bJGauZBUK1KGM5tBoeYxuzAbDhp2d9gD6CxhCPZpAIu7uQfHvU6/6bzY82ox10GjwDyp
 jZhVS+Y+uQDH+WFVy2CzWPGDnNwgqVDguqRsLXqWHm96WiLvn8iUEa0r5f41APAmi/+J
 tN6R5HXEOrQeYhHw7LMS1eVIlTEmYg1NMs9m7UAbTstn+FmB1YDKyMkiQKlibe+57A14
 Kquw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxEIBUtCIaiQ7+P1rnD8Iii3yy7jwLP3361FJY5I5rz5eZZ1LCqnj6KVjLd/aylY0IthoCBSBzE+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQAUQNh3wF6DEBEUhtXj8jlBaTpcYQig1E3dUQlOF9sGOL/9L3
 2dUFAX/iFm+NUDe51sGnkqbujhlHJmDbdLMiJ/L3yu/9K4njYCJeILyVfG4e91ZhoyEEYpDNHB2
 ns7bQ4A==
X-Google-Smtp-Source: AGHT+IHSm7sbPUijyvF+pKq3GN2bRkSA6Knc8QK9FotWZGxL3nppVXhwWnhjgzynzLIZ6YqOyGWjDyGpsjI=
X-Received: from pjbsw4.prod.google.com ([2002:a17:90b:2c84:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5143:b0:310:cf8f:6724
 with SMTP id 98e67ed59e1d1-310e9740405mr1477484a91.30.1747957061777; Thu, 22
 May 2025 16:37:41 -0700 (PDT)
Date: Thu, 22 May 2025 16:37:24 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-1-seanjc@google.com>
Subject: [PATCH v3 0/8] x86, KVM: Optimize SEV cache flushing
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

This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
when doing cached maintenance to prevent data corruption due to C-bit aliasing,
and to reduce the number of cache invalidations by only performing flushes on
CPUs that have entered the relevant VM since the last cache flush.

All of the non-KVM patches are frontloaded and based on v6.15-rc7, so that
they can go through the tip tree (in a stable branch, please :-) ).

v3:
 - Move the non-KVM patches to the front. [Ingo]
 - Add comments to document WBINVD vs. WBNOINVD. [Ingo]
 - Collect acks/reviews. [Ingo, Tom]
 - Rename xx_wbinvd_on_many_cpus() to xx_on_cpus_mask(). [Ingo]
 - Fix a repeated "be" in a comment. [Francesco]

v2:
 - https://lore.kernel.org/all/20250516212833.2544737-1-seanjc@google.com
 - Add a missing -ENOMEM in __sev_guest_init(). [Tom]
 - Collect reviews. [Kai, Tom]
 - Fix stub prototypes. [Zheyun]
 - Kill off dead pr_err() code on DRM's wbinvd_on_all_cpus() usage.

v1: https://lore.kernel.org/all/20250227014858.3244505-1-seanjc@google.com

[1] https://lore.kernel.org/all/20250201000259.3289143-1-kevinloughlin@google.com
[2] https://lore.kernel.org/all/20250128015345.7929-1-szy0127@sjtu.edu.cn

Kevin Loughlin (2):
  x86, lib: Add WBNOINVD helper functions
  KVM: SEV: Prefer WBNOINVD over WBINVD for cache maintenance efficiency

Sean Christopherson (3):
  drm/gpu: Remove dead checks on wbinvd_on_all_cpus()'s return value
  x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
  KVM: x86: Use wbinvd_on_cpu() instead of an open-coded equivalent

Zheyun Shen (3):
  x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
  KVM: SVM: Remove wbinvd in sev_vm_destroy()
  KVM: SVM: Flush cache only on CPUs running SEV guest

 arch/x86/include/asm/smp.h           | 23 +++++++-
 arch/x86/include/asm/special_insns.h | 32 ++++++++++-
 arch/x86/kvm/svm/sev.c               | 85 +++++++++++++++++++---------
 arch/x86/kvm/svm/svm.h               |  1 +
 arch/x86/kvm/x86.c                   | 11 +---
 arch/x86/lib/cache-smp.c             | 26 ++++++++-
 drivers/gpu/drm/drm_cache.c          |  9 +--
 7 files changed, 140 insertions(+), 47 deletions(-)


base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.49.0.1151.ga128411c76-goog

