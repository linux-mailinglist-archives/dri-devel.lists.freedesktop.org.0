Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580595B926C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 03:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C47F10EA32;
	Thu, 15 Sep 2022 01:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47010EA2F;
 Thu, 15 Sep 2022 01:58:15 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VPqW7Ab_1663207091; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VPqW7Ab_1663207091) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 09:58:12 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 4/6] drm/amd/display: clean up some inconsistent
 indentings
Date: Thu, 15 Sep 2022 09:58:00 +0800
Message-Id: <20220915015802.59967-4-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
References: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clean up some inconsistent indentings

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2180
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../amd/display/dc/dcn321/dcn321_resource.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index 1bbc0bdf5dc3..355b4b1d6628 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -820,11 +820,11 @@ static struct dce_i2c_hw *dcn321_i2c_hw_create(
 
 #undef REG_STRUCT
 #define REG_STRUCT i2c_hw_regs
-		i2c_inst_regs_init(1),
-		i2c_inst_regs_init(2),
-		i2c_inst_regs_init(3),
-		i2c_inst_regs_init(4),
-		i2c_inst_regs_init(5);
+	i2c_inst_regs_init(1),
+	i2c_inst_regs_init(2),
+	i2c_inst_regs_init(3),
+	i2c_inst_regs_init(4),
+	i2c_inst_regs_init(5);
 
 	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
 				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
@@ -922,10 +922,10 @@ static struct hubp *dcn321_hubp_create(
 
 #undef REG_STRUCT
 #define REG_STRUCT hubp_regs
-		hubp_regs_init(0),
-		hubp_regs_init(1),
-		hubp_regs_init(2),
-		hubp_regs_init(3);
+	hubp_regs_init(0),
+	hubp_regs_init(1),
+	hubp_regs_init(2),
+	hubp_regs_init(3);
 
 	if (hubp32_construct(hubp2, ctx, inst,
 			&hubp_regs[inst], &hubp_shift, &hubp_mask))
@@ -1670,10 +1670,10 @@ static bool dcn321_resource_construct(
 
 #undef REG_STRUCT
 #define REG_STRUCT abm_regs
-		abm_regs_init(0),
-		abm_regs_init(1),
-		abm_regs_init(2),
-		abm_regs_init(3);
+	abm_regs_init(0),
+	abm_regs_init(1),
+	abm_regs_init(2),
+	abm_regs_init(3);
 
 #undef REG_STRUCT
 #define REG_STRUCT dccg_regs
-- 
2.20.1.7.g153144c

