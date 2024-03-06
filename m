Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDD873F64
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED8113464;
	Wed,  6 Mar 2024 18:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHihIUZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D77113449;
 Wed,  6 Mar 2024 18:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709750003; x=1741286003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKbryh/hIdqw69rzdjrR5K76MZj3MWweb9WoaiI6YII=;
 b=IHihIUZO7WuwQV/bUtuUICxEdeTMLnYbVFsF+puUpFaiuVw3K0xLB+w3
 gQ3nMnIMI60f1OTrf2WjnDPAhWxHojGDbHUU2FVSJePdz5sD6axi7zYZd
 ArM6IA0iRQTWGu3qAXvIvJIoAqv337bGmNgAhp16npqA1IEfQgOKId9H8
 +CzmBsD6FnQr6iFq0GfjNUXvbWrA6oXVP/mvRPQsNwo66L738bEwyryQW
 etV85XP3zqK0iwREkTcRoflts0jxZzkOB8V5I5rLCdkQnSOmuxabKGsr5
 HSaH8Y5/8q9QHmy4RbpYIP6dlWAsQA/lJMY8ItyKKdYT8wiLiZbOYSgqv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="14958951"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14958951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9927312"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 20/22] drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
Date: Wed,  6 Mar 2024 20:31:25 +0200
Message-Id: <0fa70acd53815bcaf50e22dfd5c40a490dc23d9d.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Fix some formatting errors and excess documentation.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_execbuf_util.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
index 03aca29d3ce4..fac1e3e57ebd 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/include/drm/ttm/ttm_execbuf_util.h
@@ -52,7 +52,7 @@ struct ttm_validate_buffer {
 };
 
 /**
- * function ttm_eu_backoff_reservation
+ * ttm_eu_backoff_reservation
  *
  * @ticket:   ww_acquire_ctx from reserve call
  * @list:     thread private list of ttm_validate_buffer structs.
@@ -64,14 +64,13 @@ void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
 				struct list_head *list);
 
 /**
- * function ttm_eu_reserve_buffers
+ * ttm_eu_reserve_buffers
  *
  * @ticket:  [out] ww_acquire_ctx filled in by call, or NULL if only
  *           non-blocking reserves should be tried.
  * @list:    thread private list of ttm_validate_buffer structs.
  * @intr:    should the wait be interruptible
  * @dups:    [out] optional list of duplicates.
- * @del_lru: true if BOs should be removed from the LRU.
  *
  * Tries to reserve bos pointed to by the list entries for validation.
  * If the function returns 0, all buffers are marked as "unfenced",
@@ -102,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			   struct list_head *dups);
 
 /**
- * function ttm_eu_fence_buffer_objects.
+ * ttm_eu_fence_buffer_objects
  *
  * @ticket:      ww_acquire_ctx from reserve call
  * @list:        thread private list of ttm_validate_buffer structs.
-- 
2.39.2

