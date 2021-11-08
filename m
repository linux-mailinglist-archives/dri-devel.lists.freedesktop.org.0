Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE044804B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 14:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD816E22B;
	Mon,  8 Nov 2021 13:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 646 seconds by postgrey-1.36 at gabe;
 Mon, 08 Nov 2021 13:31:07 UTC
Received: from 189.cn (ptr.189.cn [183.61.185.105])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59B6D6E22B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 13:31:07 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55728.1482080932
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 33217100283;
 Mon,  8 Nov 2021 21:20:17 +0800 (CST)
Received: from  ([14.17.101.177])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 7f0b0ff87bb945df8ff1b647098bcf7c for maarten.lankhorst@linux.intel.com; 
 Mon, 08 Nov 2021 21:20:18 CST
X-Transaction-ID: 7f0b0ff87bb945df8ff1b647098bcf7c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 14.17.101.177
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/drm_plane.h: fix a typo: not -> note
Date: Mon,  8 Nov 2021 21:20:08 +0800
Message-Id: <20211108132008.3631-1-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
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

From: suijingfeng <suijingfeng@loongson.cn>

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
---
 include/drm/drm_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index fed97e35626f..0c1102dc4d88 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,7 +43,7 @@ enum drm_scaling_filter {
 /**
  * struct drm_plane_state - mutable plane state
  *
- * Please not that the destination coordinates @crtc_x, @crtc_y, @crtc_h and
+ * Please note that the destination coordinates @crtc_x, @crtc_y, @crtc_h and
  * @crtc_w and the source coordinates @src_x, @src_y, @src_h and @src_w are the
  * raw coordinates provided by userspace. Drivers should use
  * drm_atomic_helper_check_plane_state() and only use the derived rectangles in
-- 
2.25.1

