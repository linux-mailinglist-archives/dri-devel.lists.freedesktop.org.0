Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A7B1DC41
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395B10E8A2;
	Thu,  7 Aug 2025 17:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="QkzpDTBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1110E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso17482405ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586223; x=1755191023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVXRCsVzbfu06qdJtGyvjBgsZI7BsBP5cj5zz9Jcysc=;
 b=QkzpDTBllOIDZJPSBpFGnYRXhlyihCNmCGuEZFocYJCH6nXCUUdl5hAoDnNjlZPZ2Z
 WQuTn4ICZcd4i1MwfWB8RKbWlcO+K5a/i3gMZz+IMsih3zS+3fNd/Qa6q5CcAKvP17nI
 K2tDzwZoz8gdLZ2qeT+4ERYQlORqlHXBvzqME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586223; x=1755191023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVXRCsVzbfu06qdJtGyvjBgsZI7BsBP5cj5zz9Jcysc=;
 b=ExgMLIKniGYDnQD4VKaFtzlL/SqZO3MO3EYI8TP43KCUA5sBVPi8nIMAh5yOdO6YyD
 nprqs8SeUZHtiu/8fIPyoarPzimCg2r6VqrWm5pTqEpZMlY+eQMoXOSUhfgzj/TGVo9h
 Yyc+h27JXhLb3OTxJYh21q7GYONxq97+uIJ7hGaheKP50k0odeEURgbEpDTdh4xbdn0y
 1caca738yXf+1odvv8bC8DY54Bycr0QdMN8DsPagBsleSeoH+6KnEufrarH8GHnnDP4+
 WP7hjdL6PfsMG9P5IKuKZVm3ksFXCU0FeWubYRA9mcUl7bQ9DZuZuoKoop6PKjP+Mp1F
 5QKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9KvJf8t/QeclpqVzIg0Tm41mlEoYykrMH6ALVL2A8IbDpBsKNgAkSPPZejHUdd9TC8Vc1LVR0Q9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySfNV/K7NVWHcZ/IoZ4fNiwRvLLQKICQiQM3ZC4GR0U8wbGL1G
 VT5vBcnwJ1F4hzr/MlNtcDMPVkjgFiUomboAqXQ60Ls1ZzA341WgR0RgFZX4Ium0WJY=
X-Gm-Gg: ASbGnct1RKHF8ZHXgnxlFzLzFaOa2V45am284Yf7o8v0A/SEexHo5/U2+E6Svppk19x
 +5dHpJCYbEvPS7DcNDkQViPsXipfolOOfUZHiOPPIiVImN9GgXFhXu9ZgUkQYTRVByGpvxquGfH
 JRPVmkqw8KtOUzV1fUDxTRYlsXWWnCCzB1XcN8ACwVme6STLTSeaFkLTRkVZVsyLcjsMhjdRVuz
 OqQA5CsWeDREc8FNXthruLJM7z0+sU2KXYo9O38U72ajCdusVjvbSgYji1GrQVwa7jF8NtTZ4rH
 XbWJwWygPEIxsRM24hntC3ph5Lh09xI33l7Yrp0Z1zIFoIoSqIlzUARSuEzEqf+5zsJHQqVYNyS
 eelCBURXqhDcnMAcxzEfpqfzp5qh1DyG1
X-Google-Smtp-Source: AGHT+IH5zMw9FtUZNHbQt4QV3x7RKG4zHf10hWAJM8XxurTOLvK3Ori8OyaYlk0QwXLbZHyQGWCvUw==
X-Received: by 2002:a17:903:4b43:b0:235:cb94:1399 with SMTP id
 d9443c01a7336-242a0a9114amr99567465ad.6.1754586222770; 
 Thu, 07 Aug 2025 10:03:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:42 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 7/9 v2] drm/i915: Clean-up outdated struct_mutex comments
Date: Thu,  7 Aug 2025 14:02:06 -0300
Message-ID: <20250807170212.285385-8-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch updates various comments in the i915 codebase to
either remove or clarify references to struct_mutex, in order to
prevent future misunderstandings.

* i915_drv.h: Removed the statement that stolen_lock is the inner lock
  when overlaps with struct_mutex, since struct_mutex is no longer used
  in the driver.
* i915_gem.c: Removed parentheses suggesting usage of struct_mutex, which
  which is no longer used.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/i915_drv.h | 3 +--
 drivers/gpu/drm/i915/i915_gem.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6093dbaf4009..e8cb94962482 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -114,8 +114,7 @@ struct i915_gem_mm {
 	struct intel_memory_region *stolen_region;
 	/** Memory allocator for GTT stolen memory */
 	struct drm_mm stolen;
-	/** Protects the usage of the GTT stolen memory allocator. This is
-	 * always the inner lock when overlapping with struct_mutex. */
+	/** Protects the usage of the GTT stolen memory allocator */
 	struct mutex stolen_lock;
 
 	/* Protects bound_list/unbound_list and #drm_i915_gem_object.mm.link */
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 8c8d43451f35..e14a0c3db999 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -847,8 +847,7 @@ void i915_gem_runtime_suspend(struct drm_i915_private *i915)
 	/*
 	 * Only called during RPM suspend. All users of the userfault_list
 	 * must be holding an RPM wakeref to ensure that this can not
-	 * run concurrently with themselves (and use the struct_mutex for
-	 * protection between themselves).
+	 * run concurrently with themselves.
 	 */
 
 	list_for_each_entry_safe(obj, on,
-- 
2.50.1

