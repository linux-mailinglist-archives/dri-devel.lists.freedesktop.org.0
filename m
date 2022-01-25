Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E60B49B9AE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696BE10E2AD;
	Tue, 25 Jan 2022 17:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ED310E2AD;
 Tue, 25 Jan 2022 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643130510; x=1674666510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxumpUhHvBRA0u+3Fe9XQHFjBqG1151BbMXX8X5QAHc=;
 b=lVcHSme6woZFEscmbbkONC3ukDbDb5LARxOri/bYNR3RA9we8ox6hHdg
 J3DPSEb9oCfYK8t9x272kCEC6FgfcwxVLM20AYABSbD4G523RpD0CqLNF
 WIH+5d6EQFtnMFXAmGYef7Yl4+IPhbYOI8zoG+UcGsfmYUoEKdutbBr6u
 i4QF+eJc4Y167lsK8ZNca2NJE+F875UqnnzPhn0q0XJZOE6EJFXD4zu8O
 Z4lSb+JPvuuI47xTJAMV6zQhRMOveXCH6TdMilkM8u9AiV0Wo1+/rqP7r
 NybAsI83tATi5dfLmeIR+/UAEOEaJPqi09TsaDr6FadF08PRAihANvavO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332704657"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="332704657"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="520456079"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/dp: add some new DPCD macros from DP 2.0 E11
Date: Tue, 25 Jan 2022 19:03:41 +0200
Message-Id: <aaeccfb4f2a8c0995f9b2f29e66829c486205712.1643130139.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643130139.git.jani.nikula@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some of the new additions from DP 2.0 E11.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/dp/drm_dp_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index c499d735b992..69487bd8ed56 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -560,6 +560,7 @@ struct drm_panel;
 # define DP_TRAINING_PATTERN_DISABLE	    0
 # define DP_TRAINING_PATTERN_1		    1
 # define DP_TRAINING_PATTERN_2		    2
+# define DP_TRAINING_PATTERN_2_CDS	    3	    /* 2.0 E11 */
 # define DP_TRAINING_PATTERN_3		    3	    /* 1.2 */
 # define DP_TRAINING_PATTERN_4              7       /* 1.4 */
 # define DP_TRAINING_PATTERN_MASK	    0x3
@@ -1350,6 +1351,7 @@ struct drm_panel;
 # define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
 /* See DP_128B132B_SUPPORTED_LINK_RATES for values */
 #define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
+#define DP_PHY_REPEATER_EQ_DONE                             0xf0008 /* 2.0 E11 */
 
 enum drm_dp_phy {
 	DP_PHY_DPRX,
-- 
2.30.2

