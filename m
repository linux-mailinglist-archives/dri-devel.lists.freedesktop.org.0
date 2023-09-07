Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBB796DE8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255B110E062;
	Thu,  7 Sep 2023 00:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742FD10E062;
 Thu,  7 Sep 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694045751; x=1725581751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JjkJ8oCAWueYnooifUZg/h6lZkpJqJVkWPspj4hUEi4=;
 b=YcnVXkQLlqVhmwIJqKMZ3aZYQYZJqvVqbsmbfrPb+Cp5YfYNugvC6zFs
 H6zwc9OW3c/Y2+fxrQBK/n1Kv84YyMJv9pJWTqR4tAJNfTIluYNhPQIgG
 QJ3vfC5IP6JDdlsdYVrRPyAMgKqPy1/dsd/h0h2aGwhl6TGdA0B75bWGO
 sKmZn+VE0qPytCGy9iCRbzZpYEt3sFkF15/8769HB5th59dV7Cj3CE74G
 y8nNB3/0Mpb6kbNFRRMa+Y+fEmG/ZDLtDlfSCt1N9N9RH+eZ3ocEhjnwz
 2RztTruuIsfsOidaGa7BpH+RPTRVh6hzZBf9VN1gTy3mH3+8M/t+FVqIz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408226727"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="408226727"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811895778"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811895778"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 17:15:50 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Date: Wed,  6 Sep 2023 17:15:48 -0700
Message-Id: <20230907001549.81262-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
References: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..b2196b008f26 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -14,8 +14,8 @@
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
-/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+/* PXP-Packet sizes for MTL's GSCCS-HECI instruction is 65K*/
+#define PXP43_MAX_HECI_INOUT_SIZE (SZ_64K + SZ_1K)
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
-- 
2.39.0

