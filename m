Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C582A960
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0E410E807;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04EBC10E639;
 Thu, 11 Jan 2024 03:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=8J0w2ghUyXOdF5LTPu
 3UvlD3m19T2E9D3BhoiJlLJBw=; b=AUSH1xUXtg8HZKUEz3/6Zvt+E+mX+PiQxv
 48pOTbRidrVcRhtiX9ZSK22+Gy2ZCBUWGFnysY7XnirqWs4OGx2+CPyEigfpEf0q
 nWDdnILpVAi3+bZA2PqTkFzG04CquZKxbNOAknKmgi84HnE2o7GVOkYTxHdNq0Ej
 IAz89lobk=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDnL7KyXZ9lOq6dAA--.28033S2;
 Thu, 11 Jan 2024 11:17:06 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: airlied@gmail.com, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in atombios.h
Date: Thu, 11 Jan 2024 03:17:05 +0000
Message-Id: <20240111031705.7225-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnL7KyXZ9lOq6dAA--.28033S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cr48AryrZw43GFWxAFy7KFg_yoWDZFWDpF
 4UAa47G3W8try5Gr1DXr4qvr97G3srJr18Xry8Xwn3Ww1UGw1Uta42yF1ktFWkJF13tw13
 XF1qqw15Zr4jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRRbyNUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHBlixWV2zz+dwAAAsc
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: space required after that close brace '}'

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/atombios.h | 74 +++++++++++---------------
 1 file changed, 30 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71bc9..f01a2bdad699 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -205,19 +205,17 @@
 // And the pointer actually points to this header.
 /****************************************************************************/
 
-typedef struct _ATOM_COMMON_TABLE_HEADER
-{
+typedef struct _ATOM_COMMON_TABLE_HEADER {
   USHORT usStructureSize;
   UCHAR  ucTableFormatRevision;   //Change it when the Parser is not backward compatible
   UCHAR  ucTableContentRevision;  //Change it only when the table needs to change but the firmware
                                   //Image can't be updated, while Driver needs to carry the new table!
-}ATOM_COMMON_TABLE_HEADER;
+} ATOM_COMMON_TABLE_HEADER;
 
 /****************************************************************************/
 // Structure stores the ROM header.
 /****************************************************************************/
-typedef struct _ATOM_ROM_HEADER
-{
+typedef struct _ATOM_ROM_HEADER {
   ATOM_COMMON_TABLE_HEADER      sHeader;
   UCHAR  uaFirmWareSignature[4];    //Signature to distinguish between Atombios and non-atombios,
                                     //atombios should init it as "ATOM", don't change the position
@@ -236,11 +234,10 @@ typedef struct _ATOM_ROM_HEADER
   USHORT usMasterDataTableOffset;   //Offest for SW to get all data table offsets, Don't change the position
   UCHAR  ucExtendedFunctionCode;
   UCHAR  ucReserved;
-}ATOM_ROM_HEADER;
+} ATOM_ROM_HEADER;
 
 
-typedef struct _ATOM_ROM_HEADER_V2_1
-{
+typedef struct _ATOM_ROM_HEADER_V2_1 {
   ATOM_COMMON_TABLE_HEADER      sHeader;
   UCHAR  uaFirmWareSignature[4];    //Signature to distinguish between Atombios and non-atombios,
                                     //atombios should init it as "ATOM", don't change the position
@@ -260,7 +257,7 @@ typedef struct _ATOM_ROM_HEADER_V2_1
   UCHAR  ucExtendedFunctionCode;
   UCHAR  ucReserved;
   ULONG  ulPSPDirTableOffset;
-}ATOM_ROM_HEADER_V2_1;
+} ATOM_ROM_HEADER_V2_1;
 
 
 //==============================Command Table Portion====================================
@@ -269,7 +266,7 @@ typedef struct _ATOM_ROM_HEADER_V2_1
 /****************************************************************************/
 // Structures used in Command.mtb
 /****************************************************************************/
-typedef struct _ATOM_MASTER_LIST_OF_COMMAND_TABLES{
+typedef struct _ATOM_MASTER_LIST_OF_COMMAND_TABLES {
   USHORT ASIC_Init;                              //Function Table, used by various SW components,latest version 1.1
   USHORT GetDisplaySurfaceSize;                  //Atomic Table,  Used by Bios when enabling HW ICON
   USHORT ASIC_RegistersInit;                     //Atomic Table,  indirectly used by various SW components,called from ASIC_Init
@@ -351,7 +348,7 @@ typedef struct _ATOM_MASTER_LIST_OF_COMMAND_TABLES{
   USHORT ProcessAuxChannelTransaction;           //Function Table,only used by Bios
   USHORT DPEncoderService;                       //Function Table,only used by Bios
   USHORT GetVoltageInfo;                         //Function Table,only used by Bios since SI
-}ATOM_MASTER_LIST_OF_COMMAND_TABLES;
+} ATOM_MASTER_LIST_OF_COMMAND_TABLES;
 
 // For backward compatible
 #define ReadEDIDFromHWAssistedI2C                ProcessI2cChannelTransaction
@@ -377,17 +374,15 @@ typedef struct _ATOM_MASTER_LIST_OF_COMMAND_TABLES{
 
 #define MemoryRefreshConversion                  Gfx_Init
 
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
@@ -397,18 +392,17 @@ typedef struct _ATOM_TABLE_ATTRIBUTE
   USHORT  PS_SizeInBytes:7;           //[14:8]=Size of parameter space in Bytes (multiple of a dword),
   USHORT  UpdatedByUtility:1;         //[15]=Table updated by utility flag
 #endif
-}ATOM_TABLE_ATTRIBUTE;
+} ATOM_TABLE_ATTRIBUTE;
 
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
@@ -435,22 +429,20 @@ typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ
 }ATOM_ADJUST_MEMORY_CLOCK_FREQ;
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
   USHORT  usFbDiv;          //return Feedback value to be written to register
   UCHAR   ucPostDiv;      //return post div to be written to register
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2;
 
 #define COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_PS_ALLOCATION   COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS
 
@@ -472,8 +464,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V2
 #define b3SRIOV_LOAD_UCODE                        0x40       //Use by HV GPU driver only, to load uCode. for ASIC_InitTable SCLK parameter only
 #define b3SRIOV_SKIP_ASIC_INIT                    0x02       //Use by HV GPU driver only, skip ASIC_Init for primary adapter boot. for ASIC_InitTable SCLK parameter only
 
-typedef struct _ATOM_COMPUTE_CLOCK_FREQ
-{
+typedef struct _ATOM_COMPUTE_CLOCK_FREQ {
 #if ATOM_BIG_ENDIAN
   ULONG ulComputeClockFlag:8;                 // =1: COMPUTE_MEMORY_PLL_PARAM, =2: COMPUTE_ENGINE_PLL_PARAM
   ULONG ulClockFreq:24;                       // in unit of 10kHz
@@ -481,16 +472,14 @@ typedef struct _ATOM_COMPUTE_CLOCK_FREQ
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
@@ -501,7 +490,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3
   UCHAR   ucPostDiv;                          //Output Parameter
   UCHAR   ucCntlFlag;                         //Output Parameter
   UCHAR   ucReserved;
-}COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3;
+} COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3;
 
 // ucCntlFlag
 #define ATOM_PLL_CNTL_FLAG_PLL_POST_DIV_EN          1
@@ -511,8 +500,7 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V3
 
 
 // V4 are only used for APU which PLL outside GPU
-typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4
-{
+typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4 {
 #if ATOM_BIG_ENDIAN
   ULONG  ucPostDiv:8;        //return parameter: post divider which is used to program to register directly
   ULONG  ulClock:24;         //Input= target clock, output = actual clock
@@ -520,10 +508,9 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V4
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
@@ -538,14 +525,13 @@ typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS_V5
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
-- 
2.17.1

