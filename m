Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE6A71763
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710BE10E6CC;
	Wed, 26 Mar 2025 13:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="em2HhJ7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBF610E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:23 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECE5158E;
 Wed, 26 Mar 2025 14:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995294;
 bh=Kkv02RY+uC5gb+rCcgZRwQbhycaoT1IOEEkr4c7TgU4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=em2HhJ7ltiD1qLoqWj9D5WtFFqePhk6rRJQT5azLSNCZUzUwEQeBPT5FW/LARMgU/
 5gU0iokovLMP/mgyZeJaowtsM9LiST9PqenQRL/TntThF0DoxzFcWVOoMN8WHjEBoJ
 BWFCKrxJBIG6kh/59BiYu/cnIWaPKkmWqBQYijc4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:49 +0200
Subject: [PATCH v4 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-6-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Kkv02RY+uC5gb+rCcgZRwQbhycaoT1IOEEkr4c7TgU4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//BRA0rDWg+mBiQlFGJMSf3f0iKYQpy73R0b
 011V8VioymJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wQAKCRD6PaqMvJYe
 9a+LEACTMt3XvBoeLh1U4Q8dJ7iBX65ow8WQRKqilosaZqurameqS7r0OsbHuPi3HGgr3P4Tx3S
 3ZSYmCPR7mVBKqo5/FBceIr5vQGclra7GN1zftesjn1aaPmCgUR5FUIkEIHBmYEUKZi1kXcQCSx
 4Zjrs+P6Tjy3g/R9mevMKj3UGYbKIMLS5nd0A5YHRLf+76elOs0biNxzIm5bYwxbMNU9N+yZrUP
 2GonK49jekaJvLg3Gy9DCDplwwh3wYV1kcAbHOQT8Y6wCEsn7euY9ztBbg5OvElV5Jjnz7JtNVI
 oULlIqEYR/v3fsrtm5wKeCnwvUnzdjSNyFhK3dtK7Cn9Zv+SRrs55P5ldwOSi2L+yLnokCLbINT
 uVJPs9yuMmJme1OyqGiCYGUuSqTqrLBPlftyMNJTdUIiXLehKbn+/KDhFMAQy7LitC/FwLTsNez
 uqPdD5KEvQB0ZUgqdQleOoqEdDru5S/OfXvckU0baqd/4Oq4Iau3wqV/CXKHXA7jlcqT9wPOXJI
 D7yZsnXLZcf5oLkP/Jc2abzOataZUqt0h1mlJ7qCAhDkzl8Msac7S7z+VuelOGlnAlGG4FDVVEc
 5HFh8dIHQo+qAyKYyuWUCzy4h+EFlnj9xyYaHlPvxuvJp0KJaCb0E3ey9CDUreSMdvQGuw+D8p3
 G2HYNCiBGC0+Ckg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 60684f99f4a7..81e5fcdcc234 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 10d77f6f6e95..552438128f51 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -246,6 +246,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0

