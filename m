Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F3B5608A
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677B410E11E;
	Sat, 13 Sep 2025 11:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iBEE/Lhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DFD10E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45dec1ae562so19948825e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695362; x=1758300162; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SoeciE1g87M9Qxg6df56vLYD1QTe3IoOL1+JcFYtWuk=;
 b=iBEE/LhzurSQ6Ecap51apEm19XLIVf7sG1h1PqDZQ18/NYkzoLHh/sdQNU6NXCnysv
 569GawrefaCxloE8+GInVturdU27WsWUVd982LFGa6YyEhbsULnqjopcbpTZrKUkQjWM
 heknbvT6UZYJ+T/Amqk1tF6IueG1Ix1F9U3Hxlw7/yjF3JnY0aYniPt3sUbK7uhvWYg/
 FeRgRv4tR6biTQjOlHbCrf6dhdmkAWp2O9MKzXW08dU/hnoAVdKCisW85YN0F61/6w5g
 zvQftWQpyoLqcnk7uE5lPn0qbHkjL/lglSzh5hZtznclx1we8O9toDbwDEQruGMtch7Y
 7rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695362; x=1758300162;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoeciE1g87M9Qxg6df56vLYD1QTe3IoOL1+JcFYtWuk=;
 b=RF6tA/HlO7Qw9pz9EQZFt886s8z/q8EVNTXHGWJPI0RM+JbAabyrebqDZb2F2R4t/f
 Y3hn99orL6DegUfUZLV0xFTDhR4zAzL7iyrCJSA4HQ/kEFNX0YCrTeGKIf4r63zfatqY
 Qp9efswet128uC+VzWO8kqvbTt/SYotUzxqyHvgJ5Fzker10cGJEvi8vkMNIMmY6omYR
 0fDe6LEmmDwqljdqc9Imlu/CJfe6e9K3MqQTwV1993ZvgGWoZq3YBEGkxQTM/VN/Due6
 Qlpkza4S9VwxhOYTkSDJNYyjNEzXDEN2fYlCQwv2Rhc9SBw3EBB43rTxKpA7WXjYyxGC
 ZbnA==
X-Gm-Message-State: AOJu0YxTUMVgBI752I2IFd4ktDO1DrRlttYF11u8RbsXQLpmrzKCxgcg
 ZmzHItGfiK/AM0NNwB3K1la57iQ8bvOMDbAEPYJoGJkeWohpbIEGj7qC
X-Gm-Gg: ASbGncsi4uaaBBL95W1al1vCIq44JJrouQkAXOE3mSg+xrj5IChReHLocd2jygLGleX
 4yT57mJulY6iN0/X/Ws4gAj31C1eWfrB3yJQUEgnlUdWDJjyM16YOo5cBqqg2Le/VE6Lk7MavUW
 twpLsiY8Y4JtjeRDGL7ecLgmpAxwO+jGK1Ao0c3N3n4v/9ACyj7gR6nVSadeWb6syYc+iIR9d1g
 ymw35Kd9n6nJ2OqiRUWlc66YITBKgIYOWNJe3WhTBeqmH4cUjCpiGfF+NxcnjntBIkoIMBFIUB4
 CRCMkc5pWUkzCcU9acFj36GiqU+Kmmlyr2n2X2qhrApTP2gT4rXCzDAn5K130mdIC7oZoQ6Ejh/
 J63rNV1akMWtO80TFT1SK5DnjVfecAx899x7u40HZs2bj/P9GI+8FiBdnt+YUE6g4wdHS+R0ENr
 0=
X-Google-Smtp-Source: AGHT+IHuJSFr0dqtOsT5NPWoHGSkNkCmgSeBnBH2v+uNiFiipuyD5CsBrYBuPM84MejkBy847xlygg==
X-Received: by 2002:a05:600c:55c6:b0:45d:e0d8:a0aa with SMTP id
 5b1f17b1804b1-45f211fa411mr30126825e9.17.1757695362172; 
 Fri, 12 Sep 2025 09:42:42 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:41 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 18:42:09 +0200
Subject: [PATCH 1/5] drm/solomon: Move calls to drm_gem_fb_end_cpu*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-improve-ssd130x-v1-1-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
In-Reply-To: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index dd2006d51c7a2fc8501904565da806aa47333ad6..297593c7fd20a5a5da81f1e1fcfda9092b19cf90 100644
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
+		return;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1245,6 +1230,8 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	drm_dev_exit(idx);
 }
 
@@ -1267,6 +1254,9 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		return;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1280,6 +1270,8 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	drm_dev_exit(idx);
 }
 
@@ -1301,6 +1293,9 @@ static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		return;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		dst_clip = plane_state->dst;
@@ -1313,6 +1308,8 @@ static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
 				     &shadow_plane_state->fmtcnv_state);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	drm_dev_exit(idx);
 }
 

-- 
2.51.0

