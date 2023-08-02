Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EDA76C2DB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAB510E481;
	Wed,  2 Aug 2023 02:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-135.mail.aliyun.com (out28-135.mail.aliyun.com
 [115.124.28.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB0210E1E7;
 Wed,  2 Aug 2023 02:25:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436259|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.00153503-0.000261432-0.998204;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6M3eIS_1690943127; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6M3eIS_1690943127) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:25:28 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in sislands_smc.h
Date: Wed,  2 Aug 2023 02:25:25 +0000
Message-Id: <20230802022525.9814-1-sunran001@208suo.com>
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/pm/legacy-dpm/sislands_smc.h  | 63 +++++++------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
index c7dc117a688c..90ec411c5029 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
@@ -29,8 +29,7 @@
 
 #define SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE 16
 
-struct PP_SIslands_Dpm2PerfLevel
-{
+struct PP_SIslands_Dpm2PerfLevel {
     uint8_t MaxPS;
     uint8_t TgtAct;
     uint8_t MaxPS_StepInc;
@@ -47,8 +46,7 @@ struct PP_SIslands_Dpm2PerfLevel
 
 typedef struct PP_SIslands_Dpm2PerfLevel PP_SIslands_Dpm2PerfLevel;
 
-struct PP_SIslands_DPM2Status
-{
+struct PP_SIslands_DPM2Status {
     uint32_t    dpm2Flags;
     uint8_t     CurrPSkip;
     uint8_t     CurrPSkipPowerShift;
@@ -68,8 +66,7 @@ struct PP_SIslands_DPM2Status
 
 typedef struct PP_SIslands_DPM2Status PP_SIslands_DPM2Status;
 
-struct PP_SIslands_DPM2Parameters
-{
+struct PP_SIslands_DPM2Parameters {
     uint32_t    TDPLimit;
     uint32_t    NearTDPLimit;
     uint32_t    SafePowerLimit;
@@ -78,8 +75,7 @@ struct PP_SIslands_DPM2Parameters
 };
 typedef struct PP_SIslands_DPM2Parameters PP_SIslands_DPM2Parameters;
 
-struct PP_SIslands_PAPMStatus
-{
+struct PP_SIslands_PAPMStatus {
     uint32_t    EstimatedDGPU_T;
     uint32_t    EstimatedDGPU_P;
     uint32_t    EstimatedAPU_T;
@@ -89,8 +85,7 @@ struct PP_SIslands_PAPMStatus
 };
 typedef struct PP_SIslands_PAPMStatus PP_SIslands_PAPMStatus;
 
-struct PP_SIslands_PAPMParameters
-{
+struct PP_SIslands_PAPMParameters {
     uint32_t    NearTDPLimitTherm;
     uint32_t    NearTDPLimitPAPM;
     uint32_t    PlatformPowerLimit;
@@ -100,8 +95,7 @@ struct PP_SIslands_PAPMParameters
 };
 typedef struct PP_SIslands_PAPMParameters PP_SIslands_PAPMParameters;
 
-struct SISLANDS_SMC_SCLK_VALUE
-{
+struct SISLANDS_SMC_SCLK_VALUE {
     uint32_t    vCG_SPLL_FUNC_CNTL;
     uint32_t    vCG_SPLL_FUNC_CNTL_2;
     uint32_t    vCG_SPLL_FUNC_CNTL_3;
@@ -113,8 +107,7 @@ struct SISLANDS_SMC_SCLK_VALUE
 
 typedef struct SISLANDS_SMC_SCLK_VALUE SISLANDS_SMC_SCLK_VALUE;
 
-struct SISLANDS_SMC_MCLK_VALUE
-{
+struct SISLANDS_SMC_MCLK_VALUE {
     uint32_t    vMPLL_FUNC_CNTL;
     uint32_t    vMPLL_FUNC_CNTL_1;
     uint32_t    vMPLL_FUNC_CNTL_2;
@@ -129,8 +122,7 @@ struct SISLANDS_SMC_MCLK_VALUE
 
 typedef struct SISLANDS_SMC_MCLK_VALUE SISLANDS_SMC_MCLK_VALUE;
 
-struct SISLANDS_SMC_VOLTAGE_VALUE
-{
+struct SISLANDS_SMC_VOLTAGE_VALUE {
     uint16_t    value;
     uint8_t     index;
     uint8_t     phase_settings;
@@ -138,8 +130,7 @@ struct SISLANDS_SMC_VOLTAGE_VALUE
 
 typedef struct SISLANDS_SMC_VOLTAGE_VALUE SISLANDS_SMC_VOLTAGE_VALUE;
 
-struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL
-{
+struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL {
     uint8_t                     ACIndex;
     uint8_t                     displayWatermark;
     uint8_t                     gen2PCIE;
@@ -180,8 +171,7 @@ struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL
 
 typedef struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL SISLANDS_SMC_HW_PERFORMANCE_LEVEL;
 
-struct SISLANDS_SMC_SWSTATE
-{
+struct SISLANDS_SMC_SWSTATE {
 	uint8_t                             flags;
 	uint8_t                             levelCount;
 	uint8_t                             padding2;
@@ -205,8 +195,7 @@ struct SISLANDS_SMC_SWSTATE_SINGLE {
 #define SISLANDS_SMC_VOLTAGEMASK_VDDC_PHASE_SHEDDING 3
 #define SISLANDS_SMC_VOLTAGEMASK_MAX   4
 
-struct SISLANDS_SMC_VOLTAGEMASKTABLE
-{
+struct SISLANDS_SMC_VOLTAGEMASKTABLE {
     uint32_t lowMask[SISLANDS_SMC_VOLTAGEMASK_MAX];
 };
 
@@ -214,8 +203,7 @@ typedef struct SISLANDS_SMC_VOLTAGEMASKTABLE SISLANDS_SMC_VOLTAGEMASKTABLE;
 
 #define SISLANDS_MAX_NO_VREG_STEPS 32
 
-struct SISLANDS_SMC_STATETABLE
-{
+struct SISLANDS_SMC_STATETABLE {
 	uint8_t					thermalProtectType;
 	uint8_t					systemFlags;
 	uint8_t					maxVDDCIndexInPPTable;
@@ -254,8 +242,7 @@ typedef struct SISLANDS_SMC_STATETABLE SISLANDS_SMC_STATETABLE;
 #define SI_SMC_SOFT_REGISTER_svi_rework_gpio_id_svd   0x11c
 #define SI_SMC_SOFT_REGISTER_svi_rework_gpio_id_svc   0x120
 
-struct PP_SIslands_FanTable
-{
+struct PP_SIslands_FanTable {
 	uint8_t  fdo_mode;
 	uint8_t  padding;
 	int16_t  temp_min;
@@ -285,8 +272,7 @@ typedef struct PP_SIslands_FanTable PP_SIslands_FanTable;
 #define SMC_SISLANDS_SCALE_I  7
 #define SMC_SISLANDS_SCALE_R 12
 
-struct PP_SIslands_CacConfig
-{
+struct PP_SIslands_CacConfig {
     uint16_t   cac_lkge_lut[SMC_SISLANDS_LKGE_LUT_NUM_OF_TEMP_ENTRIES][SMC_SISLANDS_LKGE_LUT_NUM_OF_VOLT_ENTRIES];
     uint32_t   lkge_lut_V0;
     uint32_t   lkge_lut_Vstep;
@@ -308,23 +294,20 @@ typedef struct PP_SIslands_CacConfig PP_SIslands_CacConfig;
 #define SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE 16
 #define SMC_SISLANDS_MC_REGISTER_ARRAY_SET_COUNT 20
 
-struct SMC_SIslands_MCRegisterAddress
-{
+struct SMC_SIslands_MCRegisterAddress {
     uint16_t s0;
     uint16_t s1;
 };
 
 typedef struct SMC_SIslands_MCRegisterAddress SMC_SIslands_MCRegisterAddress;
 
-struct SMC_SIslands_MCRegisterSet
-{
+struct SMC_SIslands_MCRegisterSet {
     uint32_t value[SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE];
 };
 
 typedef struct SMC_SIslands_MCRegisterSet SMC_SIslands_MCRegisterSet;
 
-struct SMC_SIslands_MCRegisters
-{
+struct SMC_SIslands_MCRegisters {
     uint8_t                             last;
     uint8_t                             reserved[3];
     SMC_SIslands_MCRegisterAddress      address[SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE];
@@ -333,8 +316,7 @@ struct SMC_SIslands_MCRegisters
 
 typedef struct SMC_SIslands_MCRegisters SMC_SIslands_MCRegisters;
 
-struct SMC_SIslands_MCArbDramTimingRegisterSet
-{
+struct SMC_SIslands_MCArbDramTimingRegisterSet {
     uint32_t mc_arb_dram_timing;
     uint32_t mc_arb_dram_timing2;
     uint8_t  mc_arb_rfsh_rate;
@@ -344,8 +326,7 @@ struct SMC_SIslands_MCArbDramTimingRegisterSet
 
 typedef struct SMC_SIslands_MCArbDramTimingRegisterSet SMC_SIslands_MCArbDramTimingRegisterSet;
 
-struct SMC_SIslands_MCArbDramTimingRegisters
-{
+struct SMC_SIslands_MCArbDramTimingRegisters {
     uint8_t                                     arb_current;
     uint8_t                                     reserved[3];
     SMC_SIslands_MCArbDramTimingRegisterSet     data[16];
@@ -353,8 +334,7 @@ struct SMC_SIslands_MCArbDramTimingRegisters
 
 typedef struct SMC_SIslands_MCArbDramTimingRegisters SMC_SIslands_MCArbDramTimingRegisters;
 
-struct SMC_SISLANDS_SPLL_DIV_TABLE
-{
+struct SMC_SISLANDS_SPLL_DIV_TABLE {
     uint32_t    freq[256];
     uint32_t    ss[256];
 };
@@ -374,8 +354,7 @@ typedef struct SMC_SISLANDS_SPLL_DIV_TABLE SMC_SISLANDS_SPLL_DIV_TABLE;
 
 #define SMC_SISLANDS_DTE_MAX_TEMPERATURE_DEPENDENT_ARRAY_SIZE 16
 
-struct Smc_SIslands_DTE_Configuration
-{
+struct Smc_SIslands_DTE_Configuration {
     uint32_t tau[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
     uint32_t R[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
     uint32_t K;
-- 
2.17.1

