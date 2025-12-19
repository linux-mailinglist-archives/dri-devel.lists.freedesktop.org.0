Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552BACCE6BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 05:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0D110E08A;
	Fri, 19 Dec 2025 04:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+gPzzam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900710E08A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 04:10:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so20602995ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766117434; x=1766722234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fr/YbDdwlIQc3etyyJspQSwSOdOQEJt7uqX3Ij1vJew=;
 b=Y+gPzzam3XjfTBp2iNt8SfLPBOBTgEBEBeEsLzEChj0K1ANGn8bjV63/LzwtMZ10/V
 flts8xqWdgMg8YKXc3ap9HTrhAPUonY6XdvsXT/SByxXDKiH+5NNUc2Lnp8etOPH9N7q
 GW5Rr2SGveriNVqNyF3X84tHIASwwX6D/4S7KFSmDtZhWGYUwLmG/edZr0+sV9LOS2pY
 N2Sc21TOgc0KA+HcfYE1XmjULLHs2R9lDgbwaXO9mgr/rhYBUkN5qet0D0JjjicgR9hI
 2Dbt/hn7/X2EPuGHC9C1NpDGXo2NHKts4QSaZfLIz/jDcweJha9yeLr+vEG010E0XnqY
 HC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766117434; x=1766722234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr/YbDdwlIQc3etyyJspQSwSOdOQEJt7uqX3Ij1vJew=;
 b=fS2aOTydClbFdLEDk5KPPP6dn/hFs76XWFoiHT4oTHFDcJP5pxuY8dV1zPJO0U121P
 6Ja0p+ltKHWRpxrWV8J2bpU68p8ZZI1K2wbe+Zr0y092KBmKn1aa6fiGh0T9Zy/tA772
 S08RmgdDLnuaRUT8mR9/i6RV+hVJ5X38NHKATe1MIzoMOGSfSwaY+58UZ2yWvJ+LPQqC
 HqjI78heHWWyZrCI1ye+X7UrAwKggtJq5QvxNcWFeVCxkytUQonhXw5Rbk3jsnRThUnh
 6dlWTXRBq7nJEOoQD24hKovhurddtopPPqDVQhqrlYFff89bnJIx5pN+aAWQWtyCPhKu
 toFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdybcSzF3MzxYJGKp7P3sCF3DGZdeRawsmJn5mnNEe2d0WootKSJzSMMy5r1fnrlf5IFY6LkuoOFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCIhRCDqlouthJP1htWIDXV6VTTLF4PHv1rxJWbqRl+SHgfQas
 wUgnb1/zBDjxuejU/ra5WKZ7zaYKEkFn9XomyVm95ueTUGvWBqNq+MDIhEuh9KNd
X-Gm-Gg: AY/fxX7CeRxPxc1oRi4vclned1AZ8yUZvsKwd6PUrCj4u5s2YhGI981GDm/CZut0EJ4
 0s07C4XMczkLGAjAM/K5d0mfjhtzlZKL1MS7+sUQIH2Xd8S6I4AF62XxdSguzDP04VeyHSZJx28
 69+sddqddWcwJzsfOnT+lAKs/4ok8vXaK57qh8/b3YDddhPUNi6KyO6/sAFm+K2Lfw4tIUDlcx+
 dZUP1mo7vlIaHGkdxUB7GyHQaUOMR6EmXTTzHNl6psAf9vrjkj8XR71mIqwua5TYI5ovfYPhQdT
 +Ftw6hcbpq89It+WBh3OUDJwsbPhtFGSZfrhMTzMIVESl7Fwpk++G1BTPcoGIkLw6eadL6jiW9g
 JBPD3As7wudE9vnvlgJra7Dr4I8nP7zFx+lNnO/Igg92/fDoo1+KEow1f3mG22fbVOdfw1dg8ZO
 vy0oiJZYi8NRhCj9NYQIvshA==
X-Google-Smtp-Source: AGHT+IGcytR5AFZwoRiqrRLbkghd7BDya7AhRFGQM/UuttOxi0aYIQLT8SxhfcNH1OoA9NvVxnHMAA==
X-Received: by 2002:a17:90b:5607:b0:340:e517:4e05 with SMTP id
 98e67ed59e1d1-34e92139901mr1239377a91.12.1766110895346; 
 Thu, 18 Dec 2025 18:21:35 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e7710a5f8sm1198436a91.6.2025.12.18.18.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 18:21:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 938B243916EF; Fri, 19 Dec 2025 09:21:31 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc
 comment
Date: Fri, 19 Dec 2025 09:21:26 +0700
Message-ID: <20251219022126.19013-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=bagasdotme@gmail.com;
 s=Zp7juWIhw0R1; h=from:subject;
 bh=ycMZXsgMkHDN117/G+c/kKpupB5fysKYQ7668GnykYY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJku2yKTdpmUtu7M1HBVUWFnX/TcwmJmtsKNCu+f7Y5n6
 0xW3WLuKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwEQstjP8069e22b64OzuvMxK
 hVqGPV2eXiZMlz74b336Tdt/HvPDKkaGM2ErPjrM191y1FGFLzH7L2cuV4bv2VvTnKUytqbtPiP
 BDAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Commit 6364afd532bcab ("drm/gpusvm: refactor core API to use pages struct")
renames drm_gpusvm_range_pages_valid_unlocked() to
drm_gpusvm_pages_valid_unlocked(), but its kernel-doc comment gets
stale, hence kernel-doc complains:

WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
WARNING: ./drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead

Fix them up.

Fixes: 6364afd532bcab ("drm/gpusvm: refactor core API to use pages struct")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
This patch is split from my previous assorted kernel-doc fixes series [1].
Please route it through drm-misc-fixes tree.

[1]: https://lore.kernel.org/linux-fsdevel/20251215113903.46555-1-bagasdotme@gmail.com/

 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 73e550c8ff8c98..fcfbe8c062bf6d 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1216,9 +1216,9 @@ bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
 /**
- * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
+ * drm_gpusvm_pages_valid_unlocked() - GPU SVM range pages valid unlocked
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages
  *
  * This function determines if a GPU SVM range pages are valid. Expected be
  * called without holding gpusvm->notifier_lock.

base-commit: 6b991ad8dc3abfe5720fc2e9ee96be63ae43e362
-- 
An old man doll... just what I always wanted! - Clara

