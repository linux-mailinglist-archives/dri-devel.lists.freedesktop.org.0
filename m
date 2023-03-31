Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E16D1C34
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F94110F182;
	Fri, 31 Mar 2023 09:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EE710F182;
 Fri, 31 Mar 2023 09:26:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CFD56266D;
 Fri, 31 Mar 2023 09:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219BBC4339B;
 Fri, 31 Mar 2023 09:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254792;
 bh=ta2pbVKeW086ExcAdggWjg7nNpPFLKl54oJMSC9ka1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j3gsDsoVQRjqVXWT3xex2OuYoYat0CyfY2hZdt9DGVD0jmEecHiZC8mlheKaXzyMK
 4J/M6Wb2D0GdWJqYSGnAGzax9sa39rCsWw6XB8PaXvmVDGfcGHNSxE5DnzyLKXI8B3
 j4KuBztziW1CycbQiFYbMPSuSKXVX4TqHNr2R/PhrLT5SK/JZgpSvXmX8FMEEyzxqd
 HgkdDrOoDsnanNom9Qu58oID52zl2K3/BNeoQWP/ogQvgktk2mKgCZHpn/0uDCR4J0
 p5SG9phpT0uqF29qnfcNMZAxun/JuUG6uwJFhgKG4XR30IOs6pK1CT/dN4wqM0FJlY
 /O25w0TrzyFdQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 07/19] drm/i915/gem/i915_gem_create: Provide the function
 names for proper kerneldoc headers
Date: Fri, 31 Mar 2023 10:25:55 +0100
Message-Id: <20230331092607.700644-8-lee@kernel.org>
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/gem/i915_gem_create.c:147: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/gem/i915_gem_create.c:218: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/gem/i915_gem_create.c:402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index e76c9703680ef..4270575f88908 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -144,7 +144,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
 }
 
 /**
- * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
+ * __i915_gem_object_create_user - Creates a new object using the same path as
+ *                                 DRM_I915_GEM_CREATE_EXT
  * @i915: i915 private
  * @size: size of the buffer, in bytes
  * @placements: possible placement regions, in priority order
@@ -215,7 +216,7 @@ i915_gem_dumb_create(struct drm_file *file,
 }
 
 /**
- * Creates a new mm object and returns a handle to it.
+ * i915_gem_create_ioctl - Creates a new mm object and returns a handle to it.
  * @dev: drm device pointer
  * @data: ioctl data blob
  * @file: drm file pointer
@@ -399,7 +400,7 @@ static const i915_user_extension_fn create_extensions[] = {
 };
 
 /**
- * Creates a new mm object and returns a handle to it.
+ * i915_gem_create_ext_ioct - Creates a new mm object and returns a handle to it.
  * @dev: drm device pointer
  * @data: ioctl data blob
  * @file: drm file pointer
-- 
2.40.0.348.gf938b09366-goog

