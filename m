Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB170A7A9
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CDE10E163;
	Sat, 20 May 2023 12:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6E8610E163
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:12:09 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:60862.2032723498
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id C7EB01002B1;
 Sat, 20 May 2023 20:12:04 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 c7a32f856fc44fa5b18de09dc2d1b278 for mripard@kernel.org; 
 Sat, 20 May 2023 20:12:05 CST
X-Transaction-ID: c7a32f856fc44fa5b18de09dc2d1b278
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH] drm/drm_device.h: fix a typo
Date: Sat, 20 May 2023 20:12:01 +0800
Message-Id: <20230520121201.332785-1-15330273260@189.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Replace it with if

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 include/drm/drm_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 7cf4afae2e79..8e377857fb01 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -211,7 +211,7 @@ struct drm_device {
 	 * refcount drops to zero, as opposed to via the vblank disable
 	 * timer.
 	 *
-	 * This can be set to true it the hardware has a working vblank counter
+	 * This can be set to true if the hardware has a working vblank counter
 	 * with high-precision timestamping (otherwise there are races) and the
 	 * driver uses drm_crtc_vblank_on() and drm_crtc_vblank_off()
 	 * appropriately. See also @max_vblank_count and
-- 
2.25.1

