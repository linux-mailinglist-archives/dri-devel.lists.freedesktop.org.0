Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAB76C325
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87410E489;
	Wed,  2 Aug 2023 02:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com
 [115.124.28.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE0410E489;
 Wed,  2 Aug 2023 02:54:52 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.6822839|0.6520798; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_alarm|0.168779-0.00358723-0.827634;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6NGrmo_1690944884; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6NGrmo_1690944884) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:54:46 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dce112_hw_sequencer.c
Date: Wed,  2 Aug 2023 02:54:43 +0000
Message-Id: <20230802025443.10458-1-sunran001@208suo.com>
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

ERROR: space required before the open brace '{'

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
index 690caaaff019..0ef9ebb3c1e2 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_hw_sequencer.c
@@ -127,7 +127,7 @@ static bool dce112_enable_display_power_gating(
 	else
 		cntl = ASIC_PIPE_DISABLE;
 
-	if (power_gating != PIPE_GATING_CONTROL_INIT || controller_id == 0){
+	if (power_gating != PIPE_GATING_CONTROL_INIT || controller_id == 0) {
 
 		bp_result = dcb->funcs->enable_disp_power_gating(
 						dcb, controller_id + 1, cntl);
-- 
2.17.1

