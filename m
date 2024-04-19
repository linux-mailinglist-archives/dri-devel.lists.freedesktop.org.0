Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F28AA6E4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 04:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0082E10F8BE;
	Fri, 19 Apr 2024 02:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bZB58PU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DED10F8BE;
 Fri, 19 Apr 2024 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1713493157; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=Td7V3A43ySEiCBw4iP8fzhTEsH+umasH6SY05GOKao8=;
 b=bZB58PU/CnVpMifMPE7Q/z6+uZ7sKGrMu0WyWXb4UcIaDKjTBWxl/MuleBYZU44vABt7awgmR0KZgUyL8rRDetwWa4YGtdn1MRkdwqo9UFDR0TB3SGW9OiKN/288unhTQMnK+UbmLHTjJsO+cG+JoR23radn656trqo1enYvnS4=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W4qBpQY_1713493129; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W4qBpQY_1713493129) by smtp.aliyun-inc.com;
 Fri, 19 Apr 2024 10:19:16 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: Remove duplicate dcn32/dcn32_clk_mgr.h header
Date: Fri, 19 Apr 2024 10:18:47 +0800
Message-Id: <20240419021847.16585-1-jiapeng.chong@linux.alibaba.com>
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

./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c: dcn32/dcn32_clk_mgr.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8789
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 7eecb3403f74..d7bbb0891398 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -41,7 +41,6 @@
 #include "dcn/dcn_3_2_0_offset.h"
 #include "dcn/dcn_3_2_0_sh_mask.h"
 
-#include "dcn32/dcn32_clk_mgr.h"
 #include "dml/dcn32/dcn32_fpu.h"
 
 #define DCN_BASE__INST0_SEG1                       0x000000C0
-- 
2.20.1.7.g153144c

