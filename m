Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FFCF3340
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936B110E3CD;
	Mon,  5 Jan 2026 11:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoHl1enF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D810E3B8;
 Mon,  5 Jan 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767612021; x=1799148021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cic0t42AeThOPO6dMvDUS5iKicDsoffNpi6ophicWCM=;
 b=KoHl1enFC220laRv4Vjbuvy02wydZAZ/FpDbmtltxFfL/1ZzE5Vd1z84
 qt15BvXf1DGQDePANCzyPwiBDJg1qD+9wgQJKBtznlTYYVy+3IquupKCF
 0SeJXCn4GfG+S8YumxolNkh3iZZ3K1oo4ieG3Hw63/yvSccJQb8g5w1dk
 93aNbnPQhvCVBKWbSncnjJ+S5nY8LWMW8xrWXo59QY5zF506g3rlWATa7
 TaRfG768FaRvET2q/wohvwHmRdatMnyAvdCy+RpDsUfWwXhWdclZD84Pu
 KNN2Hq6IuIyU7nDeCi2Zjv29wNLeK5sm30bq3+S58kzDfcOHPzGzz3FSV w==;
X-CSE-ConnectionGUID: +Vy13S/vQU6bHQmNWBUW7w==
X-CSE-MsgGUID: 6l6BuC68QtGTtJ3xWr5qtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80095655"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80095655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:20 -0800
X-CSE-ConnectionGUID: bbmr6DOMROytBadj8K/vmA==
X-CSE-MsgGUID: 2EAz88nITs2PowiotBClyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201996938"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:20:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/5] DONOTMERGE drm/pagemap: Add drm_pagemap_cpages
Date: Mon,  5 Jan 2026 12:18:27 +0100
Message-ID: <20260105111945.73292-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105111945.73292-1-francois.dugast@intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
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

This code was written by Matt Brost. This is a placeholder until his
patch is available.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index db3795f03aca..05e708730132 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -452,6 +452,39 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 	return ret;
 }
 
+/**
+ * drm_pagemap_cpages() - Count collected pages
+ * @migrate_pfn: Array of migrate_pfn entries to account
+ * @npages: Number of entries in @migrate_pfn
+ *
+ * Compute the total number of minimum-sized pages represented by the
+ * collected entries in @migrate_pfn. The total is derived from the
+ * order encoded in each entry.
+ *
+ * Return: Total number of minimum-sized pages.
+ */
+static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
+{
+	unsigned long i, cpages = 0;
+
+	for (i = 0; i < npages;) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		struct folio *folio;
+		unsigned int order = 0;
+
+		if (!page)
+			goto next;
+
+		folio = page_folio(page);
+		order = folio_order(folio);
+		cpages += NR_PAGES(order);
+next:
+		i += NR_PAGES(order);
+	}
+
+	return cpages;
+}
+
 /**
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
@@ -554,7 +587,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 	}
 
-	if (migrate.cpages != npages) {
+	if (migrate.cpages != npages &&
+	    drm_pagemap_cpages(migrate.src, npages) != npages) {
 		/*
 		 * Some pages to migrate. But we want to migrate all or
 		 * nothing. Raced or unknown device pages.
-- 
2.43.0

