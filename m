Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4364B2649F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D36810E866;
	Thu, 14 Aug 2025 11:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHl2JfvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0341110E850;
 Thu, 14 Aug 2025 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755172165; x=1786708165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8XApXTqyqCqpl3gaHs4GMy1OhqyzgIwZd5pj93yuw4=;
 b=fHl2JfvM0KQLGDGaJJQMuP8+vcjZZzN3Dxtp7xd0H1LZukFRZyy/sGH5
 VLj/+d078PybvZHyJ5YX73E4Znw9B0aIjBqpIfZ6oVSCm4EJNgpRddR/8
 nD2vpUxT8TGUd5ykKRNrWxKQDmrfE/lsddrJaJYMz9aqw9eGvYWFTPmuI
 +gw1+y8+Ci3OjUBaEdhLBF8l6TW/2w+Lb2Ef6qkUqlw+h8LsJrrPMtd64
 EQ5shWZlBXIV8ZY2182mxXDyZoZVxbIB5vMpkuG8JOBawXb1b58pVocEu
 rHZLkqT5ZEwC/AM0wvhA6Q9uDb7diIKYgoPA5s8Tf+YwnTiAtVI2h3+FB w==;
X-CSE-ConnectionGUID: XyidrowMRmKabWhZTYrhzw==
X-CSE-MsgGUID: 861MTCY/TK+JFaCYbOmX1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57388439"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57388439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:24 -0700
X-CSE-ConnectionGUID: j3P4eE2CS+yxt9lggNULvw==
X-CSE-MsgGUID: 6imLkCBCTPe3isMXlaOrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171967096"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:19 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v8 01/10] drm/xe: Add documentation for Xe Device Wedging
Date: Thu, 14 Aug 2025 17:44:31 +0530
Message-ID: <20250814121448.3380784-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250814121448.3380784-1-riana.tauro@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
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

Add documentation for Xe Device Wedging so that
file can be referenced in following patches.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/xe/index.rst     |  1 +
 Documentation/gpu/xe/xe_device.rst | 10 ++++++++++
 drivers/gpu/drm/xe/xe_device.c     | 10 ++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_device.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 42ba6c263cd0..88b22fad880e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
    xe_tile
    xe_debugging
    xe_devcoredump
+   xe_device
    xe-drm-usage-stats.rst
    xe_configfs
diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
new file mode 100644
index 000000000000..39a937b97cd3
--- /dev/null
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+.. _xe-device-wedging:
+
+==================
+Xe Device Wedging
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
+   :doc: Xe Device Wedging
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..0ab0366c3a9d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1157,6 +1157,16 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * DOC: Xe Device Wedging
+ *
+ * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot be
+ * used. Certain critical errors like gt reset failure, firmware failures can cause
+ * the device to be wedged. The default recovery method for a wedged state
+ * is rebind/bus-reset.
+ */
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
-- 
2.47.1

