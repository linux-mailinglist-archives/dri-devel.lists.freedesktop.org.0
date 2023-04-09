Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77536DBFF4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 15:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FF010E181;
	Sun,  9 Apr 2023 13:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8FCA10E181
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 13:15:54 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:57888.747372405
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 0A08A1001EA;
 Sun,  9 Apr 2023 21:15:51 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 dd1e54c6942f4b539e55c624606a89f3 for mripard@kernel.org; 
 Sun, 09 Apr 2023 21:15:52 CST
X-Transaction-ID: dd1e54c6942f4b539e55c624606a89f3
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH] drm/drm_plane.h: fix grammar of the comment
Date: Sun,  9 Apr 2023 21:15:47 +0800
Message-Id: <20230409131547.494128-1-15330273260@189.cn>
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

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 include/drm/drm_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..79d62856defb 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -56,7 +56,7 @@ struct drm_plane_state {
 	/**
 	 * @crtc:
 	 *
-	 * Currently bound CRTC, NULL if disabled. Do not this write directly,
+	 * Currently bound CRTC, NULL if disabled. Do not write this directly,
 	 * use drm_atomic_set_crtc_for_plane()
 	 */
 	struct drm_crtc *crtc;
-- 
2.25.1

