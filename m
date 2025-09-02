Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871FB40DCC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D5B10E822;
	Tue,  2 Sep 2025 19:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKTFaFnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC6910E822
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:20:07 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-248a61a27acso1712425ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756840807; x=1757445607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lqk5Vefs2rKeCe+6cqHNXCOBv4Tg9GxL1mkV6VFNW7I=;
 b=fKTFaFnP3Ac7oIcqx2QFbqIAn3NUF/K6iCzJt1F9kueqNQhX0AyrBn59HPZ1DqJ89G
 VYMzjbK8IBfvT9l7ys65n6+LmLKQQf14yjoa9plXkabE/Pr1Kc8EACWxo3pjg0TDkVfK
 S4Gp5cdKpvIcCiJQcAMVpL73Gc+OrlUVq1iSUlLXq+fErBewf2BGnes1WCooO45Z5X01
 ozTSJlOwHYe7CNmap8TAmt7colDA3yQV6hxTZY6m8XbCOeR/JsTa0O1kFe9wfkEyV9Ie
 JlkGHCXNu/OQSYk0jfYpfhajHFK3nh6yMUxLU/MVzNZ6oc56h9yg5mtk1ZpRRJX/lu/Y
 HAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756840807; x=1757445607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lqk5Vefs2rKeCe+6cqHNXCOBv4Tg9GxL1mkV6VFNW7I=;
 b=YAwWgP+TjZLcnQRSEFPZdiQ7ZR/6z0GDw2JswKNXqiEqgfNtiyWJR3YRXRvaa+D4W5
 eJLO1cAipfJmxa0UxcdoWxKZj4zkW7ffULy3DpYDqR6e5n3zP67bHl1smkWqKVkyWErJ
 dHHDxOMBCBuC1bfp0BzVKlza9GkrcZuQoqtq9mhz4BtueVTrtWMKEOOWskEPkIPbGoV+
 VSDkcIQsQKw9r34SuXV83+Z6/qUCBOs2uLl9NVzu7StHlKL62jUnpRiE3ZJ/OXXFIJlV
 DS86jd86T9nRg2UMQclD5YtRCamEWZdlIvu53MUfjb8vi6NP2l8/1nhv5BAfpy5+cwfe
 ilbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCtZWwpHU3BI2Ph1rkaMMZZ1gLlrlkAz60gZrKwuM9kdBWBLU/G/EQluZmFTAxuBv8Rn8SdyNTu7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSKSvkJVtx01l7ajD5TRj8LeAlgJqILyHVYV6qI2/ifl5MBg4h
 iqLItTPNrItug9QOAnYddq2n9t6mrgYVcW5ChD/aQlYGfXG/GAFQcdeA
X-Gm-Gg: ASbGncst590AO3SfVo/QbqANTv7BiSvUUDLqJTADd+N+cfWEuwW0Q4mKdxq4xMAfWv+
 0tT71vy6mbLUQOO4o1ZPuiH1M3QBzru2anJzj+k8x84gwtIy8lInOGme6HQwgWQMuGxnRiAdk+1
 Y6zGU9wrXO/s9WsPbVt/huj3VpGWQI5Ebbx8jvREkuK3vR66vxn3d1cV+Js4CG8ChSTxyl3PZF9
 T0dg4pQR88SDc2jEU3C4XPKuYT3Y5kRRyeNm6lPF11MSe9bSGLbCGmHLHyqy8m5LD5XpJhvdCGI
 qLyjXoCMF82yO/ghDaZnqT4umY2+cj8UFoN69GsoLG3P0YUO+GjPISuAD3EGdz4VLOzhXYd/SoR
 5cerj4fmMFAdp8ThdzGcAKr1qhY54qZKzQODTYVSBjR0Rb5uFEnJUHmWXBageQhvkWfQMZldnWZ
 p4Aib40wUsu+Lq1LAWaweD
X-Google-Smtp-Source: AGHT+IHVRhUinMr0NXVSOtf58/Vog13sqczgF9BAwS+1PRiZbHywe42DldsFcFwUkyLLrJ/DQcf1Kg==
X-Received: by 2002:a17:902:d50c:b0:248:a642:eeeb with SMTP id
 d9443c01a7336-2493ef4dc88mr177979855ad.15.1756840806409; 
 Tue, 02 Sep 2025 12:20:06 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2490359f808sm140966515ad.0.2025.09.02.12.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 12:20:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: validate group queue count
Date: Tue,  2 Sep 2025 12:20:01 -0700
Message-ID: <20250902192001.409738-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
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

A panthor group can have at most MAX_CS_PER_CSG panthor queues.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ba5dc3e443d9c..249ab889ca91f 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3473,6 +3473,9 @@ int panthor_group_create(struct panthor_file *pfile,
 	    hweight64(group_args->tiler_core_mask) < group_args->max_tiler_cores)
 		return -EINVAL;
 
+	if (group_args->queues.count > MAX_CS_PER_CSG)
+		return -EINVAL;
+
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group)
 		return -ENOMEM;
-- 
2.51.0.338.gd7d06c2dae-goog

