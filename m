Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5198749AE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F310EECE;
	Thu,  7 Mar 2024 08:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK5tzUdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DC310EECE;
 Thu,  7 Mar 2024 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800458; x=1741336458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2B59420ynTgLTszu70LAWDP8Dkj2iPq41o0RHgyx3RY=;
 b=NK5tzUdkDYuDT1ZEFMSMY69fMEeNLsDbMGhKLhxjcqmk/Tk64ukQXC3Y
 OAle75WYaO8YR4PuVXR3VsjYVW+jz1sblBe3TAXbi2p3MuKrMgQyZqamF
 VF87/2o7ieTQi+X5A6gzndRCSV/OVxQrPKtg7w0E9Dge5/n2ft544whX7
 pm1lG+LYrWIE3THfNZSFoSxc4Q9NRIbMLN+/r9IVumrA+K/7bt70IQySI
 WI0IUQx46SXTJcXyUDdeYvTGSns2VWcenvG+zlfl3RCd57WOS7qsEMGcw
 YPtGEc15hbomWJQbuu4ZFqpxykxdZYV4iLzQ2d2l8Dk/S8P8Iok75og65 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="7397069"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="7397069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10015566"
Received: from tcavalax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.241])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:34:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/crtc: make drm_crtc_internal.h self-contained
Date: Thu,  7 Mar 2024 10:34:10 +0200
Message-Id: <20240307083410.2604712-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <c6b286b33976baf65dff209596acd59675983d68.1709749576.git.jani.nikula@intel.com>
References: <c6b286b33976baf65dff209596acd59675983d68.1709749576.git.jani.nikula@intel.com>
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

Forward declare struct drm_printer and include <linux/err.h>.

v2: Include <linux/err.h> (kernel test robot)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index a514d5207e41..c0c5d79ed4c9 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -32,6 +32,7 @@
  * and are not exported to drivers.
  */
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 enum drm_color_encoding;
@@ -54,6 +55,7 @@ struct drm_mode_object;
 struct drm_mode_set;
 struct drm_plane;
 struct drm_plane_state;
+struct drm_printer;
 struct drm_property;
 struct edid;
 struct fwnode_handle;
-- 
2.39.2

