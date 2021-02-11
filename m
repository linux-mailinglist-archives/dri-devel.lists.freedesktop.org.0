Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98C318DA0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DD26EE35;
	Thu, 11 Feb 2021 14:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E45A6EE35;
 Thu, 11 Feb 2021 14:52:33 +0000 (UTC)
IronPort-SDR: f9IQ9uJFDO5dekKpS2+InZr8h+qDYOhN7Rhn5pPiwsB/V5THep7DGoBTzTs86ztLT3U/vRXwlk
 5rv+v5WDRC3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="182383395"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="182383395"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 06:52:33 -0800
IronPort-SDR: AhvmfudvwlKh1iSVTrvXRKC1gLJ2I6nHB7URXQTDIGcUeVWXosfg7ZzwKkoYO+fwKT/MTK8r1Z
 gnyWXCgzUEZA==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="397339926"
Received: from hblancoa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.99])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 06:52:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/dp: add MSO related DPCD registers
Date: Thu, 11 Feb 2021 16:52:11 +0200
Message-Id: <ab57627f373ec4a80494bb51ea51080810d9bfb0.1613054234.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613054234.git.jani.nikula@intel.com>
References: <cover.1613054234.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, Nischal Varide <nischal.varide@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPCD register definitions for eDP 1.4 Multi-SST Operation.

Cc: Nischal Varide <nischal.varide@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_dp_helper.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index edffd1dcca3e..632ad7faa006 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1016,6 +1016,11 @@ struct drm_device;
 #define DP_EDP_REGIONAL_BACKLIGHT_BASE      0x740    /* eDP 1.4 */
 #define DP_EDP_REGIONAL_BACKLIGHT_0	    0x741    /* eDP 1.4 */
 
+#define DP_EDP_MSO_LINK_CAPABILITIES        0x7a4    /* eDP 1.4 */
+# define DP_EDP_MSO_NUMBER_OF_LINKS_MASK    (7 << 0)
+# define DP_EDP_MSO_NUMBER_OF_LINKS_SHIFT   0
+# define DP_EDP_MSO_INDEPENDENT_LINK_BIT    (1 << 3)
+
 /* Sideband MSG Buffers */
 #define DP_SIDEBAND_MSG_DOWN_REQ_BASE	    0x1000   /* 1.2 MST */
 #define DP_SIDEBAND_MSG_UP_REP_BASE	    0x1200   /* 1.2 MST */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
