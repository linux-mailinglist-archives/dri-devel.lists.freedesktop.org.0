Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E173A42F1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 15:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D84B6E1D2;
	Fri, 11 Jun 2021 13:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63246E1D2;
 Fri, 11 Jun 2021 13:22:29 +0000 (UTC)
IronPort-SDR: xaBfRgc7ee0aqmNVslms3SKbJT9lBGxM2L9rZ5nt+b9TMd72ZcKlT6iYX2uR4UcEHqNQONSapg
 4cy80viHlUpw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226946263"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="226946263"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 06:22:29 -0700
IronPort-SDR: bNi9lMbYSvSaE62PIDp76AoHjpAi0o2gmZkdfTl/0Q6aDc6wk8cR+z43iwvjHHMDA9e5QL81IN
 h9KboNCOn32A==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="450758619"
Received: from pawilson-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 06:22:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix busy ioctl commentary
Date: Fri, 11 Jun 2021 14:22:21 +0100
Message-Id: <20210611132221.1055650-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Just tidy one instance of incorrect context parameter name and a stray
sentence ending from before reporting was converted to be class based.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 include/uapi/drm/i915_drm.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index c2c7759b7d2e..a1cb4aa035a9 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1348,12 +1348,11 @@ struct drm_i915_gem_busy {
 	 * reading from the object simultaneously.
 	 *
 	 * The value of each engine class is the same as specified in the
-	 * I915_CONTEXT_SET_ENGINES parameter and via perf, i.e.
+	 * I915_CONTEXT_PARAM_ENGINES context parameter and via perf, i.e.
 	 * I915_ENGINE_CLASS_RENDER, I915_ENGINE_CLASS_COPY, etc.
-	 * reported as active itself. Some hardware may have parallel
-	 * execution engines, e.g. multiple media engines, which are
-	 * mapped to the same class identifier and so are not separately
-	 * reported for busyness.
+	 * Some hardware may have parallel execution engines, e.g. multiple
+	 * media engines, which are mapped to the same class identifier and so
+	 * are not separately reported for busyness.
 	 *
 	 * Caveat emptor:
 	 * Only the boolean result of this query is reliable; that is whether
-- 
2.30.2

