Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CF8C2F1E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 04:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CCA10E089;
	Sat, 11 May 2024 02:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="inEFmg9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4DB10E089;
 Sat, 11 May 2024 02:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1715395400; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=xMWB7tcK9lh6tvkjem4+oVbLaB6u7ih0rPhd/ngxidw=;
 b=inEFmg9FitvymYcDonH+TUX3oHAQa3p4885bEAThVSINGDXNR7ZnA+3pbVAlYR9MABP/iW+iFJgIC7NxBOHEgj0UMrvC6KPqtJIIIBJfYPW01fnsKbojl9dnYce4DQ/Chh4zuaau+8eRF0iYcuVMNIlvg+NQI3SR0hHDT4i5t/o=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067112;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0W6BjtCT_1715395382; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W6BjtCT_1715395382) by smtp.aliyun-inc.com;
 Sat, 11 May 2024 10:43:19 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: clean up some inconsistent indenting
Date: Sat, 11 May 2024 10:43:01 +0800
Message-Id: <20240511024301.81075-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c:792 dcn401_i2c_hw_create() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c:894 dcn401_hubp_create() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c:1738 dcn401_resource_construct() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9002
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../dc/resource/dcn401/dcn401_resource.c      | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 75e2c62ae792..3e1bfddc6e43 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -784,14 +784,13 @@ static struct dce_i2c_hw *dcn401_i2c_hw_create(
 
 #undef REG_STRUCT
 #define REG_STRUCT i2c_hw_regs
-		i2c_inst_regs_init(1),
-		i2c_inst_regs_init(2),
-		i2c_inst_regs_init(3),
-		i2c_inst_regs_init(4);
+	i2c_inst_regs_init(1),
+	i2c_inst_regs_init(2),
+	i2c_inst_regs_init(3),
+	i2c_inst_regs_init(4);
 
 	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
-				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
-
+			      &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
 	return dce_i2c_hw;
 }
 
@@ -886,13 +885,13 @@ static struct hubp *dcn401_hubp_create(
 
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
 
 	if (hubp401_construct(hubp2, ctx, inst,
-			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+			      &hubp_regs[inst], &hubp_shift, &hubp_mask))
 		return &hubp2->base;
 
 	BREAK_TO_DEBUGGER();
@@ -1735,10 +1734,10 @@ static bool dcn401_resource_construct(
 
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

