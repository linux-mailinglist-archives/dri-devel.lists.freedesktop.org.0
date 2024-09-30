Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E798AD80
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA3E10E594;
	Mon, 30 Sep 2024 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D50C12Gc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F2E10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726050; x=1759262050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/13AV9KFtYtr7kb/tDqg8Jl0Sy+dmY6qsC3MHwN/6cA=;
 b=D50C12GcRbo2XrvY9dvWVTaz40WxUyGtjHYqbLfJGJnFy2Hvk4kSVPLB
 PYvT/Q5D5wxXKkbrdUeIf9vXJQOz5TmHJiz5vJJSDD9eOE157Yii2COcA
 bKiMcn+5smVo9vwF/fISAW0EvozQlxeUngAX9jl08j4xfLRwaKreq7pJx
 tAPRQG8zTDMUFsH6+jdxfDCw1HZDdTh3snNZ+mDddT3+Xpz6WLuPqUCXP
 jNm8xRk48kJLjv9lCwVPj30lWgTj09ybvOuV1oCUbod7kqnvRaPgAWOQN
 4jaaZcdICRAGKExZRoSssdqpSgtedXwAVg7RRt2Wg4x3qA8rCDPdjgAFX g==;
X-CSE-ConnectionGUID: OSzH9z+NTOSOZEB0rEc9dQ==
X-CSE-MsgGUID: j/14egpVRLCd4/Jt4mqqZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962389"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962389"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:10 -0700
X-CSE-ConnectionGUID: PoHfx6dbSgSw/xoSUjsN7w==
X-CSE-MsgGUID: n8SOvFJUTqmfHpOR7NnvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370256"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:09 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 29/31] accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
Date: Mon, 30 Sep 2024 21:53:20 +0200
Message-ID: <20240930195322.461209-30-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

