Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A0B8C5E9
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E7510E2B9;
	Sat, 20 Sep 2025 10:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BVB2IimR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5110E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45f29e5e89bso32393555e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361575; x=1758966375; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RXym3wsq/PuCHeEIYBZQWPcAIhSSAARk/vWWcaHNabQ=;
 b=BVB2IimR3lS/PbTF+WKCpqnTSkCuIkw2clOLo53xNtF2Fe8NOH99Y5CiyUNWziR4nv
 77Trk4swQW1JF5gzN9htVtR6jcPzl4Iu4Im20uITjhXcSD78PffiXu1pTkF7U4OvKjPT
 q7X8vFUrbvKngeztoSaSzPVxmOjjWM7TXSIJL50vxff6hULy545UY7L0TIy71MATix4H
 740mkXcSh9KCyQiBKS4XIRJn5XbQ3+3ynPqP9EFj55wE9JlxE1TBbPPPyzVXdLrA4Se2
 ngcZ86Pl+IykWgVC55GVREiMmArv4WpWO5qJpog1/gnk/mVF+sGEkmj1bhEsF4nShyIe
 9+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361575; x=1758966375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXym3wsq/PuCHeEIYBZQWPcAIhSSAARk/vWWcaHNabQ=;
 b=de/J382Qzyz088xib3xc7eh5H33o5Tige5zSKvIBMLUfBahStTP10VvBqT5MhwEVD7
 aQBQuF//zwxdu+eZTcCennrROBGgnq8i9SGCjcThgug4h50MgmIVqtAtWpOks6a7Yrui
 dEH4PuUoiUy8WOArwRQGzQdHkilEzBzf52JXSavXfcpR6FxSNqeCQHjyI5Krbc5cqegY
 eXJDVrJeUx43MgFyd33EPZtP9w+yUzsQcL7VCnGykio6OAk6izn4BiJmeZAURAa8HrSv
 AN1koNzAqCq2b9Pgg4fmCouHvezh9rWquldocteE2CWHM8Sf3dh4UqwhJawCGapj7gsE
 Fd4g==
X-Gm-Message-State: AOJu0YyD56UZOz10e/yzj0rCH6BY9UqsUPzJAD0kuHk1E+ODheRxtV9l
 cMy8j8/3aW5tX2h1s1V3jjhElFfGXJBWvkJ1KwdemUOQWuZ+Pdq4C7j6
X-Gm-Gg: ASbGncuwlLXmkT7vU2VlIQ2a0Li+fPUjeXp1NExRmaM54GzmjzYZCUGJqe+amwJAdjk
 B9B+UQfcAK+TmKCkJuPAXLgcBOoFUPTFUrHYbIXcj5grd52/Re9rwe35kyFnPspMmVC4QJ/YjEw
 CVVb1Nvb6HKK4axFQ+qARGSxTKzVTaUrLlTk6EYhomYRn9QdKArhRncIkemIWc5O4K1yeBZi74l
 jPFUQM9XoIvPlFOOwBT8Jn5jwY289dfw3N1X3iWFrxdh8o2UijOjMsnZH7Ifmm+tSeq9Yyamkb8
 ynmjMNqa761njxydOzAKK9x6qO0YWHBHEXZw22eJFiIT0FhfkgI5cx5F8GE6x/o3TJKyjoJ4f2f
 G9Crtu5POP/pae8J2FkdF6TkIGxq3Rg2HcV15zkMLGygpAKwr2UAKSYqVeUCmVZeL+bBxMpziW4
 0=
X-Google-Smtp-Source: AGHT+IGJerg5bFIZpABIm0fuQUyqCHNKx7qMOFOYTZTKzKq9jBqbHCxsWXt3vY5pR3US6GOBn/QQ8w==
X-Received: by 2002:a05:600c:6305:b0:458:bc3f:6a77 with SMTP id
 5b1f17b1804b1-467e6b64cc2mr54816235e9.2.1758361574893; 
 Sat, 20 Sep 2025 02:46:14 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:14 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Sat, 20 Sep 2025 11:45:41 +0200
Subject: [PATCH v2 1/5] drm/solomon: Move calls to drm_gem_fb_end_cpu*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-improve-ssd130x-v2-1-77721e87ae08@gmail.com>
References: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
In-Reply-To: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

Calls to drm_gem_fb_end_cpu*() should be between the calls to
drm_dev*(), and not hidden inside some other function. This way the
critical section code is visible at a glance, keeping it short and
improving maintainability.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index dd2006d51c7a2fc8501904565da806aa47333ad6..d98015d6d28505d028ee958831e3cefdb8a9c397 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1016,15 +1016,9 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 
 	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
-
 	iosys_map_set_vaddr(&dst, buf);
 	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-
 	ssd130x_update_rect(ssd130x, rect, buf, data_array);
 
 	return ret;
@@ -1048,15 +1042,9 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 
 	dst_pitch = drm_rect_width(rect);
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
-
 	iosys_map_set_vaddr(&dst, buf);
 	drm_fb_xrgb8888_to_gray8(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-
 	ssd132x_update_rect(ssd130x, rect, buf, data_array);
 
 	return ret;
@@ -1078,15 +1066,9 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
-
 	iosys_map_set_vaddr(&dst, data_array);
 	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-
 	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
 
 	return ret;
@@ -1232,6 +1214,9 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		goto out_drm_dev_exit;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1245,6 +1230,9 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+out_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 
@@ -1267,6 +1255,9 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		goto out_drm_dev_exit;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1280,6 +1271,9 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+out_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 
@@ -1301,6 +1295,9 @@ static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		goto out_drm_dev_exit;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1313,6 +1310,9 @@ static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+out_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 

-- 
2.51.0

