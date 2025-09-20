Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC43B8C5DD
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2134289453;
	Sat, 20 Sep 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rh6ZNnjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4410E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45b9a856dc2so19254955e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361576; x=1758966376; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EF+gSsJWISD2P8ooQs9pGaRj/4NF9wqu5vW0k9j9UCk=;
 b=Rh6ZNnjAvPrft/r0VFoyOu6nNV78UdBEGNV1bcLtfpUD2a5UdZeu2Qk2hSvYGK860M
 mAF0cpFExcuCPE/JhV8SZ2EZXYMa3Y34uodAebdThhIqI+oxz38+Mny5edqTbtCMMhZ0
 VHBBAHqdNV8kO9qyk9QMpleerAtJigvISwiJRjkOPRlSCDsjVZxfiyZfHRurPPhXETZB
 Ck89gQP7JGbfNs93Ng1EThtiww54rEyoaGXhkMQjSKPrn04x/jRFhhat93XXDHn/XwhZ
 bRAG95TW/tIK79LrqdfCZk8Jnjr4hcVZOOGH2ah6BbM3z6bxrK439wclyBwLFmgKqZpy
 h+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361576; x=1758966376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EF+gSsJWISD2P8ooQs9pGaRj/4NF9wqu5vW0k9j9UCk=;
 b=q/g/N/jQQ46ZQmWcpPoSY3nhxqJYUM2vLoCjm8N4Rm/6CHn6nAlRdrdTQ+/N9dRW49
 AjwBT+MwpWr2ePjGBCQUW8umkL9alL3edef+mVBVwPApNlaD/WWeDdpXiqSl7S43mI1/
 uME5ANdXbLYOGt8hRcBixXUdDpO/QEFpLsecrR+fKsfMS3aMvSZNZsRSYKgakFBlkUuN
 Kx6iTphLG165njVyW9bEY0dMYX7d+TPXZntFl9uR2nIc8h9sFhxkN2LYYvEPu91M9tkf
 +CZr4fME5BEqR2OwXCWgQOELEKJwI5owZk9X87uZJ2RZcOVudE2pbIb3ta4ZINWMI9IZ
 OJHw==
X-Gm-Message-State: AOJu0Yxi1QcB+z/BGJ8vR63ibbx9kmWdVieXxdsm+obbI3sm9LNv6d0o
 BBs6iaf5DKdkdMKUmdRExYxq67vS7C0YkAXfPCb3eJwfJ2EaShXLPziP
X-Gm-Gg: ASbGncvE5v6ywkNOvFO96THP/s7RESK5fx8IU3kjauT1m2M6RyxOcwMpfqyhvmz62c2
 HqegGNlqCREqmZHVwl0TtQnD0fb38OvvY8oX5Sh8F6DTqLxBYvx5amZ7F+7TI8SOCtRCsCMgQf6
 utizn0MNBHApVGFvUJukNPOfmsteCVxHk6YXlny3p83XyjvOfGUZY9CGlaxz2EDgVE3XZzS9UWN
 p7iY8Zn1J5RKhBmnEG6rg4TCmWFyS3dE+oLciFaPoyyjMGFfZQ84ZqCfixiI2EzngzTtELLVocT
 Plppy24LBhc9fsMNZC4/4uJ1hMVgxh+4I5py+4L/rMETgTcpxWSjBnuWy4uQmICgLfUn0GEeNsU
 wFyyvEjBqenmD0qVKGQLdu9mpaDaMB3+K4/lQApE+ZxRRUBcxxeES3Am0VUVjKsCK
X-Google-Smtp-Source: AGHT+IFHvcyMmLMyYmMr2Bg5+hEdpv00oyYEqCLBaf7aaHMkS1cxofawkp9K/qG+XWC9dmcPTHSP4w==
X-Received: by 2002:a05:600c:3b0e:b0:450:cabd:b4a9 with SMTP id
 5b1f17b1804b1-467eb231110mr54511735e9.29.1758361575846; 
 Sat, 20 Sep 2025 02:46:15 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Sat, 20 Sep 2025 11:45:42 +0200
Subject: [PATCH v2 2/5] drm/solomon: Use drm_WARN_ON_ONCE instead of
 WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-improve-ssd130x-v2-2-77721e87ae08@gmail.com>
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

To prevent log spam, convert all instances to the DRM-specific
drm_WARN_ON_ONCE() macro. This ensures that a warning is emitted only
the first time the condition is met for a given device instance, which
is the desired behavior within the graphics subsystem.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d98015d6d28505d028ee958831e3cefdb8a9c397..5b0d5bbc7f9fabd8430226e88cdee9e22ac7ad96 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1393,7 +1393,7 @@ static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 {
 	struct ssd130x_plane_state *ssd130x_state;
 
-	WARN_ON(plane->state);
+	drm_WARN_ON_ONCE(plane->dev, plane->state);
 
 	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
 	if (!ssd130x_state)
@@ -1408,7 +1408,7 @@ static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_
 	struct ssd130x_plane_state *old_ssd130x_state;
 	struct ssd130x_plane_state *ssd130x_state;
 
-	if (WARN_ON(!plane->state))
+	if (drm_WARN_ON_ONCE(plane->dev, !plane->state))
 		return NULL;
 
 	old_ssd130x_state = to_ssd130x_plane_state(plane->state);
@@ -1558,7 +1558,7 @@ static void ssd130x_crtc_reset(struct drm_crtc *crtc)
 {
 	struct ssd130x_crtc_state *ssd130x_state;
 
-	WARN_ON(crtc->state);
+	drm_WARN_ON_ONCE(crtc->dev, crtc->state);
 
 	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
 	if (!ssd130x_state)
@@ -1572,7 +1572,7 @@ static struct drm_crtc_state *ssd130x_crtc_duplicate_state(struct drm_crtc *crtc
 	struct ssd130x_crtc_state *old_ssd130x_state;
 	struct ssd130x_crtc_state *ssd130x_state;
 
-	if (WARN_ON(!crtc->state))
+	if (drm_WARN_ON_ONCE(crtc->dev, !crtc->state))
 		return NULL;
 
 	old_ssd130x_state = to_ssd130x_crtc_state(crtc->state);

-- 
2.51.0

