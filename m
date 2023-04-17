Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A56E4560
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFCE10E3FF;
	Mon, 17 Apr 2023 10:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3083610E3F9;
 Mon, 17 Apr 2023 10:39:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso1361038f8f.2; 
 Mon, 17 Apr 2023 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681727946; x=1684319946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cH79Swn8ZRJ2/YarOj91Bz0xxg30p0nVIyjLTbfZHEk=;
 b=YRKjuLMhTl40C+QqFYNyd1bRihczrfYWx/yGU36IRsJfmSPwWm5zftNVBsPia6yv+S
 Zxqe6js3OrRVHvL9eVEwsHAVrpNhJPpvZcA3/CuoUjouJePIvyzvpsD+QqepRoAlloZ/
 0fsrKdoUG/TsMKLWUBTOHqggXyBAQ2C+BlCWcOm9TvmHiaIgIBq5KhCWjFeagOpEmB8d
 1DAQ0WsJbDJw9QEjshxivpMLqq89xEmLpV7P0ecn/QKP2xODoAfG9PcVZbGxJetEzBPJ
 tD5YqlokKpW5QqC7IQ0a6OqDD1KDVY5I3WNXvmUYrxVtT80Kmg/URg+3ZpE9rLMH6zR0
 2NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681727946; x=1684319946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cH79Swn8ZRJ2/YarOj91Bz0xxg30p0nVIyjLTbfZHEk=;
 b=QU0y8E6hlLiFSuuUIcs0v6xoBcXukG8qpEa369wJTm8QkAi4m9bOoWorUfJQAzOYnV
 WnXkU8FgGZto7lfmibeeHar+Cpddz8DE6vzQah9XQf2fEEu/T8QVGE0xOz7svLG3eVDT
 rbX6yxj2j6vpQIZPd1v2eEO5KX9WMuDyiSr9helFE1JBuxMmMT+/4yTH2EFhBKHuxP4Y
 bHuzXlx1OHJqmMJU7JAmOyKgbX8kngRRzeXDXEW0F0DX62+afyDlE1mzIOmarpkipiC+
 G2RcS5YnbSY5BqJUboM0vslvrEEfknTFcWDNQgSry2r8nXVCrCD2DmdCpyNHtM61XUo1
 FJyQ==
X-Gm-Message-State: AAQBX9degkGvY8UuQ50DnfEQQfqFJxPiUm1fTnm8uiG0JPHWHs4N13eP
 cUdf2lKXvEcn+AuvxciBQIM=
X-Google-Smtp-Source: AKy350ZHLsYNFXN5GyVB3dvmvIOZLfVbmy328/EyKvOC+gnAZGSMikYnaDOJgYq7gQ7O8a2gX7ryOA==
X-Received: by 2002:adf:d085:0:b0:2fa:88f2:b04c with SMTP id
 y5-20020adfd085000000b002fa88f2b04cmr1956315wrh.20.1681727945938; 
 Mon, 17 Apr 2023 03:39:05 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-19-108-254.retail.telecomitalia.it. [87.19.108.254])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002c70ce264bfsm10238018wrq.76.2023.04.17.03.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:39:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/i915/gem: Replace kmap() with kmap_local_page()
Date: Mon, 17 Apr 2023 12:38:54 +0200
Message-Id: <20230417103854.23333-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417103854.23333-1-fmdefrancesco@gmail.com>
References: <20230417103854.23333-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
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
Cc: Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmap() s been deprecated in favor of kmap_local_page().

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

Obviously, thread locality implies that the kernel virtual addresses are
only valid in the context of the callers. The kmap_local_page() use in
i915/gem doesn't break the above-mentioned constraint, so it should be
preferred to kmap().

Therefore, replace kmap() with kmap_local_page() in i915/gem and use
memcpy_to_page() where it is possible to avoid the open coding of
mapping + memcpy() + un-mapping.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 6 ++----
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 37d1efcd3ca6..8856a6409e83 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -657,16 +657,14 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
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
index 56279908ed30..5fd9e1ee2340 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -155,7 +155,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	intel_gt_flush_ggtt_writes(to_gt(i915));

 	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-	cpu = kmap(p) + offset_in_page(offset);
+	cpu = kmap_local_page(p) + offset_in_page(offset);
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
 	if (*cpu != (u32)page) {
 		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%lu + %u [0x%lx]) of 0x%x, found 0x%x\n",
@@ -173,7 +173,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 	}
 	*cpu = 0;
 	drm_clflush_virt_range(cpu, sizeof(*cpu));
-	kunmap(p);
+	kunmap_local(cpu);

 out:
 	i915_gem_object_lock(obj, NULL);
@@ -251,7 +251,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		intel_gt_flush_ggtt_writes(to_gt(i915));

 		p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
-		cpu = kmap(p) + offset_in_page(offset);
+		cpu = kmap_local_page(p) + offset_in_page(offset);
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
 		if (*cpu != (u32)page) {
 			pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%lu + %u [0x%lx]) of 0x%x, found 0x%x\n",
@@ -269,7 +269,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 		}
 		*cpu = 0;
 		drm_clflush_virt_range(cpu, sizeof(*cpu));
-		kunmap(p);
+		kunmap_local(cpu);
 		if (err)
 			return err;

--
2.40.0

