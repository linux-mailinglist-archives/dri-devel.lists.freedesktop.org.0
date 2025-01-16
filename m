Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F5A13B67
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA75710E061;
	Thu, 16 Jan 2025 13:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SiiEz26W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BC910E061
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:56:48 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id
 af79cd13be357-7b6d0be4fb8so147830385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737035807; x=1737640607;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Afmzcj7YvLn6GXyrbKyUaoeIfkKGSsahsDNZPlhAdRk=;
 b=SiiEz26Wo12prJk1eZRDTMMpJkQgrHRm9YcxuyThUsIXBkHmMeU2JZHyKwyFW9kT82
 5QPtYEsqi6QwUYdtd7vOLPw2+yGVG39XwpP9WKWCbMumb6vnd0Eho7SzpFuFEpulfwnS
 qbKV+yiVP3xO3z/4oeENs/6zh8BaqfOumdhugSoJgPStzTDhi3q/1YWIqM+SBBJJoZ/t
 2SpdHda29dTynXvpBuEm6xXVIQCzzMYWapa6ZnOrjAy0moOVKOmzQXc0DAy2ZYbg9mpS
 yEPMa0yrLsQSMoSksYYaZDA2RgAzuMPpXXaqZ873NNoVq8T/sZkppzA9yFzKjvx4wAqg
 8x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737035807; x=1737640607;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Afmzcj7YvLn6GXyrbKyUaoeIfkKGSsahsDNZPlhAdRk=;
 b=MHkUOAlFAa7EUcUjrLUSW6aSqlxv8VgedDCwoDk8W3IXruIkjaADnxObeClvczf45W
 ynYDG/O9+00HVTspafrOWnQcYveOqOeTq+W3Hn9VuDIzOQ18IsQsugM8dGr6GpR1vFlo
 29xOTi4t8RpXwAQQ8B5GU1aQ8O99DNa4vMou87v2PWfCsTz3hEX/4Zp66pA0QFW0Y+po
 rZLaYbMEfhrz+5c8UuD+jFkl/5HmvekgI2MMOwyd67rHORZ9llC62u0CgH1HNzmkEfCa
 CIknhAmeSkFEW6T1f0oLAy5tzeiCOa1omoZb+6W9q/iK21gl/SILTzp3tdK/R19aU2Rm
 m68A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0s5qAbHecGd9CR1sdurQXriL9hNnJ1pvhBPLsY27CEBZy7yMVPy8Bh+bb3GVFmKJH/gsbOhT0pYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMreTbDiGzX3CJYrs7Avqm5Y9WPBaWp7Q/2Dpfmg9zBt2tw7Y7
 6Lblj7hWXj7RmHdcDNqWbBpnbIn1lpBMUeJ2Lj8C9H9jpNNFbnA3Z7MkuaFfyMLwRt9p13xMU8X
 K9H5F/A==
X-Google-Smtp-Source: AGHT+IF3gKnK89tbVwHbUDUwD1lEN0/kaHGYmsaSOGreDcBut40sY3iWcjgUhYRrT2wdvYDMwQDTtKijor7j
X-Received: from qkbbn9.prod.google.com ([2002:a05:620a:2ac9:b0:7b6:e6cf:180e])
 (user=bgeffon job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:40c1:b0:7b6:db05:143c
 with SMTP id af79cd13be357-7bcd9759e7fmr5322280485a.45.1737035807417; Thu, 16
 Jan 2025 05:56:47 -0800 (PST)
Date: Thu, 16 Jan 2025 08:56:36 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135636.410164-1-bgeffon@google.com>
Subject: [PATCH] drm/i915: Fix page cleanup on DMA remap failure
From: Brian Geffon <bgeffon@google.com>
To: intel-gfx@lists.freedesktop.org
Cc: chris.p.wilson@intel.com, jani.saarinen@intel.com, tomasz.mistat@intel.com,
 vidya.srinivas@intel.com, ville.syrjala@linux.intel.com, 
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Brian Geffon <bgeffon@google.com>, Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
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

When converting to folios the cleanup path of shmem_get_pages() was
missed. When a DMA remap fails and the max segment size is greater than
PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
size. The cleanup code isn't properly using the folio apis and as a
result isn't handling compound pages correctly.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
Signed-off-by: Brian Geffon <bgeffon@google.com>
Suggested-by: Tomasz Figa <tfiga@google.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index fe69f2c8527d..02ddab5bf5c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -37,8 +37,6 @@ void shmem_sg_free_table(struct sg_table *st, struct address_space *mapping,
 	struct folio *last = NULL;
 	struct page *page;
 
-	mapping_clear_unevictable(mapping);
-
 	folio_batch_init(&fbatch);
 	for_each_sgt_page(page, sgt_iter, st) {
 		struct folio *folio = page_folio(page);
@@ -180,10 +178,10 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 	return 0;
 err_sg:
 	sg_mark_end(sg);
+	mapping_clear_unevictable(mapping);
 	if (sg != st->sgl) {
 		shmem_sg_free_table(st, mapping, false, false);
 	} else {
-		mapping_clear_unevictable(mapping);
 		sg_free_table(st);
 	}
 
@@ -209,8 +207,6 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	struct address_space *mapping = obj->base.filp->f_mapping;
 	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
 	struct sg_table *st;
-	struct sgt_iter sgt_iter;
-	struct page *page;
 	int ret;
 
 	/*
@@ -239,9 +235,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		 * for PAGE_SIZE chunks instead may be helpful.
 		 */
 		if (max_segment > PAGE_SIZE) {
-			for_each_sgt_page(page, sgt_iter, st)
-				put_page(page);
-			sg_free_table(st);
+			/* Leave the mapping unevictable while we retry */
+			shmem_sg_free_table(st, mapping, false, false);
 			kfree(st);
 
 			max_segment = PAGE_SIZE;
@@ -265,6 +260,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	return 0;
 
 err_pages:
+	mapping_clear_unevictable(mapping);
 	shmem_sg_free_table(st, mapping, false, false);
 	/*
 	 * shmemfs first checks if there is enough memory to allocate the page
@@ -402,6 +398,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
 	if (i915_gem_object_needs_bit17_swizzle(obj))
 		i915_gem_object_save_bit_17_swizzle(obj, pages);
 
+	mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
 	shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
 			    obj->mm.dirty, obj->mm.madv == I915_MADV_WILLNEED);
 	kfree(pages);
-- 
2.48.0.rc2.279.g1de40edade-goog

