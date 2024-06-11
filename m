Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A278903B70
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD7210E5FD;
	Tue, 11 Jun 2024 12:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVBeeoJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13210E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107501; x=1749643501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aMQwIshqXP0F7VKBXMNJm5cBWLppjo0E7OgGZgQab8k=;
 b=RVBeeoJNefxBy08ePgPpZ1eV0eF+7JEK8Aik/QBFr19opm/ERTrlTiWn
 FrqWoxYae/zDmSXfmXkGytmuTg+sUYlyXhpvt7Pf3RKFOwDsNBM7G8JwQ
 cdzJrSmsctSm3xPKjYvnwIbK4Z0QvVrG2MMoH9GfJ9LcNltQC+ufehxy3
 mR5CqwfeiytKx1KwVjunpZ7Iy39VBPHeuY6v0zyimeLRjetxAx7YpMhMw
 c5JEKgP4hXFUwoM8WFyw2eCCpJwW9DaZH2iEaHv3r7dgJrcQ4FhNMvGmP
 QU9EWsAQULRfwsu+P/kJmSkm4ymJ3Ob39lcBD+bCMhNsJ0dteEMwqBF6i A==;
X-CSE-ConnectionGUID: xULILKpiStihk8SbnOnZkw==
X-CSE-MsgGUID: nb/ffOkiTd6ZpFpvafLLPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296103"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296103"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:05:01 -0700
X-CSE-ConnectionGUID: CLW73p8TTVWy5vrzMU0d4Q==
X-CSE-MsgGUID: iCBKmX7fRSeTj0cCubcCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877206"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:59 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 14/15] accel/ivpu: Remove duplicated debug messages
Date: Tue, 11 Jun 2024 14:04:31 +0200
Message-ID: <20240611120433.1012423-15-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Remove duplicated debug messages from ivpu_jsm_(un)register_db().
Debug messages are already printed one level higher.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_jsm_msg.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 216aa61ba209..46ef16c3c069 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -103,14 +103,10 @@ int ivpu_jsm_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 db_id,
 
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_REGISTER_DB_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
-	if (ret) {
-		ivpu_err_ratelimited(vdev, "Failed to register doorbell %d: %d\n", db_id, ret);
-		return ret;
-	}
-
-	ivpu_dbg(vdev, JSM, "Doorbell %d registered to context %d\n", db_id, ctx_id);
+	if (ret)
+		ivpu_err_ratelimited(vdev, "Failed to register doorbell %u: %d\n", db_id, ret);
 
-	return 0;
+	return ret;
 }
 
 int ivpu_jsm_unregister_db(struct ivpu_device *vdev, u32 db_id)
@@ -123,14 +119,10 @@ int ivpu_jsm_unregister_db(struct ivpu_device *vdev, u32 db_id)
 
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_UNREGISTER_DB_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
-	if (ret) {
-		ivpu_warn_ratelimited(vdev, "Failed to unregister doorbell %d: %d\n", db_id, ret);
-		return ret;
-	}
-
-	ivpu_dbg(vdev, JSM, "Doorbell %d unregistered\n", db_id);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to unregister doorbell %u: %d\n", db_id, ret);
 
-	return 0;
+	return ret;
 }
 
 int ivpu_jsm_get_heartbeat(struct ivpu_device *vdev, u32 engine, u64 *heartbeat)
-- 
2.45.1

