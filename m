Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1F76C242
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E42910E465;
	Wed,  2 Aug 2023 01:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-112.mail.aliyun.com (out28-112.mail.aliyun.com
 [115.124.28.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1542B10E465;
 Wed,  2 Aug 2023 01:31:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1514801|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.00456796-0.000204693-0.995227; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047198; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6Iyu6P_1690939879; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6Iyu6P_1690939879) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 09:31:21 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu7.h
Date: Wed,  2 Aug 2023 01:31:18 +0000
Message-Id: <20230802013118.8677-1-sunran001@208suo.com>
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

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h
index e14072d45918..bfce9087a47f 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h
@@ -101,8 +101,7 @@
 #define VR_SMIO_PATTERN_2        4
 #define VR_STATIC_VOLTAGE        5
 
-struct SMU7_PIDController
-{
+struct SMU7_PIDController {
     uint32_t Ki;
     int32_t LFWindupUL;
     int32_t LFWindupLL;
@@ -136,8 +135,7 @@ typedef struct SMU7_PIDController SMU7_PIDController;
 #define SMU7_VCE_MCLK_HANDSHAKE_DISABLE                  0x00010000
 #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
 
-struct SMU7_Firmware_Header
-{
+struct SMU7_Firmware_Header {
     uint32_t Digest[5];
     uint32_t Version;
     uint32_t HeaderSize;
-- 
2.17.1

