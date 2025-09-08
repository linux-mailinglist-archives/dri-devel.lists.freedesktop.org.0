Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD0B48D24
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDE410E4F0;
	Mon,  8 Sep 2025 12:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="FfzWx1WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2E510E4F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:16:04 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-323266cdf64so3608209a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333764; x=1757938564;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ov+c/bZFtSWdE4f2Ei/73+xpZsgPZAaXCwBdXm2Me7E=;
 b=FfzWx1WSMEe5AEFyI7HZ/OzFmm70QhBLDgF+2Nk9sGJtFYtE3aCw2fcXzAoq0F5V9D
 uAdwz9zUAC1v7bAm1Gl2sPcXmnxOKYzSKEEAIO9x5ei6Q/Liz87ownJ/bLCcmgO25/M1
 Fe5DxLoDxmUR+Vc5Efko7gHbwjnTgSZlLNwtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333764; x=1757938564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ov+c/bZFtSWdE4f2Ei/73+xpZsgPZAaXCwBdXm2Me7E=;
 b=MYLRHBazABrw2InEJsYce/F1ZxJpKF2x89Z/2HOFn+ErFiyIMYVhnQMiUqE2KrcNFr
 wJs6MV1wnc/FLw9kH7LS3cEUZey9OEx/PYY3Lyn7aWv0dFbvhbY3Z1/B49e4OLSLD884
 txAWrSM++1f29Pab4j0rKiaIJqeHXARW3hMVvGYbrc9RJUBEqKK3+8KMWQqXH0rInZu2
 au5rvcvKXYK39UZr+S+rPmMPNKIux4MMJYuzjS7ZQp7APyV8BaSoXkmAm3phE2dvPjfC
 jdMRCGUy3GoW8QWSdAxIqwVPhnVw/Y29TfJ4vgd8cs02M5W7fEhGyEGf+1CPMuNTsqAl
 cEBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8EXJKtPP7CtjA2xQVleMEuOpS81TkQKEZWN4nrZg1jikZbDb+sUoCUL1J+OwgKzSr2gtRjtla4s0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypnvaVF9L7WXnlIWpqVAjt8Crk+988/qCLc0bo010c39rdljf2
 xjmMzwlqFLAiHEvxavvIfO1pRAf8xw0Zo9SGV2bp91MpXlYChnMRPCWAxI3dCT4fsrA=
X-Gm-Gg: ASbGncvKCWNyYLSLrVIYyJKVowz9x/GeqKLT0Sb/Ut5drG04cAdTO+NKmHOybA6yPZW
 gVeRfXoMzFFcUkVa/NAZQ7TBe1oR9oKeUzQn456yS61GJiOgsY8Ky2ysOFXH+JHBLNZkSZoPh5L
 W/2DIDwQl3CX6GIzDwvJdrn6kVjWzQrVzw/jD32jJ7F4Vn7CyvAweziB3VEuBR5dDrhATAeOYTt
 EEpwmZ1w/nuG7VhbqcxaToWhwn0Pt8WCf8qVEApBR/j7uMbyz84VjI1tY6c0cUEfpeEoOHK3jIc
 4bLcbMgyltR93e9pVRH8z97UjVNQFInIqbvf8Nev8ooyyff4zfWzh/VTVpzjIY6WP2RGULTn/o/
 IUpuRaT409bUn4pXlqR1VWcSLF/bBmf9zWhyuEbZN9Z0=
X-Google-Smtp-Source: AGHT+IECIzR4ZfYmrcsRs/Xg5Pm8jsds7+MrH4rmMyqItGZC1N6J7iX1AH3m2roiEmXjJVRfiuHdrw==
X-Received: by 2002:a17:90b:3d43:b0:327:be5f:8014 with SMTP id
 98e67ed59e1d1-32d43f9546emr8653538a91.34.1757333763977; 
 Mon, 08 Sep 2025 05:16:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:16:03 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 7/9 v4] drm/i915: Clean-up outdated struct_mutex comments
Date: Mon,  8 Sep 2025 09:15:15 -0400
Message-ID: <20250908131518.36625-8-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

