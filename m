Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369E66E524
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02D10E2F0;
	Tue, 17 Jan 2023 17:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC82D10E2F0;
 Tue, 17 Jan 2023 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673977521; x=1705513521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ubh/DFz9VR75xvB1bkoItkO1Y6HAmMWGYEXAyyGVRMI=;
 b=KzxwbWkCeP1iy0J25ZxoU4/VWzj2LDiqLnMixL3E4MA9lOAgZ3kNlWl0
 F6MuqTGjwy2g4Cn+TSD0xO9sAfvVTj9uQ3pGAPnVvpqZLCQm/IdawPIag
 jPevmCUbyIjWm2h2dyDOvc8Wp6vdpvj9ZL0dwp2+H9wHsWNTLzUKjja6l
 jiQPI8PuNZVrFOttiZxKC4SdxLbcpIhIaibQfoyM6sSOg/ePf0L4TxDFK
 Rj/UMbtb/LhkuH2qHVh23v/R/qth4yDdhSvGDgalJ+Lef9IqMtYcC4wJU
 X3nneTUPnklLwHOxNsqZuVbG1h8mOWRVHGhFLSNOpuBD/WRn6QlFogxMC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304447943"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304447943"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:45:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="833250882"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="833250882"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:45:19 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/radeon: Do not use deprecated drm log API
Date: Tue, 17 Jan 2023 18:44:46 +0100
Message-Id: <20230117174447.21870-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace deprecated DRM_DEBUG_KMS_RATELIMITED() and DRM_ERROR()
with proper APIs.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/radeon/radeon_dp_auxch.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_dp_auxch.c b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
index 69379b95146e..76ce66efb5f8 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_auxch.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_auxch.c
@@ -158,7 +158,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
 	} while (retry_count++ < 1000);
 
 	if (retry_count >= 1000) {
-		DRM_ERROR("auxch hw never signalled completion, error %08x\n", tmp);
+		pr_err("auxch hw never signalled completion, error %08x\n", tmp);
 		ret = -EIO;
 		goto done;
 	}
@@ -168,8 +168,7 @@ radeon_dp_aux_transfer_native(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg
 		goto done;
 	}
 	if (tmp & AUX_RX_ERROR_FLAGS) {
-		DRM_DEBUG_KMS_RATELIMITED("dp_aux_ch flags not zero: %08x\n",
-					  tmp);
+		drm_dbg_kms_ratelimited(dev, "dp_aux_ch flags not zero: %08x\n", tmp);
 		ret = -EIO;
 		goto done;
 	}
-- 
2.39.0

