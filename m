Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31F39DBD5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 13:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6EF6E3C1;
	Mon,  7 Jun 2021 11:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CD76E3C1;
 Mon,  7 Jun 2021 11:58:51 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lqDrb-00048n-It; Mon, 07 Jun 2021 11:56:15 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: Fix two spelling mistakes,
 clean wide lines
Date: Mon,  7 Jun 2021 12:56:15 +0100
Message-Id: <20210607115615.83162-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in dml_print messages, fix these and
clear up checkpatch warning on overly wide line length.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index c725160a095b..d655655baaba 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -1494,10 +1494,11 @@ static bool CalculatePrefetchSchedule(
 		dml_print(
 				"DML:  Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n",
 				(double) LinesToRequestPrefetchPixelData * LineTime);
-		dml_print("DML: To: %fus - time for propogation from scaler to optc\n", (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
+		dml_print("DML: To: %fus - time for propagation from scaler to optc\n",
+			  (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) /
+			  (double) myPipe->HTotal)) * LineTime);
 		dml_print("DML: Tvstartup - TSetup - Tcalc - Twait - Tpre - To > 0\n");
-		dml_print(
-				"DML: Tslack(pre): %fus - time left over in schedule\n",
+		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n",
 				VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank
 						- (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - *TSetup);
 		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n", PixelPTEBytesPerRow);
@@ -3023,7 +3024,8 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			for (k = 0; k < v->NumberOfActivePlanes; ++k) {
 				if (v->ImmediateFlipSupportedForPipe[k] == false) {
 #ifdef __DML_VBA_DEBUG__
-					dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
+					dml_print("DML::%s: Pipe %0d not supporting iflip\n",
+						  __func__, k);
 #endif
 					v->ImmediateFlipSupported = false;
 				}
-- 
2.31.1

