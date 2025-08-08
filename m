Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C1B1E6FC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87810E4E8;
	Fri,  8 Aug 2025 11:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aczwwlfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DB910E4EF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754651448; x=1786187448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qJMH4rMLxxwE/O1c3WECTKwz7mnULnzoRFiFrC3/Qr4=;
 b=Aczwwlfiiiy4CrbCkUt+BpSRN0Y9u7yQQRobMdD3Jhpsf8aqESY1OP2f
 y1CmtsEcMFvofNXQxAw9GBawiAdHTgoIjM4F284AEGAoMMWf6EGc1L4JE
 edqlktFN5c3xfXq/scD6exw6TsoEa0FH4pEf4hAk5GyGOPCOTfcdNif0f
 Bi7Pt0qPN4kRqrVC4hBc9mU1U44gwWDm9FxPaAb4tCCfveVWO90r6zDp1
 j3racpCGUhi26R1nZJ8KrqFHN4LDn9NoRnNdS4cmcIG6XDmhVhVoUo6C5
 JFCDb9MY95H3fq4Ovf7WogvRGTk7GaiNLskgkWgICi30HNNE58xg22uki Q==;
X-CSE-ConnectionGUID: 4Nz+Sb+0TxumEZY0xSnbQA==
X-CSE-MsgGUID: Z/PLdw3+TWq3SjME1lCSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56713602"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56713602"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:10:47 -0700
X-CSE-ConnectionGUID: egCI+BoMQuO3qCO4D31tGg==
X-CSE-MsgGUID: phidtzjtRu+nPudCWuJ9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170556642"
Received: from unknown (HELO jlawryno.igk.intel.com) ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:10:46 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Remove unused PLL_CONFIG_DEFAULT
Date: Fri,  8 Aug 2025 13:10:44 +0200
Message-ID: <20250808111044.328800-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

This change removes the unnecessary condition, makes the code clearer,
and silences clang-tidy warning.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index b236c7234daab..afdb3b2aa72a7 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -33,7 +33,6 @@
 
 #define PLL_CDYN_DEFAULT               0x80
 #define PLL_EPP_DEFAULT                0x80
-#define PLL_CONFIG_DEFAULT             0x0
 #define PLL_REF_CLK_FREQ               50000000ull
 #define PLL_RATIO_TO_FREQ(x)           ((x) * PLL_REF_CLK_FREQ)
 
@@ -303,7 +302,7 @@ static void prepare_wp_request(struct ivpu_device *vdev, struct wp_request *wp,
 		wp->epp = 0;
 	} else {
 		wp->target = hw->pll.pn_ratio;
-		wp->cfg = enable ? PLL_CONFIG_DEFAULT : 0;
+		wp->cfg = 0;
 		wp->cdyn = enable ? PLL_CDYN_DEFAULT : 0;
 		wp->epp = enable ? PLL_EPP_DEFAULT : 0;
 	}
-- 
2.45.1

