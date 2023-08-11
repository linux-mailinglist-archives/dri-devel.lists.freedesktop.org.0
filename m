Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E277869D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 06:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF28C10E644;
	Fri, 11 Aug 2023 04:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16F10E641;
 Fri, 11 Aug 2023 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691728992; x=1723264992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQ6SUgwc051LWxzshtFxzYkiYuHbwKJMeWigrpB7ikA=;
 b=RhLlC+fbMjkR0SCfD5wnvxPLfHMAlOy5IQscx1N9camphgeNP/ofg2L8
 CAXTkSafO6TpSrjw1XK5xIPjhiyZQMOqNCXyVamUZ7/RpJgiALZI/wZ4e
 P+4nxWfld3bjRryeZR40f7OA9PHN9+U0dc6UZYDddGtcyi5DchSuG2xi/
 N4aqWUYCIa5WPztD6CGQFW65jvJ7CfR6QE8g8G3pkXnjUWTlYkfdHvrMI
 dTk7Ki6Bt03f9ufPYMnP34f9xVM0jtzqX2kMmO1Rbo+RxM28OnzYjGP/k
 vz2DBuZHARDNZKxeQMsMOwNfyWCF40F+Mi1YJQFe21OleFQNRa+e5w0AR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351197202"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="351197202"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 21:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802533477"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="802533477"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 21:43:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Date: Thu, 10 Aug 2023 21:43:09 -0700
Message-Id: <20230811044310.944883-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230811044310.944883-1-alan.previn.teres.alexis@intel.com>
References: <20230811044310.944883-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the GSC-fw input/output HECI packet size to match
updated internal fw specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..fa460491ce42 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -15,7 +15,7 @@
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
 /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+#define PXP43_MAX_HECI_INOUT_SIZE (SZ_64K)
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
-- 
2.39.0

