Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E89984038
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78C310E66E;
	Tue, 24 Sep 2024 08:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN4H/B86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866F310E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165935; x=1758701935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iLbWGShZ6eBgTmYUIp0ik62p+7I3u1nbDP78/Ls7isY=;
 b=gN4H/B86WoOS5y2BtOJDBw9IgeLkNa4226dx59idbRKcrWlZInbNzKqz
 kGN8MNVkz89hz53l9pCYf1B2yrGLUMUu51FVS2h4onDmsTQPSfegYvx6D
 8rn1J8SFcvdTl1PN9DpQn6EycFhrhHru99ofYJunBYnGYJqXEsYzkobK6
 0xi/fktfBBYnTnMZeCiygUlrbjktGKYvR78dTIixgLZjWuC5XAQOZ/QZs
 Tu9qnAAIPOHoRW/K0dNZNpaabdLKEP2dDjuf31Y/ccp92WCbCy0+HsLWB
 y9hLuem4t3Ftz7QvWo5ppWDvDqYuBNroCW0MkZpJ8EG70p0klih4VZCRF Q==;
X-CSE-ConnectionGUID: kr6RraGHQv2xjyMCV5Z7hg==
X-CSE-MsgGUID: e/ZX4O3ZSiatHVqv37x2iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507027"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507027"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:55 -0700
X-CSE-ConnectionGUID: XIRE+A9tRLyNiGpqwgDSUA==
X-CSE-MsgGUID: g+6GuQW1TXWZwowH4KnSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170775"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:54 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 27/29] accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
Date: Tue, 24 Sep 2024 10:17:52 +0200
Message-ID: <20240924081754.209728-28-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

IVPU_TEST_MODE_HWS_EXTRA_EVENTS was never used and can be safely removed

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h     | 1 -
 drivers/accel/ivpu/ivpu_jsm_msg.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 151ab9f2ddc9b..5b43f91f20155 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -195,7 +195,6 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
 #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
 #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
-#define IVPU_TEST_MODE_HWS_EXTRA_EVENTS	  BIT(7)
 #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
 #define IVPU_TEST_MODE_TURBO		  BIT(9)
 extern int ivpu_test_mode;
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 494ebc2475b19..8f5d904ca1ed4 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -394,8 +394,6 @@ int ivpu_jsm_hws_set_scheduling_log(struct ivpu_device *vdev, u32 engine_idx, u3
 	req.payload.hws_set_scheduling_log.host_ssid = host_ssid;
 	req.payload.hws_set_scheduling_log.vpu_log_buffer_va = vpu_log_buffer_va;
 	req.payload.hws_set_scheduling_log.notify_index = 0;
-	req.payload.hws_set_scheduling_log.enable_extra_events =
-		ivpu_test_mode & IVPU_TEST_MODE_HWS_EXTRA_EVENTS;
 
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_HWS_SET_SCHEDULING_LOG_RSP, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
-- 
2.45.1

