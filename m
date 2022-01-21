Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25836496769
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7610E49A;
	Fri, 21 Jan 2022 21:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FC10E497
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:23 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id c36so19219731uae.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6oRMdQdTTLRMg12EM+5r4h4w3Qz4g9vnYiSKn8PWiM=;
 b=khNbmuoHPhpMH/YN697MTKYbQfK7W25ceRWcwJUJf5KU86wxlg75WcYnnuR8nVZQZ2
 m96wHyoyAM785LmOjzwiKEiqTzVPV6xHmZ1hS8EdTjz17VMQohQSW507yHiawbH0CDPq
 1tz9+/H9Jq45wk43c+H8KKdBB/aZog4QnlGeBkETa3peUoCDl8Y1C7l2M+1JoIfeli2M
 FumRUz/6xnGGB+JQQ0p3gXLvWXyom7AUHO8WlzcBe0v7bhJlNjWPX172xwuAKaJ+UilC
 OTj5PDKYP5/FwndGQ/gX7wSICZ757p2FyM7yJGJ7Gtsd/OCN73epDNBZzDT/ag8HZdAs
 IP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6oRMdQdTTLRMg12EM+5r4h4w3Qz4g9vnYiSKn8PWiM=;
 b=UrsV9Hh6SRdQEVa8jhM41HLwfO1vVuIf57BIh2pSrT8deHHckb5Qx1eYMUkl+z5GwL
 d3ENTSgpRdasXCHVSLl+ajB28mDmI2UEDGNQZkkOyZP24FVH9kdMfW8f+CiQ5+LZCM14
 Tl+BHkNH9iYYiEcq9KLatzSzZlpYN9Wnwvg53J+KO3UsFY00OQGX5qtgSDBgdl4x5gjP
 EpKB0Ym6d5cLztOympLWpF/nVibM5mtya/KurY6EgdW/wMMYEIfa2PS9ocwe2I/XNBEG
 8MNYkAG5gzCkpUJqHeYsmCh0jdi6XVJt7sWZjgkmOnr0YPxyd57ZCLumLcKis2ICZnYu
 Svxg==
X-Gm-Message-State: AOAM531PKfZmm/ufFysgHho4lDZ7FVXu+ijD7Szhp8UE9QxQvYHPlm9N
 ZOzzy+WZmvAKWPUa7W/a6o0=
X-Google-Smtp-Source: ABdhPJzrTVkDJ+4J5eQXsWaiUUjUtJKMbQy5V6vWVWYeYagHqlCpmq71tS8X4TyA/wzyonHYXnCiow==
X-Received: by 2002:a67:f251:: with SMTP id y17mr387349vsm.62.1642801162878;
 Fri, 21 Jan 2022 13:39:22 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:22 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 8/9] drm: vkms: Adds XRGB_16161616 and ARGB_1616161616
 formats
Date: Fri, 21 Jan 2022 18:38:30 -0300
Message-Id: <20220121213831.47229-9-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will be useful to write tests that depends on these formats.

ARGB and XRGB follows the a similar implementation of the former formats.
Just adjusting for 16 bits per channel.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V3: Adapt the handlers to the new format introduced in patch 7 V3.
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 67 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   | 12 +++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 0d1838d1b835..661da39d1276 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,10 @@ format_transform_func get_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
 		return &ARGB8888_to_ARGB16161616;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &get_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &XRGB16161616_to_ARGB16161616;
 	else
 		return &XRGB8888_to_ARGB16161616;
 }
@@ -15,6 +19,10 @@ format_transform_func get_wb_fmt_transform_function(u32 format)
 {
 	if (format == DRM_FORMAT_ARGB8888)
 		return &convert_to_ARGB8888;
+	else if (format == DRM_FORMAT_ARGB16161616)
+		return &convert_to_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &convert_to_XRGB16161616;
 	else
 		return &convert_to_XRGB8888;
 }
@@ -89,6 +97,35 @@ void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 	}
 }
 
+void get_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+		      struct line_buffer *stage_buffer)
+{
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		stage_buffer[x].a = src_pixels[3];
+		stage_buffer[x].r = src_pixels[2];
+		stage_buffer[x].g = src_pixels[1];
+		stage_buffer[x].b = src_pixels[0];
+	}
+}
+
+void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+				  struct line_buffer *stage_buffer)
+{
+	u16 *src_pixels = get_packed_src_addr(frame_info, y);
+	int x, x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, src_pixels += 4) {
+		stage_buffer[x].a = (u16)0xffff;
+		stage_buffer[x].r = src_pixels[2];
+		stage_buffer[x].g = src_pixels[1];
+		stage_buffer[x].b = src_pixels[0];
+	}
+}
+
+
 /*
  * The following  functions take an line of ARGB16161616 pixels from the
  * src_buffer, convert them to a specific format, and store them in the
@@ -136,3 +173,33 @@ void convert_to_XRGB8888(struct vkms_frame_info *frame_info,
 		dst_pixels[0] = DIV_ROUND_UP(src_buffer[x].b, 257);
 	}
 }
+
+void convert_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = src_buffer[x].a;
+		dst_pixels[2] = src_buffer[x].r;
+		dst_pixels[1] = src_buffer[x].g;
+		dst_pixels[0] = src_buffer[x].b;
+	}
+}
+
+void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer)
+{
+	int x, x_dst = frame_info->dst.x1;
+	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	int x_limit = drm_rect_width(&frame_info->dst);
+
+	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
+		dst_pixels[3] = src_buffer[x].a;
+		dst_pixels[2] = src_buffer[x].r;
+		dst_pixels[1] = src_buffer[x].g;
+		dst_pixels[0] = src_buffer[x].b;
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 817e8b2124ae..22358f3a33ab 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -15,12 +15,24 @@ void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
 			      struct line_buffer *stage_buffer);
 
+void get_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+		      struct line_buffer *stage_buffer);
+
+void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+				  struct line_buffer *stage_buffer);
+
 void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
 			 struct line_buffer *src_buffer);
 
 void convert_to_XRGB8888(struct vkms_frame_info *frame_info, int y,
 			 struct line_buffer *src_buffer);
 
+void convert_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer);
+
+void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
+			     struct line_buffer *src_buffer);
+
 typedef void (*format_transform_func)(struct vkms_frame_info *frame_info, int y,
 				      struct line_buffer *buffer);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 28752af0118c..1d70c9e8f109 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,11 +13,14 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616
 };
 
 static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static struct drm_plane_state *
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index ad4bb1fb37ca..393d3fc7966f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -14,6 +14,8 @@
 
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

