Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7882AB3E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507710E8AE;
	Thu, 11 Jan 2024 09:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E83B10E8AE;
 Thu, 11 Jan 2024 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=CZTg81iutW54axTjIf
 bjpfxpldyd+uUwJ9EHJOjglyo=; b=LdoUeKMGiBrTYuxqx5+PgGfA0s7DRr4ZrT
 toxU2Rx2FKW4k+kuzkLs1FdJeSC2cKMK41rflGscXG8fIoK+OIJT5ueE2LZDJz1Y
 NpdHpyjAJI554iPHKaahlG2fE0oBOq0OuYSMkTdb0etjc7fmN84qIzqElBw4Hua5
 MzqlZL/2Q=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3n5nDuZ9lmeilAA--.50391S2;
 Thu, 11 Jan 2024 17:49:55 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/ni_dpm: Clean up errors in nislands_smc.h
Date: Thu, 11 Jan 2024 09:49:53 +0000
Message-Id: <20240111094953.14435-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3n5nDuZ9lmeilAA--.50391S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrWfWry8Aw17urWfZFW8Zwb_yoW7KFWUpF
 43Gw4DKr40gFnruw4fJr48Ary3trZFyr43CFy7u34FgF4jvrWI9F1IkFWUAr1fC348u34S
 yr97tw4UW3WakFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRyGQkUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHARixWV2z0UxMAAAsn
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
Cc: XueBing Chen <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/nislands_smc.h | 51 +++++++++------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/radeon/nislands_smc.h b/drivers/gpu/drm/radeon/nislands_smc.h
index 42f3bab0f9ee..097893c38915 100644
--- a/drivers/gpu/drm/radeon/nislands_smc.h
+++ b/drivers/gpu/drm/radeon/nislands_smc.h
@@ -27,8 +27,7 @@
 
 #define NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE 16
 
-struct PP_NIslands_Dpm2PerfLevel
-{
+struct PP_NIslands_Dpm2PerfLevel {
     uint8_t     MaxPS;
     uint8_t     TgtAct;
     uint8_t     MaxPS_StepInc;
@@ -44,8 +43,7 @@ struct PP_NIslands_Dpm2PerfLevel
 
 typedef struct PP_NIslands_Dpm2PerfLevel PP_NIslands_Dpm2PerfLevel;
 
-struct PP_NIslands_DPM2Parameters
-{
+struct PP_NIslands_DPM2Parameters {
     uint32_t    TDPLimit;
     uint32_t    NearTDPLimit;
     uint32_t    SafePowerLimit;
@@ -53,8 +51,7 @@ struct PP_NIslands_DPM2Parameters
 };
 typedef struct PP_NIslands_DPM2Parameters PP_NIslands_DPM2Parameters;
 
-struct NISLANDS_SMC_SCLK_VALUE
-{
+struct NISLANDS_SMC_SCLK_VALUE {
     uint32_t        vCG_SPLL_FUNC_CNTL;
     uint32_t        vCG_SPLL_FUNC_CNTL_2;
     uint32_t        vCG_SPLL_FUNC_CNTL_3;
@@ -66,8 +63,7 @@ struct NISLANDS_SMC_SCLK_VALUE
 
 typedef struct NISLANDS_SMC_SCLK_VALUE NISLANDS_SMC_SCLK_VALUE;
 
-struct NISLANDS_SMC_MCLK_VALUE
-{
+struct NISLANDS_SMC_MCLK_VALUE {
     uint32_t        vMPLL_FUNC_CNTL;
     uint32_t        vMPLL_FUNC_CNTL_1;
     uint32_t        vMPLL_FUNC_CNTL_2;
@@ -84,8 +80,7 @@ struct NISLANDS_SMC_MCLK_VALUE
 
 typedef struct NISLANDS_SMC_MCLK_VALUE NISLANDS_SMC_MCLK_VALUE;
 
-struct NISLANDS_SMC_VOLTAGE_VALUE
-{
+struct NISLANDS_SMC_VOLTAGE_VALUE {
     uint16_t             value;
     uint8_t              index;
     uint8_t              padding;
@@ -93,8 +88,7 @@ struct NISLANDS_SMC_VOLTAGE_VALUE
 
 typedef struct NISLANDS_SMC_VOLTAGE_VALUE NISLANDS_SMC_VOLTAGE_VALUE;
 
-struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL
-{
+struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL {
     uint8_t                     arbValue;
     uint8_t                     ACIndex;
     uint8_t                     displayWatermark;
@@ -132,8 +126,7 @@ struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL
 
 typedef struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL NISLANDS_SMC_HW_PERFORMANCE_LEVEL;
 
-struct NISLANDS_SMC_SWSTATE
-{
+struct NISLANDS_SMC_SWSTATE {
 	uint8_t                             flags;
 	uint8_t                             levelCount;
 	uint8_t                             padding2;
@@ -156,8 +149,7 @@ struct NISLANDS_SMC_SWSTATE_SINGLE {
 #define NISLANDS_SMC_VOLTAGEMASK_VDDCI 2
 #define NISLANDS_SMC_VOLTAGEMASK_MAX   4
 
-struct NISLANDS_SMC_VOLTAGEMASKTABLE
-{
+struct NISLANDS_SMC_VOLTAGEMASKTABLE {
     uint8_t  highMask[NISLANDS_SMC_VOLTAGEMASK_MAX];
     uint32_t lowMask[NISLANDS_SMC_VOLTAGEMASK_MAX];
 };
@@ -166,8 +158,7 @@ typedef struct NISLANDS_SMC_VOLTAGEMASKTABLE NISLANDS_SMC_VOLTAGEMASKTABLE;
 
 #define NISLANDS_MAX_NO_VREG_STEPS 32
 
-struct NISLANDS_SMC_STATETABLE
-{
+struct NISLANDS_SMC_STATETABLE {
 	uint8_t                             thermalProtectType;
 	uint8_t                             systemFlags;
 	uint8_t                             maxVDDCIndexInPPTable;
@@ -203,8 +194,7 @@ typedef struct NISLANDS_SMC_STATETABLE NISLANDS_SMC_STATETABLE;
 #define SMC_NISLANDS_LKGE_LUT_NUM_OF_VOLT_ENTRIES 16
 #define SMC_NISLANDS_BIF_LUT_NUM_OF_ENTRIES 4
 
-struct SMC_NISLANDS_MC_TPP_CAC_TABLE
-{
+struct SMC_NISLANDS_MC_TPP_CAC_TABLE {
     uint32_t    tpp[SMC_NISLANDS_MC_TPP_CAC_NUM_OF_ENTRIES];
     uint32_t    cacValue[SMC_NISLANDS_MC_TPP_CAC_NUM_OF_ENTRIES];
 };
@@ -212,8 +202,7 @@ struct SMC_NISLANDS_MC_TPP_CAC_TABLE
 typedef struct SMC_NISLANDS_MC_TPP_CAC_TABLE SMC_NISLANDS_MC_TPP_CAC_TABLE;
 
 
-struct PP_NIslands_CACTABLES
-{
+struct PP_NIslands_CACTABLES {
     uint32_t                cac_bif_lut[SMC_NISLANDS_BIF_LUT_NUM_OF_ENTRIES];
     uint32_t                cac_lkge_lut[SMC_NISLANDS_LKGE_LUT_NUM_OF_TEMP_ENTRIES][SMC_NISLANDS_LKGE_LUT_NUM_OF_VOLT_ENTRIES];
 
@@ -257,8 +246,7 @@ typedef struct PP_NIslands_CACTABLES PP_NIslands_CACTABLES;
 #define SMC_NISLANDS_MC_REGISTER_ARRAY_SIZE 32
 #define SMC_NISLANDS_MC_REGISTER_ARRAY_SET_COUNT 20
 
-struct SMC_NIslands_MCRegisterAddress
-{
+struct SMC_NIslands_MCRegisterAddress {
     uint16_t s0;
     uint16_t s1;
 };
@@ -266,15 +254,13 @@ struct SMC_NIslands_MCRegisterAddress
 typedef struct SMC_NIslands_MCRegisterAddress SMC_NIslands_MCRegisterAddress;
 
 
-struct SMC_NIslands_MCRegisterSet
-{
+struct SMC_NIslands_MCRegisterSet {
     uint32_t value[SMC_NISLANDS_MC_REGISTER_ARRAY_SIZE];
 };
 
 typedef struct SMC_NIslands_MCRegisterSet SMC_NIslands_MCRegisterSet;
 
-struct SMC_NIslands_MCRegisters
-{
+struct SMC_NIslands_MCRegisters {
     uint8_t                             last;
     uint8_t                             reserved[3];
     SMC_NIslands_MCRegisterAddress      address[SMC_NISLANDS_MC_REGISTER_ARRAY_SIZE];
@@ -283,8 +269,7 @@ struct SMC_NIslands_MCRegisters
 
 typedef struct SMC_NIslands_MCRegisters SMC_NIslands_MCRegisters;
 
-struct SMC_NIslands_MCArbDramTimingRegisterSet
-{
+struct SMC_NIslands_MCArbDramTimingRegisterSet {
     uint32_t mc_arb_dram_timing;
     uint32_t mc_arb_dram_timing2;
     uint8_t  mc_arb_rfsh_rate;
@@ -293,8 +278,7 @@ struct SMC_NIslands_MCArbDramTimingRegisterSet
 
 typedef struct SMC_NIslands_MCArbDramTimingRegisterSet SMC_NIslands_MCArbDramTimingRegisterSet;
 
-struct SMC_NIslands_MCArbDramTimingRegisters
-{
+struct SMC_NIslands_MCArbDramTimingRegisters {
     uint8_t                                     arb_current;
     uint8_t                                     reserved[3];
     SMC_NIslands_MCArbDramTimingRegisterSet     data[20];
@@ -302,8 +286,7 @@ struct SMC_NIslands_MCArbDramTimingRegisters
 
 typedef struct SMC_NIslands_MCArbDramTimingRegisters SMC_NIslands_MCArbDramTimingRegisters;
 
-struct SMC_NISLANDS_SPLL_DIV_TABLE
-{
+struct SMC_NISLANDS_SPLL_DIV_TABLE {
     uint32_t    freq[256];
     uint32_t    ss[256];
 };
-- 
2.17.1

