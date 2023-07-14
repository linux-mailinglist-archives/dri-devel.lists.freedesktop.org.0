Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052F75423F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F5310E8CC;
	Fri, 14 Jul 2023 18:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E41410E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 18:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2026540BFF;
 Fri, 14 Jul 2023 20:08:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sqflcgn8Xh3X; Fri, 14 Jul 2023 20:08:31 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689358111; bh=3APKavHLl3ZkMGA6TxzMMhaHSrKm6w2x6zwKuukLtHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LWeTv64r5lEAHYelWNGXWQOQ9Sqq0e0+nng3MKoLyE+Mi/n+cl1AcMris53ELZ9YC
 V0+qrTpZrdPswnXILPXL5fNvZS6pz8HlVyFITDe3TAGJ5+Ma+4/VgyMfzi8BiJCrf+
 C0nY/Gn9KlZEnae5Hlnlk2ITz+wIqfWuajSJCRDgkJsew7SMghra6yPzVUE3Wznp6l
 0R65DXom9MqcBU4GL2knzRNxx1r0O/p04qYgn6azmOk4R3+5134dQnlSsIzr+8w/lr
 AcIlRaRhRJTCatm1ADV8fHN3Ol7waWYqaeJWnOI0FFn2TV2s/X9pVIABn4fEX8R973
 ZmfAYv2OaV1mA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm: Add kernel-doc for drm_framebuffer_check_src_coords()
Date: Fri, 14 Jul 2023 15:06:16 -0300
Message-ID: <20230714180619.15850-2-gcarlos@disroot.org>
In-Reply-To: <20230714180619.15850-1-gcarlos@disroot.org>
References: <20230714180619.15850-1-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 mripard@kernel.org, mairacanal@riseup.net,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/drm_framebuffer.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..49df3ca3b3ee 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -73,6 +73,21 @@
  * drm_framebuffer.
  */
 
+/**
+ * drm_framebuffer_check_src_coords - check if the source with given
+ * coordinates and sizes is inside the framebuffer
+ * @src_x: source x coordinate
+ * @src_y: source y coordinate
+ * @src_w: source width
+ * @src_h: source height
+ * @fb: pointer to the framebuffer to check
+ *
+ * This function checks if an object with the given set of coordinates and
+ * sizes fits inside the framebuffer by looking at its size.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
 int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 				     uint32_t src_w, uint32_t src_h,
 				     const struct drm_framebuffer *fb)
@@ -82,7 +97,6 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
 	fb_width = fb->width << 16;
 	fb_height = fb->height << 16;
 
-	/* Make sure source coordinates are inside the fb. */
 	if (src_w > fb_width ||
 	    src_x > fb_width - src_w ||
 	    src_h > fb_height ||
-- 
2.41.0

