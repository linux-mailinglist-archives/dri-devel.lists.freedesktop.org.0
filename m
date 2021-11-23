Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D833C459B60
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 06:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC566E106;
	Tue, 23 Nov 2021 05:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A61F6E0EE;
 Tue, 23 Nov 2021 05:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=XcTY0WjwUY8rhTXzrXCh5eTVe9RMeOMTY8mUb3Id2RY=; b=tayXV/n6xHxzHRwDtBtjjgLIq8
 XgrZCBGxU1Ef3RwKU6GCqxJ3YioRw0BDV2elC5+IhIkvwB/BSnVomB8OchFIDjBVLPQYdv29Y5DYH
 aMeLKWUU3PisYAEY4tuKkibdLEfrhjNOaZ/qby/UFVxztf77uP5AyVqgumjFsN4Ayh03xWWJLiy6/
 j6O9ufUm6HzsF5i7TuDIjNOWtbWrMZ092tggOtI9HKPrPyejHHhXQ8EublTdN6WjSHxNEpKLa6jRh
 REnVYul1d4WAn5pbLC7C6lqXf2exKuXY+eNFz3uYp4IthTQAyk5P5vrzL0py7YM3v/yZF57iNtgNn
 qx7M73lg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpO3d-000orn-6h; Tue, 23 Nov 2021 05:09:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: placate scripts/kernel-doc
Date: Mon, 22 Nov 2021 21:09:28 -0800
Message-Id: <20211123050928.20434-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct kernel-doc warnings in i915_drm_object.c:

i915_gem_object.c:103: warning: expecting prototype for i915_gem_object_fini(). Prototype was for __i915_gem_object_fini() instead
i915_gem_object.c:110: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Mark up the object's coherency levels for a given cache_level
i915_gem_object.c:110: warning: missing initial short description on line:
 * Mark up the object's coherency levels for a given cache_level
i915_gem_object.c:457: warning: No description found for return value of 'i915_gem_object_read_from_page'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20211118.orig/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ linux-next-20211118/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -91,7 +91,7 @@ void i915_gem_object_init(struct drm_i91
 }
 
 /**
- * i915_gem_object_fini - Clean up a GEM object initialization
+ * __i915_gem_object_fini - Clean up a GEM object initialization
  * @obj: The gem object to cleanup
  *
  * This function cleans up gem object fields that are set up by
@@ -107,7 +107,8 @@ void __i915_gem_object_fini(struct drm_i
 }
 
 /**
- * Mark up the object's coherency levels for a given cache_level
+ * i915_gem_object_set_cache_coherency - Mark up the object's coherency levels
+ * for a given cache_level
  * @obj: #drm_i915_gem_object
  * @cache_level: cache level
  */
@@ -450,7 +451,7 @@ i915_gem_object_read_from_page_iomap(str
  * from can't cross a page boundary. The caller must ensure that @obj pages
  * are pinned and that @obj is synced wrt. any related writes.
  *
- * Returns 0 on success or -ENODEV if the type of @obj's backing store is
+ * Return: %0 on success or -ENODEV if the type of @obj's backing store is
  * unsupported.
  */
 int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
