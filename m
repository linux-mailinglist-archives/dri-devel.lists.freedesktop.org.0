Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C483544BE9A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FC76EA83;
	Wed, 10 Nov 2021 10:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A706EA73
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:29:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232489617"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232489617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="732474328"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2021 02:29:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0FDFF155; Wed, 10 Nov 2021 12:29:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm/i915: Replace kernel.h with the necessary
 inclusions
Date: Wed, 10 Nov 2021 12:28:57 +0200
Message-Id: <20211110102857.59604-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/intel-gtt.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index abfefaaf897a..4e5f8e7e25d0 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -6,7 +6,10 @@
 
 #include <linux/agp_backend.h>
 #include <linux/intel-iommu.h>
-#include <linux/kernel.h>
+#include <linux/types.h>
+
+struct pci_dev;
+struct sg_table;
 
 void intel_gtt_get(u64 *gtt_total,
 		   phys_addr_t *mappable_base,
-- 
2.33.0

