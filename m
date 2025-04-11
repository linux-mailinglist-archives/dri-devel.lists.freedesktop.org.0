Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E726EA853D7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 08:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174910EAFB;
	Fri, 11 Apr 2025 06:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a03qqFA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9DD10EAF8;
 Fri, 11 Apr 2025 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744351357; x=1775887357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EY3ZsOSF32ypaMWWWCnhWYHzXmnbPo5uta/3KdjGt78=;
 b=a03qqFA7NqfF/G0cQUXTTH1j5I7uizI2jdBTVKWCq8Iwa5KYNzweAGgy
 uxoxZzsIC7kK8hq9DXobmXgL0Tj8NuBOpcEKkpcqNBlZtm2PhG3N6ffcB
 0M5wLizJttPAfC+LHldAWDdg4flLqChcvNhWtGUZ6bdltmmD83K9qMMbH
 eoz3KR3YJtAgokWpLj9OiBbSO98qlj6rlvTU95sOjDJK2UcadpEwTuxQS
 nuLaKeDEc/NyAvK/+geywEtqwQkVx8Yb88U1UsZrzqpmSnRuoc7WlFnPc
 TfU1BcSXOD6IOINlqTc5ToHPsU0PHBEtUUzBC7/nifDDwLxpGhGNO6Y3W w==;
X-CSE-ConnectionGUID: 6ht5fwNFSj2U87E8vn76sA==
X-CSE-MsgGUID: ZsZw6M4xT5Gx7qM8qbsBzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46022208"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46022208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 23:02:37 -0700
X-CSE-ConnectionGUID: SkIkw1OITmmn4a2M+Atn2g==
X-CSE-MsgGUID: tPXEiv0fQO2JmrEi6fNf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129046760"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 10 Apr 2025 23:02:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/dp: Add smooth brightness register bit definition
Date: Fri, 11 Apr 2025 11:32:35 +0530
Message-Id: <20250411060235.2732060-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060235.2732060-1-suraj.kandpal@intel.com>
References: <20250411060235.2732060-1-suraj.kandpal@intel.com>
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

Add DP_EDP_SMOOTH_BRIGHTNESS register bit definition for
EDP_GENERAL_CAPABILITY 2 register.

--v2
-Add eDP 2.0 comment [Ankit]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index c413ef68f9a3..3001c0b6e7bb 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1025,6 +1025,7 @@
 #define DP_EDP_GENERAL_CAP_2		    0x703
 # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
 # define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1 << 4)
+# define DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE		(1 << 6) /* eDP 2.0 */
 
 #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
 # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
-- 
2.34.1

