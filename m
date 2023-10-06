Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394517BB338
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF010E4CD;
	Fri,  6 Oct 2023 08:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9F10E4C3;
 Fri,  6 Oct 2023 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696581073; x=1728117073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4l71HxNqmB0RyoGRbYS+aHVBPW4BbI7d9biC7SJ9qM=;
 b=lxiBwglC2h4s0ue3wwx6qOkhGnMxu/6SOFGyUpv8duR8pyhngGsstpno
 0j8dDxFjxLNc8ayKity9S2BpSldyI0PRJHuqSScrVq37v+7oyQIsgxqa/
 XjEgVCYbx3bqMQtkeW6xLXa0OiOkP8uQ49zPvildcsORVAy7Qc59/ObbE
 ZJtkKZQyD+juhL3e+iOGbXavuBIwoBDZCAOAcUY99THBJX+mEIIUlGz3I
 i5DpL3kNlxXofMgOVw/++WL7X3A8W3++VBREqnQGMLnqHP9aO5cMVfBUO
 Fv8HTR0xfPe9lC48Iw6F7Oy6monDrjyGjxvuffp264JSn/O1aTjPPspqt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363984180"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363984180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="822432183"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="822432183"
Received: from stevegr-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.79])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:31:11 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Remove early/pre-production Haswell code
Date: Fri,  6 Oct 2023 09:31:01 +0100
Message-Id: <20231006083103.660153-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
References: <20231006083103.660153-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is not our policy to keep pre-production hardware support for this long
so I guess this one was just forgotten.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 -
 drivers/gpu/drm/i915/i915_drv.h    | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ccbb2834cde0..78a42c8a8509 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -175,7 +175,6 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
 {
 	bool pre = false;
 
-	pre |= IS_HASWELL_EARLY_SDV(dev_priv);
 	pre |= IS_SKYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x6;
 	pre |= IS_BROXTON(dev_priv) && INTEL_REVID(dev_priv) < 0xA;
 	pre |= IS_KABYLAKE(dev_priv) && INTEL_REVID(dev_priv) < 0x1;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index cb60fc9cf873..9d493ff1685a 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -590,8 +590,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPL)
 #define IS_RAPTORLAKE_U(i915) \
 	IS_SUBPLATFORM(i915, INTEL_ALDERLAKE_P, INTEL_SUBPLATFORM_RPLU)
-#define IS_HASWELL_EARLY_SDV(i915) (IS_HASWELL(i915) && \
-				    (INTEL_DEVID(i915) & 0xFF00) == 0x0C00)
 #define IS_BROADWELL_ULT(i915) \
 	IS_SUBPLATFORM(i915, INTEL_BROADWELL, INTEL_SUBPLATFORM_ULT)
 #define IS_BROADWELL_ULX(i915) \
-- 
2.39.2

