Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D7AD5F25
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0B10E734;
	Wed, 11 Jun 2025 19:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDRuQnWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAED10E71D;
 Wed, 11 Jun 2025 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749670742; x=1781206742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zhwz9W1gykEvEJoOfPNEpGE35HyoYGLM5IfM7y22BFA=;
 b=RDRuQnWNhqQ1lsnYZUb/ixMUvw62bPqOx35bieE12HLDsFFgct/3Hjhs
 sMqs6MQMOcqwRdwC8evGj4OEH8uDsf98C4LY4fmoWHsMB2eDzDws8EcbB
 Sd8z7dN3G1bFSJKS8eJVEpAEwWPdpzdm9yH+7G6RH9y2EEYiEoKSaNXuC
 vWfx3jiRm35T0xk4dlbdK+1sNFts8HZKFJdHvvWM4iFeTDf3vb5005E8D
 vvhd5fCDk/wR9vn4fWl0QShr/zvhWvdPDB5wPJI21mAt3WmQxoqPsEF27
 0XBMk/b5Wyqqc6JG8dBOzPUexDtvpwWI8LUA1ulZ3Fj+1LDyfketSNFjc A==;
X-CSE-ConnectionGUID: uPbNe+E8Tki+yxI0/tnx6Q==
X-CSE-MsgGUID: Zf+IBy96QIu2npodl9GUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51746535"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51746535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:39:02 -0700
X-CSE-ConnectionGUID: NqvJlrZrTm6p6FLzT4uQcw==
X-CSE-MsgGUID: EwrmL9WRQqSSgJz9RJRoMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178199159"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:39:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Fix kconfig prompt
Date: Wed, 11 Jun 2025 12:38:37 -0700
Message-ID: <20250611-xe-kconfig-help-v1-1-8bcc6b47d11a@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250611-xe-kconfig-help-de8e8218c85f
X-Mailer: b4 0.15-dev-7a402
Content-Transfer-Encoding: quoted-printable
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

The xe driver is the official driver for Intel Xe2 and later, while=0D
maintaining experimental support for earlier GPUs. Reword the help=0D
message accordingly.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
 drivers/gpu/drm/xe/Kconfig  | 5 +++--=0D
 drivers/gpu/drm/xe/xe_drv.h | 2 +-=0D
 2 files changed, 4 insertions(+), 3 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig=0D
index c57f1da0791d9..30ed74ad29ab5 100644=0D
--- a/drivers/gpu/drm/xe/Kconfig=0D
+++ b/drivers/gpu/drm/xe/Kconfig=0D
@@ -1,6 +1,6 @@=0D
 # SPDX-License-Identifier: GPL-2.0-only=0D
 config DRM_XE=0D
-	tristate "Intel Xe Graphics"=0D
+	tristate "Intel Xe2 Graphics"=0D
 	depends on DRM && PCI && (m || (y && KUNIT=3Dy))=0D
 	depends on INTEL_VSEC || !INTEL_VSEC=0D
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)=0D
@@ -45,7 +45,8 @@ config DRM_XE=0D
 	select AUXILIARY_BUS=0D
 	select HMM_MIRROR=0D
 	help=0D
-	  Experimental driver for Intel Xe series GPUs=0D
+	  Driver for Intel Xe2 series GPUs and later. Experimental support=0D
+	  for Xe series is also available.=0D
 =0D
 	  If "M" is selected, the module will be called xe.=0D
 =0D
diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h=0D
index d61650d4aa0be..95242a375e541 100644=0D
--- a/drivers/gpu/drm/xe/xe_drv.h=0D
+++ b/drivers/gpu/drm/xe/xe_drv.h=0D
@@ -9,7 +9,7 @@=0D
 #include <drm/drm_drv.h>=0D
 =0D
 #define DRIVER_NAME		"xe"=0D
-#define DRIVER_DESC		"Intel Xe Graphics"=0D
+#define DRIVER_DESC		"Intel Xe2 Graphics"=0D
 =0D
 /* Interface history:=0D
  *=0D
=0D
=0D
=0D
