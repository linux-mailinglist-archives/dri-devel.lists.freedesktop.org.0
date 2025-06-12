Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A73AD70B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C00910E803;
	Thu, 12 Jun 2025 12:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIUDWQpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BAF10E803;
 Thu, 12 Jun 2025 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749732389; x=1781268389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gb8KCXL5ftr+nRXPftTSwsFDcFq7LpB45MjM9jxvW6M=;
 b=UIUDWQpoJdl47Ho2W/8TryNfCoLgwwKOpln5/NDTDYeNUmPASsuS6pHY
 6AqYzUiaROf/2XmiDXkNQmtI8P/tuYRJP0A9OlaQ4wPEkxX7VSTnjqcry
 AzN6T976Eti2E3Yg5qhC8As+BVD6LD9fOxiiaLxfxCzRTzRrTAXX6TYoK
 Upem1BRuG+H8X+FZJjOl4/fN2Bm5nYFhI59ivTXXHsx1z5lxfQ/DyOwzN
 tmBAhNJ+jOMLWvAO7ks28KvjZCmdcpwqWteIYs2yx72VhpLM44A5a8QdG
 6AQA5L+Cw3oujIqa6lANrmdMjre7o1/Gwd9ayu/wWDn2a41vF/ZvpGknu A==;
X-CSE-ConnectionGUID: 43e04qvRT+ynKP0+xdj3rA==
X-CSE-MsgGUID: bSE8QZu3T+igXP99DAxsdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63254560"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63254560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:46:23 -0700
X-CSE-ConnectionGUID: fboF2MJtQEy+HZ2cqdngrA==
X-CSE-MsgGUID: 6NyVFhzVS4S1htx9L0aTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152423779"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:46:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH] drm/i915/panel: make panel funcs static
Date: Thu, 12 Jun 2025 15:46:17 +0300
Message-Id: <20250612124617.626958-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

The drm panel funcs should be static, fix it.

Fixes: 3fdd5bfbd638 ("drm/i915/panel: register drm_panel and call prepare/unprepare for ICL+ DSI")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index f956919dc648..e28ad72c4f2b 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -502,7 +502,7 @@ static void intel_panel_sync_state(struct intel_connector *connector)
 	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
 }
 
-const struct drm_panel_funcs dummy_panel_funcs = {
+static const struct drm_panel_funcs dummy_panel_funcs = {
 };
 
 int intel_panel_register(struct intel_connector *connector)
-- 
2.39.5

