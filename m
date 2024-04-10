Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94F89EF74
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA610EA1A;
	Wed, 10 Apr 2024 10:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0+KjkSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77E810EA24;
 Wed, 10 Apr 2024 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743532; x=1744279532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGWyIqCcgXlY4QKWwuJbDNEOG+0YXe+0UdshLwzwkLM=;
 b=K0+KjkSQI6ib+vZuxXbrn45w1ys8EC6mV8IZC5G8ATPp3olA08uFv2Tz
 n6HNcRAIfoTiBjORPp6fNh+XuAGwe4flG4KSwmdpDYVgpgRyesICJn8xr
 u4E8C87lwW3Socp1r26fjK4NBgGGdUV9Edt+SAyBuUW0VN2LuMxF2yRIK
 oF7lGRTaoTrVDaAWqvqG2/O3NaSeEG78NlQp/7U2ZnhHu3W5X86WRh9t+
 MbhmjgM2IP+ZoPbaE2fJ22FcydCSqMRX5FoED+8mErC+HIMwfvqK8/yXn
 RMDCRXUaQXeMOIFFOKn/2nIHxK6DdzyVZVlNjThJ8Ay/W2yhpQ/3S8c5C A==;
X-CSE-ConnectionGUID: 4Uy6JFm5T7CsYg572vxUMg==
X-CSE-MsgGUID: pkIEfZCjTtOqDsg3HpXS5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18661808"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18661808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:32 -0700
X-CSE-ConnectionGUID: Zkdn/pOjRnaBcZ7c4Xgt2w==
X-CSE-MsgGUID: AdV0XkUbTNiT7D+qTgcaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25133445"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 01/10] drm/i915: use system include for drm headers
Date: Wed, 10 Apr 2024 13:05:08 +0300
Message-Id: <ed02b81fcbbc0d27be4af460c521aefbfdc76375.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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

Use <> instead of "" for including headers from include/, even if the
file is in the same directory.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i915_component.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
index 56a84ee1c64c..4ea3b17aa143 100644
--- a/include/drm/i915_component.h
+++ b/include/drm/i915_component.h
@@ -24,7 +24,7 @@
 #ifndef _I915_COMPONENT_H_
 #define _I915_COMPONENT_H_
 
-#include "drm_audio_component.h"
+#include <drm/drm_audio_component.h>
 
 enum i915_component_type {
 	I915_COMPONENT_AUDIO = 1,
-- 
2.39.2

