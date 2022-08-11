Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87CE590C6C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3482A8FF8;
	Fri, 12 Aug 2022 07:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3256DB438D;
 Thu, 11 Aug 2022 15:30:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z17so21740811wrq.4;
 Thu, 11 Aug 2022 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9LdlmQyOWQmNUkI2XSzFvRVcY0yH+3vXNaOXUWwwOG4=;
 b=eV6FwIVuQpB9dHkFnLwSKjT4FEK0Dhbo6bQOrKzw9FkfJkh5Oa/iuWccmmSpSzWe97
 42QbvmI8RqNNXVaHyDhu7vGFqpBEV+2F2HRrL2nr1elvXGTuS9XooJwD3YJ5E94OV8Tx
 MJkOkq6sZcpSukalpkstesF6L8viUq+OGxS5No+nWxyhPkC1EaMvRFwSnwZhfpx2HNQ6
 pF1bm0WsUfnBUf7xNmroMUFR9I7rg4M+ynn/WE/selpTONdzHKxccsUsCXJBd7xBz8Ap
 l+jAyYMMVg/OTe3TxF5I+9x9UR/flsUnsTz7D297O2Mh2UtG5HB3xzLO8t2t8ayyPy2i
 G22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9LdlmQyOWQmNUkI2XSzFvRVcY0yH+3vXNaOXUWwwOG4=;
 b=pA73LgM4YM5Oqh8yI6USD+boVmryw6n5X3rpLSEcsU4funqyzxS2oN0oeoa+FJM8Ax
 HTOYjuRjmeuoBh5uA+jjlpHwplFNn16Jr/yyW7c/Y1I3fU1REnYjFnZDfp1fK0akysOJ
 t7sMCnK8mG4EhNqwM8XNkiYrOtxMEkSGtc/O2BL4d+3pYQRehmvaP4tqar0QeT8qKsFq
 8E1zERUBYozhXaWn9ijK7bZ+zXKtVFxm/WqwxAOnaPwOih3sXm0enBuTEICEje8I/FPQ
 ooZqY/nletstbQswG/GoGBdpz6I7uAVItAcZMr326fOkCLaPjju/7/2s5JjqcF5lm2gw
 Iu9Q==
X-Gm-Message-State: ACgBeo3KdfpB9IoG6GEQ/5Syn5t+rCInGlV33cxJeTUsy/nurL1vDmyo
 8j0cD8XSfbFdheRMC1zjkc6QEIRNncOT7w==
X-Google-Smtp-Source: AA6agR5M9utedSYDnsS5LO6FAtzaxLGA2AV5HP+vrf8nPzln6D1eAiA97OrCyHA9QEQ+h+6JgnjaQA==
X-Received: by 2002:a5d:5989:0:b0:221:7c34:3943 with SMTP id
 n9-20020a5d5989000000b002217c343943mr15731861wri.441.1660231856621; 
 Thu, 11 Aug 2022 08:30:56 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-27-108-198.retail.telecomitalia.it. [79.27.108.198])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00222ed7ea203sm9805502wrx.100.2022.08.11.08.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:30:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/i915/gem: Replace kmap() with kmap_local_page()
Date: Thu, 11 Aug 2022 17:30:41 +0200
Message-Id: <20220811153041.12795-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811153041.12795-1-fmdefrancesco@gmail.com>
References: <20220811153041.12795-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() is being deprecated in favor of kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead as
mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when the
kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again, the
kernel virtual addresses are restored and are still valid.

Since its use in i915/gem is safe everywhere, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in i915/gem.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 4eed3dd90ba8..2bc6ab9964ff 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -640,16 +640,14 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
 	do {
 		unsigned int len = min_t(typeof(size), size, PAGE_SIZE);
 		struct page *page;
-		void *pgdata, *vaddr;
+		void *pgdata;
 
 		err = aops->write_begin(file, file->f_mapping, offset, len,
 					&page, &pgdata);
 		if (err < 0)
 			goto fail;
 
-		vaddr = kmap(page);
-		memcpy(vaddr, data, len);
-		kunmap(page);
+		memcpy_to_page(page, 0, data, len);
 
 		err = aops->write_end(file, file->f_mapping, offset, len, len,
 				      page, pgdata);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 3ced9948a331..bb25b50b5688 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -153,7 +153,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	intel_gt_flush_ggtt_writes(to_gt(i915));
 
 	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-	cpu = kmap(p) + offset_in_page(offset);
+	cpu = kmap_local_page(p) + offset_in_page(offset);
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
 	if (*cpu != (u32)page) {
 		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -171,7 +171,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	}
 	*cpu = 0;
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
-	kunmap(p);
+	kunmap_local(cpu);
 
 out:
 	i915_gem_object_lock(obj, NULL);
@@ -249,7 +249,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(to_gt(i915));
 
 		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-		cpu = kmap(p) + offset_in_page(offset);
+		cpu = kmap_local_page(p) + offset_in_page(offset);
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 		if (*cpu != (u32)page) {
 			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
@@ -267,7 +267,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		}
 		*cpu = 0;
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
-		kunmap(p);
+		kunmap_local(cpu);
 		if (err)
 			return err;
 
-- 
2.37.1

