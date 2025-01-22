Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A8A19430
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBB710E704;
	Wed, 22 Jan 2025 14:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSAU5Z5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7A10E6FD;
 Wed, 22 Jan 2025 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737556913; x=1769092913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0iar7pUFEZgeKylxKvolv6U3bmWrB9z8DhfqoUMpX14=;
 b=KSAU5Z5u73J+hXleQsdYRig0hbmulWQ89xdYp0p0D7fIT/G4hVYRWeqh
 g4uDqmFUBnZVuHvyTzpKArTWcNDEsBr+uXqmKEByss/JcLNYpspT+kJz3
 q2OOheoW/yJ2uU3+IP09oCrYWnHj4dz8FFLlZc0L7/MxDDeIC2zhvqBEE
 z9dQOT0eZvTh5fYej6uryI9H5I1dg8nFpirkBbfucBvbfqyTlpRxgoZWt
 DCZxt2Sj5W3J9SYJcjDo+Xg3o65oVYZJkMoqEebn96WauXP581oW/FPgX
 GFcyQcG7NB05P9JJS5XmDrjcUHOTf1hEGDNNfEd68Xy1KOEnswMuPCdnE g==;
X-CSE-ConnectionGUID: rdqsj3krQIm7RpM/LSsqmg==
X-CSE-MsgGUID: j0jjeKx9TKq/eWTrGDXYwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60484665"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="60484665"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:53 -0800
X-CSE-ConnectionGUID: LmQM6WqZRPKHw6eI//MxMg==
X-CSE-MsgGUID: k6m4AZAOSAajoMR956q0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107087753"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 simona.vetter@ffwll.ch, jani.nikula@intel.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
Date: Wed, 22 Jan 2025 16:41:34 +0200
Message-Id: <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737556766.git.jani.nikula@intel.com>
References: <cover.1737556766.git.jani.nikula@intel.com>
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

Ensure drm headers build, are self-contained, have header guards, and
have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=y.

The mechanism follows similar patters used in i915, xe, and usr/include.

To cover include/drm, we need to recurse there using the top level
Kbuild and the new include/Kbuild files.

v4: check for CONFIG_WERROR in addition to CONFIG_DRM_WERROR

v3: adapt to upstream build changes

v2: make DRM_HEADER_TEST depend on DRM

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Kbuild                   |  1 +
 drivers/gpu/drm/Kconfig  | 11 +++++++++++
 drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
 include/Kbuild           |  1 +
 include/drm/Makefile     | 18 ++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 include/Kbuild
 create mode 100644 include/drm/Makefile

diff --git a/Kbuild b/Kbuild
index 464b34a08f51..f327ca86990c 100644
--- a/Kbuild
+++ b/Kbuild
@@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES)	+= samples/
 obj-$(CONFIG_NET)	+= net/
 obj-y			+= virt/
 obj-y			+= $(ARCH_DRIVERS)
+obj-$(CONFIG_DRM_HEADER_TEST)	+= include/
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0..f9b3ebf63fa9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -494,6 +494,17 @@ config DRM_WERROR
 
 	  If in doubt, say N.
 
+config DRM_HEADER_TEST
+	bool "Ensure DRM headers are self-contained and pass kernel-doc"
+	depends on DRM && EXPERT
+	default n
+	help
+	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
+	  include/drm compile, are self-contained, have header guards, and have
+	  no kernel-doc warnings.
+
+	  If in doubt, say N.
+
 endif
 
 # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 85af94bb907d..42901f877bf2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -222,3 +222,21 @@ obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
+
+# Ensure drm headers are self-contained and pass kernel-doc
+hdrtest-files := \
+	$(shell cd $(src) && find . -maxdepth 1 -name 'drm_*.h') \
+	$(shell cd $(src) && find display lib -name '*.h')
+
+always-$(CONFIG_DRM_HEADER_TEST) += \
+	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+      cmd_hdrtest = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		touch $@
+
+$(obj)/%.hdrtest: $(src)/%.h FORCE
+	$(call if_changed_dep,hdrtest)
diff --git a/include/Kbuild b/include/Kbuild
new file mode 100644
index 000000000000..5e76a599e2dd
--- /dev/null
+++ b/include/Kbuild
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_HEADER_TEST)	+= drm/
diff --git a/include/drm/Makefile b/include/drm/Makefile
new file mode 100644
index 000000000000..a7bd15d2803e
--- /dev/null
+++ b/include/drm/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Ensure drm headers are self-contained and pass kernel-doc
+hdrtest-files := \
+	$(shell cd $(src) && find * -name '*.h' 2>/dev/null)
+
+always-$(CONFIG_DRM_HEADER_TEST) += \
+	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+      cmd_hdrtest = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		touch $@
+
+$(obj)/%.hdrtest: $(src)/%.h FORCE
+	$(call if_changed_dep,hdrtest)
-- 
2.39.5

