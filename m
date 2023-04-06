Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B86D9883
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93A10EBC5;
	Thu,  6 Apr 2023 13:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD34210EA45;
 Thu,  6 Apr 2023 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680788841; x=1712324841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RqgRPXl8EeI/BYg1Z6ssII3WY0agfOr+Jeb9aLtqO0Q=;
 b=aVjurOkwRbkJ7hNoqYZqCgJvJinfGPHnnpmpoVj7p2OnCwfNRTw+y1jH
 k/GtADXn7f2N2wOjcQxMdoV7xfJ099YAhkJLXVIDnNRNhjZUOS1KaOH2O
 h2HU+JgabkzgonU4RNZ1O1ecf/ut8DyYzUVuE4HeY5t1l8lsumIDsbQuG
 cuGpfvyhFLBLmKUGrvd7sU7naQwIMg6mpdD8pVMoog4oFjymxEVWRYHey
 j9fw+14tnOopwM6lgQjFo3FxXMqhkjV/bQDqQ5sgsoSoOZ5SKPNMEWyTr
 7yqg4bztQNslt7cCXuhKhlIlnKQrUn293XT2CQmkZY2K/OcjaXlbPT8u2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331372154"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="331372154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 06:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798328203"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="798328203"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 06:46:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values
Date: Thu,  6 Apr 2023 16:46:15 +0300
Message-Id: <20230406134615.1422509-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406134615.1422509-1-jani.nikula@intel.com>
References: <20230406134615.1422509-1-jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro values just don't match the specs. Fix them.

Fixes: 1482ec00be4a ("drm: Add missing DP DSC extended capability definitions.")
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/display/drm_dp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 89d5a700b04d..f8813c1e059b 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -286,8 +286,8 @@
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
-# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
-# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
+# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  (0x3 << 5)	/* eDP 1.5 & DP 2.0 */
+# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  (1 << 7)	/* eDP 1.5 & DP 2.0 */
 
 #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
 # define DP_DSC_RGB                         (1 << 0)
-- 
2.39.2

