Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C26A8740FD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2110E061;
	Wed,  6 Mar 2024 20:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="mP0AE+Hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8585110E061
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:41 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tqjzw02wBz9wM4;
 Wed,  6 Mar 2024 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755420; bh=h0PodFS5qCsCyCWWmRwb25OxPxljdoN865Ax2gcERF0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mP0AE+HqWm0eUi+j3N/Wu3jiqQoq/TVRhdxuYjQCy+At5EB+lJElGd69IZfSDsJ6d
 PEcw7wJMidM6niyzA+lEU3owS0wTQbnIvKZbmwQGxZGx9izmjWbRuauZRYPLpekMHB
 0QOcInocEFyxirvBg7jbcl4iUrqrymFArYdywH20=
X-Riseup-User-ID: 4C21D9B088B280759A744A19E3AD30C66DC2FF9F68FF7EEE6FD7EEE672255839
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tqjzp2fpVzFvsm;
 Wed,  6 Mar 2024 20:03:34 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 06 Mar 2024 17:03:09 -0300
Subject: [PATCH 2/7] drm/vkms: Add comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-louis-vkms-conv-v1-2-5bfe7d129fdd@riseup.net>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
In-Reply-To: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com
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

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 44d9b9b3bdc3..55ed3f598bd7 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -577,6 +577,18 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 0,
 	};
+
+	/*
+	 * Those matrixies were generated using the colour python framework
+	 *
+	 * Below are the function calls used to generate eac matrix, go to
+	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
+	 * for more info:
+	 *
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt601_full = {
 		.matrix = {
 			{ 4294967296, 0,           6021544149 },
@@ -585,6 +597,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 0,
 	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt601_limited = {
 		.matrix = {
 			{ 5020601039, 0,           6881764740 },
@@ -593,6 +611,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 16,
 	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt709_full = {
 		.matrix = {
 			{ 4294967296, 0,          6763714498 },
@@ -601,6 +625,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 0,
 	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt709_limited = {
 		.matrix = {
 			{ 5020601039, 0,          7729959424 },
@@ -609,6 +639,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 16,
 	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt2020_full = {
 		.matrix = {
 			{ 4294967296, 0,          6333358775 },
@@ -617,6 +653,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 0,
 	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
 	static struct conversion_matrix yuv_bt2020_limited = {
 		.matrix = {
 			{ 5020601039, 0,          7238124312 },
@@ -625,6 +667,11 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 		},
 		.y_offset = 16,
 	};
+
+	/*
+	 * The next matrices are just the previous ones, but with the first and
+	 * second columns swapped
+	 */
 	static struct conversion_matrix yvu_bt601_full = {
 		.matrix = {
 			{ 4294967296, 6021544149,  0 },

-- 
2.43.0

