Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C4B24B1C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DB910E721;
	Wed, 13 Aug 2025 13:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="BaCI/lq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD9010E72A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:22 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b4704f70c4aso763597a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093082; x=1755697882;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ov+c/bZFtSWdE4f2Ei/73+xpZsgPZAaXCwBdXm2Me7E=;
 b=BaCI/lq+Oc4W/I9U46ZOUjdeDqa2M3lr41v/pTmT+HKVe2tvLA063kN+G1xkMl7pGv
 mNgdXKTkFA+rKWCHPqfD2oSd6qupNCj6wnViKMCD+rvHG2XWIHwQWgBICtD6Nt8nkO9+
 kYxu8Vm+7ZjvECDB3blcAKbubbmdanM/mD7fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093082; x=1755697882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ov+c/bZFtSWdE4f2Ei/73+xpZsgPZAaXCwBdXm2Me7E=;
 b=P64w1d2fvXKL0VqvZWzL6KAE9dzjqEfv2QTnAGSeTfD+nrbKf8JLpbJsWlKkeVKAfF
 /JxPbJOpQt9kmtHy04snjjX3THa+zHvrMCrq8WUUMss1frKH/CiONHlJVr3Mf9sIar6u
 B4hA5GRXrmmSdw3wv7g/G2dltUUAM1rH3wV50B9EbwlotRzTy+6WC49cgOwinR4rvTGL
 DLAGCBA5I6aIJ3ihXL5MiLu+1tKbq4REbpCK1g1mogbVlbh8E0Z8BTOmApj6vaIUE0T6
 cOSsGtmLzanF6QtaTWejBa+mmdyquHPV5INyIFgk6L9Eq5vV6N11TBrppx9YcLt7cwd6
 Nxvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD1IiXbAlGAPwnZIcyH+eAwz7JR3fTuYyDCZAbs2a/scv8Yoax9KsiHcq2N0l4y9hFup/cZDAKbak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWj4LUVVfHinoLSYw8ZHsTP2Ohx0q7mHkbMM0PV3CY/Wa62Lhc
 VijFGWLiURrNW4jkfydTpa6R/A+tnl+Uy/3ESh2JIwk1pk+cL1sPRmz7FzPaptNA0bU=
X-Gm-Gg: ASbGncvemwYzVk75S0LSUS+u5yu00HcSo/9KdlRtWv95W/ZKp5Z4XyWZk4E5m5gZu1z
 HKY7+UTO3LJxnzwiBeo9+TJXVSY7JRVQrWJ7PoUppeQkoOUy5Rxw6r+AqcFQ9vhXAZeahnunMse
 S46uHh0bqpqqpjW/EVDl6dZjNbk8W+sstJN4OOgkGamh/mSBmTcitK32xX04WMDDKX6ehIOlifq
 BbKhGUgKs2iB+ljA6g7xWNsv2NVanASQu42IGBK8NJ4D5WDHhhmxEoP/HtxZjzwAiAd8FrqgB/n
 e3H8sLuFcaaQkbUko37sjOCwq6wY9eo0bsSE+NDKmq6RkIEGdd6qJ307PPcVud9nRQEek3Nc8IN
 PIqan9moSLPtHYXxq+yHg8+Kyq3YzGMu0DYGO69YWWWo=
X-Google-Smtp-Source: AGHT+IFwDFjO7Bz/WQUAwpjT55KUFsuZcvdDK2TzGtQJjbJVx99PscHfxlKVNmTiHElwxpVKX4Wmfw==
X-Received: by 2002:a17:902:d4d0:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-2430ea2c77dmr44466265ad.17.1755093081899; 
 Wed, 13 Aug 2025 06:51:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:21 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 7/9 v3] drm/i915: Clean-up outdated struct_mutex comments
Date: Wed, 13 Aug 2025 10:50:31 -0300
Message-ID: <20250813135035.144762-8-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 3 +--
 drivers/gpu/drm/i915/i915_gem.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 15f66a7d496d..63fef3873a38 100644
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

