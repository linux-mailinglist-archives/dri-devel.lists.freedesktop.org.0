Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C276C309
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E1D10E485;
	Wed,  2 Aug 2023 02:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com
 [115.124.28.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9A610E1E9;
 Wed,  2 Aug 2023 02:43:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.9234841|0.09918608; CH=green;
 DM=|AD|false|; DS=CONTINUE|ham_system_inform|0.230579-0.00226342-0.767157;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6NKq4h_1690944229; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6NKq4h_1690944229) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:43:51 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in ddc_regs.h
Date: Wed,  2 Aug 2023 02:43:46 +0000
Message-Id: <20230802024346.10104-1-sunran001@208suo.com>
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
 .../gpu/drm/amd/display/dc/gpio/ddc_regs.h    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h b/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
index 59884ef651b3..4a2bf81286d8 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
+++ b/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
@@ -31,21 +31,21 @@
 /****************************** new register headers */
 /*** following in header */
 
-#define DDC_GPIO_REG_LIST_ENTRY(type,cd,id) \
+#define DDC_GPIO_REG_LIST_ENTRY(type, cd, id) \
 	.type ## _reg =   REG(DC_GPIO_DDC ## id ## _ ## type),\
 	.type ## _mask =  DC_GPIO_DDC ## id ## _ ## type ## __DC_GPIO_DDC ## id ## cd ## _ ## type ## _MASK,\
 	.type ## _shift = DC_GPIO_DDC ## id ## _ ## type ## __DC_GPIO_DDC ## id ## cd ## _ ## type ## __SHIFT
 
-#define DDC_GPIO_REG_LIST(cd,id) \
+#define DDC_GPIO_REG_LIST(cd, id) \
 	{\
-	DDC_GPIO_REG_LIST_ENTRY(MASK,cd,id),\
-	DDC_GPIO_REG_LIST_ENTRY(A,cd,id),\
-	DDC_GPIO_REG_LIST_ENTRY(EN,cd,id),\
-	DDC_GPIO_REG_LIST_ENTRY(Y,cd,id)\
+	DDC_GPIO_REG_LIST_ENTRY(MASK, cd, id),\
+	DDC_GPIO_REG_LIST_ENTRY(A, cd, id),\
+	DDC_GPIO_REG_LIST_ENTRY(EN, cd, id),\
+	DDC_GPIO_REG_LIST_ENTRY(Y, cd, id)\
 	}
 
-#define DDC_REG_LIST(cd,id) \
-	DDC_GPIO_REG_LIST(cd,id),\
+#define DDC_REG_LIST(cd, id) \
+	DDC_GPIO_REG_LIST(cd, id),\
 	.ddc_setup = REG(DC_I2C_DDC ## id ## _SETUP)
 
 	#define DDC_REG_LIST_DCN2(cd, id) \
@@ -54,34 +54,34 @@
 	.phy_aux_cntl = REG(PHY_AUX_CNTL), \
 	.dc_gpio_aux_ctrl_5 = REG(DC_GPIO_AUX_CTRL_5)
 
-#define DDC_GPIO_VGA_REG_LIST_ENTRY(type,cd)\
+#define DDC_GPIO_VGA_REG_LIST_ENTRY(type, cd)\
 	.type ## _reg =   REG(DC_GPIO_DDCVGA_ ## type),\
 	.type ## _mask =  DC_GPIO_DDCVGA_ ## type ## __DC_GPIO_DDCVGA ## cd ## _ ## type ## _MASK,\
 	.type ## _shift = DC_GPIO_DDCVGA_ ## type ## __DC_GPIO_DDCVGA ## cd ## _ ## type ## __SHIFT
 
 #define DDC_GPIO_VGA_REG_LIST(cd) \
 	{\
-	DDC_GPIO_VGA_REG_LIST_ENTRY(MASK,cd),\
-	DDC_GPIO_VGA_REG_LIST_ENTRY(A,cd),\
-	DDC_GPIO_VGA_REG_LIST_ENTRY(EN,cd),\
-	DDC_GPIO_VGA_REG_LIST_ENTRY(Y,cd)\
+	DDC_GPIO_VGA_REG_LIST_ENTRY(MASK, cd),\
+	DDC_GPIO_VGA_REG_LIST_ENTRY(A, cd),\
+	DDC_GPIO_VGA_REG_LIST_ENTRY(EN, cd),\
+	DDC_GPIO_VGA_REG_LIST_ENTRY(Y, cd)\
 	}
 
 #define DDC_VGA_REG_LIST(cd) \
 	DDC_GPIO_VGA_REG_LIST(cd),\
 	.ddc_setup = mmDC_I2C_DDCVGA_SETUP
 
-#define DDC_GPIO_I2C_REG_LIST_ENTRY(type,cd) \
+#define DDC_GPIO_I2C_REG_LIST_ENTRY(type, cd) \
 	.type ## _reg =   REG(DC_GPIO_I2CPAD_ ## type),\
 	.type ## _mask =  DC_GPIO_I2CPAD_ ## type ## __DC_GPIO_ ## cd ## _ ## type ## _MASK,\
 	.type ## _shift = DC_GPIO_I2CPAD_ ## type ## __DC_GPIO_ ## cd ## _ ## type ## __SHIFT
 
 #define DDC_GPIO_I2C_REG_LIST(cd) \
 	{\
-	DDC_GPIO_I2C_REG_LIST_ENTRY(MASK,cd),\
-	DDC_GPIO_I2C_REG_LIST_ENTRY(A,cd),\
-	DDC_GPIO_I2C_REG_LIST_ENTRY(EN,cd),\
-	DDC_GPIO_I2C_REG_LIST_ENTRY(Y,cd)\
+	DDC_GPIO_I2C_REG_LIST_ENTRY(MASK, cd),\
+	DDC_GPIO_I2C_REG_LIST_ENTRY(A, cd),\
+	DDC_GPIO_I2C_REG_LIST_ENTRY(EN, cd),\
+	DDC_GPIO_I2C_REG_LIST_ENTRY(Y, cd)\
 	}
 
 #define DDC_I2C_REG_LIST(cd) \
@@ -150,12 +150,12 @@ struct ddc_sh_mask {
 
 #define ddc_data_regs(id) \
 {\
-	DDC_REG_LIST(DATA,id)\
+	DDC_REG_LIST(DATA, id)\
 }
 
 #define ddc_clk_regs(id) \
 {\
-	DDC_REG_LIST(CLK,id)\
+	DDC_REG_LIST(CLK, id)\
 }
 
 #define ddc_vga_data_regs \
-- 
2.17.1

