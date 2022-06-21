Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50C553009
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094CE10F9F8;
	Tue, 21 Jun 2022 10:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03A10FA5D;
 Tue, 21 Jun 2022 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808402; x=1687344402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ErKb+5nswO11npB7mIH/K/2A00HYCX+pE3E4iwkK6Tc=;
 b=nxf4swz+AUAy6eeguOYqfMuHD7aTvq9MljJrMHY1sfNS9IFcIhFc2zgI
 P/5Iwn8XZqsWXI3hoWKqT8RWDkXW90lefcSQ5bh/IzkxPd4SP/oLelUSF
 bIFMu4lkHEG9fKHw29fy5SOyEWdcLxX7kH8ox/KWB+5PNgWewFZMyfble
 xIlIQK6vgUX2Z0tUhxKEIoGOvwjpOQOLRZExUMVVoOhXlqxFm/Bx/YIzW
 m0NBQYh1RObHRlHkak6StYVz43jEKF9y0458WMJFd2+VWlijTiqhI3GO7
 JLY/ZBo3mNBpSYiqBj5sSr6eLGay3rKEUvKB4g3w/Ma4NYG5KyM6YOnVS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121932"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121932"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327073"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/12] drm/i915: remove intel_memory_region avail
Date: Tue, 21 Jun 2022 11:44:26 +0100
Message-Id: <20220621104434.190962-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No longer used.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 4 +---
 drivers/gpu/drm/i915/intel_memory_region.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 94ee26e99549..9a4a7fb55582 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -198,8 +198,7 @@ void intel_memory_region_debug(struct intel_memory_region *mr,
 	if (mr->region_private)
 		ttm_resource_manager_debug(mr->region_private, printer);
 	else
-		drm_printf(printer, "total:%pa, available:%pa bytes\n",
-			   &mr->total, &mr->avail);
+		drm_printf(printer, "total:%pa bytes\n", &mr->total);
 }
 
 static int intel_memory_region_memtest(struct intel_memory_region *mem,
@@ -242,7 +241,6 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	mem->min_page_size = min_page_size;
 	mem->ops = ops;
 	mem->total = size;
-	mem->avail = mem->total;
 	mem->type = type;
 	mem->instance = instance;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 2214f251bec3..2953ed5c3248 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -75,7 +75,6 @@ struct intel_memory_region {
 	resource_size_t io_size;
 	resource_size_t min_page_size;
 	resource_size_t total;
-	resource_size_t avail;
 
 	u16 type;
 	u16 instance;
-- 
2.36.1

