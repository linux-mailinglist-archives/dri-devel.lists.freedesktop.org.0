Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61385758480
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496D110E3BA;
	Tue, 18 Jul 2023 18:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1B410E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 1656244EC0;
 Tue, 18 Jul 2023 20:19:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OxWR5sY9p9H; Tue, 18 Jul 2023 20:19:27 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689704366; bh=3APKavHLl3ZkMGA6TxzMMhaHSrKm6w2x6zwKuukLtHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SDZisZ4FxIHV2JQWLS2z36ESNavV9R64VM+L/Ad73enRMn5jlNf7op1DLqHJOq3Xm
 j37aOjNzT98y7gb4zu8TE/JRK5W7OgLw6NG9tHG3uM4McmINAES/tdzRogQGg08387
 zEpQz1xs9rMDfk0V0t/6eFk1ivOGb4jlf9QzhMp+mkHF+mjZQj9zQw/gDHRP84Qm6g
 Vp+9zl0hVrCeYKSDxGfNipWy6s2SM+BDY6YgtFHakbbY2x/PkGuNDl7WSnxOiUf3Xx
 be9KShM3zlE8CYDmzWZHG0azq7AXGegD8L5JNiAav1jmsceM67TeRCalEzJ/X1Sdu6
 Cgp0mtmgqH5hg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm: Add kernel-doc for
 drm_framebuffer_check_src_coords()
Date: Tue, 18 Jul 2023 15:17:23 -0300
Message-ID: <20230718181726.3799-2-gcarlos@disroot.org>
In-Reply-To: <20230718181726.3799-1-gcarlos@disroot.org>
References: <20230718181726.3799-1-gcarlos@disroot.org>
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

