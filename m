Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C583A8763D8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5351138A8;
	Fri,  8 Mar 2024 11:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0kFX4zY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593231138A5;
 Fri,  8 Mar 2024 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899063; x=1741435063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=apBQzrxYabSZtNDVkTPPvcdYVaeGK2mcjHuAwdYr2Q8=;
 b=A0kFX4zYFeNBsRHKVaJPmjCdmqx1v7JFwoGpb7TTSXuGGUtyYS24rn29
 8B8kxMRWQVeH0xpS1Z11I9Fexx0RgJmJIEVbFl+L5Hz+A6F6/IS4synYT
 fbVYpZR9rN9Cok1lb3mxNxCYQ0wtP0c5glDm62GuXHhaUnMRn73nH2WeM
 QUKbVsa+M56c496jR0GNZdGJbN3Hb6+iL38EgKxX+oyGzJESxog8a5y2p
 h9c7y5sEunhku83sAkZ/NQqPDUAIleGfI+RFx0B/AtH2KSFFwTDr0oNcY
 5Xxcreb9ajIsCsuCJjmD9zRL9cYdVnDYRDdiH+Mik3zahkIktimMaPi6n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794603"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378665"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 14/16] drm/dp_mst: avoid includes in
 drm_dp_mst_topology_internal.h
Date: Fri,  8 Mar 2024 13:55:52 +0200
Message-Id: <83d96b40724e7fd18bec81a9c6c935dbe924da91.1709898638.git.jani.nikula@intel.com>
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

Prefer forward declarations over includes where possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology_internal.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h b/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
index a785ccbfdd73..f41c34e26be2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology_internal.h
@@ -10,7 +10,9 @@
 #ifndef _DRM_DP_MST_HELPER_INTERNAL_H_
 #define _DRM_DP_MST_HELPER_INTERNAL_H_
 
-#include <drm/display/drm_dp_mst_helper.h>
+struct drm_dp_sideband_msg_req_body;
+struct drm_dp_sideband_msg_tx;
+struct drm_printer;
 
 void
 drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
-- 
2.39.2

