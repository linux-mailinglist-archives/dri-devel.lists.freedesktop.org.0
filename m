Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C8769192
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 11:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32B410E17E;
	Mon, 31 Jul 2023 09:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-172.mail.aliyun.com (out28-172.mail.aliyun.com
 [115.124.28.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F43310E17E;
 Mon, 31 Jul 2023 09:22:43 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07502602|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.461785-0.00373639-0.534478;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U4lAjtS_1690795270; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U4lAjtS_1690795270) by smtp.aliyun-inc.com;
 Mon, 31 Jul 2023 17:22:36 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v11_0_pptable.h
Date: Mon, 31 Jul 2023 09:21:08 +0000
Message-Id: <20230731092108.3162-1-sunran001@208suo.com>
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

ERROR: trailing whitespace
ERROR: open brace '{' following struct go on the same line
ERROR: code indent should use tabs where possible

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h  | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
index 0116e3d04fad..df7430876e0c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
@@ -101,8 +101,7 @@ enum SMU_11_0_ODSETTING_ID {
 };
 #define SMU_11_0_MAX_ODSETTING    32          //Maximum Number of ODSettings
 
-struct smu_11_0_overdrive_table
-{
+struct smu_11_0_overdrive_table {
     uint8_t  revision;                                        //Revision = SMU_11_0_PP_OVERDRIVE_VERSION
     uint8_t  reserve[3];                                      //Zero filled field reserved for future use
     uint32_t feature_count;                                   //Total number of supported features
@@ -127,8 +126,7 @@ enum SMU_11_0_PPCLOCK_ID {
 };
 #define SMU_11_0_MAX_PPCLOCK      16          //Maximum Number of PP Clocks
 
-struct smu_11_0_power_saving_clock_table
-{
+struct smu_11_0_power_saving_clock_table {
     uint8_t  revision;                                        //Revision = SMU_11_0_PP_POWERSAVINGCLOCK_VERSION
     uint8_t  reserve[3];                                      //Zero filled field reserved for future use
     uint32_t count;                                           //power_saving_clock_count = SMU_11_0_PPCLOCK_COUNT
@@ -136,8 +134,7 @@ struct smu_11_0_power_saving_clock_table
     uint32_t min[SMU_11_0_MAX_PPCLOCK];                       //PowerSavingClock Mode Clock Minimum array In MHz
 };
 
-struct smu_11_0_powerplay_table
-{
+struct smu_11_0_powerplay_table {
       struct atom_common_table_header header;
       uint8_t  table_revision;
       uint16_t table_size;                          //Driver portion table size. The offset to smc_pptable including header size
@@ -145,14 +142,14 @@ struct smu_11_0_powerplay_table
       uint32_t golden_revision;
       uint16_t format_id;
       uint32_t platform_caps;                       //POWERPLAYABLE::ulPlatformCaps
-                                                    
+
       uint8_t  thermal_controller_type;             //one of SMU_11_0_PP_THERMALCONTROLLER
 
       uint16_t small_power_limit1;
       uint16_t small_power_limit2;
       uint16_t boost_power_limit;
-      uint16_t od_turbo_power_limit;                //Power limit setting for Turbo mode in Performance UI Tuning. 
-      uint16_t od_power_save_power_limit;           //Power limit setting for PowerSave/Optimal mode in Performance UI Tuning. 
+      uint16_t od_turbo_power_limit;                //Power limit setting for Turbo mode in Performance UI Tuning.
+      uint16_t od_power_save_power_limit;           //Power limit setting for PowerSave/Optimal mode in Performance UI Tuning.
       uint16_t software_shutdown_temp;
 
       uint16_t reserve[6];                          //Zero filled field reserved for future use
-- 
2.17.1

