Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF0B41899
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236210E4E4;
	Wed,  3 Sep 2025 08:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EAPXFrLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9742210E4E4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:31:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45b8b8d45b3so28625385e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756888313; x=1757493113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LzE0Ws9fzpBnIfHQ6kswJP+ItsxGcArI8FqcHSIsRxs=;
 b=EAPXFrLY2KWGmeOmJdWz12Kax1E0+mW/DBl80I2sfGiMEhQ1nZfVsaT6hxCSIkhFei
 j5A/vm+zYvV+YWDL51nfpFInWg4v6x2sDBVaenR8l6RP5QEg40onFeGZ+PKJpJKmaR38
 T7UmZixwPgDTA4wUVO/TUJjk4/qHn4Cx29q+CdZQcH6xCWwDYtb9pPX/EF6Aj3PJjD1u
 iYgUb0jIf/lNCYV2nyGJ95Vtkcd7prCAZ4ohRUdd0myttfrKhqPrs+SJ954x1EaC1pOk
 C6BXvXJALDxSn0ml5BXAFK3a8nAlr/OgLCyuohFwOdrMkYIXTuyLNhXo1SoJxvDP4u4p
 bp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756888313; x=1757493113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LzE0Ws9fzpBnIfHQ6kswJP+ItsxGcArI8FqcHSIsRxs=;
 b=Bn2n3LiKq9RnG2nr2WP0ENUlikyZ9mJGaNNftEfIM/zd/wCFJDroNpL/abtUUKCzd2
 u1Rwr3ztT6zkSKa2ZBBgFnO9Nte9pUDVejD1H+w1+Iw40gloEY4qd50KEvY4UrZop/YY
 qyMxWQNAu9dKqoe+0AtTalwiwp1VTH2OvfhPzdsWhRZ2FLwoyYJJr3TpOI8uUrnSz7TY
 CFWwxMm7Cf6c7u9aAkWEpRdkt5iAfHR7wXhniVQU1/Acj+5fj95zsWWZGmJABlGR9rPW
 PDspcGITUPtDKcr7qJcIlT5Qsu5Sj1o1XX5jMkkqin186LN2cT7GqNCqwVgd+JuuqwEL
 qaUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8FrfUUrGzAFJa0qn3pUJuTi6yAsr9PNaK1fJvSQrzJBr8I4QGCPGzyFGa7Z76UnXwP96FoYqi+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4bp2yCdAu2ofB94jsEi0KW8kcz3u6cFZ4qfnVeq2+JFtxInZL
 18+dUYz4Ee3/6abSHqf71H/T6T3n3HiMgGTD3e+p5N7y7gq5AsIdKumD
X-Gm-Gg: ASbGnct8oYCbRHLVdNiUB4a7R30I0pTV/7cQEV32DeT91KYQx4shhaSNnhKdJs5eaCX
 8m122uFeI9Qb8SjgW1cLc0BW8mXBt6p5UjTu5242d7+f8T12Z1K1xH8RfhRJbdR8Jh5JJGP0kic
 dzeYEiFocre//q463oajk/h0oMNX/N3tM6gIWgAfSqPQuny9rAg6E8iDVhHWZlf+wZrVEQL12T7
 wgPlv4Jlcc1+3zlsrfqTEvMx59rYhS01QJh200gwAPE4iS/5c9HIdLadKdPGiKHNj0ZHpeKiKCT
 jY88HZsG5WK8dC8esl299MxQ56NRg2JfUaIUTa0cWxosbvdG/kFM1x2109p4Mh0tNmdzKYVEh6h
 oEhIX7xNuqo4/g8imyaqf
X-Google-Smtp-Source: AGHT+IGrZQIc2jiaG8pdcXw+gYZl+BbgX2ehStHEyKgFTJ1z7nC82zfpt9nkS8Xtp2AjuW9GcqmnZA==
X-Received: by 2002:a05:600c:3143:b0:456:1c4a:82b2 with SMTP id
 5b1f17b1804b1-45b8555d6fbmr129315705e9.10.1756888312950; 
 Wed, 03 Sep 2025 01:31:52 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b940bbc0dsm74727175e9.2.2025.09.03.01.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 01:31:52 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/sysfb: Remove double assignment to pointer
 crtc_state
Date: Wed,  3 Sep 2025 09:31:06 +0100
Message-ID: <20250903083106.2703580-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The declaration of pointer crtc_state includes an assignment to
crtc_state. The double assignment of crtc_state is redundant and
can be removed.

Fixes: 061963cd9e5b ("drm/sysfb: Blit to CRTC destination format")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 963c380fea64..ddb4a7523ee6 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -238,8 +238,7 @@ void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane, struct drm_at
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	unsigned int dst_pitch = sysfb->fb_pitch;
-	struct drm_crtc_state *crtc_state = crtc_state =
-		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
 	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
 	struct drm_atomic_helper_damage_iter iter;
-- 
2.51.0

