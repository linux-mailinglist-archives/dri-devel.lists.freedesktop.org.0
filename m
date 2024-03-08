Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BF8763CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5549A11389B;
	Fri,  8 Mar 2024 11:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/WBDm6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B1111389B;
 Fri,  8 Mar 2024 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899043; x=1741435043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IIXti1MkTqvTVA94CoqBqdartGD2UQ8jqU4O6AEfrYw=;
 b=i/WBDm6UfnIVImxUOEMfw+zE3kbqbElJpDRTKSE2MAE2XXEJksBQbeCH
 AOh6lKIcW89mQOnD2kHHTGvERuSnPRdgJ4S73vrq+zkGJZbHMvt22U1Qf
 QWlGyPj62X9eO2fJiVXqLDQHL99RU8XNKLZrP11wHj/H5oqap6jfi2B4P
 FwvMGpKagWI1kPPUnYNY8smeh1M79gyM85xBO49t+MajKd4ZQFhDFcL0x
 blqcts5PLQ/oleNaq8Yi2zFAhG1RBte0228ACNH+JZAI8xZ0wk6xGbZeN
 isGeup3H5SS0zd9HI6GzOm8TSjCPjprDeLQuHAu6AMTjwlVYqe8jeLLQ7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794572"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378601"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v2 11/16] drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
Date: Fri,  8 Mar 2024 13:55:49 +0200
Message-Id: <b0f6d243c4e5eb1564ef2f4bb5bb834ee2c0305b.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

