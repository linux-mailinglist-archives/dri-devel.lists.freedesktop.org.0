Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F7964ADC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ECD10E723;
	Thu, 29 Aug 2024 16:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkqbmM/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329010E71C;
 Thu, 29 Aug 2024 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724947202; x=1756483202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZVhy00hR+PCS3Oja2q7T0ClCf3oyBQZQu1h8s4wBumA=;
 b=GkqbmM/hwzgnmteF9FbKhF39TA1Hrca0DZ3IHMlLLR1vzAwjLjohhkh2
 pJaHhKSd33YHYTyBmRCpLzazcJuFjVh7owQia1gQzGpFYIjzSuhGS6Rtn
 f+Xx7MzWFBS35M01fWjOj1kUhwsmqyZAd7EBpC3fFZ7WLwPHk8tP2zOJ7
 qTpHrWusVYd7t34KLBA6FNMW6dtJ/4QlCIWJOzwTHTA2nqr5GsnohlE1U
 BikaoIqK44fjlyrYLjzXOafUCFo9DAZ+iI+/qwBukCdSYm9/NgstTjsO/
 zG57R7okYDGMcX7RK3LHpoUCtn0Jui/PxspVJRCSMox4OsE5b7nzD0TYM Q==;
X-CSE-ConnectionGUID: wtaHu8HdTP2vfrOQy1T5Hg==
X-CSE-MsgGUID: Spd3IabDRKeJ0IYf1y4eug==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27313781"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="27313781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:00:01 -0700
X-CSE-ConnectionGUID: TPDw9tJfSQ+wBECcZqVJLQ==
X-CSE-MsgGUID: V5v7svFgR5GHF5c6OuY6DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63455322"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 08:59:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B4F35143; Thu, 29 Aug 2024 18:59:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/2] drm/i915/fence: Mark debug_fence_init_onstack() with
 __maybe_unused
Date: Thu, 29 Aug 2024 18:58:37 +0300
Message-ID: <20240829155950.1141978-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When debug_fence_init_onstack() unused, it
prevents kernel builds with `make W=1` and CONFIG_WERROR=y:

.../i915_sw_fence.c:97:20: error: unused function 'debug_fence_init_onstack' [-Werror,-Wunused-function]
   97 | static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~

Fix this by marking debug_fence_init_onstack() with __maybe_unused.

Fixes: 214707fc2ce0 ("drm/i915/selftests: Wrap a timer into a i915_sw_fence")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 8a9aad523eec..d4020ff3549a 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -51,7 +51,7 @@ static inline void debug_fence_init(struct i915_sw_fence *fence)
 	debug_object_init(fence, &i915_sw_fence_debug_descr);
 }
 
-static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
+static inline __maybe_unused void debug_fence_init_onstack(struct i915_sw_fence *fence)
 {
 	debug_object_init_on_stack(fence, &i915_sw_fence_debug_descr);
 }
@@ -94,7 +94,7 @@ static inline void debug_fence_init(struct i915_sw_fence *fence)
 {
 }
 
-static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
+static inline __maybe_unused void debug_fence_init_onstack(struct i915_sw_fence *fence)
 {
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

