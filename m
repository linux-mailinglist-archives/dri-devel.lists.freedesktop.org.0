Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBB6FBAB1
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 00:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5D10E30D;
	Mon,  8 May 2023 22:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455210E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lQFDrwAHy2480z5X1luFfZbfMFQo+HW8XxF9SNiCaLE=; b=idu8fWas+C1FoGnYTqdsjE5a2P
 AfaZLsjiQxAmuq2d3fRDJNr0UVKQYZbXkLRZoEFaEuWrQZfhS0AJQXF8fxno1cjXSDWZIC8HOqMPg
 zz40FJpGxfX3IZsNi+aADIN/Tj3fdsIJUJvfeLwyrhJ8K73aNWbmylYuc7Azl4nOKuq2nO/wXrL44
 QYPCOvxfufxS05Ur6MH75K91IaBNvNrJrBDyRu5pxn2ElG7wOHYyr9TxH/dYd9KGssS6jDk9uB0ba
 /Ik3t7l1fYtRgMijLw4GznoAcfNmA/fBHeNgsUqz4TjnzCw2t7N55HcRVmx6GDnH/TRtkSQohT6xe
 TqOEsEyQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pw8uT-004FTw-22; Tue, 09 May 2023 00:00:45 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 1/2] drm/vkms: Add kernel-doc to the function
 vkms_compose_row()
Date: Mon,  8 May 2023 19:00:29 -0300
Message-Id: <20230508220030.434118-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function vkms_compose_row() was introduced in the code without any
documentation. In order to make the function more clear, add a
kernel-doc to it.

Suggested-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index ebacb8efa055..fc09509ef949 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -111,6 +111,19 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+/**
+ * vkms_compose_row - compose a single row of a plane
+ * @stage_buffer: output line with the composed pixels
+ * @plane: state of the plane that is being composed
+ * @y: y coordinate of the row
+ *
+ * This function composes a single row of a plane. It gets the source pixels
+ * through the y coordinate (see get_packed_src_addr()) and goes linearly
+ * through the source pixel, reading the pixels and converting it to
+ * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
+ * the source pixels are not traversed linearly. The source pixels are queried
+ * on each iteration in order to traverse the pixels vertically.
+ */
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-- 
2.40.1

