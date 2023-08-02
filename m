Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13E76C310
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7077510E1E9;
	Wed,  2 Aug 2023 02:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com
 [115.124.28.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135D10E1E9;
 Wed,  2 Aug 2023 02:47:37 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.8370208|0.1542419; CH=green;
 DM=|AD|false|; DS=CONTINUE|ham_system_inform|0.128715-0.00524152-0.866043;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6NjZXx_1690944447; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6NjZXx_1690944447) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:47:29 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/dc: Clean up errors in hpd_regs.h
Date: Wed,  2 Aug 2023 02:47:25 +0000
Message-Id: <20230802024725.10192-1-sunran001@208suo.com>
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

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h b/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h
index dcfdd71b2304..debb363cfcf4 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h
@@ -36,17 +36,17 @@
 #define ONE_MORE_5 6
 
 
-#define HPD_GPIO_REG_LIST_ENTRY(type,cd,id) \
+#define HPD_GPIO_REG_LIST_ENTRY(type, cd, id) \
 	.type ## _reg =  REG(DC_GPIO_HPD_## type),\
 	.type ## _mask =  DC_GPIO_HPD_ ## type ## __DC_GPIO_HPD ## id ## _ ## type ## _MASK,\
 	.type ## _shift = DC_GPIO_HPD_ ## type ## __DC_GPIO_HPD ## id ## _ ## type ## __SHIFT
 
 #define HPD_GPIO_REG_LIST(id) \
 	{\
-	HPD_GPIO_REG_LIST_ENTRY(MASK,cd,id),\
-	HPD_GPIO_REG_LIST_ENTRY(A,cd,id),\
-	HPD_GPIO_REG_LIST_ENTRY(EN,cd,id),\
-	HPD_GPIO_REG_LIST_ENTRY(Y,cd,id)\
+	HPD_GPIO_REG_LIST_ENTRY(MASK, cd, id),\
+	HPD_GPIO_REG_LIST_ENTRY(A, cd, id),\
+	HPD_GPIO_REG_LIST_ENTRY(EN, cd, id),\
+	HPD_GPIO_REG_LIST_ENTRY(Y, cd, id)\
 	}
 
 #define HPD_REG_LIST(id) \
-- 
2.17.1

