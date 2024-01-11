Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354182AAE4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05D010E802;
	Thu, 11 Jan 2024 09:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EEAC10E802;
 Thu, 11 Jan 2024 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=NsAuQ/VZyLm6eTN79C
 ngVW2zvLDoiR/DoNqlCE9BxIs=; b=kvwtGySqg2oaUQ84yKDlvU4f7Kzt6Lw2Kg
 50GXRTM/fKGygX8AueOwd8yOogj98oVJ4s2MblegGyXRlym+6MSNkiutzWMgOX8R
 kGWypGJOaPBNtHkSTURaTm5YobX6H9Db5NRpVHUFMcWimHF5GCR/nVez+rbqHwIN
 P6pSbW/4o=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3H4KotJ9l_JClAA--.62613S2;
 Thu, 11 Jan 2024 17:28:08 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in pptable.h
Date: Thu, 11 Jan 2024 09:28:06 +0000
Message-Id: <20240111092806.13826-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H4KotJ9l_JClAA--.62613S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3tF47tr4rCw4xAr17tw1fJFb_yoW8Wr1fZo
 WxWFs7Wa1fKr1DAayjvry0qFWqg3s8Kw4UG34Ykr9rWa9xXF48Ja13XF97Ka4agwnxurWj
 kr18Ga4jkFykAr43n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RRJPiDUUUU
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOgxixWVEuYB2XgAAsh
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
 drivers/gpu/drm/radeon/pptable.h | 204 +++++++++++++------------------
 1 file changed, 82 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pptable.h
index 94947229888b..594050be1cbd 100644
--- a/drivers/gpu/drm/radeon/pptable.h
+++ b/drivers/gpu/drm/radeon/pptable.h
@@ -90,22 +90,19 @@ typedef struct _ATOM_PPLIB_FANTABLE
     USHORT  usPWMHigh;                       // The PWM value at THigh.
 } ATOM_PPLIB_FANTABLE;
 
-typedef struct _ATOM_PPLIB_FANTABLE2
-{
+typedef struct _ATOM_PPLIB_FANTABLE2 {
     ATOM_PPLIB_FANTABLE basicTable;
     USHORT  usTMax;                          // The max temperature
 } ATOM_PPLIB_FANTABLE2;
 
-typedef struct _ATOM_PPLIB_FANTABLE3
-{
+typedef struct _ATOM_PPLIB_FANTABLE3 {
 	ATOM_PPLIB_FANTABLE2 basicTable2;
 	UCHAR ucFanControlMode;
 	USHORT usFanPWMMax;
 	USHORT usFanOutputSensitivity;
 } ATOM_PPLIB_FANTABLE3;
 
-typedef struct _ATOM_PPLIB_EXTENDEDHEADER
-{
+typedef struct _ATOM_PPLIB_EXTENDEDHEADER {
     USHORT  usSize;
     ULONG   ulMaxEngineClock;   // For Overdrive.
     ULONG   ulMaxMemoryClock;   // For Overdrive.
@@ -144,8 +141,7 @@ typedef struct _ATOM_PPLIB_EXTENDEDHEADER
 #define ATOM_PP_PLATFORM_CAP_TEMP_INVERSION   0x00400000            // Does the driver supports Temp Inversion feature.
 #define ATOM_PP_PLATFORM_CAP_EVV    0x00800000
 
-typedef struct _ATOM_PPLIB_POWERPLAYTABLE
-{
+typedef struct _ATOM_PPLIB_POWERPLAYTABLE {
       ATOM_COMMON_TABLE_HEADER sHeader;
 
       UCHAR ucDataRevision;
@@ -178,23 +174,20 @@ typedef struct _ATOM_PPLIB_POWERPLAYTABLE
 
 } ATOM_PPLIB_POWERPLAYTABLE;
 
-typedef struct _ATOM_PPLIB_POWERPLAYTABLE2
-{
+typedef struct _ATOM_PPLIB_POWERPLAYTABLE2 {
     ATOM_PPLIB_POWERPLAYTABLE basicTable;
     UCHAR   ucNumCustomThermalPolicy;
     USHORT  usCustomThermalPolicyArrayOffset;
-}ATOM_PPLIB_POWERPLAYTABLE2, *LPATOM_PPLIB_POWERPLAYTABLE2;
+} ATOM_PPLIB_POWERPLAYTABLE2, *LPATOM_PPLIB_POWERPLAYTABLE2;
 
-typedef struct _ATOM_PPLIB_POWERPLAYTABLE3
-{
+typedef struct _ATOM_PPLIB_POWERPLAYTABLE3 {
     ATOM_PPLIB_POWERPLAYTABLE2 basicTable2;
     USHORT                     usFormatID;                      // To be used ONLY by PPGen.
     USHORT                     usFanTableOffset;
     USHORT                     usExtendendedHeaderOffset;
 } ATOM_PPLIB_POWERPLAYTABLE3, *LPATOM_PPLIB_POWERPLAYTABLE3;
 
-typedef struct _ATOM_PPLIB_POWERPLAYTABLE4
-{
+typedef struct _ATOM_PPLIB_POWERPLAYTABLE4 {
     ATOM_PPLIB_POWERPLAYTABLE3 basicTable3;
     ULONG                      ulGoldenPPID;                    // PPGen use only     
     ULONG                      ulGoldenRevision;                // PPGen use only
@@ -206,8 +199,7 @@ typedef struct _ATOM_PPLIB_POWERPLAYTABLE4
     USHORT                     usMvddDependencyOnMCLKOffset;  
 } ATOM_PPLIB_POWERPLAYTABLE4, *LPATOM_PPLIB_POWERPLAYTABLE4;
 
-typedef struct _ATOM_PPLIB_POWERPLAYTABLE5
-{
+typedef struct _ATOM_PPLIB_POWERPLAYTABLE5 {
     ATOM_PPLIB_POWERPLAYTABLE4 basicTable4;
     ULONG                      ulTDPLimit;
     ULONG                      ulNearTDPLimit;
@@ -283,20 +275,18 @@ typedef struct _ATOM_PPLIB_POWERPLAYTABLE5
 #define ATOM_PPLIB_ENABLE_DRR                       0x00080000
 
 // remaining 16 bits are reserved
-typedef struct _ATOM_PPLIB_THERMAL_STATE
-{
+typedef struct _ATOM_PPLIB_THERMAL_STATE {
     UCHAR   ucMinTemperature;
     UCHAR   ucMaxTemperature;
     UCHAR   ucThermalAction;
-}ATOM_PPLIB_THERMAL_STATE, *LPATOM_PPLIB_THERMAL_STATE;
+} ATOM_PPLIB_THERMAL_STATE, *LPATOM_PPLIB_THERMAL_STATE;
 
 // Contained in an array starting at the offset
 // in ATOM_PPLIB_POWERPLAYTABLE::usNonClockInfoArrayOffset.
 // referenced from ATOM_PPLIB_STATE_INFO::ucNonClockStateIndex
 #define ATOM_PPLIB_NONCLOCKINFO_VER1      12
 #define ATOM_PPLIB_NONCLOCKINFO_VER2      24
-typedef struct _ATOM_PPLIB_NONCLOCK_INFO
-{
+typedef struct _ATOM_PPLIB_NONCLOCK_INFO {
       USHORT usClassification;
       UCHAR  ucMinTemperature;
       UCHAR  ucMaxTemperature;
@@ -311,8 +301,7 @@ typedef struct _ATOM_PPLIB_NONCLOCK_INFO
 // Contained in an array starting at the offset
 // in ATOM_PPLIB_POWERPLAYTABLE::usClockInfoArrayOffset.
 // referenced from ATOM_PPLIB_STATE::ucClockStateIndices
-typedef struct _ATOM_PPLIB_R600_CLOCK_INFO
-{
+typedef struct _ATOM_PPLIB_R600_CLOCK_INFO {
       USHORT usEngineClockLow;
       UCHAR ucEngineClockHigh;
 
@@ -335,9 +324,7 @@ typedef struct _ATOM_PPLIB_R600_CLOCK_INFO
 #define ATOM_PPLIB_R600_FLAGS_MEMORY_DLL_OFF   16
 #define ATOM_PPLIB_R600_FLAGS_LOWPOWER         32   // On the RV770 use 'low power' setting (sequencer S0).
 
-typedef struct _ATOM_PPLIB_RS780_CLOCK_INFO
-
-{
+typedef struct _ATOM_PPLIB_RS780_CLOCK_INFO {
       USHORT usLowEngineClockLow;         // Low Engine clock in MHz (the same way as on the R600).
       UCHAR  ucLowEngineClockHigh;
       USHORT usHighEngineClockLow;        // High Engine clock in MHz.
@@ -365,8 +352,7 @@ typedef struct _ATOM_PPLIB_RS780_CLOCK_INFO
 #define ATOM_PPLIB_RS780_HTLINKFREQ_LOW        1 
 #define ATOM_PPLIB_RS780_HTLINKFREQ_HIGH       2 
 
-typedef struct _ATOM_PPLIB_EVERGREEN_CLOCK_INFO
-{
+typedef struct _ATOM_PPLIB_EVERGREEN_CLOCK_INFO {
       USHORT usEngineClockLow;
       UCHAR  ucEngineClockHigh;
 
@@ -381,8 +367,7 @@ typedef struct _ATOM_PPLIB_EVERGREEN_CLOCK_INFO
 
 } ATOM_PPLIB_EVERGREEN_CLOCK_INFO;
 
-typedef struct _ATOM_PPLIB_SI_CLOCK_INFO
-{
+typedef struct _ATOM_PPLIB_SI_CLOCK_INFO {
       USHORT usEngineClockLow;
       UCHAR  ucEngineClockHigh;
 
@@ -398,8 +383,7 @@ typedef struct _ATOM_PPLIB_SI_CLOCK_INFO
 
 } ATOM_PPLIB_SI_CLOCK_INFO;
 
-typedef struct _ATOM_PPLIB_CI_CLOCK_INFO
-{
+typedef struct _ATOM_PPLIB_CI_CLOCK_INFO {
       USHORT usEngineClockLow;
       UCHAR  ucEngineClockHigh;
 
@@ -419,10 +403,9 @@ typedef struct _ATOM_PPLIB_SUMO_CLOCK_INFO{
       USHORT rsv1;
       //please initialize to 0s
       ULONG rsv2[2];
-}ATOM_PPLIB_SUMO_CLOCK_INFO;
+} ATOM_PPLIB_SUMO_CLOCK_INFO;
 
-typedef struct _ATOM_PPLIB_STATE_V2
-{
+typedef struct _ATOM_PPLIB_STATE_V2 {
       //number of valid dpm levels in this state; Driver uses it to calculate the whole 
       //size of the state: sizeof(ATOM_PPLIB_STATE_V2) + (ucNumDPMLevels - 1) * sizeof(UCHAR)
       UCHAR ucNumDPMLevels;
@@ -435,15 +418,15 @@ typedef struct _ATOM_PPLIB_STATE_V2
       UCHAR clockInfoIndex[1];
 } ATOM_PPLIB_STATE_V2;
 
-typedef struct _StateArray{
+typedef struct _StateArray {
     //how many states we have 
     UCHAR ucNumEntries;
     
     ATOM_PPLIB_STATE_V2 states[1];
-}StateArray;
+} StateArray;
 
 
-typedef struct _ClockInfoArray{
+typedef struct _ClockInfoArray {
     //how many clock levels we have
     UCHAR ucNumEntries;
     
@@ -451,9 +434,9 @@ typedef struct _ClockInfoArray{
     UCHAR ucEntrySize;
     
     UCHAR clockInfo[1];
-}ClockInfoArray;
+} ClockInfoArray;
 
-typedef struct _NonClockInfoArray{
+typedef struct _NonClockInfoArray {
 
     //how many non-clock levels we have. normally should be same as number of states
     UCHAR ucNumEntries;
@@ -461,39 +444,34 @@ typedef struct _NonClockInfoArray{
     UCHAR ucEntrySize;
     
     ATOM_PPLIB_NONCLOCK_INFO nonClockInfo[1];
-}NonClockInfoArray;
+} NonClockInfoArray;
 
-typedef struct _ATOM_PPLIB_Clock_Voltage_Dependency_Record
-{
+typedef struct _ATOM_PPLIB_Clock_Voltage_Dependency_Record {
     USHORT usClockLow;
     UCHAR  ucClockHigh;
     USHORT usVoltage;
-}ATOM_PPLIB_Clock_Voltage_Dependency_Record;
+} ATOM_PPLIB_Clock_Voltage_Dependency_Record;
 
-typedef struct _ATOM_PPLIB_Clock_Voltage_Dependency_Table
-{
+typedef struct _ATOM_PPLIB_Clock_Voltage_Dependency_Table {
     UCHAR ucNumEntries;                                                // Number of entries.
     ATOM_PPLIB_Clock_Voltage_Dependency_Record entries[1];             // Dynamically allocate entries.
-}ATOM_PPLIB_Clock_Voltage_Dependency_Table;
+} ATOM_PPLIB_Clock_Voltage_Dependency_Table;
 
-typedef struct _ATOM_PPLIB_Clock_Voltage_Limit_Record
-{
+typedef struct _ATOM_PPLIB_Clock_Voltage_Limit_Record {
     USHORT usSclkLow;
     UCHAR  ucSclkHigh;
     USHORT usMclkLow;
     UCHAR  ucMclkHigh;
     USHORT usVddc;
     USHORT usVddci;
-}ATOM_PPLIB_Clock_Voltage_Limit_Record;
+} ATOM_PPLIB_Clock_Voltage_Limit_Record;
 
-typedef struct _ATOM_PPLIB_Clock_Voltage_Limit_Table
-{
+typedef struct _ATOM_PPLIB_Clock_Voltage_Limit_Table {
     UCHAR ucNumEntries;                                                // Number of entries.
     ATOM_PPLIB_Clock_Voltage_Limit_Record entries[1];                  // Dynamically allocate entries.
-}ATOM_PPLIB_Clock_Voltage_Limit_Table;
+} ATOM_PPLIB_Clock_Voltage_Limit_Table;
 
-union _ATOM_PPLIB_CAC_Leakage_Record
-{
+union _ATOM_PPLIB_CAC_Leakage_Record {
     struct
     {
         USHORT usVddc;          // We use this field for the "fake" standardized VDDC for power calculations; For CI and newer, we use this as the real VDDC value. in CI we read it as StdVoltageHiSidd
@@ -510,141 +488,126 @@ union _ATOM_PPLIB_CAC_Leakage_Record
 
 typedef union _ATOM_PPLIB_CAC_Leakage_Record ATOM_PPLIB_CAC_Leakage_Record;
 
-typedef struct _ATOM_PPLIB_CAC_Leakage_Table
-{
+typedef struct _ATOM_PPLIB_CAC_Leakage_Table {
     UCHAR ucNumEntries;                                                 // Number of entries.
     ATOM_PPLIB_CAC_Leakage_Record entries[1];                           // Dynamically allocate entries.
-}ATOM_PPLIB_CAC_Leakage_Table;
+} ATOM_PPLIB_CAC_Leakage_Table;
 
-typedef struct _ATOM_PPLIB_PhaseSheddingLimits_Record
-{
+typedef struct _ATOM_PPLIB_PhaseSheddingLimits_Record {
     USHORT usVoltage;
     USHORT usSclkLow;
     UCHAR  ucSclkHigh;
     USHORT usMclkLow;
     UCHAR  ucMclkHigh;
-}ATOM_PPLIB_PhaseSheddingLimits_Record;
+} ATOM_PPLIB_PhaseSheddingLimits_Record;
 
-typedef struct _ATOM_PPLIB_PhaseSheddingLimits_Table
-{
+typedef struct _ATOM_PPLIB_PhaseSheddingLimits_Table {
     UCHAR ucNumEntries;                                                 // Number of entries.
     ATOM_PPLIB_PhaseSheddingLimits_Record entries[1];                   // Dynamically allocate entries.
-}ATOM_PPLIB_PhaseSheddingLimits_Table;
+} ATOM_PPLIB_PhaseSheddingLimits_Table;
 
-typedef struct _VCEClockInfo{
+typedef struct _VCEClockInfo {
     USHORT usEVClkLow;
     UCHAR  ucEVClkHigh;
     USHORT usECClkLow;
     UCHAR  ucECClkHigh;
-}VCEClockInfo;
+} VCEClockInfo;
 
-typedef struct _VCEClockInfoArray{
+typedef struct _VCEClockInfoArray {
     UCHAR ucNumEntries;
     VCEClockInfo entries[1];
-}VCEClockInfoArray;
+} VCEClockInfoArray;
 
-typedef struct _ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record
-{
+typedef struct _ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record {
     USHORT usVoltage;
     UCHAR  ucVCEClockInfoIndex;
-}ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record;
+} ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record;
 
-typedef struct _ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table
-{
+typedef struct _ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table {
     UCHAR numEntries;
     ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record entries[1];
-}ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table;
+} ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table;
 
-typedef struct _ATOM_PPLIB_VCE_State_Record
-{
+typedef struct _ATOM_PPLIB_VCE_State_Record {
     UCHAR  ucVCEClockInfoIndex;
     UCHAR  ucClockInfoIndex; //highest 2 bits indicates memory p-states, lower 6bits indicates index to ClockInfoArrary
-}ATOM_PPLIB_VCE_State_Record;
+} ATOM_PPLIB_VCE_State_Record;
 
-typedef struct _ATOM_PPLIB_VCE_State_Table
-{
+typedef struct _ATOM_PPLIB_VCE_State_Table {
     UCHAR numEntries;
     ATOM_PPLIB_VCE_State_Record entries[1];
-}ATOM_PPLIB_VCE_State_Table;
+} ATOM_PPLIB_VCE_State_Table;
 
 
-typedef struct _ATOM_PPLIB_VCE_Table
-{
+typedef struct _ATOM_PPLIB_VCE_Table {
       UCHAR revid;
 //    VCEClockInfoArray array;
 //    ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table limits;
 //    ATOM_PPLIB_VCE_State_Table states;
-}ATOM_PPLIB_VCE_Table;
+} ATOM_PPLIB_VCE_Table;
 
 
-typedef struct _UVDClockInfo{
+typedef struct _UVDClockInfo {
     USHORT usVClkLow;
     UCHAR  ucVClkHigh;
     USHORT usDClkLow;
     UCHAR  ucDClkHigh;
-}UVDClockInfo;
+} UVDClockInfo;
 
-typedef struct _UVDClockInfoArray{
+typedef struct _UVDClockInfoArray {
     UCHAR ucNumEntries;
     UVDClockInfo entries[1];
-}UVDClockInfoArray;
+} UVDClockInfoArray;
 
-typedef struct _ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record
-{
+typedef struct _ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record {
     USHORT usVoltage;
     UCHAR  ucUVDClockInfoIndex;
-}ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record;
+} ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record;
 
-typedef struct _ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table
-{
+typedef struct _ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table {
     UCHAR numEntries;
     ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record entries[1];
-}ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table;
+} ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table;
 
-typedef struct _ATOM_PPLIB_UVD_Table
-{
+typedef struct _ATOM_PPLIB_UVD_Table {
       UCHAR revid;
 //    UVDClockInfoArray array;
 //    ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table limits;
-}ATOM_PPLIB_UVD_Table;
+} ATOM_PPLIB_UVD_Table;
 
-typedef struct _ATOM_PPLIB_SAMClk_Voltage_Limit_Record
-{
+typedef struct _ATOM_PPLIB_SAMClk_Voltage_Limit_Record {
       USHORT usVoltage;
       USHORT usSAMClockLow;
       UCHAR  ucSAMClockHigh;
-}ATOM_PPLIB_SAMClk_Voltage_Limit_Record;
+} ATOM_PPLIB_SAMClk_Voltage_Limit_Record;
 
-typedef struct _ATOM_PPLIB_SAMClk_Voltage_Limit_Table{
+typedef struct _ATOM_PPLIB_SAMClk_Voltage_Limit_Table {
     UCHAR numEntries;
     ATOM_PPLIB_SAMClk_Voltage_Limit_Record entries[1];
-}ATOM_PPLIB_SAMClk_Voltage_Limit_Table;
+} ATOM_PPLIB_SAMClk_Voltage_Limit_Table;
 
-typedef struct _ATOM_PPLIB_SAMU_Table
-{
+typedef struct _ATOM_PPLIB_SAMU_Table {
       UCHAR revid;
       ATOM_PPLIB_SAMClk_Voltage_Limit_Table limits;
-}ATOM_PPLIB_SAMU_Table;
+} ATOM_PPLIB_SAMU_Table;
 
-typedef struct _ATOM_PPLIB_ACPClk_Voltage_Limit_Record
-{
+typedef struct _ATOM_PPLIB_ACPClk_Voltage_Limit_Record {
       USHORT usVoltage;
       USHORT usACPClockLow;
       UCHAR  ucACPClockHigh;
-}ATOM_PPLIB_ACPClk_Voltage_Limit_Record;
+} ATOM_PPLIB_ACPClk_Voltage_Limit_Record;
 
-typedef struct _ATOM_PPLIB_ACPClk_Voltage_Limit_Table{
+typedef struct _ATOM_PPLIB_ACPClk_Voltage_Limit_Table {
     UCHAR numEntries;
     ATOM_PPLIB_ACPClk_Voltage_Limit_Record entries[1];
-}ATOM_PPLIB_ACPClk_Voltage_Limit_Table;
+} ATOM_PPLIB_ACPClk_Voltage_Limit_Table;
 
-typedef struct _ATOM_PPLIB_ACP_Table
-{
+typedef struct _ATOM_PPLIB_ACP_Table {
       UCHAR revid;
       ATOM_PPLIB_ACPClk_Voltage_Limit_Table limits;
-}ATOM_PPLIB_ACP_Table;
+} ATOM_PPLIB_ACP_Table;
 
-typedef struct _ATOM_PowerTune_Table{
+typedef struct _ATOM_PowerTune_Table {
     USHORT usTDP;
     USHORT usConfigurableTDP;
     USHORT usTDC;
@@ -652,16 +615,14 @@ typedef struct _ATOM_PowerTune_Table{
     USHORT usSmallPowerLimit;
     USHORT usLowCACLeakage;
     USHORT usHighCACLeakage;
-}ATOM_PowerTune_Table;
+} ATOM_PowerTune_Table;
 
-typedef struct _ATOM_PPLIB_POWERTUNE_Table
-{
+typedef struct _ATOM_PPLIB_POWERTUNE_Table {
       UCHAR revid;
       ATOM_PowerTune_Table power_tune_table;
-}ATOM_PPLIB_POWERTUNE_Table;
+} ATOM_PPLIB_POWERTUNE_Table;
 
-typedef struct _ATOM_PPLIB_POWERTUNE_Table_V1
-{
+typedef struct _ATOM_PPLIB_POWERTUNE_Table_V1 {
       UCHAR revid;
       ATOM_PowerTune_Table power_tune_table;
       USHORT usMaximumPowerDeliveryLimit;
@@ -670,8 +631,7 @@ typedef struct _ATOM_PPLIB_POWERTUNE_Table_V1
 
 #define ATOM_PPM_A_A    1
 #define ATOM_PPM_A_I    2
-typedef struct _ATOM_PPLIB_PPM_Table
-{
+typedef struct _ATOM_PPLIB_PPM_Table {
       UCHAR  ucRevId;
       UCHAR  ucPpmDesign;          //A+I or A+A
       USHORT usCpuCoreNumber;
-- 
2.17.1

