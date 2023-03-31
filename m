Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EF6D1C2F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8810F18C;
	Fri, 31 Mar 2023 09:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617A310F185;
 Fri, 31 Mar 2023 09:26:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4915B82DB7;
 Fri, 31 Mar 2023 09:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84951C4339B;
 Fri, 31 Mar 2023 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254814;
 bh=8AGKbu3+LbNahQA9+BV8cpQ9XSnkvlPrI5KbjVo54Ak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eOBqcE0mA4J73g2ftWRNsZm8U23TaA9r3zmLGid83WDxH83+j6lZmu6iTDkz+1Ixp
 edyH7ctvVVfYJLJWhtOWkFab3tPyj22/KkSY9B3QX6TQWBdtrko2Wh7YbFuAkBGON4
 RfAr1UYWHGhDhx7foA032phVxjc5VnLXR7JHaFp8oIJRJPL6h4aDYF2U6+RpID3P9w
 neQ+BgnjrTjI5jg/DD4POag6DK0uUpvVhLqciOVk3pywVqTr6p6BUJKj9v/iTXtB/9
 mv4TcglI+DcH7TxABC97+keY4Q4zc/AU0I7YpXbqjJa8Yc9g5QzerI+QD9LVvburH0
 4XVFCk8T3LRLQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 14/19] drm/i915/i915_gem: Provide function names to complete
 the expected kerneldoc format
Date: Fri, 31 Mar 2023 10:26:02 +0100
Message-Id: <20230331092607.700644-15-lee@kernel.org>
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
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/i915_gem.c:447: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/i915_gem.c:536: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/i915_gem.c:726: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/i915/i915_gem.c:811: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 35950fa914068..6a00d13db2893 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -444,7 +444,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Reads data from the object referenced by handle.
+ * i915_gem_pread_ioctl - Reads data from the object referenced by handle.
  * @dev: drm device pointer
  * @data: ioctl data blob
  * @file: drm file pointer
@@ -533,7 +533,7 @@ ggtt_write(struct io_mapping *mapping,
 }
 
 /**
- * This is the fast pwrite path, where we copy the data directly from the
+ * i915_gem_gtt_pwrite_fast - This is the fast pwrite path, where we copy the data directly from the
  * user into the GTT, uncached.
  * @obj: i915 GEM object
  * @args: pwrite arguments structure
@@ -723,7 +723,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 }
 
 /**
- * Writes data to the object referenced by handle.
+ * i915_gem_pwrite_ioctl - Writes data to the object referenced by handle.
  * @dev: drm device
  * @data: ioctl data blob
  * @file: drm file
@@ -808,7 +808,7 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * Called when user space has done writes to this buffer
+ * i915_gem_sw_finish_ioct - Called when user space has done writes to this buffer
  * @dev: drm device
  * @data: ioctl data blob
  * @file: drm file
-- 
2.40.0.348.gf938b09366-goog

