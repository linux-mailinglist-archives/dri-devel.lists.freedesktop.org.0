Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292EB4A80DF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DE010E9D7;
	Thu,  3 Feb 2022 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EBB10E99E;
 Thu,  3 Feb 2022 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879060; x=1675415060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8dhcu9E7LwedPhar+mMrewnTfZY59Imgz5U0fkF/+M=;
 b=cx0chlEAjsW7q3xJH5s0340gxmP63sh9D2350uQ+40GSeplhg/eACDQS
 qNTUThpx0v8O2WzKqOD57yVE2+XUWM2/9LoHD6W+Ok3iio+abJSUYTChu
 KJomNSTmNOfq7hcwZ4rnRO5Q03F1Tskldj951mtrASYufWh9Z0KREySs2
 QmGp9/2lHmNXm0WIxNaDPbjMR86MyVbX2aM5iqtMYhTeGLD43HLNpt2C/
 wZhJVeHesK+Qep2airvlIGPwDw8kI2ZQ353Xtgws64XkGqG76Cr7OWope
 6RZu2S2t80CNJA2pzWL9ZA0JpRG6sm4QtRgY3KnfM4otbyM0QSVHYMjd7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="235504724"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="235504724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="538662917"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/dp: add some new DPCD macros from DP 2.0 E11
Date: Thu,  3 Feb 2022 11:03:52 +0200
Message-Id: <ec9c1b94858de36b9f4ef6c197effa4ca667afc3.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643878928.git.jani.nikula@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some of the new additions from DP 2.0 E11.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

