Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F58D873F4A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1A113441;
	Wed,  6 Mar 2024 18:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kysjfQqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C87113435;
 Wed,  6 Mar 2024 18:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749963; x=1741285963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUyQ5pO3IOMCD5sxD48KJOB2iDqNxvmDhWESgMXjPFE=;
 b=kysjfQqS0eGuLhFomuL0Q8Vvoah/+Pe627T41ETKa+iTL2MBS4GkeLdf
 /WPtzSaPVGz6btZkR+84SRX9Ae58YMRBp041jwaI8Zb9dO+vDKzUszg4E
 5zWEQaVGSackux4/AAP/re3pzHeGeIM+nc69cvKXy3Y5b2u4ecOhZ7eDf
 509E9B2JiNDzhM0zteTMSG9fVlkhIKv4NE2xFpfhYXZIuzhfbT0Cwabgp
 kn3eIbZoq4fRJk9P2E7HT+E6ObX6M4/261ymF1yCVZcLuWKMIgltX3tvk
 gso8UBvQc3bTTdVl7BHfND3ZRYisqIR4Sk8ODQgKPmgW+axpLh2Miec9l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8195772"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8195772"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14496662"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 14/22] drm/suballoc: fix drm_suballoc.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:19 +0200
Message-Id: <36d18b315fd9a6788484667f644b3fea347fb007.1709749576.git.jani.nikula@intel.com>
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

Rename dma_fence to fence to match code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_suballoc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
index c2188bb0b157..7ba72a81a808 100644
--- a/include/drm/drm_suballoc.h
+++ b/include/drm/drm_suballoc.h
@@ -37,7 +37,7 @@ struct drm_suballoc_manager {
  * @manager: The drm_suballoc_manager.
  * @soffset: Start offset.
  * @eoffset: End offset + 1 so that @eoffset - @soffset = size.
- * @dma_fence: The fence protecting the allocation.
+ * @fence: The fence protecting the allocation.
  */
 struct drm_suballoc {
 	struct list_head olist;
-- 
2.39.2

