Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83062A1DD82
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A7910E5B9;
	Mon, 27 Jan 2025 20:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XG4Egd/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A610E193
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 20:43:35 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7be6ccb09f9so470557585a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 12:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738010614; x=1738615414;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dzV8UGvkBceXUR/vOOPGtdnW22mWggChKVN4qUYB1M4=;
 b=XG4Egd/HP6si3EJHn+fS/DbdGmrIA7u5x+vAajZqg/ic4NYr6WLFAVlOGFiyK9eiMO
 6xKNHyxOxi6HOkZftcdDKmqGGtfjdnb2LAzd0AeMfMEda6Uo3c3UXXFPg2371GcVVI7s
 HIVMnncDdSCopSAbxjGJFDLyJ3xvmscOiCMGiZYpf4rpRADv5r3ilTlOXbN4sWOrjuCZ
 UnI7T1QcYfbYMkZtn7DppZQQUy1SfwAi/OEtuIHuLfQosPRJlghKq5WFAUmOnKHTQXlN
 7x8dc5jfFvshQhcyUN4ImrSS3lLjH5C+PnkgjNQt1zb5ZukCo0p+yk90s9SWizrS1yfH
 ULIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738010614; x=1738615414;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dzV8UGvkBceXUR/vOOPGtdnW22mWggChKVN4qUYB1M4=;
 b=wE6unmDlWAdH4clD7WVcneu7ZzBY3P4OOGs8yT8hVHyBaa0lK/sq1YzzDt2kHcYv5k
 vtN9OI4/6tevATXRP3xfxtKWRirzhOTjvb5XGDR0MSxLmJ6KeZuFta97zasiSjK9s5DY
 /5Rt7lmUUigssUbT4R7Xv5MvYf9Aham8ORUokLEHYvEJRJKkhl3Ao9l26h81h6BKIlnT
 JkksMEdlYwLKxgKzEI33OE+TVdvVZAZoGX3yvvGvolV8OqyO4YQzy3WZMbOEGDQnH4lO
 Ph0T+w6Xh7shHy1vDC6b2dg4D7/97yvE6iCZ9AUx396+OfVKDPERL4eI4dqEQPHCcHSy
 19gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8wZEGzgWjqFVPlOJ+RYxARrnpEsptlPOetQFc7IGd0GzXxW4MLxLViDULug781oPxOcHwa7O2RF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg/B5wdd9f7/P3L9rvsVC//cutGrdQnDirZ8awxuWxOmW8hArr
 cIBYllKdo42aSnJ4PafSQfICZfpyLur60l8Lcn5G7CqqN6Mr0uWW3PsYEb2yugdE0pzJ+va5QLb
 ij/ODFQ==
X-Google-Smtp-Source: AGHT+IFBEQv8z7rhsVep9QiuDVivUN9tp7MT3P8OMl7BIPAdO6dy1kXGcW3kGPZSV9SxDeEqemTQqq2vMIKN
X-Received: from qkbdv21.prod.google.com
 ([2002:a05:620a:1b95:b0:7b6:eecf:b804])
 (user=bgeffon job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4048:b0:7b1:4f5c:a3a3
 with SMTP id af79cd13be357-7be63252ab6mr7274491485a.56.1738010614042; Mon, 27
 Jan 2025 12:43:34 -0800 (PST)
Date: Mon, 27 Jan 2025 15:43:32 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127204332.336665-1-bgeffon@google.com>
Subject: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
From: Brian Geffon <bgeffon@google.com>
To: intel-gfx@lists.freedesktop.org
Cc: chris.p.wilson@intel.com, jani.saarinen@intel.com, tomasz.mistat@intel.com,
 vidya.srinivas@intel.com, ville.syrjala@linux.intel.com, 
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Brian Geffon <bgeffon@google.com>, 
 stable@vger.kernel.org, Tomasz Figa <tfiga@google.com>
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

v2 -> v3:
(Ville) Just use shmem_sg_free_table() as-is in the failure path of
shmem_get_pages(). shmem_sg_free_table() will clear mapping unevictable
but it will be reset when it retries in shmem_sg_alloc_table().

v1 -> v2:
(Ville) Fixed locations where we were not clearing mapping unevictable.

Cc: stable@vger.kernel.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
Link: https://lore.kernel.org/lkml/20250116135636.410164-1-bgeffon@google.com/
Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
Signed-off-by: Brian Geffon <bgeffon@google.com>
Suggested-by: Tomasz Figa <tfiga@google.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index fe69f2c8527d..ae3343c81a64 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -209,8 +209,6 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	struct address_space *mapping = obj->base.filp->f_mapping;
 	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
 	struct sg_table *st;
-	struct sgt_iter sgt_iter;
-	struct page *page;
 	int ret;
 
 	/*
@@ -239,9 +237,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		 * for PAGE_SIZE chunks instead may be helpful.
 		 */
 		if (max_segment > PAGE_SIZE) {
-			for_each_sgt_page(page, sgt_iter, st)
-				put_page(page);
-			sg_free_table(st);
+			shmem_sg_free_table(st, mapping, false, false);
 			kfree(st);
 
 			max_segment = PAGE_SIZE;
-- 
2.48.1.262.g85cc9f2d1e-goog

