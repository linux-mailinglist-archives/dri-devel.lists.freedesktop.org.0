Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A6484813
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 19:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EED210E221;
	Tue,  4 Jan 2022 18:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7241010E223;
 Tue,  4 Jan 2022 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641322144; x=1672858144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efvwYRMHCu4OaXjQSA6T5XofhpY8DrjndzzhR6spYOk=;
 b=DyVVmwUfUQrbEXvh9uOFxBasB1t/YZyE9wln/TsKPnZdxnrwiXbwC9JF
 jeb/KLvtcbfHq2MejsreND5TKglEBy5+UGcwirR40ltpmwAuz5KqWWWvi
 Ieu6dSCgv1og4qdq6WNuw1FbEUSp7a9YMxzwrF0p8YuUBBjOVKbf4GL6P
 OgnLxkQ73VnAyU5/sreoBfqaE2fWLDwzEUW3ef1Qk+Zhve3T5OoIMsr5M
 V5DjJb4yIbkjYNKjWEQGueUG7eZgPuPQvRIh09wO4QraNWN3m33Fvl+Cn
 +GEGMhJZcCONWou/ZI3iysYj446RwmBPBz3Dflrs08sUNvvoXJVmP8MVI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242235774"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242235774"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 10:49:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="472166397"
Received: from gtobin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.253])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 10:49:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: note that DPCD 0x2002-0x2003 match 0x200-0x201
Date: Tue,  4 Jan 2022 20:48:56 +0200
Message-Id: <20220104184857.784563-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP_SINK_COUNT_ESI and DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 have the same
contents as DP_SINK_COUNT and DP_DEVICE_SERVICE_IRQ_VECTOR,
respectively.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_dp_helper.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..98d020835b49 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1038,11 +1038,8 @@ struct drm_panel;
 #define DP_SIDEBAND_MSG_UP_REQ_BASE	    0x1600   /* 1.2 MST */
 
 /* DPRX Event Status Indicator */
-#define DP_SINK_COUNT_ESI		    0x2002   /* 1.2 */
-/* 0-5 sink count */
-# define DP_SINK_COUNT_CP_READY             (1 << 6)
-
-#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* 1.2 */
+#define DP_SINK_COUNT_ESI                   0x2002   /* same as 0x200 */
+#define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0   0x2003   /* same as 0x201 */
 
 #define DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1   0x2004   /* 1.2 */
 # define DP_RX_GTC_MSTR_REQ_STATUS_CHANGE    (1 << 0)
-- 
2.30.2

