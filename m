Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B433D9F5C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953036ECDD;
	Thu, 29 Jul 2021 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id B366B6ECDD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:21:10 +0000 (UTC)
Received: from BC-Mail-Ex19.internal.baidu.com (unknown [172.31.51.13])
 by Forcepoint Email with ESMTPS id 71700B40EBD0355AA955;
 Thu, 29 Jul 2021 16:21:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex19.internal.baidu.com (172.31.51.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 29 Jul 2021 16:21:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 29 Jul 2021 16:21:08 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>
Subject: [PATCH] gpu/drm/radeon: Fix typo in comments
Date: Thu, 29 Jul 2021 16:20:46 +0800
Message-ID: <20210729082046.1786-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex27.internal.baidu.com (172.31.51.21) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the repeated word 'the' from comments

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/radeon/atombios.h      | 4 ++--
 drivers/gpu/drm/radeon/r300_reg.h      | 2 +-
 drivers/gpu/drm/radeon/radeon_device.c | 2 +-
 drivers/gpu/drm/radeon/radeon_fence.c  | 2 +-
 drivers/gpu/drm/radeon/radeon_vm.c     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 4b86e8b45009..83e8b8547f9b 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -2802,8 +2802,8 @@ ucMaxNBVoltageHigh:     Voltage regulator dependent PWM value. High 8 bits of  t
 ucMinNBVoltageHigh:     Voltage regulator dependent PWM value. High 8 bits of the value for the min voltage.Set this one to 0x00 if VC without PWM or no VC at all.
 
 
-usInterNBVoltageLow:    Voltage regulator dependent PWM value. The value makes the the voltage >=Min NB voltage but <=InterNBVoltageHigh. Set this to 0x0000 if VC without PWM or no VC at all.
-usInterNBVoltageHigh:   Voltage regulator dependent PWM value. The value makes the the voltage >=InterNBVoltageLow but <=Max NB voltage.Set this to 0x0000 if VC without PWM or no VC at all.
+usInterNBVoltageLow:    Voltage regulator dependent PWM value. The value makes the voltage >=Min NB voltage but <=InterNBVoltageHigh. Set this to 0x0000 if VC without PWM or no VC at all.
+usInterNBVoltageHigh:   Voltage regulator dependent PWM value. The value makes the voltage >=InterNBVoltageLow but <=Max NB voltage.Set this to 0x0000 if VC without PWM or no VC at all.
 */
 
 
diff --git a/drivers/gpu/drm/radeon/r300_reg.h b/drivers/gpu/drm/radeon/r300_reg.h
index 00c0d2ba22d3..60d5413bafa1 100644
--- a/drivers/gpu/drm/radeon/r300_reg.h
+++ b/drivers/gpu/drm/radeon/r300_reg.h
@@ -353,7 +353,7 @@
 #       define R300_PVS_CNTL_1_PROGRAM_START_SHIFT   0
 #       define R300_PVS_CNTL_1_POS_END_SHIFT         10
 #       define R300_PVS_CNTL_1_PROGRAM_END_SHIFT     20
-/* Addresses are relative the the vertex program parameters area. */
+/* Addresses are relative the vertex program parameters area. */
 #define R300_VAP_PVS_CNTL_2                 0x22D4
 #       define R300_PVS_CNTL_2_PARAM_OFFSET_SHIFT 0
 #       define R300_PVS_CNTL_2_PARAM_COUNT_SHIFT  16
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index cec03238e14d..ac8c3251b616 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -406,7 +406,7 @@ void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
 
 /*
  * radeon_wb_*()
- * Writeback is the the method by which the the GPU updates special pages
+ * Writeback is the method by which the GPU updates special pages
  * in memory with the status of certain GPU events (fences, ring pointers,
  * etc.).
  */
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 18f2c2e0dfb3..e9c47ec28ade 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -50,7 +50,7 @@
  * for GPU/CPU synchronization.  When the fence is written,
  * it is expected that all buffers associated with that fence
  * are no longer in use by the associated ring on the GPU and
- * that the the relevant GPU caches have been flushed.  Whether
+ * that the relevant GPU caches have been flushed.  Whether
  * we use a scratch register or memory location depends on the asic
  * and whether writeback is enabled.
  */
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 36a38adaaea9..bb53016f3138 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -41,7 +41,7 @@
  * (uncached system pages).
  * Each VM has an ID associated with it and there is a page table
  * associated with each VMID.  When execting a command buffer,
- * the kernel tells the the ring what VMID to use for that command
+ * the kernel tells the ring what VMID to use for that command
  * buffer.  VMIDs are allocated dynamically as commands are submitted.
  * The userspace drivers maintain their own address space and the kernel
  * sets up their pages tables accordingly when they submit their
-- 
2.25.1

