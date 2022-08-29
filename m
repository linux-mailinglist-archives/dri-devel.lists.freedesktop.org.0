Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD35A4542
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3067310F100;
	Mon, 29 Aug 2022 08:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653DF10EE24;
 Mon, 29 Aug 2022 08:36:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R851e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VNavQMt_1661762192; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VNavQMt_1661762192) by smtp.aliyun-inc.com;
 Mon, 29 Aug 2022 16:36:33 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 2/4 RESEND] drm/amd/display: clean up some inconsistent
 indentings
Date: Mon, 29 Aug 2022 16:36:25 +0800
Message-Id: <20220829083627.12774-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220829083627.12774-1-yang.lee@linux.alibaba.com>
References: <20220829083627.12774-1-yang.lee@linux.alibaba.com>
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

The indentation of statements in the same curly bracket should be
consistent.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1886
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index c87091683b5d..7ebf25e87933 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -518,13 +518,16 @@ void dcn321_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 
 			if (dc->ctx->dc_bios->funcs->get_soc_bb_info(dc->ctx->dc_bios, &bb_info) == BP_RESULT_OK) {
 				if (bb_info.dram_clock_change_latency_100ns > 0)
-					dcn3_21_soc.dram_clock_change_latency_us = bb_info.dram_clock_change_latency_100ns * 10;
+					dcn3_21_soc.dram_clock_change_latency_us =
+						bb_info.dram_clock_change_latency_100ns * 10;
 
-			if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
-				dcn3_21_soc.sr_enter_plus_exit_time_us = bb_info.dram_sr_enter_exit_latency_100ns * 10;
+				if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
+					dcn3_21_soc.sr_enter_plus_exit_time_us =
+						bb_info.dram_sr_enter_exit_latency_100ns * 10;
 
-			if (bb_info.dram_sr_exit_latency_100ns > 0)
-				dcn3_21_soc.sr_exit_time_us = bb_info.dram_sr_exit_latency_100ns * 10;
+				if (bb_info.dram_sr_exit_latency_100ns > 0)
+					dcn3_21_soc.sr_exit_time_us =
+						bb_info.dram_sr_exit_latency_100ns * 10;
 			}
 		}
 
-- 
2.20.1.7.g153144c

