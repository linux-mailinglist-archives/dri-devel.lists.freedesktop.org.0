Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECFB94FCC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F90110E3B8;
	Tue, 23 Sep 2025 08:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmaV+DFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321B510E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:27:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-26d0fbe238bso30132915ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758616055; x=1759220855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iLk2Gm01klKNt77jKtK6Mm2SM8OMH/tWBNe+GO5zpHM=;
 b=GmaV+DFq3yL7FIqf53a3fQbuZ0PeMvsVrgeK9WKSsXaQuyhsyo3WVLM4w9KJXqHoZ4
 /aMLjtj/U20G3IljkDWi8Qky4zLOPZg3Gn0LLemmppV1l3o05IPz8s3nFSPUwciPlQf4
 9Yj1o1HMYr+LLaaxuh+QtDmaT2OzDwbxfMGTiqxvEPxJxbfJKzl+UpSEbf7LFGKB+Khr
 qaO6twU7Uf3nq9g2h2/cWOVmNDO24NSz65uoLdsWCNGGPBcKW7nDu3sduPhTP4RysnNv
 3FzQ0An+ZWaDRwVdOQA1fBHCjjmc8HEegwgiT6MQjN+EvqyTCHKUclHmw7/G1EL87Lbn
 Tvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758616055; x=1759220855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLk2Gm01klKNt77jKtK6Mm2SM8OMH/tWBNe+GO5zpHM=;
 b=kBFlIwhtWIvQk7Z5Cj3PBP0qAhVBw22bEufV8HwuFcZwFjAtcXgGGcPNJiUt5Ex5WN
 Y+Revk/c0HWAqy1r8sX0v9UWBzxMyw9asjkxz/Mx4WGPJQqYzPg1uI6mj34Rzv2af7qW
 knZ5jjGZ3MjBbZUGf5J1TaT3uPBgGtIqKE+sjMOKU0O5wIolZnOHxnw0tfX6eq8G2Vb+
 KJEDxlS1cnjdbw6J7XYkH1kLsScZtkBXYvPF1FBKBT8BNX7CYr3GOElNOuzEFd8sictS
 qZx7zyTbAofZan6HKsQC+E8KFGdolTHmbV4/iYgPxML960F1o7+ITyGpZ/e34gMHqpMs
 cB3Q==
X-Gm-Message-State: AOJu0YyFr7GpqYy7ZVLmZ0sjdxNhtAFQErS8tdO45x3HJSrTEH4vpmFY
 mYjRbwzQg2Qe9uTz8KEQKnv5S4MQsZ1lyHuwZUvxJX2cD6KhNr41kppTHbN3NbE1nPo=
X-Gm-Gg: ASbGnctOQFS55I0WZby7lTGvx9NB7X1prTEpbhtJ58g28tZBpGd1NwJHse7qQlX869D
 1KhGURDlL3Zw7ueeqUzFPn94ZPQ6wL7PBhnzvMkfZK/KIILXVfaMe5CHNrut7Eadmk+s95WmilQ
 mZ/bvuaVlxfeBj7RgwEdZOX+SamFviQFkdRLYApGhhjOsMFav2x2u0YgUDlAeCoG/+yyM96tAtv
 PC4vtRHJ1SoQDRIJqAt3UCb4N5UOhH7AD3HtZzmxBpzrCL2ab7fyHlD7b1HUvKR0YQlzNLuG69Q
 KrE2xxgklnKKWUSVR9rczE34Iqg4WwodEQck4yP8bWZxSn8Wk8mIWwjrVYW/1AJnLru0cNiscGv
 LMbyO0WLvUUwnFI0K11TgrgJ4
X-Google-Smtp-Source: AGHT+IFqgNaSK4m6/xl3y8psSakN9uUd1PRmYOtI7IQXY1+NPenYDQRynp4HdAQNSiW6fE8P4JM1+w==
X-Received: by 2002:a17:902:ec8d:b0:267:a95d:7164 with SMTP id
 d9443c01a7336-27cc8d15e69mr22800945ad.60.1758616055437; 
 Tue, 23 Sep 2025 01:27:35 -0700 (PDT)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802de5dbsm154723655ad.84.2025.09.23.01.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 01:27:35 -0700 (PDT)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH v2] drm/fb: replace strcpy() with strscpy() for fb->comm
Date: Tue, 23 Sep 2025 13:57:28 +0530
Message-ID: <20250923082728.119638-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use strscpy() instead of strcpy() to copy "[fbcon]" into fb->comm.
This prevents possible buffer overflows and ensures proper NUL
termination.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
v2: Fixed typo in commit message
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 11a5b60cb9ce..0cd7c3280243 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1651,7 +1651,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	if (ret < 0)
 		return ret;
 
-	strcpy(fb_helper->fb->comm, "[fbcon]");
+	strscpy(fb_helper->fb->comm, "[fbcon]", sizeof(fb_helper->fb->comm));
 
 	info = fb_helper->info;
 
-- 
2.51.0

