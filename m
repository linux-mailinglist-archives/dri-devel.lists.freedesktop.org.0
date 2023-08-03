Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61976E513
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6410E008;
	Thu,  3 Aug 2023 09:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2C10E008
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:57:56 +0000 (UTC)
Date: Thu, 03 Aug 2023 09:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691056673; x=1691315873;
 bh=5B02YitfeUWBbNC/ZATP0PoXpqvzdq4jX/IjJs7vuXI=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=nllTjHNbGQ3N4QbZmhNNTDXXgRtjmXgn88u2q7VYSlWGJf1yGzzfPPOr6tBbquLu2
 NIYFCv/AgIF2SHmYaiaybPgooX8uW0Oc4cWph1YTi+LyCJ0O9qqnItRMAXVA42ZrgG
 N6IlCMP4lzQBsJzMiIgDO9SaJJC8atrnZyeHfqlqycWrp0VTn9ftCyqcoaahxk4XRc
 Qb7Lv53Oif6I2CG4Ycek8K5rtg3uCkBzVnrchrPCLf6qTRwYzB7mT89EDwWcMt5cra
 bwsnCcIKHDdPCcBwuWbH4AJq+v3mwOdqrly5orDNQFhCBTSaeGyBQuNNcBEVcxZvuV
 qG+2toF053Pqw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: use proper cross-references for sections
Message-ID: <20230803095734.386761-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When I originally wrote these docs, I couldn't manage to insert a
cross-reference to a section. Here's how it can be done.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 Documentation/gpu/drm-kms.rst | 2 ++
 Documentation/gpu/drm-mm.rst  | 2 ++
 include/uapi/drm/drm.h        | 9 ++++-----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index c92d425cb2dd..ca9210e47266 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -360,6 +360,8 @@ Format Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
=20
+.. _kms_dumb_buffer_objects:
+
 Dumb Buffer Objects
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 3d5dc9dc1bfe..513197359aba 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -517,6 +517,8 @@ DRM Cache Handling and Fast WC memcpy()
 .. kernel-doc:: drivers/gpu/drm/drm_cache.c
    :export:
=20
+.. _drm_sync_objects:
+
 DRM Sync Objects
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 863e47200911..75ec985d95e5 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -673,8 +673,8 @@ struct drm_gem_open {
  * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IM=
PORT
  * and &DRM_PRIME_CAP_EXPORT.
  *
- * PRIME buffers are exposed as dma-buf file descriptors. See
- * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
+ * PRIME buffers are exposed as dma-buf file descriptors.
+ * See :ref:`prime_buffer_sharing`.
  */
 #define DRM_CAP_PRIME=09=09=090x5
 /**
@@ -756,15 +756,14 @@ struct drm_gem_open {
 /**
  * DRM_CAP_SYNCOBJ
  *
- * If set to 1, the driver supports sync objects. See
- * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ * If set to 1, the driver supports sync objects. See :ref:`drm_sync_objec=
ts`.
  */
 #define DRM_CAP_SYNCOBJ=09=090x13
 /**
  * DRM_CAP_SYNCOBJ_TIMELINE
  *
  * If set to 1, the driver supports timeline operations on sync objects. S=
ee
- * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ * :ref:`drm_sync_objects`.
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE=090x14
=20
--=20
2.41.0


