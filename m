Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43678F6B9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 03:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9478110E70D;
	Fri,  1 Sep 2023 01:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AB410E70D;
 Fri,  1 Sep 2023 01:29:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VqzgJqc_1693531771; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VqzgJqc_1693531771) by smtp.aliyun-inc.com;
 Fri, 01 Sep 2023 09:29:31 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com
Subject: [PATCH -next 3/5] drm/amd/display: clean up some inconsistent
 indentings
Date: Fri,  1 Sep 2023 09:29:22 +0800
Message-Id: <20230901012924.120196-3-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230901012924.120196-1-yang.lee@linux.alibaba.com>
References: <20230901012924.120196-1-yang.lee@linux.alibaba.com>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn35/dcn35_hwseq.c:159 dcn35_init_hw() warn: inconsistent indentig

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../drm/amd/display/dc/dcn35/dcn35_hwseq.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
index 666e2809d9dc..025849143254 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
@@ -155,22 +155,22 @@ void dcn35_init_hw(struct dc *dc)
 		res_pool->ref_clocks.xtalin_clock_inKhz =
 				dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency;
 
-			if (res_pool->dccg && res_pool->hubbub) {
-
-				(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
-						dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
-						&res_pool->ref_clocks.dccg_ref_clock_inKhz);
-
-				(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
-						res_pool->ref_clocks.dccg_ref_clock_inKhz,
-						&res_pool->ref_clocks.dchub_ref_clock_inKhz);
-			} else {
-				// Not all ASICs have DCCG sw component
-				res_pool->ref_clocks.dccg_ref_clock_inKhz =
-						res_pool->ref_clocks.xtalin_clock_inKhz;
-				res_pool->ref_clocks.dchub_ref_clock_inKhz =
-						res_pool->ref_clocks.xtalin_clock_inKhz;
-			}
+		if (res_pool->dccg && res_pool->hubbub) {
+
+			(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
+				dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
+				&res_pool->ref_clocks.dccg_ref_clock_inKhz);
+
+			(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
+				res_pool->ref_clocks.dccg_ref_clock_inKhz,
+				&res_pool->ref_clocks.dchub_ref_clock_inKhz);
+		} else {
+			// Not all ASICs have DCCG sw component
+			res_pool->ref_clocks.dccg_ref_clock_inKhz =
+				res_pool->ref_clocks.xtalin_clock_inKhz;
+			res_pool->ref_clocks.dchub_ref_clock_inKhz =
+				res_pool->ref_clocks.xtalin_clock_inKhz;
+		}
 	} else
 		ASSERT_CRITICAL(false);
 
-- 
2.20.1.7.g153144c

