Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529582AAA7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6FC10E879;
	Thu, 11 Jan 2024 09:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id E33B510E879;
 Thu, 11 Jan 2024 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ANh4pAwZpkDzMmcYP4
 1qmTYtR0ncmnJwKttV5HAQYLE=; b=nzL0TTFUMyTRzUuQucsBhgV2CmdunPa9rW
 Hi7Kb/CzeKtmW/mVy39jAZtAAPUiPAzXUG1RJXDQMoyATnzftpHGHQgXHK2FYGn7
 YUAELHBvWWDov10bLseuh0yV/zayM5aNacQdGyctjOxauWmPoNjz7ejzuBHjVwjq
 zMWdvrpnY=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3v+6gsp9lfGWlAA--.23421S2;
 Thu, 11 Jan 2024 17:19:28 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in atombios.h
Date: Thu, 11 Jan 2024 09:19:27 +0000
Message-Id: <20240111091927.13653-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3v+6gsp9lfGWlAA--.23421S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJr48trWrAF18Kw1xGry8Xwb_yoW8Wr4fXo
 W7GF9xJr47Gw15Jr4Utry8ta45KrsIqw1UGr13Gryj9rWDGr1DJr1DA3WUJr1fKF17Zw1D
 Zry2q34DXry8A3W5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RRJPiDUUUU
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAFixWVLZWkxpgAAsL
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
ERROR: space required after that close brace '}'

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/atombios.h | 135 ++++++++++++------------------
 1 file changed, 54 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db40789235c..141dc17ba632 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -197,19 +197,17 @@
   Every table pointed  _ATOM_MASTER_DATA_TABLE has this common header. 
   And the pointer actually points to this header. */
 
-typedef struct _ATOM_COMMON_TABLE_HEADER
-{
+typedef struct _ATOM_COMMON_TABLE_HEADER {
   USHORT usStructureSize;
   UCHAR  ucTableFormatRevision;   /*Change it when the Parser is not backward compatible */
   UCHAR  ucTableContentRevision;  /*Change it only when the table needs to change but the firmware */
                                   /*Image can't be updated, while Driver needs to carry the new table! */
-}ATOM_COMMON_TABLE_HEADER;
+} ATOM_COMMON_TABLE_HEADER;
 
 /****************************************************************************/	
 // Structure stores the ROM header.
 /****************************************************************************/	
-typedef struct _ATOM_ROM_HEADER
-{
+typedef struct _ATOM_ROM_HEADER {
   ATOM_COMMON_TABLE_HEADER		sHeader;
   UCHAR	 uaFirmWareSignature[4];    /*Signature to distinguish between Atombios and non-atombios, 
                                       atombios should init it as "ATOM", don't change the position */
@@ -228,7 +226,7 @@ typedef struct _ATOM_ROM_HEADER
   USHORT usMasterDataTableOffset;   /*Offset for SW to get all data table offsets, Don't change the position */
   UCHAR  ucExtendedFunctionCode;
   UCHAR  ucReserved;
-}ATOM_ROM_HEADER;
+} ATOM_ROM_HEADER;
 
 /*==============================Command Table Portion==================================== */
 
@@ -342,17 +340,15 @@ typedef struct _ATOM_MASTER_LIST_OF_COMMAND_TABLES{
 #define LCD1OutputControl                        HW_Misc_Operation
 #define TV1OutputControl                         Gfx_Harvesting
 
-typedef struct _ATOM_MASTER_COMMAND_TABLE
-{
+typedef struct _ATOM_MASTER_COMMAND_TABLE {
   ATOM_COMMON_TABLE_HEADER           sHeader;
   ATOM_MASTER_LIST_OF_COMMAND_TABLES ListOfCommandTables;
-}ATOM_MASTER_COMMAND_TABLE;
+} ATOM_MASTER_COMMAND_TABLE;
 
 /****************************************************************************/	
 // Structures used in every command table
 /****************************************************************************/	
-typedef struct _ATOM_TABLE_ATTRIBUTE
-{
+typedef struct _ATOM_TABLE_ATTRIBUTE {
 #if ATOM_BIG_ENDIAN
   USHORT  UpdatedByUtility:1;         //[15]=Table updated by utility flag
   USHORT  PS_SizeInBytes:7;           //[14:8]=Size of parameter space in Bytes (multiple of a dword), 
@@ -362,24 +358,22 @@ typedef struct _ATOM_TABLE_ATTRIBUTE
   USHORT  PS_SizeInBytes:7;           //[14:8]=Size of parameter space in Bytes (multiple of a dword), 
   USHORT  UpdatedByUtility:1;         //[15]=Table updated by utility flag
 #endif
-}ATOM_TABLE_ATTRIBUTE;
+} ATOM_TABLE_ATTRIBUTE;
 
-typedef union _ATOM_TABLE_ATTRIBUTE_ACCESS
-{
+typedef union _ATOM_TABLE_ATTRIBUTE_ACCESS {
   ATOM_TABLE_ATTRIBUTE sbfAccess;
   USHORT               susAccess;
-}ATOM_TABLE_ATTRIBUTE_ACCESS;
+} ATOM_TABLE_ATTRIBUTE_ACCESS;
 
 /****************************************************************************/	
 // Common header for all command tables.
 // Every table pointed by _ATOM_MASTER_COMMAND_TABLE has this common header. 
 // And the pointer actually points to this header.
 /****************************************************************************/	
-typedef struct _ATOM_COMMON_ROM_COMMAND_TABLE_HEADER
-{
+typedef struct _ATOM_COMMON_ROM_COMMAND_TABLE_HEADER {
   ATOM_COMMON_TABLE_HEADER CommonHeader;
   ATOM_TABLE_ATTRIBUTE     TableAttribute;	
-}ATOM_COMMON_ROM_COMMAND_TABLE_HEADER;
+} ATOM_COMMON_ROM_COMMAND_TABLE_HEADER;
 
 /****************************************************************************/	
 // Structures used by ComputeMemoryEnginePLLTable
@@ -391,8 +385,7 @@ typedef struct _ATOM_COMMON_ROM_COMMAND_TABLE_HEADER
 /****************************************************************************/	
 // Structures used by AdjustMemoryControllerTable
 /****************************************************************************/	
-typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ
-{
+typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ {
 #if ATOM_BIG_ENDIAN
   ULONG ulPointerReturnFlag:1;      // BYTE_3[7]=1 - Return the pointer to the right Data Block; BYTE_3[7]=0 - Program the right Data Block 
   ULONG ulMemoryModuleNumber:7;     // BYTE_3[6:0]
@@ -402,25 +395,23 @@ typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ
   ULONG ulMemoryModuleNumber:7;     // BYTE_3[6:0]
   ULONG ulPointerReturnFlag:1;      // BYTE_3[7]=1 - Return the pointer to the right Data Block; BYTE_3[7]=0 - Program the right Data Block 
 #endif
-}ATOM_ADJUST_MEMORY_CLOCK_FREQ;
+} ATOM_ADJUST_MEMORY_CLOCK_FREQ;
 #define POINTER_RETURN_FLAG             0x80
 
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS {
   ULONG   ulClock;        //When returen, it's the re-calculated clock based on given Fb_div Post_Div and ref_div
   UCHAR   ucAction;       //0:reserved //1:Memory //2:Engine  
   UCHAR   ucReserved;     //may expand to return larger Fbdiv later
   UCHAR   ucFbDiv;        //return value
   UCHAR   ucPostDiv;      //return value
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS;
 
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2 {
   ULONG   ulClock;        //When return, [23:0] return real clock 
   UCHAR   ucAction;       //0:reserved;COMPUTE_MEMORY_PLL_PARAM:Memory;COMPUTE_ENGINE_PLL_PARAM:Engine. it return ref_div to be written to register
   USHORT  usFbDiv;		    //return Feedback value to be written to register
   UCHAR   ucPostDiv;      //return post div to be written to register
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2;
 #define COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_PS_ALLOCATION   COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS
 
 
@@ -438,8 +429,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2
 #define b3FIRST_TIME_CHANGE_CLOCK									0x08       //Applicable to both memory and engine clock change,when set, it means this is 1st time to change clock after ASIC bootup
 #define b3SKIP_SW_PROGRAM_PLL											0x10			 //Applicable to both memory and engine clock change, when set, it means the table will not program SPLL/MPLL
 
-typedef struct _ATOM_COMPUTE_CLOCK_FREQ
-{
+typedef struct _ATOM_COMPUTE_CLOCK_FREQ {
 #if ATOM_BIG_ENDIAN
   ULONG ulComputeClockFlag:8;                 // =1: COMPUTE_MEMORY_PLL_PARAM, =2: COMPUTE_ENGINE_PLL_PARAM
   ULONG ulClockFreq:24;                       // in unit of 10kHz
@@ -447,16 +437,14 @@ typedef struct _ATOM_COMPUTE_CLOCK_FREQ
   ULONG ulClockFreq:24;                       // in unit of 10kHz
   ULONG ulComputeClockFlag:8;                 // =1: COMPUTE_MEMORY_PLL_PARAM, =2: COMPUTE_ENGINE_PLL_PARAM
 #endif
-}ATOM_COMPUTE_CLOCK_FREQ;
+} ATOM_COMPUTE_CLOCK_FREQ;
 
-typedef struct _ATOM_S_MPLL_FB_DIVIDER
-{
+typedef struct _ATOM_S_MPLL_FB_DIVIDER {
   USHORT usFbDivFrac;  
   USHORT usFbDiv;  
-}ATOM_S_MPLL_FB_DIVIDER;
+} ATOM_S_MPLL_FB_DIVIDER;
 
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3 {
   union
   {
     ATOM_COMPUTE_CLOCK_FREQ  ulClock;         //Input Parameter
@@ -467,7 +455,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3
   UCHAR   ucPostDiv;                          //Output Parameter      
   UCHAR   ucCntlFlag;                         //Output Parameter      
   UCHAR   ucReserved;
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3;
 
 // ucCntlFlag
 #define ATOM_PLL_CNTL_FLAG_PLL_POST_DIV_EN          1
@@ -477,8 +465,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3
 
 
 // V4 are only used for APU which PLL outside GPU
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4 {
 #if ATOM_BIG_ENDIAN
   ULONG  ucPostDiv:8;        //return parameter: post divider which is used to program to register directly
   ULONG  ulClock:24;         //Input= target clock, output = actual clock 
@@ -486,10 +473,9 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4
   ULONG  ulClock:24;         //Input= target clock, output = actual clock 
   ULONG  ucPostDiv:8;        //return parameter: post divider which is used to program to register directly
 #endif
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4;
 
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5 {
   union
   {
     ATOM_COMPUTE_CLOCK_FREQ  ulClock;         //Input Parameter
@@ -504,29 +490,27 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5
     UCHAR   ucInputFlag;                      //Input Flags. ucInputFlag[0] - Strobe(1)/Performance(0) mode
   };
   UCHAR   ucReserved;                       
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5;
 
 
-typedef struct _COMPUTE_GPU_CLOCK_INPUT_PARAMETERS_V1_6
-{
+typedef struct _COMPUTE_GPU_CLOCK_INPUT_PARAMETERS_V1_6 {
   ATOM_COMPUTE_CLOCK_FREQ  ulClock;         //Input Parameter
   ULONG   ulReserved[2];
-}COMPUTE_GPU_CLOCK_INPUT_PARAMETERS_V1_6;
+} COMPUTE_GPU_CLOCK_INPUT_PARAMETERS_V1_6;
 
 //ATOM_COMPUTE_CLOCK_FREQ.ulComputeClockFlag
 #define COMPUTE_GPUCLK_INPUT_FLAG_CLK_TYPE_MASK            0x0f
 #define COMPUTE_GPUCLK_INPUT_FLAG_DEFAULT_GPUCLK           0x00
 #define COMPUTE_GPUCLK_INPUT_FLAG_SCLK                     0x01
 
-typedef struct _COMPUTE_GPU_CLOCK_OUTPUT_PARAMETERS_V1_6
-{
+typedef struct _COMPUTE_GPU_CLOCK_OUTPUT_PARAMETERS_V1_6 {
   COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4  ulClock;         //Output Parameter: ucPostDiv=DFS divider
   ATOM_S_MPLL_FB_DIVIDER   ulFbDiv;         //Output Parameter: PLL FB divider
   UCHAR   ucPllRefDiv;                      //Output Parameter: PLL ref divider      
   UCHAR   ucPllPostDiv;                     //Output Parameter: PLL post divider      
   UCHAR   ucPllCntlFlag;                    //Output Flags: control flag
   UCHAR   ucReserved;                       
-}COMPUTE_GPU_CLOCK_OUTPUT_PARAMETERS_V1_6;
+} COMPUTE_GPU_CLOCK_OUTPUT_PARAMETERS_V1_6;
 
 //ucPllCntlFlag
 #define SPLL_CNTL_FLAG_VCO_MODE_MASK            0x03 
@@ -536,8 +520,7 @@ typedef struct _COMPUTE_GPU_CLOCK_OUTPUT_PARAMETERS_V1_6
 #define ATOM_PLL_INPUT_FLAG_PLL_STROBE_MODE_EN  1   // 1-StrobeMode, 0-PerformanceMode
 
 // use for ComputeMemoryClockParamTable
-typedef struct _COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1
-{
+typedef struct _COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1 {
   union
   {
     ULONG  ulClock;         
@@ -550,7 +533,7 @@ typedef struct _COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1
     UCHAR   ucPllCntlFlag;                    //Output: 
   };
   UCHAR   ucBWCntl;                       
-}COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1;
+} COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1;
 
 // definition of ucInputFlag
 #define MPLL_INPUT_FLAG_STROBE_MODE_EN          0x01
@@ -563,81 +546,71 @@ typedef struct _COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1
 //MPLL_CNTL_FLAG_BYPASS_AD_PLL has a wrong name, should be BYPASS_DQ_PLL
 #define MPLL_CNTL_FLAG_BYPASS_AD_PLL            0x04
 
-typedef struct _DYNAMICE_MEMORY_SETTINGS_PARAMETER
-{
+typedef struct _DYNAMICE_MEMORY_SETTINGS_PARAMETER {
   ATOM_COMPUTE_CLOCK_FREQ ulClock;
   ULONG ulReserved[2];
-}DYNAMICE_MEMORY_SETTINGS_PARAMETER;
+} DYNAMICE_MEMORY_SETTINGS_PARAMETER;
 
-typedef struct _DYNAMICE_ENGINE_SETTINGS_PARAMETER
-{
+typedef struct _DYNAMICE_ENGINE_SETTINGS_PARAMETER {
   ATOM_COMPUTE_CLOCK_FREQ ulClock;
   ULONG ulMemoryClock;
   ULONG ulReserved;
-}DYNAMICE_ENGINE_SETTINGS_PARAMETER;
+} DYNAMICE_ENGINE_SETTINGS_PARAMETER;
 
 /****************************************************************************/	
 // Structures used by SetEngineClockTable
 /****************************************************************************/	
-typedef struct _SET_ENGINE_CLOCK_PARAMETERS
-{
+typedef struct _SET_ENGINE_CLOCK_PARAMETERS {
   ULONG ulTargetEngineClock;          //In 10Khz unit
-}SET_ENGINE_CLOCK_PARAMETERS;
+} SET_ENGINE_CLOCK_PARAMETERS;
 
-typedef struct _SET_ENGINE_CLOCK_PS_ALLOCATION
-{
+typedef struct _SET_ENGINE_CLOCK_PS_ALLOCATION {
   ULONG ulTargetEngineClock;          //In 10Khz unit
   COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_PS_ALLOCATION sReserved;
-}SET_ENGINE_CLOCK_PS_ALLOCATION;
+} SET_ENGINE_CLOCK_PS_ALLOCATION;
 
 /****************************************************************************/	
 // Structures used by SetMemoryClockTable
 /****************************************************************************/	
-typedef struct _SET_MEMORY_CLOCK_PARAMETERS
-{
+typedef struct _SET_MEMORY_CLOCK_PARAMETERS {
   ULONG ulTargetMemoryClock;          //In 10Khz unit
-}SET_MEMORY_CLOCK_PARAMETERS;
+} SET_MEMORY_CLOCK_PARAMETERS;
 
-typedef struct _SET_MEMORY_CLOCK_PS_ALLOCATION
-{
+typedef struct _SET_MEMORY_CLOCK_PS_ALLOCATION {
   ULONG ulTargetMemoryClock;          //In 10Khz unit
   COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_PS_ALLOCATION sReserved;
-}SET_MEMORY_CLOCK_PS_ALLOCATION;
+} SET_MEMORY_CLOCK_PS_ALLOCATION;
 
 /****************************************************************************/	
 // Structures used by ASIC_Init.ctb
 /****************************************************************************/	
-typedef struct _ASIC_INIT_PARAMETERS
-{
+typedef struct _ASIC_INIT_PARAMETERS {
   ULONG ulDefaultEngineClock;         //In 10Khz unit
   ULONG ulDefaultMemoryClock;         //In 10Khz unit
-}ASIC_INIT_PARAMETERS;
+} ASIC_INIT_PARAMETERS;
 
-typedef struct _ASIC_INIT_PS_ALLOCATION
-{
+typedef struct _ASIC_INIT_PS_ALLOCATION {
   ASIC_INIT_PARAMETERS sASICInitClocks;
   SET_ENGINE_CLOCK_PS_ALLOCATION sReserved; //Caller doesn't need to init this structure
-}ASIC_INIT_PS_ALLOCATION;
+} ASIC_INIT_PS_ALLOCATION;
 
 /****************************************************************************/	
 // Structure used by DynamicClockGatingTable.ctb
 /****************************************************************************/	
-typedef struct _DYNAMIC_CLOCK_GATING_PARAMETERS 
-{
+typedef struct _DYNAMIC_CLOCK_GATING_PARAMETERS {
   UCHAR ucEnable;                     // ATOM_ENABLE or ATOM_DISABLE
   UCHAR ucPadding[3];
-}DYNAMIC_CLOCK_GATING_PARAMETERS;
+} DYNAMIC_CLOCK_GATING_PARAMETERS;
 #define  DYNAMIC_CLOCK_GATING_PS_ALLOCATION  DYNAMIC_CLOCK_GATING_PARAMETERS
 
 /****************************************************************************/	
 // Structure used by EnableDispPowerGatingTable.ctb
 /****************************************************************************/	
-typedef struct _ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1 
-{
+typedef struct _ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1 {
   UCHAR ucDispPipeId;                 // ATOM_CRTC1, ATOM_CRTC2, ...
   UCHAR ucEnable;                     // ATOM_ENABLE or ATOM_DISABLE
   UCHAR ucPadding[2];
-}ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1;
+} ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1;
 
 /****************************************************************************/	
 // Structure used by EnableASIC_StaticPwrMgtTable.ctb
-- 
2.17.1

