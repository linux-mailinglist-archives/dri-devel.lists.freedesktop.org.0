Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F782AA75
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1FF10E8C2;
	Thu, 11 Jan 2024 09:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 702F110E8C2;
 Thu, 11 Jan 2024 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=mLot53AR6aiH5Wu6Ry
 wzmhBMvsIGYJAJhAMQ1/Sq9gY=; b=HZWDLfxEy0lzzfSLeDN2b1JqyKcD/l6VKF
 aSJsMuvz1/7N73jCF+Ir161PXR4zP7LP6TJ/UFjiO4bMWoU72vmwTpwonvAGk/94
 +EJvtmYMuoMNMLU5dWmdutQRA67zwRTxlys7e6uUHFeZoDvUMol9aWsW9bvP/srg
 40uOm10BQ=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3H6Vir59ldLCXAA--.13381S2;
 Thu, 11 Jan 2024 17:05:38 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/kms: Clean up errors in smu7.h
Date: Thu, 11 Jan 2024 09:05:36 +0000
Message-Id: <20240111090536.13410-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H6Vir59ldLCXAA--.13381S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kXF13tr13WF4fCr1kGrg_yoWDZFb_CF
 1qg3Z5WrZFkFyvqr17AFW7CFZIyF4qvw1xK34Fg34fXrnIqa13urWvkrW7Xw1rWayfXF90
 yan0vF1fAFsxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU9mR7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhVi1mVOBlC+9wAAsH
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/smu7.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/smu7.h b/drivers/gpu/drm/radeon/smu7.h
index 75a380a15292..985d720dbc0d 100644
--- a/drivers/gpu/drm/radeon/smu7.h
+++ b/drivers/gpu/drm/radeon/smu7.h
@@ -82,8 +82,7 @@
 #define SCRATCH_B_CURR_SAMU_INDEX_MASK  (0x7<<SCRATCH_B_CURR_SAMU_INDEX_SHIFT)
 
 
-struct SMU7_PIDController
-{
+struct SMU7_PIDController {
     uint32_t Ki;
     int32_t LFWindupUL;
     int32_t LFWindupLL;
@@ -117,8 +116,7 @@ typedef struct SMU7_PIDController SMU7_PIDController;
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

