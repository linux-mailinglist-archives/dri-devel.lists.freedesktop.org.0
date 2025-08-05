Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E075B1B6BC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0010E69E;
	Tue,  5 Aug 2025 14:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="XbeJTFrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0F710E69C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:40:08 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76bfd457607so2400203b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404808; x=1755009608;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMzd0+h7TRbahpB9nCOoOzLLufRJqkG+qq6PzuVFVk0=;
 b=XbeJTFrnK2o0KB1zZgUupRVx28CRnqaNdJcJ4UI1nbxwCJCFaL/aJ3eN59ItmnT/CD
 Xqc9/zmATKSud/Gpwu4kePBwUKEGR9hou7h4tDmeJmKXxHaiRm5hVyCP2rWFLZ7YAHUw
 Cp2BUBlGvZnB9g/X9x6g64x9nz7h0fPNuV8sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404808; x=1755009608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMzd0+h7TRbahpB9nCOoOzLLufRJqkG+qq6PzuVFVk0=;
 b=ul/Tnw1B1eB/e83V9IYfz8gCeRbYn6iDAiTEx7inwfmcFvqTezvJ1PIzmEPAROpPIA
 Tk2bsu44ZJIdoK8WLudQZL1R5CU0dboe2xpfh+60BHxT7Wo6RqNXTAuOuRSpOThAR3OO
 e2fpmEtnUhOc1OhHwyUR0fdBebKBwU9eg6ygD4xEEv+JRh6kNawW/iutullEqUhsXI+s
 oip/WdNbinbPULdCcxwRJ+pZs2k/jKHLUOUlOk0e29P41kFdfGapFLwu6hgaPKFYRULJ
 ptKhgOE4JhHPr8H7FuqgDZ4TIGyPRwzwswLokSjgFSRFPcV+7SafK/BbFS3+1inCVx+G
 FNUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhC74kSAAMBSE82dRkoNmghniD435rYyfCUwuw08wsiehAJJFUNkHBoGgsm5GS/jzP60U3l2f2IG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL/TIT7VgJmALQasM7lVrZCig9vUuAcNzYCdPlk4iu1jc/aQeL
 a+o2EEMTz4pBV1qJkrhoaVm8nrpqeE1qOxKE2J1dXIOCemJdCVu0KE7IiKAiUuxrPfU=
X-Gm-Gg: ASbGncspJtrdYf8tpoel2Z07POdD/noqqZZHA4I/vaBTSVCQ4aHa33w5MmW1aDsfC/7
 RTg3/njrWkGcGbVtx9EDKAzFcnPyeePHFBPKkouFrfIvn2jMSedkbDecuTTE8kM5So3DVN1Fj00
 A/NaKXtzq8J4RMeSftaFAkBSG/5W9iAME7ne9CyWyPUXpWnHiwHYsSNIDSaA15W/DJFt5y+M6w4
 p9wdtRvCwxr+oSL7n18w096qcThHqvMXXl+24Ho1GKOYwcaqABuB07wB5cm//PEjqYL3qJLDbAA
 1kc/RsDsleJJx2gjwRx8LoYtPYbCisi/gFI62TTdvuYW3QvZNrY8q2xqNMN86YgNI97NVK7BuaK
 cjGwZS8Df1ezDGK8Lgq5nQQqjy1WbrJM0
X-Google-Smtp-Source: AGHT+IHsUKVobkIG6gy9soJixxmywof0C2OumEiVKRBPYJK5ZfLNqZxyFp3HdA0+e00HJLph3eC2oA==
X-Received: by 2002:a05:6a00:114b:b0:75f:914e:1972 with SMTP id
 d2e1a72fcca58-76bec4b7d16mr15360738b3a.17.1754404808304; 
 Tue, 05 Aug 2025 07:40:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:40:07 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 6/9] drm/i915/display: Remove outdated struct_mutex comments
Date: Tue,  5 Aug 2025 11:39:01 -0300
Message-ID: <20250805143908.32343-7-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch update a comment about struct_mutex in i915/display, in order
to prevent future misunderstandings.

* intel_fbc.c: Removed the statement that intel_fbc->lock is the inner
  lock when overlapping with struct_mutex, since struct_mutex is no
  longer used anywhere in the driver.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index bed2bba20b55..1a0868ed8143 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -96,11 +96,7 @@ struct intel_fbc {
 	struct intel_display *display;
 	const struct intel_fbc_funcs *funcs;
 
-	/*
-	 * This is always the inner lock when overlapping with
-	 * struct_mutex and it's the outer lock when overlapping
-	 * with stolen_lock.
-	 */
+	/* This is always the outer lock when overlapping with stolen_lock */
 	struct mutex lock;
 	unsigned int busy_bits;
 
-- 
2.50.1

