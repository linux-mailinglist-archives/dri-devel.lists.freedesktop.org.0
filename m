Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276F8AD1E5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D92112C55;
	Mon, 22 Apr 2024 16:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBA25N0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399791128E0;
 Mon, 22 Apr 2024 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713803315; x=1745339315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iI9+fsDttnwDV+Cgw9szBZo3sU8D2AaT2Y2f9mjuGJA=;
 b=GBA25N0FVW3fpyqPyfsEfPVlY+KesFhsi2wneKnvVoiRE5hdDmVK7SoU
 kChDqMUKLs5+fWGYTQD2W2XX69U9B4YNonS9orYqbfYDPI7P4NNcm/WMB
 j1jTRWVoqvcKK3GvV9tiDO+Ed/vTpoSE1SnfBxLXMze4nn7L7qN5ml71Z
 n07jJOat1ezzB/K5l+QNlBtZwt61Yphz0MqIqDjIdVm8UoAe05cXvObHJ
 mHLj9NgX22Hvd67E5bymLCs5iSdipUq1FxkxiaKxq4eWTlQvjn7xBfP4V
 /p/S1bDTrWph97hKMaDyAas7UTH5i6vwjtriEaPhviZyVDtdpiwDtMQDn Q==;
X-CSE-ConnectionGUID: SxGsqgP+RX26ufxGNESzEg==
X-CSE-MsgGUID: 5gPs7n6rST+8QIeX+Y6VyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20046798"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="20046798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:28:34 -0700
X-CSE-ConnectionGUID: yJ3AgElWTeqwxetbOCD1SQ==
X-CSE-MsgGUID: 1sKmmOrQRHuUkEQSQm0XaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24142613"
Received: from unknown (HELO intel.com) ([10.247.119.74])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:28:19 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [CI 1/2] Revert "drm/i915/gt: Do not generate the command streamer
 for all the CCS"
Date: Mon, 22 Apr 2024 18:27:30 +0200
Message-ID: <20240422162731.7046-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422162731.7046-1-andi.shyti@linux.intel.com>
References: <20240422162731.7046-1-andi.shyti@linux.intel.com>
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

This reverts commit ea315f98e5d6d3191b74beb0c3e5fc16081d517c.
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 8c44af1c3451..476651bd0a21 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -874,23 +874,6 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 		info->engine_mask &= ~BIT(GSC0);
 	}
 
-	/*
-	 * Do not create the command streamer for CCS slices beyond the first.
-	 * All the workload submitted to the first engine will be shared among
-	 * all the slices.
-	 *
-	 * Once the user will be allowed to customize the CCS mode, then this
-	 * check needs to be removed.
-	 */
-	if (IS_DG2(gt->i915)) {
-		u8 first_ccs = __ffs(CCS_MASK(gt));
-
-		/* Mask off all the CCS engine */
-		info->engine_mask &= ~GENMASK(CCS3, CCS0);
-		/* Put back in the first CCS engine */
-		info->engine_mask |= BIT(_CCS(first_ccs));
-	}
-
 	return info->engine_mask;
 }
 
-- 
2.43.0

