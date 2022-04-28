Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A69512D1C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ACE10E264;
	Thu, 28 Apr 2022 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797BF10E77C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:20:37 +0000 (UTC)
X-UUID: 25166f14839c4c339da2f87ce93fc79c-20220428
X-UUID: 25166f14839c4c339da2f87ce93fc79c-20220428
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 172391909; Thu, 28 Apr 2022 15:18:57 +0800
X-ns-mid: postfix-626A403B-5208465640
Received: from localhost.localdomain (unknown [172.20.4.120])
 by cs2c.com.cn (NSMail) with ESMTPA id 4A2533844000;
 Thu, 28 Apr 2022 07:20:27 +0000 (UTC)
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] gpu/drm/radeon: Fix spelling typo in comments
Date: Thu, 28 Apr 2022 15:20:00 +0800
Message-Id: <20220428072000.6542-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 07:36:56 +0000
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling typo in comments.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/radeon/atombios.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index bd5dc09e860f..e00d6adf7262 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -3599,7 +3599,7 @@ typedef struct  _ATOM_LCD_RTS_RECORD
   UCHAR     ucRTSValue;
 }ATOM_LCD_RTS_RECORD;
 
-//!! If the record below exits, it shoud always be the first record for easy use in command table!!! 
+//!! If the record below exits, it should always be the first record for easy use in command table!!!
 // The record below is only used when LVDS_Info is present. From ATOM_LVDS_INFO_V12, use ucLCDPanel_SpecialHandlingCap instead.
 typedef struct  _ATOM_LCD_MODE_CONTROL_CAP
 {
@@ -3823,7 +3823,7 @@ typedef struct _ATOM_DPCD_INFO
 // Note1: This table is filled by SetBiosReservationStartInFB in CoreCommSubs.asm
 //        at running time.   
 // note2: From RV770, the memory is more than 32bit addressable, so we will change 
-//        ucTableFormatRevision=1,ucTableContentRevision=4, the strcuture remains 
+//        ucTableFormatRevision=1,ucTableContentRevision=4, the structure remains
 //        exactly same as 1.1 and 1.2 (1.3 is never in use), but ulStartAddrUsedByFirmware 
 //        (in offset to start of memory address) is KB aligned instead of byte aligend.
 /***********************************************************************************/	
@@ -3858,7 +3858,7 @@ typedef struct _ATOM_VRAM_USAGE_BY_FIRMWARE
   ATOM_FIRMWARE_VRAM_RESERVE_INFO	asFirmwareVramReserveInfo[ATOM_MAX_FIRMWARE_VRAM_USAGE_INFO];
 }ATOM_VRAM_USAGE_BY_FIRMWARE;
 
-// change verion to 1.5, when allow driver to allocate the vram area for command table access. 
+// change version to 1.5, when allow driver to allocate the vram area for command table access.
 typedef struct _ATOM_FIRMWARE_VRAM_RESERVE_INFO_V1_5
 {
   ULONG   ulStartAddrUsedByFirmware;
@@ -5973,7 +5973,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define CLEAR_ATOM_S7_DOS_8BIT_DAC_EN         ((ATOM_DOS_MODE_INFO_DEF << 8 )|ATOM_S7_DOS_8BIT_DAC_EN_SHIFT | ATOM_FLAG_CLEAR )
 
 /****************************************************************************/	
-//Portion II: Definitinos only used in Driver
+//Portion II: Definitions only used in Driver
 /****************************************************************************/
 
 // Macros used by driver
@@ -7162,7 +7162,7 @@ typedef struct _DP_ENCODER_SERVICE_PARAMETERS
 
 // ucAction
 #define ATOM_DP_ACTION_GET_SINK_TYPE							0x01
-/* obselete */
+/* obsolete */
 #define ATOM_DP_ACTION_TRAINING_START							0x02
 #define ATOM_DP_ACTION_TRAINING_COMPLETE					0x03
 #define ATOM_DP_ACTION_TRAINING_PATTERN_SEL				0x04
-- 
2.25.1

