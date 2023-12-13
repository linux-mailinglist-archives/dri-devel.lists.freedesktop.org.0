Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F02810932
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 05:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FC10E251;
	Wed, 13 Dec 2023 04:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5332B10E251
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 04:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FzRZMyAWCntiSyw9AKWq2qS7y8hIqYTCApvF7MTMzs4=; b=XIcgshlfuoAxXRAnnBkJ39YlPv
 3vqbSA0Ov8ggvymYwVVOLE6bEw0HdmGQ32cIdb2hR++4XvEbsrl/clIBD4N2OC58xDZqKI9ocbfYE
 u3nl5ZFe9fzRRIRLAmkdNT/h1txS37FnmMK6b2OQOhNeKlV5UrnEnMY8UAFqfme6RpQ493ySBGAGw
 MIibzc2E3058/0KwRuqV6zv3rRWN92rRYFJpAOcVUpqcXoS9TadqtyhimbRas/G3DnTNQfqjWRzdw
 JZrrw0FwcoeGRvgfG4t/eXt5cmRE3AVj0O2pn9kgL6WVcuc0dEFFbB0Zo11oFMUdpQya16VTToaVn
 W5Ky9Ygw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rDH3T-00DbRt-3C; Wed, 13 Dec 2023 04:41:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/uapi: drm_mode.h: fix spellos and grammar
Date: Tue, 12 Dec 2023 20:41:07 -0800
Message-ID: <20231213044107.29214-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct spellos reported by codespell.
Fix some grammar (as 's' to a few words).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/uapi/drm/drm_mode.h |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff -- a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -36,10 +36,10 @@ extern "C" {
 /**
  * DOC: overview
  *
- * DRM exposes many UAPI and structure definition to have a consistent
- * and standardized interface with user.
+ * DRM exposes many UAPI and structure definitions to have a consistent
+ * and standardized interface with users.
  * Userspace can refer to these structure definitions and UAPI formats
- * to communicate to driver
+ * to communicate to drivers.
  */
 
 #define DRM_CONNECTOR_NAME_LEN	32
@@ -540,7 +540,7 @@ struct drm_mode_get_connector {
 /* the PROP_ATOMIC flag is used to hide properties from userspace that
  * is not aware of atomic properties.  This is mostly to work around
  * older userspace (DDX drivers) that read/write each prop they find,
- * witout being aware that this could be triggering a lengthy modeset.
+ * without being aware that this could be triggering a lengthy modeset.
  */
 #define DRM_MODE_PROP_ATOMIC        0x80000000
 
@@ -664,7 +664,7 @@ struct drm_mode_fb_cmd {
 };
 
 #define DRM_MODE_FB_INTERLACED	(1<<0) /* for interlaced framebuffers */
-#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifer[] */
+#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifier[] */
 
 /**
  * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
@@ -881,8 +881,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @display_primaries.x: X cordinate of color primary.
-	 * @display_primaries.y: Y cordinate of color primary.
+	 * @display_primaries.x: X coordinate of color primary.
+	 * @display_primaries.y: Y coordinate of color primary.
 	 */
 	struct {
 		__u16 x, y;
@@ -892,8 +892,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @white_point.x: X cordinate of whitepoint of color primary.
-	 * @white_point.y: Y cordinate of whitepoint of color primary.
+	 * @white_point.x: X coordinate of whitepoint of color primary.
+	 * @white_point.y: Y coordinate of whitepoint of color primary.
 	 */
 	struct {
 		__u16 x, y;
