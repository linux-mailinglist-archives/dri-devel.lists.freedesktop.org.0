Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646195175E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D81210E43C;
	Wed, 14 Aug 2024 09:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="h4mKfWQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AD410E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:09:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFA59E000B;
 Wed, 14 Aug 2024 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ay8zrJmUwREqv/Y23bPMShgknzMKJwZC2dV8queNC/Y=;
 b=h4mKfWQD52+1fSXg3nr+oUSUqRP16dlvYh6ZnfDHXOBeuMowoQ6HEifbM0uTw6e+1GOSc5
 U116rTs3zSGwd9PyZjIZChXhWQpbSZBtZZMDCgHH9GidpkDrAGH9iKx3kbt7Q/eZXn9LCb
 nqb2x6TyVXXQbTp7O01CnieBgKTuIA8XCEDuY4E3GDMvBZlmfpCPtpZyzVcbjuQOUT+qb6
 xVgV/zoV1wj19EGv7x9ggZ5V5awjASD+uwiYcHQ+2vO+BNRt/aCvk87QpoaIUJ+/YChu2T
 VXy2gQOjawesN1Ca+FV/NPXkRyxIT/PPTXKrWQnFpRhZoCFYwOOiSDUDjcoTEw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 11:08:57 +0200
Subject: [PATCH RFC 4/6] drm/vkms: Rename to_vkms_plane_state to avoid
 confusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-split-headers-v1-4-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
In-Reply-To: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6G3NSf+iYqXCMNWCe9u4SM0a20rjAGCplRxqdIkYnmU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQoVMrnB64ImEWuLV1/ffH74zHSaeX+KwapC
 1NOvwb3in2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0KAAKCRAgrS7GWxAs
 4ks3D/sFjCULgWSAwBy31vsNdtHOYHi/Rm3AIoApSN7eQpNRnJpYNEbHuwF+APfX5uXmrzxR8/G
 r92A3wqkAZTsecKvZVZsi86ZiURIbW33YuZurcVfkjIufGerj49BVz0RTUTlP/2WqowFw8fsI8J
 QEmHj9GLNx7MbdxjuHVVmyxekj/mub90c566RMdamb2Zq7hOvpf+rPP07m8puQ4+s/aQLZMEmhQ
 UQ2awVamPiDXeLVz1dyPVlwVzPJ/0xDsm1nRDXm4nhiKbxM+vM+LJNjTaF1VtBHHuG12v+ECiWf
 XZ4IGnh60Yy0AodkBOFwedygSbnFRmoL/t9fMLRttugTP64fAi4tNqTtn/TnjHYv74I2i5TMAT+
 NeUMI2JewQxRR614GjwuYCNZnIlhD4W9967jD2vYIkQ1B0gEDJRjVpAT17BywOSHKLiRvao7xF6
 KGwNAuIMylM7316Hlmu/ymGQVbbrMDLVZRVXhMm7aCOT8F3MEJNV9Uq+dbbAu38sP9h+0eWMBOc
 3XcqqylNBXATQibH4J2CtdCa4DMG2GE5uAjFdIVh5jo16/BnyQRzKJLTJ30szjXB7iRD2vzSg+3
 NLkMl8KS+779UekjHGhnEPr7rf3PK2Qc4Tb2CZkDUVPs4VK2ySquCiqtZT4m6xTwmh1WfutYq8U
 pvcxZ2+koX6Uvzg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro to_vkms_plane_state was not explicit about its expected content.
Rename it to drm_plane_state_to_vkms_plane_state to avoid confusion and
help the reader.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_plane.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 6a4de8f7a678..08e5db07aca6 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -212,7 +212,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 			continue;
 
 		vkms_state->active_planes[i++] =
-			to_vkms_plane_state(plane_state);
+			drm_plane_state_to_vkms_plane_state(plane_state);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index de2c83e1b02c..e549c9523a34 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -80,7 +80,7 @@ vkms_plane_duplicate_state(struct drm_plane *plane)
 static void vkms_plane_destroy_state(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
+	struct vkms_plane_state *vkms_state = drm_plane_state_to_vkms_plane_state(old_state);
 	struct drm_crtc *crtc = vkms_state->base.base.crtc;
 
 	if (crtc && vkms_state->frame_info->fb) {
@@ -139,7 +139,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	fmt = fb->format->format;
-	vkms_plane_state = to_vkms_plane_state(new_state);
+	vkms_plane_state = drm_plane_state_to_vkms_plane_state(new_state);
 	shadow_plane_state = &vkms_plane_state->base;
 
 	frame_info = vkms_plane_state->frame_info;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
index 161b44da0240..68170a75e9c9 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.h
+++ b/drivers/gpu/drm/vkms/vkms_plane.h
@@ -59,7 +59,7 @@ struct vkms_frame_info {
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				   enum drm_plane_type type, int possible_crtc_index);
 
-#define to_vkms_plane_state(target)\
+#define drm_plane_state_to_vkms_plane_state(target) \
 	container_of(target, struct vkms_plane_state, base.base)
 
 #endif //_VKMS_PLANE_H

-- 
2.44.2

