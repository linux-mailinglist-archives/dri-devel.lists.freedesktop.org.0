Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598989D635
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D31112C47;
	Tue,  9 Apr 2024 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZRrq0sSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2C112C3D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD693C0008;
 Tue,  9 Apr 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmoK2saX48Z7BaAk8XIAqhHfqZyQB83Bo3eVwyIjC00=;
 b=ZRrq0sSas7zBBUrm6THO4/o98Kj6Gv2TR+QnfXpJTXGYUWcrMouQNkQtPKPxwIzTPMagpG
 HMgSs9dF5X2LWM1PuPA2YsPAtEnBZ+mieM6h6lMYRJc3fWiyUzgDPLibijEZ6LUlFIC1FI
 Rafq5ztB80pWPA9g4UPYXnaYJwMsKfz/3d5XychhhgyDVKh95nGibDpxDhaO67sG8Efm3R
 DdelqAoryNQG0W5MXAn35vwseu7pUMmHOJGjeA+vkGVgX3K1n0ITBltJfC+vSw5vdQFjKD
 Zwg79FZUS4oNGivgLrc2H6eacSFzIItmQ0iZCxONp1AhJTRUNlyvPJ0Z4vDY5w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 12:04:06 +0200
Subject: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
In-Reply-To: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=p9nxB4AmLrlY4zWIcrP/uy/FSacfcNG8RxwAEAEEXDI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFRK1GE/Zfoq0FQBmC5eluz1pdZw5EyewevzkT
 8ImCpzVqgmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhUStQAKCRAgrS7GWxAs
 4i6JD/4yVdG5z/8ZTrn1U4lG/4s67XBOGXJgD80d/hDeXG1bt7N01LbtWsJ8vnory9361X7Mz7S
 iiPZ7kqzQMOv40mTNt6FUUWTuGT4qAaLPGWEbiJCAt15ppISdB+dey28Lealqv3PfGYcBrIM8Fv
 OgrJILVs3WCiYKWz1DmzTEVfZv6C6fkbqSYqoe9Cx0/Hyhrmk09CBBZgNldQ1W6sabfesMvlMbz
 bo7ZMJA3ej/XZxnksHu0ykTg57iwl9ddUtQE3OZ5gv9sfCfvKfGDj4tUL+/Yx4K05rcU7kfnP/g
 P98hTuIJqS6g7758fJweQzXhzAa2vKvl5A96V49VwRQG1Zt4cxJHlFCquTct48/XKi3nirl8Xss
 SCxCzOUePtI9Sn+j89pBjjXwL5QEV7VJMt7zTJr1DBMn8rUx9XaQw9Gc6tWAFsoKlKJyCb9hDff
 Xzv77Nkld/hUvny38BL+aqeQnfoD+kIlSbsdH8EXfHPL/tGqtT8fSdDwuUQqsIuY/RAqwmqYZMt
 ZzVPWQd0StIm4nIuE52f3g68L86eG9eOsW8x3l4hNqbDhY2he9198/8B9t7VkWjK8YhrGE5b7CA
 xQGzpPRJX12xTPCcPcTCO1U9lp2Jk+hFKAgJjsAh99jGe6L1N1bcmcn7b0mZ+j9Nebe0YIKOKA1
 M/9rVWEgL5U7hjA==
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

The expected behavior of the rotation property was not very clear. Add
more examples to explain what is the expected result.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 52 +++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 8d4b317eb9d7..6fbb8730d8b0 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -104,6 +104,9 @@
  *	Without this property the rectangle is only scaled, but not rotated or
  *	reflected.
  *
+ *	See drm_plane_create_rotation_property() for details about the expected rotation and
+ *	reflection behavior.
+ *
  *	Possbile values:
  *
  *	"rotate-<degrees>":
@@ -114,18 +117,6 @@
  *		Signals that the contents of a drm plane is reflected along the
  *		<axis> axis, in the same way as mirroring.
  *
- *	reflect-x::
- *
- *			|o |    | o|
- *			|  | -> |  |
- *			| v|    |v |
- *
- *	reflect-y::
- *
- *			|o |    | ^|
- *			|  | -> |  |
- *			| v|    |o |
- *
  * zpos:
  *	Z position is set up with drm_plane_create_zpos_immutable_property() and
  *	drm_plane_create_zpos_property(). It controls the visibility of overlapping
@@ -266,8 +257,41 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
  *
  * Rotation is the specified amount in degrees in counter clockwise direction,
  * the X and Y axis are within the source rectangle, i.e.  the X/Y axis before
- * rotation. After reflection, the rotation is applied to the image sampled from
- * the source rectangle, before scaling it to fit the destination rectangle.
+ * rotation.
+ *
+ * Here are some examples of rotation and reflections:
+ *
+ * |o  +|  REFLECT_X  |+  o|
+ * |    |  ========>  |    |
+ * |    |             |    |
+ *
+ * |o   |  REFLECT_Y  |+   |
+ * |    |  ========>  |    |
+ * |+   |             |o   |
+ *
+ * |o  +|  ROTATE_90  |+   |
+ * |    |  ========>  |    |
+ * |    |             |o   |
+ *
+ * |o   |  ROTATE_180 |   +|
+ * |    |  ========>  |    |
+ * |+   |             |   o|
+ *
+ * |o   |  ROTATE_270 |+  o|
+ * |    |  ========>  |    |
+ * |+   |             |    |
+ *
+ * Rotation and reflection can be combined to handle more situations. In this condition, the
+ * reflection is applied first and the rotation in second.
+ *
+ * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X is:
+ *
+ * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
+ * |    |  ========>  |    |  ========>  |    |
+ * |    |             |    |             |+   |
+ *
+ * It is not possible to pass multiple rotation at the same time. (i.e ROTATE_90 | ROTATE_180 is
+ * not the same as ROTATE_270 and is not accepted).
  */
 int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,

-- 
2.43.0

