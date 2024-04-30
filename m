Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02B8B7942
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477B210FD4B;
	Tue, 30 Apr 2024 14:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eVglpUVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06F510FD4B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714487191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KnvrZTG0/X0R3PBgtkl4Zl37CNPB6PZe0MtJNdL6D10=;
 b=eVglpUVFGmYGwsHfTuQpGWLh6TIhHfxzMpZ/nJgO0MnLr25F9rXP3Bj6j7J0Gh+yvF8GTa
 vdJ9DBHqRwnC3Lojh5rO1xuZG55gqdDmvA3l+MtZEHij6QJjR5OiK0ZytVGIXxJ7Oa5XE1
 2GIOvs4TQ8rEdJIy61T9UfkBCg/yEms=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-CZvFrtZgNLGDwmQ4zJ-Kfw-1; Tue, 30 Apr 2024 10:26:30 -0400
X-MC-Unique: CZvFrtZgNLGDwmQ4zJ-Kfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4167351545cso40955205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714487189; x=1715091989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnvrZTG0/X0R3PBgtkl4Zl37CNPB6PZe0MtJNdL6D10=;
 b=kbEepklQ/X5tQH4k4AEpZA4v5qmI6+JMmblk9/rsooGfHXsSsVt9cipG9amjY2K9MU
 MOL3p4/4vMAWlBmXS3lX3iueO5B5yiQrlVTiwfbaf+T6sl9erKBFmw3oMVKBtLiQ2C7l
 ulLHUavi3JFnd5iMVzzLAwkAKaEMfFcC1vwkQl+UflJXAin6tCW08UyxYswljEXTQL8m
 Yg/xFqzN6U0nAga2YZdmbdzjiPgv67HmXpwIcmfgk9RJ5TuxAxqVY9E4KJpin5qkSnKf
 s6PaxipqxZqFhObFQ46tQOybWtGWfIUsWHCU1wJ/33P1KPq3zLB0CPQpNZJOpeVi3F0I
 qn5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3gDwu6UJHp01q0TsyO2lLh0Mhyk5b665cIX9I8wggYchj1b1uUuNc2ZDClZcTkg37remMkZjjqe7rU7imJzYnAzOFzpB9FIK9gLDhy0x2
X-Gm-Message-State: AOJu0YypOTSZATO6DIImAGaGFScD687oD7sn4SVuGPEOVQKCXAE5IXh4
 yPy3iCACkCCA022yDazu0wpa5KLue6PsOGDZKcJ+wQiqFmOzZ9h15FNfXtSMnKRYUUUQgR+vjtL
 mtyv87xyvJsZeTAt5CSkn8JRu+IDT3VmOSptfv2IOorIw+hRASRHL1Z5f6adIjBVeiA==
X-Received: by 2002:a05:600c:4e46:b0:41b:edf4:4071 with SMTP id
 e6-20020a05600c4e4600b0041bedf44071mr10013612wmq.35.1714487189148; 
 Tue, 30 Apr 2024 07:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtFbev/ePbfgmQzft54mnoSzbUNwk/XosW/aRQ3cbusOT2RWO8A73SbLsJNP2G1dCeiqkCSw==
X-Received: by 2002:a05:600c:4e46:b0:41b:edf4:4071 with SMTP id
 e6-20020a05600c4e4600b0041bedf44071mr10013582wmq.35.1714487188763; 
 Tue, 30 Apr 2024 07:26:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b0041c7ac6b0ffsm4952855wmb.37.2024.04.30.07.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:26:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, lyude@redhat.com,
 andrzej.hajda@intel.com, lucas.demarchi@intel.com,
 alexander.deucher@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/i915: fix missing linux/debugfs.h includes
Date: Tue, 30 Apr 2024 16:25:52 +0200
Message-ID: <20240430142622.217616-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

After dropping linux/debugfs.h include from drm/drm_print.h the following
files in i915 miss the linux/debugfs.h include: i915_debugfs.c,
i915_debugfs_params.c and i915_gpu_error.c.

Add the include to fix the corresponding build errors.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 33d5ae6cacf4 ("drm/print: drop include debugfs.h and include where needed")
Closes: https://lore.kernel.org/oe-kbuild-all/202404260726.nyGuvl59-lkp@intel.com/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c        | 1 +
 drivers/gpu/drm/i915/i915_debugfs_params.c | 1 +
 drivers/gpu/drm/i915/i915_gpu_error.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 24c78873b3cf..b552e27cdcd5 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -26,6 +26,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/string_helpers.h>
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 8bca02025e09..295486b8ceb1 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -3,6 +3,7 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 
 #include "i915_debugfs_params.h"
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 2594eb10c559..625b3c024540 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -28,6 +28,7 @@
  */
 
 #include <linux/ascii85.h>
+#include <linux/debugfs.h>
 #include <linux/highmem.h>
 #include <linux/nmi.h>
 #include <linux/pagevec.h>

base-commit: 4a9a567ab101e659a4fafb7a691ff6b84531a10a
-- 
2.44.0

