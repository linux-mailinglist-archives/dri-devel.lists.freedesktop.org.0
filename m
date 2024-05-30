Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F1B8D4C79
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02AF11217E;
	Thu, 30 May 2024 13:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdNUykMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5210FEC6;
 Thu, 30 May 2024 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075211; x=1748611211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4ldLALUM0qlpISa4pT7xa+FUOMn6i3UFzrLAk+9Sds=;
 b=YdNUykMkwkn2mV5rqqVqKUVFVgnFzxuI5/M5amTef/JW7ttVy6CWz5mn
 33+5i3m4c0AtafScQc0ZwwrsVVT0xFH7NcWx8h9TD2orFMQkJo5zxUG1N
 U+aziVneIFv8HkJS2QrXWCxulkDemur3h+xEE/VRjpkIbe32Gb9v+3vYx
 /TxQyxKAdrpa71P4KBSJ9xIg0AJbaf+omCFhn9tW6R6Bx/U9MYHzOwXV8
 0x5xWC7sHIDZqkX11ctJMWRLNWxmqvpExtgSMFjv5TshjVZznkAsxLkPB
 JcsLC7RgqoCbkmMm2inzf7qLThlpxG/fNeAoLN3ls/tUyFH6THcDkrSAh w==;
X-CSE-ConnectionGUID: MbBSldYjR36//eQqG1yzUw==
X-CSE-MsgGUID: wQCXGHpDSHiimmC/aVoPhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13431655"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13431655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:11 -0700
X-CSE-ConnectionGUID: lPZ20K3YRtutki7f8o5NPw==
X-CSE-MsgGUID: XEcc0jG+RUiCHmNP3h7MQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35845738"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:20:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 09/10] drm: move i915_hdcp_interface.h under
 include/drm/intel
Date: Thu, 30 May 2024 16:19:10 +0300
Message-Id: <5f53384118e33123d3c87b94cc8835360237698b.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
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

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h    | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c | 2 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c              | 2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c                      | 2 +-
 include/drm/{ => intel}/i915_hdcp_interface.h         | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename include/drm/{ => intel}/i915_hdcp_interface.h (100%)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6fbfe8a18f45..9210643c9fdf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -44,7 +44,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
 #include "i915_vma.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 35823e1f65d6..16afeb8a3a8d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -3,7 +3,7 @@
  * Copyright 2023, Intel Corporation.
  */
 
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "gem/i915_gem_region.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
index 240b00849f3d..6548e71b4c49 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/err.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "i915_drv.h"
 #include "intel_hdcp_gsc_message.h"
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index eb67ecf08db2..14b8b4278317 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -4,7 +4,7 @@
  */
 
 #include <drm/drm_print.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 #include <linux/delay.h>
 
 #include "abi/gsc_command_header_abi.h"
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index e43ea536c947..323f10620d90 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -24,7 +24,7 @@
 #include <linux/component.h>
 #include <drm/drm_connector.h>
 #include <drm/intel/i915_component.h>
-#include <drm/i915_hdcp_interface.h>
+#include <drm/intel/i915_hdcp_interface.h>
 
 #include "mei_hdcp.h"
 
diff --git a/include/drm/i915_hdcp_interface.h b/include/drm/intel/i915_hdcp_interface.h
similarity index 100%
rename from include/drm/i915_hdcp_interface.h
rename to include/drm/intel/i915_hdcp_interface.h
-- 
2.39.2

