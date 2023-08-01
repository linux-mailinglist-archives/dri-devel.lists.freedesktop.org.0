Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903676A8CD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 08:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AA10E311;
	Tue,  1 Aug 2023 06:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com
 [115.124.28.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1C10E311;
 Tue,  1 Aug 2023 06:15:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08867355|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0219141-0.000104645-0.977981;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5foOkY_1690870530; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5foOkY_1690870530) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 14:15:32 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in smu7_powertune.c
Date: Tue,  1 Aug 2023 06:15:29 +0000
Message-Id: <20230801061529.6269-1-sunran001@208suo.com>
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

ERROR: that open brace { should be on the previous line
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
index 21be23ec3c79..edab3ef09d33 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
@@ -520,8 +520,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Polaris12[] = {
 	{   0xFFFFFFFF  }
 };
 
-static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] =
-{
+static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                Shift                                               Value       Type
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -646,7 +645,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] =
 	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE_MASK,   DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE__SHIFT, 0x0001,     GPU_CONFIGREG_DIDT_IND },
 	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
 	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
-	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT,0x01aa,     GPU_CONFIGREG_DIDT_IND },
+	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT, 0x01aa,     GPU_CONFIGREG_DIDT_IND },
 	{   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__UNUSED_0_MASK,                 DIDT_TCP_STALL_CTRL__UNUSED_0__SHIFT,               0x0000,     GPU_CONFIGREG_DIDT_IND },
 
 	{   ixDIDT_TCP_TUNING_CTRL,            DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE_MASK,      DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
@@ -666,8 +665,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct gpu_pt_config_reg GCCACConfig_VegaM[] =
-{
+static const struct gpu_pt_config_reg GCCACConfig_VegaM[] = {
 // ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 //      Offset                             Mask                                                Shift                                               Value       Type
 // ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -703,8 +701,7 @@ static const struct gpu_pt_config_reg GCCACConfig_VegaM[] =
     {   0xFFFFFFFF  }  // End of list
 };
 
-static const struct gpu_pt_config_reg DIDTConfig_VegaM[] =
-{
+static const struct gpu_pt_config_reg DIDTConfig_VegaM[] = {
 // ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 //      Offset                             Mask                                                Shift                                               Value       Type
 // ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -831,7 +828,7 @@ static const struct gpu_pt_config_reg DIDTConfig_VegaM[] =
     {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE_MASK,   DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE__SHIFT, 0x0001,     GPU_CONFIGREG_DIDT_IND },
     {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
     {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
-    {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT,0x01aa,     GPU_CONFIGREG_DIDT_IND },
+    {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT, 0x01aa,     GPU_CONFIGREG_DIDT_IND },
     {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__UNUSED_0_MASK,                 DIDT_TCP_STALL_CTRL__UNUSED_0__SHIFT,               0x0000,     GPU_CONFIGREG_DIDT_IND },
 
     {   ixDIDT_TCP_TUNING_CTRL,            DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE_MASK,      DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE__SHIFT,    0x0001,     GPU_CONFIGREG_DIDT_IND },
-- 
2.17.1

