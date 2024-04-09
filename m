Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7489D634
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF894112C3D;
	Tue,  9 Apr 2024 10:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QJc24gR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA98F112C47
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:04:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95F33C0011;
 Tue,  9 Apr 2024 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaOfMtUooEBbcTUX3ySQvIrI0XekY4PkXHzJqdiW8Do=;
 b=QJc24gR+EXPcui/smHnpzu+Iyl0fuhh4pXJnOtuggGfG9A8hmU6oIIUMFDk+AM7gqRCVOe
 moo86y2k7ZTh6yHYSGXG6xew/rlTlEisKSupG68sd8dVYxDjrXVdEsxWgx8PCdy0HDzp8S
 aJaJL+zrJ76sZBor5k3l0+/Z6ahq7l+yBKcKGY/GHksEAaebdtuBtFN+tdV/hsAgAll8h5
 PECQCJjSoxj0wUowUdY+VstshOb+ZSFvw5YqriQYCP/vIdxqupAnmE07NPvtfEwWCkwBZN
 qg4M05eQ2Xk2Y6QN3dFkhDJAtuOd4E07KFvjo7U0OFmeKylztBHmUmdhjaakzA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 12:04:07 +0200
Subject: [PATCH 3/3] drm/fourcc: Add documentation around drm_format_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-google-drm-doc-v1-3-033d55cc8250@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=p9bWfzVhPSbxnan4gt/J8np1umoCeXuce2K3EFa4g9o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFRK1SSdf8m+PrFjNQ3393GV2MGNqtQp/i5TiL
 IsTjcumGhaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhUStQAKCRAgrS7GWxAs
 4msAEACt6PBybYnO/0WibFTqCZSNQrho5XGmeeAUcpdpp9btXh0I2bQxxAqFRZgJG9iEnEJF2mo
 oePi6L0iTBRMesI/C/EP/XQbz+zD9lQhcxirWahCwz4yzDIJzkilX7WQ6Gd4yeBr1hQt0McLZvp
 AyXdUUrAMBMhu2hug+k205Q5+AdpIWF+zqaspIPSTarIgVoZc+oYo9e5mt3fkvUKr4ZYybFUIRh
 L+XQ9zd6Gdkx1QwLhnDNEu+OKv6YeITTQaqjld/Cz3ooXGBvd7e7D8sOTVENbDV49QODwjElgHh
 n95tUFT2Gzk1F5Tkmomd6pC+L+cv1Y/eJFLMGkaPhUImP/GvtlRfmUS0DpsSdULJvx8m5qpkDZo
 Pe6te1cbxdbGrH5A11iKW4t3Ckkr3wEYJOULKi2nXNWbQii+CbGX+TE+jAHNRrxE0/drcJOa4X6
 XLestlDulUHC2Zon0gw86eVhVtdODOQVQoDV//J2sIxoGEB1Rf2F9UMqv6dosrBA1puYjukI77v
 Y4V2JLU58fV0Ph06I9PGN8nAlUFM0h1tZbGUFXRIah7C3wjFIpq84ea8KMTLoyEB3yiBZsuHu08
 t/IKIoQ2Fb1q2Wo1w/EERvSIx5xzxbKfmqX4x4ABmbw1lETyMUUCT8QjvAScJuk6959UYdr4UB1
 HqKRZRmEfQTNkGQ==
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

Let's provide more details about the drm_format_info structure because
its content may not be straightforward for someone not used to video
formats and drm internals.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/drm/drm_fourcc.h | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index ccf91daa4307..66cc30e28f79 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -58,6 +58,44 @@ struct drm_mode_fb_cmd2;
 
 /**
  * struct drm_format_info - information about a DRM format
+ *
+ * A drm_format_info describes how planes and pixels are stored in memory.
+ *
+ * Some format like YUV can have multiple planes, counted in @num_planes. It
+ * means that a full pixel can be stored in multiple non-continuous buffers.
+ * For example, NV12 is a YUV format using two planes: one for the Y values and
+ * one for the UV values.
+ *
+ * On each plane, the "pixel" unit can be different in case of subsampling. For
+ * example with the NV12 format, a pixel in the UV plane is used for four pixels
+ * in the Y plane.
+ * The fields @hsub and @vsub are the relation between the size of the main
+ * plane and the size of the subsampled planes in pixels:
+ *	plane[0] width = hsub * plane[1] width
+ *	plane[0] height = vsub * plane[1] height
+ *
+ * In some formats, pixels are not independent in memory. It can be a packed
+ * representation to store more pixels per byte (for example P030 uses 4 bytes
+ * for three 10 bit pixels). It can also be used to represent tiled formats,
+ * where a continuous buffer in memory can represent a rectangle of pixels (for
+ * example, in DRM_FORMAT_Y0L0, a buffer of 8 bytes represents a 2x2 pixel
+ * region of the picture).
+ *	The field @char_per_block is the size of a block on a specific plane, in
+ *	bytes.
+ *	The fields @block_w and @block_h are the size of a block in pixels.
+ *
+ * The older format representation (which only uses @cpp, kept for historical
+ * reasons because there are a lot of places in drivers where it's used) is
+ * assuming that a block is always 1x1 pixel.
+ *
+ * To keep the compatibility with older format representations and treat block
+ * and non-block formats in the same way one should use:
+ *	- @char_per_block to access the size of a block on a specific plane, in
+ *	bytes.
+ *	- drm_format_info_block_width() to access the width of a block of a
+ *	specific plane, in pixels.
+ *	- drm_format_info_block_height() to access the height of a block of a
+ *	specific plane, in pixels.
  */
 struct drm_format_info {
 	/** @format: 4CC format identifier (DRM_FORMAT_*) */
@@ -97,13 +135,6 @@ struct drm_format_info {
 		 * formats for which the memory needed for a single pixel is not
 		 * byte aligned.
 		 *
-		 * @cpp has been kept for historical reasons because there are
-		 * a lot of places in drivers where it's used. In drm core for
-		 * generic code paths the preferred way is to use
-		 * @char_per_block, drm_format_info_block_width() and
-		 * drm_format_info_block_height() which allows handling both
-		 * block and non-block formats in the same way.
-		 *
 		 * For formats that are intended to be used only with non-linear
 		 * modifiers both @cpp and @char_per_block must be 0 in the
 		 * generic format table. Drivers could supply accurate

-- 
2.43.0

