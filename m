Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDE8A4C0F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 11:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F72B112422;
	Mon, 15 Apr 2024 09:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+W38l3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBEC112421;
 Mon, 15 Apr 2024 09:57:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3476dcd9c46so1482801f8f.0; 
 Mon, 15 Apr 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713175021; x=1713779821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g/rKQn2i9AJe69a9IKOYTlsaBB0pLUNTFKMRgaL9iMo=;
 b=M+W38l3zURK7FRouxlIwSd63zuBu4G+CQRbMaxSuKqoPY15fhKmk6Er8Em5zx3k8J7
 a7te5fjjaIEcL0n+fSHeiqKA5M5BSncKdrcC2Tnx55Mcd9V5lIHtDEeMsOX87f+RYmKx
 UQ2NIAea07F8nKFkl9IoZaxZKEI6dIjA4h1ppKbnOiCRjHTFvlZQPrulB6NeZU9TcPCQ
 cTMt5hLCMK0tAxaEilDcMUiY0wPVhdFJtkRiEEzfYBPVZiHpUbFC36e2xa3XANojybnD
 wS5QGG4uGcMPhCeFpISj3X4OrOienf1BFje0zI199RXNAHoNJ0wusj6OMqt8vaV6PJoH
 m4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713175021; x=1713779821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/rKQn2i9AJe69a9IKOYTlsaBB0pLUNTFKMRgaL9iMo=;
 b=XfjAXgUyDTUx6H51FxpIvn6WuxE0oLum9ApdTCSpjFaPlt9Srw5USQMS+q9Oi+Y4D+
 FTTT56GUPxlzj8QmkHeew0g5wawN8qsZAZp06lCcpm/DPUX66yENiSUNlX6UacbVPx6o
 dH1suxmolCuAJRWNchKprYXM0wyz+XweFqoZUK5qSHj6F2M5QVBEn0s2VPFSQbRwnVp1
 xoqkLuJA3QnlXDHL25abng9vclgFVFOEsMEg975ChInUCxS4iRc85L0uNnhSFOzNjCZU
 IyUQI++YvoFnJH5NXB3qI+EJ4C53YCcvzeHWHw8GErqv/9eboQ1ePlMGL+UkfUad3i58
 8Z+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5WZBztUm2PPuNgwPudslbuvpR0FZ0u237rHg50X9zpqMmsjxsPmpT0V2BgKlgonJTO7NftUcz7oGhvz6NgrpD3fNRN0PWZaOs/AUW2wooY5Aej0O26XuPcvDR/QaviSeqP9TYWBMnsE4q/5biAavC
X-Gm-Message-State: AOJu0Yy7wYJTQxK69WaLCQOgn8BiVJo8ZDhPcZTjWAD/koYldApdr7Us
 /x1R3mNdz6uuWDYsLVRn72I46SVKrvPWC8Rihj/nGLqj9HqVRM0VFWLEqsJG
X-Google-Smtp-Source: AGHT+IHGhS/R4L+sxaYFupE82/pGE1N4pIuX9FJHqwGuvGP7rG+SdGbXleJEfkjqdXjuMaDnzPQgCw==
X-Received: by 2002:a05:6000:1743:b0:343:8994:313c with SMTP id
 m3-20020a056000174300b003438994313cmr5217871wrf.5.1713175021220; 
 Mon, 15 Apr 2024 02:57:01 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b00341b451a31asm11537447wrv.36.2024.04.15.02.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 02:57:00 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915: remove redundant assignement to variable err
Date: Mon, 15 Apr 2024 10:56:59 +0100
Message-Id: <20240415095659.482989-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable err is being assigned a value 0 that is never read, the
break statement escapes a do-while loop and then the code returns
without referencing err. The assignment is redundant and can be
removed.

Cleans up clang scan build warning:
drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1075:5: warning: Value
stored to 'err' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 99a9ade73956..9ca9e9505244 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1071,10 +1071,8 @@ static int igt_fill_mappable(struct intel_memory_region *mr,
 			if (err != -ENXIO && err != -ENOMEM)
 				goto err_close;
 
-			if (size == mr->min_page_size) {
-				err = 0;
+			if (size == mr->min_page_size)
 				break;
-			}
 
 			size >>= 1;
 			continue;
-- 
2.39.2

