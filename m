Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0A76C6BF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B810E50D;
	Wed,  2 Aug 2023 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com
 [115.124.28.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0115210E50D;
 Wed,  2 Aug 2023 07:26:31 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2717956|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.00605419-0.000108826-0.993837; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6c61oB_1690961182; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6c61oB_1690961182) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:26:24 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_trace.h
Date: Wed,  2 Aug 2023 07:26:21 +0000
Message-Id: <20230802072621.13162-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space required after that ',' (ctx:VxV)
ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 525dffbe046a..2fd1bfb35916 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -432,7 +432,7 @@ TRACE_EVENT(amdgpu_vm_flush,
 			   ),
 	    TP_printk("ring=%s, id=%u, hub=%u, pd_addr=%010Lx",
 		      __get_str(ring), __entry->vmid,
-		      __entry->vm_hub,__entry->pd_addr)
+		      __entry->vm_hub, __entry->pd_addr)
 );
 
 DECLARE_EVENT_CLASS(amdgpu_pasid,
@@ -494,7 +494,7 @@ TRACE_EVENT(amdgpu_cs_bo_status,
 );
 
 TRACE_EVENT(amdgpu_bo_move,
-	    TP_PROTO(struct amdgpu_bo* bo, uint32_t new_placement, uint32_t old_placement),
+	    TP_PROTO(struct amdgpu_bo *bo, uint32_t new_placement, uint32_t old_placement),
 	    TP_ARGS(bo, new_placement, old_placement),
 	    TP_STRUCT__entry(
 			__field(struct amdgpu_bo *, bo)
-- 
2.17.1

