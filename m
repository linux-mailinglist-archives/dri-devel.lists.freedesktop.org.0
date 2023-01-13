Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B17668AF8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 05:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7714010E986;
	Fri, 13 Jan 2023 04:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F96D10E986;
 Fri, 13 Jan 2023 04:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673584946; x=1705120946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iYRHPp0pMoRZ5/O3qcdQDgy3tx+53tD5YBzu2jxbwyI=;
 b=jDPjLbCN5UrLBgC2V6dSc7yUVA6PFX9Shm6fNI1u3h/1LaptG7PIKs01
 Mxn0Lb2+UXGb4Mv0tCNO+SASmIYTK7makj9jQsHLCebNcv7pmoY2KroCJ
 QP3cJapyWqJnA+mFKIprOYWDbJJiyKsiHCqE1aGxURN1RJRnbyk1MkFkl
 DDYzn1z+fPS6w9LYfDG/QvMUDUk4s41ibAOgNxE8derHEwA2VaLlKQrzn
 FoyUWKwO9ULeOS35Joe9DzMdhSSiYSfvxYGjmXriZ5H25D66EUc5wrBBi
 YzNXeP0iVzh20HfW41qGm6x0RxY5UYAmTM9BZtWlRW1SPH7PWuQ3aJVLs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325969973"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="325969973"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 20:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608043031"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="608043031"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2023 20:42:24 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 1/2] drm: Add SDP Error Detection Configuration Register
Date: Fri, 13 Jan 2023 10:06:52 +0530
Message-Id: <20230113043653.795183-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP2.0 E11 defines a new register to facilitate SDP error detection by a
128B/132B capable DPRX device.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 9bc22a02874d..8bf6f0a60c38 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -691,6 +691,9 @@
 # define DP_FEC_LANE_2_SELECT		    (2 << 4)
 # define DP_FEC_LANE_3_SELECT		    (3 << 4)
 
+#define DP_SDP_ERROR_DETECTION		    0x121	/* DP 2.0 E11 */
+#define DP_SDP_CRC16_128B132B_EN	    BIT(0)
+
 #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
 
-- 
2.25.1

