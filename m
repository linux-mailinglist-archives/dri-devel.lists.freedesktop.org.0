Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A6591B71
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 17:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14342BD395;
	Sat, 13 Aug 2022 15:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709C6BD35D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 15:34:53 +0000 (UTC)
X-QQ-mid: bizesmtp83t1660404880tmhkwk9h
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 13 Aug 2022 23:34:33 +0800 (CST)
X-QQ-SSF: 0100000000200080H000B00A0000020
X-QQ-FEAT: ao4JQgu0M39k2YuXdaMww2Xpj7yFVsZdElscKH/kG6xdjcbJlkdsynj1frJMm
 DPgyYwtCVUbGGdblLd18IjZ5nE9SSMpygzZvukm4g5S95VkUa5IOBLfg8dKwSEWTp2BA0kJ
 xmkf9ycHpSbClO0QyF1uA9yl+t9TK0uRHiQZYmTf6Y5jEJKr+QeercZwhuwSLJJT+QJvYTp
 2cZkT9t2VXDamXUhxyFKBwmJySyUVU9dxpMY89n5C2Orz0GbeMgXchdSx28lkHAQteC9qoq
 9UZvkyDC8TBJkS/SGO9cJFXew96ewfYENKukPjZxR6o/wmbFE7R6kpcGXVXkTALayYDTNpF
 cUulzg801p9zHnLA1BCLkZ99HWt7otEe9GOUxHMHMw4UQsVMeclidz0ZnShkg==
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: Unneeded semicolon
Date: Sat, 13 Aug 2022 23:34:21 +0800
Message-Id: <20220813153421.4754-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: Charlene.Liu@amd.com, min tang <tangmin@cdjrlc.com>, sunpeng.li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no semicolon after '}' in line 510.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 27501b735a9c..c87cf8771c6d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -505,7 +505,7 @@ static void dcn315_clk_mgr_helper_populate_bw_params(
 		bw_params->clk_table.entries[i].dispclk_mhz = clock_table->DispClocks[i];
 		bw_params->clk_table.entries[i].dppclk_mhz = clock_table->DppClocks[i];
 		bw_params->clk_table.entries[i].wck_ratio = 1;
-	};
+	}
 
 	/* Make sure to include at least one entry and highest pstate */
 	if (max_pstate != min_pstate || i == 0) {
-- 
2.17.1

