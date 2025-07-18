Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227BB09B87
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04ED10E8D5;
	Fri, 18 Jul 2025 06:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TTOtZd4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30F210E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:38:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-234c5b57557so16144355ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752820705; x=1753425505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VXvmkRtZbf2b+Njy0K8dmXZ8wWln74jkiBHLW9XMXyE=;
 b=TTOtZd4pD8B3SaQS2+lhZmJCtBb4Sj1WVNZUuMiAign9mb7gp4qVjkQTBfzawhbLx2
 vNSJDE1Ict4w50ci/Iue2paPEfi201KO8NvL1xjQF8Ds9840fHZSOv/5zmcYX6rHlq+7
 rL9TWsWFIdex2nJ9MNhQzefqP7stnSlberpqB+FGJFaUJh5RpNhyslzoLIkchRQjYI7o
 CPitrYxmzeyqAcReqsWzcfDwFceF0rr1ruw9lLHI2BN/SlWyCAc13E+9sek0LCHZjbj9
 uWo2Xnl7sR3pVKLO65kBpghvxnTXpcL1IqB+FWwRCAinyjXZ+bmSV0RZkw9l6LFOHFEV
 SI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752820705; x=1753425505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXvmkRtZbf2b+Njy0K8dmXZ8wWln74jkiBHLW9XMXyE=;
 b=gBc/AZ58LN2e4/8b+fo9YQJxXd/D7WZ9Y3d1ZNmid5dd7k8bW+JtgTsgXOTiAKoPzj
 OAJhjNqDOOpaWcvxvvNlJPReiqfpG5N0zvkW9kZYjX2L/3arI8Zqaz3OqhBEV3GX1aZR
 coK2YDoiSOlitTfbetUVI896mS4YhGHRrwPaJBu/wN8SKcXFXOPvS6HuglUicYJAKYN+
 /VpQYdvnRoaxTuHystzp2oi4A6ZGBvLeOhmniW9SJd+3RbFx0bdO9k+EeVyTx0gp5LEb
 F3me9vSKByAZPrmvK/ukfdYZRBbA3IRwQbc5XWsaGcDVLZgZcoGUqrToJsRqhI2dKESv
 aHbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbgbCEgqQuJT+B6F7hEZhqoPzkyuEYXFGciReewvJ6RyLOmmGxM1nfL5x3XJ5QCTzUHTTDIH4f5jA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyttdi7oHdmayNOhs4CfkmRPkIRiG6fI4HrgZgQMpBZvnjhOnjF
 pJP1SVv6ApFcGyQ58yzcd+NMSuG/iNc+HOJO08biPRuR08KQ9KtEQ014
X-Gm-Gg: ASbGncu7ISTRX/60m77pyF8L7JG2/lVb5HMOUQHYw7dSRsT9VyQoh9gYSqUMRGQ2vUf
 jEvUftPviuxfFCI15jyJjBPImsGpIrOcYlzuxYcISeMhUJMzP6IUHzTYFabuYenxyFg+OqMhQVC
 9Cx8Uf4t1EDJxJ/bFOibVy3SKJ7yC3a12kvqjozgjZ+5+HuJCGgF8YQDELYvaNda7H8MgXnI7dZ
 FxjerwkueS/KxDx2SlqfdN7HTVtiQ7YcdIq9g62QPBxY5cEXO1eSgnwFBCGrbgfxbK/l36qHoCS
 v0cQPnOXQKNr91IRH+kFkcYyfvrccqptX3Ek6pgyz3zKNgDzgb2bSMIstZElnMSvbcFbD+j8HXw
 CQd2yHqKjTrejmcVQkBgHX0biuOS6b6sZDL3hZIkFV+iw9MfsGZKrYg6G7WZgBjYX/0w=
X-Google-Smtp-Source: AGHT+IEQjg2rhR17Fe62KMqonv9XJcQ8PgfAvORPla3hXiivMClvZtuzEB+4ymJa8aFwwnm69RTumA==
X-Received: by 2002:a17:903:22d2:b0:234:f580:a11 with SMTP id
 d9443c01a7336-23e256c951amr114024735ad.19.1752820705235; 
 Thu, 17 Jul 2025 23:38:25 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com.
 [34.125.18.212]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31cc3e4599dsm589125a91.9.2025.07.17.23.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 23:38:24 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] panthor: set owner field for driver fops
Date: Thu, 17 Jul 2025 23:38:14 -0700
Message-ID: <20250718063816.1452123-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250718063816.1452123-1-olvaffe@gmail.com>
References: <20250718063816.1452123-1-olvaffe@gmail.com>
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

It allows us to get rid of manual try_module_get / module_put.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826ee..775a66c394544 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	struct panthor_file *pfile;
 	int ret;
 
-	if (!try_module_get(THIS_MODULE))
-		return -EINVAL;
-
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
-	if (!pfile) {
-		ret = -ENOMEM;
-		goto err_put_mod;
-	}
+	if (!pfile)
+		return -ENOMEM;
 
 	pfile->ptdev = ptdev;
 	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
@@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 err_free_file:
 	kfree(pfile);
-
-err_put_mod:
-	module_put(THIS_MODULE);
 	return ret;
 }
 
@@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 	panthor_vm_pool_destroy(pfile);
 
 	kfree(pfile);
-	module_put(THIS_MODULE);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
@@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
+	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = drm_ioctl,
-- 
2.50.0.727.gbf7dc18ff4-goog

