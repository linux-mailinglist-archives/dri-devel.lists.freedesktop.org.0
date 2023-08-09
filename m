Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED52775344
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 08:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5210E23B;
	Wed,  9 Aug 2023 06:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D110E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 06:52:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VpOrdpm_1691563950; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VpOrdpm_1691563950) by smtp.aliyun-inc.com;
 Wed, 09 Aug 2023 14:52:40 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: manager: Remove the unused variable prev
Date: Wed,  9 Aug 2023 14:52:29 +0800
Message-Id: <20230809065229.71300-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tzimmermann@suse.de,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 mripard@kernel.org, sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable prev is not effectively used, so delete it.

drivers/gpu/drm/drm_gpuva_mgr.c:1079:32: warning: variable ‘prev’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index f86bfad74ff8..afa5330445b3 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -1076,7 +1076,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 		   u64 req_addr, u64 req_range,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
-	struct drm_gpuva *va, *next, *prev = NULL;
+	struct drm_gpuva *va, *next = NULL;
 	u64 req_end = req_addr + req_range;
 	int ret;
 
@@ -1206,7 +1206,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
 			}
 		}
 next:
-		prev = va;
 	}
 
 	return op_map_cb(ops, priv,
-- 
2.20.1.7.g153144c

