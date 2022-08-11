Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC4590C74
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B09FA907A;
	Fri, 12 Aug 2022 07:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061D62B9EC;
 Thu, 11 Aug 2022 15:30:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l22so21752936wrz.7;
 Thu, 11 Aug 2022 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qZtGOXbRC+1H6SPLMpuq1SgPyHU7zMutv39GohgMBvo=;
 b=kHDbzD7P9eGWeR5QgJz8o1M4lnlOV+24zL4PIkoKaISN137ifaBEtwvYZGOrdPMJ1W
 6cHV0oSmCKFcNNk0vpWxMajyRH6PYZfHGLxbZa6xz0nQ0PXYtFjJjeq4xbJ9n4t/PUbL
 m5WN1x1jV/pmiObU1mVXl4tO198NP8iOeBji/RR6eJUItHUSMiYtAhPQHerKaSrbAzxn
 n7RuZbkyl7A9sc/63XXdJd5sjQkdpw5IakaHG8aepNjjhcwZFSbPg1/73XwhReevGlY8
 71gjrAj4jM4uDDj5iU3EAQ3hK34JOnyjeJLo0cTpTUI0OAWpe36RaEDXeM0oEZJKjmXJ
 UkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qZtGOXbRC+1H6SPLMpuq1SgPyHU7zMutv39GohgMBvo=;
 b=ewRI/9KepZoL5cea8Mgc0qsMmwJo328CZD1BOLlGvw92PuswLk9mTRhG8C90GpCE6P
 RLP5RFK0gFCEndMcuu3TjYq2A17uEga1INam8+foqxbfV4ax3b5XK0OA5DbywpakoYtx
 MwQS89p2ED8cd8MX66rlZi9hHfidqlXTh+1JxM/N4hA1fiuSiCVDLOBDAl1qmVQxryNL
 jDGL0NSrt377Yrkk0+Q/Gz24xVIeHtomr7ZlbJQvUSKogRuhiqofJxUHLGp8z3lM6heY
 NxF+TtLXY09jz5nKpMrawkXN7ZYWzS27v9whi3FswTpnMmqPF61Y/S5iGkDzekcFhl/0
 6eiQ==
X-Gm-Message-State: ACgBeo3Bg/DznQ/eFmHXG9t1G8wv1mWfLkJk5sv8PwtiGDKKydl10MEE
 bS7DIO7aXe2ODgBO8alAdiKyIQvuiVjb8A==
X-Google-Smtp-Source: AA6agR5a9kzgqtDr+SyVjmXoGK7TQ3C9s6/ZzMuJhHCJyK48sU4+XUw9zEtEFNtg3FIup6WEqH0qNg==
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr20771696wrv.367.1660231853386; 
 Thu, 11 Aug 2022 08:30:53 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-27-108-198.retail.telecomitalia.it. [79.27.108.198])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00222ed7ea203sm9805502wrx.100.2022.08.11.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:30:52 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/i915/gt: Replace kmap() with kmap_local_page()
Date: Thu, 11 Aug 2022 17:30:40 +0200
Message-Id: <20220811153041.12795-3-fmdefrancesco@gmail.com>
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

Since its use in i915/gt is safe everywhere, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in i915/gt

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c        | 11 ++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 6ebda3d65086..21d8ce40b897 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -747,7 +747,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -755,7 +755,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}
 
-	kunmap(page);
+	kunmap_local(vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index 402f085f3a02..48edbb8a33e5 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -98,22 +98,19 @@ static int __shmem_rw(struct file *file, loff_t off,
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
@@ -140,11 +137,11 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
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
2.37.1

