Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6176AD96
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA6410E1D9;
	Tue,  1 Aug 2023 09:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com
 [115.124.28.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD2D10E1D9;
 Tue,  1 Aug 2023 09:30:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4867433|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.143503-0.00113365-0.855363; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047209; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5rwF-m_1690882224; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5rwF-m_1690882224) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:30:26 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] gpu: amd: Clean up errors in ppatomfwctrl.h
Date: Tue,  1 Aug 2023 09:30:23 +0000
Message-Id: <20230801093023.7584-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
index 2fc1733bcdcf..e86e05c786d9 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h
@@ -147,8 +147,7 @@ struct pp_atomfwctrl_bios_boot_up_values {
 	uint8_t    ucCoolingID;
 };
 
-struct pp_atomfwctrl_smc_dpm_parameters
-{
+struct pp_atomfwctrl_smc_dpm_parameters {
   uint8_t  liquid1_i2c_address;
   uint8_t  liquid2_i2c_address;
   uint8_t  vr_i2c_address;
-- 
2.17.1

