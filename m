Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51B6D1C2B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552E10F193;
	Fri, 31 Mar 2023 09:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0AC10F182;
 Fri, 31 Mar 2023 09:26:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7198B82DB0;
 Fri, 31 Mar 2023 09:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E241FC433D2;
 Fri, 31 Mar 2023 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254795;
 bh=ngC/W6NnsF+/WMMI/twPoOWsX6vUYeGknc0YjZdw5Pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWGJNuqrC4qenXiXXTKsAZBAHi0NuRJ93rb+421/6cAQMW52yplSH773ZCxdG2idt
 jDBm6HevZ7/qjEPw5IwpyvVb8E3u9sCFjWELkjFC+d1Onmbll2P5Hb7druUp/3KHn9
 fpGeMEzgq5SCTUsJgxExlLwRhNXlgIzZIXOA1A3nbNXIn0oLcmcB13UIstJV6qBKBv
 wNnUfMqbYw3zk/ubSDGR6p936NQ+sq67AOV0FS9zljl2KsW62vDtpwAlhzWxu2j42S
 VWLZRpQo7wBebjtmCLS8OGmaPOcsqHtex+QwzFg1WXQzklUuNGeMLpA42avvJ5e/JG
 0SyQVkl+kQ6Wg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 08/19] drm/i915/gem/i915_gem_domain: Provide function names to
 complete proper kerneldoc
Date: Fri, 31 Mar 2023 10:25:56 +0100
Message-Id: <20230331092607.700644-9-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_domain.c:119: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/gem/i915_gem_domain.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/gem/i915_gem_domain.c:265: warning: expecting prototype for Changes the cache(). Prototype was for i915_gem_object_set_cache_level() instead
 drivers/gpu/drm/i915/gem/i915_gem_domain.c:470: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/gem/i915_gem_domain.c:514: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 497de40b8e688..d2d5a24301b25 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -116,7 +116,8 @@ void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj)
 }
 
 /**
- * Moves a single object to the WC read, and possibly write domain.
+ * i915_gem_object_set_to_wc_domain - Moves a single object to the WC read, and
+ *                                    possibly write domain.
  * @obj: object to act on
  * @write: ask for write access or read only
  *
@@ -177,7 +178,8 @@ i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write)
 }
 
 /**
- * Moves a single object to the GTT read, and possibly write domain.
+ * i915_gem_object_set_to_gtt_domain - Moves a single object to the GTT read,
+ *                                     and possibly write domain.
  * @obj: object to act on
  * @write: ask for write access or read only
  *
@@ -246,7 +248,7 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
 }
 
 /**
- * Changes the cache-level of an object across all VMA.
+ * i915_gem_object_set_cache_level - Changes the cache-level of an object across all VMA.
  * @obj: object to act on
  * @cache_level: new cache level to set for the object
  *
@@ -467,7 +469,8 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Moves a single object to the CPU read, and possibly write domain.
+ * i915_gem_object_set_to_cpu_domain - Moves a single object to the CPU read,
+ *                                     and possibly write domain.
  * @obj: object to act on
  * @write: requesting write or read-only access
  *
@@ -511,7 +514,8 @@ i915_gem_object_set_to_cpu_domain(struct drm_i915_gem_object *obj, bool write)
 }
 
 /**
- * Called when user space prepares to use an object with the CPU, either
+ * i915_gem_set_domain_ioctl - Called when user space prepares to use an
+ *                             object with the CPU, either
  * through the mmap ioctl's mapping or a GTT mapping.
  * @dev: drm device
  * @data: ioctl data blob
-- 
2.40.0.348.gf938b09366-goog

