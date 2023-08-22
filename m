Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BEB78403E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1910E32A;
	Tue, 22 Aug 2023 12:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7220510E32D;
 Tue, 22 Aug 2023 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692705732; x=1724241732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UC5RLP3zFIp6p0wMHvcyOWjC1Peksea74OCjlTqooPg=;
 b=nFAwjqBpGdfhI86UxnhSODbE5dQ3o13SEt0CLazmZCSWI4fEhupbGQ9R
 GqlN4RwMRFHmnEbJ+iYoMNdwXv16T+ztfjGqgIm9gHF8FHqEdQFLUMNML
 0NbbMjX6WJqBuYfzAQWbmVn92uXTJh/nU5Pex723KFT0hMUT+RXoJIL1a
 vcb6HlzX6wn5d0m3Ju4cHccprtWu2NEbR1fY6g4LbJXAgahyI9pgShkS+
 7LC+w/buyygNOh4uFOMZ6IYIl3+UA0al1mK3rj7rmZShDPOEX+ntjXmbd
 QV6TuQt8yqmJN7xR5qK+xH2kR3M1VwH17zdyVouz0WGhsC5emeT98L6n7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354198222"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354198222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910070667"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="910070667"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] Revert "drm/amd/display: mark
 amdgpu_dm_connector_funcs_force static"
Date: Tue, 22 Aug 2023 15:01:39 +0300
Message-Id: <64f3580fdb6546c177839e40bf6b223c4549b519.1692705543.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692705543.git.jani.nikula@intel.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit dae343b343ff741d727312b2a9b03d86e64b31c5.

Dependency for reverting the next commit cleanly.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Chao-kai Wang <Stylon.Wang@amd.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Wenchieh Chien <wenchieh.chien@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c7c1260b7b6e..adfe2fcb915c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6317,7 +6317,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 	return 0;
 }
 
-static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
+void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
-- 
2.39.2

