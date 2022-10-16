Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1B6002B8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 20:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28A10E840;
	Sun, 16 Oct 2022 18:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64B910E659;
 Sun, 16 Oct 2022 18:09:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a3so15242483wrt.0;
 Sun, 16 Oct 2022 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKbxvFs7idvHnkpYGCCi9EPfdsQNoN5vylEOpYCziO4=;
 b=HNMiFYEP8MVS/aXSpnXOvDvpVc4U0b1DeNUL4mTpjwjXRlCdqzIVEWJfRjuaPWVmEF
 Ny2iLROeymv7JJNx40kvpa4FBTAG6fvUjggzyZDfjYwVjVNwBX4tTk/vs+1NiQMELEix
 UIydb9a85ZKjmX1QssDmIsXamzsWB6Zy3Ta0EmC6QCjWCZsX6R7Nb+hnSadGyxbdgeO4
 kdW3J++u3bcT4ChnwBYZ5qt/wSejvQXew907KeM4TrNae3qeW4GWFW/7BtkA/ZApC3Dj
 /Lcb2B2XsO43dg7Qlm2KM/9Hii3JBTQymbvH8T848CT+xL0bKCkpB2SnK8AkOb+Mp7/9
 mBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKbxvFs7idvHnkpYGCCi9EPfdsQNoN5vylEOpYCziO4=;
 b=FSzkwqnLOtep84pV1qV6AziAH1FzXD0+4VJOuTYiBswllGKSito4lQwa9pEzJonHM9
 J0rORwRepBYZcvSNnGWZLlxKeTxEWZHgbkHs80OV3GdVmenfnJYC528vZ1eSY4hEFjA7
 tvDO1z/z+i8syDTbI5aWp5NNL1zcmE3DTtmPDr2oV9gK33chIbWswcuy0If68WL/ei8w
 0P8XSXzn4eUwzv8m+MGmW4yQiQ4YZUexIVnab+aU1LLiY2hYChN/KLL1Da5DWSj6Bnsp
 rR9qA9kHL/5OJi6iZqPhH+4+OMhCSWunH+Qo8AtHxVe7baFSyz43bZu9GB85SCSBdnOb
 5vog==
X-Gm-Message-State: ACrzQf0rlXZIle4K77AwUUtDLXgnqe04ti43GspWLs1AXPcUPPNC8D+0
 J0+qf7+maBV576x4ojfeKuQ=
X-Google-Smtp-Source: AMsMyM6C/pQ2WxnAnmHbpPN0fARrxQ6Y51yOCm5J2+/TfyPhm4No1WMJ+9QRzvwOuruJvgrdwH2raw==
X-Received: by 2002:a05:6000:178a:b0:22e:d215:4099 with SMTP id
 e10-20020a056000178a00b0022ed2154099mr4281979wrg.79.1665943793302; 
 Sun, 16 Oct 2022 11:09:53 -0700 (PDT)
Received: from localhost.localdomain
 (host-95-250-231-122.retail.telecomitalia.it. [95.250.231.122])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003c6f8d30e40sm156225wmn.31.2022.10.16.11.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 11:09:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org
Subject: [RESEND PATCH 3/3] drm/i915/gem: Replace kmap() with kmap_local_page()
Date: Sun, 16 Oct 2022 20:09:38 +0200
Message-Id: <20221016180938.17403-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016180938.17403-1-fmdefrancesco@gmail.com>
References: <20221016180938.17403-1-fmdefrancesco@gmail.com>
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
Cc: Ira Weiny <ira.weiny@intel.com>, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

Therefore, replace kmap() with kmap_local_page() in i915/gem. Instead of
open-coding local map + memcpy + local unmap, use memcpy_to_page() in a
suited call site.

Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
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

