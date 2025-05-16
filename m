Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A81ABA51F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DBA10E298;
	Fri, 16 May 2025 21:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="enltfvD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C7E10E298
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:03 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7420109e56dso2117686b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431003; x=1748035803;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16vfcjowGUMTa5d9+ULCqQIsoViPLGh6MjBdiOthySQ=;
 b=enltfvD+K1uiOGiOfWA2HRFxAmjOPL3asM0aQ/HGTnSLyLDwsE4P2biakaW3TY1+1h
 LxujnT5Zq7CABQW0pH1yUkh2ROQqR3WSjxNaCe2P56w4SUu8PMGpb6dzygTZPDaYUyQ+
 LgZKeyPOrf2cHtHZKp1zapKcYU5ue7Keap6bOoBizb+zW7KfF8W58eiEYIdsQlFle3De
 ywmgkMXe5L1oTZMxwS2DfCL/57tY+AZWQk8uz36YoxUoJECZ9bf2k3XDY96ztKCkFft5
 9IBLWghAljks3Yckj2O111g17eFdM1FcssgO8AQNRwHnG1yPn6UXCFxqYvwg85D4Ez2r
 1f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431003; x=1748035803;
 h=cc:to:from:subject:message-id:mime-version:date:reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=16vfcjowGUMTa5d9+ULCqQIsoViPLGh6MjBdiOthySQ=;
 b=dVvBViFEj+gHts5ri/k03khERf3DUocD/tVMQmqG4ioVPEfYRbAeStSODVhlVb02j+
 8aNxde2+ZV8KMXHEZRb4XlgoC+M7Di4baWOEk01AQo3GbpTeLYQCWRGxSJAoeJ6Mqxm/
 SoiFoL4NiHf949+woSBAsUQHprxvYQpCy7GzWiv5IJ0V59z9YnvQ3Pnr/vGHoGxJpjt2
 lG7dB8w+GTxD1idqDCMWOOYSy5shBDJQX5mCZU0Mg+GCszBazqRaZeEOn+vVqVA1oIO8
 uOg2FREmT+dXitnx49VIui/ICVa9E+7RpRhy1jgE0upiSrNx3jZWw+7oouMyeKDl3u65
 oW3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2bKxsCvDQJbTgaO9UQdkUHj6KYgazZYi/Lws8Kc5zFGKytYizgFAcSv7S2/9ho6uASDvTKQY0epM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfEhKipiCcAfWhpGVlO0+0Sy8C5eC7X4Di4K7I8QvpLBEW8Evx
 aL4GxWiiTLMRzzgPGJwkaQQtLUFsRuJai+dVQTQtH6cDsLB0UVSfw2kYOcJIA4vDt78zdoLHNNn
 CNDi4oA==
X-Google-Smtp-Source: AGHT+IHAOqNtgLvjhczBzscm3RgIFYldzuw2M2zw628mwDpHkkpQXjnCtK0C58qctj3mP1IxalTn5fBd2FM=
X-Received: from pfbjt23.prod.google.com
 ([2002:a05:6a00:91d7:b0:736:38af:afeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:894:b0:736:4ebd:e5a
 with SMTP id d2e1a72fcca58-742a98b4e97mr6495370b3a.20.1747431003224; Fri, 16
 May 2025 14:30:03 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:25 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-1-seanjc@google.com>
Subject: [PATCH v2 0/8] x86, KVM: Optimize SEV cache flushing
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

This is the combination of Kevin's WBNOINVD series[1] with Zheyun's targeted
flushing series[2].  The combined goal is to use WBNOINVD instead of WBINVD
when doing cached maintenance to prevent data corruption due to C-bit aliasing,
and to reduce the number of cache invalidations by only performing flushes on
CPUs that have entered the relevant VM since the last cache flush.

Assuming I get the appropate acks (and that I didn't manage to break anything
when rebasing), my plan is to take this through the kvm-x86 tree in the 6.17
timeframe.

v2:
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
  KVM: SVM: Remove wbinvd in sev_vm_destroy()
  x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
  KVM: SVM: Flush cache only on CPUs running SEV guest

 arch/x86/include/asm/smp.h           | 23 ++++++--
 arch/x86/include/asm/special_insns.h | 19 ++++++-
 arch/x86/kvm/svm/sev.c               | 81 +++++++++++++++++++---------
 arch/x86/kvm/svm/svm.h               |  1 +
 arch/x86/kvm/x86.c                   | 11 +---
 arch/x86/lib/cache-smp.c             | 26 ++++++++-
 drivers/gpu/drm/drm_cache.c          |  9 ++--
 7 files changed, 125 insertions(+), 45 deletions(-)


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1112.g889b7c5bd8-goog

