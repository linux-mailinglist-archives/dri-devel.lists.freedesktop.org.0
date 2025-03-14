Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1DA60B09
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3A710E988;
	Fri, 14 Mar 2025 08:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMv97j/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7210E233
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 01:20:35 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6e8fa2d467fso2416686d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741915234; x=1742520034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
 b=FMv97j/bs3q48BS6pRFCB/JJOwhmFl1gqCh8RJ8vKG14p3PYuxGquTrnXc2Isws9Rr
 Em1BQ5IOT8IeqWiKBBRcUj6z2HT1wRGST/3it03hMiI/Ak98Fa/vp5PypHozF/xvt7Ky
 D92Urt1m4uCA474+8kAEM4A+HGu1obGPxRrWjDLsoIPAtswwALU+KIvgh4HX5w0Zb92f
 X715lYT+c8kmtzYCS2bv5cSPbL4TvC+/9mH/8RDQ4Oc3OFf8CHre5sJi4TU9JOWv97vq
 ClK7gilAqD3H3ks2S2cKu+/e926fGjqXlrVLXwEb5BTIR2N4+g8J+2mmQQAkTIacVt/+
 O2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741915234; x=1742520034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6RyOfs+Y+zXnQN7nD15L11CcONhA3EYNbvNV/ylslsk=;
 b=E21REaPiXDbO5mJenExqU7fJRATAZ8fXoV/CfrED2F+kxfjf7klEyP5nnlx1hbU3Zs
 MVE7ZGmqxgQlezvV869zlkuE9+jJtFMfuoRGLNJQb0lupvtjoau4bH0PFmQ/JJ7UG1NP
 oXt/koVyE+WYyZeFpczd+XAsIVI6y69anMxBM9AB1X53conjyChrUD0Ol3hZuFc98lN0
 X/1UOd7M88VgbgDYiqq83wpw0gmKpquzc62Nue2FPKPmjgWS58VsPVhWmFFDdRbzhCCX
 HgEWwqp+1berpZN/hoId1LiHFNgfCfsCDYT/9Z6BErK4mJftcubUur269oXUkj40+c+7
 3oKQ==
X-Gm-Message-State: AOJu0YyWKXQDyAsQ0/eayqk2lvjIba1ZTnCWoprorPj7JwToSMnE3EOZ
 Aqr9dQp5XAj549alfZDAdNG+NdF5kjzWPcDEFh8NWf0T8Bz7m/c=
X-Gm-Gg: ASbGncsrMFQ0PI18BJmeDU8fHwCWdyX1P112yA99QvSzuSrthXIqvWCzenxR7lxHOa/
 EAAd1o87XTlr+lQUIb/4kVzZktcnuCXQl+FvEN4cjYKKgXPuK+BlpmlhH71wZAKzdWtC5pq7Iz7
 UvjbX9RzOUo1Nkqwmp98YlDl/Hn8vgwmn0YGlZNB/FDWhGQno1S7h3ppguSkkYwZjQTcDQrXx2u
 7/fcPhOwp4Sn8rnX93b0zirnl5IoQdgblFz9kF9bKZsQejDXr92zZwEpxvx7y/7BoCL8+9EWE5n
 sRrhYKOAX1HDkYw/kgKsLvDuUITXYZ7+12QRN90HTg==
X-Google-Smtp-Source: AGHT+IGfhPTAxaf8B75RLgjVfZQ9MQSuBX9YLluLR5rXcZosHQPraRrM7+8ySbbt1uADkGdyWm5Dew==
X-Received: by 2002:a05:620a:440a:b0:7c0:a898:92fd with SMTP id
 af79cd13be357-7c57c930378mr23367385a.13.1741915233700; 
 Thu, 13 Mar 2025 18:20:33 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c719f8sm171847485a.36.2025.03.13.18.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 18:20:32 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: mripard@kernel.org, wens@csie.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Date: Thu, 13 Mar 2025 20:20:29 -0500
Message-Id: <20250314012029.668306-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
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

The function sun4i_backend_atomic_check was dereferencing pointers
returned by drm_atomic_get_plane_state without checking for errors. This
could lead to undefined behavior if the function returns an error pointer.

This commit adds checks using IS_ERR to ensure that plane_state is
valid before dereferencing them.

Similar to commit da29abe71e16
("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").

Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..a8e0e2123764 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.34.1

