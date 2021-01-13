Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882332F5D49
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EDD6E0F8;
	Thu, 14 Jan 2021 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8EE6E3DB;
 Wed, 13 Jan 2021 09:38:38 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0ULc.clB_1610530708; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0ULc.clB_1610530708) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Jan 2021 17:38:36 +0800
From: Yang Li <abaci-bugfix@linux.alibaba.com>
To: airlied@linux.ie
Subject: [PATCH] drm/amd/display: Simplify bool comparison
Date: Wed, 13 Jan 2021 17:38:27 +0800
Message-Id: <1610530707-50441-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Yang Li <abaci-bugfix@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
./drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:5121:14-38:
WARNING: Comparison to bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 86ff24d..0bcec11 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -5121,48 +5121,48 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 		for (j = 0; j < 2; j++) {
 			enum dm_validation_status status = DML_VALIDATION_OK;
 
-			if (mode_lib->vba.ScaleRatioAndTapsSupport != true) {
+			if (!mode_lib->vba.ScaleRatioAndTapsSupport) {
 				status = DML_FAIL_SCALE_RATIO_TAP;
-			} else if (mode_lib->vba.SourceFormatPixelAndScanSupport != true) {
+			} else if (!mode_lib->vba.SourceFormatPixelAndScanSupport) {
 				status = DML_FAIL_SOURCE_PIXEL_FORMAT;
-			} else if (locals->ViewportSizeSupport[i][0] != true) {
+			} else if (!locals->ViewportSizeSupport[i][0]) {
 				status = DML_FAIL_VIEWPORT_SIZE;
-			} else if (locals->DIOSupport[i] != true) {
+			} else if (!locals->DIOSupport[i]) {
 				status = DML_FAIL_DIO_SUPPORT;
-			} else if (locals->NotEnoughDSCUnits[i] != false) {
+			} else if (locals->NotEnoughDSCUnits[i]) {
 				status = DML_FAIL_NOT_ENOUGH_DSC;
-			} else if (locals->DSCCLKRequiredMoreThanSupported[i] != false) {
+			} else if (locals->DSCCLKRequiredMoreThanSupported[i]) {
 				status = DML_FAIL_DSC_CLK_REQUIRED;
-			} else if (locals->ROBSupport[i][0] != true) {
+			} else if (!locals->ROBSupport[i][0]) {
 				status = DML_FAIL_REORDERING_BUFFER;
-			} else if (locals->DISPCLK_DPPCLK_Support[i][j] != true) {
+			} else if (!locals->DISPCLK_DPPCLK_Support[i][j]) {
 				status = DML_FAIL_DISPCLK_DPPCLK;
-			} else if (locals->TotalAvailablePipesSupport[i][j] != true) {
+			} else if (!locals->TotalAvailablePipesSupport[i][j]) {
 				status = DML_FAIL_TOTAL_AVAILABLE_PIPES;
-			} else if (mode_lib->vba.NumberOfOTGSupport != true) {
+			} else if (!mode_lib->vba.NumberOfOTGSupport) {
 				status = DML_FAIL_NUM_OTG;
-			} else if (mode_lib->vba.WritebackModeSupport != true) {
+			} else if (!mode_lib->vba.WritebackModeSupport) {
 				status = DML_FAIL_WRITEBACK_MODE;
-			} else if (mode_lib->vba.WritebackLatencySupport != true) {
+			} else if (!mode_lib->vba.WritebackLatencySupport) {
 				status = DML_FAIL_WRITEBACK_LATENCY;
-			} else if (mode_lib->vba.WritebackScaleRatioAndTapsSupport != true) {
+			} else if (!mode_lib->vba.WritebackScaleRatioAndTapsSupport) {
 				status = DML_FAIL_WRITEBACK_SCALE_RATIO_TAP;
-			} else if (mode_lib->vba.CursorSupport != true) {
+			} else if (!mode_lib->vba.CursorSupport) {
 				status = DML_FAIL_CURSOR_SUPPORT;
-			} else if (mode_lib->vba.PitchSupport != true) {
+			} else if (!mode_lib->vba.PitchSupport) {
 				status = DML_FAIL_PITCH_SUPPORT;
-			} else if (locals->TotalVerticalActiveBandwidthSupport[i][0] != true) {
+			} else if (!locals->TotalVerticalActiveBandwidthSupport[i][0]) {
 				status = DML_FAIL_TOTAL_V_ACTIVE_BW;
-			} else if (locals->PTEBufferSizeNotExceeded[i][j] != true) {
+			} else if (!locals->PTEBufferSizeNotExceeded[i][j]) {
 				status = DML_FAIL_PTE_BUFFER_SIZE;
-			} else if (mode_lib->vba.NonsupportedDSCInputBPC != false) {
+			} else if (mode_lib->vba.NonsupportedDSCInputBPC) {
 				status = DML_FAIL_DSC_INPUT_BPC;
-			} else if ((mode_lib->vba.HostVMEnable != false
-					&& locals->ImmediateFlipSupportedForState[i][j] != true)) {
+			} else if ((mode_lib->vba.HostVMEnable
+					&& !locals->ImmediateFlipSupportedForState[i][j])) {
 				status = DML_FAIL_HOST_VM_IMMEDIATE_FLIP;
-			} else if (locals->PrefetchSupported[i][j] != true) {
+			} else if (!locals->PrefetchSupported[i][j]) {
 				status = DML_FAIL_PREFETCH_SUPPORT;
-			} else if (locals->VRatioInPrefetchSupported[i][j] != true) {
+			} else if (!locals->VRatioInPrefetchSupported[i][j]) {
 				status = DML_FAIL_V_RATIO_PREFETCH;
 			}
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
