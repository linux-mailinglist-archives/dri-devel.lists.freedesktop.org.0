Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB495CF07
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9221210EB1B;
	Fri, 23 Aug 2024 14:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXehU8uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCB210EB1B;
 Fri, 23 Aug 2024 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724422282; x=1755958282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uSuKvU0/LddDnKxIMqNqH4pZWn7SxQ9SX8UXF6+Z6Lg=;
 b=FXehU8uOZedcTQS54kYUn7vpvJI/ybY5bqACB4DzEP8BSDDE6TuClCHY
 JtKvTRmuQ9IwlidCE9g2djxtrVbXL8DAkLjpcSWmNN4JD1j8xDUol6+3I
 btd982Fn/ALKO2bM+7/JLTgl3EG2mdPKjOX55WB7/C9DvGYRvW3t61nv2
 3UH66nPart8xg7r+rPA9Sg3Im/2C+MDzSM18djvMW87g2Ew1OPpDhLybN
 ePoLWdVvjnyoejyCyXQNW4qtQZr6n7Lm6ewkmewFV9eiVP4/AxDNmMO93
 ZoSWxiF3mL3EfufzVTLquvppQuxHaunQ6xVXsUyUcnSd0jhfE+JqdDxnF g==;
X-CSE-ConnectionGUID: QByqYHItQ5q95wJvg5XzUQ==
X-CSE-MsgGUID: +Hf39VYARFGXG1KZfEK0pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23017808"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23017808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 07:11:21 -0700
X-CSE-ConnectionGUID: NpnNuRCiRl6eiBaZwJPRZA==
X-CSE-MsgGUID: 7Da7QiSCRJCum4up6pW+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66129026"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 07:11:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/ttm: fix kernel-doc typo for @trylock_only
Date: Fri, 23 Aug 2024 17:11:09 +0300
Message-Id: <20240823141110.3431423-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

s/tryock_only/trylock_only/

Fixes: da966b82bf3d ("drm/ttm: Provide a generic LRU walker helper")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_bo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index d1a732d56259..7294dde240fb 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -222,7 +222,7 @@ struct ttm_lru_walk {
 	struct ttm_operation_ctx *ctx;
 	/** @ticket: The struct ww_acquire_ctx if any. */
 	struct ww_acquire_ctx *ticket;
-	/** @tryock_only: Only use trylock for locking. */
+	/** @trylock_only: Only use trylock for locking. */
 	bool trylock_only;
 };
 
-- 
2.39.2

