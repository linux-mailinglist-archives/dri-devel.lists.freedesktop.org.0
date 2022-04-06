Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF7B4F56D5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0346E10F415;
	Wed,  6 Apr 2022 07:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09C9110F415
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:30:44 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:54472.1734920290
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 6C6EB1002AB;
 Wed,  6 Apr 2022 15:30:37 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 b3fc00b12b0444a3b3ce6c4630009db5 for maarten.lankhorst@linux.intel.com; 
 Wed, 06 Apr 2022 15:30:40 CST
X-Transaction-ID: b3fc00b12b0444a3b3ce6c4630009db5
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/drm_modeset_helper_vtables.h: fix a typo
Date: Wed,  6 Apr 2022 15:30:36 +0800
Message-Id: <20220406073036.276288-1-15330273260@189.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 change upate to update

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 include/drm/drm_modeset_helper_vtables.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fdfa9f37ce05..fafa70ac1337 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1384,7 +1384,7 @@ struct drm_mode_config_helper_funcs {
 	 * starting to commit the update to the hardware.
 	 *
 	 * After the atomic update is committed to the hardware this hook needs
-	 * to call drm_atomic_helper_commit_hw_done(). Then wait for the upate
+	 * to call drm_atomic_helper_commit_hw_done(). Then wait for the update
 	 * to be executed by the hardware, for example using
 	 * drm_atomic_helper_wait_for_vblanks() or
 	 * drm_atomic_helper_wait_for_flip_done(), and then clean up the old
-- 
2.25.1

