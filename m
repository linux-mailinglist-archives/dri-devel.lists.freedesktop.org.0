Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CF2DC7C6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 21:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4539B8995F;
	Wed, 16 Dec 2020 20:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF51189A7A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:33:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id CE6B73AA8AD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:23:01 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B4F1324000C;
 Wed, 16 Dec 2020 20:22:39 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/doc: introduce new section for standard plane
 properties
Date: Wed, 16 Dec 2020 21:22:20 +0100
Message-Id: <20201216202222.48146-7-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216202222.48146-1-contact@emersion.fr>
References: <20201216202222.48146-1-contact@emersion.fr>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a new "Standard Plane Properties" section for properties
defined in drm_plane.c. Move the mis-placed IN_FORMATS docs there.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 Documentation/gpu/drm-kms.rst |  6 ++++++
 drivers/gpu/drm/drm_blend.c   |  6 ------
 drivers/gpu/drm/drm_plane.c   | 12 ++++++++++++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index fcd4e15379b0..9cfaab4df21a 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -493,6 +493,12 @@ Standard CRTC Properties
 .. kernel-doc:: drivers/gpu/drm/drm_crtc.c
    :doc: standard CRTC properties
 
+Standard Plane Properties
+-------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_plane.c
+   :doc: standard plane properties
+
 Plane Composition Properties
 ----------------------------
 
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 5c2141e9a9f4..26e2f2ffd255 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -185,12 +185,6 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
- * IN_FORMATS:
- *	Blob property which contains the set of buffer format and modifier
- *	pairs supported by this plane. The blob is a drm_format_modifier_blob
- *	struct. Without this property the plane doesn't support buffers with
- *	modifiers. Userspace cannot change this property.
- *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 49b0a8b9ac02..4c1a45ac18e6 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -61,6 +61,18 @@
  * userspace too much.
  */
 
+/**
+ * DOC: standard plane properties
+ *
+ * DRM planes have a few standardized properties:
+ *
+ * IN_FORMATS:
+ *     Blob property which contains the set of buffer format and modifier
+ *     pairs supported by this plane. The blob is a drm_format_modifier_blob
+ *     struct. Without this property the plane doesn't support buffers with
+ *     modifiers. Userspace cannot change this property.
+ */
+
 static unsigned int drm_num_planes(struct drm_device *dev)
 {
 	unsigned int num = 0;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
