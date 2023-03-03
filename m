Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60A6A94EB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 11:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCC610E5C2;
	Fri,  3 Mar 2023 10:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 685FD10E5C2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 10:12:23 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:44584.54956302
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id C997C100238;
 Fri,  3 Mar 2023 18:12:18 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-jn5ln with ESMTP id
 e17eeec910d64beeb9e11491deadb756 for christian.koenig@amd.com; 
 Fri, 03 Mar 2023 18:12:19 CST
X-Transaction-ID: e17eeec910d64beeb9e11491deadb756
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: suijingfeng <15330273260@189.cn>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] ttm/ttm_device.h: fix a trival typo
Date: Fri,  3 Mar 2023 18:12:16 +0800
Message-Id: <20230303101216.788971-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: suijingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 should replace '@' with '*'

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
---
 include/drm/ttm/ttm_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 4f3e81eac6f3..56e82ba2d046 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -141,7 +141,7 @@ struct ttm_device_funcs {
 	 * the graphics address space
 	 * @ctx: context for this move with parameters
 	 * @new_mem: the new memory region receiving the buffer
-	 @ @hop: placement for driver directed intermediate hop
+	 * @hop: placement for driver directed intermediate hop
 	 *
 	 * Move a buffer between two memory regions.
 	 * Returns errno -EMULTIHOP if driver requests a hop
-- 
2.25.1

