Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29750F527
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3AF10E8F4;
	Tue, 26 Apr 2022 08:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2C10E73B;
 Tue, 26 Apr 2022 08:50:12 +0000 (UTC)
X-UUID: a86d9c48cb624fe087b56add348e97a3-20220426
X-UUID: a86d9c48cb624fe087b56add348e97a3-20220426
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 923068118; Tue, 26 Apr 2022 16:48:37 +0800
X-ns-mid: postfix-6267B23C-7950086977
Received: from localhost.localdomain (unknown [172.20.108.41])
 by cs2c.com.cn (NSMail) with ESMTPA id 8C844383B46C;
 Tue, 26 Apr 2022 08:50:04 +0000 (UTC)
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] gpu/drm/radeon: Fix typo in comments
Date: Tue, 26 Apr 2022 16:49:59 +0800
Message-Id: <20220426084959.3345358-1-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhenneng Li <lizhenneng@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 drivers/gpu/drm/radeon/atombios.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index bd5dc09e860f..6ccc9f31689f 100644
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
-- 
2.25.1

