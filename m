Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57C580D0B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27311A910;
	Tue, 26 Jul 2022 07:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DC8113EDF;
 Tue, 26 Jul 2022 07:26:31 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R651e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUBAhD_1658820383; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUBAhD_1658820383) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:26:25 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 01/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:36 +0800
Message-Id: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

smatch warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hwseq.c:910 dcn32_init_hw() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index b6bada383958..201516a62b4b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -907,10 +907,10 @@ void dcn32_init_hw(struct dc *dc)
 		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
 
 	// Get DMCUB capabilities
-    if (dc->ctx->dmub_srv) {
-	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
-	dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
-    }
+	if (dc->ctx->dmub_srv) {
+		dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
+		dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
+	}
 }
 
 static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
-- 
2.20.1.7.g153144c

