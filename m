Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1E562598
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410CC11376A;
	Thu, 30 Jun 2022 21:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF3E11376A;
 Thu, 30 Jun 2022 21:53:32 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4LYsXW4FcCz9t3L;
 Thu, 30 Jun 2022 21:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1656626011; bh=RqJKTEPUdoC1D9GIM8x0UctkWHtsVb+6wjMsLs0x0AI=;
 h=From:To:Cc:Subject:Date:From;
 b=Hy/pb4x66b/TSannBUttIKlvROq5Ku/c0uYouxfsx72ixV8wvWZC5kR+t3DSMd4Vy
 6Gn3ZVncJLrZAlJ/EPtXvN7kRO+lJOUe0i80zfCgVCwNdtOO8zyldWT/u5YTl7mE8p
 Tr55qEkT6raiumklFg5QlkAH33P5mwBTwuntLYEI=
X-Riseup-User-ID: F2684EDD2FB94981689F68EA8BD196BB1BD1523BABCB7B9467C80C26E05249A8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LYsXR1mCNz5vQt;
 Thu, 30 Jun 2022 21:53:26 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Remove unused variables from vba_vars_st
Date: Thu, 30 Jun 2022 18:53:16 -0300
Message-Id: <20220630215316.1078841-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some variables from the struct vba_vars_st are not referenced in any
other place on the codebase. As they are not used, this commit removes
those variables.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---

Unused variables from structs are not warned by compilers, so they are a bit
harder to find. In order to find these unused variables, I used git grep and
checked if they were used anywhere else.

Any feedback or suggestion (maybe a tool to check unused variables from structs)
is welcomed!

Best Regards,
- Maíra Canal

---
 .../drm/amd/display/dc/dml/display_mode_vba.c |  1 -
 .../drm/amd/display/dc/dml/display_mode_vba.h | 33 -------------------
 2 files changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index ed23c7c79d86..6b3918609d26 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -346,7 +346,6 @@ static void fetch_socbb_params(struct display_mode_lib *mode_lib)
 	mode_lib->vba.DRAMClockChangeRequirementFinal = 1;
 	mode_lib->vba.FCLKChangeRequirementFinal = 1;
 	mode_lib->vba.USRRetrainingRequiredFinal = 1;
-	mode_lib->vba.ConfigurableDETSizeEnFinal = 0;
 	mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal = soc->allow_for_pstate_or_stutter_in_vblank_final;
 	mode_lib->vba.DRAMClockChangeLatency = soc->dram_clock_change_latency_us;
 	mode_lib->vba.DummyPStateCheck = soc->dram_clock_change_latency_us == soc->dummy_pstate_latency_us;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
index 25a9a606ab6f..e95b2199d85a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
@@ -232,7 +232,6 @@ struct vba_vars_st {
 	double DISPCLKWithRampingRoundedToDFSGranularity;
 	double DISPCLKWithoutRampingRoundedToDFSGranularity;
 	double MaxDispclkRoundedToDFSGranularity;
-	double MaxDppclkRoundedToDFSGranularity;
 	bool DCCEnabledAnyPlane;
 	double ReturnBandwidthToDCN;
 	unsigned int TotalActiveDPP;
@@ -249,7 +248,6 @@ struct vba_vars_st {
 	double VBlankTime;
 	double SmallestVBlank;
 	enum dm_prefetch_modes AllowForPStateChangeOrStutterInVBlankFinal; // Mode Support only
-	double DCFCLKDeepSleepPerSurface[DC__NUM_DPP__MAX];
 	double DCFCLKDeepSleepPerPlane[DC__NUM_DPP__MAX];
 	double EffectiveDETPlusLBLinesLuma;
 	double EffectiveDETPlusLBLinesChroma;
@@ -297,7 +295,6 @@ struct vba_vars_st {
 	double SMNLatency;
 	double FCLKChangeLatency;
 	unsigned int MALLAllocatedForDCNFinal;
-	double DefaultGPUVMMinPageSizeKBytes; // Default for the project
 	double MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSystemOperation;
 	double MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperationSTROBE;
 	double PercentOfIdealDRAMBWReceivedAfterUrgLatencySTROBE;
@@ -819,8 +816,6 @@ struct vba_vars_st {
 	double         dummy8[DC__NUM_DPP__MAX];
 	double         dummy13[DC__NUM_DPP__MAX];
 	double         dummy_double_array[2][DC__NUM_DPP__MAX];
-	unsigned int        dummyinteger1ms[DC__NUM_DPP__MAX];
-	double        dummyinteger2ms[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger3[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger4[DC__NUM_DPP__MAX];
 	unsigned int        dummyinteger5;
@@ -830,16 +825,7 @@ struct vba_vars_st {
 	unsigned int        dummyinteger9;
 	unsigned int        dummyinteger10;
 	unsigned int        dummyinteger11;
-	unsigned int        dummyinteger12;
-	unsigned int        dummyinteger30;
-	unsigned int        dummyinteger31;
-	unsigned int        dummyinteger32;
-	unsigned int        dummyintegerarr1[DC__NUM_DPP__MAX];
-	unsigned int        dummyintegerarr2[DC__NUM_DPP__MAX];
-	unsigned int        dummyintegerarr3[DC__NUM_DPP__MAX];
-	unsigned int        dummyintegerarr4[DC__NUM_DPP__MAX];
 	unsigned int        dummy_integer_array[8][DC__NUM_DPP__MAX];
-	unsigned int        dummy_integer_array22[22][DC__NUM_DPP__MAX];
 
 	bool           dummysinglestring;
 	bool           SingleDPPViewportSizeSupportPerPlane[DC__NUM_DPP__MAX];
@@ -980,7 +966,6 @@ struct vba_vars_st {
 	double TimePerChromaMetaChunkFlip[DC__NUM_DPP__MAX];
 	unsigned int DCCCMaxUncompressedBlock[DC__NUM_DPP__MAX];
 	unsigned int DCCCMaxCompressedBlock[DC__NUM_DPP__MAX];
-	unsigned int DCCCIndependent64ByteBlock[DC__NUM_DPP__MAX];
 	double VStartupMargin;
 	bool NotEnoughTimeForDynamicMetadata[DC__NUM_DPP__MAX];
 
@@ -1085,8 +1070,6 @@ struct vba_vars_st {
 	double WritebackDelayTime[DC__NUM_DPP__MAX];
 	unsigned int DCCYIndependentBlock[DC__NUM_DPP__MAX];
 	unsigned int DCCCIndependentBlock[DC__NUM_DPP__MAX];
-	unsigned int dummyinteger15;
-	unsigned int dummyinteger16;
 	unsigned int dummyinteger17;
 	unsigned int dummyinteger18;
 	unsigned int dummyinteger19;
@@ -1147,17 +1130,11 @@ struct vba_vars_st {
 	int Z8NumberOfStutterBurstsPerFrame;
 	unsigned int MaximumDSCBitsPerComponent;
 	unsigned int NotEnoughUrgentLatencyHidingA[DC__VOLTAGE_STATES][2];
-	double UrgentLatencyWithUSRRetraining;
-	double UrgLatencyWithUSRRetraining[DC__VOLTAGE_STATES];
 	double ReadBandwidthSurfaceLuma[DC__NUM_DPP__MAX];
 	double ReadBandwidthSurfaceChroma[DC__NUM_DPP__MAX];
 	double SurfaceRequiredDISPCLKWithoutODMCombine;
 	double SurfaceRequiredDISPCLK;
-	double SurfaceRequiredDISPCLKWithODMCombine2To1;
-	double SurfaceRequiredDISPCLKWithODMCombine4To1;
 	double MinActiveFCLKChangeLatencySupported;
-	double dummy14;
-	double dummy15;
 	int MinVoltageLevel;
 	int MaxVoltageLevel;
 	unsigned int TotalNumberOfSingleDPPSurfaces[DC__VOLTAGE_STATES][2];
@@ -1168,17 +1145,10 @@ struct vba_vars_st {
 	bool ExceededMALLSize;
 	bool PTE_BUFFER_MODE[DC__NUM_DPP__MAX];
 	unsigned int BIGK_FRAGMENT_SIZE[DC__NUM_DPP__MAX];
-	unsigned int dummyinteger33;
 	unsigned int CompressedBufferSizeInkByteThisState;
 	enum dm_fclock_change_support FCLKChangeSupport[DC__VOLTAGE_STATES][2];
-	Latencies myLatency;
-	Latencies mLatency;
-	Watermarks DummyWatermark;
 	bool USRRetrainingSupport[DC__VOLTAGE_STATES][2];
-	bool dummyBooleanvector1[DC__NUM_DPP__MAX];
-	bool dummyBooleanvector2[DC__NUM_DPP__MAX];
 	enum dm_use_mall_for_pstate_change_mode UsesMALLForPStateChange[DC__NUM_DPP__MAX];
-	bool NotEnoughUrgentLatencyHiding_dml32[DC__VOLTAGE_STATES][2];
 	bool UnboundedRequestEnabledAllStates[DC__VOLTAGE_STATES][2];
 	bool SingleDPPViewportSizeSupportPerSurface[DC__NUM_DPP__MAX];
 	enum dm_use_mall_for_static_screen_mode UseMALLForStaticScreen[DC__NUM_DPP__MAX];
@@ -1186,9 +1156,6 @@ struct vba_vars_st {
 	bool DRAMClockChangeRequirementFinal;
 	bool FCLKChangeRequirementFinal;
 	bool USRRetrainingRequiredFinal;
-	bool MALLUseFinal;
-	bool ConfigurableDETSizeEnFinal;
-	bool dummyboolean;
 	unsigned int DETSizeOverride[DC__NUM_DPP__MAX];
 	unsigned int nomDETInKByte;
 	enum mpc_combine_affinity  MPCCombineUse[DC__NUM_DPP__MAX];
-- 
2.36.1

