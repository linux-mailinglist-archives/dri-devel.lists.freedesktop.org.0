Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353B7A767A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494010E466;
	Wed, 20 Sep 2023 08:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072410E465;
 Wed, 20 Sep 2023 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695200247; x=1726736247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=djyyXToti7lJPyuRdeI85+Np8rtiT2F4hDXN5kTKqpc=;
 b=edUpwrhPnTIk0wT76S/zh9WN35P5LUIouT1xDDx7D5RT6EG/EH/CAcLX
 afG8wxgTr3SXs2E8mf9jwLol0zdi5hkZw8piyyeF6sdI05QNVeJGui5lD
 XKNLZyHHXQZ3D91eEM0GatIZZK3/ZAbVOb//XmqMFhA4/XrRYJjiK0CcS
 Jk/UausYoO9/V0SVzwBCvWuO0UPC9JggIcQpZueAu3KdeJm2mmeG5OZ9p
 oF9ugU3buIoh4JXDnkuzT0JBLAaRSw29J0QBOX4LAxigW7/Ia/ak1FmhD
 aKUyPXGMXUHjzK4UHY3sfapra9s0rAdMleqE9T7mI+JZJ6p2lQSgib0i0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446638777"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="446638777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="740117767"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="740117767"
Received: from conorbyr-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:57:24 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Zap some empty lines
Date: Wed, 20 Sep 2023 09:57:15 +0100
Message-Id: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Recent refactoring left an unsightly block of empty lines. Remove them.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 87ffc477c3b1..511eba3bbdba 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -646,13 +646,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_TIGERLAKE_UY(i915) \
 	IS_SUBPLATFORM(i915, INTEL_TIGERLAKE, INTEL_SUBPLATFORM_UY)
 
-
-
-
-
-
-
-
 #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
 	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
 
-- 
2.39.2

