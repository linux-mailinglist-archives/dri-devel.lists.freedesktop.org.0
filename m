Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24226E4563
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB0E10E3FC;
	Mon, 17 Apr 2023 10:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9F410E3F9;
 Mon, 17 Apr 2023 10:39:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso2000813wms.4; 
 Mon, 17 Apr 2023 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681727944; x=1684319944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAW7sB6+Z5ZOltjkFBMt2NbhGjStc/CgCoci8oN9nks=;
 b=lk90wuKk7kR9IX6uMik68yOAyW5/zZmQWcphsp7dCp9z3gtp/owgQL9h2aAbLKBZl4
 fCT8G5zvkCrwE8UQwr3TI2qV7TEBSeuZSe9ChabtOXCucPLOySit4w+Ukcnt1MR6xcJD
 RBcU0cLyIawG1B8WldS9XwJKzvAn1uvF3XJQUQD4rxY6QsnOGA8yokADx7cMlcSkaxFs
 5+cWcTxbRQ//yFlyW01nwMQQHtlmblF6pwjWClW/urNU4TC+6JZnbE5L8Bg4kfHflzxL
 /4UrOEAQM7KKog1/7dO7jGRKmFaB5tY3maCKiDRQFq5G039Z4m4zDMRjCuuJMMI16nKs
 eHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681727944; x=1684319944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAW7sB6+Z5ZOltjkFBMt2NbhGjStc/CgCoci8oN9nks=;
 b=LEaif8lI7lzBo4o5EVUxTFKfCplzJ081X2qKqr9/eNXBF5rpSyPAsE665KKsEqrUAX
 yYP+wW0pXkRzQfan8+z+nVvjWb7A67nJDeELWR/s8P09CuTWQn7w0R+I2/dMzSn1muwy
 xyUFBTFDwVP0cHAURN9mTsqJCryMFdoKJEjkVKv5267QmSqosfXPkrGWzU2iWDBO9ODj
 k8LUkCftrOObPdCMlLfv8ctQapIE3egoROZlPvFc3T9xcpJaY6K2VrDHZY2ImxJ8txCA
 +pFm4MzLg2Gug1jS3ts1Phe3+eY56MER6BsqzOZpq4FMpz1/UpBT7Dx/mAQcvesN4V6m
 FmfA==
X-Gm-Message-State: AAQBX9f3J0PoJdKcob2wekRx1kKOxVn9SzmilZomRueXYWxGNpvo8q3D
 kksYf+EjctnmrhRo/ZzQhOE=
X-Google-Smtp-Source: AKy350bqJ/bHsDjtLWvuVfbc6Uq/QInCoRKCm+KLyl/hHEccIaE3q+1++wO1znNLhcQOGVkqIM5BVw==
X-Received: by 2002:a05:600c:4f46:b0:3f1:7443:6d6e with SMTP id
 m6-20020a05600c4f4600b003f174436d6emr1590807wmq.19.1681727943960; 
 Mon, 17 Apr 2023 03:39:03 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-19-108-254.retail.telecomitalia.it. [87.19.108.254])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002c70ce264bfsm10238018wrq.76.2023.04.17.03.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:39:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/i915/gt: Replace kmap() with kmap_local_page()
Date: Mon, 17 Apr 2023 12:38:53 +0200
Message-Id: <20230417103854.23333-3-fmdefrancesco@gmail.com>
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
only valid in the context of the callers. The use of kmap_local_page() in
i915/gt doesn't break the above-mentioned constraint, so it should be
preferred to kmap().

Therefore, replace kmap() with kmap_local_page() in i915/gt.

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c        | 11 ++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 37d0b0fe791d..89295c6921d6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -749,7 +749,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;

-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);

 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -757,7 +757,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}

-	kunmap(page);
+	kunmap_local(vaddr);
 }

 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 449c9ed44382..be809839a241 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -101,22 +101,19 @@ static int __shmem_rw(struct file *file, loff_t off,
 		unsigned int this =
 			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
 		struct page *page;
-		void *vaddr;

 		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
 						   GFP_KERNEL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);

-		vaddr = kmap(page);
 		if (write) {
-			memcpy(vaddr + offset_in_page(off), ptr, this);
+			memcpy_to_page(page, offset_in_page(off), ptr, this);
 			set_page_dirty(page);
 		} else {
-			memcpy(ptr, vaddr + offset_in_page(off), this);
+			memcpy_from_page(ptr, page, offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
 		put_page(page);

 		len -= this;
@@ -143,11 +140,11 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
 		if (IS_ERR(page))
 			return PTR_ERR(page);

-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
 				    this);
 		mark_page_accessed(page);
-		kunmap(page);
+		kunmap_local(vaddr);
 		put_page(page);

 		len -= this;
--
2.40.0

