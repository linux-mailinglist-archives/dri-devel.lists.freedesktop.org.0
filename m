Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B4619128
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBDA10E081;
	Fri,  4 Nov 2022 06:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CD410E6BC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:37:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R571e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VTvoKDj_1667543814; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VTvoKDj_1667543814) by smtp.aliyun-inc.com;
 Fri, 04 Nov 2022 14:37:03 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: sii9234: Remove the unused function
 sii9234_mode_valid()
Date: Fri,  4 Nov 2022 14:36:52 +0800
Message-Id: <20221104063652.82789-1-jiapeng.chong@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function sii9234_mode_valid() is defined in the sii9234.c file, but
not called elsewhere, so remove this unused function.

drivers/gpu/drm/bridge/sii9234.c:870:31: warning: unused function 'bridge_to_sii9234'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2735
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/bridge/sii9234.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 5b3061d4b5c3..62b6bc8ca7af 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -867,11 +867,6 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	return 0;
 }
 
-static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
-{
-	return container_of(bridge, struct sii9234, bridge);
-}
-
 static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
 					 const struct drm_display_info *info,
 					 const struct drm_display_mode *mode)
-- 
2.20.1.7.g153144c

