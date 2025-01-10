Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F1A09AB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 19:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F75610F164;
	Fri, 10 Jan 2025 18:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SqnYbp3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E69110F164
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 18:54:45 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so4116982a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736535224; x=1737140024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0k52LdHaLp0jwK9b4ZLQLto0R//7yf7AwoRXyWp61BA=;
 b=SqnYbp3eVHVzDMo+usp8mZQ5hSI11HaNuMSEtBtnN56LXTolDK94Z/PM4ak2nyw5Og
 UpKdxyrPl35iVVPOpoPPfIeKs37jUs9QjNOMDFFqdNGPmh1RrhTMGjbhbHZlOR3PGJM3
 4IawFEzsiI/VvyFJVYi50xd799LriyguNsesA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736535224; x=1737140024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0k52LdHaLp0jwK9b4ZLQLto0R//7yf7AwoRXyWp61BA=;
 b=VQAP5T/9c94DSW13FbJ1+b+ZKvy0kOChPu8oPrtokGWA9SCYLD8JoYiv2uvqPa81r0
 8P6fgTp4uV5H8tj/XhP5E3fqyGXFVeJqA9t1khGvXgeeTPE31bzsagyX9KTONYHd6w2u
 MFirHMBS6LNVI/L95gG8eQdvk9FS7WLJCfg1X2hOsGSBHV95I9XHbaIy9kSXf/AX96pV
 aSAyE2DtynUTxy0xRlk/K9PSkdLwp4Q9uh3P27pOyRPRv60FUraSrWC/zknAoLuqg220
 onwzUOaufg/vhBKcShlmm+01w0tUyZ65EYALku7segUoU2vVrSS5PjVgKALIvK1wYIfz
 /wZQ==
X-Gm-Message-State: AOJu0YzGNeOORHhEI7g3zy7y9EiIkSz9Pw+xxRpiME7RXsf7LLJ9TUf9
 I9bQLTXmtOsgpqVodm+9U73G6KQKWwp0H7J+AoJDPCnn7MjcPh6QanIP1K5lout/eX4a+fTm7nk
 z6J2Xr+59x8sv0GIax+tGBMRFijRBB73gLv1yvECn52T6wGCc6lxtsLNJxoRw+7M50VqFiJrdDM
 J2y9wXPQRnIvhHB98zeppQPvt1631fTUUpD4lmwCnvfywafHczIg==
X-Gm-Gg: ASbGncuHyy4YDko1vcNj6UoWEto5PNhj2NCh24R70OTs5lBxMtMItr/J3v486XfNLoV
 ziXvA8yw8aBHTOxWs7A682mt7Gj4yfQ9uQon25C3A+jY1V7+vm4/nb2xenADV6BO+dt+d0cUW4f
 9dtVAT0kopGp5QVrJSGH1Vfad6uDoXjKbVGWkBejQ46L3e/LYqhwKaa7iHdwBFzgLfeDQ/Uz6Wi
 faStmNQdusE+DGbAzW9o4JDmAIgzifTjK2VLIWGTnlQQg66JuhtArCjeacgTY3yLUWMzl0XdYM9
 OqFCFf6S89Yia0zER3JvNpJkX1IoobKc
X-Google-Smtp-Source: AGHT+IHk6OWI+uKxulExzrr0b54dKr9wfGDsu/WknfHmJoTeylhBhg8FGlkeZDYDp4DFDksYM7EpUg==
X-Received: by 2002:a05:6a00:418e:b0:727:3b77:4174 with SMTP id
 d2e1a72fcca58-72d22032685mr17959371b3a.23.1736535224278; 
 Fri, 10 Jan 2025 10:53:44 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4056ef2bsm1836161b3a.71.2025.01.10.10.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 10:53:43 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Add new keep_resv BO param
Date: Fri, 10 Jan 2025 12:53:35 -0600
Message-Id: <20250110185335.15301-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Adds a new BO param that keeps the reservation locked after creation.
This removes the need to re-reserve the BO after creation which is a
waste of cycles.

This also fixes a bug in vmw_prime_import_sg_table where the imported
reservation is unlocked twice.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 7 ++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c     | 7 ++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 5 ++---
 6 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 5f13285f83e0b..9b5b8c1f063bb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -442,7 +442,8 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 
 	if (params->pin)
 		ttm_bo_pin(&vmw_bo->tbo);
-	ttm_bo_unreserve(&vmw_bo->tbo);
+	if (!params->keep_resv)
+		ttm_bo_unreserve(&vmw_bo->tbo);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 07749f0a5f294..11e330c7c7f52 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -56,8 +56,9 @@ struct vmw_bo_params {
 	u32 domain;
 	u32 busy_domain;
 	enum ttm_bo_type bo_type;
-	size_t size;
 	bool pin;
+	bool keep_resv;
+	size_t size;
 	struct dma_resv *resv;
 	struct sg_table *sg;
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2c46897876dde..b19a062592b08 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -403,7 +403,8 @@ static int vmw_dummy_query_bo_create(struct vmw_private *dev_priv)
 		.busy_domain = VMW_BO_DOMAIN_SYS,
 		.bo_type = ttm_bo_type_kernel,
 		.size = PAGE_SIZE,
-		.pin = true
+		.pin = true,
+		.keep_resv = true,
 	};
 
 	/*
@@ -415,10 +416,6 @@ static int vmw_dummy_query_bo_create(struct vmw_private *dev_priv)
 	if (unlikely(ret != 0))
 		return ret;
 
-	ret = ttm_bo_reserve(&vbo->tbo, false, true, NULL);
-	BUG_ON(ret != 0);
-	vmw_bo_pin_reserved(vbo, true);
-
 	ret = ttm_bo_kmap(&vbo->tbo, 0, 1, &map);
 	if (likely(ret == 0)) {
 		result = ttm_kmap_obj_virtual(&map, &dummy);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index b9857f37ca1ac..ed5015ced3920 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -206,6 +206,7 @@ struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
 		.bo_type = ttm_bo_type_sg,
 		.size = attach->dmabuf->size,
 		.pin = false,
+		.keep_resv = true,
 		.resv = attach->dmabuf->resv,
 		.sg = table,
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index a01ca3226d0af..7fb1c88bcc475 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -896,7 +896,8 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
 		.busy_domain = VMW_BO_DOMAIN_SYS,
 		.bo_type = ttm_bo_type_device,
 		.size = size,
-		.pin = true
+		.pin = true,
+		.keep_resv = true,
 	};
 
 	if (!vmw_shader_id_ok(user_key, shader_type))
@@ -906,10 +907,6 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
 	if (unlikely(ret != 0))
 		goto out;
 
-	ret = ttm_bo_reserve(&buf->tbo, false, true, NULL);
-	if (unlikely(ret != 0))
-		goto no_reserve;
-
 	/* Map and copy shader bytecode. */
 	ret = ttm_bo_kmap(&buf->tbo, 0, PFN_UP(size), &map);
 	if (unlikely(ret != 0)) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 621d98b376bbb..5553892d7c3e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -572,15 +572,14 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
 		.busy_domain = domain,
 		.bo_type = ttm_bo_type_kernel,
 		.size = bo_size,
-		.pin = true
+		.pin = true,
+		.keep_resv = true,
 	};
 
 	ret = vmw_bo_create(dev_priv, &bo_params, &vbo);
 	if (unlikely(ret != 0))
 		return ret;
 
-	ret = ttm_bo_reserve(&vbo->tbo, false, true, NULL);
-	BUG_ON(ret != 0);
 	ret = vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, &ctx);
 	if (likely(ret == 0)) {
 		struct vmw_ttm_tt *vmw_tt =
-- 
2.34.1

