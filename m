Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8A76AB2F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8036610E365;
	Tue,  1 Aug 2023 08:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-53.mail.aliyun.com (out28-53.mail.aliyun.com
 [115.124.28.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DA410E365;
 Tue,  1 Aug 2023 08:37:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1057698|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0623579-0.000287539-0.937355; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047212; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5ob-Yq_1690879031; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5ob-Yq_1690879031) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 16:37:13 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in ppatomctrl.h
Date: Tue,  1 Aug 2023 08:37:10 +0000
Message-Id: <20230801083710.6738-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
index b3103bd4be42..1f987e846628 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
@@ -278,16 +278,14 @@ struct pp_atom_ctrl__avfs_parameters {
 	uint8_t  ucReserved;
 };
 
-struct _AtomCtrl_HiLoLeakageOffsetTable
-{
+struct _AtomCtrl_HiLoLeakageOffsetTable {
     USHORT usHiLoLeakageThreshold;
     USHORT usEdcDidtLoDpm7TableOffset;
     USHORT usEdcDidtHiDpm7TableOffset;
 };
 typedef struct _AtomCtrl_HiLoLeakageOffsetTable AtomCtrl_HiLoLeakageOffsetTable;
 
-struct _AtomCtrl_EDCLeakgeTable
-{
+struct _AtomCtrl_EDCLeakgeTable {
     ULONG DIDT_REG[24];
 };
 typedef struct _AtomCtrl_EDCLeakgeTable AtomCtrl_EDCLeakgeTable;
-- 
2.17.1

