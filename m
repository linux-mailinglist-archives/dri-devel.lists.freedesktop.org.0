Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF7B58F49
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28210E6D5;
	Tue, 16 Sep 2025 07:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB238jgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399010E6D5;
 Tue, 16 Sep 2025 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758008137; x=1789544137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grfNOWoA5SvqIcM7ZKOlHtyJuCUO7aywM9jl0zrXyJQ=;
 b=FB238jgs3zxbF9flnHNXxllFz09tFpQwnIVjhntwtK6yp1V3GY0LjxJv
 RL5HkyldWqhRtpwdS4gJqOFJwBUnVh98mkZh1oWcXt6sPy4c8Mf9qkM75
 oBDvI8tKT20+dJH96nYrm6mjdy6vdiXNWmTgKpa7PwWE2IUpGPlZ63hLX
 kVyYi5mjwb2WYhkSbgiMYfHyda/lLBxmoPsrXUlGJxbn0gvTK2ad9W6Vk
 m6eRjLr/S8YKQWswy9qzVOLclqQP+R0ufMUWeaZJL6bYq3Hkiz0+ryVEU
 ezc2isuuHvCVqx+X8DYQ4nfahVRBYk+ZCSPMqzoWlWI8dlDMfEqTskCWx Q==;
X-CSE-ConnectionGUID: dfDqDoOfRUWRD2cB/f3AKg==
X-CSE-MsgGUID: zjzpZXFXQfaXmLuvwNc3AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70960415"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70960415"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:35:35 -0700
X-CSE-ConnectionGUID: /U9ZIBdLSEWGIo8xs/Wvfg==
X-CSE-MsgGUID: feeWsNqkT3eQgiyZosn5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179250752"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 00:35:33 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Refactoring the code as per review comment
Date: Tue, 16 Sep 2025 12:57:04 +0530
Message-Id: <20250916072704.2351591-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916072704.2351591-1-s.sebinraj@intel.com>
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
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

Moved the trace file header to appropriate path
"include/drm" and updated the code as per the same.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/drm_gpu_frequency_trace.c              | 2 +-
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h                 | 2 +-
 {drivers/gpu => include}/drm/drm_gpu_frequency_trace.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename {drivers/gpu => include}/drm/drm_gpu_frequency_trace.h (96%)

diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
index b5fa5134226d..e33df068752d 100644
--- a/drivers/gpu/drm/drm_gpu_frequency_trace.c
+++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
@@ -9,7 +9,7 @@
 #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
 
 #define CREATE_TRACE_POINTS
-#include "drm_gpu_frequency_trace.h"
+#include <drm/drm_gpu_frequency_trace.h>
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
index f188d529ae60..c15d41761296 100644
--- a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
+++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GPU_FREQ_TRACE_H_
 #define _XE_GPU_FREQ_TRACE_H_
 
-#include "../drm_gpu_frequency_trace.h"
+#include <drm/drm_gpu_frequency_trace.h>
 
 /* Convert MHz to KHz for tracepoint */
 #define MHZ_TO_KHZ(freq_mhz)	((freq_mhz) * 1000)
diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/include/drm/drm_gpu_frequency_trace.h
similarity index 96%
rename from drivers/gpu/drm/drm_gpu_frequency_trace.h
rename to include/drm/drm_gpu_frequency_trace.h
index cf6337847b3a..47f32fd295a4 100644
--- a/drivers/gpu/drm/drm_gpu_frequency_trace.h
+++ b/include/drm/drm_gpu_frequency_trace.h
@@ -42,6 +42,6 @@ static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id)
 
 #ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
+#define TRACE_INCLUDE_PATH ../../include/drm
 #include <trace/define_trace.h>
 #endif
-- 
2.34.1

