Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E7874106
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C581B1134FF;
	Wed,  6 Mar 2024 20:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="RlVxsnWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286EE1134FD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:57 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tqk0D1269zDqnY;
 Wed,  6 Mar 2024 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755436; bh=lxw3QxFzZobejKxKEX8+mofg4ioooTepWHtlSjpH3R0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RlVxsnWte279ebXZibAtjR9pOGDVso/R7VgRzLkblD8VIL4niqiIjxvrqbEunxvGz
 sLWW0OIMdaMezuRqUcq3fB9BzUzLMXmZRzTIKTKJsihbp+NMW4ks27kZgeaOlPmaIS
 nkoLmtePaKtThw/RhDILptqtomD8EPXZW80muxV8=
X-Riseup-User-ID: 4C9406F16155A317FE8B2D2AC996CC510B513A647C5017F16AE00E0AAB1FE21C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tqk065SYfzFvr9;
 Wed,  6 Mar 2024 20:03:50 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 06 Mar 2024 17:03:12 -0300
Subject: [PATCH 5/7] drm/vkms: Add comments to format tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-louis-vkms-conv-v1-5-5bfe7d129fdd@riseup.net>
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
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index 3522ecee960f..66cdd83c3d25 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -24,7 +24,24 @@ struct yuv_u8_to_argb_u16_case {
 	} colors[TEST_BUFF_SIZE];
 };
 
+/*
+ * The YUV color representation were acquired via the colour python framework.
+ * Below are the function calls used for generating each case.
+ *
+ * for more information got to the docs:
+ * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
+ */
 static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT601,
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
@@ -38,6 +55,16 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"blue",  {0x1d, 0xff, 0x6b}, {0xffff, 0x0000, 0x0000, 0xffff}},
 		},
 	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT601,
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
@@ -51,6 +78,16 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"blue",  {0x29, 0xf0, 0x6e}, {0xffff, 0x0000, 0x0000, 0xffff}},
 		},
 	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT709,
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
@@ -64,6 +101,16 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"blue",  {0x12, 0xff, 0x74}, {0xffff, 0x0000, 0x0000, 0xffff}},
 		},
 	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                     in_bits = 16,
+	 *                     int_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT709,
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
@@ -77,6 +124,16 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"blue",  {0x20, 0xf0, 0x76}, {0xffff, 0x0000, 0x0000, 0xffff}},
 		},
 	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT2020,
 		.range = DRM_COLOR_YCBCR_FULL_RANGE,
@@ -90,6 +147,16 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
 			{"blue",  {0x0f, 0xff, 0x76}, {0xffff, 0x0000, 0x0000, 0xffff}},
 		},
 	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 */
 	{
 		.encoding = DRM_COLOR_YCBCR_BT2020,
 		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,

-- 
2.43.0

