Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2A5B69B3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4805C10E64B;
	Tue, 13 Sep 2022 08:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA9A10E644;
 Tue, 13 Sep 2022 08:38:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPf2T1G_1663058305; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPf2T1G_1663058305) by smtp.aliyun-inc.com;
 Tue, 13 Sep 2022 16:38:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 2/5] drm/amd/display: make dscl32_calc_lb_num_partitions static
Date: Tue, 13 Sep 2022 16:38:02 +0800
Message-Id: <20220913083805.22549-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220913083805.22549-1-jiapeng.chong@linux.alibaba.com>
References: <20220913083805.22549-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This symbol is not used outside of dcn32_dpp.c, so marks it static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_dpp.c:34:6: warning: no previous prototype for ‘dscl32_calc_lb_num_partitions’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2118
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
index f349cbe2a0f0..dcf12a0b031c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
@@ -31,7 +31,7 @@
 #include "dcn30/dcn30_cm_common.h"
 
 /* Compute the maximum number of lines that we can fit in the line buffer */
-void dscl32_calc_lb_num_partitions(
+static void dscl32_calc_lb_num_partitions(
 		const struct scaler_data *scl_data,
 		enum lb_memory_config lb_config,
 		int *num_part_y,
-- 
2.20.1.7.g153144c

