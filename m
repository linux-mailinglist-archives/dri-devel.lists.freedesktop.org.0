Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E99B9443
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 16:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432310E083;
	Fri,  1 Nov 2024 15:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JTRiWlww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D9010E083
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 15:21:11 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id
 e9e14a558f8ab-3a39620ff54so7273365ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730474471; x=1731079271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ngedgEzPtFUspqedLiAiTsBOM7mquusH+8XohKPtoA4=;
 b=JTRiWlwwE8x1ILh6S/9lY+gdrlX9rk6tKi6NkDEkjlyMyoBuJhT7EdTCPTI5VNtEnx
 ETlv4PA6VzTB0qZG58U4cB7jNCb9gbCIBOz+Vpt5ZkyN2nAmL8dk8zCM5my3BHe3YGJO
 J3rQXc+MybB81S1UbhpJMyUoPxUlLHQzR9avh+SRNYnvcIM5/hEKEB6qThsUCwEE/6sc
 jDP4O4laUfY9fQ8hcsfkPvj3LCHp4YCu2LfGMxYw60Fvm0usQAPjj/bvEywo/CxnumJo
 2xAarhlxhWi8biL23dDmgISaC3Wh8o/qgjUJ+QTRYE4wGtt7gYll5ttl0AySIQJ6SMQk
 rJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730474471; x=1731079271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngedgEzPtFUspqedLiAiTsBOM7mquusH+8XohKPtoA4=;
 b=IUEigcnS6JT8u/qr50MtFGxod9HkKDuqL5vdaPfGqUjxoY3Ck5tUwl02EUu6iy1tqn
 pXtH4ApbPfElaQ8/oy+YDq7Ia9MSNZZy/+7ShSOIeR5JL6v8AqjPu86zcCA8nrINQpfK
 7imw6YM5pmPD1Vbkf+2X8xcGexxMpQk+C+Fm5gTjC1RSnwYMGsiwUTHGR4m01wNmxQtu
 5xQPowAWjj3xW+x+ttouEZrD3BdFiuZ070eyPSLTnO9gqe3STE5NZy0m5/fk3GK2DXi5
 pe5NvB7wQxG5P0oNDtb6rdmil48Ugdgha0b9ZfjePIOWc5zsc3r25GkjrN8+ChxIvaOR
 KYDw==
X-Gm-Message-State: AOJu0YyGCrdDq883YArSc+vyFpvBAF879vfcTMSVAVOUou4PhVa2SMWj
 nE668zDR0bqjOcaPRAPPdifrV64hcWLg8uU2rFfAoUBP3bUyu8+s
X-Google-Smtp-Source: AGHT+IF2U9BgKTbgcIgkIdNNc5MCBypK+I6PPlj1q0iCr1DVpME5Hw3ZQRMs2YqWQEHPBENfAh26jQ==
X-Received: by 2002:a05:6e02:16cb:b0:3a6:b0d0:ee2d with SMTP id
 e9e14a558f8ab-3a6b0d0f518mr32706795ab.9.1730474471110; 
 Fri, 01 Nov 2024 08:21:11 -0700 (PDT)
Received: from localhost.localdomain
 (host-36-23.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.23])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a99cc4c9sm8890215ab.46.2024.11.01.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 08:21:10 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: mripard@kernel.org, dave.stevenson@raspberrypi.com,
 kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mwen@igalia.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/vc4: cast calculation to __u64 in vc4_dumb_fixup_args()
Date: Fri,  1 Nov 2024 10:20:46 -0500
Message-Id: <20241101152045.8469-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply args->pitch and
args->height may lead to integer overflow. Add a cast to avoid it.

Fixes: 3d7637423be8 ("drm/vc4: bo: Split out Dumb buffers fixup")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..ac02afc3acc5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -69,8 +69,8 @@ int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
 	if (args->pitch < min_pitch)
 		args->pitch = min_pitch;
 
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	if (args->size < (__u64)args->pitch * args->height)
+		args->size = (__u64)args->pitch * args->height;
 
 	return 0;
 }
-- 
2.25.1

