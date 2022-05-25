Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D67534343
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F010ECC6;
	Wed, 25 May 2022 18:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C142010ECA7;
 Wed, 25 May 2022 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504244; x=1685040244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y216pxaiK4cJLUh78m98Bd+6ejnPIcP8ScpM76cQObs=;
 b=XnFExhmuEfqcB3IBuU0NMp8ZJS6eSlflJHdCrahqalAFWRQ3z9ejXqPJ
 vXgb4ujZpv5rkrFQK6ivYt33UAI0bBhvtmhm2MDq4CvsxEzUoMptpkDrS
 XzMlGjhNZ+C336vcQ09F822nOWrLffHoBGgJ1jSE2twKgvlj+t+uVj3Jh
 GbpFTUttDwSQMYsr1XHn5usy2TT36q0k6PFvgdjoozHrnDv/fiGtx8WF1
 B/q/jCfiPDy0pJeBa+qxTnxS2f4F4HvW5qMcnATgnyuWH9dmcRmSpzBZk
 SEX9iZjgekA/BwPR/AKUaWC+3dhFKMhBwq4202VqDe7ko7fqDARAqPvZD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274013425"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="274013425"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="578465248"
Received: from daithiby-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:44:02 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/10] drm/i915: remove intel_memory_region avail
Date: Wed, 25 May 2022 19:43:31 +0100
Message-Id: <20220525184337.491763-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220525184337.491763-1-matthew.auld@intel.com>
References: <20220525184337.491763-1-matthew.auld@intel.com>
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
2.34.3

